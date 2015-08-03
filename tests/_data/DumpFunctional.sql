--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-03 14:40:32 CEST

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
-- TOC entry 183 (class 1259 OID 11544135)
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
-- TOC entry 228 (class 1259 OID 11544634)
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
-- TOC entry 227 (class 1259 OID 11544617)
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
-- TOC entry 221 (class 1259 OID 11544529)
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
-- TOC entry 244 (class 1259 OID 11544850)
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
-- TOC entry 197 (class 1259 OID 11544314)
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
-- TOC entry 200 (class 1259 OID 11544348)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11544752)
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
-- TOC entry 192 (class 1259 OID 11544257)
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
-- TOC entry 229 (class 1259 OID 11544647)
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
-- TOC entry 216 (class 1259 OID 11544474)
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
-- TOC entry 195 (class 1259 OID 11544294)
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
-- TOC entry 199 (class 1259 OID 11544342)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11544274)
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
-- TOC entry 205 (class 1259 OID 11544391)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11544831)
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
-- TOC entry 243 (class 1259 OID 11544843)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11544866)
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
-- TOC entry 209 (class 1259 OID 11544416)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11544231)
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
-- TOC entry 184 (class 1259 OID 11544144)
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
-- TOC entry 185 (class 1259 OID 11544155)
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
-- TOC entry 180 (class 1259 OID 11544109)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11544128)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11544423)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11544454)
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
-- TOC entry 224 (class 1259 OID 11544568)
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
-- TOC entry 187 (class 1259 OID 11544188)
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
-- TOC entry 189 (class 1259 OID 11544223)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11544397)
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
-- TOC entry 188 (class 1259 OID 11544208)
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
-- TOC entry 194 (class 1259 OID 11544286)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11544409)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11544713)
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
-- TOC entry 232 (class 1259 OID 11544723)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11544694)
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
-- TOC entry 233 (class 1259 OID 11544731)
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
-- TOC entry 212 (class 1259 OID 11544438)
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
-- TOC entry 204 (class 1259 OID 11544382)
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
-- TOC entry 203 (class 1259 OID 11544372)
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
-- TOC entry 223 (class 1259 OID 11544557)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11544506)
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
-- TOC entry 177 (class 1259 OID 11544080)
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
-- TOC entry 176 (class 1259 OID 11544078)
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
-- TOC entry 213 (class 1259 OID 11544448)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11544118)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11544102)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11544462)
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
-- TOC entry 207 (class 1259 OID 11544403)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11544353)
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
-- TOC entry 238 (class 1259 OID 11544772)
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
-- TOC entry 237 (class 1259 OID 11544764)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11544759)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11544516)
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
-- TOC entry 186 (class 1259 OID 11544180)
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
-- TOC entry 202 (class 1259 OID 11544359)
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
-- TOC entry 222 (class 1259 OID 11544546)
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
-- TOC entry 234 (class 1259 OID 11544741)
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
-- TOC entry 191 (class 1259 OID 11544243)
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
-- TOC entry 178 (class 1259 OID 11544089)
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
-- TOC entry 226 (class 1259 OID 11544594)
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
-- TOC entry 196 (class 1259 OID 11544305)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11544430)
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
-- TOC entry 240 (class 1259 OID 11544811)
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
-- TOC entry 239 (class 1259 OID 11544783)
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
-- TOC entry 241 (class 1259 OID 11544823)
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
-- TOC entry 218 (class 1259 OID 11544499)
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
-- TOC entry 198 (class 1259 OID 11544337)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11544584)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11544489)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11544083)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2969 (class 0 OID 11544135)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 11544634)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55bf-6140-d3aa-b95cd8a02eea	000d0000-55bf-613f-e35d-45dd325de421	\N	00090000-55bf-613f-fd7b-6588adec1791	000b0000-55bf-613f-37d9-e4e2d530c8e0	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55bf-6140-d043-40a015414dd9	000d0000-55bf-613f-c87c-0bc858a80b25	00100000-55bf-613f-a62c-d022549ea5a8	00090000-55bf-613f-89d5-696a73c9dd42	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55bf-6140-9fc6-df88c589540c	000d0000-55bf-613f-c529-21f263ae19e6	00100000-55bf-613f-0640-5b907c096cd1	00090000-55bf-613f-a74d-ce238c3059b4	\N	0003	t	\N	2015-08-03	\N	2	\N	\N	f	f
000c0000-55bf-6140-6233-06bd3397eb8d	000d0000-55bf-613f-5c37-c87ddc335525	\N	00090000-55bf-613f-6204-0c3541ec4549	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55bf-6140-0750-ac188a98bf0b	000d0000-55bf-613f-69e0-6db798ecf024	\N	00090000-55bf-613f-51c8-61bd8475dc86	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55bf-6140-dc4e-54d7b9f2d150	000d0000-55bf-613f-b938-a7bd25888b22	\N	00090000-55bf-613f-8e3f-436581f90fad	000b0000-55bf-613f-e572-02ba967f2266	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55bf-6140-74f7-4e751ba9b981	000d0000-55bf-613f-d4d0-fc37d7e85ebf	00100000-55bf-613f-f85f-1356bb2ebcaa	00090000-55bf-613f-96db-13bcacdfaf11	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55bf-6140-8d59-4e4e117aece1	000d0000-55bf-6140-6e7a-7b2bcd8df121	\N	00090000-55bf-613f-3264-40fc8eb14c4f	000b0000-55bf-613f-f539-dc5b262c506a	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55bf-6140-6349-4cc707eb4ab4	000d0000-55bf-613f-d4d0-fc37d7e85ebf	00100000-55bf-613f-e44f-f691c5dbdc98	00090000-55bf-613f-fbce-d740913aed4c	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55bf-6140-d94b-8e00c288a73d	000d0000-55bf-613f-d4d0-fc37d7e85ebf	00100000-55bf-613f-46f0-62f788457609	00090000-55bf-613f-dc08-d9962fd91547	\N	0010	t	\N	2015-08-03	\N	16	\N	\N	f	t
000c0000-55bf-6140-2696-e03e589e5d56	000d0000-55bf-613f-d4d0-fc37d7e85ebf	00100000-55bf-613f-53cd-6bbe07b37e5b	00090000-55bf-613f-8559-25566eef8dbe	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3013 (class 0 OID 11544617)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11544529)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55bf-613f-c3e6-9c4b1353215c	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55bf-613f-7599-0b37a6301d61	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55bf-613f-8a0b-58eec7d96a79	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 11544850)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11544314)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55bf-6140-4522-7afbd1c3c0a8	\N	\N	00200000-55bf-6140-b3d2-863b28994773	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55bf-6140-df9f-3ba4d920bb37	\N	\N	00200000-55bf-6140-1ea5-429090ad4f92	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55bf-6140-4ac2-96436cc31877	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55bf-6140-8f1f-ba5b6b379803	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55bf-6140-327d-00673935fb35	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2986 (class 0 OID 11544348)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11544752)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11544257)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55bf-613d-7c63-fa27fcbf13f3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55bf-613d-3f62-355076b023ac	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55bf-613d-7a3e-3bb25018463c	AL	ALB	008	Albania 	Albanija	\N
00040000-55bf-613d-4875-9872c5f2cdb8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55bf-613d-aa99-2d673ea0bbe3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55bf-613d-dc84-f338ce73cde4	AD	AND	020	Andorra 	Andora	\N
00040000-55bf-613d-c7ad-4cef7d182717	AO	AGO	024	Angola 	Angola	\N
00040000-55bf-613d-caaa-95802ecc0295	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55bf-613d-327d-d6cfae751b59	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55bf-613d-07b1-f54eb45938bf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-613d-ab4d-7dd1de9407db	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55bf-613d-e292-ad21381d7f30	AM	ARM	051	Armenia 	Armenija	\N
00040000-55bf-613d-36df-92fa03fee7c1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55bf-613d-f2fd-1bab26956639	AU	AUS	036	Australia 	Avstralija	\N
00040000-55bf-613d-795d-38efbcfcde59	AT	AUT	040	Austria 	Avstrija	\N
00040000-55bf-613d-e5ae-f0f2539e874b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55bf-613d-8b49-591cc328e5dd	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55bf-613d-57d4-6a7a8f8899d3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55bf-613d-f442-63e3f92e64f0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55bf-613d-611d-a1026fa1b1a2	BB	BRB	052	Barbados 	Barbados	\N
00040000-55bf-613d-a4cf-38c7801ac458	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55bf-613d-e309-24234baae9e2	BE	BEL	056	Belgium 	Belgija	\N
00040000-55bf-613d-9241-969662fd5d8d	BZ	BLZ	084	Belize 	Belize	\N
00040000-55bf-613d-5384-9c5005c9c304	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55bf-613d-256f-e90c1981d2b4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55bf-613d-6458-9cf5ce855366	BT	BTN	064	Bhutan 	Butan	\N
00040000-55bf-613d-fbef-bfb8a00b2d0a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55bf-613d-7881-086f4212a2a0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55bf-613d-ceaf-3f7ab0d09cda	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55bf-613d-46b4-5d3ab3a659fb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55bf-613d-dff1-32abfe24efaa	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55bf-613d-eb85-3b2aa56c3942	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55bf-613d-1e1a-66a034ad0f7b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55bf-613d-7ce4-3de592f76a3f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55bf-613d-3f0e-c50251bdaeb6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55bf-613d-8e7b-7da3262d9b68	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55bf-613d-014d-c77c84edd49f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55bf-613d-99f6-9c1e6698ba9f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55bf-613d-e676-5a8271c39d83	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55bf-613d-f5fe-a4dc3e1f4e71	CA	CAN	124	Canada 	Kanada	\N
00040000-55bf-613d-6bdf-6cd55bc8cbde	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55bf-613d-c5fd-1ae49c3c0c69	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55bf-613d-2a92-412c1260b298	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55bf-613d-8a8f-3c13d1ef3c9b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55bf-613d-3ee9-bbc5bc292993	CL	CHL	152	Chile 	Čile	\N
00040000-55bf-613d-bb65-69c5c8477995	CN	CHN	156	China 	Kitajska	\N
00040000-55bf-613d-2a0b-ef724c6e9336	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55bf-613d-2a8d-1a84be4bff57	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55bf-613d-6dfa-a9108605a740	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55bf-613d-2cfb-c479fac02213	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55bf-613d-cfc5-2ef1e1c1685e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55bf-613d-87e1-db0d940f1af4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55bf-613d-d505-baf3328d9362	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55bf-613d-6a53-ad5b20ea3c7a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55bf-613d-e1ac-fd805cc13687	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55bf-613d-fe71-3192c251f74c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55bf-613d-148c-e99abe8ce46d	CU	CUB	192	Cuba 	Kuba	\N
00040000-55bf-613d-75a1-c5d5fd92ad5c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55bf-613d-bbc4-0b8542f95ec6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55bf-613d-86c1-b5dab3203b18	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55bf-613d-ed3f-6d4b1effe71c	DK	DNK	208	Denmark 	Danska	\N
00040000-55bf-613d-1eb8-9e39ad56be3e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55bf-613d-4417-151536a26a13	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-613d-844c-7511e930293c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55bf-613d-b097-20e183806d07	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55bf-613d-6cfa-7f57f00c8a91	EG	EGY	818	Egypt 	Egipt	\N
00040000-55bf-613d-5149-2c196386eafb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55bf-613d-5283-b0803872514e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55bf-613d-647b-99b2d2b73cbe	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55bf-613d-1630-ff11e6101af9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55bf-613d-7018-ad3e2fbc02ff	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55bf-613d-92a7-a11b5f69202c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55bf-613d-b3b8-584e6577c122	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55bf-613d-2180-145269a0e407	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55bf-613d-1cbf-e83e8ce6c451	FI	FIN	246	Finland 	Finska	\N
00040000-55bf-613d-712f-201937b1926a	FR	FRA	250	France 	Francija	\N
00040000-55bf-613d-06e3-482bd37556b9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55bf-613d-1638-b9578a14629b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55bf-613d-af73-cd540d05fcbc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55bf-613d-8dbf-abba3346c6f3	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55bf-613d-c5c0-d8c30835b788	GA	GAB	266	Gabon 	Gabon	\N
00040000-55bf-613d-2925-bc2200e6ecce	GM	GMB	270	Gambia 	Gambija	\N
00040000-55bf-613d-39e7-acfdda208bee	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55bf-613d-ceee-7014ca4b3331	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55bf-613d-fb63-efc7846f974e	GH	GHA	288	Ghana 	Gana	\N
00040000-55bf-613d-7796-7065ed124e3a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55bf-613d-289f-cd08dbf73dcf	GR	GRC	300	Greece 	Grčija	\N
00040000-55bf-613d-3684-8b7beff09fb6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55bf-613d-fdd2-0a8256c577d5	GD	GRD	308	Grenada 	Grenada	\N
00040000-55bf-613d-2a32-a7ef5e5329d2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55bf-613d-7cfb-b6347ddd8155	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55bf-613d-2a91-a813dea69436	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55bf-613d-d413-6758728f7d9b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55bf-613d-ed67-663206bb496f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55bf-613d-829f-f70de8fe84de	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55bf-613d-5c47-0f89f96c0d65	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55bf-613d-8077-cefd63666933	HT	HTI	332	Haiti 	Haiti	\N
00040000-55bf-613d-ae4c-b2885a3b318d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55bf-613d-d60d-4a0b439f3e2e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55bf-613d-eefc-8a193cafe2f9	HN	HND	340	Honduras 	Honduras	\N
00040000-55bf-613d-8cbc-f028c1cfad62	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55bf-613d-66c9-332c0b2b03ff	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55bf-613d-9bbc-53e5b6215efd	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55bf-613d-7cc1-2b653e2f7467	IN	IND	356	India 	Indija	\N
00040000-55bf-613d-1097-49595eb906c3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55bf-613d-c501-a9f56a798172	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55bf-613d-4cbc-ab6e8d59f375	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55bf-613d-d6f1-9b2d35ad81fd	IE	IRL	372	Ireland 	Irska	\N
00040000-55bf-613d-282a-c64e4dc65790	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55bf-613d-6876-9658db643d40	IL	ISR	376	Israel 	Izrael	\N
00040000-55bf-613d-93a8-ebb4ffa0d654	IT	ITA	380	Italy 	Italija	\N
00040000-55bf-613d-f8dd-8875ffdeb53e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55bf-613d-2c30-9a6aa500311b	JP	JPN	392	Japan 	Japonska	\N
00040000-55bf-613d-3e89-1a3c667ca9b2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55bf-613d-9181-4dd29b26a52b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55bf-613d-5ecb-57c184c3b13e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55bf-613d-ba73-db4a918c5a53	KE	KEN	404	Kenya 	Kenija	\N
00040000-55bf-613d-092d-a0846163d3a6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55bf-613d-06d3-710d6f382a39	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55bf-613d-f4d6-e3023fa55b25	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55bf-613d-926a-67e1df145487	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55bf-613d-32f5-61ecc54073e9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55bf-613d-8835-354c4890bedb	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55bf-613d-71a2-f802031b939c	LV	LVA	428	Latvia 	Latvija	\N
00040000-55bf-613d-4d34-48d23364441d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55bf-613d-be83-19bc37db60c9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55bf-613d-5fd6-627acb99f8d6	LR	LBR	430	Liberia 	Liberija	\N
00040000-55bf-613d-85aa-f238c63a4e14	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55bf-613d-4d64-37b3909f0c3b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55bf-613d-da45-e5da6f88d533	LT	LTU	440	Lithuania 	Litva	\N
00040000-55bf-613d-3057-983d47993a2a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55bf-613d-c6b4-636b4b6ed0ab	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55bf-613d-5bbb-5fac6f2ee869	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55bf-613d-b349-1009e81968e0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55bf-613d-aa10-2e540e637a7f	MW	MWI	454	Malawi 	Malavi	\N
00040000-55bf-613d-d28b-8349b08ac656	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55bf-613d-7d9d-88de6cc62257	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55bf-613d-2056-819f27543ba5	ML	MLI	466	Mali 	Mali	\N
00040000-55bf-613d-5252-333ef40854d9	MT	MLT	470	Malta 	Malta	\N
00040000-55bf-613d-c8e8-0d13d366db15	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55bf-613d-f49d-a1e16f71cef5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55bf-613d-0c32-bb6daea0a986	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55bf-613d-df2c-c61f3862a772	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55bf-613d-674c-6db42887b7f3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55bf-613d-38d4-de6a4e29fa52	MX	MEX	484	Mexico 	Mehika	\N
00040000-55bf-613d-f1bb-17149924699a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55bf-613d-04ee-10088859d5c9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55bf-613d-35a4-80fe453f14ba	MC	MCO	492	Monaco 	Monako	\N
00040000-55bf-613d-b6a6-b7900a9418f8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55bf-613d-be21-6b1cd8401bb3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55bf-613d-d02b-6f6e0db94e24	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55bf-613d-524e-cc51e2ed3ccd	MA	MAR	504	Morocco 	Maroko	\N
00040000-55bf-613d-bac7-6db1c7aaf3c4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55bf-613d-590a-a4c3fb9519b8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55bf-613d-ed5a-9bd13a4d13fd	NA	NAM	516	Namibia 	Namibija	\N
00040000-55bf-613d-9827-5aa06ff3be56	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55bf-613d-d386-ae21ff0a3e0b	NP	NPL	524	Nepal 	Nepal	\N
00040000-55bf-613d-546f-752f7aff0277	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55bf-613d-5fa2-7c3ab614628d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55bf-613d-065a-c72f6e263858	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55bf-613d-10f0-72c221f0ff73	NE	NER	562	Niger 	Niger 	\N
00040000-55bf-613d-0306-1d4d01abbf17	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55bf-613d-2f56-a80859b2340d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55bf-613d-f538-83906c4f0731	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55bf-613d-f46c-c289aaca5c5b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55bf-613d-d327-1ec129bfb4ba	NO	NOR	578	Norway 	Norveška	\N
00040000-55bf-613d-aeee-08671076dc75	OM	OMN	512	Oman 	Oman	\N
00040000-55bf-613d-6570-44dd5328253c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55bf-613d-1f7d-e79b3e364217	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55bf-613d-e6b6-95bdf09d41e1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55bf-613d-8da2-078881517f32	PA	PAN	591	Panama 	Panama	\N
00040000-55bf-613d-e2ae-bfc64a83d4fb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55bf-613d-de0c-e2fcf2cdda88	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55bf-613d-2575-d942eaee87c6	PE	PER	604	Peru 	Peru	\N
00040000-55bf-613d-01b0-bedf2921b185	PH	PHL	608	Philippines 	Filipini	\N
00040000-55bf-613d-5c1c-1c5a2e058963	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55bf-613d-317d-752f933efdfc	PL	POL	616	Poland 	Poljska	\N
00040000-55bf-613d-96c4-d368d92acdb9	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55bf-613d-59c7-e2a9d3d6ee82	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55bf-613d-7cea-7c096f5f310d	QA	QAT	634	Qatar 	Katar	\N
00040000-55bf-613d-7ed7-05717c4204c5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55bf-613d-fe60-9a624cf7d5cb	RO	ROU	642	Romania 	Romunija	\N
00040000-55bf-613d-8c8f-a354e26c0a1b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55bf-613d-4c44-5addfbae5f56	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55bf-613d-c5df-933405854d6b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55bf-613d-973b-5da16e287200	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55bf-613d-ba37-666923222656	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55bf-613d-ff29-b4657e09968b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55bf-613d-7421-0b0603ccffdf	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55bf-613d-5908-e0b1d3fa5bf6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55bf-613d-afa8-5c7c7b95b4c2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55bf-613d-5d24-384e2510e0e7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55bf-613d-f317-e236c07ee621	SM	SMR	674	San Marino 	San Marino	\N
00040000-55bf-613d-3462-adef58f7d703	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55bf-613d-a733-f78813552011	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55bf-613d-9531-d6d00bf3b5ea	SN	SEN	686	Senegal 	Senegal	\N
00040000-55bf-613d-6e57-6ec65e50988c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55bf-613d-7050-d63056706846	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55bf-613d-bd4e-5033de93b1ab	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55bf-613d-4ce9-3c1624c93a2d	SG	SGP	702	Singapore 	Singapur	\N
00040000-55bf-613d-c409-5e30fe09e498	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55bf-613d-e61e-e84840e24911	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55bf-613d-f263-d8787e849432	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55bf-613d-c627-7cfd4422cb44	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55bf-613d-bb32-934133b9f3f0	SO	SOM	706	Somalia 	Somalija	\N
00040000-55bf-613d-ac09-a20ac598f145	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55bf-613d-b993-35542714891a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55bf-613d-3d41-f3e427e9e72d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55bf-613d-eada-b5701e792b98	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55bf-613d-6d78-6b7a70444a56	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55bf-613d-7572-bc9be2eaec39	SD	SDN	729	Sudan 	Sudan	\N
00040000-55bf-613d-dcf7-adefa4a02c80	SR	SUR	740	Suriname 	Surinam	\N
00040000-55bf-613d-3d77-634cb0babf1e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55bf-613d-f535-4828c859b930	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55bf-613d-9902-66418e022972	SE	SWE	752	Sweden 	Švedska	\N
00040000-55bf-613d-c108-3f81672de530	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55bf-613d-899c-f3c8c79f22aa	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55bf-613d-4583-a818674ac6ac	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55bf-613d-f787-720d5bc3a624	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55bf-613d-1f06-5757df9236f5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55bf-613d-7c2a-520f5fed0e35	TH	THA	764	Thailand 	Tajska	\N
00040000-55bf-613d-64f3-56f9b4ab6b4a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55bf-613d-259d-282be092e34e	TG	TGO	768	Togo 	Togo	\N
00040000-55bf-613d-aab6-c1bf164defc4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55bf-613d-6888-c98bbb2190be	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55bf-613d-1c85-675afc97ed82	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55bf-613d-509e-577c1a202912	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55bf-613d-4af0-f3d62c3078ec	TR	TUR	792	Turkey 	Turčija	\N
00040000-55bf-613d-6d0a-cbb1f748627d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55bf-613d-b126-376af8ed21c8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-613d-c646-13a5443bc8d4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55bf-613d-e6e7-ce0008506bd1	UG	UGA	800	Uganda 	Uganda	\N
00040000-55bf-613d-8cca-7c79ebb3353e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55bf-613d-59b9-f214bc812d35	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55bf-613d-f559-b7649a5fef23	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55bf-613d-b780-86864011af36	US	USA	840	United States 	Združene države Amerike	\N
00040000-55bf-613d-bd8d-5d7d12ce82be	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55bf-613d-2d25-1489a27bc0c3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55bf-613d-6ae7-2323c826f8a8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55bf-613d-f16d-2f17aeb6090c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55bf-613d-f39b-d79e9d898d52	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55bf-613d-a72f-990f3ccd0c02	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55bf-613d-86f9-578f8c84cfbf	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-613d-89f5-ffbf8bb254c8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55bf-613d-2419-b6790bfd90f9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55bf-613d-0f99-7cea6c302fa7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55bf-613d-7ab8-9d2d90c258c7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55bf-613d-deb8-76a24d9016ad	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55bf-613d-ad98-2fe6a3f581af	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3015 (class 0 OID 11544647)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55bf-6140-609d-4658e532fb8f	000e0000-55bf-613f-3ed8-787202c6dfb4	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55bf-613e-a6b9-e8e13b7eaabc	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55bf-6140-8002-89a47b072519	000e0000-55bf-613f-42f0-f6a8742881b7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55bf-613e-a742-478b1049ec83	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-6140-f64b-266f38b61d57	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-6140-e8a7-5d1c0fca5ac5	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3002 (class 0 OID 11544474)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55bf-613f-d4d0-fc37d7e85ebf	000e0000-55bf-613f-42f0-f6a8742881b7	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55bf-613e-ac5a-419ccf6a3fd3
000d0000-55bf-613f-e35d-45dd325de421	000e0000-55bf-613f-42f0-f6a8742881b7	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-613e-ac5a-419ccf6a3fd3
000d0000-55bf-613f-c87c-0bc858a80b25	000e0000-55bf-613f-42f0-f6a8742881b7	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55bf-613e-f6c5-99a590b6b123
000d0000-55bf-613f-c529-21f263ae19e6	000e0000-55bf-613f-42f0-f6a8742881b7	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55bf-613e-c39a-9d004fe67c7f
000d0000-55bf-613f-5c37-c87ddc335525	000e0000-55bf-613f-42f0-f6a8742881b7	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55bf-613e-8a9e-7312db7e655c
000d0000-55bf-613f-69e0-6db798ecf024	000e0000-55bf-613f-42f0-f6a8742881b7	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55bf-613e-f1de-5739069df471
000d0000-55bf-613f-b938-a7bd25888b22	000e0000-55bf-613f-42f0-f6a8742881b7	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-613e-ac5a-419ccf6a3fd3
000d0000-55bf-6140-6e7a-7b2bcd8df121	000e0000-55bf-613f-42f0-f6a8742881b7	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55bf-613e-65f1-33f5f9f8ed41
\.


--
-- TOC entry 2981 (class 0 OID 11544294)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11544342)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 11544274)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55bf-613f-7201-aa3325654ab5	00080000-55bf-613f-08be-799c9609d441	00090000-55bf-613f-dc08-d9962fd91547	AK		
\.


--
-- TOC entry 2956 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11544391)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11544831)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11544843)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11544866)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11544416)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11544231)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55bf-613e-178b-cfb760a30394	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55bf-613e-1fbb-2ee8b511df6e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55bf-613e-0b77-0c870d223968	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55bf-613e-4e37-818d42fcf457	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55bf-613e-89bf-c2499578c98f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55bf-613e-53fa-58391eee7158	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55bf-613e-4caf-9e96261a7a23	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55bf-613e-e405-9a36e9c0d842	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-613e-0626-fbe52369b946	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-613e-e85d-d76dfcd4154e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55bf-613e-c443-e40ab4d7e4e6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55bf-613e-541f-5d0ab380a79c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55bf-613e-8f45-624c499945db	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55bf-613e-0282-f775039152bb	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55bf-613f-ad9e-a7df860cba26	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55bf-613f-1de5-1bf9595196d9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55bf-613f-3d4e-7115bfd7aa42	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55bf-613f-ec00-87e146e57b2d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55bf-613f-7095-e27e714ae552	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55bf-613f-9c03-76772cc9aa16	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2970 (class 0 OID 11544144)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55bf-613f-eb3f-9766868a41ab	00000000-55bf-613f-1de5-1bf9595196d9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55bf-613f-5835-d14ef2ba6dff	00000000-55bf-613f-1de5-1bf9595196d9	00010000-55bf-613e-db0f-e20aaa184e23	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55bf-613f-2f43-6c91748d3e4a	00000000-55bf-613f-3d4e-7115bfd7aa42	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2971 (class 0 OID 11544155)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55bf-613f-fd7b-6588adec1791	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55bf-613f-6204-0c3541ec4549	00010000-55bf-613f-465e-a5971ba10e6e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55bf-613f-a74d-ce238c3059b4	00010000-55bf-613f-bf24-3f0f01f9cdd2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55bf-613f-fbce-d740913aed4c	00010000-55bf-613f-8e2d-ed19ed305923	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55bf-613f-5bad-804ca182ddc7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55bf-613f-8e3f-436581f90fad	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55bf-613f-8559-25566eef8dbe	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55bf-613f-96db-13bcacdfaf11	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55bf-613f-dc08-d9962fd91547	00010000-55bf-613f-0a31-689714750c51	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55bf-613f-89d5-696a73c9dd42	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55bf-613f-bd1a-a358e1e486cd	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55bf-613f-51c8-61bd8475dc86	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55bf-613f-3264-40fc8eb14c4f	00010000-55bf-613f-63ea-4a0b6ed5b43a	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2958 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11544109)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55bf-613d-aaa4-cd32cd7ab8d2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55bf-613d-6c55-93ef635265de	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55bf-613d-6c68-a27d3fde13a6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55bf-613d-5f98-c130b58ff2d8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55bf-613e-30c4-faac79ecf8a1	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55bf-613e-c329-5e7db567d2b0	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55bf-613e-d795-0ce36d21cb14	Abonma-read	Abonma - branje	f
00030000-55bf-613e-fab0-64ba34939202	Abonma-write	Abonma - spreminjanje	f
00030000-55bf-613e-be13-37b23cbe6ac8	Alternacija-read	Alternacija - branje	f
00030000-55bf-613e-8f90-b6dd18d6e9d8	Alternacija-write	Alternacija - spreminjanje	f
00030000-55bf-613e-0d9b-dcd2e72e4789	Arhivalija-read	Arhivalija - branje	f
00030000-55bf-613e-c12c-b6c6e9e06bc1	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55bf-613e-07cc-df33527c165e	Besedilo-read	Besedilo - branje	f
00030000-55bf-613e-e4a5-532eccd72940	Besedilo-write	Besedilo - spreminjanje	f
00030000-55bf-613e-f74a-94aa0b0ffb46	DogodekIzven-read	DogodekIzven - branje	f
00030000-55bf-613e-e867-9f6bca4fe7e8	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55bf-613e-3bd8-42ba46eb12d9	Dogodek-read	Dogodek - branje	f
00030000-55bf-613e-e0ca-eb0e611c1018	Dogodek-write	Dogodek - spreminjanje	f
00030000-55bf-613e-5617-f91fa2ccb9a8	DrugiVir-read	DrugiVir - branje	f
00030000-55bf-613e-be6e-3658fdbbb74c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55bf-613e-5042-afe08c49d1ab	Drzava-read	Drzava - branje	f
00030000-55bf-613e-ebee-ac561fe149a5	Drzava-write	Drzava - spreminjanje	f
00030000-55bf-613e-8b2b-f6be793d791d	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55bf-613e-d39c-8ec20cf1af62	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55bf-613e-5832-6abad26b5960	Funkcija-read	Funkcija - branje	f
00030000-55bf-613e-1666-c25436e4cb0f	Funkcija-write	Funkcija - spreminjanje	f
00030000-55bf-613e-d6de-5fb426fa6fd8	Gostovanje-read	Gostovanje - branje	f
00030000-55bf-613e-ccef-dcd0029c933a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55bf-613e-4ec6-cc291c9b2b42	Gostujoca-read	Gostujoca - branje	f
00030000-55bf-613e-24f3-e5252ad7ff3d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55bf-613e-a0e2-19e33731e34c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55bf-613e-3fd4-050c8c43398b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55bf-613e-e418-ad1c72461aa1	Kupec-read	Kupec - branje	f
00030000-55bf-613e-fb5f-965f575f1c1e	Kupec-write	Kupec - spreminjanje	f
00030000-55bf-613e-0d52-23b1a2d5f3af	NacinPlacina-read	NacinPlacina - branje	f
00030000-55bf-613e-4dba-4c968d2cc5a4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55bf-613e-2c59-6f4c591cf0b0	Option-read	Option - branje	f
00030000-55bf-613e-9402-f6fd0df73f16	Option-write	Option - spreminjanje	f
00030000-55bf-613e-8556-76b0da36d81f	OptionValue-read	OptionValue - branje	f
00030000-55bf-613e-560c-11dd556e44da	OptionValue-write	OptionValue - spreminjanje	f
00030000-55bf-613e-199b-f1cc5ef0c2d6	Oseba-read	Oseba - branje	f
00030000-55bf-613e-9d71-1f3e775313ac	Oseba-write	Oseba - spreminjanje	f
00030000-55bf-613e-c64b-4b50222c07c1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55bf-613e-dced-66cc2666450d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55bf-613e-c3e9-1c0dcddb10c3	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55bf-613e-b605-ccc490c3cd25	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55bf-613e-e979-ae8959f7685f	Pogodba-read	Pogodba - branje	f
00030000-55bf-613e-f3c4-b801e038bf73	Pogodba-write	Pogodba - spreminjanje	f
00030000-55bf-613e-f6b9-0bd94ddad8c1	Popa-read	Popa - branje	f
00030000-55bf-613e-0182-56035a123600	Popa-write	Popa - spreminjanje	f
00030000-55bf-613e-30de-979cc28d6309	Posta-read	Posta - branje	f
00030000-55bf-613e-f6ce-2f9af5e492d1	Posta-write	Posta - spreminjanje	f
00030000-55bf-613e-6459-4da16588ae97	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55bf-613e-219f-726c1a0c5211	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55bf-613e-7129-59d56600c881	PostniNaslov-read	PostniNaslov - branje	f
00030000-55bf-613e-5c9e-7bf5698f39f4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55bf-613e-218c-2bd58e633985	Predstava-read	Predstava - branje	f
00030000-55bf-613e-b673-cb427984453a	Predstava-write	Predstava - spreminjanje	f
00030000-55bf-613e-c26b-b5885d0972b4	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55bf-613e-4e53-549e1cc708eb	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55bf-613e-28d7-2e9e24eb76e1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55bf-613e-c281-92bae04bd90e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55bf-613e-1d14-a37fb5251c9e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55bf-613e-5412-f8564322f332	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55bf-613e-cee8-e5678beebb8d	ProgramDela-read	ProgramDela - branje	f
00030000-55bf-613e-05fb-0ac63b082530	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55bf-613e-a301-d78bea8b094d	ProgramFestival-read	ProgramFestival - branje	f
00030000-55bf-613e-bbd0-289b7183f5f5	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55bf-613e-6c9b-a6d109b9816e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55bf-613e-3b33-5d783ca9089c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55bf-613e-7ad1-f76460528dc4	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55bf-613e-0b70-885f2773b058	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55bf-613e-d41b-f3fddd89f81e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55bf-613e-d483-6955d35d39e4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55bf-613e-2f88-629a5c7a1efe	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55bf-613e-83cf-2e073e639c88	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55bf-613e-65de-8fd2eaa1005d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55bf-613e-2f9e-5fb1199fe748	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55bf-613e-f2e7-68b56e49f221	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55bf-613e-0156-7eac1f9cfe7d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55bf-613e-252f-1dc9cd6a384b	ProgramRazno-read	ProgramRazno - branje	f
00030000-55bf-613e-9328-bfacf800f577	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55bf-613e-67d5-5e655dc0a907	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55bf-613e-ac24-24cce00e0ad7	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55bf-613e-de56-4c5e89872f53	Prostor-read	Prostor - branje	f
00030000-55bf-613e-04a2-9b3014382fe2	Prostor-write	Prostor - spreminjanje	f
00030000-55bf-613e-d8d3-3d44ab145e38	Racun-read	Racun - branje	f
00030000-55bf-613e-cbad-262c8922d113	Racun-write	Racun - spreminjanje	f
00030000-55bf-613e-5301-688674245201	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55bf-613e-3df6-c4e8066b1559	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55bf-613e-736e-830c5cadf89a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55bf-613e-3ed1-8ebe50e8bbcf	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55bf-613e-4aa4-3de7f7317490	Rekvizit-read	Rekvizit - branje	f
00030000-55bf-613e-30df-80af33f35e24	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55bf-613e-ee52-b9a41eddc9c7	Revizija-read	Revizija - branje	f
00030000-55bf-613e-c28a-395908640305	Revizija-write	Revizija - spreminjanje	f
00030000-55bf-613e-90c6-42fe0d320483	Rezervacija-read	Rezervacija - branje	f
00030000-55bf-613e-6d14-ba9fa5e5fc30	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55bf-613e-4328-89d1b031e363	SedezniRed-read	SedezniRed - branje	f
00030000-55bf-613e-f0c5-93fdae3619f2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55bf-613e-02c1-0c8ac0e9b8b6	Sedez-read	Sedez - branje	f
00030000-55bf-613e-7e24-4072f991c237	Sedez-write	Sedez - spreminjanje	f
00030000-55bf-613e-7dde-785d46cf6594	Sezona-read	Sezona - branje	f
00030000-55bf-613e-4e2e-8ca8b68f2e7e	Sezona-write	Sezona - spreminjanje	f
00030000-55bf-613e-aa99-c6185d13309b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55bf-613e-29ec-7e87a1e40b5e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55bf-613e-05fc-8a9918bd9796	Stevilcenje-read	Stevilcenje - branje	f
00030000-55bf-613e-22e6-cda81d4b1de3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55bf-613e-640a-3c045cf663e4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55bf-613e-8f11-3b4f15b8c694	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55bf-613e-2e2e-d062b2de5df5	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55bf-613e-dc31-17e9e67b2d7b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55bf-613e-ff23-c05fad544d31	Telefonska-read	Telefonska - branje	f
00030000-55bf-613e-1efd-182bee61b2cf	Telefonska-write	Telefonska - spreminjanje	f
00030000-55bf-613e-4180-83e3fd161537	TerminStoritve-read	TerminStoritve - branje	f
00030000-55bf-613e-82ec-2eecb0c388d8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55bf-613e-55b9-a61dc376e68c	TipFunkcije-read	TipFunkcije - branje	f
00030000-55bf-613e-0f3e-902436f4391a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55bf-613e-247c-3fd304afe23a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55bf-613e-12d4-dc7efd505f08	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55bf-613e-dffa-cfe01da50511	Trr-read	Trr - branje	f
00030000-55bf-613e-5e23-385cef3fd1ed	Trr-write	Trr - spreminjanje	f
00030000-55bf-613e-e926-358f1bed9adf	Uprizoritev-read	Uprizoritev - branje	f
00030000-55bf-613e-9f57-ec4f2d16b40a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55bf-613e-d6f8-ebcbc8b02506	Vaja-read	Vaja - branje	f
00030000-55bf-613e-71ec-56e02fdff157	Vaja-write	Vaja - spreminjanje	f
00030000-55bf-613e-91cd-526179e12197	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55bf-613e-808d-a99cef2b3bc0	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55bf-613e-185c-6372e05ac2e2	Zaposlitev-read	Zaposlitev - branje	f
00030000-55bf-613e-250d-86dc99f7587a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55bf-613e-10bd-65387bc62e02	Zasedenost-read	Zasedenost - branje	f
00030000-55bf-613e-c570-6561bfc1d7f5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55bf-613e-9ee1-2886c4c190c0	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55bf-613e-e7b4-6482787b6a96	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55bf-613e-a177-a6370687d26c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55bf-613e-98ba-a1bb59b515b3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55bf-613e-48a7-9d6c72da3668	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55bf-613e-5d34-cb29e6742b0d	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55bf-613e-05d6-931394099fcf	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55bf-613e-d729-051b25eef762	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55bf-613e-89ac-7a0fb05759c7	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-613e-bf7b-15169c2122dd	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-613e-a2ad-8140c99b0d2d	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-613e-ae5c-7150b84d90c9	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-613e-71f9-5b1d57a24e49	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55bf-613e-807a-04a013a198ae	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55bf-613e-d0af-379fde0249f5	Datoteka-write	Datoteka - spreminjanje	f
00030000-55bf-613e-5e19-3f743791a7b1	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2968 (class 0 OID 11544128)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55bf-613e-80b6-e256bec16d7c	00030000-55bf-613d-6c55-93ef635265de
00020000-55bf-613e-d102-edf8f1b7f255	00030000-55bf-613e-5042-afe08c49d1ab
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-d795-0ce36d21cb14
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-fab0-64ba34939202
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-be13-37b23cbe6ac8
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-8f90-b6dd18d6e9d8
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-0d9b-dcd2e72e4789
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-3bd8-42ba46eb12d9
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613d-5f98-c130b58ff2d8
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-e0ca-eb0e611c1018
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-5042-afe08c49d1ab
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-ebee-ac561fe149a5
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-5832-6abad26b5960
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-1666-c25436e4cb0f
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-d6de-5fb426fa6fd8
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-ccef-dcd0029c933a
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-4ec6-cc291c9b2b42
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-24f3-e5252ad7ff3d
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-a0e2-19e33731e34c
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-3fd4-050c8c43398b
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-2c59-6f4c591cf0b0
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-8556-76b0da36d81f
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-199b-f1cc5ef0c2d6
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-9d71-1f3e775313ac
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-f6b9-0bd94ddad8c1
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-0182-56035a123600
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-30de-979cc28d6309
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-f6ce-2f9af5e492d1
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-7129-59d56600c881
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-5c9e-7bf5698f39f4
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-218c-2bd58e633985
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-b673-cb427984453a
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-1d14-a37fb5251c9e
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-5412-f8564322f332
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-de56-4c5e89872f53
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-04a2-9b3014382fe2
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-736e-830c5cadf89a
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-3ed1-8ebe50e8bbcf
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-4aa4-3de7f7317490
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-30df-80af33f35e24
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-7dde-785d46cf6594
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-4e2e-8ca8b68f2e7e
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-55b9-a61dc376e68c
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-e926-358f1bed9adf
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-9f57-ec4f2d16b40a
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-d6f8-ebcbc8b02506
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-71ec-56e02fdff157
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-10bd-65387bc62e02
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-c570-6561bfc1d7f5
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-9ee1-2886c4c190c0
00020000-55bf-613e-b77a-a9b7dd6d4f31	00030000-55bf-613e-a177-a6370687d26c
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-d795-0ce36d21cb14
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-0d9b-dcd2e72e4789
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-3bd8-42ba46eb12d9
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-5042-afe08c49d1ab
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-d6de-5fb426fa6fd8
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-4ec6-cc291c9b2b42
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-a0e2-19e33731e34c
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-3fd4-050c8c43398b
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-2c59-6f4c591cf0b0
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-8556-76b0da36d81f
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-199b-f1cc5ef0c2d6
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-9d71-1f3e775313ac
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-f6b9-0bd94ddad8c1
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-30de-979cc28d6309
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-7129-59d56600c881
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-5c9e-7bf5698f39f4
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-218c-2bd58e633985
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-de56-4c5e89872f53
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-736e-830c5cadf89a
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-4aa4-3de7f7317490
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-7dde-785d46cf6594
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-ff23-c05fad544d31
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-1efd-182bee61b2cf
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-dffa-cfe01da50511
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-5e23-385cef3fd1ed
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-185c-6372e05ac2e2
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-250d-86dc99f7587a
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-9ee1-2886c4c190c0
00020000-55bf-613e-052c-84d5c97482b5	00030000-55bf-613e-a177-a6370687d26c
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-d795-0ce36d21cb14
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-be13-37b23cbe6ac8
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-0d9b-dcd2e72e4789
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-c12c-b6c6e9e06bc1
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-07cc-df33527c165e
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-f74a-94aa0b0ffb46
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-3bd8-42ba46eb12d9
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-5042-afe08c49d1ab
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-5832-6abad26b5960
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-d6de-5fb426fa6fd8
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-4ec6-cc291c9b2b42
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-a0e2-19e33731e34c
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-2c59-6f4c591cf0b0
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-8556-76b0da36d81f
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-199b-f1cc5ef0c2d6
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-f6b9-0bd94ddad8c1
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-30de-979cc28d6309
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-218c-2bd58e633985
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-1d14-a37fb5251c9e
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-de56-4c5e89872f53
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-736e-830c5cadf89a
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-4aa4-3de7f7317490
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-7dde-785d46cf6594
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-55b9-a61dc376e68c
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-d6f8-ebcbc8b02506
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-10bd-65387bc62e02
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-9ee1-2886c4c190c0
00020000-55bf-613e-c416-328d5ee9b79b	00030000-55bf-613e-a177-a6370687d26c
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-d795-0ce36d21cb14
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-fab0-64ba34939202
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-8f90-b6dd18d6e9d8
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-0d9b-dcd2e72e4789
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-3bd8-42ba46eb12d9
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-5042-afe08c49d1ab
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-d6de-5fb426fa6fd8
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-4ec6-cc291c9b2b42
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-2c59-6f4c591cf0b0
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-8556-76b0da36d81f
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-f6b9-0bd94ddad8c1
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-30de-979cc28d6309
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-218c-2bd58e633985
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-de56-4c5e89872f53
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-736e-830c5cadf89a
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-4aa4-3de7f7317490
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-7dde-785d46cf6594
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-55b9-a61dc376e68c
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-9ee1-2886c4c190c0
00020000-55bf-613e-ecce-88f3cd7c7b87	00030000-55bf-613e-a177-a6370687d26c
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-d795-0ce36d21cb14
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-0d9b-dcd2e72e4789
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-3bd8-42ba46eb12d9
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-5042-afe08c49d1ab
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-d6de-5fb426fa6fd8
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-4ec6-cc291c9b2b42
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-2c59-6f4c591cf0b0
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-8556-76b0da36d81f
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-f6b9-0bd94ddad8c1
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-30de-979cc28d6309
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-218c-2bd58e633985
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-de56-4c5e89872f53
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-736e-830c5cadf89a
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-4aa4-3de7f7317490
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-7dde-785d46cf6594
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-4180-83e3fd161537
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613d-6c68-a27d3fde13a6
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-55b9-a61dc376e68c
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-9ee1-2886c4c190c0
00020000-55bf-613e-2aa4-770e13f3589e	00030000-55bf-613e-a177-a6370687d26c
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613d-aaa4-cd32cd7ab8d2
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613d-6c55-93ef635265de
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613d-6c68-a27d3fde13a6
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613d-5f98-c130b58ff2d8
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-30c4-faac79ecf8a1
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-c329-5e7db567d2b0
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-d795-0ce36d21cb14
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-fab0-64ba34939202
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-be13-37b23cbe6ac8
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-8f90-b6dd18d6e9d8
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-0d9b-dcd2e72e4789
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-c12c-b6c6e9e06bc1
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-07cc-df33527c165e
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-e4a5-532eccd72940
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-f74a-94aa0b0ffb46
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-e867-9f6bca4fe7e8
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-3bd8-42ba46eb12d9
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-e0ca-eb0e611c1018
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-5042-afe08c49d1ab
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-ebee-ac561fe149a5
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-5617-f91fa2ccb9a8
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-be6e-3658fdbbb74c
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-8b2b-f6be793d791d
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-d39c-8ec20cf1af62
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-5832-6abad26b5960
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-1666-c25436e4cb0f
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-d6de-5fb426fa6fd8
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-ccef-dcd0029c933a
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-4ec6-cc291c9b2b42
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-24f3-e5252ad7ff3d
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-a0e2-19e33731e34c
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-3fd4-050c8c43398b
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-e418-ad1c72461aa1
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-fb5f-965f575f1c1e
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-0d52-23b1a2d5f3af
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-4dba-4c968d2cc5a4
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-2c59-6f4c591cf0b0
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-9402-f6fd0df73f16
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-8556-76b0da36d81f
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-560c-11dd556e44da
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-199b-f1cc5ef0c2d6
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-9d71-1f3e775313ac
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-c64b-4b50222c07c1
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-dced-66cc2666450d
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-c3e9-1c0dcddb10c3
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-b605-ccc490c3cd25
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-e979-ae8959f7685f
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-f3c4-b801e038bf73
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-f6b9-0bd94ddad8c1
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-0182-56035a123600
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-30de-979cc28d6309
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-f6ce-2f9af5e492d1
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-6459-4da16588ae97
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-219f-726c1a0c5211
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-7129-59d56600c881
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-5c9e-7bf5698f39f4
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-218c-2bd58e633985
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-b673-cb427984453a
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-c26b-b5885d0972b4
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-4e53-549e1cc708eb
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-28d7-2e9e24eb76e1
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-c281-92bae04bd90e
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-1d14-a37fb5251c9e
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-5412-f8564322f332
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-cee8-e5678beebb8d
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-05fb-0ac63b082530
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-a301-d78bea8b094d
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-bbd0-289b7183f5f5
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-6c9b-a6d109b9816e
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-3b33-5d783ca9089c
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-7ad1-f76460528dc4
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-0b70-885f2773b058
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-d41b-f3fddd89f81e
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-d483-6955d35d39e4
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-2f88-629a5c7a1efe
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-83cf-2e073e639c88
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-65de-8fd2eaa1005d
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-2f9e-5fb1199fe748
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-f2e7-68b56e49f221
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-0156-7eac1f9cfe7d
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-252f-1dc9cd6a384b
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-9328-bfacf800f577
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-67d5-5e655dc0a907
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-ac24-24cce00e0ad7
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-de56-4c5e89872f53
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-04a2-9b3014382fe2
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-d8d3-3d44ab145e38
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-cbad-262c8922d113
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-5301-688674245201
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-3df6-c4e8066b1559
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-736e-830c5cadf89a
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-3ed1-8ebe50e8bbcf
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-4aa4-3de7f7317490
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-30df-80af33f35e24
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-ee52-b9a41eddc9c7
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-c28a-395908640305
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-90c6-42fe0d320483
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-6d14-ba9fa5e5fc30
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-4328-89d1b031e363
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-f0c5-93fdae3619f2
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-02c1-0c8ac0e9b8b6
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-7e24-4072f991c237
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-7dde-785d46cf6594
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-4e2e-8ca8b68f2e7e
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-aa99-c6185d13309b
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-29ec-7e87a1e40b5e
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-05fc-8a9918bd9796
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-22e6-cda81d4b1de3
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-640a-3c045cf663e4
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-8f11-3b4f15b8c694
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-2e2e-d062b2de5df5
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-dc31-17e9e67b2d7b
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-ff23-c05fad544d31
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-1efd-182bee61b2cf
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-4180-83e3fd161537
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-82ec-2eecb0c388d8
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-55b9-a61dc376e68c
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-0f3e-902436f4391a
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-247c-3fd304afe23a
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-12d4-dc7efd505f08
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-dffa-cfe01da50511
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-5e23-385cef3fd1ed
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-e926-358f1bed9adf
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-9f57-ec4f2d16b40a
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-d6f8-ebcbc8b02506
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-71ec-56e02fdff157
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-91cd-526179e12197
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-808d-a99cef2b3bc0
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-185c-6372e05ac2e2
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-250d-86dc99f7587a
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-10bd-65387bc62e02
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-c570-6561bfc1d7f5
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-9ee1-2886c4c190c0
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-e7b4-6482787b6a96
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-a177-a6370687d26c
00020000-55bf-613f-473f-2a67fcec6417	00030000-55bf-613e-98ba-a1bb59b515b3
\.


--
-- TOC entry 2996 (class 0 OID 11544423)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 11544454)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 11544568)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55bf-613f-37d9-e4e2d530c8e0	00090000-55bf-613f-fd7b-6588adec1791	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55bf-613f-e572-02ba967f2266	00090000-55bf-613f-8e3f-436581f90fad	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55bf-613f-f539-dc5b262c506a	00090000-55bf-613f-3264-40fc8eb14c4f	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2973 (class 0 OID 11544188)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55bf-613f-08be-799c9609d441	00040000-55bf-613d-f263-d8787e849432	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-613f-9ae5-7821bed1045a	00040000-55bf-613d-f263-d8787e849432	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55bf-613f-31ea-1ff5a1beaa27	00040000-55bf-613d-f263-d8787e849432	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-613f-5492-f620f6b0843a	00040000-55bf-613d-f263-d8787e849432	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-613f-1439-a1e49d0be8a7	00040000-55bf-613d-f263-d8787e849432	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-613f-0afa-b89e61069702	00040000-55bf-613d-ab4d-7dd1de9407db	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-613f-227c-ff885bbffeb2	00040000-55bf-613d-fe71-3192c251f74c	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-613f-0b2e-41cabac77dac	00040000-55bf-613d-795d-38efbcfcde59	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-613f-47b8-d5366bac10de	00040000-55bf-613d-f263-d8787e849432	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2975 (class 0 OID 11544223)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55bf-613e-8208-928239e8e626	8341	Adlešiči
00050000-55bf-613e-26f9-80d6977c5b61	5270	Ajdovščina
00050000-55bf-613e-48ec-d12b55870191	6280	Ankaran/Ancarano
00050000-55bf-613e-d5e8-fd8791124406	9253	Apače
00050000-55bf-613e-17c5-9e92918e38b4	8253	Artiče
00050000-55bf-613e-e53d-725d6179238e	4275	Begunje na Gorenjskem
00050000-55bf-613e-c224-a981332f986b	1382	Begunje pri Cerknici
00050000-55bf-613e-9704-2409ac0ee3df	9231	Beltinci
00050000-55bf-613e-096b-4902fb3931c9	2234	Benedikt
00050000-55bf-613e-491f-75c0009ff63c	2345	Bistrica ob Dravi
00050000-55bf-613e-89c9-3d886cd5a372	3256	Bistrica ob Sotli
00050000-55bf-613e-e5d0-7859b17dfac4	8259	Bizeljsko
00050000-55bf-613e-179d-dc6323f47d2a	1223	Blagovica
00050000-55bf-613e-3934-efd45f8130ca	8283	Blanca
00050000-55bf-613e-3342-1f351e821dd6	4260	Bled
00050000-55bf-613e-304c-9c473ab306e9	4273	Blejska Dobrava
00050000-55bf-613e-ac6e-225bbea8a51b	9265	Bodonci
00050000-55bf-613e-cfc7-1ba7e0ead8c5	9222	Bogojina
00050000-55bf-613e-3a68-5cb2017b793b	4263	Bohinjska Bela
00050000-55bf-613e-4fa4-0b4121d2f5c9	4264	Bohinjska Bistrica
00050000-55bf-613e-04e7-3eb0066c21d3	4265	Bohinjsko jezero
00050000-55bf-613e-3ff2-f3cca0f4651b	1353	Borovnica
00050000-55bf-613e-da57-6684b3cc4342	8294	Boštanj
00050000-55bf-613e-81b3-512526d49443	5230	Bovec
00050000-55bf-613e-7c41-6af41dc98c1a	5295	Branik
00050000-55bf-613e-9fdd-6ea96c4ca4ae	3314	Braslovče
00050000-55bf-613e-7609-43a8c85dbf1e	5223	Breginj
00050000-55bf-613e-2fe9-7dd133126261	8280	Brestanica
00050000-55bf-613e-00b0-a15f6f8afad6	2354	Bresternica
00050000-55bf-613e-7c85-4cdcda7f15da	4243	Brezje
00050000-55bf-613e-8210-0c13dd150ef8	1351	Brezovica pri Ljubljani
00050000-55bf-613e-9abe-23dc151af6b4	8250	Brežice
00050000-55bf-613e-99cd-a486baf51b26	4210	Brnik - Aerodrom
00050000-55bf-613e-4b26-02223c1bd9b7	8321	Brusnice
00050000-55bf-613e-d986-644a90c990b2	3255	Buče
00050000-55bf-613e-7c78-6bc29accf12a	8276	Bučka 
00050000-55bf-613e-6b20-13c9c9897cb8	9261	Cankova
00050000-55bf-613e-62c9-b2cb4a6126dd	3000	Celje 
00050000-55bf-613e-86af-12cd5b35ada3	3001	Celje - poštni predali
00050000-55bf-613e-386e-cf558bb98614	4207	Cerklje na Gorenjskem
00050000-55bf-613e-419e-86f52f238afa	8263	Cerklje ob Krki
00050000-55bf-613e-02a2-8d0bec4710cd	1380	Cerknica
00050000-55bf-613e-5bcd-779179e30d7d	5282	Cerkno
00050000-55bf-613e-77be-68890fca9bc9	2236	Cerkvenjak
00050000-55bf-613e-dc44-abed570ac767	2215	Ceršak
00050000-55bf-613e-11f1-15c8f7b0b2a2	2326	Cirkovce
00050000-55bf-613e-f62b-11fe65ffaa65	2282	Cirkulane
00050000-55bf-613e-6a82-42bd38bd3f7e	5273	Col
00050000-55bf-613e-34e1-30428623775c	8251	Čatež ob Savi
00050000-55bf-613e-fe07-ac28a8bc6760	1413	Čemšenik
00050000-55bf-613e-4088-7b79721adb5b	5253	Čepovan
00050000-55bf-613e-3759-2a27c9e5d4d5	9232	Črenšovci
00050000-55bf-613e-8927-0e299bb30dc0	2393	Črna na Koroškem
00050000-55bf-613e-a1b6-c64a0deb3b87	6275	Črni Kal
00050000-55bf-613e-474d-b38492821c77	5274	Črni Vrh nad Idrijo
00050000-55bf-613e-2aed-e5e579cc4887	5262	Črniče
00050000-55bf-613e-8973-fad179583f25	8340	Črnomelj
00050000-55bf-613e-4593-aec09b190a64	6271	Dekani
00050000-55bf-613e-45a0-ff5c44422c9a	5210	Deskle
00050000-55bf-613e-1d6e-bb8782f9d588	2253	Destrnik
00050000-55bf-613e-693c-7b73b1f00cd0	6215	Divača
00050000-55bf-613e-723a-a807c8257574	1233	Dob
00050000-55bf-613e-46d4-5e972426208e	3224	Dobje pri Planini
00050000-55bf-613e-a6ef-b9111bd92061	8257	Dobova
00050000-55bf-613e-d61f-7a6de631bf2c	1423	Dobovec
00050000-55bf-613e-a7f6-8eb588ec809f	5263	Dobravlje
00050000-55bf-613e-591c-cc1af26fd68a	3204	Dobrna
00050000-55bf-613e-0c8d-5a204f1de6fb	8211	Dobrnič
00050000-55bf-613e-bba3-70e9680fc6cb	1356	Dobrova
00050000-55bf-613e-22c4-355c7094caa2	9223	Dobrovnik/Dobronak 
00050000-55bf-613e-9b0d-f64180e6f27a	5212	Dobrovo v Brdih
00050000-55bf-613e-7f80-85b7a98e613f	1431	Dol pri Hrastniku
00050000-55bf-613e-65c8-32584ee2bbc5	1262	Dol pri Ljubljani
00050000-55bf-613e-875c-7566096a9e57	1273	Dole pri Litiji
00050000-55bf-613e-9b57-3f30c27a5359	1331	Dolenja vas
00050000-55bf-613e-72d6-7f26accfa361	8350	Dolenjske Toplice
00050000-55bf-613e-3337-8afa41e40d9b	1230	Domžale
00050000-55bf-613e-e831-760edaec11d4	2252	Dornava
00050000-55bf-613e-fce0-1bb6ace54bf1	5294	Dornberk
00050000-55bf-613e-6d51-731e1dcab3bf	1319	Draga
00050000-55bf-613e-cee5-7e2a54b93c96	8343	Dragatuš
00050000-55bf-613e-2d3c-f28f359fd2cc	3222	Dramlje
00050000-55bf-613e-4be8-a425e07c0e62	2370	Dravograd
00050000-55bf-613e-a602-4f69105863e3	4203	Duplje
00050000-55bf-613e-2ee1-aaccde268427	6221	Dutovlje
00050000-55bf-613e-38d9-2a39dab27e47	8361	Dvor
00050000-55bf-613e-6bd3-2799a6979e2c	2343	Fala
00050000-55bf-613e-7f80-57f218c54c1b	9208	Fokovci
00050000-55bf-613e-3f4c-1f10239fa488	2313	Fram
00050000-55bf-613e-d606-31bdfb38b265	3213	Frankolovo
00050000-55bf-613e-1667-78f5daab69c4	1274	Gabrovka
00050000-55bf-613e-5eee-d8b2b137d754	8254	Globoko
00050000-55bf-613e-bb84-e489121b6d05	5275	Godovič
00050000-55bf-613e-bb47-a22f284497ba	4204	Golnik
00050000-55bf-613e-2ec8-385a03c06610	3303	Gomilsko
00050000-55bf-613e-641e-33cfff78f31d	4224	Gorenja vas
00050000-55bf-613e-0e24-c1da16494fc1	3263	Gorica pri Slivnici
00050000-55bf-613e-38dc-ff6b33803cea	2272	Gorišnica
00050000-55bf-613e-fd5a-2c1a73287362	9250	Gornja Radgona
00050000-55bf-613e-3d5e-6a15bea4eb04	3342	Gornji Grad
00050000-55bf-613e-345a-76cabc759505	4282	Gozd Martuljek
00050000-55bf-613e-2222-58903da5e183	6272	Gračišče
00050000-55bf-613e-d26a-48172963118c	9264	Grad
00050000-55bf-613e-0f65-55e131aaa2f5	8332	Gradac
00050000-55bf-613e-965c-bbd587139fc1	1384	Grahovo
00050000-55bf-613e-5367-2b50e8eadc40	5242	Grahovo ob Bači
00050000-55bf-613e-43f9-1974197d0fc8	5251	Grgar
00050000-55bf-613e-8322-1da8b41619b8	3302	Griže
00050000-55bf-613e-2b5c-a6a94487297b	3231	Grobelno
00050000-55bf-613e-6b3b-e92f637bbf77	1290	Grosuplje
00050000-55bf-613e-bba9-342ac99a6966	2288	Hajdina
00050000-55bf-613e-67db-96e6bfd6bfe1	8362	Hinje
00050000-55bf-613e-9e4f-7c52cc64aa2a	2311	Hoče
00050000-55bf-613e-584f-93e89397174f	9205	Hodoš/Hodos
00050000-55bf-613e-8bf9-a6e55d637997	1354	Horjul
00050000-55bf-613e-fd93-e6e0005fc06a	1372	Hotedršica
00050000-55bf-613e-1dd7-eaf2f97084e6	1430	Hrastnik
00050000-55bf-613e-0e31-18e11d4af581	6225	Hruševje
00050000-55bf-613e-8b61-0a0ff0286efc	4276	Hrušica
00050000-55bf-613e-20c5-55b150c2f213	5280	Idrija
00050000-55bf-613e-f9f2-99a1a1ddfb94	1292	Ig
00050000-55bf-613e-86fe-ee9e67f08081	6250	Ilirska Bistrica
00050000-55bf-613e-8b85-23de8979bf48	6251	Ilirska Bistrica-Trnovo
00050000-55bf-613e-014c-cb7099df3bb6	1295	Ivančna Gorica
00050000-55bf-613e-e9bc-881e77c7ba14	2259	Ivanjkovci
00050000-55bf-613e-dd6b-37ed9cda0e28	1411	Izlake
00050000-55bf-613e-255d-3deb57d4ee1c	6310	Izola/Isola
00050000-55bf-613e-c973-88b0a1ff4675	2222	Jakobski Dol
00050000-55bf-613e-9315-dcc9273b4e7f	2221	Jarenina
00050000-55bf-613e-d8aa-e9ffabf05756	6254	Jelšane
00050000-55bf-613e-be8a-441ef72d9cc5	4270	Jesenice
00050000-55bf-613e-b1dc-16db70d945a8	8261	Jesenice na Dolenjskem
00050000-55bf-613e-c491-9a9a21f9f99a	3273	Jurklošter
00050000-55bf-613e-661b-6fb8ff82a09d	2223	Jurovski Dol
00050000-55bf-613e-74e9-3e027abb0d01	2256	Juršinci
00050000-55bf-613e-6b35-b64e7c8fa4e5	5214	Kal nad Kanalom
00050000-55bf-613e-883a-3c333bcd7c44	3233	Kalobje
00050000-55bf-613e-2b00-a42764cba4fa	4246	Kamna Gorica
00050000-55bf-613e-6db7-4cb4db64a336	2351	Kamnica
00050000-55bf-613e-44b7-50d9b842d9b4	1241	Kamnik
00050000-55bf-613e-4ac3-44d3a83f8739	5213	Kanal
00050000-55bf-613e-2e75-38bd5a0fea08	8258	Kapele
00050000-55bf-613e-05ce-0882e4a14b8e	2362	Kapla
00050000-55bf-613e-bce6-e02a423c6549	2325	Kidričevo
00050000-55bf-613e-61fb-2c1d4cd5d271	1412	Kisovec
00050000-55bf-613e-5621-9accaf337b86	6253	Knežak
00050000-55bf-613e-cced-2ea54c70ddc7	5222	Kobarid
00050000-55bf-613e-faa2-7f69ba6672b4	9227	Kobilje
00050000-55bf-613e-d8f6-f8fb168cd2d6	1330	Kočevje
00050000-55bf-613e-47ad-1cf32377a576	1338	Kočevska Reka
00050000-55bf-613e-d38d-717027cee22a	2276	Kog
00050000-55bf-613e-c6f2-8b0862f336a0	5211	Kojsko
00050000-55bf-613e-4303-42ce9a78e66a	6223	Komen
00050000-55bf-613e-b4a7-afb70c36fd03	1218	Komenda
00050000-55bf-613e-582c-19aaa016d7bb	6000	Koper/Capodistria 
00050000-55bf-613e-ad67-470b76cb758c	6001	Koper/Capodistria - poštni predali
00050000-55bf-613e-b995-e16d0a8ea625	8282	Koprivnica
00050000-55bf-613e-28d6-a912efb1a085	5296	Kostanjevica na Krasu
00050000-55bf-613e-dae0-105cd8034bae	8311	Kostanjevica na Krki
00050000-55bf-613e-0453-9dd3ece019b5	1336	Kostel
00050000-55bf-613e-ebea-e756b418a2e9	6256	Košana
00050000-55bf-613e-8f6a-c312d5217f16	2394	Kotlje
00050000-55bf-613e-689c-b220c536efd8	6240	Kozina
00050000-55bf-613e-18f9-8c11ccff53e4	3260	Kozje
00050000-55bf-613e-e9be-0f538298f4b4	4000	Kranj 
00050000-55bf-613e-e08e-fabcc3fef92e	4001	Kranj - poštni predali
00050000-55bf-613e-fa5d-f41f2941e144	4280	Kranjska Gora
00050000-55bf-613e-01fb-6a1aa86981b9	1281	Kresnice
00050000-55bf-613e-3861-93972f186184	4294	Križe
00050000-55bf-613e-04cf-8b3e2372820c	9206	Križevci
00050000-55bf-613e-0005-5ed348bb5ddd	9242	Križevci pri Ljutomeru
00050000-55bf-613e-e213-294816768ff8	1301	Krka
00050000-55bf-613e-c2a6-e0a799e35ab3	8296	Krmelj
00050000-55bf-613e-6542-05fbc952052b	4245	Kropa
00050000-55bf-613e-b6f1-4a575ef4a78b	8262	Krška vas
00050000-55bf-613e-7ec8-2b1c0c61ece4	8270	Krško
00050000-55bf-613e-61e0-b8e9aedba2f7	9263	Kuzma
00050000-55bf-613e-ef79-b72155dec632	2318	Laporje
00050000-55bf-613e-c734-6b407ce97962	3270	Laško
00050000-55bf-613e-1f85-5b87a9371344	1219	Laze v Tuhinju
00050000-55bf-613e-1def-d4e9fee7180c	2230	Lenart v Slovenskih goricah
00050000-55bf-613e-a4b0-f7f2cd4b5a8e	9220	Lendava/Lendva
00050000-55bf-613e-ff54-0605bd32ab25	4248	Lesce
00050000-55bf-613e-8d6e-b45e5c3bc48d	3261	Lesično
00050000-55bf-613e-a998-1d41f7ea7ed0	8273	Leskovec pri Krškem
00050000-55bf-613e-0aa6-9469c6de4783	2372	Libeliče
00050000-55bf-613e-5994-36afb93aca99	2341	Limbuš
00050000-55bf-613e-407c-d894050a6a50	1270	Litija
00050000-55bf-613e-979c-ce940cf918eb	3202	Ljubečna
00050000-55bf-613e-3a8f-5bafd38f6053	1000	Ljubljana 
00050000-55bf-613e-85fd-ca32f98b2d58	1001	Ljubljana - poštni predali
00050000-55bf-613e-118b-ded263a64758	1231	Ljubljana - Črnuče
00050000-55bf-613e-886c-09ffa9a404de	1261	Ljubljana - Dobrunje
00050000-55bf-613e-a187-aa012c8e3061	1260	Ljubljana - Polje
00050000-55bf-613e-bed5-a55e6d887ba2	1210	Ljubljana - Šentvid
00050000-55bf-613e-56f7-3d219cff9e73	1211	Ljubljana - Šmartno
00050000-55bf-613e-51a3-19e668510dbc	3333	Ljubno ob Savinji
00050000-55bf-613e-6e6c-00d46d64e67a	9240	Ljutomer
00050000-55bf-613e-1c2f-4a10b7d010fc	3215	Loče
00050000-55bf-613e-9e25-44634b763196	5231	Log pod Mangartom
00050000-55bf-613e-e006-28480c44cb11	1358	Log pri Brezovici
00050000-55bf-613e-193b-f83f339d8e03	1370	Logatec
00050000-55bf-613e-23f5-9271feb0fe99	1371	Logatec
00050000-55bf-613e-f99b-9f8ba383d87b	1434	Loka pri Zidanem Mostu
00050000-55bf-613e-f0cc-487b4af46e37	3223	Loka pri Žusmu
00050000-55bf-613e-100a-51fade336e84	6219	Lokev
00050000-55bf-613e-d228-0a50e02ae035	1318	Loški Potok
00050000-55bf-613e-4c00-3a0f000f1228	2324	Lovrenc na Dravskem polju
00050000-55bf-613e-8ca5-8cec16e089aa	2344	Lovrenc na Pohorju
00050000-55bf-613e-46bd-198f2051292d	3334	Luče
00050000-55bf-613e-9ea9-71e03ad896cd	1225	Lukovica
00050000-55bf-613e-f240-d6a003a05de5	9202	Mačkovci
00050000-55bf-613e-10c1-93f6884e835d	2322	Majšperk
00050000-55bf-613e-6210-34d0c6f598e5	2321	Makole
00050000-55bf-613e-9de4-936825d4ee30	9243	Mala Nedelja
00050000-55bf-613e-cd3d-28b77a0909bc	2229	Malečnik
00050000-55bf-613e-c451-425918195b63	6273	Marezige
00050000-55bf-613e-8751-c8123454a33c	2000	Maribor 
00050000-55bf-613e-88c8-e9dbd1353a9f	2001	Maribor - poštni predali
00050000-55bf-613e-bf0e-fb774dc17ea0	2206	Marjeta na Dravskem polju
00050000-55bf-613e-0793-c70105be579c	2281	Markovci
00050000-55bf-613e-d2f9-d6392cc29921	9221	Martjanci
00050000-55bf-613e-f4ff-cdbf24c5f4f1	6242	Materija
00050000-55bf-613e-c454-17fc56d1406c	4211	Mavčiče
00050000-55bf-613e-7e10-fad244747ecd	1215	Medvode
00050000-55bf-613e-0395-e059a69e8c28	1234	Mengeš
00050000-55bf-613e-d413-494686196e07	8330	Metlika
00050000-55bf-613e-0dfd-876e9845ef9b	2392	Mežica
00050000-55bf-613e-ed84-0f340e23e2c9	2204	Miklavž na Dravskem polju
00050000-55bf-613e-5f6b-b39092dfd442	2275	Miklavž pri Ormožu
00050000-55bf-613e-e06e-78eb80c59e99	5291	Miren
00050000-55bf-613e-09f5-ab0b250dd031	8233	Mirna
00050000-55bf-613e-e84d-88b7a8626b97	8216	Mirna Peč
00050000-55bf-613e-bef2-df834544e95b	2382	Mislinja
00050000-55bf-613e-efea-a87783df7ed3	4281	Mojstrana
00050000-55bf-613e-f23b-558d23c03cd7	8230	Mokronog
00050000-55bf-613e-05b7-d064e76e3d30	1251	Moravče
00050000-55bf-613e-a2d0-ca0b37d63d30	9226	Moravske Toplice
00050000-55bf-613e-6291-66e10f0599fa	5216	Most na Soči
00050000-55bf-613e-bc75-71a1d6ee2751	1221	Motnik
00050000-55bf-613e-b2a9-7367f8e8aa2f	3330	Mozirje
00050000-55bf-613e-3985-540693373b84	9000	Murska Sobota 
00050000-55bf-613e-0609-2792ee34e93d	9001	Murska Sobota - poštni predali
00050000-55bf-613e-3769-378a88b8632d	2366	Muta
00050000-55bf-613e-7bc6-ef4ec656e7f1	4202	Naklo
00050000-55bf-613e-215a-476b664f9d9d	3331	Nazarje
00050000-55bf-613e-fe02-d1cca81b8985	1357	Notranje Gorice
00050000-55bf-613e-ce45-6bba82abf4ef	3203	Nova Cerkev
00050000-55bf-613e-b5a6-d86ea47d2149	5000	Nova Gorica 
00050000-55bf-613e-3c1e-660cf141fcbd	5001	Nova Gorica - poštni predali
00050000-55bf-613e-c3aa-f9d3132d8bdd	1385	Nova vas
00050000-55bf-613e-513d-3be509ffe9df	8000	Novo mesto
00050000-55bf-613e-8226-d762fd2878ea	8001	Novo mesto - poštni predali
00050000-55bf-613e-0d30-9c78b55b681b	6243	Obrov
00050000-55bf-613e-a3fd-83f785e35b4d	9233	Odranci
00050000-55bf-613e-3968-52e1838fe2d0	2317	Oplotnica
00050000-55bf-613e-d5b4-4f7cf4a68829	2312	Orehova vas
00050000-55bf-613e-4caa-7ac2eb6a9830	2270	Ormož
00050000-55bf-613e-fa43-4a42370cf7de	1316	Ortnek
00050000-55bf-613e-c74f-bb2c16331ffc	1337	Osilnica
00050000-55bf-613e-6a23-05de0c75444f	8222	Otočec
00050000-55bf-613e-794f-aeae14676099	2361	Ožbalt
00050000-55bf-613e-dde9-8528152df372	2231	Pernica
00050000-55bf-613e-5dca-674cd034b03e	2211	Pesnica pri Mariboru
00050000-55bf-613e-eca9-0a695693a5bb	9203	Petrovci
00050000-55bf-613e-6dbd-d803da5c67d3	3301	Petrovče
00050000-55bf-613e-68c3-417477ca7c0e	6330	Piran/Pirano
00050000-55bf-613e-c094-8f66834d7fa3	8255	Pišece
00050000-55bf-613e-3fc1-20d8d69c9a40	6257	Pivka
00050000-55bf-613e-1e2e-d8a487edde40	6232	Planina
00050000-55bf-613e-32e7-e40ca6212867	3225	Planina pri Sevnici
00050000-55bf-613e-14a7-2dd84ab013e2	6276	Pobegi
00050000-55bf-613e-3365-13875088eac4	8312	Podbočje
00050000-55bf-613e-839c-d080280ea7aa	5243	Podbrdo
00050000-55bf-613e-00f7-cc3ed7f0bde3	3254	Podčetrtek
00050000-55bf-613e-6359-18ae78f661ad	2273	Podgorci
00050000-55bf-613e-420f-51382d78968d	6216	Podgorje
00050000-55bf-613e-ab97-10ae220c61a8	2381	Podgorje pri Slovenj Gradcu
00050000-55bf-613e-d852-02488adda4b5	6244	Podgrad
00050000-55bf-613e-2e31-d6910e41286c	1414	Podkum
00050000-55bf-613e-ae24-4fc48721fcf4	2286	Podlehnik
00050000-55bf-613e-6398-c90f5d5b89be	5272	Podnanos
00050000-55bf-613e-53f6-5d914353e641	4244	Podnart
00050000-55bf-613e-2922-6dd9bef0a9fd	3241	Podplat
00050000-55bf-613e-458e-dd79ea40a3ac	3257	Podsreda
00050000-55bf-613e-2cab-404e2629447f	2363	Podvelka
00050000-55bf-613e-2320-5753c9f2c44b	2208	Pohorje
00050000-55bf-613e-1210-83798fa24de9	2257	Polenšak
00050000-55bf-613e-6f69-ff0eebfd5347	1355	Polhov Gradec
00050000-55bf-613e-fe73-c5e17b441491	4223	Poljane nad Škofjo Loko
00050000-55bf-613e-11a2-d29d75da7117	2319	Poljčane
00050000-55bf-613e-99cd-b4d88ee345f1	1272	Polšnik
00050000-55bf-613e-1864-0578a652ee93	3313	Polzela
00050000-55bf-613e-9ebd-b05b606fc463	3232	Ponikva
00050000-55bf-613e-0c66-387619b341ab	6320	Portorož/Portorose
00050000-55bf-613e-08ec-bfa1cfb8473d	6230	Postojna
00050000-55bf-613e-ba65-d1b5cd2f44e3	2331	Pragersko
00050000-55bf-613e-0a8f-2667b70fe7d7	3312	Prebold
00050000-55bf-613e-37d9-a12f151edb01	4205	Preddvor
00050000-55bf-613e-bcfa-3b7b89ba21c2	6255	Prem
00050000-55bf-613e-20ca-e6da2887710c	1352	Preserje
00050000-55bf-613e-a26e-ef86c4f7f9bb	6258	Prestranek
00050000-55bf-613e-11e1-7ae91554637d	2391	Prevalje
00050000-55bf-613e-5181-99b317720e18	3262	Prevorje
00050000-55bf-613e-5486-e15794bc736d	1276	Primskovo 
00050000-55bf-613e-4f6f-837cefaf6faf	3253	Pristava pri Mestinju
00050000-55bf-613e-a54d-b521ce81d274	9207	Prosenjakovci/Partosfalva
00050000-55bf-613e-9999-6a794a5db858	5297	Prvačina
00050000-55bf-613e-b52c-69dfd3db603d	2250	Ptuj
00050000-55bf-613e-5f28-8bc097852727	2323	Ptujska Gora
00050000-55bf-613e-2f11-a4444237a8d8	9201	Puconci
00050000-55bf-613e-73d8-9f096f287c3d	2327	Rače
00050000-55bf-613e-b2e8-0df2976be340	1433	Radeče
00050000-55bf-613e-6871-10722add9b89	9252	Radenci
00050000-55bf-613e-8f41-15ec6a77fa49	2360	Radlje ob Dravi
00050000-55bf-613e-25f8-bc0e343f9d22	1235	Radomlje
00050000-55bf-613e-485c-817da82e656b	4240	Radovljica
00050000-55bf-613e-da01-6392cc990d2b	8274	Raka
00050000-55bf-613e-119d-10033d34f404	1381	Rakek
00050000-55bf-613e-b1bd-1e3da646799c	4283	Rateče - Planica
00050000-55bf-613e-ce06-db78d3596401	2390	Ravne na Koroškem
00050000-55bf-613e-27e0-a57cc82dee94	9246	Razkrižje
00050000-55bf-613e-84da-6cf628bd92e8	3332	Rečica ob Savinji
00050000-55bf-613e-8105-ca7d2459e300	5292	Renče
00050000-55bf-613e-ba47-00fa2ce0e014	1310	Ribnica
00050000-55bf-613e-20c1-304d66dd435a	2364	Ribnica na Pohorju
00050000-55bf-613e-2ee9-15321e1a9e66	3272	Rimske Toplice
00050000-55bf-613e-548a-46978701e1f0	1314	Rob
00050000-55bf-613e-8951-1219cd52e4eb	5215	Ročinj
00050000-55bf-613e-8d7e-9a1c2f5731f7	3250	Rogaška Slatina
00050000-55bf-613e-3abe-2fd8d6390787	9262	Rogašovci
00050000-55bf-613e-6124-4e3ca310be0b	3252	Rogatec
00050000-55bf-613e-735d-30da5d3d0c83	1373	Rovte
00050000-55bf-613e-eefe-7adb401110b1	2342	Ruše
00050000-55bf-613e-1640-cbcdf7d5ea8c	1282	Sava
00050000-55bf-613e-0cfd-21d81ff3c6f6	6333	Sečovlje/Sicciole
00050000-55bf-613e-9508-e43f88aa1876	4227	Selca
00050000-55bf-613e-d1af-e3b72d4a1954	2352	Selnica ob Dravi
00050000-55bf-613e-4a24-06a57f5e96c4	8333	Semič
00050000-55bf-613e-94e9-81cb473fa68b	8281	Senovo
00050000-55bf-613e-4b78-db7b35bcc021	6224	Senožeče
00050000-55bf-613e-43fd-5db0a5d90064	8290	Sevnica
00050000-55bf-613e-dcaa-8bd8cc2436ef	6210	Sežana
00050000-55bf-613e-e6f4-a49212a1308d	2214	Sladki Vrh
00050000-55bf-613e-4f25-4005618fca67	5283	Slap ob Idrijci
00050000-55bf-613e-5094-b7b4da0b9f65	2380	Slovenj Gradec
00050000-55bf-613e-d1da-52247093793c	2310	Slovenska Bistrica
00050000-55bf-613e-148e-a9c4f0eef589	3210	Slovenske Konjice
00050000-55bf-613e-f807-8497a898df82	1216	Smlednik
00050000-55bf-613e-76ce-b0de8962ff7d	5232	Soča
00050000-55bf-613e-dafa-2a6bf89bff87	1317	Sodražica
00050000-55bf-613e-3fe0-3ed91cca25e3	3335	Solčava
00050000-55bf-613e-8dde-77a9af9d80af	5250	Solkan
00050000-55bf-613e-f900-4333500d04b8	4229	Sorica
00050000-55bf-613e-79d3-12d0abdb32f5	4225	Sovodenj
00050000-55bf-613e-a37a-a65ecf3dfb5d	5281	Spodnja Idrija
00050000-55bf-613e-6dfe-a1870187c85b	2241	Spodnji Duplek
00050000-55bf-613e-09c8-e2b135cb40df	9245	Spodnji Ivanjci
00050000-55bf-613e-368e-44c950eb5bda	2277	Središče ob Dravi
00050000-55bf-613e-5d86-64f8c1ec5417	4267	Srednja vas v Bohinju
00050000-55bf-613e-7443-7fdb71284b42	8256	Sromlje 
00050000-55bf-613e-280b-6a47e04391e5	5224	Srpenica
00050000-55bf-613e-9cbb-9b16d0590612	1242	Stahovica
00050000-55bf-613e-c3e4-32e937c084a5	1332	Stara Cerkev
00050000-55bf-613e-e819-7a1dad9d7d8c	8342	Stari trg ob Kolpi
00050000-55bf-613e-7878-c354c0e34e23	1386	Stari trg pri Ložu
00050000-55bf-613e-8030-c71494fdf929	2205	Starše
00050000-55bf-613e-ed3e-0efabdab314f	2289	Stoperce
00050000-55bf-613e-c3fc-de9854be869e	8322	Stopiče
00050000-55bf-613e-1f5d-80f44c075824	3206	Stranice
00050000-55bf-613e-7f73-e4cf2ac90ad9	8351	Straža
00050000-55bf-613e-8fc5-891b3e7a0898	1313	Struge
00050000-55bf-613e-6f8d-c37cd80e54e9	8293	Studenec
00050000-55bf-613e-6497-e1d46c845679	8331	Suhor
00050000-55bf-613e-1dcb-cb0bd18f67c6	2233	Sv. Ana v Slovenskih goricah
00050000-55bf-613e-63ca-1e58bf8938ac	2235	Sv. Trojica v Slovenskih goricah
00050000-55bf-613e-fb2c-cb35e48c8cd4	2353	Sveti Duh na Ostrem Vrhu
00050000-55bf-613e-3dc2-faa34ca01c0f	9244	Sveti Jurij ob Ščavnici
00050000-55bf-613e-73c5-6372842b0c41	3264	Sveti Štefan
00050000-55bf-613e-ddfe-5688e14dde57	2258	Sveti Tomaž
00050000-55bf-613e-ee8f-29ece1a671a9	9204	Šalovci
00050000-55bf-613e-df01-a33b89685818	5261	Šempas
00050000-55bf-613e-7397-deb3fdd226f1	5290	Šempeter pri Gorici
00050000-55bf-613e-afc8-c307acab5e0c	3311	Šempeter v Savinjski dolini
00050000-55bf-613e-5932-c8f821824518	4208	Šenčur
00050000-55bf-613e-f102-7143212e29ae	2212	Šentilj v Slovenskih goricah
00050000-55bf-613e-49d7-44946f3ffd66	8297	Šentjanž
00050000-55bf-613e-69f2-9255def9334a	2373	Šentjanž pri Dravogradu
00050000-55bf-613e-0630-c6b3c28ff85a	8310	Šentjernej
00050000-55bf-613e-f9d1-c93975974f07	3230	Šentjur
00050000-55bf-613e-dc09-172d9d23290d	3271	Šentrupert
00050000-55bf-613e-91cf-da66e5c54ae3	8232	Šentrupert
00050000-55bf-613e-ea19-91263797bbd3	1296	Šentvid pri Stični
00050000-55bf-613e-07ad-615765f4483c	8275	Škocjan
00050000-55bf-613e-3c2b-a125adba7b67	6281	Škofije
00050000-55bf-613e-8811-11bbb7803f67	4220	Škofja Loka
00050000-55bf-613e-4751-ea12b568bdcd	3211	Škofja vas
00050000-55bf-613e-09d5-9d0c1b494739	1291	Škofljica
00050000-55bf-613e-4a7c-acdb51038082	6274	Šmarje
00050000-55bf-613e-4832-9aa1771e0e2e	1293	Šmarje - Sap
00050000-55bf-613e-0399-75dd24d53389	3240	Šmarje pri Jelšah
00050000-55bf-613e-1edc-4cf768ef8859	8220	Šmarješke Toplice
00050000-55bf-613e-1688-7b8908712eb3	2315	Šmartno na Pohorju
00050000-55bf-613e-87e5-3112f8e07587	3341	Šmartno ob Dreti
00050000-55bf-613e-425c-ed3054c6c100	3327	Šmartno ob Paki
00050000-55bf-613e-1871-3475b4cd328a	1275	Šmartno pri Litiji
00050000-55bf-613e-bd60-941b103f5761	2383	Šmartno pri Slovenj Gradcu
00050000-55bf-613e-0943-8ccaa94504c2	3201	Šmartno v Rožni dolini
00050000-55bf-613e-c852-a8357fb2806f	3325	Šoštanj
00050000-55bf-613e-7ba4-1a7cffd1d7c6	6222	Štanjel
00050000-55bf-613e-362b-4eeb0c55f456	3220	Štore
00050000-55bf-613e-50d5-2df4c2246079	3304	Tabor
00050000-55bf-613e-38b0-0470e39dffd6	3221	Teharje
00050000-55bf-613e-21d9-dd46b320d946	9251	Tišina
00050000-55bf-613e-a383-238319dcd963	5220	Tolmin
00050000-55bf-613e-ca90-e98cf48f3c9e	3326	Topolšica
00050000-55bf-613e-19c2-233ced35445e	2371	Trbonje
00050000-55bf-613e-68d7-3f97699c89ca	1420	Trbovlje
00050000-55bf-613e-3d8a-9b763980a901	8231	Trebelno 
00050000-55bf-613e-7dbf-feaa83366ca5	8210	Trebnje
00050000-55bf-613e-60bf-214261fd5357	5252	Trnovo pri Gorici
00050000-55bf-613e-fb40-16ba63595eee	2254	Trnovska vas
00050000-55bf-613e-5f62-f101ccb42dc0	1222	Trojane
00050000-55bf-613e-67de-827223e04596	1236	Trzin
00050000-55bf-613e-9da2-1980f4922ae5	4290	Tržič
00050000-55bf-613e-1b6b-5ad0210f9d23	8295	Tržišče
00050000-55bf-613e-a2c1-d88897fc62a4	1311	Turjak
00050000-55bf-613e-3a73-8c0eefc469ee	9224	Turnišče
00050000-55bf-613e-35bd-8c6081b89bca	8323	Uršna sela
00050000-55bf-613e-8634-f72d6ed9cf0c	1252	Vače
00050000-55bf-613e-bdb6-a6d2a4efaeed	3320	Velenje 
00050000-55bf-613e-424b-81eacb9df2e3	3322	Velenje - poštni predali
00050000-55bf-613e-2a2c-0e415411cf86	8212	Velika Loka
00050000-55bf-613e-919d-a930263a8e40	2274	Velika Nedelja
00050000-55bf-613e-7e83-e7d1ae35b2bd	9225	Velika Polana
00050000-55bf-613e-f05b-7eced1ab854b	1315	Velike Lašče
00050000-55bf-613e-6c0f-bdadd8dbfcad	8213	Veliki Gaber
00050000-55bf-613e-ac23-983594ee97ce	9241	Veržej
00050000-55bf-613e-22dd-22ef0c3f8541	1312	Videm - Dobrepolje
00050000-55bf-613e-a7a4-9b0f54b5bd88	2284	Videm pri Ptuju
00050000-55bf-613e-7dec-5a2ca1067a91	8344	Vinica
00050000-55bf-613e-0233-7c09986b86b4	5271	Vipava
00050000-55bf-613e-4498-09fed9e4a8f1	4212	Visoko
00050000-55bf-613e-0de1-4376cc947cff	1294	Višnja Gora
00050000-55bf-613e-9b39-a5fa559e0359	3205	Vitanje
00050000-55bf-613e-5c37-cf55291e850d	2255	Vitomarci
00050000-55bf-613e-64db-89265572eaed	1217	Vodice
00050000-55bf-613e-2745-13041f7fecb1	3212	Vojnik\t
00050000-55bf-613e-d4a2-10e97316ea3b	5293	Volčja Draga
00050000-55bf-613e-bc80-ed94e21a447f	2232	Voličina
00050000-55bf-613e-44d3-d2da502879ed	3305	Vransko
00050000-55bf-613e-a26e-bd9f7a28f40c	6217	Vremski Britof
00050000-55bf-613e-64b7-65000bef3073	1360	Vrhnika
00050000-55bf-613e-79e0-c7b8bd1b42af	2365	Vuhred
00050000-55bf-613e-80a0-6bd7cedc6a85	2367	Vuzenica
00050000-55bf-613e-792a-07512301ff65	8292	Zabukovje 
00050000-55bf-613e-8337-d2670f60fb2e	1410	Zagorje ob Savi
00050000-55bf-613e-3f6a-a1703d4eed02	1303	Zagradec
00050000-55bf-613e-052c-b7db8d56f625	2283	Zavrč
00050000-55bf-613e-30af-9e3cd09ffc21	8272	Zdole 
00050000-55bf-613e-351a-09575ab8ec0c	4201	Zgornja Besnica
00050000-55bf-613e-d67c-db4079adda3d	2242	Zgornja Korena
00050000-55bf-613e-9a60-ff9c20c80b2e	2201	Zgornja Kungota
00050000-55bf-613e-4ef3-aecaa1c57b2c	2316	Zgornja Ložnica
00050000-55bf-613e-3f31-081c5c963d8d	2314	Zgornja Polskava
00050000-55bf-613e-01f2-4fc65b109836	2213	Zgornja Velka
00050000-55bf-613e-0a4a-156d593edc07	4247	Zgornje Gorje
00050000-55bf-613e-60b8-f18b12d81bf1	4206	Zgornje Jezersko
00050000-55bf-613e-19b1-c931426047e9	2285	Zgornji Leskovec
00050000-55bf-613e-3de1-88e973a8faf7	1432	Zidani Most
00050000-55bf-613e-08be-b6e060f8d94a	3214	Zreče
00050000-55bf-613e-3459-7ac35885571d	4209	Žabnica
00050000-55bf-613e-017d-fae1d9c56948	3310	Žalec
00050000-55bf-613e-fddd-54e5907f0ba5	4228	Železniki
00050000-55bf-613e-6342-26c01270349f	2287	Žetale
00050000-55bf-613e-5e74-1eb3c84f2e50	4226	Žiri
00050000-55bf-613e-b86c-26e8f2f48d83	4274	Žirovnica
00050000-55bf-613e-89f3-b4729350105b	8360	Žužemberk
\.


--
-- TOC entry 2992 (class 0 OID 11544397)
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
-- TOC entry 2974 (class 0 OID 11544208)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11544286)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11544409)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11544713)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11544723)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55bf-613f-9fb0-d2716f8bf4ed	00080000-55bf-613f-47b8-d5366bac10de	0900	AK
00190000-55bf-613f-87e1-7d7a0d5d5a32	00080000-55bf-613f-31ea-1ff5a1beaa27	0987	AK
00190000-55bf-613f-1097-ca66816228c7	00080000-55bf-613f-9ae5-7821bed1045a	0989	AK
00190000-55bf-613f-e7de-2940260d15f0	00080000-55bf-613f-5492-f620f6b0843a	0986	AK
00190000-55bf-613f-5c6e-e12695f5aa18	00080000-55bf-613f-0afa-b89e61069702	0984	AK
00190000-55bf-613f-7f1a-4426bfe49fdf	00080000-55bf-613f-227c-ff885bbffeb2	0983	AK
00190000-55bf-613f-5548-1cb3acb8a3e9	00080000-55bf-613f-0b2e-41cabac77dac	0982	AK
\.


--
-- TOC entry 3016 (class 0 OID 11544694)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55bf-6140-74f5-817d35f7e7e3	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3019 (class 0 OID 11544731)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11544438)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55bf-613f-fc0e-81bc17636798	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55bf-613f-ee66-62d15f95be19	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55bf-613f-3369-807d7fc0da49	0003	Kazinska	t	84	Kazinska dvorana
00220000-55bf-613f-b96e-ab403d7e3ae0	0004	Mali oder	t	24	Mali oder 
00220000-55bf-613f-d9f1-7047e1d31765	0005	Komorni oder	t	15	Komorni oder
00220000-55bf-613f-2a2f-ffd48c9e4271	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55bf-613f-9ecf-cd7eb6e29763	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2990 (class 0 OID 11544382)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11544372)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11544557)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11544506)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 11544080)
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
-- TOC entry 2999 (class 0 OID 11544448)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 11544118)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55bf-613e-80b6-e256bec16d7c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55bf-613e-d102-edf8f1b7f255	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55bf-613e-7ffd-4cfda27f3d35	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55bf-613e-6e76-10f8154c106e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55bf-613e-b77a-a9b7dd6d4f31	planer	Planer dogodkov v koledarju	t
00020000-55bf-613e-052c-84d5c97482b5	kadrovska	Kadrovska služba	t
00020000-55bf-613e-c416-328d5ee9b79b	arhivar	Ažuriranje arhivalij	t
00020000-55bf-613e-ecce-88f3cd7c7b87	igralec	Igralec	t
00020000-55bf-613e-2aa4-770e13f3589e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55bf-613f-473f-2a67fcec6417	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2965 (class 0 OID 11544102)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55bf-613e-db0f-e20aaa184e23	00020000-55bf-613e-7ffd-4cfda27f3d35
00010000-55bf-613e-051f-6dcdadcdd7ef	00020000-55bf-613e-7ffd-4cfda27f3d35
00010000-55bf-613f-8322-70d65fe3cfdb	00020000-55bf-613f-473f-2a67fcec6417
\.


--
-- TOC entry 3001 (class 0 OID 11544462)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11544403)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11544353)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11544772)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55bf-613e-41d8-e8faf7ceae34	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55bf-613e-daa3-e8a277a6ab2b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55bf-613e-176e-77a8a664eff3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55bf-613e-f381-efb4325532c8	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55bf-613e-784c-3a6947b31e14	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3023 (class 0 OID 11544764)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55bf-613e-6eac-9fea30816c8f	00230000-55bf-613e-f381-efb4325532c8	popa
00240000-55bf-613e-7cc0-6efa93a19f1e	00230000-55bf-613e-f381-efb4325532c8	oseba
00240000-55bf-613e-9582-622d2aff72da	00230000-55bf-613e-daa3-e8a277a6ab2b	prostor
00240000-55bf-613e-841b-aa450a1b6cb1	00230000-55bf-613e-f381-efb4325532c8	besedilo
00240000-55bf-613e-fca1-2b3f558ff879	00230000-55bf-613e-f381-efb4325532c8	uprizoritev
00240000-55bf-613e-ea06-09e7a804be00	00230000-55bf-613e-f381-efb4325532c8	funkcija
00240000-55bf-613e-af0a-001ad1756a49	00230000-55bf-613e-f381-efb4325532c8	tipfunkcije
00240000-55bf-613e-9e42-afe6a3376f06	00230000-55bf-613e-f381-efb4325532c8	alternacija
00240000-55bf-613e-8bb0-c7ff6066df82	00230000-55bf-613e-41d8-e8faf7ceae34	pogodba
00240000-55bf-613e-b438-72fc50fd9d05	00230000-55bf-613e-f381-efb4325532c8	zaposlitev
00240000-55bf-613e-42aa-b85ff2cec09c	00230000-55bf-613e-41d8-e8faf7ceae34	programdela
00240000-55bf-613e-cdea-9bee37d9cb3e	00230000-55bf-613e-f381-efb4325532c8	zapis
\.


--
-- TOC entry 3022 (class 0 OID 11544759)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11544516)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55bf-6140-c6a0-14e191edb66c	000e0000-55bf-613f-42f0-f6a8742881b7	00080000-55bf-613f-08be-799c9609d441	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55bf-6140-24ff-ea693ddc550a	000e0000-55bf-613f-42f0-f6a8742881b7	00080000-55bf-613f-08be-799c9609d441	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55bf-6140-2109-11c8807a48a2	000e0000-55bf-613f-42f0-f6a8742881b7	00080000-55bf-613f-1439-a1e49d0be8a7	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55bf-6140-32ba-222029e72df6	000e0000-55bf-613f-42f0-f6a8742881b7	00080000-55bf-613f-1439-a1e49d0be8a7	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2972 (class 0 OID 11544180)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 11544359)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55bf-6140-f5d4-9bc3052a851e	00180000-55bf-6140-4522-7afbd1c3c0a8	000c0000-55bf-6140-d3aa-b95cd8a02eea	00090000-55bf-613f-dc08-d9962fd91547	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-6140-1380-5a8feabf9ada	00180000-55bf-6140-4522-7afbd1c3c0a8	000c0000-55bf-6140-d043-40a015414dd9	00090000-55bf-613f-89d5-696a73c9dd42	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-6140-423f-1da01f4c0be7	00180000-55bf-6140-4522-7afbd1c3c0a8	000c0000-55bf-6140-9fc6-df88c589540c	00090000-55bf-613f-a74d-ce238c3059b4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-6140-2227-13d7894118a1	00180000-55bf-6140-4522-7afbd1c3c0a8	000c0000-55bf-6140-6233-06bd3397eb8d	00090000-55bf-613f-6204-0c3541ec4549	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-6140-38c1-8c05ba35fba5	00180000-55bf-6140-4522-7afbd1c3c0a8	000c0000-55bf-6140-0750-ac188a98bf0b	00090000-55bf-613f-51c8-61bd8475dc86	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-6140-fce1-f338c0f03178	00180000-55bf-6140-4ac2-96436cc31877	\N	00090000-55bf-613f-51c8-61bd8475dc86	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3008 (class 0 OID 11544546)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55bf-613e-8667-f944f15cdd06	Avtor	Avtorji	Avtorka	umetnik
000f0000-55bf-613e-8d57-2cce33d124d4	Priredba	Priredba	Priredba	umetnik
000f0000-55bf-613e-63d1-163e093c68f1	Prevod	Prevod	Prevod	umetnik
000f0000-55bf-613e-f6c5-99a590b6b123	Režija	Režija	Režija	umetnik
000f0000-55bf-613e-6644-55508a02e7ee	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55bf-613e-447a-e8bed531cd8c	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55bf-613e-1a5d-49a7eafe8dbd	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55bf-613e-3b4f-4ddb9d2e283c	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55bf-613e-f1de-5739069df471	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55bf-613e-69e5-60c4a0bc4d3a	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55bf-613e-65f1-33f5f9f8ed41	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55bf-613e-b518-6c5d4988880b	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55bf-613e-5369-1f31cd33b100	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55bf-613e-cb53-90d51b354b61	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55bf-613e-ac5a-419ccf6a3fd3	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55bf-613e-2389-9d3f601b1a28	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55bf-613e-8a9e-7312db7e655c	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55bf-613e-c39a-9d004fe67c7f	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3020 (class 0 OID 11544741)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55bf-613e-cd6c-2f9c78b3e320	01	Velika predstava	f	1.00	1.00
002b0000-55bf-613e-637a-5d3db63388b9	02	Mala predstava	f	0.50	0.50
002b0000-55bf-613e-a494-5caa6605fde7	03	Mala koprodukcija	t	0.40	1.00
002b0000-55bf-613e-a6b9-e8e13b7eaabc	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55bf-613e-a742-478b1049ec83	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2977 (class 0 OID 11544243)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11544089)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55bf-613e-051f-6dcdadcdd7ef	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROaY1yCa/dB/M5xi50clfG1n5D86g7DVy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55bf-613f-bf24-3f0f01f9cdd2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55bf-613f-465e-a5971ba10e6e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55bf-613f-0a31-689714750c51	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55bf-613f-63ea-4a0b6ed5b43a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55bf-613f-8e2d-ed19ed305923	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55bf-613f-be59-5e885f561ef9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55bf-613f-622b-f5d183aa20ea	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55bf-613f-d456-8611822d49b6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55bf-613f-a7a3-351aa620ec61	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55bf-613f-8322-70d65fe3cfdb	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55bf-613e-db0f-e20aaa184e23	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3012 (class 0 OID 11544594)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55bf-613f-3ed8-787202c6dfb4	00160000-55bf-613f-c3e6-9c4b1353215c	00150000-55bf-613e-26c2-db0a52af05d3	00140000-55bf-613d-8456-fde0bb194000	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55bf-613f-d9f1-7047e1d31765
000e0000-55bf-613f-42f0-f6a8742881b7	00160000-55bf-613f-8a0b-58eec7d96a79	00150000-55bf-613e-0c97-903c84a7cd8d	00140000-55bf-613d-c212-fa18c690c34e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55bf-613f-2a2f-ffd48c9e4271
000e0000-55bf-613f-e061-7233a3426aff	\N	00150000-55bf-613e-0c97-903c84a7cd8d	00140000-55bf-613d-c212-fa18c690c34e	00190000-55bf-613f-87e1-7d7a0d5d5a32	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55bf-613f-d9f1-7047e1d31765
000e0000-55bf-613f-7270-696a0b1ac0b8	\N	00150000-55bf-613e-0c97-903c84a7cd8d	00140000-55bf-613d-c212-fa18c690c34e	00190000-55bf-613f-87e1-7d7a0d5d5a32	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55bf-613f-d9f1-7047e1d31765
000e0000-55bf-613f-669d-2e4f60f3193d	\N	00150000-55bf-613e-0c97-903c84a7cd8d	00140000-55bf-613d-c212-fa18c690c34e	00190000-55bf-613f-87e1-7d7a0d5d5a32	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55bf-613f-fc0e-81bc17636798
\.


--
-- TOC entry 2982 (class 0 OID 11544305)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55bf-6140-b3d2-863b28994773	000e0000-55bf-613f-42f0-f6a8742881b7	1	
00200000-55bf-6140-1ea5-429090ad4f92	000e0000-55bf-613f-42f0-f6a8742881b7	2	
\.


--
-- TOC entry 2997 (class 0 OID 11544430)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11544811)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11544783)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11544823)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11544499)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55bf-613f-a62c-d022549ea5a8	00090000-55bf-613f-89d5-696a73c9dd42	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-613f-0640-5b907c096cd1	00090000-55bf-613f-a74d-ce238c3059b4	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-613f-f85f-1356bb2ebcaa	00090000-55bf-613f-96db-13bcacdfaf11	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-613f-e44f-f691c5dbdc98	00090000-55bf-613f-fbce-d740913aed4c	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-613f-46f0-62f788457609	00090000-55bf-613f-dc08-d9962fd91547	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-613f-53cd-6bbe07b37e5b	00090000-55bf-613f-8559-25566eef8dbe	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2984 (class 0 OID 11544337)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11544584)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55bf-613d-8456-fde0bb194000	01	Drama	drama (SURS 01)
00140000-55bf-613d-8471-593d858466d2	02	Opera	opera (SURS 02)
00140000-55bf-613d-7db4-df02cf71d33d	03	Balet	balet (SURS 03)
00140000-55bf-613d-01f3-7ddbe7ba920e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55bf-613d-9102-0053980d9bba	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55bf-613d-c212-fa18c690c34e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55bf-613d-ba00-4fcd3b558969	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3003 (class 0 OID 11544489)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55bf-613e-1f05-663af4afee32	01	Opera	opera
00150000-55bf-613e-a5cc-5e3f7be32e27	02	Opereta	opereta
00150000-55bf-613e-4fa7-4b5aff6106d2	03	Balet	balet
00150000-55bf-613e-742f-9885789b6279	04	Plesne prireditve	plesne prireditve
00150000-55bf-613e-c845-d042078fa362	05	Lutkovno gledališče	lutkovno gledališče
00150000-55bf-613e-506b-04ec7567f9cb	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55bf-613e-effc-61541dd3d711	07	Biografska drama	biografska drama
00150000-55bf-613e-26c2-db0a52af05d3	08	Komedija	komedija
00150000-55bf-613e-0874-ba448512bd19	09	Črna komedija	črna komedija
00150000-55bf-613e-831d-ee68402cd0c0	10	E-igra	E-igra
00150000-55bf-613e-0c97-903c84a7cd8d	11	Kriminalka	kriminalka
00150000-55bf-613e-851a-229abee690a9	12	Musical	musical
\.


--
-- TOC entry 2509 (class 2606 OID 11544143)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 11544641)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11544631)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11544545)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 11544864)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 11544327)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11544352)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11544757)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 11544269)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 11544688)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11544485)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 11544303)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 11544346)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 11544283)
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
-- TOC entry 2601 (class 2606 OID 11544395)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 11544840)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11544847)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 11544872)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 11544422)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 11544241)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 11544152)
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
-- TOC entry 2516 (class 2606 OID 11544176)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 11544132)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2500 (class 2606 OID 11544117)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 11544428)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11544461)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 11544579)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11544205)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 11544229)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11544401)
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
-- TOC entry 2531 (class 2606 OID 11544219)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11544290)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11544413)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11544720)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 11544728)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 11544711)
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
-- TOC entry 2707 (class 2606 OID 11544739)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11544445)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 11544386)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 11544377)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11544567)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 11544513)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11544088)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11544452)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 11544106)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2502 (class 2606 OID 11544126)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11544470)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11544408)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 11544358)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 11544781)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 11544769)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 11544763)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11544526)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 11544185)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 11544368)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11544556)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11544751)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11544254)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 11544101)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11544610)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11544312)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11544436)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 11544821)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 11544805)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 11544829)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 11544504)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11544341)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 11544592)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 11544497)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 11544334)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2649 (class 1259 OID 11544527)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 11544528)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 11544842)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 11544841)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2523 (class 1259 OID 11544207)
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
-- TOC entry 2614 (class 1259 OID 11544429)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 11544809)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 11544808)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 11544810)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 11544807)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 11544806)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 11544415)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 11544414)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 11544313)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 11544486)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 11544488)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 11544487)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2548 (class 1259 OID 11544285)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 11544284)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 11544740)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2659 (class 1259 OID 11544581)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 11544582)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2661 (class 1259 OID 11544583)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 11544830)
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
-- TOC entry 2668 (class 1259 OID 11544615)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2669 (class 1259 OID 11544612)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2670 (class 1259 OID 11544616)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2671 (class 1259 OID 11544614)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2672 (class 1259 OID 11544613)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2538 (class 1259 OID 11544256)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 11544255)
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
-- TOC entry 2514 (class 1259 OID 11544179)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 11544453)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2578 (class 1259 OID 11544347)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 11544133)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2505 (class 1259 OID 11544134)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 11544473)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 11544472)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 11544471)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2552 (class 1259 OID 11544291)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 11544293)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2554 (class 1259 OID 11544292)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2715 (class 1259 OID 11544771)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 11544381)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 11544379)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 11544378)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 11544380)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2495 (class 1259 OID 11544107)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 11544108)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 11544437)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 11544865)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2746 (class 1259 OID 11544873)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 11544874)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 11544402)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 11544514)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 11544515)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 11544693)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2690 (class 1259 OID 11544692)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2691 (class 1259 OID 11544689)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 11544690)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2693 (class 1259 OID 11544691)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 11544221)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2528 (class 1259 OID 11544220)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2529 (class 1259 OID 11544222)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2488 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 11544721)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2698 (class 1259 OID 11544722)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2682 (class 1259 OID 11544645)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2683 (class 1259 OID 11544646)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2684 (class 1259 OID 11544643)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2685 (class 1259 OID 11544644)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 11544505)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 11544390)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 11544389)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 11544387)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 11544388)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2466 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2678 (class 1259 OID 11544633)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 11544632)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2694 (class 1259 OID 11544712)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2559 (class 1259 OID 11544304)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2712 (class 1259 OID 11544758)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 11544848)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 11544849)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2510 (class 1259 OID 11544154)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2511 (class 1259 OID 11544153)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2519 (class 1259 OID 11544186)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 11544187)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2583 (class 1259 OID 11544371)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 11544370)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 11544369)
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
-- TOC entry 2566 (class 1259 OID 11544336)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 11544332)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2568 (class 1259 OID 11544329)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 11544330)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 11544328)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 11544333)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2572 (class 1259 OID 11544331)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 11544206)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11544270)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11544272)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2546 (class 1259 OID 11544271)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2547 (class 1259 OID 11544273)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 11544396)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 11544580)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 11544611)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 11544177)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 11544178)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 11544498)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 11544782)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 11544242)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2718 (class 1259 OID 11544770)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2622 (class 1259 OID 11544447)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 11544446)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 11544642)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 11544230)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 11544593)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 11544822)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2703 (class 1259 OID 11544729)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 11544730)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 11544127)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 11544335)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2775 (class 2606 OID 11545010)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2778 (class 2606 OID 11544995)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 11545000)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 11545020)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 11544990)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2774 (class 2606 OID 11545015)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 11545005)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 11545165)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 11545170)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 11545340)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 11545335)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 11544925)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 11545105)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 11545320)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 11545315)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2836 (class 2606 OID 11545325)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 11545310)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2840 (class 2606 OID 11545305)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 11545100)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 11545095)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 11544985)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 11545135)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11545145)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2803 (class 2606 OID 11545140)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2766 (class 2606 OID 11544960)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11544955)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 11545085)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 11545290)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2812 (class 2606 OID 11545175)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 11545180)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 11545185)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2841 (class 2606 OID 11545330)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2814 (class 2606 OID 11545205)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2817 (class 2606 OID 11545190)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2813 (class 2606 OID 11545210)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2815 (class 2606 OID 11545200)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2816 (class 2606 OID 11545195)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2764 (class 2606 OID 11544950)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11544945)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 11544910)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 11544905)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 11545115)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 11545025)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 11544885)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2752 (class 2606 OID 11544890)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 11545130)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2800 (class 2606 OID 11545125)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 11545120)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 11544965)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 11544975)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2769 (class 2606 OID 11544970)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2835 (class 2606 OID 11545300)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 11545060)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 11545050)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 11545045)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 11545055)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 11544875)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2750 (class 2606 OID 11544880)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 11545110)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2846 (class 2606 OID 11545355)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 11545360)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 11545365)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 11545090)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2807 (class 2606 OID 11545155)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2806 (class 2606 OID 11545160)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 11545265)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 11545260)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2828 (class 2606 OID 11545245)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 11545250)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2826 (class 2606 OID 11545255)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 11544935)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11544930)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 11544940)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 11545275)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2830 (class 2606 OID 11545280)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 11545235)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 11545240)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2823 (class 2606 OID 11545225)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2822 (class 2606 OID 11545230)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2805 (class 2606 OID 11545150)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 11545080)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 11545075)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 11545065)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 11545070)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2818 (class 2606 OID 11545220)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2819 (class 2606 OID 11545215)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2829 (class 2606 OID 11545270)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2771 (class 2606 OID 11544980)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 11545285)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 11545295)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2845 (class 2606 OID 11545345)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2844 (class 2606 OID 11545350)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 11544900)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 11544895)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 11544915)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2758 (class 2606 OID 11544920)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 11545040)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 11545035)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 11545030)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-03 14:40:33 CEST

--
-- PostgreSQL database dump complete
--

