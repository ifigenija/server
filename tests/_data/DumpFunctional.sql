--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-04 14:31:55 CEST

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
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 11734894)
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
-- TOC entry 228 (class 1259 OID 11735397)
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
-- TOC entry 227 (class 1259 OID 11735380)
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
-- TOC entry 221 (class 1259 OID 11735292)
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
-- TOC entry 244 (class 1259 OID 11735615)
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
-- TOC entry 197 (class 1259 OID 11735073)
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
-- TOC entry 200 (class 1259 OID 11735107)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11735517)
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
-- TOC entry 192 (class 1259 OID 11735016)
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
-- TOC entry 229 (class 1259 OID 11735410)
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
-- TOC entry 216 (class 1259 OID 11735237)
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
-- TOC entry 195 (class 1259 OID 11735053)
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
-- TOC entry 199 (class 1259 OID 11735101)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11735033)
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
-- TOC entry 205 (class 1259 OID 11735154)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11735596)
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
-- TOC entry 243 (class 1259 OID 11735608)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11735631)
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
-- TOC entry 209 (class 1259 OID 11735179)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11734990)
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
-- TOC entry 184 (class 1259 OID 11734903)
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
-- TOC entry 185 (class 1259 OID 11734914)
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
-- TOC entry 180 (class 1259 OID 11734868)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11734887)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11735186)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11735217)
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
-- TOC entry 224 (class 1259 OID 11735331)
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
-- TOC entry 187 (class 1259 OID 11734947)
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
-- TOC entry 189 (class 1259 OID 11734982)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11735160)
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
-- TOC entry 188 (class 1259 OID 11734967)
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
-- TOC entry 194 (class 1259 OID 11735045)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11735172)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11735478)
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
-- TOC entry 232 (class 1259 OID 11735488)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11735458)
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
-- TOC entry 233 (class 1259 OID 11735496)
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
-- TOC entry 212 (class 1259 OID 11735201)
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
-- TOC entry 204 (class 1259 OID 11735145)
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
-- TOC entry 203 (class 1259 OID 11735135)
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
-- TOC entry 223 (class 1259 OID 11735320)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11735269)
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
-- TOC entry 177 (class 1259 OID 11734839)
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
-- TOC entry 176 (class 1259 OID 11734837)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 11735211)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11734877)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11734861)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11735225)
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
-- TOC entry 207 (class 1259 OID 11735166)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11735112)
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
-- TOC entry 238 (class 1259 OID 11735537)
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
-- TOC entry 237 (class 1259 OID 11735529)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11735524)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11735279)
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
-- TOC entry 186 (class 1259 OID 11734939)
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
-- TOC entry 202 (class 1259 OID 11735122)
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
-- TOC entry 222 (class 1259 OID 11735309)
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
-- TOC entry 234 (class 1259 OID 11735506)
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
-- TOC entry 191 (class 1259 OID 11735002)
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
-- TOC entry 178 (class 1259 OID 11734848)
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
-- TOC entry 226 (class 1259 OID 11735357)
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
-- TOC entry 196 (class 1259 OID 11735064)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11735193)
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
-- TOC entry 240 (class 1259 OID 11735576)
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
-- TOC entry 239 (class 1259 OID 11735548)
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
-- TOC entry 241 (class 1259 OID 11735588)
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
-- TOC entry 218 (class 1259 OID 11735262)
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
-- TOC entry 198 (class 1259 OID 11735096)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11735347)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11735252)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 11734842)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2973 (class 0 OID 11734894)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11735397)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c0-b0ba-b2ec-81795955812a	000d0000-55c0-b0ba-4602-4e3ec198868e	\N	00090000-55c0-b0ba-7479-7e241b7eb6a0	000b0000-55c0-b0ba-e9db-f274ef6c764c	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c0-b0ba-ae3b-82ba31871781	000d0000-55c0-b0ba-484c-a24f882e01ce	00100000-55c0-b0ba-6a96-e78a46714791	00090000-55c0-b0ba-fc05-3a0de10e7e56	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c0-b0ba-7d44-6fc4d21fcc2b	000d0000-55c0-b0ba-eaa7-fb076ad1acc2	00100000-55c0-b0ba-6ee8-51891436d819	00090000-55c0-b0ba-2916-6261981c79e5	\N	0003	t	\N	2015-08-04	\N	2	\N	\N	f	f
000c0000-55c0-b0ba-df3c-7a3cc38656cc	000d0000-55c0-b0ba-0722-04c9e2fb2318	\N	00090000-55c0-b0ba-0728-a905f102ee9f	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c0-b0ba-d04b-f01bd445eb01	000d0000-55c0-b0ba-f2d4-605cae83c45d	\N	00090000-55c0-b0ba-a4a4-5c3b5bc3fedd	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c0-b0ba-4089-1686f39612c8	000d0000-55c0-b0ba-9711-6cc9d2d5b5a2	\N	00090000-55c0-b0ba-3442-f0f888a8ee68	000b0000-55c0-b0ba-2082-59b6bbbc4144	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c0-b0ba-2823-400d18fca9aa	000d0000-55c0-b0ba-8064-b2f5c8bbcc20	00100000-55c0-b0ba-e663-0eb70fae6175	00090000-55c0-b0ba-f0ea-1560796f131b	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c0-b0ba-3abb-284326543b46	000d0000-55c0-b0ba-f5e8-9b82a43e8b2d	\N	00090000-55c0-b0ba-ae0d-691a66746d9d	000b0000-55c0-b0ba-90e7-8a800aacc30b	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c0-b0ba-2b9c-8423c7555862	000d0000-55c0-b0ba-8064-b2f5c8bbcc20	00100000-55c0-b0ba-3867-484f6a4c9532	00090000-55c0-b0ba-7641-497dea39d1db	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c0-b0ba-9d8c-add239bb14a9	000d0000-55c0-b0ba-8064-b2f5c8bbcc20	00100000-55c0-b0ba-f525-e55234ce61b2	00090000-55c0-b0ba-8020-e443200635c1	\N	0010	t	\N	2015-08-04	\N	16	\N	\N	f	t
000c0000-55c0-b0ba-74f3-27d31957aff4	000d0000-55c0-b0ba-8064-b2f5c8bbcc20	00100000-55c0-b0ba-d67e-d5523ba09679	00090000-55c0-b0ba-0390-fccbd5a712d4	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3017 (class 0 OID 11735380)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11735292)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c0-b0ba-af6b-5b3144362f84	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c0-b0ba-3be9-d08803cd05a6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c0-b0ba-4770-afadfead9723	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3034 (class 0 OID 11735615)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11735073)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c0-b0ba-cd3c-8c9c021c5d95	\N	\N	00200000-55c0-b0ba-b187-7f920c24ec40	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c0-b0ba-589f-72fc455a75c8	\N	\N	00200000-55c0-b0ba-3f5a-516fabfdc31c	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c0-b0ba-e2f2-38da19bcff06	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c0-b0ba-d1a6-e92bf3333f94	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c0-b0ba-de0b-8db4dd9bfed8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2990 (class 0 OID 11735107)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11735517)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 11735016)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c0-b0b8-c009-08adbbfebd3d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c0-b0b8-8107-f28b21b7fe4e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c0-b0b8-52f6-902957d2b6a7	AL	ALB	008	Albania 	Albanija	\N
00040000-55c0-b0b8-95a7-10f864e7c690	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c0-b0b8-6b3d-6b992e8963ab	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c0-b0b8-d691-521444fa8ecb	AD	AND	020	Andorra 	Andora	\N
00040000-55c0-b0b8-cb8c-0205025b7058	AO	AGO	024	Angola 	Angola	\N
00040000-55c0-b0b8-ca52-82f078a31dc7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c0-b0b8-4875-4547baf4b6ba	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c0-b0b8-f080-04a0ece97c5b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c0-b0b8-a97a-4ba36206b5ed	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c0-b0b8-f689-921928cd9ca3	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c0-b0b8-055f-cc487e2ef3e6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c0-b0b8-b40e-f808bf9ac29e	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c0-b0b8-9a31-554ca5252e97	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c0-b0b8-8cda-e26ac499ff65	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c0-b0b8-061c-241143a94f3a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c0-b0b8-6269-87110fb13803	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c0-b0b8-bfd1-ce32b75041c5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c0-b0b8-33ff-213b7c576438	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c0-b0b8-a663-530adb33ec10	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c0-b0b8-195e-aa722fcdaebe	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c0-b0b8-9c0d-0d15419af4fc	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c0-b0b8-936a-e15df22f86be	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c0-b0b8-80f8-11eef940021d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c0-b0b8-06fe-dbb501d9e75e	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c0-b0b8-88aa-b8a8b09b4621	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c0-b0b8-c712-3cba944a19f7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c0-b0b8-6dc4-814240340897	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c0-b0b8-15e1-e6a2edc9519a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c0-b0b8-3d95-383cf0c4c14c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c0-b0b8-20e0-59b6a2721c85	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c0-b0b8-53b9-87e768b63559	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c0-b0b8-04be-35a7a684dfa6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c0-b0b8-6273-578b9324b836	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c0-b0b8-3e79-be89e2a1b4ee	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c0-b0b8-06ad-a57c3b9169b9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c0-b0b8-570d-01542f91d1b8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c0-b0b8-7fb0-a31d64013f1a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c0-b0b8-cd16-c827be0d3c55	CA	CAN	124	Canada 	Kanada	\N
00040000-55c0-b0b8-5c2e-d31c101d9aee	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c0-b0b8-4bb1-b454484fbfe7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c0-b0b8-80e7-4916ce492f2b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c0-b0b8-5353-fc1116f4799f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c0-b0b8-5d10-1fc23f42ccfb	CL	CHL	152	Chile 	Čile	\N
00040000-55c0-b0b8-ff9b-82d18c2d0bde	CN	CHN	156	China 	Kitajska	\N
00040000-55c0-b0b8-0ec0-28ef2fc7339b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c0-b0b8-5d2c-1fdf734efbf5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c0-b0b8-73cf-4a196042defe	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c0-b0b8-921f-ea2b8abfbe61	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c0-b0b8-d026-3fa155fdf4d7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c0-b0b8-33b9-8b23305a60e8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c0-b0b8-f986-ee02fd77159f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c0-b0b8-0752-b77c7fb73ea8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c0-b0b8-64b9-faffa8b9acf8	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c0-b0b8-b3f2-1677dd4bfdcf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c0-b0b8-aa82-53a5f7c8a329	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c0-b0b8-4cb4-23c657e5734f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c0-b0b8-9865-205fc31dd5cb	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c0-b0b8-c343-9b0d2f3358d9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c0-b0b8-1e16-8d1d723ac758	DK	DNK	208	Denmark 	Danska	\N
00040000-55c0-b0b8-4a56-9a52fb93569d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c0-b0b8-1920-c526dc0a0ab5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c0-b0b8-871e-1e3c354686c8	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c0-b0b8-8a86-3f66f185f72f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c0-b0b8-7fbf-4755540c180b	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c0-b0b8-867d-bd97a2293b57	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c0-b0b8-5a6a-31886a7e5364	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c0-b0b8-74e7-94428fff072f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c0-b0b8-4ae1-332330133d22	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c0-b0b8-3154-b04910310008	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c0-b0b8-d2bb-03c3e5e81757	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c0-b0b8-d664-c6431cb7fdde	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c0-b0b8-0051-0b4411f1d81e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c0-b0b8-8d24-789fc7f9bb48	FI	FIN	246	Finland 	Finska	\N
00040000-55c0-b0b8-94da-e85ded5a13ab	FR	FRA	250	France 	Francija	\N
00040000-55c0-b0b8-f6df-b9db7bd64ebe	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c0-b0b8-7805-55be4a838ec9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c0-b0b8-4f1c-b373fdf08e8a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c0-b0b8-f4f1-dafd7711268e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c0-b0b8-c737-9ec81b733623	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c0-b0b8-f25e-6c6cde49c260	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c0-b0b8-6972-2b5761dea0ba	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c0-b0b8-89fc-0cc5fe238721	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c0-b0b8-95e1-4d55a493903e	GH	GHA	288	Ghana 	Gana	\N
00040000-55c0-b0b8-54af-b81b7bc2690d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c0-b0b8-c137-486b196148e6	GR	GRC	300	Greece 	Grčija	\N
00040000-55c0-b0b8-33a3-d117b7a668d8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c0-b0b8-3c70-853ea306fecb	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c0-b0b8-c46b-9172ef8ec501	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c0-b0b8-8726-9ba7b4aacd10	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c0-b0b8-aeb4-5006c6b313ce	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c0-b0b8-abae-581b4812db4b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c0-b0b8-d04d-acf2cc2865c1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c0-b0b8-b8bb-bb30f20cc150	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c0-b0b8-5457-28b8ee702f4f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c0-b0b8-e7ce-1622ad8f7cd4	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c0-b0b8-7be3-f090cd5c544c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c0-b0b8-6f49-deecf073a0a5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c0-b0b8-8b72-12a01f891490	HN	HND	340	Honduras 	Honduras	\N
00040000-55c0-b0b8-78d1-45088ffeed16	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c0-b0b8-db56-7683b2da5009	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c0-b0b8-e582-7459f966b12e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c0-b0b8-8202-4c8da22ea389	IN	IND	356	India 	Indija	\N
00040000-55c0-b0b8-f338-cb79fbded7af	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c0-b0b8-b11b-90387273f065	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c0-b0b8-9d77-bd87733f08b6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c0-b0b8-c8f2-ae90cefd948a	IE	IRL	372	Ireland 	Irska	\N
00040000-55c0-b0b8-1114-0d3ae8bd7dc9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c0-b0b8-9b45-e4c5bc669961	IL	ISR	376	Israel 	Izrael	\N
00040000-55c0-b0b8-f22d-f62cc2c87f7b	IT	ITA	380	Italy 	Italija	\N
00040000-55c0-b0b8-f0b1-00b05e11e1fb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c0-b0b8-0600-0c17a82bc783	JP	JPN	392	Japan 	Japonska	\N
00040000-55c0-b0b8-e864-7fe526cdde81	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c0-b0b8-6d3a-01352f599843	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c0-b0b8-3693-548b0c429aaa	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c0-b0b8-e65c-1d031065897f	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c0-b0b8-f908-d4f962cf848f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c0-b0b8-c320-433513eb3174	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c0-b0b8-c991-2cfdf3c8a3a3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c0-b0b8-0b1f-3b96afe96ea7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c0-b0b8-88ac-5c8b02d5421f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c0-b0b8-4afe-dd2bce0ba120	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c0-b0b8-55e3-2094602c8ab1	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c0-b0b8-f230-1ce3d249e12d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c0-b0b8-0db8-47c90828ddba	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c0-b0b8-0488-fe555c9d0be7	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c0-b0b8-40d6-fd945fa7f8fa	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c0-b0b8-3b2c-01ee69531219	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c0-b0b8-f857-1f98e682ba8d	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c0-b0b8-b25c-dc4dcf682948	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c0-b0b8-5e6f-3f215afe84cd	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c0-b0b8-cc41-e76d6d5a0360	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c0-b0b8-42df-45dcf545c295	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c0-b0b8-6319-b5299b7da4fb	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c0-b0b8-abd1-d49d419865ee	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c0-b0b8-c82a-d61c7e587ead	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c0-b0b8-728f-a271696b643a	ML	MLI	466	Mali 	Mali	\N
00040000-55c0-b0b8-6c88-81e57907c2c5	MT	MLT	470	Malta 	Malta	\N
00040000-55c0-b0b8-57c8-d61393cbb7b0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c0-b0b8-be58-fa54bbd779af	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c0-b0b8-e240-f6b2bab7b650	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c0-b0b8-7229-b4462242f004	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c0-b0b8-c6ee-a5a8f4c9dc74	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c0-b0b8-01bb-09946d28e3ff	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c0-b0b8-0370-99d302f2f3f4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c0-b0b8-1d7d-124c1da66bc1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c0-b0b8-a46a-70a9cd6d0b95	MC	MCO	492	Monaco 	Monako	\N
00040000-55c0-b0b8-87be-f84a119b9fa1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c0-b0b8-8c65-3cfa436046cb	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c0-b0b8-35c6-37a3724f2205	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c0-b0b8-e5f4-38751b7117f2	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c0-b0b8-a771-2d6b88bc3ed2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c0-b0b8-550f-f2f05145c2ea	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c0-b0b8-bc6e-9989c1f77026	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c0-b0b8-df68-3f6c02f0467b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c0-b0b8-3aab-4bf1849ebee0	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c0-b0b8-3c85-fa540ca73763	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c0-b0b8-fb8e-eacb1312308b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c0-b0b8-c0a8-15813c143a64	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c0-b0b8-0586-4e4b694fa1a8	NE	NER	562	Niger 	Niger 	\N
00040000-55c0-b0b8-1ae0-94c59cbe071b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c0-b0b8-8e15-96bedf58a309	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c0-b0b8-d240-455f238f9643	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c0-b0b8-5a97-7f24a8af33d5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c0-b0b8-0ca2-76b181437c12	NO	NOR	578	Norway 	Norveška	\N
00040000-55c0-b0b8-dcf8-af037056d5bc	OM	OMN	512	Oman 	Oman	\N
00040000-55c0-b0b8-9e99-906c1a563cce	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c0-b0b8-3af0-fb2f59eb6e70	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c0-b0b8-f427-501aae21a48c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c0-b0b8-2f3b-58b4f0ea4277	PA	PAN	591	Panama 	Panama	\N
00040000-55c0-b0b8-3a3f-64bd23eec71e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c0-b0b8-99fe-4dfcfc1c0cfd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c0-b0b8-742a-5a3616611d16	PE	PER	604	Peru 	Peru	\N
00040000-55c0-b0b8-54d9-0a1d802ad8e1	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c0-b0b8-3e06-75d006b2a089	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c0-b0b8-7fcf-257d2f641218	PL	POL	616	Poland 	Poljska	\N
00040000-55c0-b0b8-9ae1-9de39059cd1d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c0-b0b8-bd63-fe28a6aa1f4d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c0-b0b8-39cb-ee1f8cabad9e	QA	QAT	634	Qatar 	Katar	\N
00040000-55c0-b0b8-8a9a-38a62aa285c5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c0-b0b8-e46b-98d6a2e18a3a	RO	ROU	642	Romania 	Romunija	\N
00040000-55c0-b0b8-d9ea-d83e66e0630c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c0-b0b8-9f43-48c9da0e93fa	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c0-b0b8-82a5-2417e56ace27	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c0-b0b8-5f6e-a0a2619dab9d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c0-b0b8-46ae-acdc72e8dced	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c0-b0b8-98af-78eee3d775fb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c0-b0b8-b362-6871d19aabb6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c0-b0b8-1e54-789777174eba	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c0-b0b8-69b9-33cee9eca7ea	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c0-b0b8-e82d-90dfed5e6c89	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c0-b0b8-aebf-071272c59341	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c0-b0b8-1827-d82f14f1d22e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c0-b0b8-5f8a-6a37528b9abd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c0-b0b8-362a-7bae009c85d0	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c0-b0b8-71ac-fcde99f59f51	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c0-b0b8-369b-49952446b376	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c0-b0b8-af9f-35ffaf69d956	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c0-b0b8-87b4-b0c816c43e6c	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c0-b0b8-e812-915924e454e4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c0-b0b8-1c56-a9f04982d218	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c0-b0b8-857c-6b4007ff9e54	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c0-b0b8-90a2-c81b02d1bb84	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c0-b0b8-3b9c-6e98a056da1c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c0-b0b8-ddc1-0a65be15d15d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c0-b0b8-0ec8-3a0dc312344b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c0-b0b8-9dc8-57464c89e7e7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c0-b0b8-bb50-6c8f7463d261	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c0-b0b8-6e30-6c90cf1cec5a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c0-b0b8-52a6-414fe58d5581	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c0-b0b8-3967-e3eed85471c2	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c0-b0b8-d4d8-82a3bff8b7c3	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c0-b0b8-5f10-e177405b2119	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c0-b0b8-6934-ffc9cee4a32a	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c0-b0b8-8bf5-93f79a09a455	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c0-b0b8-e150-74ad8477a2ff	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c0-b0b8-4d57-c9fd0b793913	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c0-b0b8-dfe5-e9d929fafb61	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c0-b0b8-342d-869bdf3c1f25	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c0-b0b8-bcf0-a9cf44b3fff9	TH	THA	764	Thailand 	Tajska	\N
00040000-55c0-b0b8-3b91-ea19de62a390	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c0-b0b8-6e49-f814adb3f5bc	TG	TGO	768	Togo 	Togo	\N
00040000-55c0-b0b8-9cb0-fbcf804d5c95	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c0-b0b8-78b1-7e6bc9926c8c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c0-b0b8-c744-ad990bb5071e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c0-b0b8-6487-803ddbe4807c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c0-b0b8-8c72-1676d0df4b84	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c0-b0b8-23d5-d28ece18dab6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c0-b0b8-80e2-ab1730d1bd8d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c0-b0b8-9fd7-020f27703e83	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c0-b0b8-7aba-69b358073e28	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c0-b0b8-02d8-fc7e9c62e853	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c0-b0b8-e199-a28c8ad5b544	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c0-b0b8-4a88-9450d4845ddf	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c0-b0b8-0ebb-642624bf245a	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c0-b0b8-0dc3-52d0d5494d6d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c0-b0b8-0357-c2ebd63cac12	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c0-b0b8-75ae-d2dd57302d1e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c0-b0b8-a32d-5a290c3ae577	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c0-b0b8-3e4c-2d19037a8f47	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c0-b0b8-9a80-4038ea8b163d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c0-b0b8-5c97-776c17e4d9af	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c0-b0b8-5469-875e8cb7a5bd	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c0-b0b8-6bcd-b106ab941d92	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c0-b0b8-4a79-14f324664517	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c0-b0b8-657c-44c2614918c7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c0-b0b8-06f4-d73647a0481b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c0-b0b8-6680-47962456144f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3019 (class 0 OID 11735410)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c0-b0ba-9f09-c64957d62f51	000e0000-55c0-b0ba-7ea6-2dd02aa9d135	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c0-b0b9-4855-2e89ea27ec1c	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c0-b0ba-d6d5-eef14b17a679	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c0-b0b9-3c5f-96e09c721237	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c0-b0ba-aa2a-03711b4c4ea9	000e0000-55c0-b0ba-a991-71398abf0a2f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c0-b0b9-4855-2e89ea27ec1c	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c0-b0ba-b1f1-d4f1ff3f525e	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c0-b0ba-19e1-b9805ffccf9c	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3006 (class 0 OID 11735237)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c0-b0ba-8064-b2f5c8bbcc20	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c0-b0b9-f404-4e9a347de3cb
000d0000-55c0-b0ba-4602-4e3ec198868e	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c0-b0b9-f404-4e9a347de3cb
000d0000-55c0-b0ba-484c-a24f882e01ce	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c0-b0b9-dfdb-e5fb6f1ca66b
000d0000-55c0-b0ba-eaa7-fb076ad1acc2	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c0-b0b9-8bac-2fb687666757
000d0000-55c0-b0ba-0722-04c9e2fb2318	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c0-b0b9-513e-5add6d49338e
000d0000-55c0-b0ba-f2d4-605cae83c45d	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c0-b0b9-8582-cf45e1d643ab
000d0000-55c0-b0ba-9711-6cc9d2d5b5a2	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c0-b0b9-f404-4e9a347de3cb
000d0000-55c0-b0ba-f5e8-9b82a43e8b2d	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c0-b0b9-5cff-be5fcd52871b
\.


--
-- TOC entry 2985 (class 0 OID 11735053)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11735101)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11735033)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c0-b0ba-b6b5-9e26c27eb447	00080000-55c0-b0ba-b733-f600ef165cb0	00090000-55c0-b0ba-8020-e443200635c1	AK		
\.


--
-- TOC entry 2960 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11735154)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 11735596)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 11735608)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 11735631)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 11735179)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11734990)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c0-b0b8-46cb-e14c481db603	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c0-b0b8-d799-642e585c830d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c0-b0b8-01e7-8e98f37bdd36	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c0-b0b8-29c6-d53b75578933	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c0-b0b8-1026-d255266c87f0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c0-b0b8-70ae-839a69853de0	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c0-b0b8-4827-7734b46e9efa	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c0-b0b8-e229-57fda6da00a3	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c0-b0b8-7bfa-f79587235da5	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c0-b0b8-f5e8-e1b9cebfbf29	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c0-b0b8-37f7-d9658f8b2c47	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c0-b0b8-3fec-b37ec4109397	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c0-b0b8-62ba-0c385e6c2aa1	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c0-b0b8-cd0a-6fed3007ed1a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c0-b0ba-411e-d964b3a6db2e	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c0-b0ba-d73f-8eb68062c0d0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c0-b0ba-1dcb-0115d8d0a343	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c0-b0ba-e8a2-923da9208d62	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c0-b0ba-35ff-11b2fc1860bb	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c0-b0ba-3d01-45f725d00115	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2974 (class 0 OID 11734903)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c0-b0ba-f843-66c10e972bcf	00000000-55c0-b0ba-d73f-8eb68062c0d0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c0-b0ba-8f77-0ed28cd570d0	00000000-55c0-b0ba-d73f-8eb68062c0d0	00010000-55c0-b0b8-7eef-7e0bcd2913d1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c0-b0ba-aa12-e9643cee2a8d	00000000-55c0-b0ba-1dcb-0115d8d0a343	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2975 (class 0 OID 11734914)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c0-b0ba-7479-7e241b7eb6a0	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c0-b0ba-0728-a905f102ee9f	00010000-55c0-b0ba-0d88-496ebd14770c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c0-b0ba-2916-6261981c79e5	00010000-55c0-b0ba-1830-958c6ad51602	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c0-b0ba-7641-497dea39d1db	00010000-55c0-b0ba-9218-6d2ce6c706bd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c0-b0ba-4a90-0414ce65f93f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c0-b0ba-3442-f0f888a8ee68	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c0-b0ba-0390-fccbd5a712d4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c0-b0ba-f0ea-1560796f131b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c0-b0ba-8020-e443200635c1	00010000-55c0-b0ba-9a10-58620ac883c4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c0-b0ba-fc05-3a0de10e7e56	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c0-b0ba-afa5-4af1effa2093	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c0-b0ba-a4a4-5c3b5bc3fedd	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c0-b0ba-ae0d-691a66746d9d	00010000-55c0-b0ba-fe02-43c8d9000aee	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2962 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 11734868)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c0-b0b8-8d90-9ec011cef9bb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c0-b0b8-f0c9-da571b710691	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c0-b0b8-7962-3f96ec5d0e43	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c0-b0b8-f8f1-e7c0decff2d6	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c0-b0b8-ec9b-0f92a3288fa8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c0-b0b8-498b-829f0db68b3d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c0-b0b8-5cff-f1c9dda824e2	Abonma-read	Abonma - branje	f
00030000-55c0-b0b8-50bc-186e84b74fdf	Abonma-write	Abonma - spreminjanje	f
00030000-55c0-b0b8-8c07-ee7ba6e3b2d4	Alternacija-read	Alternacija - branje	f
00030000-55c0-b0b8-6cfb-211b524ae8a4	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c0-b0b8-54c8-81957002c9ab	Arhivalija-read	Arhivalija - branje	f
00030000-55c0-b0b8-564d-47beb35925d2	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c0-b0b8-0330-d6b0c188c797	Besedilo-read	Besedilo - branje	f
00030000-55c0-b0b8-08e3-55cb47292182	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c0-b0b8-03ce-f66ab0cb4b9e	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c0-b0b8-3a59-db2c001f352b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c0-b0b8-60b1-e014de7dc39e	Dogodek-read	Dogodek - branje	f
00030000-55c0-b0b8-0fe3-d0e7a9ca0673	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c0-b0b8-1898-ed507148fd47	DrugiVir-read	DrugiVir - branje	f
00030000-55c0-b0b8-75b7-0859784d4617	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c0-b0b8-c7af-b74c9ea2a59d	Drzava-read	Drzava - branje	f
00030000-55c0-b0b8-7655-a70a052b67db	Drzava-write	Drzava - spreminjanje	f
00030000-55c0-b0b8-44b1-a01462f9a7e9	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c0-b0b8-3b74-b6eb556b04d0	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c0-b0b8-afd2-fea27408d7e8	Funkcija-read	Funkcija - branje	f
00030000-55c0-b0b8-2578-ed7203b8ab15	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c0-b0b8-f89f-a2e4ec5acf29	Gostovanje-read	Gostovanje - branje	f
00030000-55c0-b0b8-cc6d-e4d0dfb1362f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c0-b0b8-d966-2cdb6ffcc6c3	Gostujoca-read	Gostujoca - branje	f
00030000-55c0-b0b8-478a-67141c22213b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c0-b0b8-68ed-8605640ab956	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c0-b0b8-2b80-5080799e7466	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c0-b0b8-4184-527c2b48dfdc	Kupec-read	Kupec - branje	f
00030000-55c0-b0b8-a47d-57e7f1ca6a1e	Kupec-write	Kupec - spreminjanje	f
00030000-55c0-b0b8-60ce-d0252a468fcc	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c0-b0b8-90f9-b515e86e3098	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c0-b0b8-7671-2dc884778cfc	Option-read	Option - branje	f
00030000-55c0-b0b8-aa70-bc7b17f267c3	Option-write	Option - spreminjanje	f
00030000-55c0-b0b8-4a49-6e98cf3b97b0	OptionValue-read	OptionValue - branje	f
00030000-55c0-b0b8-545f-7ad8313b98ea	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c0-b0b8-c52b-4e4141309691	Oseba-read	Oseba - branje	f
00030000-55c0-b0b8-c0f0-731ba16fc109	Oseba-write	Oseba - spreminjanje	f
00030000-55c0-b0b8-6ebb-82938d2011cd	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c0-b0b8-fbc7-c64af0cc4935	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c0-b0b8-d7a8-4318aa4f7bd6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c0-b0b8-915f-1421e30fc025	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c0-b0b8-fe48-9d543856e05a	Pogodba-read	Pogodba - branje	f
00030000-55c0-b0b8-a460-d0231d55218d	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c0-b0b8-27e6-b9f8833105c4	Popa-read	Popa - branje	f
00030000-55c0-b0b8-3c0d-67b6a51ad135	Popa-write	Popa - spreminjanje	f
00030000-55c0-b0b8-9ec0-e8ff3715f9bb	Posta-read	Posta - branje	f
00030000-55c0-b0b8-1fa5-4f83a95e2463	Posta-write	Posta - spreminjanje	f
00030000-55c0-b0b8-8929-4d97b1798ca7	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c0-b0b8-c97f-1e39ce241047	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c0-b0b8-1950-76478f0e529d	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c0-b0b8-5324-d7812475084c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c0-b0b8-ede5-52f224eeeb9b	Predstava-read	Predstava - branje	f
00030000-55c0-b0b8-77f2-5d5b2463cc74	Predstava-write	Predstava - spreminjanje	f
00030000-55c0-b0b8-6524-758d775c2021	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c0-b0b8-4598-a5ca26fdac4a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c0-b0b8-0947-8299bac05b61	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c0-b0b8-d92b-dd40750ff9ff	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c0-b0b8-7010-bb45e2cd6b02	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c0-b0b8-8e16-18cff29086f1	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c0-b0b8-3f82-0744c8daa7b0	ProgramDela-read	ProgramDela - branje	f
00030000-55c0-b0b8-ecfe-18c429777507	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c0-b0b8-534c-4e4a45ad3978	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c0-b0b8-4408-b5919b580221	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c0-b0b8-abe6-a7f07749b287	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c0-b0b8-139a-96b9fd8f8079	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c0-b0b8-4c22-8feccb836699	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c0-b0b8-cff5-31fb03625b94	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c0-b0b8-1b74-6deb87d6c3d1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c0-b0b8-96b8-c96ea57da7e7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c0-b0b8-7fcd-d834f563b401	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c0-b0b8-863c-9dc6c2e14257	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c0-b0b8-a75b-446cede1bdfd	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c0-b0b8-49ee-14334a12f168	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c0-b0b8-879c-956d5d99d329	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c0-b0b8-bdc7-19b7d31c807c	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c0-b0b8-8da5-e1602307de9e	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c0-b0b8-60a2-4d2c3e83e4d1	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c0-b0b8-6a60-e157a16a8cfc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c0-b0b8-98b0-1898aaf54a19	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c0-b0b8-2071-b0023a989613	Prostor-read	Prostor - branje	f
00030000-55c0-b0b8-9598-6de139d47411	Prostor-write	Prostor - spreminjanje	f
00030000-55c0-b0b8-9523-4130807f4122	Racun-read	Racun - branje	f
00030000-55c0-b0b8-6631-d948b3c2c90e	Racun-write	Racun - spreminjanje	f
00030000-55c0-b0b8-dc1e-0291218872a6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c0-b0b8-1ccd-00f6fc1566da	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c0-b0b8-4832-da6d9279bea9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c0-b0b8-4459-3e89af90c2e5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c0-b0b8-d2aa-62d85a52a751	Rekvizit-read	Rekvizit - branje	f
00030000-55c0-b0b8-9ba2-8f5d884d9cf2	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c0-b0b8-46e3-c6b472085280	Revizija-read	Revizija - branje	f
00030000-55c0-b0b8-e32c-3af842e35ae4	Revizija-write	Revizija - spreminjanje	f
00030000-55c0-b0b8-352c-555f4e3bc408	Rezervacija-read	Rezervacija - branje	f
00030000-55c0-b0b8-04d3-6b8ca3ed723d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c0-b0b8-b7b5-47f9d0f106e2	SedezniRed-read	SedezniRed - branje	f
00030000-55c0-b0b8-54f5-b8ae47c18142	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c0-b0b8-e040-1beaf7a9fef1	Sedez-read	Sedez - branje	f
00030000-55c0-b0b8-4a43-822d11733082	Sedez-write	Sedez - spreminjanje	f
00030000-55c0-b0b8-d977-84935f37453b	Sezona-read	Sezona - branje	f
00030000-55c0-b0b8-ee44-fc1193a8e167	Sezona-write	Sezona - spreminjanje	f
00030000-55c0-b0b8-599f-e1259d8385a3	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c0-b0b8-5e24-14e338433810	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c0-b0b8-4773-55cd689e5d3b	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c0-b0b8-7a48-67507b070093	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c0-b0b8-b831-73f90d29ae8c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c0-b0b8-bfeb-9de8ddb0f2df	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c0-b0b8-3802-8e7dde3274c5	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c0-b0b8-d513-4f245982cc53	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c0-b0b8-c761-401a4e5488bd	Telefonska-read	Telefonska - branje	f
00030000-55c0-b0b8-3c26-d092279497de	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c0-b0b8-8313-327f859b6dab	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c0-b0b8-f450-1617af2ab5d9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c0-b0b8-88c6-17e77150f92c	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c0-b0b8-e149-56a4143a2466	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c0-b0b8-e857-40088f7c8a2c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c0-b0b8-2cae-4acca0efcea4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c0-b0b8-3578-8534bf0ca953	Trr-read	Trr - branje	f
00030000-55c0-b0b8-4acc-9856e94b8422	Trr-write	Trr - spreminjanje	f
00030000-55c0-b0b8-aec1-a5dc1607490d	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c0-b0b8-d3b0-50b37813f41e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c0-b0b8-04da-c7f736e934d4	Vaja-read	Vaja - branje	f
00030000-55c0-b0b8-1a88-67371e49325c	Vaja-write	Vaja - spreminjanje	f
00030000-55c0-b0b8-8215-56dcbd81cbec	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c0-b0b8-d5d5-b7517e8cfefa	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c0-b0b8-cbf9-4dd3385180ec	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c0-b0b8-985b-031d3e24d91f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c0-b0b8-0b83-3732bfda608d	Zasedenost-read	Zasedenost - branje	f
00030000-55c0-b0b8-d8e5-6d2ebbb3bdc9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c0-b0b8-efcd-f7e1d70d1800	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c0-b0b8-2b4f-19274f778c13	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c0-b0b8-6bd6-c47a67128000	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c0-b0b8-448d-6403b8813351	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c0-b0b8-3e68-9167eff0471a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c0-b0b8-6281-fa3e414ffa5f	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c0-b0b8-be01-79bbe6c2fa0a	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c0-b0b8-06ce-6165fd7fad88	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c0-b0b8-3d8d-e6ddd8323b21	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c0-b0b8-de20-32d5a98fba15	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c0-b0b8-a68a-93d70c6e160f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c0-b0b8-32ff-d8e779dbba8a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c0-b0b8-8da1-b03a62bdd9bc	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c0-b0b8-9d27-81055361375c	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c0-b0b8-1836-176507fb113e	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c0-b0b8-d86f-655e1c15c2c3	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2972 (class 0 OID 11734887)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c0-b0b8-141a-e4f8b2660ca2	00030000-55c0-b0b8-f0c9-da571b710691
00020000-55c0-b0b8-cfd5-5363d93fdae7	00030000-55c0-b0b8-c7af-b74c9ea2a59d
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-5cff-f1c9dda824e2
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-50bc-186e84b74fdf
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-8c07-ee7ba6e3b2d4
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-6cfb-211b524ae8a4
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-54c8-81957002c9ab
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-60b1-e014de7dc39e
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-f8f1-e7c0decff2d6
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-0fe3-d0e7a9ca0673
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-c7af-b74c9ea2a59d
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-7655-a70a052b67db
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-afd2-fea27408d7e8
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-2578-ed7203b8ab15
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-f89f-a2e4ec5acf29
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-cc6d-e4d0dfb1362f
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-d966-2cdb6ffcc6c3
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-478a-67141c22213b
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-68ed-8605640ab956
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-2b80-5080799e7466
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-7671-2dc884778cfc
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-4a49-6e98cf3b97b0
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-c52b-4e4141309691
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-c0f0-731ba16fc109
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-27e6-b9f8833105c4
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-3c0d-67b6a51ad135
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-9ec0-e8ff3715f9bb
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-1fa5-4f83a95e2463
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-1950-76478f0e529d
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-5324-d7812475084c
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-ede5-52f224eeeb9b
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-77f2-5d5b2463cc74
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-7010-bb45e2cd6b02
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-8e16-18cff29086f1
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-2071-b0023a989613
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-9598-6de139d47411
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-4832-da6d9279bea9
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-4459-3e89af90c2e5
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-d2aa-62d85a52a751
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-9ba2-8f5d884d9cf2
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-d977-84935f37453b
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-ee44-fc1193a8e167
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-88c6-17e77150f92c
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-aec1-a5dc1607490d
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-d3b0-50b37813f41e
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-04da-c7f736e934d4
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-1a88-67371e49325c
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-0b83-3732bfda608d
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-d8e5-6d2ebbb3bdc9
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-efcd-f7e1d70d1800
00020000-55c0-b0b8-8fc5-ea4d9527483a	00030000-55c0-b0b8-6bd6-c47a67128000
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-5cff-f1c9dda824e2
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-54c8-81957002c9ab
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-60b1-e014de7dc39e
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-c7af-b74c9ea2a59d
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-f89f-a2e4ec5acf29
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-d966-2cdb6ffcc6c3
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-68ed-8605640ab956
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-2b80-5080799e7466
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-7671-2dc884778cfc
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-4a49-6e98cf3b97b0
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-c52b-4e4141309691
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-c0f0-731ba16fc109
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-27e6-b9f8833105c4
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-9ec0-e8ff3715f9bb
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-1950-76478f0e529d
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-5324-d7812475084c
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-ede5-52f224eeeb9b
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-2071-b0023a989613
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-4832-da6d9279bea9
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-d2aa-62d85a52a751
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-d977-84935f37453b
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-c761-401a4e5488bd
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-3c26-d092279497de
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-3578-8534bf0ca953
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-4acc-9856e94b8422
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-cbf9-4dd3385180ec
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-985b-031d3e24d91f
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-efcd-f7e1d70d1800
00020000-55c0-b0b8-77f3-c5f97de805f6	00030000-55c0-b0b8-6bd6-c47a67128000
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-5cff-f1c9dda824e2
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-8c07-ee7ba6e3b2d4
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-54c8-81957002c9ab
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-564d-47beb35925d2
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-0330-d6b0c188c797
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-03ce-f66ab0cb4b9e
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-60b1-e014de7dc39e
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-c7af-b74c9ea2a59d
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-afd2-fea27408d7e8
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-f89f-a2e4ec5acf29
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-d966-2cdb6ffcc6c3
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-68ed-8605640ab956
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-7671-2dc884778cfc
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-4a49-6e98cf3b97b0
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-c52b-4e4141309691
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-27e6-b9f8833105c4
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-9ec0-e8ff3715f9bb
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-ede5-52f224eeeb9b
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-7010-bb45e2cd6b02
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-2071-b0023a989613
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-4832-da6d9279bea9
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-d2aa-62d85a52a751
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-d977-84935f37453b
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-88c6-17e77150f92c
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-04da-c7f736e934d4
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-0b83-3732bfda608d
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-efcd-f7e1d70d1800
00020000-55c0-b0b8-2dae-017426d37141	00030000-55c0-b0b8-6bd6-c47a67128000
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-5cff-f1c9dda824e2
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-50bc-186e84b74fdf
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-6cfb-211b524ae8a4
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-54c8-81957002c9ab
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-60b1-e014de7dc39e
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-c7af-b74c9ea2a59d
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-f89f-a2e4ec5acf29
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-d966-2cdb6ffcc6c3
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-7671-2dc884778cfc
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-4a49-6e98cf3b97b0
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-27e6-b9f8833105c4
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-9ec0-e8ff3715f9bb
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-ede5-52f224eeeb9b
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-2071-b0023a989613
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-4832-da6d9279bea9
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-d2aa-62d85a52a751
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-d977-84935f37453b
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-88c6-17e77150f92c
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-efcd-f7e1d70d1800
00020000-55c0-b0b8-19f9-23345391c8df	00030000-55c0-b0b8-6bd6-c47a67128000
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-5cff-f1c9dda824e2
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-54c8-81957002c9ab
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-60b1-e014de7dc39e
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-c7af-b74c9ea2a59d
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-f89f-a2e4ec5acf29
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-d966-2cdb6ffcc6c3
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-7671-2dc884778cfc
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-4a49-6e98cf3b97b0
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-27e6-b9f8833105c4
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-9ec0-e8ff3715f9bb
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-ede5-52f224eeeb9b
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-2071-b0023a989613
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-4832-da6d9279bea9
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-d2aa-62d85a52a751
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-d977-84935f37453b
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-8313-327f859b6dab
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-7962-3f96ec5d0e43
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-88c6-17e77150f92c
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-efcd-f7e1d70d1800
00020000-55c0-b0b8-2bf6-2cfc97f376d7	00030000-55c0-b0b8-6bd6-c47a67128000
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-8d90-9ec011cef9bb
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-f0c9-da571b710691
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-7962-3f96ec5d0e43
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-f8f1-e7c0decff2d6
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-ec9b-0f92a3288fa8
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-498b-829f0db68b3d
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-5cff-f1c9dda824e2
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-50bc-186e84b74fdf
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-8c07-ee7ba6e3b2d4
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-6cfb-211b524ae8a4
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-54c8-81957002c9ab
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-564d-47beb35925d2
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-0330-d6b0c188c797
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-08e3-55cb47292182
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-03ce-f66ab0cb4b9e
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-3a59-db2c001f352b
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-60b1-e014de7dc39e
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-0fe3-d0e7a9ca0673
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-c7af-b74c9ea2a59d
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-7655-a70a052b67db
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-1898-ed507148fd47
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-75b7-0859784d4617
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-44b1-a01462f9a7e9
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-3b74-b6eb556b04d0
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-afd2-fea27408d7e8
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-2578-ed7203b8ab15
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-f89f-a2e4ec5acf29
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-cc6d-e4d0dfb1362f
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d966-2cdb6ffcc6c3
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-478a-67141c22213b
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-68ed-8605640ab956
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-2b80-5080799e7466
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4184-527c2b48dfdc
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-a47d-57e7f1ca6a1e
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-60ce-d0252a468fcc
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-90f9-b515e86e3098
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-7671-2dc884778cfc
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-aa70-bc7b17f267c3
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4a49-6e98cf3b97b0
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-545f-7ad8313b98ea
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-c52b-4e4141309691
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-c0f0-731ba16fc109
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-6ebb-82938d2011cd
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-fbc7-c64af0cc4935
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d7a8-4318aa4f7bd6
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-915f-1421e30fc025
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-fe48-9d543856e05a
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-a460-d0231d55218d
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-27e6-b9f8833105c4
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-3c0d-67b6a51ad135
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-9ec0-e8ff3715f9bb
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-1fa5-4f83a95e2463
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-8929-4d97b1798ca7
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-c97f-1e39ce241047
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-1950-76478f0e529d
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-5324-d7812475084c
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-ede5-52f224eeeb9b
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-77f2-5d5b2463cc74
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-6524-758d775c2021
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4598-a5ca26fdac4a
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-0947-8299bac05b61
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d92b-dd40750ff9ff
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-7010-bb45e2cd6b02
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-8e16-18cff29086f1
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-3f82-0744c8daa7b0
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-ecfe-18c429777507
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-534c-4e4a45ad3978
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4408-b5919b580221
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-abe6-a7f07749b287
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-139a-96b9fd8f8079
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4c22-8feccb836699
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-cff5-31fb03625b94
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-1b74-6deb87d6c3d1
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-96b8-c96ea57da7e7
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-7fcd-d834f563b401
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-863c-9dc6c2e14257
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-a75b-446cede1bdfd
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-49ee-14334a12f168
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-879c-956d5d99d329
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-bdc7-19b7d31c807c
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-8da5-e1602307de9e
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-60a2-4d2c3e83e4d1
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-6a60-e157a16a8cfc
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-98b0-1898aaf54a19
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-2071-b0023a989613
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-9598-6de139d47411
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-9523-4130807f4122
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-6631-d948b3c2c90e
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-dc1e-0291218872a6
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-1ccd-00f6fc1566da
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4832-da6d9279bea9
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4459-3e89af90c2e5
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d2aa-62d85a52a751
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-9ba2-8f5d884d9cf2
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-46e3-c6b472085280
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-e32c-3af842e35ae4
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-352c-555f4e3bc408
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-04d3-6b8ca3ed723d
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-b7b5-47f9d0f106e2
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-54f5-b8ae47c18142
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-e040-1beaf7a9fef1
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4a43-822d11733082
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d977-84935f37453b
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-ee44-fc1193a8e167
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-599f-e1259d8385a3
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-5e24-14e338433810
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4773-55cd689e5d3b
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-7a48-67507b070093
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-b831-73f90d29ae8c
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-bfeb-9de8ddb0f2df
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-3802-8e7dde3274c5
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d513-4f245982cc53
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-c761-401a4e5488bd
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-3c26-d092279497de
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-8313-327f859b6dab
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-f450-1617af2ab5d9
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-88c6-17e77150f92c
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-e149-56a4143a2466
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-e857-40088f7c8a2c
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-2cae-4acca0efcea4
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-3578-8534bf0ca953
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-4acc-9856e94b8422
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-aec1-a5dc1607490d
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d3b0-50b37813f41e
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-04da-c7f736e934d4
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-1a88-67371e49325c
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-8215-56dcbd81cbec
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d5d5-b7517e8cfefa
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-cbf9-4dd3385180ec
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-985b-031d3e24d91f
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-0b83-3732bfda608d
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-d8e5-6d2ebbb3bdc9
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-efcd-f7e1d70d1800
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-2b4f-19274f778c13
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-6bd6-c47a67128000
00020000-55c0-b0ba-2bb6-cb404e8b4daa	00030000-55c0-b0b8-448d-6403b8813351
\.


--
-- TOC entry 3000 (class 0 OID 11735186)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11735217)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 11735331)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c0-b0ba-e9db-f274ef6c764c	00090000-55c0-b0ba-7479-7e241b7eb6a0	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c0-b0ba-2082-59b6bbbc4144	00090000-55c0-b0ba-3442-f0f888a8ee68	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c0-b0ba-90e7-8a800aacc30b	00090000-55c0-b0ba-ae0d-691a66746d9d	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2977 (class 0 OID 11734947)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c0-b0ba-b733-f600ef165cb0	00040000-55c0-b0b8-857c-6b4007ff9e54	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-b0ba-8ca1-753485a65a67	00040000-55c0-b0b8-857c-6b4007ff9e54	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c0-b0ba-5cd0-d1e2d4d30233	00040000-55c0-b0b8-857c-6b4007ff9e54	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-b0ba-09f1-863707c5b8c9	00040000-55c0-b0b8-857c-6b4007ff9e54	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-b0ba-b933-5bacf2f4fb70	00040000-55c0-b0b8-857c-6b4007ff9e54	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-b0ba-e3a4-67cdc01018d2	00040000-55c0-b0b8-a97a-4ba36206b5ed	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-b0ba-95db-04aa69eecfa7	00040000-55c0-b0b8-b3f2-1677dd4bfdcf	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-b0ba-0af9-6f7e8dd6cf97	00040000-55c0-b0b8-9a31-554ca5252e97	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-b0ba-105d-586049361b47	00040000-55c0-b0b8-857c-6b4007ff9e54	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2979 (class 0 OID 11734982)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c0-b0b8-a13f-e3aefb8a7865	8341	Adlešiči
00050000-55c0-b0b8-2e3b-92731b1fd0ef	5270	Ajdovščina
00050000-55c0-b0b8-7450-a78c9322aa26	6280	Ankaran/Ancarano
00050000-55c0-b0b8-c131-bdc23c6b2cef	9253	Apače
00050000-55c0-b0b8-0fef-5d65f6e9a60a	8253	Artiče
00050000-55c0-b0b8-dcd1-70177824f490	4275	Begunje na Gorenjskem
00050000-55c0-b0b8-b27d-16a2f91f3551	1382	Begunje pri Cerknici
00050000-55c0-b0b8-4d9b-1eee7b3db26d	9231	Beltinci
00050000-55c0-b0b8-6071-70105eae628c	2234	Benedikt
00050000-55c0-b0b8-6014-cb65379e579a	2345	Bistrica ob Dravi
00050000-55c0-b0b8-80bb-e27018ed7dc3	3256	Bistrica ob Sotli
00050000-55c0-b0b8-673a-df985421d3af	8259	Bizeljsko
00050000-55c0-b0b8-29e4-43af6552cc22	1223	Blagovica
00050000-55c0-b0b8-97f5-3b949fe790d8	8283	Blanca
00050000-55c0-b0b8-af28-3bd464bd06da	4260	Bled
00050000-55c0-b0b8-985b-a9558ea7eb96	4273	Blejska Dobrava
00050000-55c0-b0b8-691e-08fe2ad36366	9265	Bodonci
00050000-55c0-b0b8-c97f-00e5e8f92315	9222	Bogojina
00050000-55c0-b0b8-05b3-da4f4bd5240d	4263	Bohinjska Bela
00050000-55c0-b0b8-edda-62b8165dcd03	4264	Bohinjska Bistrica
00050000-55c0-b0b8-680a-af0be51044ba	4265	Bohinjsko jezero
00050000-55c0-b0b8-53fd-58fd093406d3	1353	Borovnica
00050000-55c0-b0b8-80a0-36b345a64cd5	8294	Boštanj
00050000-55c0-b0b8-18dc-dc099ec84f90	5230	Bovec
00050000-55c0-b0b8-ac94-8693e39e62c6	5295	Branik
00050000-55c0-b0b8-49e6-69f975a3e306	3314	Braslovče
00050000-55c0-b0b8-bfe7-4524e8232de0	5223	Breginj
00050000-55c0-b0b8-50e6-33a7d881355f	8280	Brestanica
00050000-55c0-b0b8-dbd5-bbb70ae293c9	2354	Bresternica
00050000-55c0-b0b8-8e44-17dcd9bb638e	4243	Brezje
00050000-55c0-b0b8-0ac2-356515f92026	1351	Brezovica pri Ljubljani
00050000-55c0-b0b8-2ada-3f199f43f109	8250	Brežice
00050000-55c0-b0b8-c0f8-dc3f8761b315	4210	Brnik - Aerodrom
00050000-55c0-b0b8-084e-74838f417bd8	8321	Brusnice
00050000-55c0-b0b8-057d-0a67738edcc2	3255	Buče
00050000-55c0-b0b8-ad90-ca8210338e40	8276	Bučka 
00050000-55c0-b0b8-c146-ceeb65a9c26e	9261	Cankova
00050000-55c0-b0b8-26ef-3380313e5b33	3000	Celje 
00050000-55c0-b0b8-e14e-c920b16b04cb	3001	Celje - poštni predali
00050000-55c0-b0b8-64c6-46b635c774ab	4207	Cerklje na Gorenjskem
00050000-55c0-b0b8-d87f-442ef6539360	8263	Cerklje ob Krki
00050000-55c0-b0b8-f3a6-6a2f32546f01	1380	Cerknica
00050000-55c0-b0b8-7472-002bc13a24b6	5282	Cerkno
00050000-55c0-b0b8-0e5c-06011414788b	2236	Cerkvenjak
00050000-55c0-b0b8-bdb7-e00911303a31	2215	Ceršak
00050000-55c0-b0b9-d357-aa28bf59c544	2326	Cirkovce
00050000-55c0-b0b9-2b2a-a00e47a4e84e	2282	Cirkulane
00050000-55c0-b0b9-b14c-ef0072ec5d3b	5273	Col
00050000-55c0-b0b9-e233-9347ea3e19c7	8251	Čatež ob Savi
00050000-55c0-b0b9-26a4-92e758ae8232	1413	Čemšenik
00050000-55c0-b0b9-7823-99fa073b374f	5253	Čepovan
00050000-55c0-b0b9-40cf-e4e665587b84	9232	Črenšovci
00050000-55c0-b0b9-bba8-c79a8fdd0413	2393	Črna na Koroškem
00050000-55c0-b0b9-bccf-91e153f87680	6275	Črni Kal
00050000-55c0-b0b9-a40c-5897d9cc8954	5274	Črni Vrh nad Idrijo
00050000-55c0-b0b9-76d8-a36478e956c0	5262	Črniče
00050000-55c0-b0b9-8950-bb6df3726c5f	8340	Črnomelj
00050000-55c0-b0b9-f074-052fbb8ae2d5	6271	Dekani
00050000-55c0-b0b9-6074-02f4c7759d9d	5210	Deskle
00050000-55c0-b0b9-dea8-9f3c8afcd273	2253	Destrnik
00050000-55c0-b0b9-473a-a5de5993deb3	6215	Divača
00050000-55c0-b0b9-63ed-3b96b5b572c6	1233	Dob
00050000-55c0-b0b9-32cd-595d5a51dccb	3224	Dobje pri Planini
00050000-55c0-b0b9-e543-ad2dcaacb317	8257	Dobova
00050000-55c0-b0b9-2a3c-fe4b199f8a30	1423	Dobovec
00050000-55c0-b0b9-febb-9a91ba9c746e	5263	Dobravlje
00050000-55c0-b0b9-2329-ee6a9f81df44	3204	Dobrna
00050000-55c0-b0b9-745c-e672d5ebf50b	8211	Dobrnič
00050000-55c0-b0b9-2bf4-9f74e8c34c2b	1356	Dobrova
00050000-55c0-b0b9-3cd4-17b4581bf687	9223	Dobrovnik/Dobronak 
00050000-55c0-b0b9-d831-3143e8b85c01	5212	Dobrovo v Brdih
00050000-55c0-b0b9-9037-3202cb8e42d3	1431	Dol pri Hrastniku
00050000-55c0-b0b9-139e-c6c4ad690f98	1262	Dol pri Ljubljani
00050000-55c0-b0b9-7147-4e8d2c07e993	1273	Dole pri Litiji
00050000-55c0-b0b9-3453-6a314a309931	1331	Dolenja vas
00050000-55c0-b0b9-1363-f7748a95009f	8350	Dolenjske Toplice
00050000-55c0-b0b9-299f-792a7dca1e49	1230	Domžale
00050000-55c0-b0b9-ae07-4bb704124d2d	2252	Dornava
00050000-55c0-b0b9-ca73-24f839420c00	5294	Dornberk
00050000-55c0-b0b9-48a1-d4d0e3f6561c	1319	Draga
00050000-55c0-b0b9-419a-90424bf25ac2	8343	Dragatuš
00050000-55c0-b0b9-9370-a30ca4c1a29b	3222	Dramlje
00050000-55c0-b0b9-0c9e-adf815cc6eeb	2370	Dravograd
00050000-55c0-b0b9-bcc8-8604f05db8ba	4203	Duplje
00050000-55c0-b0b9-a443-dc6b72c48a76	6221	Dutovlje
00050000-55c0-b0b9-2aa8-e4431005e1b9	8361	Dvor
00050000-55c0-b0b9-eaf0-4e04eb65ce98	2343	Fala
00050000-55c0-b0b9-bed8-b04c2d5a0425	9208	Fokovci
00050000-55c0-b0b9-34f2-5d5074bbf8b1	2313	Fram
00050000-55c0-b0b9-602b-8ad54baeff56	3213	Frankolovo
00050000-55c0-b0b9-8155-b4795f916486	1274	Gabrovka
00050000-55c0-b0b9-5b56-79749e5b5808	8254	Globoko
00050000-55c0-b0b9-111f-2cb5835e23be	5275	Godovič
00050000-55c0-b0b9-e5ed-cd8f19f8504d	4204	Golnik
00050000-55c0-b0b9-6f79-a59c851da1d3	3303	Gomilsko
00050000-55c0-b0b9-d48f-e606c36753a5	4224	Gorenja vas
00050000-55c0-b0b9-2cc8-0d2c48bd0f12	3263	Gorica pri Slivnici
00050000-55c0-b0b9-18c7-aef8cb72ff7f	2272	Gorišnica
00050000-55c0-b0b9-bc53-2f8360bb9cd3	9250	Gornja Radgona
00050000-55c0-b0b9-718e-af5cc62f4225	3342	Gornji Grad
00050000-55c0-b0b9-8556-d1ac500cea85	4282	Gozd Martuljek
00050000-55c0-b0b9-cf9a-1d2d144c3445	6272	Gračišče
00050000-55c0-b0b9-b361-f9af603db203	9264	Grad
00050000-55c0-b0b9-cd6b-5fa29a8bae34	8332	Gradac
00050000-55c0-b0b9-8062-48f191cb2236	1384	Grahovo
00050000-55c0-b0b9-74f2-e26d5483d585	5242	Grahovo ob Bači
00050000-55c0-b0b9-38db-01bbe85406f1	5251	Grgar
00050000-55c0-b0b9-74f8-f275a89f5cda	3302	Griže
00050000-55c0-b0b9-9150-fa5c44f226b2	3231	Grobelno
00050000-55c0-b0b9-96a6-be68d95c6a7f	1290	Grosuplje
00050000-55c0-b0b9-ce82-fd7df856f6c5	2288	Hajdina
00050000-55c0-b0b9-75fe-06867c3f8e23	8362	Hinje
00050000-55c0-b0b9-d7eb-110267f52f54	2311	Hoče
00050000-55c0-b0b9-90e9-4fff5f135772	9205	Hodoš/Hodos
00050000-55c0-b0b9-d019-20e2683076c2	1354	Horjul
00050000-55c0-b0b9-156d-f0220914c648	1372	Hotedršica
00050000-55c0-b0b9-b0cf-ad89cde69dad	1430	Hrastnik
00050000-55c0-b0b9-71df-b8a20eb240f5	6225	Hruševje
00050000-55c0-b0b9-d6ee-2c3babf80104	4276	Hrušica
00050000-55c0-b0b9-72ea-43615ee979db	5280	Idrija
00050000-55c0-b0b9-b690-4c1adf47e361	1292	Ig
00050000-55c0-b0b9-e5ab-b8a8dfc0f64e	6250	Ilirska Bistrica
00050000-55c0-b0b9-0c61-62f16bd07fb9	6251	Ilirska Bistrica-Trnovo
00050000-55c0-b0b9-2b8f-ba1ff3311b47	1295	Ivančna Gorica
00050000-55c0-b0b9-963c-d417184db2f0	2259	Ivanjkovci
00050000-55c0-b0b9-6ec4-b6d7cf296a5b	1411	Izlake
00050000-55c0-b0b9-639f-aa0871551ef1	6310	Izola/Isola
00050000-55c0-b0b9-1d4a-3db169f1cdff	2222	Jakobski Dol
00050000-55c0-b0b9-8c29-cbf839cdbe5d	2221	Jarenina
00050000-55c0-b0b9-6617-e431201f880b	6254	Jelšane
00050000-55c0-b0b9-14e1-97a12fd565a5	4270	Jesenice
00050000-55c0-b0b9-55d1-db44649a895f	8261	Jesenice na Dolenjskem
00050000-55c0-b0b9-c666-2c5cea92dcca	3273	Jurklošter
00050000-55c0-b0b9-592f-300792443ab3	2223	Jurovski Dol
00050000-55c0-b0b9-eefe-20d75c219c9c	2256	Juršinci
00050000-55c0-b0b9-3b01-8b406be27a8b	5214	Kal nad Kanalom
00050000-55c0-b0b9-8a62-b8f36222d3f0	3233	Kalobje
00050000-55c0-b0b9-0572-e704f617ab49	4246	Kamna Gorica
00050000-55c0-b0b9-7bf8-e023a0195cd2	2351	Kamnica
00050000-55c0-b0b9-7fb7-64beab18a64e	1241	Kamnik
00050000-55c0-b0b9-c6d4-be412e825d8d	5213	Kanal
00050000-55c0-b0b9-f8fe-ad8b9274eaef	8258	Kapele
00050000-55c0-b0b9-b03e-b2571fbfda01	2362	Kapla
00050000-55c0-b0b9-635a-db16e92d76cc	2325	Kidričevo
00050000-55c0-b0b9-5cc0-29796c755116	1412	Kisovec
00050000-55c0-b0b9-2736-617fe96951e5	6253	Knežak
00050000-55c0-b0b9-9e1e-6e0133dd498b	5222	Kobarid
00050000-55c0-b0b9-01ad-365f45827eb2	9227	Kobilje
00050000-55c0-b0b9-6bd0-064553eccea6	1330	Kočevje
00050000-55c0-b0b9-b3c3-a0700d301f4b	1338	Kočevska Reka
00050000-55c0-b0b9-cfa5-d43a0fbd7b3f	2276	Kog
00050000-55c0-b0b9-0c83-114f75ece8a8	5211	Kojsko
00050000-55c0-b0b9-95ea-af23a5e78528	6223	Komen
00050000-55c0-b0b9-445b-126b2053a08c	1218	Komenda
00050000-55c0-b0b9-43b1-7a688f42a347	6000	Koper/Capodistria 
00050000-55c0-b0b9-3d09-115c58064429	6001	Koper/Capodistria - poštni predali
00050000-55c0-b0b9-ffdd-9494487ea014	8282	Koprivnica
00050000-55c0-b0b9-7523-0db5e86fef96	5296	Kostanjevica na Krasu
00050000-55c0-b0b9-0e11-2abd55b47527	8311	Kostanjevica na Krki
00050000-55c0-b0b9-51a6-52f82bfe4215	1336	Kostel
00050000-55c0-b0b9-9d33-6a3b395c8e5a	6256	Košana
00050000-55c0-b0b9-d2df-86529cb2a797	2394	Kotlje
00050000-55c0-b0b9-b721-3cca6fa4f170	6240	Kozina
00050000-55c0-b0b9-e1e7-36379104ada6	3260	Kozje
00050000-55c0-b0b9-469f-2f894655b617	4000	Kranj 
00050000-55c0-b0b9-3669-db41b275b7c5	4001	Kranj - poštni predali
00050000-55c0-b0b9-94e6-c4ea6b0f17b1	4280	Kranjska Gora
00050000-55c0-b0b9-aa1b-cb594b581a01	1281	Kresnice
00050000-55c0-b0b9-a7fd-519b65ac9e52	4294	Križe
00050000-55c0-b0b9-1c56-5e879f6b77f1	9206	Križevci
00050000-55c0-b0b9-3525-fd60fdef4168	9242	Križevci pri Ljutomeru
00050000-55c0-b0b9-3d59-8137f282d258	1301	Krka
00050000-55c0-b0b9-00e8-dac5a3e9a1ab	8296	Krmelj
00050000-55c0-b0b9-38ee-3a23fe646cf2	4245	Kropa
00050000-55c0-b0b9-335f-f4597658dbae	8262	Krška vas
00050000-55c0-b0b9-d2d8-2b55a4305e00	8270	Krško
00050000-55c0-b0b9-75e7-0d16a2a42bdd	9263	Kuzma
00050000-55c0-b0b9-aaef-9412c4868f3f	2318	Laporje
00050000-55c0-b0b9-c2b7-7e38c0a42bf1	3270	Laško
00050000-55c0-b0b9-b74f-8bd664430569	1219	Laze v Tuhinju
00050000-55c0-b0b9-ac39-8d4b51c76296	2230	Lenart v Slovenskih goricah
00050000-55c0-b0b9-9328-57c71805d36e	9220	Lendava/Lendva
00050000-55c0-b0b9-7349-e55039d12498	4248	Lesce
00050000-55c0-b0b9-74b2-3caf2c73e780	3261	Lesično
00050000-55c0-b0b9-ff63-239d23874109	8273	Leskovec pri Krškem
00050000-55c0-b0b9-0c55-d686f4a5b106	2372	Libeliče
00050000-55c0-b0b9-81b9-6f0c24588cf5	2341	Limbuš
00050000-55c0-b0b9-0bc8-5eff9487594a	1270	Litija
00050000-55c0-b0b9-ce87-ff3e7ef69505	3202	Ljubečna
00050000-55c0-b0b9-1ec8-c664b789b0b1	1000	Ljubljana 
00050000-55c0-b0b9-6c1d-cd3e73937746	1001	Ljubljana - poštni predali
00050000-55c0-b0b9-8c73-2b0f9aff88ac	1231	Ljubljana - Črnuče
00050000-55c0-b0b9-557c-66dee797f8f5	1261	Ljubljana - Dobrunje
00050000-55c0-b0b9-4b28-039b921e9180	1260	Ljubljana - Polje
00050000-55c0-b0b9-b635-ad4e2c1add1a	1210	Ljubljana - Šentvid
00050000-55c0-b0b9-9f28-7343521637cc	1211	Ljubljana - Šmartno
00050000-55c0-b0b9-67ba-5ac07a5cf7b7	3333	Ljubno ob Savinji
00050000-55c0-b0b9-818f-77fd966f1a1a	9240	Ljutomer
00050000-55c0-b0b9-8b48-5a2bf5bafff1	3215	Loče
00050000-55c0-b0b9-8f26-ba0781836b20	5231	Log pod Mangartom
00050000-55c0-b0b9-3647-4435775dd9e7	1358	Log pri Brezovici
00050000-55c0-b0b9-f03e-4ba647d6b227	1370	Logatec
00050000-55c0-b0b9-4e73-86697de309f3	1371	Logatec
00050000-55c0-b0b9-79a5-c7167621d2b9	1434	Loka pri Zidanem Mostu
00050000-55c0-b0b9-69c5-465dcc39c3c2	3223	Loka pri Žusmu
00050000-55c0-b0b9-4647-dc53ff46dc43	6219	Lokev
00050000-55c0-b0b9-482a-f319984a5049	1318	Loški Potok
00050000-55c0-b0b9-8454-ad2c978d9556	2324	Lovrenc na Dravskem polju
00050000-55c0-b0b9-d6ae-7159e8997048	2344	Lovrenc na Pohorju
00050000-55c0-b0b9-7d90-e67786b85a7b	3334	Luče
00050000-55c0-b0b9-bd31-f50f9f22bca1	1225	Lukovica
00050000-55c0-b0b9-d22f-fd1d9cf1e317	9202	Mačkovci
00050000-55c0-b0b9-8adf-8b05a9ee39fd	2322	Majšperk
00050000-55c0-b0b9-0099-b4de46d431a3	2321	Makole
00050000-55c0-b0b9-9871-0c8fbc0964ba	9243	Mala Nedelja
00050000-55c0-b0b9-3ea3-2634c6a9b824	2229	Malečnik
00050000-55c0-b0b9-8dc9-32df2e846d65	6273	Marezige
00050000-55c0-b0b9-092e-ba321055cc3e	2000	Maribor 
00050000-55c0-b0b9-8242-5bc6f8818ee2	2001	Maribor - poštni predali
00050000-55c0-b0b9-f072-987129e5b371	2206	Marjeta na Dravskem polju
00050000-55c0-b0b9-ce43-2f7eb02c24e6	2281	Markovci
00050000-55c0-b0b9-080f-aa77ef6f18db	9221	Martjanci
00050000-55c0-b0b9-bbf8-9f6f235f29f4	6242	Materija
00050000-55c0-b0b9-4196-63e6d8af333a	4211	Mavčiče
00050000-55c0-b0b9-177f-daefb1f4a890	1215	Medvode
00050000-55c0-b0b9-a6ad-c21b82525785	1234	Mengeš
00050000-55c0-b0b9-d2a7-8a9b3aba6994	8330	Metlika
00050000-55c0-b0b9-b53a-5effcc879e34	2392	Mežica
00050000-55c0-b0b9-d375-63944660a7cb	2204	Miklavž na Dravskem polju
00050000-55c0-b0b9-7b95-4e07456b00a0	2275	Miklavž pri Ormožu
00050000-55c0-b0b9-7608-0ae226d168b5	5291	Miren
00050000-55c0-b0b9-caf7-43a4cff13389	8233	Mirna
00050000-55c0-b0b9-7324-604a41a1f764	8216	Mirna Peč
00050000-55c0-b0b9-58b8-b5c321643e23	2382	Mislinja
00050000-55c0-b0b9-26d7-918a7b6a54db	4281	Mojstrana
00050000-55c0-b0b9-62db-ca13a3755b72	8230	Mokronog
00050000-55c0-b0b9-109c-82b3a9777ebe	1251	Moravče
00050000-55c0-b0b9-8b0f-c130627e3e5f	9226	Moravske Toplice
00050000-55c0-b0b9-e374-088cddfa880e	5216	Most na Soči
00050000-55c0-b0b9-a02e-343fda20d6bb	1221	Motnik
00050000-55c0-b0b9-6923-5c0d3fc17978	3330	Mozirje
00050000-55c0-b0b9-d8d1-822fd067a357	9000	Murska Sobota 
00050000-55c0-b0b9-61f7-d2d48bef85aa	9001	Murska Sobota - poštni predali
00050000-55c0-b0b9-9c2a-0e4f20ae32e4	2366	Muta
00050000-55c0-b0b9-afa1-d73ee6f27617	4202	Naklo
00050000-55c0-b0b9-2817-c5e0677ff49d	3331	Nazarje
00050000-55c0-b0b9-22f3-743c616b8fa2	1357	Notranje Gorice
00050000-55c0-b0b9-ba37-9654101d1372	3203	Nova Cerkev
00050000-55c0-b0b9-a25c-b6bdd52bd8cb	5000	Nova Gorica 
00050000-55c0-b0b9-fb68-b2a7e59b93c4	5001	Nova Gorica - poštni predali
00050000-55c0-b0b9-0a70-cdea1d654ff6	1385	Nova vas
00050000-55c0-b0b9-26f3-e5547c883b98	8000	Novo mesto
00050000-55c0-b0b9-e101-1992ea924144	8001	Novo mesto - poštni predali
00050000-55c0-b0b9-1b18-223ba1a33aea	6243	Obrov
00050000-55c0-b0b9-9185-e95332aa33b7	9233	Odranci
00050000-55c0-b0b9-b72c-936aa7a88613	2317	Oplotnica
00050000-55c0-b0b9-f3a7-f87891cbde5c	2312	Orehova vas
00050000-55c0-b0b9-3eac-d4abe6ccdc36	2270	Ormož
00050000-55c0-b0b9-e4fb-7c6b6db8294e	1316	Ortnek
00050000-55c0-b0b9-32a3-5cea4580a4b4	1337	Osilnica
00050000-55c0-b0b9-7760-7c815feed5ce	8222	Otočec
00050000-55c0-b0b9-8c70-346a13e0bfd5	2361	Ožbalt
00050000-55c0-b0b9-5230-352f754b873e	2231	Pernica
00050000-55c0-b0b9-5e89-b0ef9f4facd6	2211	Pesnica pri Mariboru
00050000-55c0-b0b9-e811-2b8a2ea396c9	9203	Petrovci
00050000-55c0-b0b9-f1d8-503610051a95	3301	Petrovče
00050000-55c0-b0b9-fc08-be2e57f3016f	6330	Piran/Pirano
00050000-55c0-b0b9-8870-e9d1067188e9	8255	Pišece
00050000-55c0-b0b9-e839-616d58ede526	6257	Pivka
00050000-55c0-b0b9-e10c-6a21a6410fff	6232	Planina
00050000-55c0-b0b9-0233-6f107ec2f019	3225	Planina pri Sevnici
00050000-55c0-b0b9-f7dd-c5cbc179fa38	6276	Pobegi
00050000-55c0-b0b9-2b83-8dd262b31a08	8312	Podbočje
00050000-55c0-b0b9-2074-c4d281a6f399	5243	Podbrdo
00050000-55c0-b0b9-ea44-03b406a90b40	3254	Podčetrtek
00050000-55c0-b0b9-1fe2-f57ec592dabf	2273	Podgorci
00050000-55c0-b0b9-35f4-fedfa98a6d5e	6216	Podgorje
00050000-55c0-b0b9-7bec-4a1a1be8cd54	2381	Podgorje pri Slovenj Gradcu
00050000-55c0-b0b9-5dd8-3972caa8fe31	6244	Podgrad
00050000-55c0-b0b9-6370-125a6121cb4f	1414	Podkum
00050000-55c0-b0b9-ab5c-cebd5d2b09b0	2286	Podlehnik
00050000-55c0-b0b9-dada-8caba12a3756	5272	Podnanos
00050000-55c0-b0b9-f032-e7f7ab1a5369	4244	Podnart
00050000-55c0-b0b9-7e1c-249bc44c75ff	3241	Podplat
00050000-55c0-b0b9-1c2b-4c86b52c48a8	3257	Podsreda
00050000-55c0-b0b9-badf-8862a0cbb9bd	2363	Podvelka
00050000-55c0-b0b9-f16a-fc114fe56a1c	2208	Pohorje
00050000-55c0-b0b9-5166-7bb11f2f003d	2257	Polenšak
00050000-55c0-b0b9-b777-d4f84e756798	1355	Polhov Gradec
00050000-55c0-b0b9-25f8-ef77eb035590	4223	Poljane nad Škofjo Loko
00050000-55c0-b0b9-5089-665f30725fd5	2319	Poljčane
00050000-55c0-b0b9-cbd1-54a3616ef8d4	1272	Polšnik
00050000-55c0-b0b9-49ab-fd3363345389	3313	Polzela
00050000-55c0-b0b9-9eec-dc497500b489	3232	Ponikva
00050000-55c0-b0b9-4f36-6f201251aa2b	6320	Portorož/Portorose
00050000-55c0-b0b9-b37f-7a8b9677f743	6230	Postojna
00050000-55c0-b0b9-740b-72d253702951	2331	Pragersko
00050000-55c0-b0b9-0d5b-fad4001e8fb4	3312	Prebold
00050000-55c0-b0b9-8cbe-4d89024e5f8c	4205	Preddvor
00050000-55c0-b0b9-b3ea-2b1376761c8d	6255	Prem
00050000-55c0-b0b9-654a-e728800cc788	1352	Preserje
00050000-55c0-b0b9-0e45-adae5d25d369	6258	Prestranek
00050000-55c0-b0b9-6791-6421d8d33226	2391	Prevalje
00050000-55c0-b0b9-0653-8e7b512fcb43	3262	Prevorje
00050000-55c0-b0b9-4e1c-8ef6c5b8f86a	1276	Primskovo 
00050000-55c0-b0b9-2b61-551a3b110122	3253	Pristava pri Mestinju
00050000-55c0-b0b9-d077-2700faf71d9b	9207	Prosenjakovci/Partosfalva
00050000-55c0-b0b9-103b-60b58c965032	5297	Prvačina
00050000-55c0-b0b9-4dfa-529bc1eacbc8	2250	Ptuj
00050000-55c0-b0b9-c0b7-eff57ad58ca4	2323	Ptujska Gora
00050000-55c0-b0b9-16c1-5649866aed10	9201	Puconci
00050000-55c0-b0b9-1da9-99aa2958f72f	2327	Rače
00050000-55c0-b0b9-08b7-4d2779bad751	1433	Radeče
00050000-55c0-b0b9-c422-0a826ac259d4	9252	Radenci
00050000-55c0-b0b9-b9e8-b1845be140a8	2360	Radlje ob Dravi
00050000-55c0-b0b9-b89a-237b0bbcdd71	1235	Radomlje
00050000-55c0-b0b9-b76a-a7f95a0a3206	4240	Radovljica
00050000-55c0-b0b9-0e44-9084a9b00075	8274	Raka
00050000-55c0-b0b9-1396-fa4410ea8f51	1381	Rakek
00050000-55c0-b0b9-6ed4-122745ac8b1b	4283	Rateče - Planica
00050000-55c0-b0b9-85d8-6497c58890b7	2390	Ravne na Koroškem
00050000-55c0-b0b9-91b4-b6d871ce3adf	9246	Razkrižje
00050000-55c0-b0b9-0689-5d20f929cb26	3332	Rečica ob Savinji
00050000-55c0-b0b9-484e-6875f8a13813	5292	Renče
00050000-55c0-b0b9-6767-8ae4d7222a6f	1310	Ribnica
00050000-55c0-b0b9-cb93-f354a0321d59	2364	Ribnica na Pohorju
00050000-55c0-b0b9-35a5-bc3f657dce74	3272	Rimske Toplice
00050000-55c0-b0b9-b0bb-93795cc26f84	1314	Rob
00050000-55c0-b0b9-58df-80274e6699ee	5215	Ročinj
00050000-55c0-b0b9-8673-5c3931d55c09	3250	Rogaška Slatina
00050000-55c0-b0b9-4617-302069f50b4f	9262	Rogašovci
00050000-55c0-b0b9-2f2b-96c1b5d62a91	3252	Rogatec
00050000-55c0-b0b9-dab8-833d884446a5	1373	Rovte
00050000-55c0-b0b9-c2f4-c39e25dff319	2342	Ruše
00050000-55c0-b0b9-cdda-c56bbb06cd7d	1282	Sava
00050000-55c0-b0b9-5673-e308ab690f64	6333	Sečovlje/Sicciole
00050000-55c0-b0b9-3a33-b5f37b6bc7d4	4227	Selca
00050000-55c0-b0b9-f34c-ccb7ba9f8698	2352	Selnica ob Dravi
00050000-55c0-b0b9-b508-77f567e3604a	8333	Semič
00050000-55c0-b0b9-2ee9-194850ef9e45	8281	Senovo
00050000-55c0-b0b9-ed98-4a7dbc27e3cc	6224	Senožeče
00050000-55c0-b0b9-4f0f-9b668b0ddcd4	8290	Sevnica
00050000-55c0-b0b9-2468-933ab7b980aa	6210	Sežana
00050000-55c0-b0b9-8625-85d449ddf036	2214	Sladki Vrh
00050000-55c0-b0b9-f4ba-d8a015a133bc	5283	Slap ob Idrijci
00050000-55c0-b0b9-97a1-caaaa0673065	2380	Slovenj Gradec
00050000-55c0-b0b9-28ef-9e718d436461	2310	Slovenska Bistrica
00050000-55c0-b0b9-ccf9-4b69b5d2e6ae	3210	Slovenske Konjice
00050000-55c0-b0b9-be98-5eed732e9e01	1216	Smlednik
00050000-55c0-b0b9-a64e-e4a027e60413	5232	Soča
00050000-55c0-b0b9-fa47-1efe9024d4da	1317	Sodražica
00050000-55c0-b0b9-1b37-65f4c03ec13c	3335	Solčava
00050000-55c0-b0b9-9e44-9cc6a41a6c96	5250	Solkan
00050000-55c0-b0b9-dff7-c9fb5b3badc3	4229	Sorica
00050000-55c0-b0b9-23fa-d513699c9ff1	4225	Sovodenj
00050000-55c0-b0b9-0542-e46c70299725	5281	Spodnja Idrija
00050000-55c0-b0b9-f790-43d83336e403	2241	Spodnji Duplek
00050000-55c0-b0b9-dcaa-2b90583d7f9c	9245	Spodnji Ivanjci
00050000-55c0-b0b9-4980-048e4a0b3987	2277	Središče ob Dravi
00050000-55c0-b0b9-3e93-667e79745ac0	4267	Srednja vas v Bohinju
00050000-55c0-b0b9-139e-451553b02ecc	8256	Sromlje 
00050000-55c0-b0b9-365a-eb4db8f349e6	5224	Srpenica
00050000-55c0-b0b9-3326-f2e87bcf363c	1242	Stahovica
00050000-55c0-b0b9-e387-09214ccc877f	1332	Stara Cerkev
00050000-55c0-b0b9-386a-2891824f9dca	8342	Stari trg ob Kolpi
00050000-55c0-b0b9-b1d5-8a09e39a3580	1386	Stari trg pri Ložu
00050000-55c0-b0b9-b44a-5eb8f73b4f93	2205	Starše
00050000-55c0-b0b9-6de2-645886cde275	2289	Stoperce
00050000-55c0-b0b9-9a03-ead073957244	8322	Stopiče
00050000-55c0-b0b9-ace8-be9a0d82795a	3206	Stranice
00050000-55c0-b0b9-cabc-934d86d3397d	8351	Straža
00050000-55c0-b0b9-2b5b-3304dea0b041	1313	Struge
00050000-55c0-b0b9-9109-2a8674f8f560	8293	Studenec
00050000-55c0-b0b9-015b-356e90bd09cc	8331	Suhor
00050000-55c0-b0b9-c8e7-76eeb94e761c	2233	Sv. Ana v Slovenskih goricah
00050000-55c0-b0b9-bb9c-da6ad021f615	2235	Sv. Trojica v Slovenskih goricah
00050000-55c0-b0b9-c222-d1b0ead99f53	2353	Sveti Duh na Ostrem Vrhu
00050000-55c0-b0b9-3855-c6ff7b4159d5	9244	Sveti Jurij ob Ščavnici
00050000-55c0-b0b9-5b47-4936d7cb000a	3264	Sveti Štefan
00050000-55c0-b0b9-bc36-2d4f3cb5deec	2258	Sveti Tomaž
00050000-55c0-b0b9-c08e-4686c495ef9c	9204	Šalovci
00050000-55c0-b0b9-9e0e-b9df5c7bdf86	5261	Šempas
00050000-55c0-b0b9-5975-fa79d5e752a1	5290	Šempeter pri Gorici
00050000-55c0-b0b9-9b3c-b60c96366285	3311	Šempeter v Savinjski dolini
00050000-55c0-b0b9-41ac-9c6301651dde	4208	Šenčur
00050000-55c0-b0b9-cb7a-fa69a78f9117	2212	Šentilj v Slovenskih goricah
00050000-55c0-b0b9-25bc-e03ca6941603	8297	Šentjanž
00050000-55c0-b0b9-4680-33d35ffddc98	2373	Šentjanž pri Dravogradu
00050000-55c0-b0b9-307b-8f26100f6417	8310	Šentjernej
00050000-55c0-b0b9-ffca-70afca6ec715	3230	Šentjur
00050000-55c0-b0b9-00c0-41ab64d2a1c9	3271	Šentrupert
00050000-55c0-b0b9-5ef9-64edb5676bf3	8232	Šentrupert
00050000-55c0-b0b9-b6da-09998274ae1c	1296	Šentvid pri Stični
00050000-55c0-b0b9-877d-7ad59489d63f	8275	Škocjan
00050000-55c0-b0b9-1119-cc0e359fe23a	6281	Škofije
00050000-55c0-b0b9-cdad-acd32563e2f3	4220	Škofja Loka
00050000-55c0-b0b9-703c-1f31a7786ab8	3211	Škofja vas
00050000-55c0-b0b9-88d4-cd188a9ef1d1	1291	Škofljica
00050000-55c0-b0b9-ad81-c8c0dca766c2	6274	Šmarje
00050000-55c0-b0b9-27fc-f4670573fad8	1293	Šmarje - Sap
00050000-55c0-b0b9-1b97-841576d50367	3240	Šmarje pri Jelšah
00050000-55c0-b0b9-5fc2-35ec96f75f3f	8220	Šmarješke Toplice
00050000-55c0-b0b9-a85a-fe9b8e6847f5	2315	Šmartno na Pohorju
00050000-55c0-b0b9-a4da-06d7132e7993	3341	Šmartno ob Dreti
00050000-55c0-b0b9-0797-35f884751952	3327	Šmartno ob Paki
00050000-55c0-b0b9-d609-08d90e77af04	1275	Šmartno pri Litiji
00050000-55c0-b0b9-f4d1-b49886b718bd	2383	Šmartno pri Slovenj Gradcu
00050000-55c0-b0b9-f448-7646dd2119e1	3201	Šmartno v Rožni dolini
00050000-55c0-b0b9-3474-08e2425aee30	3325	Šoštanj
00050000-55c0-b0b9-03d6-b88daccbeb3c	6222	Štanjel
00050000-55c0-b0b9-61ee-646f79eeebeb	3220	Štore
00050000-55c0-b0b9-b2bc-356e4629f454	3304	Tabor
00050000-55c0-b0b9-899d-93c533451b98	3221	Teharje
00050000-55c0-b0b9-85d5-cb5737958b2c	9251	Tišina
00050000-55c0-b0b9-a471-4ae24dec7cc7	5220	Tolmin
00050000-55c0-b0b9-f6dc-b0398b4d11a1	3326	Topolšica
00050000-55c0-b0b9-d180-6fe099b0f4bf	2371	Trbonje
00050000-55c0-b0b9-426f-bea89f25b7ef	1420	Trbovlje
00050000-55c0-b0b9-a5ca-05530cf8dbb7	8231	Trebelno 
00050000-55c0-b0b9-9f69-b836229b3d63	8210	Trebnje
00050000-55c0-b0b9-b008-3f4b86568064	5252	Trnovo pri Gorici
00050000-55c0-b0b9-4e9d-e2cd5b172589	2254	Trnovska vas
00050000-55c0-b0b9-fae1-9cf88b55ed35	1222	Trojane
00050000-55c0-b0b9-7231-613e8f39e103	1236	Trzin
00050000-55c0-b0b9-5237-7864d8434738	4290	Tržič
00050000-55c0-b0b9-e54d-534dc2ac0c79	8295	Tržišče
00050000-55c0-b0b9-5036-4a9c8c751817	1311	Turjak
00050000-55c0-b0b9-9aaf-05831834e297	9224	Turnišče
00050000-55c0-b0b9-00fc-972415bfcb1e	8323	Uršna sela
00050000-55c0-b0b9-fdb7-2937400cd0c1	1252	Vače
00050000-55c0-b0b9-893f-538423492f57	3320	Velenje 
00050000-55c0-b0b9-26c3-e99e3745b518	3322	Velenje - poštni predali
00050000-55c0-b0b9-9fba-ad49d9cadb0d	8212	Velika Loka
00050000-55c0-b0b9-2340-9c85443c93cc	2274	Velika Nedelja
00050000-55c0-b0b9-4c86-4a909a3dfc93	9225	Velika Polana
00050000-55c0-b0b9-c27f-4f7010cdcc2d	1315	Velike Lašče
00050000-55c0-b0b9-e69b-47eeba9a08ac	8213	Veliki Gaber
00050000-55c0-b0b9-4796-879842d1218f	9241	Veržej
00050000-55c0-b0b9-1883-18025e5e3971	1312	Videm - Dobrepolje
00050000-55c0-b0b9-a28a-cd9f02c636eb	2284	Videm pri Ptuju
00050000-55c0-b0b9-2e78-36fc80ec3ab5	8344	Vinica
00050000-55c0-b0b9-a1e2-5ead7b5cc08a	5271	Vipava
00050000-55c0-b0b9-f99a-77cdba8b4544	4212	Visoko
00050000-55c0-b0b9-d5c4-47d43ba6d8c3	1294	Višnja Gora
00050000-55c0-b0b9-03bd-f8e44be552f8	3205	Vitanje
00050000-55c0-b0b9-3470-b351863b4105	2255	Vitomarci
00050000-55c0-b0b9-0711-7446ae368b83	1217	Vodice
00050000-55c0-b0b9-bf7c-c9d17c93b1fc	3212	Vojnik\t
00050000-55c0-b0b9-583f-0289d4f25929	5293	Volčja Draga
00050000-55c0-b0b9-7146-710a1259087c	2232	Voličina
00050000-55c0-b0b9-ebd5-cf63737e0eca	3305	Vransko
00050000-55c0-b0b9-19af-7043d143af55	6217	Vremski Britof
00050000-55c0-b0b9-6070-d0ee51e74203	1360	Vrhnika
00050000-55c0-b0b9-d5a4-4edf5f4e0691	2365	Vuhred
00050000-55c0-b0b9-6bef-17a738982636	2367	Vuzenica
00050000-55c0-b0b9-c7e6-f96136a35d3f	8292	Zabukovje 
00050000-55c0-b0b9-893a-caf1b516fadd	1410	Zagorje ob Savi
00050000-55c0-b0b9-7317-8860e714154e	1303	Zagradec
00050000-55c0-b0b9-6171-17f77fb9b56a	2283	Zavrč
00050000-55c0-b0b9-030d-e82c9d1ec74e	8272	Zdole 
00050000-55c0-b0b9-50dc-a97fc53e68f5	4201	Zgornja Besnica
00050000-55c0-b0b9-94d1-c664f54cd27e	2242	Zgornja Korena
00050000-55c0-b0b9-7d30-6b39591bd787	2201	Zgornja Kungota
00050000-55c0-b0b9-3196-938868c9c03c	2316	Zgornja Ložnica
00050000-55c0-b0b9-ff03-86b42d5bc39a	2314	Zgornja Polskava
00050000-55c0-b0b9-a9d5-e4e2f9a6dddd	2213	Zgornja Velka
00050000-55c0-b0b9-31f4-18ce267e908c	4247	Zgornje Gorje
00050000-55c0-b0b9-c1ad-6e81d1c7f7fb	4206	Zgornje Jezersko
00050000-55c0-b0b9-e14a-7d075da17708	2285	Zgornji Leskovec
00050000-55c0-b0b9-a96c-315c2a0c96a0	1432	Zidani Most
00050000-55c0-b0b9-8cea-7c033a899e5f	3214	Zreče
00050000-55c0-b0b9-c98b-112688c06538	4209	Žabnica
00050000-55c0-b0b9-75af-1aad2cb23694	3310	Žalec
00050000-55c0-b0b9-0adb-dabc57a4068c	4228	Železniki
00050000-55c0-b0b9-97c9-55c602ef0c31	2287	Žetale
00050000-55c0-b0b9-4f92-a607d9183dcb	4226	Žiri
00050000-55c0-b0b9-c2f1-02a086159c4c	4274	Žirovnica
00050000-55c0-b0b9-f629-01cd841aebd2	8360	Žužemberk
\.


--
-- TOC entry 2996 (class 0 OID 11735160)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11734967)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 11735045)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11735172)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11735478)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 11735488)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c0-b0ba-6306-3455455f428b	00080000-55c0-b0ba-105d-586049361b47	0900	AK
00190000-55c0-b0ba-3a8a-1756ecd1bc3d	00080000-55c0-b0ba-5cd0-d1e2d4d30233	0987	AK
00190000-55c0-b0ba-be5f-0dd547bc76a5	00080000-55c0-b0ba-8ca1-753485a65a67	0989	AK
00190000-55c0-b0ba-e349-f7cf6cc04bca	00080000-55c0-b0ba-09f1-863707c5b8c9	0986	AK
00190000-55c0-b0ba-05dd-b8919647779a	00080000-55c0-b0ba-e3a4-67cdc01018d2	0984	AK
00190000-55c0-b0ba-3fac-bcfed825914c	00080000-55c0-b0ba-95db-04aa69eecfa7	0983	AK
00190000-55c0-b0ba-8c88-c394073e5f1b	00080000-55c0-b0ba-0af9-6f7e8dd6cf97	0982	AK
\.


--
-- TOC entry 3020 (class 0 OID 11735458)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvaavtsamoz) FROM stdin;
00290000-55c0-b0ba-5aff-ae5b871d98b5	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2965 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11735496)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 11735201)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c0-b0ba-85e8-5feac2ca81df	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c0-b0ba-e36f-490755806873	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c0-b0ba-804d-078b592ef970	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c0-b0ba-6ddc-09d6811b35ea	0004	Mali oder	t	24	Mali oder 
00220000-55c0-b0ba-96c4-2fabc7553337	0005	Komorni oder	t	15	Komorni oder
00220000-55c0-b0ba-9a32-7e70283c5978	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c0-b0ba-c46d-1601e37f54ad	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2994 (class 0 OID 11735145)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11735135)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 11735320)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11735269)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 11734839)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3003 (class 0 OID 11735211)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 11734877)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c0-b0b8-141a-e4f8b2660ca2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c0-b0b8-cfd5-5363d93fdae7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c0-b0b8-bb9d-7e4690c5ecff	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c0-b0b8-a761-e74e41beb4ef	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c0-b0b8-8fc5-ea4d9527483a	planer	Planer dogodkov v koledarju	t
00020000-55c0-b0b8-77f3-c5f97de805f6	kadrovska	Kadrovska služba	t
00020000-55c0-b0b8-2dae-017426d37141	arhivar	Ažuriranje arhivalij	t
00020000-55c0-b0b8-19f9-23345391c8df	igralec	Igralec	t
00020000-55c0-b0b8-2bf6-2cfc97f376d7	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c0-b0ba-2bb6-cb404e8b4daa	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2969 (class 0 OID 11734861)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c0-b0b8-7eef-7e0bcd2913d1	00020000-55c0-b0b8-bb9d-7e4690c5ecff
00010000-55c0-b0b8-81e0-b070d5cd95f1	00020000-55c0-b0b8-bb9d-7e4690c5ecff
00010000-55c0-b0ba-a0c0-8a5eed27e241	00020000-55c0-b0ba-2bb6-cb404e8b4daa
\.


--
-- TOC entry 3005 (class 0 OID 11735225)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 11735166)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11735112)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11735537)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c0-b0b9-58cf-b33695c299e4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c0-b0b9-b7d4-1281407beed4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c0-b0b9-90ae-d0449fe0b6d5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c0-b0b9-c854-f2014c972031	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c0-b0b9-c06d-3d19b3c87e3b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3027 (class 0 OID 11735529)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c0-b0b9-6f7d-ba9a814b426a	00230000-55c0-b0b9-c854-f2014c972031	popa
00240000-55c0-b0b9-0a9a-d19dbf8391f2	00230000-55c0-b0b9-c854-f2014c972031	oseba
00240000-55c0-b0b9-37ab-1ca0df080b50	00230000-55c0-b0b9-c854-f2014c972031	sezona
00240000-55c0-b0b9-7974-2f37663f70ff	00230000-55c0-b0b9-b7d4-1281407beed4	prostor
00240000-55c0-b0b9-8fb7-0f48af77d68e	00230000-55c0-b0b9-c854-f2014c972031	besedilo
00240000-55c0-b0b9-e62f-e78360779316	00230000-55c0-b0b9-c854-f2014c972031	uprizoritev
00240000-55c0-b0b9-2008-a0b0bfd4138e	00230000-55c0-b0b9-c854-f2014c972031	funkcija
00240000-55c0-b0b9-6a1e-43b1d3f8e675	00230000-55c0-b0b9-c854-f2014c972031	tipfunkcije
00240000-55c0-b0b9-caf2-afb81e5151a3	00230000-55c0-b0b9-c854-f2014c972031	alternacija
00240000-55c0-b0b9-35ad-eb2633c4165b	00230000-55c0-b0b9-58cf-b33695c299e4	pogodba
00240000-55c0-b0b9-eb19-a079415a4d8d	00230000-55c0-b0b9-c854-f2014c972031	zaposlitev
00240000-55c0-b0b9-c784-7278e50d945a	00230000-55c0-b0b9-58cf-b33695c299e4	programdela
00240000-55c0-b0b9-2dea-03ce9e4a157c	00230000-55c0-b0b9-c854-f2014c972031	zapis
\.


--
-- TOC entry 3026 (class 0 OID 11735524)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 11735279)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c0-b0ba-7028-56129d6bd4d5	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	00080000-55c0-b0ba-b733-f600ef165cb0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c0-b0ba-c345-bafa13ce8be5	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	00080000-55c0-b0ba-b733-f600ef165cb0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c0-b0ba-ab2d-46bb964cb6b1	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	00080000-55c0-b0ba-b933-5bacf2f4fb70	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c0-b0ba-86a2-039c3f5741e2	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	00080000-55c0-b0ba-b933-5bacf2f4fb70	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2976 (class 0 OID 11734939)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 11735122)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c0-b0ba-a59c-7c36d315d312	00180000-55c0-b0ba-cd3c-8c9c021c5d95	000c0000-55c0-b0ba-b2ec-81795955812a	00090000-55c0-b0ba-8020-e443200635c1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-b0ba-4f96-6dd18f49b03e	00180000-55c0-b0ba-cd3c-8c9c021c5d95	000c0000-55c0-b0ba-ae3b-82ba31871781	00090000-55c0-b0ba-fc05-3a0de10e7e56	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-b0ba-810c-c778193855c2	00180000-55c0-b0ba-cd3c-8c9c021c5d95	000c0000-55c0-b0ba-7d44-6fc4d21fcc2b	00090000-55c0-b0ba-2916-6261981c79e5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-b0ba-5d1b-398d283e9251	00180000-55c0-b0ba-cd3c-8c9c021c5d95	000c0000-55c0-b0ba-df3c-7a3cc38656cc	00090000-55c0-b0ba-0728-a905f102ee9f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-b0ba-543c-40d6729c9660	00180000-55c0-b0ba-cd3c-8c9c021c5d95	000c0000-55c0-b0ba-d04b-f01bd445eb01	00090000-55c0-b0ba-a4a4-5c3b5bc3fedd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-b0ba-41d4-9311bd97e6fa	00180000-55c0-b0ba-e2f2-38da19bcff06	\N	00090000-55c0-b0ba-a4a4-5c3b5bc3fedd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3012 (class 0 OID 11735309)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c0-b0b9-067e-7945d3260551	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c0-b0b9-28c4-7b32605fa8ee	Priredba	Priredba	Priredba	umetnik
000f0000-55c0-b0b9-3d8e-61d3354d09c4	Prevod	Prevod	Prevod	umetnik
000f0000-55c0-b0b9-dfdb-e5fb6f1ca66b	Režija	Režija	Režija	umetnik
000f0000-55c0-b0b9-5166-2a76fabdd671	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c0-b0b9-2b55-199c50bd9b64	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c0-b0b9-b5cc-172f27acc57d	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c0-b0b9-04e1-d99e31bcc1d3	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c0-b0b9-8582-cf45e1d643ab	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c0-b0b9-1cfb-bd63aad41fe9	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c0-b0b9-5cff-be5fcd52871b	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c0-b0b9-93c9-38dc5a9b2204	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c0-b0b9-2d0d-a1bd6a7d859a	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c0-b0b9-d36c-5b32aabea897	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c0-b0b9-f404-4e9a347de3cb	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c0-b0b9-e2fe-0b65ede59ae5	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c0-b0b9-513e-5add6d49338e	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c0-b0b9-8bac-2fb687666757	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3024 (class 0 OID 11735506)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c0-b0b9-65fc-adf7736c6143	01	Velika predstava	f	1.00	1.00
002b0000-55c0-b0b9-fd3d-d590d60beeb9	02	Mala predstava	f	0.50	0.50
002b0000-55c0-b0b9-7d0e-f5ce8e394371	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c0-b0b9-4855-2e89ea27ec1c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c0-b0b9-3c5f-96e09c721237	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2981 (class 0 OID 11735002)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 11734848)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c0-b0b8-81e0-b070d5cd95f1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROdqYG.b2ovM7ZBLrBW1uQmnN2YpiGFTS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-1830-958c6ad51602	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-0d88-496ebd14770c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-9a10-58620ac883c4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-fe02-43c8d9000aee	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-9218-6d2ce6c706bd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-c124-ba73709a03c7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-0d7c-9f681fa208bd	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-d0ae-e1727378cf94	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-0f9f-be4f74a56dd3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c0-b0ba-a0c0-8a5eed27e241	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c0-b0b8-7eef-7e0bcd2913d1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3016 (class 0 OID 11735357)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c0-b0ba-7ea6-2dd02aa9d135	00160000-55c0-b0ba-af6b-5b3144362f84	00150000-55c0-b0b9-201f-725bbf92119f	00140000-55c0-b0b8-9bad-4484777943fb	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c0-b0ba-96c4-2fabc7553337
000e0000-55c0-b0ba-39bd-7031a7bf0c6d	00160000-55c0-b0ba-4770-afadfead9723	00150000-55c0-b0b9-88ca-5169691673f6	00140000-55c0-b0b8-b6bc-e67c6c84ff06	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c0-b0ba-9a32-7e70283c5978
000e0000-55c0-b0ba-a991-71398abf0a2f	\N	00150000-55c0-b0b9-88ca-5169691673f6	00140000-55c0-b0b8-b6bc-e67c6c84ff06	00190000-55c0-b0ba-3a8a-1756ecd1bc3d	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c0-b0ba-96c4-2fabc7553337
000e0000-55c0-b0ba-1a99-b6af5c43da8f	\N	00150000-55c0-b0b9-88ca-5169691673f6	00140000-55c0-b0b8-b6bc-e67c6c84ff06	00190000-55c0-b0ba-3a8a-1756ecd1bc3d	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c0-b0ba-96c4-2fabc7553337
000e0000-55c0-b0ba-41f0-7140ca9c184a	\N	00150000-55c0-b0b9-88ca-5169691673f6	00140000-55c0-b0b8-b6bc-e67c6c84ff06	00190000-55c0-b0ba-3a8a-1756ecd1bc3d	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c0-b0ba-85e8-5feac2ca81df
\.


--
-- TOC entry 2986 (class 0 OID 11735064)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c0-b0ba-b187-7f920c24ec40	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	1	
00200000-55c0-b0ba-3f5a-516fabfdc31c	000e0000-55c0-b0ba-39bd-7031a7bf0c6d	2	
\.


--
-- TOC entry 3001 (class 0 OID 11735193)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 11735576)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11735548)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11735588)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11735262)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c0-b0ba-6a96-e78a46714791	00090000-55c0-b0ba-fc05-3a0de10e7e56	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-b0ba-6ee8-51891436d819	00090000-55c0-b0ba-2916-6261981c79e5	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-b0ba-e663-0eb70fae6175	00090000-55c0-b0ba-f0ea-1560796f131b	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-b0ba-3867-484f6a4c9532	00090000-55c0-b0ba-7641-497dea39d1db	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-b0ba-f525-e55234ce61b2	00090000-55c0-b0ba-8020-e443200635c1	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-b0ba-d67e-d5523ba09679	00090000-55c0-b0ba-0390-fccbd5a712d4	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2988 (class 0 OID 11735096)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 11735347)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c0-b0b8-9bad-4484777943fb	01	Drama	drama (SURS 01)
00140000-55c0-b0b8-d979-6ae8bb7f8962	02	Opera	opera (SURS 02)
00140000-55c0-b0b8-f01f-2ce9b2380f10	03	Balet	balet (SURS 03)
00140000-55c0-b0b8-c541-57e421f3400d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c0-b0b8-362f-51741274088f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c0-b0b8-b6bc-e67c6c84ff06	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c0-b0b8-7b8e-c8a6f72948e9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3007 (class 0 OID 11735252)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c0-b0b9-af13-33902bcbdc97	01	Opera	opera
00150000-55c0-b0b9-94e0-0258f11f0473	02	Opereta	opereta
00150000-55c0-b0b9-6f44-26d24ef5ff79	03	Balet	balet
00150000-55c0-b0b9-4079-8c4cd2d314a0	04	Plesne prireditve	plesne prireditve
00150000-55c0-b0b9-a173-da0cffd316c9	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c0-b0b9-9483-e4a8755b40b6	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c0-b0b9-59bd-464c7108bc52	07	Biografska drama	biografska drama
00150000-55c0-b0b9-201f-725bbf92119f	08	Komedija	komedija
00150000-55c0-b0b9-b6d7-3fb92860f954	09	Črna komedija	črna komedija
00150000-55c0-b0b9-cc75-036c3395de15	10	E-igra	E-igra
00150000-55c0-b0b9-88ca-5169691673f6	11	Kriminalka	kriminalka
00150000-55c0-b0b9-9e83-33f0007e2e00	12	Musical	musical
\.


--
-- TOC entry 2512 (class 2606 OID 11734902)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 11735404)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 11735394)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11735308)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 11735629)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 11735086)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 11735111)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 11735522)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 11735028)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 11735452)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 11735248)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 11735062)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11735105)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 11735042)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11735158)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11735605)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 11735612)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2753 (class 2606 OID 11735637)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 11735185)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 11735000)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 11734911)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2519 (class 2606 OID 11734935)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 11734891)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2503 (class 2606 OID 11734876)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 11735191)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 11735224)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 11735342)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 11734964)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 11734988)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 11735164)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 11734978)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 11735049)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 11735176)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 11735485)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 11735493)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11735476)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11735504)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 11735208)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 11735149)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 11735140)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 11735330)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11735276)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 11734847)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 11735215)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 11734865)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2505 (class 2606 OID 11734885)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 11735233)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11735171)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 11735120)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 11735546)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 11735534)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 11735528)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11735289)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11734944)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 11735131)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 11735319)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 11735516)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 11735013)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 11734860)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 11735373)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 11735071)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 11735199)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 11735586)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 11735570)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 11735594)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 11735267)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 11735100)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 11735355)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 11735260)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 1259 OID 11735093)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2653 (class 1259 OID 11735290)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2654 (class 1259 OID 11735291)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 11735607)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2740 (class 1259 OID 11735606)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2526 (class 1259 OID 11734966)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2473 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2474 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2475 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 11735192)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2726 (class 1259 OID 11735574)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2727 (class 1259 OID 11735573)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2728 (class 1259 OID 11735575)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2729 (class 1259 OID 11735572)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2730 (class 1259 OID 11735571)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2612 (class 1259 OID 11735178)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2613 (class 1259 OID 11735177)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 11735072)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 11735249)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2641 (class 1259 OID 11735251)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2642 (class 1259 OID 11735250)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2551 (class 1259 OID 11735044)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2552 (class 1259 OID 11735043)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 11735505)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2663 (class 1259 OID 11735344)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 11735345)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2665 (class 1259 OID 11735346)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2736 (class 1259 OID 11735595)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2487 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2488 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2672 (class 1259 OID 11735378)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2673 (class 1259 OID 11735375)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2674 (class 1259 OID 11735379)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2675 (class 1259 OID 11735377)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2676 (class 1259 OID 11735376)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2541 (class 1259 OID 11735015)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 11735014)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2478 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2479 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2517 (class 1259 OID 11734938)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2628 (class 1259 OID 11735216)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 11735106)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2507 (class 1259 OID 11734892)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2508 (class 1259 OID 11734893)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2633 (class 1259 OID 11735236)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2634 (class 1259 OID 11735235)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2635 (class 1259 OID 11735234)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2555 (class 1259 OID 11735050)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2556 (class 1259 OID 11735052)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2557 (class 1259 OID 11735051)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2719 (class 1259 OID 11735536)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2592 (class 1259 OID 11735144)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2593 (class 1259 OID 11735142)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2594 (class 1259 OID 11735141)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2595 (class 1259 OID 11735143)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2498 (class 1259 OID 11734866)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2499 (class 1259 OID 11734867)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2621 (class 1259 OID 11735200)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2749 (class 1259 OID 11735630)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2750 (class 1259 OID 11735638)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2751 (class 1259 OID 11735639)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2607 (class 1259 OID 11735165)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2649 (class 1259 OID 11735277)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2650 (class 1259 OID 11735278)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2693 (class 1259 OID 11735457)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2694 (class 1259 OID 11735456)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2695 (class 1259 OID 11735453)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2696 (class 1259 OID 11735454)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2697 (class 1259 OID 11735455)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2530 (class 1259 OID 11734980)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 11734979)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2532 (class 1259 OID 11734981)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2491 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2701 (class 1259 OID 11735486)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2702 (class 1259 OID 11735487)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2686 (class 1259 OID 11735408)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2687 (class 1259 OID 11735409)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2688 (class 1259 OID 11735406)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2689 (class 1259 OID 11735407)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2646 (class 1259 OID 11735268)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 11735153)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2599 (class 1259 OID 11735152)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2600 (class 1259 OID 11735150)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2601 (class 1259 OID 11735151)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2469 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2682 (class 1259 OID 11735396)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2683 (class 1259 OID 11735395)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2698 (class 1259 OID 11735477)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2562 (class 1259 OID 11735063)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2716 (class 1259 OID 11735523)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2743 (class 1259 OID 11735613)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2744 (class 1259 OID 11735614)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2513 (class 1259 OID 11734913)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2514 (class 1259 OID 11734912)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2522 (class 1259 OID 11734945)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2523 (class 1259 OID 11734946)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2587 (class 1259 OID 11735134)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 11735133)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2589 (class 1259 OID 11735132)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2482 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2483 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2484 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2569 (class 1259 OID 11735095)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2570 (class 1259 OID 11735091)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2571 (class 1259 OID 11735088)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2572 (class 1259 OID 11735089)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2573 (class 1259 OID 11735087)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2574 (class 1259 OID 11735092)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2575 (class 1259 OID 11735090)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2529 (class 1259 OID 11734965)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 11735029)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2548 (class 1259 OID 11735031)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2549 (class 1259 OID 11735030)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2550 (class 1259 OID 11735032)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2606 (class 1259 OID 11735159)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 11735343)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 11735374)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 11734936)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 11734937)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2643 (class 1259 OID 11735261)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2725 (class 1259 OID 11735547)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2540 (class 1259 OID 11735001)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2722 (class 1259 OID 11735535)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2626 (class 1259 OID 11735210)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2627 (class 1259 OID 11735209)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 11735405)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 11734989)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 11735356)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 11735587)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2707 (class 1259 OID 11735494)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2708 (class 1259 OID 11735495)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2586 (class 1259 OID 11735121)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2506 (class 1259 OID 11734886)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2576 (class 1259 OID 11735094)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2779 (class 2606 OID 11735775)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2782 (class 2606 OID 11735760)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2781 (class 2606 OID 11735765)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2777 (class 2606 OID 11735785)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2783 (class 2606 OID 11735755)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2778 (class 2606 OID 11735780)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2780 (class 2606 OID 11735770)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2813 (class 2606 OID 11735930)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 11735935)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2846 (class 2606 OID 11736105)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 11736100)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2764 (class 2606 OID 11735690)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 11735870)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2841 (class 2606 OID 11736085)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2842 (class 2606 OID 11736080)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2840 (class 2606 OID 11736090)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2843 (class 2606 OID 11736075)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2844 (class 2606 OID 11736070)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2798 (class 2606 OID 11735865)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2799 (class 2606 OID 11735860)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 11735750)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 11735900)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 11735910)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2807 (class 2606 OID 11735905)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2770 (class 2606 OID 11735725)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 11735720)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2796 (class 2606 OID 11735850)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2837 (class 2606 OID 11736055)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2816 (class 2606 OID 11735940)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2815 (class 2606 OID 11735945)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2814 (class 2606 OID 11735950)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2845 (class 2606 OID 11736095)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2818 (class 2606 OID 11735970)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2821 (class 2606 OID 11735955)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2817 (class 2606 OID 11735975)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2819 (class 2606 OID 11735965)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2820 (class 2606 OID 11735960)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2768 (class 2606 OID 11735715)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 11735710)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 11735675)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2761 (class 2606 OID 11735670)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2802 (class 2606 OID 11735880)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2784 (class 2606 OID 11735790)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2757 (class 2606 OID 11735650)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2756 (class 2606 OID 11735655)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2803 (class 2606 OID 11735895)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2804 (class 2606 OID 11735890)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2805 (class 2606 OID 11735885)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2774 (class 2606 OID 11735730)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 11735740)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2773 (class 2606 OID 11735735)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2839 (class 2606 OID 11736065)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2788 (class 2606 OID 11735825)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2790 (class 2606 OID 11735815)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2791 (class 2606 OID 11735810)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2789 (class 2606 OID 11735820)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2755 (class 2606 OID 11735640)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2754 (class 2606 OID 11735645)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2801 (class 2606 OID 11735875)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2850 (class 2606 OID 11736120)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2852 (class 2606 OID 11736125)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2851 (class 2606 OID 11736130)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2797 (class 2606 OID 11735855)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2811 (class 2606 OID 11735920)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2810 (class 2606 OID 11735925)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2828 (class 2606 OID 11736030)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2829 (class 2606 OID 11736025)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 11736010)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 11736015)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2830 (class 2606 OID 11736020)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2766 (class 2606 OID 11735700)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11735695)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 11735705)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2835 (class 2606 OID 11736040)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2834 (class 2606 OID 11736045)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2825 (class 2606 OID 11736000)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 11736005)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2827 (class 2606 OID 11735990)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2826 (class 2606 OID 11735995)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2809 (class 2606 OID 11735915)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 11735845)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2793 (class 2606 OID 11735840)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2795 (class 2606 OID 11735830)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2794 (class 2606 OID 11735835)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2822 (class 2606 OID 11735985)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2823 (class 2606 OID 11735980)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2833 (class 2606 OID 11736035)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2775 (class 2606 OID 11735745)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 11736050)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 11736060)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2849 (class 2606 OID 11736110)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2848 (class 2606 OID 11736115)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2758 (class 2606 OID 11735665)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2759 (class 2606 OID 11735660)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2763 (class 2606 OID 11735680)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 11735685)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 11735805)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 11735800)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2787 (class 2606 OID 11735795)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-04 14:31:55 CEST

--
-- PostgreSQL database dump complete
--

