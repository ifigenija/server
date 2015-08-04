--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-04 10:03:40 CEST

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
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 11671621)
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
-- TOC entry 228 (class 1259 OID 11672124)
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
-- TOC entry 227 (class 1259 OID 11672107)
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
-- TOC entry 221 (class 1259 OID 11672019)
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
-- TOC entry 244 (class 1259 OID 11672340)
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
-- TOC entry 197 (class 1259 OID 11671800)
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
-- TOC entry 200 (class 1259 OID 11671834)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11672242)
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
-- TOC entry 192 (class 1259 OID 11671743)
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
-- TOC entry 229 (class 1259 OID 11672137)
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
-- TOC entry 216 (class 1259 OID 11671964)
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
-- TOC entry 195 (class 1259 OID 11671780)
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
-- TOC entry 199 (class 1259 OID 11671828)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11671760)
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
-- TOC entry 205 (class 1259 OID 11671881)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11672321)
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
-- TOC entry 243 (class 1259 OID 11672333)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11672356)
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
-- TOC entry 209 (class 1259 OID 11671906)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11671717)
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
-- TOC entry 184 (class 1259 OID 11671630)
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
-- TOC entry 185 (class 1259 OID 11671641)
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
-- TOC entry 180 (class 1259 OID 11671595)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11671614)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11671913)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11671944)
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
-- TOC entry 224 (class 1259 OID 11672058)
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
-- TOC entry 187 (class 1259 OID 11671674)
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
-- TOC entry 189 (class 1259 OID 11671709)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11671887)
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
-- TOC entry 188 (class 1259 OID 11671694)
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
-- TOC entry 194 (class 1259 OID 11671772)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11671899)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11672203)
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
-- TOC entry 232 (class 1259 OID 11672213)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11672184)
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
-- TOC entry 233 (class 1259 OID 11672221)
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
-- TOC entry 212 (class 1259 OID 11671928)
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
-- TOC entry 204 (class 1259 OID 11671872)
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
-- TOC entry 203 (class 1259 OID 11671862)
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
-- TOC entry 223 (class 1259 OID 11672047)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11671996)
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
-- TOC entry 177 (class 1259 OID 11671566)
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
-- TOC entry 176 (class 1259 OID 11671564)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 11671938)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11671604)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11671588)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11671952)
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
-- TOC entry 207 (class 1259 OID 11671893)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11671839)
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
-- TOC entry 238 (class 1259 OID 11672262)
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
-- TOC entry 237 (class 1259 OID 11672254)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11672249)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11672006)
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
-- TOC entry 186 (class 1259 OID 11671666)
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
-- TOC entry 202 (class 1259 OID 11671849)
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
-- TOC entry 222 (class 1259 OID 11672036)
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
-- TOC entry 234 (class 1259 OID 11672231)
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
-- TOC entry 191 (class 1259 OID 11671729)
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
-- TOC entry 178 (class 1259 OID 11671575)
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
-- TOC entry 226 (class 1259 OID 11672084)
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
-- TOC entry 196 (class 1259 OID 11671791)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11671920)
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
-- TOC entry 240 (class 1259 OID 11672301)
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
-- TOC entry 239 (class 1259 OID 11672273)
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
-- TOC entry 241 (class 1259 OID 11672313)
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
-- TOC entry 218 (class 1259 OID 11671989)
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
-- TOC entry 198 (class 1259 OID 11671823)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11672074)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11671979)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 11671569)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2971 (class 0 OID 11671621)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11672124)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c0-71dc-04d2-d2eff92c60d4	000d0000-55c0-71db-38d4-aba2592b2206	\N	00090000-55c0-71db-8e1f-ff1d97293f34	000b0000-55c0-71db-bff6-ed70ba993483	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c0-71dc-646d-47354fe90e3b	000d0000-55c0-71db-4c65-9f9cfe3cb979	00100000-55c0-71db-47df-386998431610	00090000-55c0-71db-04f9-ec2456acae7b	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c0-71dc-7a1b-8d80c080d29c	000d0000-55c0-71db-f019-868781ada76f	00100000-55c0-71db-46ae-e72edaf78ea9	00090000-55c0-71db-2cf6-3d9de009825b	\N	0003	t	\N	2015-08-04	\N	2	\N	\N	f	f
000c0000-55c0-71dc-de71-f5aae579a832	000d0000-55c0-71db-1812-aa19e7a088c4	\N	00090000-55c0-71db-344f-0f8decfed678	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c0-71dc-1c88-fd784bbc18f9	000d0000-55c0-71db-951e-29f03fdd4a80	\N	00090000-55c0-71db-b917-72198d8c33e6	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c0-71dc-aaa3-dd0c4f2ee90d	000d0000-55c0-71db-3f04-d982720860de	\N	00090000-55c0-71db-85e3-828486a2ceb5	000b0000-55c0-71db-5259-4af5d3116d94	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c0-71dc-d12c-c5dcdccce900	000d0000-55c0-71db-e084-b586801cfeab	00100000-55c0-71db-2bdb-455bb4fdcd78	00090000-55c0-71db-51fd-9d66c5626d80	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c0-71dc-8428-33b1026f1e67	000d0000-55c0-71db-8bfc-12fdfa99a16a	\N	00090000-55c0-71db-d1e2-faeda40fdec3	000b0000-55c0-71db-dc98-5bc877b4ea10	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c0-71dc-e806-a7916eaa5d44	000d0000-55c0-71db-e084-b586801cfeab	00100000-55c0-71db-c842-655289499209	00090000-55c0-71db-3df5-9058e3d715a0	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c0-71dc-de01-79b78ebf2505	000d0000-55c0-71db-e084-b586801cfeab	00100000-55c0-71db-dd55-01b121eeea63	00090000-55c0-71db-41b8-a8b2aeb98639	\N	0010	t	\N	2015-08-04	\N	16	\N	\N	f	t
000c0000-55c0-71dc-8750-9d15673a4bf4	000d0000-55c0-71db-e084-b586801cfeab	00100000-55c0-71db-b14c-75b7720bba63	00090000-55c0-71db-a535-9ece9ffe78f0	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3015 (class 0 OID 11672107)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11672019)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c0-71db-a50f-88c0b9d4359b	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c0-71db-c228-f04aa1885839	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c0-71db-1fef-1da14eb9088e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3032 (class 0 OID 11672340)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11671800)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c0-71db-f21e-c989aef504f5	\N	\N	00200000-55c0-71db-2c6d-aea3c46c92c3	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c0-71db-a3fe-6f16536ee252	\N	\N	00200000-55c0-71db-8ac9-eff14f5db86f	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c0-71db-5404-269df5d742ef	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c0-71db-4c35-98d75c1b7d96	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c0-71db-316c-e7750d119df6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2988 (class 0 OID 11671834)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11672242)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11671743)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c0-71d9-9f10-b3337235085b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c0-71d9-add2-06769d6e4139	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c0-71d9-04ac-e46d73212d37	AL	ALB	008	Albania 	Albanija	\N
00040000-55c0-71d9-c47b-b8d664ad2c2d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c0-71d9-4b3c-ac1b63396346	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c0-71d9-b72a-e14c6879c276	AD	AND	020	Andorra 	Andora	\N
00040000-55c0-71d9-2dcb-391acaf11a10	AO	AGO	024	Angola 	Angola	\N
00040000-55c0-71d9-6385-0e4dc90f7d3a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c0-71d9-e95a-26a0bd6e39e9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c0-71d9-d554-bb8fa52dc0ba	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c0-71d9-a21c-a2e0f1de9188	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c0-71d9-d0ba-933cdbda12a5	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c0-71d9-b505-966171b804a9	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c0-71d9-00c2-0d25f7f44e12	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c0-71d9-db4a-c7208c1d235a	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c0-71d9-8a28-7fde49590365	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c0-71d9-89bc-f11277a79606	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c0-71d9-613b-4867f4a77c5b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c0-71d9-6acb-1445578e0816	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c0-71d9-cfa9-6b61bad0910b	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c0-71d9-7dea-15e83ac99709	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c0-71d9-d68d-2cff08b39fa2	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c0-71d9-4a52-63e73dd7c97e	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c0-71d9-b5ef-60ce3eaec04f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c0-71d9-6f49-aa22d197da89	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c0-71d9-2d04-8a49831057cd	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c0-71d9-6685-91c88265650e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c0-71d9-9cab-49c9545f5894	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c0-71d9-44e3-56d5e1f150fb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c0-71d9-cbce-0f96d209b560	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c0-71d9-0893-3f811940263e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c0-71d9-cd24-ff82fa2afd82	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c0-71d9-6c61-ba978bc8c98c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c0-71d9-36d4-35b75ac57e6f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c0-71d9-d5c8-5ebfcaa05851	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c0-71d9-3a3f-3778a5758c1f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c0-71d9-2032-27a9c22be290	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c0-71d9-e9d6-14ce9668a7c1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c0-71d9-d6b0-4beacd372cdf	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c0-71d9-1c42-08ba2c7e54f2	CA	CAN	124	Canada 	Kanada	\N
00040000-55c0-71d9-bae6-70c048e54d5f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c0-71d9-7c08-178af2e8ce17	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c0-71d9-cfe1-e9c42e4ba82f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c0-71d9-b7b0-f353513ee167	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c0-71d9-01b2-8d425a075905	CL	CHL	152	Chile 	Čile	\N
00040000-55c0-71d9-e6c8-ea12518beb13	CN	CHN	156	China 	Kitajska	\N
00040000-55c0-71d9-5a7d-c8373ff46a7a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c0-71d9-7940-8030dee0b705	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c0-71d9-8cef-1e6ac403d9cb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c0-71d9-39e3-78206e4af6e0	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c0-71d9-b91f-228b235fd498	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c0-71d9-8e53-83139c985963	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c0-71d9-c800-94551e72b082	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c0-71d9-e78e-f60c63ee77d3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c0-71d9-3738-f275201b3e0f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c0-71d9-4cd8-18410c43add9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c0-71d9-685a-d74337899a75	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c0-71d9-50ee-7385570f99aa	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c0-71d9-4b94-b73470c87ec4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c0-71d9-cdda-0d651ab7a2fe	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c0-71d9-9581-52af3eaa1176	DK	DNK	208	Denmark 	Danska	\N
00040000-55c0-71d9-2ce7-b344f1c3f3ae	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c0-71d9-fe98-184ab5577175	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c0-71d9-1676-fb1910ca55b7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c0-71d9-eb15-dfd15fedbf20	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c0-71d9-4bd4-1991b79e9c8d	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c0-71d9-7015-5224879e0d6e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c0-71d9-a695-3048613f52b8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c0-71d9-20a7-ff3b6217dba7	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c0-71d9-6d2b-04c3740d0733	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c0-71d9-7d2b-4fb0936ad4e9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c0-71d9-db8c-8bd780947032	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c0-71d9-6ff6-7bada40e3fc2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c0-71d9-8d12-41a8394b0750	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c0-71d9-95ce-74064189ea04	FI	FIN	246	Finland 	Finska	\N
00040000-55c0-71d9-db81-04acca06cbc8	FR	FRA	250	France 	Francija	\N
00040000-55c0-71d9-459f-c026d0a930b7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c0-71d9-445e-ef3e988112c1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c0-71d9-a390-7da7f5fd26ad	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c0-71d9-c5ce-f1f06cc67008	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c0-71d9-7375-129a633f459b	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c0-71d9-f309-abdd03e27924	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c0-71d9-81bb-200e25b7e2e3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c0-71d9-ec7d-dd0a663ce4e7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c0-71d9-a06f-7fbea104cb65	GH	GHA	288	Ghana 	Gana	\N
00040000-55c0-71d9-04c3-c4e9afc772de	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c0-71d9-7ab1-ddcaeecdc82f	GR	GRC	300	Greece 	Grčija	\N
00040000-55c0-71d9-b380-400dd06564b3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c0-71d9-005b-5acd37f7aae5	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c0-71d9-c7ba-ba11ff5a4d7a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c0-71d9-2c22-0fe2eb8f6906	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c0-71d9-1ffe-f4c4c0cc8339	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c0-71d9-032e-dc77ffadf34e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c0-71d9-b47a-5910c3a8016a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c0-71d9-45c7-d03b19262fef	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c0-71d9-f11c-78271f448e53	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c0-71d9-bed4-bd967684af7c	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c0-71d9-629b-85e33fd8b57b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c0-71d9-ef59-0322ef34f895	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c0-71d9-a494-22347290281b	HN	HND	340	Honduras 	Honduras	\N
00040000-55c0-71d9-5025-ec66b6a9e6d9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c0-71d9-5979-9531729092f2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c0-71d9-c318-07dd839af167	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c0-71d9-b974-d2fa8cb47e55	IN	IND	356	India 	Indija	\N
00040000-55c0-71d9-db6e-66a199a9a040	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c0-71d9-6891-af4f8782d974	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c0-71d9-2740-03b9beb08fca	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c0-71d9-a5b5-01413645498a	IE	IRL	372	Ireland 	Irska	\N
00040000-55c0-71d9-7187-b55aad2e1259	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c0-71d9-d65d-e29f63c72e62	IL	ISR	376	Israel 	Izrael	\N
00040000-55c0-71d9-bab7-480e917f4922	IT	ITA	380	Italy 	Italija	\N
00040000-55c0-71d9-2fbe-5f293c702a10	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c0-71d9-32ba-ac4b5af74f51	JP	JPN	392	Japan 	Japonska	\N
00040000-55c0-71d9-a532-3cdd0c110d0f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c0-71d9-57cb-07228f9cec17	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c0-71d9-1e99-ef3525938f60	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c0-71d9-65d9-20ac042b5553	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c0-71d9-c2ce-39822f9f7f63	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c0-71d9-3a7d-988b6a239b9f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c0-71d9-7c42-81e1591613f5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c0-71d9-b9c4-593df3d1b56b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c0-71d9-2bc5-611ef1e228fa	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c0-71d9-2cb7-8d0711b6a056	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c0-71d9-bee8-23af8cea2c17	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c0-71d9-be26-cc490a4303b6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c0-71d9-4fb4-09726abf27a2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c0-71d9-1ba9-51829d6a2e3b	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c0-71d9-b241-121ce5a94bab	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c0-71d9-43be-5847634805f8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c0-71d9-2d37-65ceaccfecde	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c0-71d9-6a40-75aae19bb124	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c0-71d9-99e6-d4feb8ea78b6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c0-71d9-3ede-54dd4021b150	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c0-71d9-7d96-baf8fda6ec1c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c0-71d9-6bc1-b2c5f697a4d2	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c0-71d9-0cf3-a981b2c76dac	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c0-71d9-93fd-a76a316f9b9f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c0-71d9-c3f4-fae5880af438	ML	MLI	466	Mali 	Mali	\N
00040000-55c0-71d9-19f0-0e6f2a9244ea	MT	MLT	470	Malta 	Malta	\N
00040000-55c0-71d9-20de-73716955d04f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c0-71d9-676e-21c306abbbcf	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c0-71d9-e629-114945c5b3fd	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c0-71d9-50ec-ef020be7adf4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c0-71d9-60dc-7c08d4c86302	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c0-71d9-4960-87244a09d869	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c0-71d9-2c39-37666de28e77	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c0-71d9-b195-ff9d82f87004	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c0-71d9-a1f1-04146f1ee5b3	MC	MCO	492	Monaco 	Monako	\N
00040000-55c0-71d9-f6fb-a255b428e321	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c0-71d9-146c-4c6ede0b5fc6	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c0-71d9-3494-d85051da30df	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c0-71d9-d453-16cfc1e190c3	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c0-71d9-4a91-cf7662de02b7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c0-71d9-7005-50d079409a85	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c0-71d9-73e7-f86a036b9031	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c0-71d9-dd95-607347aeabb3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c0-71d9-cee0-c475286e2e12	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c0-71d9-60b5-8639c064f12c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c0-71d9-bc2f-3069441b9daf	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c0-71d9-f03e-f82565dae7a4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c0-71d9-a5cb-1f331d43570b	NE	NER	562	Niger 	Niger 	\N
00040000-55c0-71d9-c8a5-add22822bbf5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c0-71d9-fbae-a4437d2ebd3e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c0-71d9-e4b6-e2a75268b24c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c0-71d9-f6f3-58d371602a55	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c0-71d9-be4d-6c676b1d2dc7	NO	NOR	578	Norway 	Norveška	\N
00040000-55c0-71d9-c886-3a1242e175c1	OM	OMN	512	Oman 	Oman	\N
00040000-55c0-71d9-e0fc-cbef04c8d4bf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c0-71d9-7546-7830386cff26	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c0-71d9-0d51-0280bae7f039	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c0-71d9-00c0-806144431613	PA	PAN	591	Panama 	Panama	\N
00040000-55c0-71d9-8e72-22b7b01aa05c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c0-71d9-1fad-86cda4d2ef55	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c0-71d9-71f7-d65843d48069	PE	PER	604	Peru 	Peru	\N
00040000-55c0-71d9-402e-cadc9ca7b8c4	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c0-71d9-4e24-a7864f25d7a3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c0-71d9-2013-adfba65c1b9e	PL	POL	616	Poland 	Poljska	\N
00040000-55c0-71d9-fff2-0fc91dc52961	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c0-71d9-63cb-cfad56890d94	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c0-71d9-a19c-fd7d47a7a680	QA	QAT	634	Qatar 	Katar	\N
00040000-55c0-71d9-bc25-487c9fd1d9f9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c0-71d9-b049-ceb991058af0	RO	ROU	642	Romania 	Romunija	\N
00040000-55c0-71d9-04ba-f2f6d09ab9b7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c0-71d9-c0ee-bb996995c46f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c0-71d9-f485-e7576d4c15b6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c0-71d9-2a07-d74b55750eae	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c0-71d9-5397-7a619c6ba3da	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c0-71d9-0a43-a8d1457ba938	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c0-71d9-3b08-e05f989e514b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c0-71d9-653a-54f917536cb8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c0-71d9-7881-8486ac61267e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c0-71d9-5602-8c36bd135ff6	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c0-71d9-3c68-7895634d9978	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c0-71d9-3d98-1b10911c68fc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c0-71d9-759b-0a92c9b5651e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c0-71d9-117c-7134dc8b2436	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c0-71d9-e90e-2e3ed34da277	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c0-71d9-b342-ba29d8fdcf32	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c0-71d9-1756-e454559e4afe	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c0-71d9-b948-78a0d3d089b9	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c0-71d9-bd72-24e6c68b1990	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c0-71d9-7870-08fe0288f673	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c0-71d9-c621-99e0a5be09f8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c0-71d9-9a0b-43301b0dcdd0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c0-71d9-7dea-12b587432207	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c0-71d9-174a-29efa806f83c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c0-71d9-a31b-d5b2b001646b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c0-71d9-7448-6171a519ea18	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c0-71d9-53fc-bb36105577aa	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c0-71d9-25a7-a1831abb0185	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c0-71d9-885c-6ed9744e0f01	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c0-71d9-a249-6465dc8a4c0a	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c0-71d9-29e7-702663213750	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c0-71d9-68d2-b821b856d54f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c0-71d9-5c57-ff8a0511003b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c0-71d9-e168-8c89e9322eec	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c0-71d9-8e43-b3ca1ca05539	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c0-71d9-458d-3d84c0fa1659	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c0-71d9-d910-eb195729833f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c0-71d9-a1f7-bd4f77a9d7e9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c0-71d9-dfde-f6178d24bdcf	TH	THA	764	Thailand 	Tajska	\N
00040000-55c0-71d9-9546-1a7b706241b3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c0-71d9-3af0-bd119f806b0b	TG	TGO	768	Togo 	Togo	\N
00040000-55c0-71d9-2ffc-bb58e20dd870	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c0-71d9-0dd8-d58379d1b051	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c0-71d9-354a-febd0a3d9508	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c0-71d9-60f4-85a48f81bb52	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c0-71d9-0676-f65f5aad153c	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c0-71d9-46fe-0f91c38c833f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c0-71d9-9509-2358c74f9be3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c0-71d9-69af-d193bc68ef84	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c0-71d9-db31-dcd80d7addbe	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c0-71d9-d463-b4a814169360	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c0-71d9-0cb6-3718d367f89c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c0-71d9-168b-fde7c33dbd5e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c0-71d9-2581-4de1b2630921	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c0-71d9-d412-803634e13e19	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c0-71d9-0811-cd4f518ecdd3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c0-71d9-5417-d0a3a21c4856	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c0-71d9-0a73-90aa07036eea	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c0-71d9-ce8d-5d1c2a072e09	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c0-71d9-91f1-c043c9f5c759	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c0-71d9-f1bf-2da177f23c9a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c0-71d9-2660-b0c032c1d4d0	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c0-71d9-38e7-d5bbac106674	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c0-71d9-efa2-ae0556998c5d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c0-71d9-697d-f87c5a8085ae	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c0-71d9-6cf3-2900e2093a5f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c0-71d9-f75b-8e3612176ec4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3017 (class 0 OID 11672137)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c0-71db-a863-ddff113f59eb	000e0000-55c0-71db-e75a-ae0e01573717	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c0-71da-8266-809e48624467	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c0-71db-f451-e3ddd6b52162	000e0000-55c0-71db-f168-dc52d0815b61	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c0-71da-d228-5a83e1e1537d	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c0-71dc-847b-d3d2a34a7997	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c0-71dc-5996-bf80ee9f1069	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3004 (class 0 OID 11671964)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c0-71db-e084-b586801cfeab	000e0000-55c0-71db-f168-dc52d0815b61	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c0-71da-6324-7472015948eb
000d0000-55c0-71db-38d4-aba2592b2206	000e0000-55c0-71db-f168-dc52d0815b61	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c0-71da-6324-7472015948eb
000d0000-55c0-71db-4c65-9f9cfe3cb979	000e0000-55c0-71db-f168-dc52d0815b61	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c0-71da-cc8d-b9305e42a14d
000d0000-55c0-71db-f019-868781ada76f	000e0000-55c0-71db-f168-dc52d0815b61	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c0-71da-68f4-c5dd608c2c8b
000d0000-55c0-71db-1812-aa19e7a088c4	000e0000-55c0-71db-f168-dc52d0815b61	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c0-71da-1729-0e283d634e82
000d0000-55c0-71db-951e-29f03fdd4a80	000e0000-55c0-71db-f168-dc52d0815b61	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c0-71da-b7f3-f38665833179
000d0000-55c0-71db-3f04-d982720860de	000e0000-55c0-71db-f168-dc52d0815b61	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c0-71da-6324-7472015948eb
000d0000-55c0-71db-8bfc-12fdfa99a16a	000e0000-55c0-71db-f168-dc52d0815b61	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c0-71da-f887-60fc3b5b3e4d
\.


--
-- TOC entry 2983 (class 0 OID 11671780)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11671828)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 11671760)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c0-71db-1404-46b295e18446	00080000-55c0-71db-2eb9-1f3f443eea94	00090000-55c0-71db-41b8-a8b2aeb98639	AK		
\.


--
-- TOC entry 2958 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11671881)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 11672321)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11672333)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 11672356)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 11671906)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11671717)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c0-71da-81af-12ba93632384	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c0-71da-d6bf-b643bf43ff4d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c0-71da-e512-d322ea2e48fc	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c0-71da-d5a6-80b39c4595fc	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c0-71da-2299-7db38ca7d1cb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c0-71da-817b-ebd5a74ee453	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c0-71da-209a-4d804568efd9	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c0-71da-f7ac-6c5d4c3b9069	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c0-71da-b355-f238d7622df6	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c0-71da-9211-7164107b0584	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c0-71da-c5b7-8e0b9e56c690	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c0-71da-c45c-bc3f26c207e2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c0-71da-bab8-6eb8ad070605	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c0-71da-1fb5-4f9fe0e128a0	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c0-71db-b2ea-ac91d17e4078	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c0-71db-3cc8-6fded62eea3c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c0-71db-5bb4-2f4308b9387a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c0-71db-a945-14dc8caf1a25	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c0-71db-a1c0-2f1580294fe1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c0-71db-1eab-24dee989b1eb	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2972 (class 0 OID 11671630)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c0-71db-23a9-bc73171faf8b	00000000-55c0-71db-3cc8-6fded62eea3c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c0-71db-9cdb-77b9d3914f65	00000000-55c0-71db-3cc8-6fded62eea3c	00010000-55c0-71da-dcfc-25c3dedd72d8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c0-71db-859f-c4d1b60e4159	00000000-55c0-71db-5bb4-2f4308b9387a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2973 (class 0 OID 11671641)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c0-71db-8e1f-ff1d97293f34	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c0-71db-344f-0f8decfed678	00010000-55c0-71db-917e-004eb9950bed	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c0-71db-2cf6-3d9de009825b	00010000-55c0-71db-ccd7-6244e485944a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c0-71db-3df5-9058e3d715a0	00010000-55c0-71db-bdc2-31641ce337e9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c0-71db-3998-88f18bc162ec	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c0-71db-85e3-828486a2ceb5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c0-71db-a535-9ece9ffe78f0	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c0-71db-51fd-9d66c5626d80	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c0-71db-41b8-a8b2aeb98639	00010000-55c0-71db-5035-17db7e719a1d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c0-71db-04f9-ec2456acae7b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c0-71db-d277-048f792a17cc	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c0-71db-b917-72198d8c33e6	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c0-71db-d1e2-faeda40fdec3	00010000-55c0-71db-6784-08197993a345	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 11671595)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c0-71d9-b8b5-842cc9c65238	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c0-71d9-dfa9-71205a19fd37	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c0-71d9-cb92-6d0b365e2801	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c0-71d9-2cdc-2cb982138b4f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c0-71d9-052f-bc607dba81ba	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c0-71d9-ced7-d89bf2260c07	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c0-71d9-218b-d0429765229b	Abonma-read	Abonma - branje	f
00030000-55c0-71d9-b152-1371b46f9eed	Abonma-write	Abonma - spreminjanje	f
00030000-55c0-71d9-11f5-281efee64b77	Alternacija-read	Alternacija - branje	f
00030000-55c0-71d9-0fe5-767e30706a51	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c0-71d9-317a-9f0497a8c9e7	Arhivalija-read	Arhivalija - branje	f
00030000-55c0-71d9-d2cc-c82089a79371	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c0-71d9-0e53-3564248b2afc	Besedilo-read	Besedilo - branje	f
00030000-55c0-71d9-69eb-ef1c47e84b1e	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c0-71d9-58af-f2075e825e73	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c0-71d9-cfbf-046d38655b1f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c0-71d9-4f53-010b964ce140	Dogodek-read	Dogodek - branje	f
00030000-55c0-71d9-29f2-42049e58a1ea	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c0-71d9-1d92-03fe024be7df	DrugiVir-read	DrugiVir - branje	f
00030000-55c0-71d9-85f0-0b73fd85991b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c0-71d9-0849-2016df8d9fb0	Drzava-read	Drzava - branje	f
00030000-55c0-71d9-6cd4-b3301661f3cd	Drzava-write	Drzava - spreminjanje	f
00030000-55c0-71d9-a602-65c8b2664f6c	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c0-71d9-7765-d5d08faae097	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c0-71d9-bcef-f912f8665a57	Funkcija-read	Funkcija - branje	f
00030000-55c0-71d9-e37a-690ef9eae247	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c0-71d9-2432-8cece8a1e355	Gostovanje-read	Gostovanje - branje	f
00030000-55c0-71d9-c77f-1058f74105fc	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c0-71d9-5889-8bff64ee5e24	Gostujoca-read	Gostujoca - branje	f
00030000-55c0-71d9-04c9-d2f0e919986b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c0-71d9-880e-15607e098222	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c0-71d9-66ae-629a1dbf7697	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c0-71d9-753b-9eae867b4070	Kupec-read	Kupec - branje	f
00030000-55c0-71d9-1339-962d38ebe639	Kupec-write	Kupec - spreminjanje	f
00030000-55c0-71d9-cc01-e8112693c807	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c0-71d9-eddf-7be4da0e4383	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c0-71d9-d6ec-75a7d872a7ac	Option-read	Option - branje	f
00030000-55c0-71d9-b4ea-d8d75078fb4d	Option-write	Option - spreminjanje	f
00030000-55c0-71d9-b065-1ce55bda84ff	OptionValue-read	OptionValue - branje	f
00030000-55c0-71d9-f310-23a55cef9d31	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c0-71d9-b018-0ed0c379e155	Oseba-read	Oseba - branje	f
00030000-55c0-71d9-f2d5-45198be25de8	Oseba-write	Oseba - spreminjanje	f
00030000-55c0-71d9-6de0-9159fc625a12	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c0-71d9-b1e2-27ffb4094309	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c0-71d9-9c6c-17275d666d8d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c0-71d9-a6ec-fd514961bdbe	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c0-71d9-6357-51a13222792e	Pogodba-read	Pogodba - branje	f
00030000-55c0-71d9-f44e-b8f9cc1ca535	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c0-71d9-6aed-c410c03d504b	Popa-read	Popa - branje	f
00030000-55c0-71d9-8556-7800f8dddc30	Popa-write	Popa - spreminjanje	f
00030000-55c0-71d9-3826-3ff8b371c031	Posta-read	Posta - branje	f
00030000-55c0-71d9-90f3-bd87c01d4049	Posta-write	Posta - spreminjanje	f
00030000-55c0-71d9-04a6-30d0faddf84f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c0-71d9-f199-5f82496ae906	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c0-71d9-905c-c9b8d6c85604	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c0-71d9-ac9b-6e72d20ca0f9	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c0-71d9-69c9-eb905384a9fe	Predstava-read	Predstava - branje	f
00030000-55c0-71d9-7ab8-157161fba4f0	Predstava-write	Predstava - spreminjanje	f
00030000-55c0-71d9-1dd6-36c3c1c4dcd7	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c0-71d9-7947-f435c7a283f4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c0-71d9-9e74-deda431057b2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c0-71d9-e1a7-b767bd3a60a8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c0-71d9-2bdc-3398d9690e11	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c0-71d9-7044-13e11e373612	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c0-71d9-477c-eb7b4afdb8ce	ProgramDela-read	ProgramDela - branje	f
00030000-55c0-71d9-082e-894f0e9ea5fc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c0-71d9-66d7-138071677743	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c0-71d9-10ee-75f8326674ec	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c0-71d9-3a37-4add5ef1b20d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c0-71d9-6bb9-2dbeb7f7843f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c0-71d9-57db-90588625b2c4	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c0-71d9-aba7-efc98b13f42a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c0-71d9-236f-b8546af1331a	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c0-71d9-b2ea-dc1e6b7caf35	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c0-71d9-6e98-e9b7c2d6d22f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c0-71d9-06f4-a47fa76aaab2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c0-71d9-e100-371d44333d52	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c0-71d9-9ad1-c93d39d9891b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c0-71d9-7a17-e78b9665638a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c0-71d9-5b7e-53520e4097dc	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c0-71d9-23f2-1d9d9045abb5	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c0-71d9-811a-7330ecf9a899	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c0-71d9-dcf8-ff200033d243	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c0-71d9-fe21-1c897baf9443	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c0-71d9-3346-e1ef206d29da	Prostor-read	Prostor - branje	f
00030000-55c0-71d9-f22f-61508e249d2b	Prostor-write	Prostor - spreminjanje	f
00030000-55c0-71da-7f20-8293c3b45caa	Racun-read	Racun - branje	f
00030000-55c0-71da-7ead-eb6d2f6a8000	Racun-write	Racun - spreminjanje	f
00030000-55c0-71da-9b7a-e9fd12bd06e4	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c0-71da-bc52-f6cbca5b614f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c0-71da-6abf-0621351d0e36	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c0-71da-8024-e95637d5cfe2	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c0-71da-6091-000b775a0336	Rekvizit-read	Rekvizit - branje	f
00030000-55c0-71da-09d3-e85063485fd3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c0-71da-50bb-7fdad93c86ea	Revizija-read	Revizija - branje	f
00030000-55c0-71da-9ea8-ef6e05779398	Revizija-write	Revizija - spreminjanje	f
00030000-55c0-71da-6cb5-36d340ef4998	Rezervacija-read	Rezervacija - branje	f
00030000-55c0-71da-e8e2-893252722bb3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c0-71da-46f8-b16ef45609b2	SedezniRed-read	SedezniRed - branje	f
00030000-55c0-71da-9239-83fa3659069a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c0-71da-7263-99d2f4373ec9	Sedez-read	Sedez - branje	f
00030000-55c0-71da-0704-0dc831090114	Sedez-write	Sedez - spreminjanje	f
00030000-55c0-71da-a35e-23c546a85dea	Sezona-read	Sezona - branje	f
00030000-55c0-71da-6fce-762a075ed02f	Sezona-write	Sezona - spreminjanje	f
00030000-55c0-71da-753f-d1d438edb8ea	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c0-71da-b85b-57037a315018	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c0-71da-d6ad-0933111925da	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c0-71da-4e86-74cf08049778	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c0-71da-089f-ffd31a67080a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c0-71da-677a-0340472409c7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c0-71da-fc26-049c8b1529bf	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c0-71da-cc63-68fdd0da5028	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c0-71da-931a-a3f260a5375d	Telefonska-read	Telefonska - branje	f
00030000-55c0-71da-33e9-13d451afbfb2	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c0-71da-ff4e-284c27773e9b	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c0-71da-e918-d59136976041	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c0-71da-bd51-defaf0b75b08	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c0-71da-f785-aa1ec426d6de	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c0-71da-6c7c-750ee9ee9b7f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c0-71da-5cef-386735a501bc	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c0-71da-3f17-ca8b23b95f3a	Trr-read	Trr - branje	f
00030000-55c0-71da-6051-c201109367a0	Trr-write	Trr - spreminjanje	f
00030000-55c0-71da-d0f0-253a3e258867	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c0-71da-18d7-19b6c857c440	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c0-71da-d639-4c707157790b	Vaja-read	Vaja - branje	f
00030000-55c0-71da-ee92-900d652811b0	Vaja-write	Vaja - spreminjanje	f
00030000-55c0-71da-edfa-f6ca7cd40810	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c0-71da-dc7e-567cad60050d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c0-71da-ea15-7b34921a4f1c	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c0-71da-159f-76246f214d07	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c0-71da-11fc-3bd764d28799	Zasedenost-read	Zasedenost - branje	f
00030000-55c0-71da-fc09-6aba6a8dd07f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c0-71da-be06-54d973ee499c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c0-71da-70b7-fb146f230f06	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c0-71da-409f-7a8b488892ab	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c0-71da-688f-ae8f73c9f78c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c0-71da-9510-d6112a393995	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c0-71da-f71d-e2caaea96e7b	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c0-71da-051d-6ebca399925a	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c0-71da-4ba3-f1907225d8fc	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c0-71da-21cc-47038232d897	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c0-71da-a4fe-0361d5016f7e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c0-71da-79ab-43b7b4f06442	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c0-71da-af39-54cfaccbdd25	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c0-71da-14cc-dd45ec0bdfe4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c0-71da-6a8c-f4020f94c784	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c0-71da-6e32-231723186bba	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c0-71da-47c9-b1033933516f	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2970 (class 0 OID 11671614)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c0-71da-eb5a-3fcea882f55c	00030000-55c0-71d9-dfa9-71205a19fd37
00020000-55c0-71da-5dac-3d012ab11859	00030000-55c0-71d9-0849-2016df8d9fb0
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-218b-d0429765229b
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-b152-1371b46f9eed
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-11f5-281efee64b77
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-0fe5-767e30706a51
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-317a-9f0497a8c9e7
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-4f53-010b964ce140
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-2cdc-2cb982138b4f
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-29f2-42049e58a1ea
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-0849-2016df8d9fb0
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-6cd4-b3301661f3cd
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-bcef-f912f8665a57
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-e37a-690ef9eae247
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-2432-8cece8a1e355
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-c77f-1058f74105fc
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-5889-8bff64ee5e24
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-04c9-d2f0e919986b
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-880e-15607e098222
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-66ae-629a1dbf7697
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-d6ec-75a7d872a7ac
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-b065-1ce55bda84ff
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-b018-0ed0c379e155
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-f2d5-45198be25de8
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-6aed-c410c03d504b
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-8556-7800f8dddc30
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-3826-3ff8b371c031
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-90f3-bd87c01d4049
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-905c-c9b8d6c85604
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-ac9b-6e72d20ca0f9
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-69c9-eb905384a9fe
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-7ab8-157161fba4f0
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-2bdc-3398d9690e11
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-7044-13e11e373612
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-3346-e1ef206d29da
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71d9-f22f-61508e249d2b
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-6abf-0621351d0e36
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-8024-e95637d5cfe2
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-6091-000b775a0336
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-09d3-e85063485fd3
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-a35e-23c546a85dea
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-6fce-762a075ed02f
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-bd51-defaf0b75b08
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-d0f0-253a3e258867
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-18d7-19b6c857c440
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-d639-4c707157790b
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-ee92-900d652811b0
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-11fc-3bd764d28799
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-fc09-6aba6a8dd07f
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-be06-54d973ee499c
00020000-55c0-71da-dc44-3c1600918717	00030000-55c0-71da-409f-7a8b488892ab
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-218b-d0429765229b
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-317a-9f0497a8c9e7
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-4f53-010b964ce140
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-0849-2016df8d9fb0
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-2432-8cece8a1e355
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-5889-8bff64ee5e24
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-880e-15607e098222
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-66ae-629a1dbf7697
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-d6ec-75a7d872a7ac
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-b065-1ce55bda84ff
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-b018-0ed0c379e155
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-f2d5-45198be25de8
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-6aed-c410c03d504b
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-3826-3ff8b371c031
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-905c-c9b8d6c85604
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-ac9b-6e72d20ca0f9
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-69c9-eb905384a9fe
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71d9-3346-e1ef206d29da
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-6abf-0621351d0e36
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-6091-000b775a0336
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-a35e-23c546a85dea
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-931a-a3f260a5375d
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-33e9-13d451afbfb2
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-3f17-ca8b23b95f3a
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-6051-c201109367a0
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-ea15-7b34921a4f1c
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-159f-76246f214d07
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-be06-54d973ee499c
00020000-55c0-71da-4880-2a7ba8287abf	00030000-55c0-71da-409f-7a8b488892ab
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-218b-d0429765229b
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-11f5-281efee64b77
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-317a-9f0497a8c9e7
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-d2cc-c82089a79371
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-0e53-3564248b2afc
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-58af-f2075e825e73
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-4f53-010b964ce140
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-0849-2016df8d9fb0
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-bcef-f912f8665a57
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-2432-8cece8a1e355
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-5889-8bff64ee5e24
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-880e-15607e098222
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-d6ec-75a7d872a7ac
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-b065-1ce55bda84ff
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-b018-0ed0c379e155
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-6aed-c410c03d504b
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-3826-3ff8b371c031
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-69c9-eb905384a9fe
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-2bdc-3398d9690e11
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71d9-3346-e1ef206d29da
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71da-6abf-0621351d0e36
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71da-6091-000b775a0336
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71da-a35e-23c546a85dea
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71da-bd51-defaf0b75b08
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71da-d639-4c707157790b
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71da-11fc-3bd764d28799
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71da-be06-54d973ee499c
00020000-55c0-71da-034d-836b432dc883	00030000-55c0-71da-409f-7a8b488892ab
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-218b-d0429765229b
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-b152-1371b46f9eed
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-0fe5-767e30706a51
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-317a-9f0497a8c9e7
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-4f53-010b964ce140
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-0849-2016df8d9fb0
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-2432-8cece8a1e355
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-5889-8bff64ee5e24
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-d6ec-75a7d872a7ac
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-b065-1ce55bda84ff
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-6aed-c410c03d504b
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-3826-3ff8b371c031
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-69c9-eb905384a9fe
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71d9-3346-e1ef206d29da
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71da-6abf-0621351d0e36
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71da-6091-000b775a0336
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71da-a35e-23c546a85dea
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71da-bd51-defaf0b75b08
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71da-be06-54d973ee499c
00020000-55c0-71da-d5d6-7c6c5b0e565c	00030000-55c0-71da-409f-7a8b488892ab
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-218b-d0429765229b
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-317a-9f0497a8c9e7
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-4f53-010b964ce140
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-0849-2016df8d9fb0
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-2432-8cece8a1e355
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-5889-8bff64ee5e24
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-d6ec-75a7d872a7ac
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-b065-1ce55bda84ff
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-6aed-c410c03d504b
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-3826-3ff8b371c031
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-69c9-eb905384a9fe
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-3346-e1ef206d29da
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71da-6abf-0621351d0e36
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71da-6091-000b775a0336
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71da-a35e-23c546a85dea
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71da-ff4e-284c27773e9b
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71d9-cb92-6d0b365e2801
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71da-bd51-defaf0b75b08
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71da-be06-54d973ee499c
00020000-55c0-71da-9846-3b4bda293b34	00030000-55c0-71da-409f-7a8b488892ab
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-b8b5-842cc9c65238
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-dfa9-71205a19fd37
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-cb92-6d0b365e2801
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-2cdc-2cb982138b4f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-052f-bc607dba81ba
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-ced7-d89bf2260c07
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-218b-d0429765229b
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-b152-1371b46f9eed
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-11f5-281efee64b77
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-0fe5-767e30706a51
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-317a-9f0497a8c9e7
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-d2cc-c82089a79371
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-0e53-3564248b2afc
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-69eb-ef1c47e84b1e
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-58af-f2075e825e73
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-cfbf-046d38655b1f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-4f53-010b964ce140
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-29f2-42049e58a1ea
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-0849-2016df8d9fb0
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-6cd4-b3301661f3cd
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-1d92-03fe024be7df
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-85f0-0b73fd85991b
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-a602-65c8b2664f6c
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-7765-d5d08faae097
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-bcef-f912f8665a57
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-e37a-690ef9eae247
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-2432-8cece8a1e355
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-c77f-1058f74105fc
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-5889-8bff64ee5e24
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-04c9-d2f0e919986b
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-880e-15607e098222
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-66ae-629a1dbf7697
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-753b-9eae867b4070
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-1339-962d38ebe639
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-cc01-e8112693c807
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-eddf-7be4da0e4383
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-d6ec-75a7d872a7ac
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-b4ea-d8d75078fb4d
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-b065-1ce55bda84ff
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-f310-23a55cef9d31
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-b018-0ed0c379e155
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-f2d5-45198be25de8
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-6de0-9159fc625a12
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-b1e2-27ffb4094309
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-9c6c-17275d666d8d
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-a6ec-fd514961bdbe
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-6357-51a13222792e
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-f44e-b8f9cc1ca535
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-6aed-c410c03d504b
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-8556-7800f8dddc30
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-3826-3ff8b371c031
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-90f3-bd87c01d4049
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-04a6-30d0faddf84f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-f199-5f82496ae906
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-905c-c9b8d6c85604
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-ac9b-6e72d20ca0f9
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-69c9-eb905384a9fe
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-7ab8-157161fba4f0
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-1dd6-36c3c1c4dcd7
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-7947-f435c7a283f4
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-9e74-deda431057b2
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-e1a7-b767bd3a60a8
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-2bdc-3398d9690e11
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-7044-13e11e373612
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-477c-eb7b4afdb8ce
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-082e-894f0e9ea5fc
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-66d7-138071677743
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-10ee-75f8326674ec
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-3a37-4add5ef1b20d
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-6bb9-2dbeb7f7843f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-57db-90588625b2c4
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-aba7-efc98b13f42a
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-236f-b8546af1331a
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-b2ea-dc1e6b7caf35
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-6e98-e9b7c2d6d22f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-06f4-a47fa76aaab2
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-e100-371d44333d52
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-9ad1-c93d39d9891b
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-7a17-e78b9665638a
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-5b7e-53520e4097dc
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-23f2-1d9d9045abb5
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-811a-7330ecf9a899
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-dcf8-ff200033d243
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-fe21-1c897baf9443
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-3346-e1ef206d29da
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71d9-f22f-61508e249d2b
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-7f20-8293c3b45caa
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-7ead-eb6d2f6a8000
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-9b7a-e9fd12bd06e4
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-bc52-f6cbca5b614f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-6abf-0621351d0e36
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-8024-e95637d5cfe2
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-6091-000b775a0336
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-09d3-e85063485fd3
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-50bb-7fdad93c86ea
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-9ea8-ef6e05779398
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-6cb5-36d340ef4998
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-e8e2-893252722bb3
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-46f8-b16ef45609b2
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-9239-83fa3659069a
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-7263-99d2f4373ec9
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-0704-0dc831090114
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-a35e-23c546a85dea
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-6fce-762a075ed02f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-753f-d1d438edb8ea
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-b85b-57037a315018
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-d6ad-0933111925da
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-4e86-74cf08049778
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-089f-ffd31a67080a
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-677a-0340472409c7
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-fc26-049c8b1529bf
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-cc63-68fdd0da5028
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-931a-a3f260a5375d
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-33e9-13d451afbfb2
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-ff4e-284c27773e9b
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-e918-d59136976041
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-bd51-defaf0b75b08
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-f785-aa1ec426d6de
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-6c7c-750ee9ee9b7f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-5cef-386735a501bc
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-3f17-ca8b23b95f3a
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-6051-c201109367a0
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-d0f0-253a3e258867
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-18d7-19b6c857c440
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-d639-4c707157790b
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-ee92-900d652811b0
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-edfa-f6ca7cd40810
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-dc7e-567cad60050d
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-ea15-7b34921a4f1c
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-159f-76246f214d07
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-11fc-3bd764d28799
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-fc09-6aba6a8dd07f
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-be06-54d973ee499c
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-70b7-fb146f230f06
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-409f-7a8b488892ab
00020000-55c0-71db-1ada-8fb7aca5ff8b	00030000-55c0-71da-688f-ae8f73c9f78c
\.


--
-- TOC entry 2998 (class 0 OID 11671913)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 11671944)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 11672058)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c0-71db-bff6-ed70ba993483	00090000-55c0-71db-8e1f-ff1d97293f34	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c0-71db-5259-4af5d3116d94	00090000-55c0-71db-85e3-828486a2ceb5	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c0-71db-dc98-5bc877b4ea10	00090000-55c0-71db-d1e2-faeda40fdec3	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2975 (class 0 OID 11671674)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c0-71db-2eb9-1f3f443eea94	00040000-55c0-71d9-c621-99e0a5be09f8	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-71db-b802-9de6ddbb6562	00040000-55c0-71d9-c621-99e0a5be09f8	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c0-71db-80e2-4795dda91556	00040000-55c0-71d9-c621-99e0a5be09f8	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-71db-280a-b906333d3b44	00040000-55c0-71d9-c621-99e0a5be09f8	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-71db-2b8c-0c751fa77d3d	00040000-55c0-71d9-c621-99e0a5be09f8	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-71db-dac1-84ed6c58f6fc	00040000-55c0-71d9-a21c-a2e0f1de9188	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-71db-5d6d-683323ffd241	00040000-55c0-71d9-4cd8-18410c43add9	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-71db-b153-36985cea5871	00040000-55c0-71d9-db4a-c7208c1d235a	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-71db-b01d-1540a72af94c	00040000-55c0-71d9-c621-99e0a5be09f8	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2977 (class 0 OID 11671709)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c0-71da-15f6-ba3ba2f7ac8a	8341	Adlešiči
00050000-55c0-71da-3792-1866c176aa8d	5270	Ajdovščina
00050000-55c0-71da-6241-0521340569ac	6280	Ankaran/Ancarano
00050000-55c0-71da-0c48-f4fc1ef3f3fe	9253	Apače
00050000-55c0-71da-2c62-945bebb67ec3	8253	Artiče
00050000-55c0-71da-debf-107dbc084681	4275	Begunje na Gorenjskem
00050000-55c0-71da-7a64-191d2c5a195e	1382	Begunje pri Cerknici
00050000-55c0-71da-bb43-2f735d4cd436	9231	Beltinci
00050000-55c0-71da-6125-e6cee535cfdb	2234	Benedikt
00050000-55c0-71da-655f-3f412172607f	2345	Bistrica ob Dravi
00050000-55c0-71da-3dda-5d3b28d1ce85	3256	Bistrica ob Sotli
00050000-55c0-71da-2086-841c7d979084	8259	Bizeljsko
00050000-55c0-71da-9704-1f2b449231a4	1223	Blagovica
00050000-55c0-71da-64c2-25760a9483c1	8283	Blanca
00050000-55c0-71da-f79d-df0ebe38adde	4260	Bled
00050000-55c0-71da-59e7-0c20146bc059	4273	Blejska Dobrava
00050000-55c0-71da-6b09-89b3a585a0d4	9265	Bodonci
00050000-55c0-71da-41e1-ad7afbed1b6a	9222	Bogojina
00050000-55c0-71da-45b0-af802378d093	4263	Bohinjska Bela
00050000-55c0-71da-49e3-e0933afe6bc0	4264	Bohinjska Bistrica
00050000-55c0-71da-576c-2914af534408	4265	Bohinjsko jezero
00050000-55c0-71da-d3a7-22db93c1ec34	1353	Borovnica
00050000-55c0-71da-08cb-2472ac0abb3c	8294	Boštanj
00050000-55c0-71da-e28e-7fa729c5bd9b	5230	Bovec
00050000-55c0-71da-e229-25b41855d47c	5295	Branik
00050000-55c0-71da-2417-5789ee92710e	3314	Braslovče
00050000-55c0-71da-08a1-6933598916b6	5223	Breginj
00050000-55c0-71da-32aa-85d63420a543	8280	Brestanica
00050000-55c0-71da-3049-29903966c294	2354	Bresternica
00050000-55c0-71da-bb49-a09341beee9b	4243	Brezje
00050000-55c0-71da-199d-b9274f11633f	1351	Brezovica pri Ljubljani
00050000-55c0-71da-4c29-64fcfb28843a	8250	Brežice
00050000-55c0-71da-34b4-40aacb843e92	4210	Brnik - Aerodrom
00050000-55c0-71da-f0db-9eebf71425fb	8321	Brusnice
00050000-55c0-71da-5d05-452f0ddcb27d	3255	Buče
00050000-55c0-71da-5c9b-f410d3a8037d	8276	Bučka 
00050000-55c0-71da-77ca-65a74cc8ba5d	9261	Cankova
00050000-55c0-71da-3ae1-c0d7451355c2	3000	Celje 
00050000-55c0-71da-aca4-6a9f5dd89834	3001	Celje - poštni predali
00050000-55c0-71da-04fd-088d81739c40	4207	Cerklje na Gorenjskem
00050000-55c0-71da-4be1-feed54268918	8263	Cerklje ob Krki
00050000-55c0-71da-7d19-2ea376d782d8	1380	Cerknica
00050000-55c0-71da-992d-45fcdb983b0c	5282	Cerkno
00050000-55c0-71da-c917-9889a3fe9967	2236	Cerkvenjak
00050000-55c0-71da-24d1-d6dcb94d1ba9	2215	Ceršak
00050000-55c0-71da-baf0-6e7eb0c5f2dc	2326	Cirkovce
00050000-55c0-71da-dd34-d7b7301e30cb	2282	Cirkulane
00050000-55c0-71da-14b2-de348a5399cb	5273	Col
00050000-55c0-71da-3076-65f2a7d88b05	8251	Čatež ob Savi
00050000-55c0-71da-360c-96cc4f721e39	1413	Čemšenik
00050000-55c0-71da-56eb-4d628a24328b	5253	Čepovan
00050000-55c0-71da-3d0b-f57f668e249d	9232	Črenšovci
00050000-55c0-71da-8f75-fea4e32230a8	2393	Črna na Koroškem
00050000-55c0-71da-591a-8a15c03535fa	6275	Črni Kal
00050000-55c0-71da-e334-819d76085f78	5274	Črni Vrh nad Idrijo
00050000-55c0-71da-966f-9272636187e8	5262	Črniče
00050000-55c0-71da-40bb-9aa32b86acba	8340	Črnomelj
00050000-55c0-71da-b378-5a0b1daefa2b	6271	Dekani
00050000-55c0-71da-349b-c6634fb3c5c1	5210	Deskle
00050000-55c0-71da-9562-4271fe291b2b	2253	Destrnik
00050000-55c0-71da-e4ad-b47b2b712dd6	6215	Divača
00050000-55c0-71da-3207-e49ef0100526	1233	Dob
00050000-55c0-71da-6609-cde8a46643b7	3224	Dobje pri Planini
00050000-55c0-71da-d1b3-0b65e9f1260c	8257	Dobova
00050000-55c0-71da-6a5b-97df93dba03b	1423	Dobovec
00050000-55c0-71da-2e86-f15608c1cbaf	5263	Dobravlje
00050000-55c0-71da-6d84-1c445fa9e5ab	3204	Dobrna
00050000-55c0-71da-1a18-280a73f9b235	8211	Dobrnič
00050000-55c0-71da-3c47-02e17bef1d48	1356	Dobrova
00050000-55c0-71da-3b47-c3715bbceaf2	9223	Dobrovnik/Dobronak 
00050000-55c0-71da-4579-c6548bf425c3	5212	Dobrovo v Brdih
00050000-55c0-71da-241b-eb0cc5d7b716	1431	Dol pri Hrastniku
00050000-55c0-71da-073a-00e1d82e43a3	1262	Dol pri Ljubljani
00050000-55c0-71da-3daf-f404585f3133	1273	Dole pri Litiji
00050000-55c0-71da-a086-fac95fd53594	1331	Dolenja vas
00050000-55c0-71da-7806-0cf8ac69e5ae	8350	Dolenjske Toplice
00050000-55c0-71da-6542-29e03fcf070d	1230	Domžale
00050000-55c0-71da-0045-04b2b725461e	2252	Dornava
00050000-55c0-71da-7aa1-67ab2dd95e9e	5294	Dornberk
00050000-55c0-71da-c35b-a744b52f3419	1319	Draga
00050000-55c0-71da-9b46-fd0259f3ced6	8343	Dragatuš
00050000-55c0-71da-74e4-18f0e64c5155	3222	Dramlje
00050000-55c0-71da-9674-e8549163867f	2370	Dravograd
00050000-55c0-71da-0556-7c6d5828a6a4	4203	Duplje
00050000-55c0-71da-713b-424691a85c7d	6221	Dutovlje
00050000-55c0-71da-d980-ab5b5087d1f2	8361	Dvor
00050000-55c0-71da-244f-df05049ca12e	2343	Fala
00050000-55c0-71da-e6bc-1e593fd70842	9208	Fokovci
00050000-55c0-71da-0266-ccd5911628bd	2313	Fram
00050000-55c0-71da-fbee-bcc4097aab94	3213	Frankolovo
00050000-55c0-71da-7389-d56cabba5478	1274	Gabrovka
00050000-55c0-71da-40ee-b569f68b4dc9	8254	Globoko
00050000-55c0-71da-03e2-1752405bb953	5275	Godovič
00050000-55c0-71da-36f1-eea2feb6142a	4204	Golnik
00050000-55c0-71da-eaa2-eb083168649a	3303	Gomilsko
00050000-55c0-71da-541c-822c1523637e	4224	Gorenja vas
00050000-55c0-71da-b5ad-40a4546de4e4	3263	Gorica pri Slivnici
00050000-55c0-71da-e506-47572cdc5f43	2272	Gorišnica
00050000-55c0-71da-d9b1-feb1559b849d	9250	Gornja Radgona
00050000-55c0-71da-d33f-fa3a13a5e7ec	3342	Gornji Grad
00050000-55c0-71da-f8e2-456861ee0599	4282	Gozd Martuljek
00050000-55c0-71da-6ac3-4ae4ebb3a8e3	6272	Gračišče
00050000-55c0-71da-59dc-fc8751137dbd	9264	Grad
00050000-55c0-71da-1fda-0b6dce02b7ff	8332	Gradac
00050000-55c0-71da-e452-7101bfbf8483	1384	Grahovo
00050000-55c0-71da-5e8c-52a29904d725	5242	Grahovo ob Bači
00050000-55c0-71da-ecb4-76ae70c1655f	5251	Grgar
00050000-55c0-71da-4280-8a16943c1817	3302	Griže
00050000-55c0-71da-a223-bddfe02ffa06	3231	Grobelno
00050000-55c0-71da-b343-778485b2fc95	1290	Grosuplje
00050000-55c0-71da-f3c6-1958cf260608	2288	Hajdina
00050000-55c0-71da-5b0f-0f3704f617bb	8362	Hinje
00050000-55c0-71da-05b3-031380bea848	2311	Hoče
00050000-55c0-71da-57b2-eb453d6c5645	9205	Hodoš/Hodos
00050000-55c0-71da-b52d-5207699c3007	1354	Horjul
00050000-55c0-71da-a829-5b43c3f79ed3	1372	Hotedršica
00050000-55c0-71da-ca34-71a7ce02b46d	1430	Hrastnik
00050000-55c0-71da-2dd9-6f62ddcea88e	6225	Hruševje
00050000-55c0-71da-78d8-e7fd18fad128	4276	Hrušica
00050000-55c0-71da-0013-7bbf0a558f5e	5280	Idrija
00050000-55c0-71da-c13c-4b85d173ba1b	1292	Ig
00050000-55c0-71da-66d7-e4fbae3a7c82	6250	Ilirska Bistrica
00050000-55c0-71da-425e-7e331b888e71	6251	Ilirska Bistrica-Trnovo
00050000-55c0-71da-cc06-33a2bfbd2290	1295	Ivančna Gorica
00050000-55c0-71da-2a3a-662e579f1baa	2259	Ivanjkovci
00050000-55c0-71da-7378-e68d2834e51e	1411	Izlake
00050000-55c0-71da-5748-9f64bed713da	6310	Izola/Isola
00050000-55c0-71da-a22e-6247af887577	2222	Jakobski Dol
00050000-55c0-71da-5a45-17e5b0f1d55c	2221	Jarenina
00050000-55c0-71da-662a-0f953a60e7c3	6254	Jelšane
00050000-55c0-71da-58a6-d99b23ed1af6	4270	Jesenice
00050000-55c0-71da-3dcb-8b008993db10	8261	Jesenice na Dolenjskem
00050000-55c0-71da-c0e1-85c00e7b8f59	3273	Jurklošter
00050000-55c0-71da-3ee8-97bda47e79b4	2223	Jurovski Dol
00050000-55c0-71da-2492-d9c443b9734c	2256	Juršinci
00050000-55c0-71da-a784-b0c199b0872b	5214	Kal nad Kanalom
00050000-55c0-71da-2338-47eaf2ff0ebb	3233	Kalobje
00050000-55c0-71da-668e-c3999ca8009f	4246	Kamna Gorica
00050000-55c0-71da-a6e5-8e702d53ce15	2351	Kamnica
00050000-55c0-71da-fe5c-68754901b843	1241	Kamnik
00050000-55c0-71da-2114-8c57834b234f	5213	Kanal
00050000-55c0-71da-eded-8dee4332f530	8258	Kapele
00050000-55c0-71da-37d6-cdaaa13872ec	2362	Kapla
00050000-55c0-71da-128e-f85430297daf	2325	Kidričevo
00050000-55c0-71da-325b-0398a0886d86	1412	Kisovec
00050000-55c0-71da-3472-88f9022f5af0	6253	Knežak
00050000-55c0-71da-7f1a-f16cab4108d5	5222	Kobarid
00050000-55c0-71da-a0e8-fa8505fda3d2	9227	Kobilje
00050000-55c0-71da-029e-b0e60f062a6f	1330	Kočevje
00050000-55c0-71da-9321-e88d2db43f79	1338	Kočevska Reka
00050000-55c0-71da-e779-6d56ea238e3c	2276	Kog
00050000-55c0-71da-9eb3-caac5cd82110	5211	Kojsko
00050000-55c0-71da-902d-8bb7db218684	6223	Komen
00050000-55c0-71da-82d5-6758ec2487dc	1218	Komenda
00050000-55c0-71da-7756-d9d797226452	6000	Koper/Capodistria 
00050000-55c0-71da-7a65-a6acbb165ec1	6001	Koper/Capodistria - poštni predali
00050000-55c0-71da-081b-d18f3fb9e4f3	8282	Koprivnica
00050000-55c0-71da-0c45-a5094172cd61	5296	Kostanjevica na Krasu
00050000-55c0-71da-b148-c0799726959b	8311	Kostanjevica na Krki
00050000-55c0-71da-b66a-b07e647b1f17	1336	Kostel
00050000-55c0-71da-e794-588663a06be6	6256	Košana
00050000-55c0-71da-515d-133723e93fae	2394	Kotlje
00050000-55c0-71da-339b-1ad34e48355c	6240	Kozina
00050000-55c0-71da-ea63-6fb4f84ccd70	3260	Kozje
00050000-55c0-71da-5dba-5f038af949ef	4000	Kranj 
00050000-55c0-71da-4a67-60efa26dc7b8	4001	Kranj - poštni predali
00050000-55c0-71da-6987-a835487e9160	4280	Kranjska Gora
00050000-55c0-71da-6b14-30ff09cead2b	1281	Kresnice
00050000-55c0-71da-0798-67cc658a9c25	4294	Križe
00050000-55c0-71da-90b0-39317f70752f	9206	Križevci
00050000-55c0-71da-c676-ede70ef171da	9242	Križevci pri Ljutomeru
00050000-55c0-71da-c07c-7d07f61102e6	1301	Krka
00050000-55c0-71da-d5d0-e3b28023fd91	8296	Krmelj
00050000-55c0-71da-13e2-c354ff8ad8db	4245	Kropa
00050000-55c0-71da-0a7d-474cb1a7d853	8262	Krška vas
00050000-55c0-71da-582a-03d60a09180c	8270	Krško
00050000-55c0-71da-6c12-abf3ac78031d	9263	Kuzma
00050000-55c0-71da-7020-2c3708ce3a7d	2318	Laporje
00050000-55c0-71da-09aa-39669c7f017a	3270	Laško
00050000-55c0-71da-f11a-6f986e7d6ca1	1219	Laze v Tuhinju
00050000-55c0-71da-5679-71ea6b6544df	2230	Lenart v Slovenskih goricah
00050000-55c0-71da-a4c9-c5161bf91b22	9220	Lendava/Lendva
00050000-55c0-71da-791a-347002ba3de3	4248	Lesce
00050000-55c0-71da-4bb4-91707c3a4c3d	3261	Lesično
00050000-55c0-71da-b1e1-df8d9cf10b22	8273	Leskovec pri Krškem
00050000-55c0-71da-b627-0e775f5cbd4e	2372	Libeliče
00050000-55c0-71da-49c2-343d8b378b1f	2341	Limbuš
00050000-55c0-71da-7080-d35f99f878fa	1270	Litija
00050000-55c0-71da-b846-ac895db3ae0d	3202	Ljubečna
00050000-55c0-71da-bab5-4a5d2cf95bd3	1000	Ljubljana 
00050000-55c0-71da-2c24-4e5b046b7915	1001	Ljubljana - poštni predali
00050000-55c0-71da-cc4c-8ad7dd1b0562	1231	Ljubljana - Črnuče
00050000-55c0-71da-a91b-5f2ff920ea94	1261	Ljubljana - Dobrunje
00050000-55c0-71da-164e-2217600dc7cd	1260	Ljubljana - Polje
00050000-55c0-71da-ecf6-55931d06ccc5	1210	Ljubljana - Šentvid
00050000-55c0-71da-0a5e-1d7e96ed578a	1211	Ljubljana - Šmartno
00050000-55c0-71da-ab2e-497e6b27ff75	3333	Ljubno ob Savinji
00050000-55c0-71da-c5d9-3e5f2db02fa3	9240	Ljutomer
00050000-55c0-71da-a4e0-b262ec60f000	3215	Loče
00050000-55c0-71da-7af1-0cae52324066	5231	Log pod Mangartom
00050000-55c0-71da-11ae-02bf1f3b111d	1358	Log pri Brezovici
00050000-55c0-71da-a89a-8d091275b9d9	1370	Logatec
00050000-55c0-71da-dead-41188f812164	1371	Logatec
00050000-55c0-71da-d480-c82b82062e5e	1434	Loka pri Zidanem Mostu
00050000-55c0-71da-b004-68d232ba6a38	3223	Loka pri Žusmu
00050000-55c0-71da-39c6-8af0f9b010ae	6219	Lokev
00050000-55c0-71da-6201-6694595a8fc4	1318	Loški Potok
00050000-55c0-71da-06eb-6f0fdafd2700	2324	Lovrenc na Dravskem polju
00050000-55c0-71da-0d47-4199b71a79fb	2344	Lovrenc na Pohorju
00050000-55c0-71da-124b-060c42dcd29d	3334	Luče
00050000-55c0-71da-1ff4-74fbc8cbd6aa	1225	Lukovica
00050000-55c0-71da-d399-ab30f75e0709	9202	Mačkovci
00050000-55c0-71da-bc59-d4ec4406f880	2322	Majšperk
00050000-55c0-71da-bc94-6b51ad8608a9	2321	Makole
00050000-55c0-71da-9072-ea17360cead1	9243	Mala Nedelja
00050000-55c0-71da-8182-346fa705959a	2229	Malečnik
00050000-55c0-71da-2069-950884d1262c	6273	Marezige
00050000-55c0-71da-ffaa-c269af66924a	2000	Maribor 
00050000-55c0-71da-6e9f-6d9d4202176c	2001	Maribor - poštni predali
00050000-55c0-71da-5c43-680b96a57c47	2206	Marjeta na Dravskem polju
00050000-55c0-71da-3ea7-a702f100efef	2281	Markovci
00050000-55c0-71da-f45e-8e9be513c001	9221	Martjanci
00050000-55c0-71da-ba6f-10942dc1603c	6242	Materija
00050000-55c0-71da-404b-facbc88af3d9	4211	Mavčiče
00050000-55c0-71da-6b85-a682c567ae9c	1215	Medvode
00050000-55c0-71da-7867-e71557820f3c	1234	Mengeš
00050000-55c0-71da-206f-21140deef54c	8330	Metlika
00050000-55c0-71da-dfec-f58d5849e632	2392	Mežica
00050000-55c0-71da-4a96-96106f37735c	2204	Miklavž na Dravskem polju
00050000-55c0-71da-ebd7-adbbd68db84b	2275	Miklavž pri Ormožu
00050000-55c0-71da-564a-1eff08460dc6	5291	Miren
00050000-55c0-71da-f30b-5a6efdf4fd9e	8233	Mirna
00050000-55c0-71da-4495-9b1431fdef01	8216	Mirna Peč
00050000-55c0-71da-53ca-768377dff3e5	2382	Mislinja
00050000-55c0-71da-103a-262c9ebbd18d	4281	Mojstrana
00050000-55c0-71da-148b-c51de188d08d	8230	Mokronog
00050000-55c0-71da-9869-d49f97f800f0	1251	Moravče
00050000-55c0-71da-0358-505919360c97	9226	Moravske Toplice
00050000-55c0-71da-9027-80f406eb0f9d	5216	Most na Soči
00050000-55c0-71da-5c0c-9009d911b47a	1221	Motnik
00050000-55c0-71da-a610-0966945b7e27	3330	Mozirje
00050000-55c0-71da-484a-a3fb6a76dec2	9000	Murska Sobota 
00050000-55c0-71da-6a65-69afc499df1d	9001	Murska Sobota - poštni predali
00050000-55c0-71da-9dfd-8a68f3c0c6e4	2366	Muta
00050000-55c0-71da-221e-0adcd5b006df	4202	Naklo
00050000-55c0-71da-3241-d75fdeb82f49	3331	Nazarje
00050000-55c0-71da-7045-87c2f4b38606	1357	Notranje Gorice
00050000-55c0-71da-e1bc-ef300efc0735	3203	Nova Cerkev
00050000-55c0-71da-2cc1-3288ece86563	5000	Nova Gorica 
00050000-55c0-71da-ad72-fc2dd65be533	5001	Nova Gorica - poštni predali
00050000-55c0-71da-e79b-99bd0c53db94	1385	Nova vas
00050000-55c0-71da-fd1e-3fb433d734a1	8000	Novo mesto
00050000-55c0-71da-4bf0-3ca5a5d859a4	8001	Novo mesto - poštni predali
00050000-55c0-71da-52a1-6f76b0c3670b	6243	Obrov
00050000-55c0-71da-fdc5-7593ae9d07b4	9233	Odranci
00050000-55c0-71da-fd3f-b23552434edd	2317	Oplotnica
00050000-55c0-71da-f5bc-76087492a1d6	2312	Orehova vas
00050000-55c0-71da-5f87-eae996318f1c	2270	Ormož
00050000-55c0-71da-b157-4b815d703e91	1316	Ortnek
00050000-55c0-71da-4f8f-18731e623648	1337	Osilnica
00050000-55c0-71da-ffe0-02323b9d2df0	8222	Otočec
00050000-55c0-71da-e874-2b2ac4f51e33	2361	Ožbalt
00050000-55c0-71da-5c24-9f6aa607d73e	2231	Pernica
00050000-55c0-71da-5778-a35d07c689fd	2211	Pesnica pri Mariboru
00050000-55c0-71da-d00c-70c8629807ea	9203	Petrovci
00050000-55c0-71da-e05b-93baa3e549f8	3301	Petrovče
00050000-55c0-71da-c9b7-114f69f28d34	6330	Piran/Pirano
00050000-55c0-71da-1e41-46b050943ea1	8255	Pišece
00050000-55c0-71da-f0d0-ba0b4b6e5a28	6257	Pivka
00050000-55c0-71da-5cc4-0b00057bc1b4	6232	Planina
00050000-55c0-71da-bc42-d6b460c51f9d	3225	Planina pri Sevnici
00050000-55c0-71da-22ad-3daef92c3d5d	6276	Pobegi
00050000-55c0-71da-97f4-22115bd9874a	8312	Podbočje
00050000-55c0-71da-d13c-f0a8866def14	5243	Podbrdo
00050000-55c0-71da-0d89-ce301aed4eef	3254	Podčetrtek
00050000-55c0-71da-fc89-cbf3120d0d02	2273	Podgorci
00050000-55c0-71da-cffa-b2a2801c3b06	6216	Podgorje
00050000-55c0-71da-0938-7e3e485ebf76	2381	Podgorje pri Slovenj Gradcu
00050000-55c0-71da-34dc-753b96e0793c	6244	Podgrad
00050000-55c0-71da-3a12-4090d916ac5f	1414	Podkum
00050000-55c0-71da-12e2-113bbf0564fd	2286	Podlehnik
00050000-55c0-71da-42ed-91ad412bb524	5272	Podnanos
00050000-55c0-71da-9b80-e63e5aca52ce	4244	Podnart
00050000-55c0-71da-d51b-d0240cfefeb6	3241	Podplat
00050000-55c0-71da-6709-6dc636478d1e	3257	Podsreda
00050000-55c0-71da-8b98-855c7e2be5ec	2363	Podvelka
00050000-55c0-71da-2354-3142dea9dd34	2208	Pohorje
00050000-55c0-71da-24ea-8b48791da2f4	2257	Polenšak
00050000-55c0-71da-67d1-1e1a5696883c	1355	Polhov Gradec
00050000-55c0-71da-0918-271ff9ebc482	4223	Poljane nad Škofjo Loko
00050000-55c0-71da-0b0f-bfe94855a0fc	2319	Poljčane
00050000-55c0-71da-fa43-2c19d139914e	1272	Polšnik
00050000-55c0-71da-321c-49dd39aec363	3313	Polzela
00050000-55c0-71da-abbb-419959c70aa6	3232	Ponikva
00050000-55c0-71da-97b3-15db468cc8fa	6320	Portorož/Portorose
00050000-55c0-71da-4b52-c8feba7ef9f3	6230	Postojna
00050000-55c0-71da-c359-d782a3c96541	2331	Pragersko
00050000-55c0-71da-8525-87f42a17b77f	3312	Prebold
00050000-55c0-71da-8bde-7d7474ca1d86	4205	Preddvor
00050000-55c0-71da-369d-58d21c7cc273	6255	Prem
00050000-55c0-71da-5def-7abe77e73e28	1352	Preserje
00050000-55c0-71da-e38e-fcb9ccf5a0e5	6258	Prestranek
00050000-55c0-71da-4993-68a732e56399	2391	Prevalje
00050000-55c0-71da-8b6c-1510e02186e5	3262	Prevorje
00050000-55c0-71da-f956-023bc7614e05	1276	Primskovo 
00050000-55c0-71da-b226-230863f72046	3253	Pristava pri Mestinju
00050000-55c0-71da-18c5-e790574db202	9207	Prosenjakovci/Partosfalva
00050000-55c0-71da-7682-d20ef4a287f3	5297	Prvačina
00050000-55c0-71da-590f-c8a5b208d517	2250	Ptuj
00050000-55c0-71da-44b7-b6e8cab8a79e	2323	Ptujska Gora
00050000-55c0-71da-6ab7-920288e7ddbe	9201	Puconci
00050000-55c0-71da-2ce7-f1e9ee96c9a7	2327	Rače
00050000-55c0-71da-8ef6-01fc1b4909e5	1433	Radeče
00050000-55c0-71da-2b00-b92db31204fd	9252	Radenci
00050000-55c0-71da-163b-9bbaa9db28d3	2360	Radlje ob Dravi
00050000-55c0-71da-4c05-eb88926845d9	1235	Radomlje
00050000-55c0-71da-5c58-711989304637	4240	Radovljica
00050000-55c0-71da-d6b2-6746409fa142	8274	Raka
00050000-55c0-71da-6560-1abd2f374c41	1381	Rakek
00050000-55c0-71da-a48b-795b9ec68d93	4283	Rateče - Planica
00050000-55c0-71da-af46-463c1390bcd7	2390	Ravne na Koroškem
00050000-55c0-71da-2237-525221c81f8a	9246	Razkrižje
00050000-55c0-71da-8cf9-fe3577d1d3af	3332	Rečica ob Savinji
00050000-55c0-71da-61cb-e924b10b735d	5292	Renče
00050000-55c0-71da-2fe3-fead0b961aab	1310	Ribnica
00050000-55c0-71da-7a03-d7c6f5d7cc79	2364	Ribnica na Pohorju
00050000-55c0-71da-465f-c3680b35a202	3272	Rimske Toplice
00050000-55c0-71da-0fef-ecacac52681f	1314	Rob
00050000-55c0-71da-f0b0-90fa2c15ed47	5215	Ročinj
00050000-55c0-71da-57ff-711eb58c7194	3250	Rogaška Slatina
00050000-55c0-71da-1185-164bb7bcd136	9262	Rogašovci
00050000-55c0-71da-514a-10d5e729ae85	3252	Rogatec
00050000-55c0-71da-7e41-34e262fb96e9	1373	Rovte
00050000-55c0-71da-fdd3-0e955d2b6cec	2342	Ruše
00050000-55c0-71da-541f-dbda2e5a7fa8	1282	Sava
00050000-55c0-71da-85e5-57fc18107d14	6333	Sečovlje/Sicciole
00050000-55c0-71da-8aa4-e555ea07f9ed	4227	Selca
00050000-55c0-71da-6f5c-c0eeed2de39c	2352	Selnica ob Dravi
00050000-55c0-71da-7d99-a68f25ac6472	8333	Semič
00050000-55c0-71da-57f2-4ee09da51463	8281	Senovo
00050000-55c0-71da-76c6-666db342a7b4	6224	Senožeče
00050000-55c0-71da-eaa6-120e7cdf4325	8290	Sevnica
00050000-55c0-71da-5db4-d7ab4d17794f	6210	Sežana
00050000-55c0-71da-a7d7-3353bf2a4856	2214	Sladki Vrh
00050000-55c0-71da-80bc-a02f75196314	5283	Slap ob Idrijci
00050000-55c0-71da-5599-f5f9313c6523	2380	Slovenj Gradec
00050000-55c0-71da-34f0-e140a42213b6	2310	Slovenska Bistrica
00050000-55c0-71da-a39e-13e4e5c2ef4e	3210	Slovenske Konjice
00050000-55c0-71da-63e5-4c46ab02dc27	1216	Smlednik
00050000-55c0-71da-dedf-eef3d1a9da5b	5232	Soča
00050000-55c0-71da-e575-0c24ed6ca84a	1317	Sodražica
00050000-55c0-71da-20a9-0b94d367c688	3335	Solčava
00050000-55c0-71da-c204-7343b282ea0b	5250	Solkan
00050000-55c0-71da-df86-1a8496702497	4229	Sorica
00050000-55c0-71da-65b6-fb7947938494	4225	Sovodenj
00050000-55c0-71da-8eac-051377ef4907	5281	Spodnja Idrija
00050000-55c0-71da-3a53-07e5f6709a75	2241	Spodnji Duplek
00050000-55c0-71da-d338-0f08ab2920a1	9245	Spodnji Ivanjci
00050000-55c0-71da-6565-1b131a77a7dc	2277	Središče ob Dravi
00050000-55c0-71da-5024-725517d350df	4267	Srednja vas v Bohinju
00050000-55c0-71da-9d3b-ba7cc6854d19	8256	Sromlje 
00050000-55c0-71da-f404-0e4019a53cf5	5224	Srpenica
00050000-55c0-71da-827e-f616b27da10a	1242	Stahovica
00050000-55c0-71da-d143-11efda897ae4	1332	Stara Cerkev
00050000-55c0-71da-38e7-5a2e03c95a19	8342	Stari trg ob Kolpi
00050000-55c0-71da-b802-96df4988d6dd	1386	Stari trg pri Ložu
00050000-55c0-71da-d83e-50958f3744e8	2205	Starše
00050000-55c0-71da-06b0-befafdc6d2d0	2289	Stoperce
00050000-55c0-71da-c659-c4c33a820bc7	8322	Stopiče
00050000-55c0-71da-3834-441c442579f4	3206	Stranice
00050000-55c0-71da-6416-41524e0374b8	8351	Straža
00050000-55c0-71da-94c5-f34523440ef5	1313	Struge
00050000-55c0-71da-e571-d2fd972793d7	8293	Studenec
00050000-55c0-71da-7629-058c302b30d9	8331	Suhor
00050000-55c0-71da-7117-56213162d559	2233	Sv. Ana v Slovenskih goricah
00050000-55c0-71da-42e9-bace342acfe7	2235	Sv. Trojica v Slovenskih goricah
00050000-55c0-71da-6ed2-92a455244241	2353	Sveti Duh na Ostrem Vrhu
00050000-55c0-71da-47c5-6d3692d1f952	9244	Sveti Jurij ob Ščavnici
00050000-55c0-71da-e88d-a1757f8d4d13	3264	Sveti Štefan
00050000-55c0-71da-6371-67d13d4ed7c2	2258	Sveti Tomaž
00050000-55c0-71da-5f28-74c05d9d30be	9204	Šalovci
00050000-55c0-71da-001b-0d78119a182d	5261	Šempas
00050000-55c0-71da-7a04-8584f85f420d	5290	Šempeter pri Gorici
00050000-55c0-71da-b135-968773b378c9	3311	Šempeter v Savinjski dolini
00050000-55c0-71da-4780-2f18835b21c0	4208	Šenčur
00050000-55c0-71da-5499-9e8691a09835	2212	Šentilj v Slovenskih goricah
00050000-55c0-71da-3b5a-67f7ab5b0976	8297	Šentjanž
00050000-55c0-71da-70b1-42366d575c02	2373	Šentjanž pri Dravogradu
00050000-55c0-71da-9d77-2e6d7e69562f	8310	Šentjernej
00050000-55c0-71da-2bac-e116bc0523b1	3230	Šentjur
00050000-55c0-71da-00e8-9aa5993e2a8c	3271	Šentrupert
00050000-55c0-71da-5031-bde14d6656a7	8232	Šentrupert
00050000-55c0-71da-2cb4-6cd1d1d0fa84	1296	Šentvid pri Stični
00050000-55c0-71da-a88a-3c59185975ca	8275	Škocjan
00050000-55c0-71da-b82d-1a031c5c7a8b	6281	Škofije
00050000-55c0-71da-5c53-64b2af715036	4220	Škofja Loka
00050000-55c0-71da-8e0e-c5cbe65cac03	3211	Škofja vas
00050000-55c0-71da-a263-5bd4aa4ff230	1291	Škofljica
00050000-55c0-71da-ee1d-053e7ecf9b44	6274	Šmarje
00050000-55c0-71da-00a6-748bd0fd089d	1293	Šmarje - Sap
00050000-55c0-71da-c96e-cc095fc01af6	3240	Šmarje pri Jelšah
00050000-55c0-71da-5bdd-c56e4f3144c0	8220	Šmarješke Toplice
00050000-55c0-71da-eb94-36a5ce30489d	2315	Šmartno na Pohorju
00050000-55c0-71da-fb39-ac9c0d22b51c	3341	Šmartno ob Dreti
00050000-55c0-71da-1b36-562bd7c7d671	3327	Šmartno ob Paki
00050000-55c0-71da-fdfe-da3b41e7e5b6	1275	Šmartno pri Litiji
00050000-55c0-71da-0c57-bae50dbaff62	2383	Šmartno pri Slovenj Gradcu
00050000-55c0-71da-2c06-b7678c98d2d7	3201	Šmartno v Rožni dolini
00050000-55c0-71da-742f-bbc11804def7	3325	Šoštanj
00050000-55c0-71da-6097-7fb6879fc6bb	6222	Štanjel
00050000-55c0-71da-7ff0-de5693cb999c	3220	Štore
00050000-55c0-71da-0b15-cd5c9e6c67a5	3304	Tabor
00050000-55c0-71da-77b9-16f4a48d64c1	3221	Teharje
00050000-55c0-71da-62b2-e7663984dc29	9251	Tišina
00050000-55c0-71da-f2a8-c4ad885a5c91	5220	Tolmin
00050000-55c0-71da-e3c1-0b89d2977603	3326	Topolšica
00050000-55c0-71da-1baa-2ace38eff491	2371	Trbonje
00050000-55c0-71da-daf0-cedc8daafb3e	1420	Trbovlje
00050000-55c0-71da-0575-c838bb5ef83b	8231	Trebelno 
00050000-55c0-71da-529c-10e7f9f26fbd	8210	Trebnje
00050000-55c0-71da-cda1-58aa79279f60	5252	Trnovo pri Gorici
00050000-55c0-71da-f7ed-ff5b991cddae	2254	Trnovska vas
00050000-55c0-71da-bfb6-32fc89661dbb	1222	Trojane
00050000-55c0-71da-83ca-a6dc3bdf28f1	1236	Trzin
00050000-55c0-71da-ae03-7b6643de192a	4290	Tržič
00050000-55c0-71da-5751-3a4f563495b3	8295	Tržišče
00050000-55c0-71da-ce37-ae7f43e13d62	1311	Turjak
00050000-55c0-71da-83f6-04354be7bbac	9224	Turnišče
00050000-55c0-71da-a5e7-fea0fab24b7c	8323	Uršna sela
00050000-55c0-71da-06c9-1e98a0d1a3ed	1252	Vače
00050000-55c0-71da-a128-3010c4b39fa6	3320	Velenje 
00050000-55c0-71da-847e-774f96c82c37	3322	Velenje - poštni predali
00050000-55c0-71da-5c9b-67062b61cfc2	8212	Velika Loka
00050000-55c0-71da-efd3-50fd0ce54ed8	2274	Velika Nedelja
00050000-55c0-71da-7cec-a1a7f7dc1384	9225	Velika Polana
00050000-55c0-71da-ffec-3f11c6527a63	1315	Velike Lašče
00050000-55c0-71da-a3fd-31cb3638ae78	8213	Veliki Gaber
00050000-55c0-71da-4f05-b6c2dd4b8a09	9241	Veržej
00050000-55c0-71da-cda7-4a496f70ba22	1312	Videm - Dobrepolje
00050000-55c0-71da-512e-5717eee035a2	2284	Videm pri Ptuju
00050000-55c0-71da-12de-1939674fa3fd	8344	Vinica
00050000-55c0-71da-982e-e6be267fa051	5271	Vipava
00050000-55c0-71da-b823-ddcc3a39aa2c	4212	Visoko
00050000-55c0-71da-2640-25113e7e78d7	1294	Višnja Gora
00050000-55c0-71da-6823-3774a9af2d02	3205	Vitanje
00050000-55c0-71da-433a-d8d8b3620d98	2255	Vitomarci
00050000-55c0-71da-8e84-67330b876755	1217	Vodice
00050000-55c0-71da-4de5-d5925a9fbf72	3212	Vojnik\t
00050000-55c0-71da-4802-7bcfc9e86ba0	5293	Volčja Draga
00050000-55c0-71da-2260-51c38c3066d3	2232	Voličina
00050000-55c0-71da-80ab-22b3d0b911fc	3305	Vransko
00050000-55c0-71da-24b5-33462aace9bc	6217	Vremski Britof
00050000-55c0-71da-f681-b3ca83c1c456	1360	Vrhnika
00050000-55c0-71da-629a-9983d45e3147	2365	Vuhred
00050000-55c0-71da-901c-30007967d4ba	2367	Vuzenica
00050000-55c0-71da-1133-eb0f57928589	8292	Zabukovje 
00050000-55c0-71da-7922-8e7c4fdfca66	1410	Zagorje ob Savi
00050000-55c0-71da-e6f7-7642b5c8ec4d	1303	Zagradec
00050000-55c0-71da-228b-741fffb874c6	2283	Zavrč
00050000-55c0-71da-271b-3ea01da44674	8272	Zdole 
00050000-55c0-71da-4c3b-b70572dd0945	4201	Zgornja Besnica
00050000-55c0-71da-1433-04a492b94b9e	2242	Zgornja Korena
00050000-55c0-71da-1566-1b094992e60a	2201	Zgornja Kungota
00050000-55c0-71da-04ed-03be37b12886	2316	Zgornja Ložnica
00050000-55c0-71da-bf0f-253293631fcd	2314	Zgornja Polskava
00050000-55c0-71da-f651-23ee8a8d37e3	2213	Zgornja Velka
00050000-55c0-71da-93a6-0482156f55a9	4247	Zgornje Gorje
00050000-55c0-71da-f521-69021631f06f	4206	Zgornje Jezersko
00050000-55c0-71da-8814-7cbc9b69c366	2285	Zgornji Leskovec
00050000-55c0-71da-3248-2b47f1927c54	1432	Zidani Most
00050000-55c0-71da-01f4-534b642da183	3214	Zreče
00050000-55c0-71da-a505-af30753ad34d	4209	Žabnica
00050000-55c0-71da-d4d7-d93ea2054439	3310	Žalec
00050000-55c0-71da-8a56-d142337ff879	4228	Železniki
00050000-55c0-71da-1cb8-42fb1dc3ed77	2287	Žetale
00050000-55c0-71da-5585-891a8c60e989	4226	Žiri
00050000-55c0-71da-9b60-79bb3fbe0396	4274	Žirovnica
00050000-55c0-71da-d305-3804be796a5d	8360	Žužemberk
\.


--
-- TOC entry 2994 (class 0 OID 11671887)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11671694)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 11671772)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 11671899)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 11672203)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 11672213)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c0-71db-cf54-391e56447e7e	00080000-55c0-71db-b01d-1540a72af94c	0900	AK
00190000-55c0-71db-4ad1-c6533d279d11	00080000-55c0-71db-80e2-4795dda91556	0987	AK
00190000-55c0-71db-54be-3dd60f3fa264	00080000-55c0-71db-b802-9de6ddbb6562	0989	AK
00190000-55c0-71db-beed-6f21ebd8ff0c	00080000-55c0-71db-280a-b906333d3b44	0986	AK
00190000-55c0-71db-9244-ac7bf1faa585	00080000-55c0-71db-dac1-84ed6c58f6fc	0984	AK
00190000-55c0-71db-141e-46765964a34c	00080000-55c0-71db-5d6d-683323ffd241	0983	AK
00190000-55c0-71db-c558-aa12e4424ac4	00080000-55c0-71db-b153-36985cea5871	0982	AK
\.


--
-- TOC entry 3018 (class 0 OID 11672184)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55c0-71dc-1c60-7de4628b0522	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2963 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11672221)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 11671928)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c0-71db-e913-1bb25792d278	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c0-71db-9e55-1429c27d2454	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c0-71db-6d11-2714b2f943e4	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c0-71db-5811-1c9651629109	0004	Mali oder	t	24	Mali oder 
00220000-55c0-71db-ce89-7b08ccaa948e	0005	Komorni oder	t	15	Komorni oder
00220000-55c0-71db-8da0-1651daa817d5	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c0-71db-9edf-fa398fda57f7	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2992 (class 0 OID 11671872)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11671862)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11672047)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11671996)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 11671566)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3001 (class 0 OID 11671938)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 11671604)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c0-71da-eb5a-3fcea882f55c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c0-71da-5dac-3d012ab11859	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c0-71da-cd4f-b9e8ee76c3fd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c0-71da-b289-492dbaebccc7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c0-71da-dc44-3c1600918717	planer	Planer dogodkov v koledarju	t
00020000-55c0-71da-4880-2a7ba8287abf	kadrovska	Kadrovska služba	t
00020000-55c0-71da-034d-836b432dc883	arhivar	Ažuriranje arhivalij	t
00020000-55c0-71da-d5d6-7c6c5b0e565c	igralec	Igralec	t
00020000-55c0-71da-9846-3b4bda293b34	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c0-71db-1ada-8fb7aca5ff8b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2967 (class 0 OID 11671588)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c0-71da-dcfc-25c3dedd72d8	00020000-55c0-71da-cd4f-b9e8ee76c3fd
00010000-55c0-71da-8f53-ad5c4aa63083	00020000-55c0-71da-cd4f-b9e8ee76c3fd
00010000-55c0-71db-3bcf-8c7ec36f8610	00020000-55c0-71db-1ada-8fb7aca5ff8b
\.


--
-- TOC entry 3003 (class 0 OID 11671952)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11671893)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11671839)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11672262)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c0-71da-a660-922678785cfb	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c0-71da-5379-595f0d7e122d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c0-71da-b31b-3ab38ee94014	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c0-71da-1cb1-8bfc482e447b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c0-71da-f75b-58d0db124d9c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3025 (class 0 OID 11672254)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c0-71da-79e5-de397fc6a089	00230000-55c0-71da-1cb1-8bfc482e447b	popa
00240000-55c0-71da-df0a-07c9ced02c1d	00230000-55c0-71da-1cb1-8bfc482e447b	oseba
00240000-55c0-71da-c4f4-6e7f92faa1f5	00230000-55c0-71da-1cb1-8bfc482e447b	sezona
00240000-55c0-71da-42f3-5d445e56bbfa	00230000-55c0-71da-5379-595f0d7e122d	prostor
00240000-55c0-71da-a708-6c6af3ad9a40	00230000-55c0-71da-1cb1-8bfc482e447b	besedilo
00240000-55c0-71da-ce00-a840f01795a1	00230000-55c0-71da-1cb1-8bfc482e447b	uprizoritev
00240000-55c0-71da-79d3-e52f1a994211	00230000-55c0-71da-1cb1-8bfc482e447b	funkcija
00240000-55c0-71da-f08d-120f83b160d1	00230000-55c0-71da-1cb1-8bfc482e447b	tipfunkcije
00240000-55c0-71da-fddc-194ed795112b	00230000-55c0-71da-1cb1-8bfc482e447b	alternacija
00240000-55c0-71da-4fb2-71adf6083d41	00230000-55c0-71da-a660-922678785cfb	pogodba
00240000-55c0-71da-f474-038888360079	00230000-55c0-71da-1cb1-8bfc482e447b	zaposlitev
00240000-55c0-71da-3180-f97232fa3e91	00230000-55c0-71da-a660-922678785cfb	programdela
00240000-55c0-71da-ffb2-a86cfadcb1ca	00230000-55c0-71da-1cb1-8bfc482e447b	zapis
\.


--
-- TOC entry 3024 (class 0 OID 11672249)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11672006)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c0-71dc-f782-16c338d49d4e	000e0000-55c0-71db-f168-dc52d0815b61	00080000-55c0-71db-2eb9-1f3f443eea94	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c0-71dc-0133-ae8ec07a6ea9	000e0000-55c0-71db-f168-dc52d0815b61	00080000-55c0-71db-2eb9-1f3f443eea94	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c0-71dc-2255-cb6837f94969	000e0000-55c0-71db-f168-dc52d0815b61	00080000-55c0-71db-2b8c-0c751fa77d3d	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c0-71dc-dac6-f4c4e7b945d0	000e0000-55c0-71db-f168-dc52d0815b61	00080000-55c0-71db-2b8c-0c751fa77d3d	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2974 (class 0 OID 11671666)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 11671849)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c0-71dc-be53-a6904af7721c	00180000-55c0-71db-f21e-c989aef504f5	000c0000-55c0-71dc-04d2-d2eff92c60d4	00090000-55c0-71db-41b8-a8b2aeb98639	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-71dc-5429-60fdf2cd88b2	00180000-55c0-71db-f21e-c989aef504f5	000c0000-55c0-71dc-646d-47354fe90e3b	00090000-55c0-71db-04f9-ec2456acae7b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-71dc-5738-84c4d16f2071	00180000-55c0-71db-f21e-c989aef504f5	000c0000-55c0-71dc-7a1b-8d80c080d29c	00090000-55c0-71db-2cf6-3d9de009825b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-71dc-3ba9-edd1f1c97e28	00180000-55c0-71db-f21e-c989aef504f5	000c0000-55c0-71dc-de71-f5aae579a832	00090000-55c0-71db-344f-0f8decfed678	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-71dc-7d3f-3599f86d4829	00180000-55c0-71db-f21e-c989aef504f5	000c0000-55c0-71dc-1c88-fd784bbc18f9	00090000-55c0-71db-b917-72198d8c33e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-71dc-dadb-88df1520a531	00180000-55c0-71db-5404-269df5d742ef	\N	00090000-55c0-71db-b917-72198d8c33e6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3010 (class 0 OID 11672036)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c0-71da-f036-a251ca89473d	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c0-71da-d014-3cc869cfccce	Priredba	Priredba	Priredba	umetnik
000f0000-55c0-71da-009d-0d65f05d7feb	Prevod	Prevod	Prevod	umetnik
000f0000-55c0-71da-cc8d-b9305e42a14d	Režija	Režija	Režija	umetnik
000f0000-55c0-71da-1f3e-c242151fea96	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c0-71da-905d-ad88f3f3c2a5	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c0-71da-ea50-4adc5b7c8577	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c0-71da-c55f-0f16960d258c	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c0-71da-b7f3-f38665833179	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c0-71da-c6ec-2916fa4583ca	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c0-71da-f887-60fc3b5b3e4d	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c0-71da-3272-18c9bb0e995b	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c0-71da-45b6-fb86761e6eec	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c0-71da-2317-9e08a32d8e92	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c0-71da-6324-7472015948eb	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c0-71da-26d1-cb2b0ca907c0	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c0-71da-1729-0e283d634e82	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c0-71da-68f4-c5dd608c2c8b	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3022 (class 0 OID 11672231)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c0-71da-5325-634f35428f3e	01	Velika predstava	f	1.00	1.00
002b0000-55c0-71da-092a-d2630e1e413f	02	Mala predstava	f	0.50	0.50
002b0000-55c0-71da-639a-cedf74435090	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c0-71da-8266-809e48624467	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c0-71da-d228-5a83e1e1537d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2979 (class 0 OID 11671729)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11671575)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c0-71da-8f53-ad5c4aa63083	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO2dhS.xINa7krq3lU4wJLwAl2DfTx79i	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c0-71db-ccd7-6244e485944a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c0-71db-917e-004eb9950bed	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c0-71db-5035-17db7e719a1d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c0-71db-6784-08197993a345	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c0-71db-bdc2-31641ce337e9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c0-71db-42b6-335f86157e3d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c0-71db-dd9d-11c1058afd6c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c0-71db-face-0346993a3212	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c0-71db-6649-8f8aad78cdd5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c0-71db-3bcf-8c7ec36f8610	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c0-71da-dcfc-25c3dedd72d8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 11672084)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c0-71db-e75a-ae0e01573717	00160000-55c0-71db-a50f-88c0b9d4359b	00150000-55c0-71da-0233-79634e2dd212	00140000-55c0-71d9-0c07-6726abd1d7cf	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c0-71db-ce89-7b08ccaa948e
000e0000-55c0-71db-f168-dc52d0815b61	00160000-55c0-71db-1fef-1da14eb9088e	00150000-55c0-71da-40c9-0e3975e16464	00140000-55c0-71d9-148c-ad388e7365a5	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c0-71db-8da0-1651daa817d5
000e0000-55c0-71db-41a9-5cb9dc43053d	\N	00150000-55c0-71da-40c9-0e3975e16464	00140000-55c0-71d9-148c-ad388e7365a5	00190000-55c0-71db-4ad1-c6533d279d11	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c0-71db-ce89-7b08ccaa948e
000e0000-55c0-71db-6fc8-f7fa8bf8f8dc	\N	00150000-55c0-71da-40c9-0e3975e16464	00140000-55c0-71d9-148c-ad388e7365a5	00190000-55c0-71db-4ad1-c6533d279d11	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c0-71db-ce89-7b08ccaa948e
000e0000-55c0-71db-d833-b18c9402ff89	\N	00150000-55c0-71da-40c9-0e3975e16464	00140000-55c0-71d9-148c-ad388e7365a5	00190000-55c0-71db-4ad1-c6533d279d11	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c0-71db-e913-1bb25792d278
\.


--
-- TOC entry 2984 (class 0 OID 11671791)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c0-71db-2c6d-aea3c46c92c3	000e0000-55c0-71db-f168-dc52d0815b61	1	
00200000-55c0-71db-8ac9-eff14f5db86f	000e0000-55c0-71db-f168-dc52d0815b61	2	
\.


--
-- TOC entry 2999 (class 0 OID 11671920)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11672301)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11672273)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11672313)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11671989)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c0-71db-47df-386998431610	00090000-55c0-71db-04f9-ec2456acae7b	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-71db-46ae-e72edaf78ea9	00090000-55c0-71db-2cf6-3d9de009825b	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-71db-2bdb-455bb4fdcd78	00090000-55c0-71db-51fd-9d66c5626d80	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-71db-c842-655289499209	00090000-55c0-71db-3df5-9058e3d715a0	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-71db-dd55-01b121eeea63	00090000-55c0-71db-41b8-a8b2aeb98639	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-71db-b14c-75b7720bba63	00090000-55c0-71db-a535-9ece9ffe78f0	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2986 (class 0 OID 11671823)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 11672074)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c0-71d9-0c07-6726abd1d7cf	01	Drama	drama (SURS 01)
00140000-55c0-71d9-6159-15c4062560d9	02	Opera	opera (SURS 02)
00140000-55c0-71d9-bc16-25ddfdbe07b1	03	Balet	balet (SURS 03)
00140000-55c0-71d9-2825-d25177f600e6	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c0-71d9-ad86-9b1b6f78f1e4	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c0-71d9-148c-ad388e7365a5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c0-71d9-8655-bc571d4ae1d9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3005 (class 0 OID 11671979)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c0-71da-52c6-dc19a2a10b60	01	Opera	opera
00150000-55c0-71da-22de-9282fea61e9d	02	Opereta	opereta
00150000-55c0-71da-c4e3-543f21cf2ad2	03	Balet	balet
00150000-55c0-71da-d673-34075096c1f0	04	Plesne prireditve	plesne prireditve
00150000-55c0-71da-789e-0c6e88abe2ee	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c0-71da-2f96-06775ee2133b	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c0-71da-024a-6429c63ca022	07	Biografska drama	biografska drama
00150000-55c0-71da-0233-79634e2dd212	08	Komedija	komedija
00150000-55c0-71da-d56d-c19a7d0cf4a1	09	Črna komedija	črna komedija
00150000-55c0-71da-b48e-1511e8c47e0f	10	E-igra	E-igra
00150000-55c0-71da-40c9-0e3975e16464	11	Kriminalka	kriminalka
00150000-55c0-71da-6d40-8a4c2f1c7256	12	Musical	musical
\.


--
-- TOC entry 2510 (class 2606 OID 11671629)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 11672131)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 11672121)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11672035)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 11672354)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 11671813)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 11671838)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 11672247)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 11671755)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 11672178)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 11671975)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 11671789)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 11671832)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 11671769)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 11671885)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 11672330)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 11672337)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2751 (class 2606 OID 11672362)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 11671912)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 11671727)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 11671638)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2517 (class 2606 OID 11671662)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 11671618)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2501 (class 2606 OID 11671603)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 11671918)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 11671951)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 11672069)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 11671691)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 11671715)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11671891)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 11671705)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 11671776)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 11671903)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 11672210)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 11672218)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 11672201)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11672229)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 11671935)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 11671876)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 11671867)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 11672057)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 11672003)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 11671574)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11671942)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 11671592)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2503 (class 2606 OID 11671612)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11671960)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 11671898)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 11671847)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 11672271)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 11672259)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 11672253)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11672016)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 11671671)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 11671858)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11672046)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11672241)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 11671740)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 11671587)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11672100)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 11671798)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11671926)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 11672311)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 11672295)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 11672319)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 11671994)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 11671827)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 11672082)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 11671987)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 1259 OID 11671820)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2651 (class 1259 OID 11672017)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 11672018)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2737 (class 1259 OID 11672332)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2738 (class 1259 OID 11672331)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2524 (class 1259 OID 11671693)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2471 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2473 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 11671919)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2724 (class 1259 OID 11672299)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2725 (class 1259 OID 11672298)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2726 (class 1259 OID 11672300)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2727 (class 1259 OID 11672297)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2728 (class 1259 OID 11672296)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2610 (class 1259 OID 11671905)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2611 (class 1259 OID 11671904)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 11671799)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2638 (class 1259 OID 11671976)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 11671978)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2640 (class 1259 OID 11671977)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2549 (class 1259 OID 11671771)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2550 (class 1259 OID 11671770)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2707 (class 1259 OID 11672230)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2661 (class 1259 OID 11672071)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 11672072)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 11672073)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2734 (class 1259 OID 11672320)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2486 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2670 (class 1259 OID 11672105)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2671 (class 1259 OID 11672102)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2672 (class 1259 OID 11672106)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2673 (class 1259 OID 11672104)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2674 (class 1259 OID 11672103)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2539 (class 1259 OID 11671742)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2540 (class 1259 OID 11671741)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2477 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 11671665)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2626 (class 1259 OID 11671943)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2579 (class 1259 OID 11671833)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2505 (class 1259 OID 11671619)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2506 (class 1259 OID 11671620)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2631 (class 1259 OID 11671963)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2632 (class 1259 OID 11671962)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2633 (class 1259 OID 11671961)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2553 (class 1259 OID 11671777)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 11671779)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2555 (class 1259 OID 11671778)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2717 (class 1259 OID 11672261)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2590 (class 1259 OID 11671871)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2591 (class 1259 OID 11671869)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2592 (class 1259 OID 11671868)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2593 (class 1259 OID 11671870)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2496 (class 1259 OID 11671593)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2497 (class 1259 OID 11671594)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2619 (class 1259 OID 11671927)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 11672355)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2748 (class 1259 OID 11672363)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2749 (class 1259 OID 11672364)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2605 (class 1259 OID 11671892)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2647 (class 1259 OID 11672004)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2648 (class 1259 OID 11672005)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2691 (class 1259 OID 11672183)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2692 (class 1259 OID 11672182)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2693 (class 1259 OID 11672179)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2694 (class 1259 OID 11672180)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2695 (class 1259 OID 11672181)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2528 (class 1259 OID 11671707)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 11671706)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2530 (class 1259 OID 11671708)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2489 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2699 (class 1259 OID 11672211)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2700 (class 1259 OID 11672212)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2684 (class 1259 OID 11672135)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2685 (class 1259 OID 11672136)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2686 (class 1259 OID 11672133)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2687 (class 1259 OID 11672134)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2644 (class 1259 OID 11671995)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 11671880)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2597 (class 1259 OID 11671879)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2598 (class 1259 OID 11671877)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2599 (class 1259 OID 11671878)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2467 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2680 (class 1259 OID 11672123)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2681 (class 1259 OID 11672122)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 11672202)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2560 (class 1259 OID 11671790)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2714 (class 1259 OID 11672248)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2741 (class 1259 OID 11672338)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2742 (class 1259 OID 11672339)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2511 (class 1259 OID 11671640)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2512 (class 1259 OID 11671639)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2520 (class 1259 OID 11671672)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 11671673)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2585 (class 1259 OID 11671861)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 11671860)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2587 (class 1259 OID 11671859)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2480 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2481 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2482 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2567 (class 1259 OID 11671822)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2568 (class 1259 OID 11671818)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2569 (class 1259 OID 11671815)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2570 (class 1259 OID 11671816)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2571 (class 1259 OID 11671814)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2572 (class 1259 OID 11671819)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2573 (class 1259 OID 11671817)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2527 (class 1259 OID 11671692)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11671756)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 11671758)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2547 (class 1259 OID 11671757)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2548 (class 1259 OID 11671759)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2604 (class 1259 OID 11671886)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2666 (class 1259 OID 11672070)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 11672101)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 11671663)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 11671664)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2641 (class 1259 OID 11671988)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2723 (class 1259 OID 11672272)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2538 (class 1259 OID 11671728)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2720 (class 1259 OID 11672260)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2624 (class 1259 OID 11671937)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2625 (class 1259 OID 11671936)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 11672132)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2535 (class 1259 OID 11671716)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 11672083)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2731 (class 1259 OID 11672312)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2705 (class 1259 OID 11672219)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2706 (class 1259 OID 11672220)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2584 (class 1259 OID 11671848)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 11671613)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2574 (class 1259 OID 11671821)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2777 (class 2606 OID 11672500)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2780 (class 2606 OID 11672485)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2779 (class 2606 OID 11672490)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2775 (class 2606 OID 11672510)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2781 (class 2606 OID 11672480)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2776 (class 2606 OID 11672505)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2778 (class 2606 OID 11672495)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2811 (class 2606 OID 11672655)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 11672660)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 11672830)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2845 (class 2606 OID 11672825)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 11672415)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 11672595)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2839 (class 2606 OID 11672810)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2840 (class 2606 OID 11672805)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2838 (class 2606 OID 11672815)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2841 (class 2606 OID 11672800)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2842 (class 2606 OID 11672795)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2796 (class 2606 OID 11672590)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2797 (class 2606 OID 11672585)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2774 (class 2606 OID 11672475)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 11672625)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 11672635)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2805 (class 2606 OID 11672630)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2768 (class 2606 OID 11672450)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 11672445)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 11672575)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2835 (class 2606 OID 11672780)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2814 (class 2606 OID 11672665)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2813 (class 2606 OID 11672670)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 11672675)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2843 (class 2606 OID 11672820)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2816 (class 2606 OID 11672695)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2819 (class 2606 OID 11672680)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2815 (class 2606 OID 11672700)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2817 (class 2606 OID 11672690)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2818 (class 2606 OID 11672685)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2766 (class 2606 OID 11672440)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11672435)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 11672400)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2759 (class 2606 OID 11672395)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2800 (class 2606 OID 11672605)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2782 (class 2606 OID 11672515)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 11672375)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2754 (class 2606 OID 11672380)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2801 (class 2606 OID 11672620)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2802 (class 2606 OID 11672615)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2803 (class 2606 OID 11672610)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2772 (class 2606 OID 11672455)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 11672465)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2771 (class 2606 OID 11672460)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 11672790)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2786 (class 2606 OID 11672550)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2788 (class 2606 OID 11672540)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2789 (class 2606 OID 11672535)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2787 (class 2606 OID 11672545)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 11672365)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2752 (class 2606 OID 11672370)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2799 (class 2606 OID 11672600)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2848 (class 2606 OID 11672845)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2850 (class 2606 OID 11672850)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 11672855)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2795 (class 2606 OID 11672580)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2809 (class 2606 OID 11672645)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2808 (class 2606 OID 11672650)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2826 (class 2606 OID 11672755)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2827 (class 2606 OID 11672750)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2830 (class 2606 OID 11672735)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 11672740)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2828 (class 2606 OID 11672745)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2764 (class 2606 OID 11672425)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11672420)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 11672430)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2833 (class 2606 OID 11672765)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2832 (class 2606 OID 11672770)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2823 (class 2606 OID 11672725)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 11672730)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2825 (class 2606 OID 11672715)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2824 (class 2606 OID 11672720)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2807 (class 2606 OID 11672640)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 11672570)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2791 (class 2606 OID 11672565)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2793 (class 2606 OID 11672555)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2792 (class 2606 OID 11672560)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2820 (class 2606 OID 11672710)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2821 (class 2606 OID 11672705)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2831 (class 2606 OID 11672760)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2773 (class 2606 OID 11672470)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2834 (class 2606 OID 11672775)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 11672785)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2847 (class 2606 OID 11672835)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2846 (class 2606 OID 11672840)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2756 (class 2606 OID 11672390)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 11672385)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2761 (class 2606 OID 11672405)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 11672410)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 11672530)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 11672525)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2785 (class 2606 OID 11672520)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-04 10:03:41 CEST

--
-- PostgreSQL database dump complete
--

