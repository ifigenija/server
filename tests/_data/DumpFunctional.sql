--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-03 16:42:52 CEST

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
-- TOC entry 183 (class 1259 OID 11629876)
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
-- TOC entry 228 (class 1259 OID 11630375)
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
-- TOC entry 227 (class 1259 OID 11630358)
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
-- TOC entry 221 (class 1259 OID 11630270)
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
-- TOC entry 244 (class 1259 OID 11630591)
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
-- TOC entry 197 (class 1259 OID 11630055)
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
-- TOC entry 200 (class 1259 OID 11630089)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11630493)
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
-- TOC entry 192 (class 1259 OID 11629998)
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
-- TOC entry 229 (class 1259 OID 11630388)
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
-- TOC entry 216 (class 1259 OID 11630215)
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
-- TOC entry 195 (class 1259 OID 11630035)
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
-- TOC entry 199 (class 1259 OID 11630083)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11630015)
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
-- TOC entry 205 (class 1259 OID 11630132)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11630572)
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
-- TOC entry 243 (class 1259 OID 11630584)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11630607)
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
-- TOC entry 209 (class 1259 OID 11630157)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11629972)
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
-- TOC entry 184 (class 1259 OID 11629885)
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
-- TOC entry 185 (class 1259 OID 11629896)
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
-- TOC entry 180 (class 1259 OID 11629850)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11629869)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11630164)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11630195)
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
-- TOC entry 224 (class 1259 OID 11630309)
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
-- TOC entry 187 (class 1259 OID 11629929)
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
-- TOC entry 189 (class 1259 OID 11629964)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11630138)
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
-- TOC entry 188 (class 1259 OID 11629949)
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
-- TOC entry 194 (class 1259 OID 11630027)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11630150)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11630454)
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
-- TOC entry 232 (class 1259 OID 11630464)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11630435)
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
-- TOC entry 233 (class 1259 OID 11630472)
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
-- TOC entry 212 (class 1259 OID 11630179)
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
-- TOC entry 204 (class 1259 OID 11630123)
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
-- TOC entry 203 (class 1259 OID 11630113)
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
-- TOC entry 223 (class 1259 OID 11630298)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11630247)
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
-- TOC entry 177 (class 1259 OID 11629821)
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
-- TOC entry 176 (class 1259 OID 11629819)
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
-- TOC entry 213 (class 1259 OID 11630189)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11629859)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11629843)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11630203)
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
-- TOC entry 207 (class 1259 OID 11630144)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11630094)
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
-- TOC entry 238 (class 1259 OID 11630513)
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
-- TOC entry 237 (class 1259 OID 11630505)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11630500)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11630257)
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
-- TOC entry 186 (class 1259 OID 11629921)
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
-- TOC entry 202 (class 1259 OID 11630100)
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
-- TOC entry 222 (class 1259 OID 11630287)
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
-- TOC entry 234 (class 1259 OID 11630482)
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
-- TOC entry 191 (class 1259 OID 11629984)
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
-- TOC entry 178 (class 1259 OID 11629830)
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
-- TOC entry 226 (class 1259 OID 11630335)
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
-- TOC entry 196 (class 1259 OID 11630046)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11630171)
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
-- TOC entry 240 (class 1259 OID 11630552)
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
-- TOC entry 239 (class 1259 OID 11630524)
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
-- TOC entry 241 (class 1259 OID 11630564)
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
-- TOC entry 218 (class 1259 OID 11630240)
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
-- TOC entry 198 (class 1259 OID 11630078)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11630325)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11630230)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11629824)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2969 (class 0 OID 11629876)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 11630375)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55bf-7deb-b3b7-43d117156a33	000d0000-55bf-7deb-c5f1-3b809752ad06	\N	00090000-55bf-7deb-a41b-055f9a58182b	000b0000-55bf-7deb-2732-093553fc1761	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55bf-7deb-36ba-de24763a6a5a	000d0000-55bf-7deb-f24b-ae3004571037	00100000-55bf-7deb-0b84-b592b261e3d8	00090000-55bf-7deb-b9f1-64ec5d163725	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55bf-7deb-9f53-426dd4f06463	000d0000-55bf-7deb-507d-66c991c42341	00100000-55bf-7deb-5cff-3540fffb1679	00090000-55bf-7deb-f63d-376f3f9c37be	\N	0003	t	\N	2015-08-03	\N	2	\N	\N	f	f
000c0000-55bf-7deb-2bfa-9b384fe46a2b	000d0000-55bf-7deb-0db9-20af300b0c72	\N	00090000-55bf-7deb-adfe-7e1ccbdfb9fd	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55bf-7deb-e264-12c0492da7ca	000d0000-55bf-7deb-35c9-238e15fdd50f	\N	00090000-55bf-7deb-58c1-b55cfd6aad27	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55bf-7deb-8cbf-aaeb454a5afd	000d0000-55bf-7deb-6709-e0b057b96fcf	\N	00090000-55bf-7deb-fdc2-2b52e94d6351	000b0000-55bf-7deb-0f9c-34a36e1cf2fd	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55bf-7deb-bb76-2e0f19cf0848	000d0000-55bf-7deb-9651-4a40eb7f6737	00100000-55bf-7deb-8009-7f094212ed2e	00090000-55bf-7deb-59da-3c1283a013eb	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55bf-7deb-a7dd-8bf00cfddb6c	000d0000-55bf-7deb-2ea3-044620e0a147	\N	00090000-55bf-7deb-3669-91564583c070	000b0000-55bf-7deb-3021-eee06637f220	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55bf-7deb-69bc-d4296ffe7f72	000d0000-55bf-7deb-9651-4a40eb7f6737	00100000-55bf-7deb-21f4-7b40af37eaf2	00090000-55bf-7deb-31e6-f2813921aeb3	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55bf-7deb-60de-cf6814856f7c	000d0000-55bf-7deb-9651-4a40eb7f6737	00100000-55bf-7deb-3aad-5d63b2a4b935	00090000-55bf-7deb-6e10-dd1e79ee51cf	\N	0010	t	\N	2015-08-03	\N	16	\N	\N	f	t
000c0000-55bf-7deb-0fdc-7dd82711be48	000d0000-55bf-7deb-9651-4a40eb7f6737	00100000-55bf-7deb-fcb6-64da49d2e104	00090000-55bf-7deb-9c65-29a32bef8558	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3013 (class 0 OID 11630358)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11630270)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55bf-7dea-0814-854138fe38d0	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55bf-7dea-c64c-90f3dd1ebaee	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55bf-7dea-6785-65932061b86a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 11630591)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11630055)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55bf-7deb-8975-afea5e0d37aa	\N	\N	00200000-55bf-7deb-4aa1-900baae45fd4	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55bf-7deb-71f4-d515817e6c75	\N	\N	00200000-55bf-7deb-cd71-0e83d8cffd96	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55bf-7deb-2aac-2903ea223eb4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55bf-7deb-2083-b6831c67f132	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55bf-7deb-8b30-b0f1840a4781	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2986 (class 0 OID 11630089)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11630493)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11629998)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55bf-7de9-2fdd-a5e18705c441	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55bf-7de9-276c-68b805becf08	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55bf-7de9-068d-df02985f888b	AL	ALB	008	Albania 	Albanija	\N
00040000-55bf-7de9-ce3c-455983f7a3f9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55bf-7de9-0aea-8e4c27ca54a9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55bf-7de9-4e5e-b76657b2f4cb	AD	AND	020	Andorra 	Andora	\N
00040000-55bf-7de9-be50-9ef0c5e926db	AO	AGO	024	Angola 	Angola	\N
00040000-55bf-7de9-d70d-b2edb8e4ba36	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55bf-7de9-6be1-7294e6ca41ff	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55bf-7de9-5950-64ab423b36e5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-7de9-0c57-ef65e738dd2e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55bf-7de9-e5f9-c5698c10f678	AM	ARM	051	Armenia 	Armenija	\N
00040000-55bf-7de9-905d-b74929d75f0a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55bf-7de9-a56c-eb3dc9de8c93	AU	AUS	036	Australia 	Avstralija	\N
00040000-55bf-7de9-29c2-c569f9753006	AT	AUT	040	Austria 	Avstrija	\N
00040000-55bf-7de9-9f0d-a4eea60ebc04	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55bf-7de9-3d98-e13715a529f5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55bf-7de9-1ae4-79b1d7e58961	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55bf-7de9-9d38-642c9aae1283	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55bf-7de9-ef4a-68bba65830c4	BB	BRB	052	Barbados 	Barbados	\N
00040000-55bf-7de9-92f9-c94bb66b4f3d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55bf-7de9-2596-59bb979a8a5b	BE	BEL	056	Belgium 	Belgija	\N
00040000-55bf-7de9-4b04-108f08c2569d	BZ	BLZ	084	Belize 	Belize	\N
00040000-55bf-7de9-0d53-f4cce39214f7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55bf-7de9-067d-cd3548437185	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55bf-7de9-b572-9316da1c46dc	BT	BTN	064	Bhutan 	Butan	\N
00040000-55bf-7de9-8ad8-d7530f158c5f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55bf-7de9-a7fa-a7caa1774619	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55bf-7de9-2427-881b06f29381	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55bf-7de9-1407-e8b39808bbcb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55bf-7de9-4b21-52b9ed21063d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55bf-7de9-b60e-5bee2eb6b037	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55bf-7de9-dad7-d17190967998	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55bf-7de9-74f5-42c74bd09df7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55bf-7de9-99c4-29445f3e7825	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55bf-7de9-1b50-b6771413a2df	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55bf-7de9-55e3-1442aecc9305	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55bf-7de9-d125-f26bbb083077	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55bf-7de9-f047-21e9e8545f86	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55bf-7de9-094d-bfdff6eb7651	CA	CAN	124	Canada 	Kanada	\N
00040000-55bf-7de9-e9fa-ff202f18fcae	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55bf-7de9-96f0-1721f43b6ce8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55bf-7de9-9e5c-b960837b0064	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55bf-7de9-ca3d-8a202ac9cd54	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55bf-7de9-10ad-dde885de4818	CL	CHL	152	Chile 	Čile	\N
00040000-55bf-7de9-afce-c369a5b4bfb9	CN	CHN	156	China 	Kitajska	\N
00040000-55bf-7de9-7a85-9cf26bb528cb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55bf-7de9-a0f1-46e43a40d34f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55bf-7de9-f011-a4118a1b7e5c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55bf-7de9-c78a-0756f90c8838	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55bf-7de9-11c5-b4e320e50400	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55bf-7de9-7d86-9f71e0585caf	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55bf-7de9-2153-580cd270bd34	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55bf-7de9-5f88-dd83236fbbae	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55bf-7de9-edb3-94887c0fef79	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55bf-7de9-c53d-ebb903d532e9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55bf-7de9-2898-f1573d0cb311	CU	CUB	192	Cuba 	Kuba	\N
00040000-55bf-7de9-2292-a0dcf7b7eeb6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55bf-7de9-6cee-700471d08014	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55bf-7de9-1ddf-ab24b99fa27f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55bf-7de9-480a-5de9300a4fa5	DK	DNK	208	Denmark 	Danska	\N
00040000-55bf-7de9-6d17-1ea5971ead0f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55bf-7de9-c13a-124ee5da00a5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-7de9-c9e5-bb49d302cade	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55bf-7de9-a499-7d8838ef8349	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55bf-7de9-eb5f-0063100b5d7c	EG	EGY	818	Egypt 	Egipt	\N
00040000-55bf-7de9-1563-ba02081c671d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55bf-7de9-3947-b340d63c1390	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55bf-7de9-da9e-efbe44f7a316	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55bf-7de9-1d30-55860600d13f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55bf-7de9-fc85-205acfa0d307	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55bf-7de9-9f1e-ed11f88c3ec8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55bf-7de9-4950-ab001b0af371	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55bf-7de9-b0e3-c05b25bdb3d7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55bf-7de9-b7a7-fdb8e490103e	FI	FIN	246	Finland 	Finska	\N
00040000-55bf-7de9-af4c-ff9ec8177126	FR	FRA	250	France 	Francija	\N
00040000-55bf-7de9-f135-d250a2b8afec	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55bf-7de9-d499-c53de6155a99	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55bf-7de9-813c-0952e2e3744e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55bf-7de9-850f-1452181908c4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55bf-7de9-231d-5173cd59e1b2	GA	GAB	266	Gabon 	Gabon	\N
00040000-55bf-7de9-f49c-eca0f0a6c1aa	GM	GMB	270	Gambia 	Gambija	\N
00040000-55bf-7de9-0cfe-0dcd76dd95bf	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55bf-7de9-6fb2-afc0c81c96e2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55bf-7de9-5da3-ad51efb06b9b	GH	GHA	288	Ghana 	Gana	\N
00040000-55bf-7de9-3275-14d92fef6605	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55bf-7de9-9137-b4297da5fc4d	GR	GRC	300	Greece 	Grčija	\N
00040000-55bf-7de9-a005-32e9c923d764	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55bf-7de9-6078-2376ffc00d55	GD	GRD	308	Grenada 	Grenada	\N
00040000-55bf-7de9-a2fb-e714758656f8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55bf-7de9-0922-a0fda07d03a6	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55bf-7de9-b717-75330b3914b3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55bf-7de9-db02-129690711708	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55bf-7de9-bc31-d093f27095e8	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55bf-7de9-984a-6289b5ec73b9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55bf-7de9-490b-3d4ddb2e4833	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55bf-7de9-54fc-5b9fc664a98b	HT	HTI	332	Haiti 	Haiti	\N
00040000-55bf-7de9-9c7f-d87dfe95e12e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55bf-7de9-0f13-171678cea9e6	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55bf-7de9-76bd-2aa2650db812	HN	HND	340	Honduras 	Honduras	\N
00040000-55bf-7de9-3e76-f7de756ba7fc	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55bf-7de9-9f1e-3cb86ee48072	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55bf-7de9-bf24-d2e571523c42	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55bf-7de9-4020-aa17418abb83	IN	IND	356	India 	Indija	\N
00040000-55bf-7de9-a3f0-d5b053826a56	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55bf-7de9-a939-4beb324b668c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55bf-7de9-caf0-630045e305f3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55bf-7de9-7a50-6cedfbce109a	IE	IRL	372	Ireland 	Irska	\N
00040000-55bf-7de9-b114-9522fd47f7f4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55bf-7de9-2273-62347175a721	IL	ISR	376	Israel 	Izrael	\N
00040000-55bf-7de9-e187-e79d8dbe0d0c	IT	ITA	380	Italy 	Italija	\N
00040000-55bf-7de9-41c2-ad65aecc5287	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55bf-7de9-2911-0e71a3b355a4	JP	JPN	392	Japan 	Japonska	\N
00040000-55bf-7de9-ce61-6d54af65632d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55bf-7de9-8ce8-d60a8c955bc2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55bf-7de9-c269-28bf8b4d78bc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55bf-7de9-e1ac-d17f28e776bd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55bf-7de9-7570-ff61558c4bbf	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55bf-7de9-0c8e-295d3ff30309	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55bf-7de9-82bd-1f7dd4eb5b48	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55bf-7de9-816e-17ba5b44e98f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55bf-7de9-7f7e-d43a5e49ad0b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55bf-7de9-b4f9-bd6a565508c0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55bf-7de9-c121-02c979d4961e	LV	LVA	428	Latvia 	Latvija	\N
00040000-55bf-7de9-9d22-48cfe187f888	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55bf-7de9-4140-537301364f0e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55bf-7de9-6204-bdd1b999a10f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55bf-7de9-64bb-a08ec41ea86e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55bf-7de9-0385-fef0c6515ab6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55bf-7de9-8c21-df8cd7993bb7	LT	LTU	440	Lithuania 	Litva	\N
00040000-55bf-7de9-8043-d5d99773f0f7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55bf-7de9-db28-23660aa2a26f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55bf-7de9-f9de-047773434771	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55bf-7de9-8286-84752f1446ff	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55bf-7de9-27f0-610a1e0e827a	MW	MWI	454	Malawi 	Malavi	\N
00040000-55bf-7de9-daf0-1e273b39df6b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55bf-7de9-de4f-06a9fe236a6e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55bf-7de9-284b-f6a053fa8fd9	ML	MLI	466	Mali 	Mali	\N
00040000-55bf-7de9-83f3-d0e4494e4c1d	MT	MLT	470	Malta 	Malta	\N
00040000-55bf-7de9-0e60-e55ee9e2e7a3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55bf-7de9-6732-bf65a4c68683	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55bf-7de9-c5c3-77eab298cb84	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55bf-7de9-2c85-49d185ef50c4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55bf-7de9-f1e1-c0e8f259bd5d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55bf-7de9-47c5-9cc08260a385	MX	MEX	484	Mexico 	Mehika	\N
00040000-55bf-7de9-e7ad-e1bfe557811c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55bf-7de9-c83d-ff59a2ae826f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55bf-7de9-437d-549ce657316c	MC	MCO	492	Monaco 	Monako	\N
00040000-55bf-7de9-8790-af8179dd38e4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55bf-7de9-b8c0-7cf05285a661	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55bf-7de9-5da5-3bcae9f403d8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55bf-7de9-f0d2-8b289be81c0b	MA	MAR	504	Morocco 	Maroko	\N
00040000-55bf-7de9-79ed-69c47c2b6eb4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55bf-7de9-fe51-51d33ce8517f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55bf-7de9-93e0-f722d279e8f0	NA	NAM	516	Namibia 	Namibija	\N
00040000-55bf-7de9-d2f1-df94b9e507c1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55bf-7de9-4f70-4479ca4996de	NP	NPL	524	Nepal 	Nepal	\N
00040000-55bf-7de9-c362-2f8d02762adc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55bf-7de9-0c8c-c8c937257dce	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55bf-7de9-18bc-a3006e377ced	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55bf-7de9-3f17-bac82572ea74	NE	NER	562	Niger 	Niger 	\N
00040000-55bf-7de9-b869-17bdd7a8ad33	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55bf-7de9-1f5a-156df0866991	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55bf-7de9-e75d-9577620f6416	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55bf-7de9-692e-d3b7647ce30a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55bf-7de9-3553-37dbb6c19553	NO	NOR	578	Norway 	Norveška	\N
00040000-55bf-7de9-c65a-8fd72a404986	OM	OMN	512	Oman 	Oman	\N
00040000-55bf-7de9-ecaf-9983f6d01204	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55bf-7de9-7f2a-127eb2675390	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55bf-7de9-9c37-4f29004ce828	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55bf-7de9-319e-7dd06f583677	PA	PAN	591	Panama 	Panama	\N
00040000-55bf-7de9-35ab-63a2c1e14b93	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55bf-7de9-03de-fa1658514431	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55bf-7de9-a914-7c531ec786a5	PE	PER	604	Peru 	Peru	\N
00040000-55bf-7de9-5602-6ea7cf8b91ae	PH	PHL	608	Philippines 	Filipini	\N
00040000-55bf-7de9-225d-b16044e0f2b2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55bf-7de9-7156-adc051c1bd5e	PL	POL	616	Poland 	Poljska	\N
00040000-55bf-7de9-920e-1739f6df134b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55bf-7de9-9db4-5eb43df6e8b5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55bf-7de9-d50f-f6cfbdc1080a	QA	QAT	634	Qatar 	Katar	\N
00040000-55bf-7de9-e3b6-e0469d3b393f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55bf-7de9-ef2f-c250b53e9726	RO	ROU	642	Romania 	Romunija	\N
00040000-55bf-7de9-895b-2684f76ff3ec	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55bf-7de9-ed2f-faa53b2c4765	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55bf-7de9-4bb6-f0a0c2f96ef9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55bf-7de9-5765-a38d4717eebb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55bf-7de9-d25f-3be86b29b214	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55bf-7de9-102f-47599533a2ec	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55bf-7de9-bb58-249d3bbfd61c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55bf-7de9-f06f-877709ea7b19	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55bf-7de9-cce5-7ee2fb448ac6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55bf-7de9-2ab4-5805b824467a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55bf-7de9-0e00-22d8ca6154be	SM	SMR	674	San Marino 	San Marino	\N
00040000-55bf-7de9-d96b-58d73429ca38	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55bf-7de9-0c92-d1043210dfeb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55bf-7de9-5900-ba787403418a	SN	SEN	686	Senegal 	Senegal	\N
00040000-55bf-7de9-d864-1232bbe12247	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55bf-7de9-dfe5-e9599aa438d0	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55bf-7de9-65e7-2e248572287d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55bf-7de9-817d-2a9d3d8a7ca9	SG	SGP	702	Singapore 	Singapur	\N
00040000-55bf-7de9-d6fa-da281740dfff	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55bf-7de9-94d9-575e9bdb9bde	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55bf-7de9-5f6b-a13d614de37e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55bf-7de9-5297-4254298d815c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55bf-7de9-a6dc-def19e85a679	SO	SOM	706	Somalia 	Somalija	\N
00040000-55bf-7de9-c2eb-e6864d3c058b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55bf-7de9-7608-2bb96a6e5180	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55bf-7de9-68d8-7a910a7a184a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55bf-7de9-4e31-6c529f34e072	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55bf-7de9-a19a-c35866e15539	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55bf-7de9-81f5-bb1467233d57	SD	SDN	729	Sudan 	Sudan	\N
00040000-55bf-7de9-eee5-e7f00b779dc3	SR	SUR	740	Suriname 	Surinam	\N
00040000-55bf-7de9-776f-b153a9375579	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55bf-7de9-7c41-c12369edd77e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55bf-7de9-c9e6-fac5c98c06fd	SE	SWE	752	Sweden 	Švedska	\N
00040000-55bf-7de9-c021-9def8b46dec5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55bf-7de9-9683-567cd0666f52	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55bf-7de9-76bf-b4e9227ef733	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55bf-7de9-490b-948d7333caff	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55bf-7de9-230b-aac2bc1d4d89	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55bf-7de9-a674-ec43459dedb2	TH	THA	764	Thailand 	Tajska	\N
00040000-55bf-7de9-d1c4-4b5611b66466	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55bf-7de9-9672-3798ee886583	TG	TGO	768	Togo 	Togo	\N
00040000-55bf-7de9-b04d-62e9cb131e98	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55bf-7de9-342d-a3c77b399163	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55bf-7de9-d26b-66daf02fa52c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55bf-7de9-d6ee-66ad2310a132	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55bf-7de9-0130-9566b3c929bf	TR	TUR	792	Turkey 	Turčija	\N
00040000-55bf-7de9-2977-8906c0bd61ca	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55bf-7de9-7a7f-cdc88a582b80	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-7de9-9704-150baaca89af	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55bf-7de9-75f4-030a76b34570	UG	UGA	800	Uganda 	Uganda	\N
00040000-55bf-7de9-7e50-6406a815c664	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55bf-7de9-cba6-47f739bd67e6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55bf-7de9-e12a-9d10f124bd93	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55bf-7de9-09d2-8b6f3f30c4d1	US	USA	840	United States 	Združene države Amerike	\N
00040000-55bf-7de9-62c9-9e058170eb14	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55bf-7de9-5ee7-f039d23e1a56	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55bf-7de9-3e66-245037d6888d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55bf-7de9-77f8-ac239ff89503	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55bf-7de9-afe7-c11b12512d24	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55bf-7de9-03aa-8b82ef79194d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55bf-7de9-0cf7-2f855a485b84	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-7de9-1d27-47e94496b1e6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55bf-7de9-a8fb-8fd9a5ca0d1a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55bf-7de9-89f9-f3e1e1e91ecc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55bf-7de9-dca8-a7cdc72aec1d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55bf-7de9-f845-f643049fcf61	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55bf-7de9-1d65-4e22ae1c1aa8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3015 (class 0 OID 11630388)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55bf-7deb-63b2-72b8084d507e	000e0000-55bf-7deb-157d-ac30bb85dfa4	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55bf-7dea-f681-a5725ace569d	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55bf-7deb-e9fa-77f2531a7ffd	000e0000-55bf-7deb-067d-e7b511250167	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55bf-7dea-cc07-d74637b91586	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-7deb-1a44-d9df56c0a4bb	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-7deb-75e9-8bb80bdaa940	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3002 (class 0 OID 11630215)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55bf-7deb-9651-4a40eb7f6737	000e0000-55bf-7deb-067d-e7b511250167	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55bf-7dea-5423-2b3458dedcd0
000d0000-55bf-7deb-c5f1-3b809752ad06	000e0000-55bf-7deb-067d-e7b511250167	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-7dea-5423-2b3458dedcd0
000d0000-55bf-7deb-f24b-ae3004571037	000e0000-55bf-7deb-067d-e7b511250167	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55bf-7dea-1dcc-465e3eee745b
000d0000-55bf-7deb-507d-66c991c42341	000e0000-55bf-7deb-067d-e7b511250167	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55bf-7dea-d2c0-d9dd2ce3610f
000d0000-55bf-7deb-0db9-20af300b0c72	000e0000-55bf-7deb-067d-e7b511250167	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55bf-7dea-14dc-65aab8c7ba22
000d0000-55bf-7deb-35c9-238e15fdd50f	000e0000-55bf-7deb-067d-e7b511250167	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55bf-7dea-0747-79b91d51fa82
000d0000-55bf-7deb-6709-e0b057b96fcf	000e0000-55bf-7deb-067d-e7b511250167	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-7dea-5423-2b3458dedcd0
000d0000-55bf-7deb-2ea3-044620e0a147	000e0000-55bf-7deb-067d-e7b511250167	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55bf-7dea-cab8-cc4c578f790f
\.


--
-- TOC entry 2981 (class 0 OID 11630035)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11630083)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 11630015)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55bf-7deb-c3b0-3c1472a013c5	00080000-55bf-7dea-d387-7d946726e308	00090000-55bf-7deb-6e10-dd1e79ee51cf	AK		
\.


--
-- TOC entry 2956 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11630132)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11630572)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11630584)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11630607)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11630157)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11629972)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55bf-7de9-14ff-1d381a2bb4e9	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55bf-7de9-72c0-aac63267d613	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55bf-7de9-1eca-fb65385949c5	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55bf-7de9-f189-9a4d111e0697	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55bf-7de9-0da2-44f02c7e4438	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55bf-7de9-b066-83793514562f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55bf-7de9-621f-ff74d7f9b709	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55bf-7de9-de86-01009fa37d28	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-7de9-d065-fec68e30a32a	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-7de9-bb78-4347b5cd4aa5	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55bf-7de9-04ef-a5da4623a380	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55bf-7de9-7c02-2a35a3e0ad88	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55bf-7de9-3882-fa7190206f8b	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55bf-7de9-546c-25e978d9ad6c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55bf-7dea-6725-0b17bde8540a	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55bf-7dea-0c5e-50b77c00b0b0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55bf-7dea-ef7a-2d83bd1d467e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55bf-7dea-60b8-a3de0d76b263	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55bf-7dea-3c46-dfa56c80f43a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55bf-7dea-9ffa-68d1b9718b7f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2970 (class 0 OID 11629885)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55bf-7dea-64f0-f5c63f13130d	00000000-55bf-7dea-0c5e-50b77c00b0b0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55bf-7dea-9bf5-104f97d2701b	00000000-55bf-7dea-0c5e-50b77c00b0b0	00010000-55bf-7de9-2d53-bded04176ef8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55bf-7dea-1471-8557acebdbca	00000000-55bf-7dea-ef7a-2d83bd1d467e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2971 (class 0 OID 11629896)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55bf-7deb-a41b-055f9a58182b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55bf-7deb-adfe-7e1ccbdfb9fd	00010000-55bf-7deb-dfdf-93fd71645433	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55bf-7deb-f63d-376f3f9c37be	00010000-55bf-7deb-97d1-e1bd8ce1577c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55bf-7deb-31e6-f2813921aeb3	00010000-55bf-7deb-6165-06232a979ef1	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55bf-7deb-04f7-53ed6b256009	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55bf-7deb-fdc2-2b52e94d6351	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55bf-7deb-9c65-29a32bef8558	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55bf-7deb-59da-3c1283a013eb	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55bf-7deb-6e10-dd1e79ee51cf	00010000-55bf-7deb-7e7a-9ec3cb3e57c7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55bf-7deb-b9f1-64ec5d163725	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55bf-7deb-0424-28ac1079aece	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55bf-7deb-58c1-b55cfd6aad27	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55bf-7deb-3669-91564583c070	00010000-55bf-7deb-90de-a719dd06bac6	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2958 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11629850)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55bf-7de9-22ca-a676fb621ee6	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55bf-7de9-e475-ef0fa21ed55a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55bf-7de9-59dc-1564e77c4242	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55bf-7de9-2717-9fe186f86ea9	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55bf-7de9-c1e1-455dcb549ef3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55bf-7de9-f727-9fb97a4a5d7c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55bf-7de9-7f46-aa5ce211b176	Abonma-read	Abonma - branje	f
00030000-55bf-7de9-4460-85ec2e3b3894	Abonma-write	Abonma - spreminjanje	f
00030000-55bf-7de9-806e-5134e6153739	Alternacija-read	Alternacija - branje	f
00030000-55bf-7de9-2c80-e9b71f2756d3	Alternacija-write	Alternacija - spreminjanje	f
00030000-55bf-7de9-915f-1f8c436fae7e	Arhivalija-read	Arhivalija - branje	f
00030000-55bf-7de9-72f7-e4ef23795e47	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55bf-7de9-2e6d-1024d95e5d5f	Besedilo-read	Besedilo - branje	f
00030000-55bf-7de9-f50c-c67a05c54704	Besedilo-write	Besedilo - spreminjanje	f
00030000-55bf-7de9-59db-60603d4b4d47	DogodekIzven-read	DogodekIzven - branje	f
00030000-55bf-7de9-bd30-d32f592d65bf	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55bf-7de9-b333-09ec543fe49e	Dogodek-read	Dogodek - branje	f
00030000-55bf-7de9-f662-ce60cb35b61a	Dogodek-write	Dogodek - spreminjanje	f
00030000-55bf-7de9-4257-aa44d21810d0	DrugiVir-read	DrugiVir - branje	f
00030000-55bf-7de9-fc6d-0bdab1bddb69	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55bf-7de9-f32d-28d9ef92a7c5	Drzava-read	Drzava - branje	f
00030000-55bf-7de9-fe40-44307574cabc	Drzava-write	Drzava - spreminjanje	f
00030000-55bf-7de9-6886-257218552165	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55bf-7de9-65cc-dd9c72e80021	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55bf-7de9-de56-0102a9c51636	Funkcija-read	Funkcija - branje	f
00030000-55bf-7de9-3de3-ae9dcacbaac8	Funkcija-write	Funkcija - spreminjanje	f
00030000-55bf-7de9-e277-54b49f520db4	Gostovanje-read	Gostovanje - branje	f
00030000-55bf-7de9-67a8-746bd388589f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55bf-7de9-82b1-027c1549c078	Gostujoca-read	Gostujoca - branje	f
00030000-55bf-7de9-83a2-b8bc1f7724b2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55bf-7de9-593f-67a84d5e0615	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55bf-7de9-e197-206f89938058	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55bf-7de9-bd1a-b9803055182d	Kupec-read	Kupec - branje	f
00030000-55bf-7de9-81eb-5937f59b0087	Kupec-write	Kupec - spreminjanje	f
00030000-55bf-7de9-8313-55fc7ae4e518	NacinPlacina-read	NacinPlacina - branje	f
00030000-55bf-7de9-65da-e4e4416efd8f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55bf-7de9-e823-cb166b6eadaa	Option-read	Option - branje	f
00030000-55bf-7de9-2411-856cc1bd4996	Option-write	Option - spreminjanje	f
00030000-55bf-7de9-c6c6-d78a0ddcbd79	OptionValue-read	OptionValue - branje	f
00030000-55bf-7de9-59a1-f305d73766ee	OptionValue-write	OptionValue - spreminjanje	f
00030000-55bf-7de9-fe79-04f1d49a4e62	Oseba-read	Oseba - branje	f
00030000-55bf-7de9-0ae8-094eca68eac5	Oseba-write	Oseba - spreminjanje	f
00030000-55bf-7de9-84e6-ee244c2d2e60	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55bf-7de9-4a98-d818832d52d7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55bf-7de9-3802-4913f4853fc6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55bf-7de9-55ef-e61043693acc	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55bf-7de9-3cac-e167ea6964cf	Pogodba-read	Pogodba - branje	f
00030000-55bf-7de9-f3de-2b3afdd7716c	Pogodba-write	Pogodba - spreminjanje	f
00030000-55bf-7de9-0731-fb97ba63e7a2	Popa-read	Popa - branje	f
00030000-55bf-7de9-21b5-cbde899698e9	Popa-write	Popa - spreminjanje	f
00030000-55bf-7de9-5011-77189714944e	Posta-read	Posta - branje	f
00030000-55bf-7de9-ff09-3731d27de3f3	Posta-write	Posta - spreminjanje	f
00030000-55bf-7de9-5b9e-08f2f2b8155c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55bf-7de9-12a7-9aa49d488528	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55bf-7de9-244f-fe638cd693e1	PostniNaslov-read	PostniNaslov - branje	f
00030000-55bf-7de9-986e-66063c221b6b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55bf-7de9-8dcb-da7056c2fd8e	Predstava-read	Predstava - branje	f
00030000-55bf-7de9-fcac-df77870634d5	Predstava-write	Predstava - spreminjanje	f
00030000-55bf-7de9-abe9-ed32b00d6045	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55bf-7de9-0910-0e32e8f2aaf8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55bf-7de9-0f64-b68790955702	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55bf-7de9-c7e8-aa109b089b7f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55bf-7de9-84cd-808dbd887608	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55bf-7de9-1b2f-89b776e817b3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55bf-7de9-a33d-4bcda271f515	ProgramDela-read	ProgramDela - branje	f
00030000-55bf-7de9-6605-cf3e075d0f65	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55bf-7de9-9525-d11a4717b2d1	ProgramFestival-read	ProgramFestival - branje	f
00030000-55bf-7de9-1517-1844237271a2	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55bf-7de9-ad6d-ae55afb58362	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55bf-7de9-c9e8-2f1d7e774319	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55bf-7de9-b9ec-18ec22f22213	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55bf-7de9-0cdc-acfdec70fbe5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55bf-7de9-1a7e-7b521a3fb67c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55bf-7de9-979f-0fa7aef51b0f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55bf-7de9-e813-ec7595b13194	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55bf-7de9-0418-41cdb0e13ad9	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55bf-7de9-0998-fc273132c0b2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55bf-7de9-ba0c-0dd501146a06	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55bf-7de9-dc16-1189bc73ecd6	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55bf-7de9-cc88-65003af9fcd0	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55bf-7de9-0f40-a6baf0817329	ProgramRazno-read	ProgramRazno - branje	f
00030000-55bf-7de9-4edf-07cf9c9b7fe2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55bf-7de9-3005-2b9d453f42e2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55bf-7de9-ccb1-5705b2f00eac	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55bf-7de9-dc7c-d13fc6b50e64	Prostor-read	Prostor - branje	f
00030000-55bf-7de9-e57a-3c37d506dcc9	Prostor-write	Prostor - spreminjanje	f
00030000-55bf-7de9-ed3f-9a1b465b3ca7	Racun-read	Racun - branje	f
00030000-55bf-7de9-8ac6-bd82fae7e99c	Racun-write	Racun - spreminjanje	f
00030000-55bf-7de9-85a2-08b9252962a6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55bf-7de9-0d13-8bdd0fc89e79	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55bf-7de9-943b-43206fc07ab9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55bf-7de9-f6d2-78a25038dd0e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55bf-7de9-9df9-22dfad97b739	Rekvizit-read	Rekvizit - branje	f
00030000-55bf-7de9-9998-1464a7d490f9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55bf-7de9-c732-181a7f3b3a39	Revizija-read	Revizija - branje	f
00030000-55bf-7de9-79e1-dbdc624beb96	Revizija-write	Revizija - spreminjanje	f
00030000-55bf-7de9-6a0f-ab627ef7eda4	Rezervacija-read	Rezervacija - branje	f
00030000-55bf-7de9-5bdc-6fc2a8e526a7	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55bf-7de9-972d-e199450c12c1	SedezniRed-read	SedezniRed - branje	f
00030000-55bf-7de9-7151-a00b2cf24a15	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55bf-7de9-f5b7-0e56680f1ad8	Sedez-read	Sedez - branje	f
00030000-55bf-7de9-d1cc-8d35e35579da	Sedez-write	Sedez - spreminjanje	f
00030000-55bf-7de9-5202-535089964952	Sezona-read	Sezona - branje	f
00030000-55bf-7de9-7abb-4420017910b1	Sezona-write	Sezona - spreminjanje	f
00030000-55bf-7de9-d3ba-bb88f2b01c75	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55bf-7de9-ad42-b2b72dbc1847	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55bf-7de9-fbe2-bde7b85c815c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55bf-7de9-d2b1-3bc54ffc2917	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55bf-7de9-4387-cae47698acdd	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55bf-7de9-1dec-2638071d58bf	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55bf-7de9-419f-1d4f83a3b536	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55bf-7de9-b12e-3ac7cec23b79	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55bf-7de9-2d9d-e39290b0e9b2	Telefonska-read	Telefonska - branje	f
00030000-55bf-7de9-6b42-6c0917321bae	Telefonska-write	Telefonska - spreminjanje	f
00030000-55bf-7de9-b4a3-3218676941d5	TerminStoritve-read	TerminStoritve - branje	f
00030000-55bf-7de9-cae8-d4a5134ce8fd	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55bf-7de9-7eb7-bc0148b5923c	TipFunkcije-read	TipFunkcije - branje	f
00030000-55bf-7de9-5f91-242ac68c5247	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55bf-7de9-32cd-de63ac4fa251	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55bf-7de9-f42a-0d65b761525a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55bf-7de9-26ca-db58b773efa1	Trr-read	Trr - branje	f
00030000-55bf-7de9-cc8b-8e3782e9b1ea	Trr-write	Trr - spreminjanje	f
00030000-55bf-7de9-2565-96ad6fe7ad33	Uprizoritev-read	Uprizoritev - branje	f
00030000-55bf-7de9-8851-c9403bde6553	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55bf-7de9-77ef-8617b71b36ef	Vaja-read	Vaja - branje	f
00030000-55bf-7de9-68fc-56590b43b2f6	Vaja-write	Vaja - spreminjanje	f
00030000-55bf-7de9-2025-e9df6e2d3ed1	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55bf-7de9-57d2-948b9f0c4487	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55bf-7de9-6c41-1013170c81df	Zaposlitev-read	Zaposlitev - branje	f
00030000-55bf-7de9-667b-e10c9f32ab11	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55bf-7de9-aa45-53b59284a303	Zasedenost-read	Zasedenost - branje	f
00030000-55bf-7de9-f147-4325837a865a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55bf-7de9-68c9-1ee66f32bf08	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55bf-7de9-de80-292cea7f45b7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55bf-7de9-5530-3ce60f2df72b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55bf-7de9-d573-25fbeb3278a8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55bf-7de9-9ac2-31f149809a2f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55bf-7de9-8470-cc531f499f81	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55bf-7de9-5191-a93a624d4023	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55bf-7de9-e447-43ea8b8aa94a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55bf-7de9-9ee8-77d909fd8911	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-7de9-ad51-6f517c35713f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-7de9-6169-13e6b23bc63e	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-7de9-f45b-6778d995570b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-7de9-39cf-be2f7abaaaa9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55bf-7de9-9b3d-ebc4f9f3d16a	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55bf-7de9-8207-2ef3e861d320	Datoteka-write	Datoteka - spreminjanje	f
00030000-55bf-7de9-b626-2415e35b15ed	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2968 (class 0 OID 11629869)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55bf-7de9-4349-e10539f48359	00030000-55bf-7de9-e475-ef0fa21ed55a
00020000-55bf-7de9-3914-401c2b5b60b4	00030000-55bf-7de9-f32d-28d9ef92a7c5
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-7f46-aa5ce211b176
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-4460-85ec2e3b3894
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-806e-5134e6153739
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-2c80-e9b71f2756d3
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-915f-1f8c436fae7e
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-b333-09ec543fe49e
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-2717-9fe186f86ea9
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-f662-ce60cb35b61a
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-f32d-28d9ef92a7c5
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-fe40-44307574cabc
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-de56-0102a9c51636
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-3de3-ae9dcacbaac8
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-e277-54b49f520db4
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-67a8-746bd388589f
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-82b1-027c1549c078
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-83a2-b8bc1f7724b2
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-593f-67a84d5e0615
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-e197-206f89938058
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-e823-cb166b6eadaa
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-c6c6-d78a0ddcbd79
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-fe79-04f1d49a4e62
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-0ae8-094eca68eac5
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-0731-fb97ba63e7a2
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-21b5-cbde899698e9
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-5011-77189714944e
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-ff09-3731d27de3f3
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-244f-fe638cd693e1
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-986e-66063c221b6b
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-8dcb-da7056c2fd8e
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-fcac-df77870634d5
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-84cd-808dbd887608
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-1b2f-89b776e817b3
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-dc7c-d13fc6b50e64
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-e57a-3c37d506dcc9
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-943b-43206fc07ab9
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-f6d2-78a25038dd0e
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-9df9-22dfad97b739
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-9998-1464a7d490f9
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-5202-535089964952
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-7abb-4420017910b1
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-7eb7-bc0148b5923c
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-2565-96ad6fe7ad33
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-8851-c9403bde6553
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-77ef-8617b71b36ef
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-68fc-56590b43b2f6
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-aa45-53b59284a303
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-f147-4325837a865a
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-68c9-1ee66f32bf08
00020000-55bf-7de9-e5f3-7cf27e392b86	00030000-55bf-7de9-5530-3ce60f2df72b
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-7f46-aa5ce211b176
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-915f-1f8c436fae7e
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-b333-09ec543fe49e
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-f32d-28d9ef92a7c5
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-e277-54b49f520db4
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-82b1-027c1549c078
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-593f-67a84d5e0615
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-e197-206f89938058
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-e823-cb166b6eadaa
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-c6c6-d78a0ddcbd79
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-fe79-04f1d49a4e62
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-0ae8-094eca68eac5
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-0731-fb97ba63e7a2
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-5011-77189714944e
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-244f-fe638cd693e1
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-986e-66063c221b6b
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-8dcb-da7056c2fd8e
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-dc7c-d13fc6b50e64
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-943b-43206fc07ab9
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-9df9-22dfad97b739
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-5202-535089964952
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-2d9d-e39290b0e9b2
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-6b42-6c0917321bae
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-26ca-db58b773efa1
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-cc8b-8e3782e9b1ea
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-6c41-1013170c81df
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-667b-e10c9f32ab11
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-68c9-1ee66f32bf08
00020000-55bf-7de9-9926-1b9e2c31798d	00030000-55bf-7de9-5530-3ce60f2df72b
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-7f46-aa5ce211b176
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-806e-5134e6153739
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-915f-1f8c436fae7e
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-72f7-e4ef23795e47
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-2e6d-1024d95e5d5f
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-59db-60603d4b4d47
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-b333-09ec543fe49e
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-f32d-28d9ef92a7c5
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-de56-0102a9c51636
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-e277-54b49f520db4
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-82b1-027c1549c078
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-593f-67a84d5e0615
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-e823-cb166b6eadaa
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-c6c6-d78a0ddcbd79
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-fe79-04f1d49a4e62
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-0731-fb97ba63e7a2
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-5011-77189714944e
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-8dcb-da7056c2fd8e
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-84cd-808dbd887608
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-dc7c-d13fc6b50e64
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-943b-43206fc07ab9
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-9df9-22dfad97b739
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-5202-535089964952
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-7eb7-bc0148b5923c
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-77ef-8617b71b36ef
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-aa45-53b59284a303
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-68c9-1ee66f32bf08
00020000-55bf-7de9-37f7-58e1c0a9c7f6	00030000-55bf-7de9-5530-3ce60f2df72b
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-7f46-aa5ce211b176
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-4460-85ec2e3b3894
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-2c80-e9b71f2756d3
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-915f-1f8c436fae7e
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-b333-09ec543fe49e
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-f32d-28d9ef92a7c5
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-e277-54b49f520db4
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-82b1-027c1549c078
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-e823-cb166b6eadaa
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-c6c6-d78a0ddcbd79
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-0731-fb97ba63e7a2
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-5011-77189714944e
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-8dcb-da7056c2fd8e
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-dc7c-d13fc6b50e64
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-943b-43206fc07ab9
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-9df9-22dfad97b739
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-5202-535089964952
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-7eb7-bc0148b5923c
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-68c9-1ee66f32bf08
00020000-55bf-7de9-91eb-6f0a77ee5381	00030000-55bf-7de9-5530-3ce60f2df72b
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-7f46-aa5ce211b176
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-915f-1f8c436fae7e
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-b333-09ec543fe49e
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-f32d-28d9ef92a7c5
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-e277-54b49f520db4
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-82b1-027c1549c078
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-e823-cb166b6eadaa
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-c6c6-d78a0ddcbd79
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-0731-fb97ba63e7a2
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-5011-77189714944e
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-8dcb-da7056c2fd8e
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-dc7c-d13fc6b50e64
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-943b-43206fc07ab9
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-9df9-22dfad97b739
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-5202-535089964952
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-b4a3-3218676941d5
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-59dc-1564e77c4242
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-7eb7-bc0148b5923c
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-68c9-1ee66f32bf08
00020000-55bf-7de9-d325-3a35fa9dd455	00030000-55bf-7de9-5530-3ce60f2df72b
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-22ca-a676fb621ee6
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-e475-ef0fa21ed55a
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-59dc-1564e77c4242
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-2717-9fe186f86ea9
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-c1e1-455dcb549ef3
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f727-9fb97a4a5d7c
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-7f46-aa5ce211b176
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-4460-85ec2e3b3894
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-806e-5134e6153739
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-2c80-e9b71f2756d3
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-915f-1f8c436fae7e
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-72f7-e4ef23795e47
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-2e6d-1024d95e5d5f
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f50c-c67a05c54704
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-59db-60603d4b4d47
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-bd30-d32f592d65bf
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-b333-09ec543fe49e
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f662-ce60cb35b61a
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f32d-28d9ef92a7c5
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-fe40-44307574cabc
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-4257-aa44d21810d0
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-fc6d-0bdab1bddb69
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-6886-257218552165
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-65cc-dd9c72e80021
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-de56-0102a9c51636
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-3de3-ae9dcacbaac8
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-e277-54b49f520db4
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-67a8-746bd388589f
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-82b1-027c1549c078
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-83a2-b8bc1f7724b2
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-593f-67a84d5e0615
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-e197-206f89938058
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-bd1a-b9803055182d
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-81eb-5937f59b0087
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-8313-55fc7ae4e518
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-65da-e4e4416efd8f
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-e823-cb166b6eadaa
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-2411-856cc1bd4996
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-c6c6-d78a0ddcbd79
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-59a1-f305d73766ee
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-fe79-04f1d49a4e62
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0ae8-094eca68eac5
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-84e6-ee244c2d2e60
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-4a98-d818832d52d7
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-3802-4913f4853fc6
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-55ef-e61043693acc
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-3cac-e167ea6964cf
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f3de-2b3afdd7716c
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0731-fb97ba63e7a2
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-21b5-cbde899698e9
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-5011-77189714944e
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-ff09-3731d27de3f3
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-5b9e-08f2f2b8155c
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-12a7-9aa49d488528
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-244f-fe638cd693e1
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-986e-66063c221b6b
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-8dcb-da7056c2fd8e
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-fcac-df77870634d5
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-abe9-ed32b00d6045
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0910-0e32e8f2aaf8
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0f64-b68790955702
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-c7e8-aa109b089b7f
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-84cd-808dbd887608
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-1b2f-89b776e817b3
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-a33d-4bcda271f515
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-6605-cf3e075d0f65
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-9525-d11a4717b2d1
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-1517-1844237271a2
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-ad6d-ae55afb58362
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-c9e8-2f1d7e774319
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-b9ec-18ec22f22213
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0cdc-acfdec70fbe5
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-1a7e-7b521a3fb67c
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-979f-0fa7aef51b0f
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-e813-ec7595b13194
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0418-41cdb0e13ad9
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0998-fc273132c0b2
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-ba0c-0dd501146a06
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-dc16-1189bc73ecd6
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-cc88-65003af9fcd0
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0f40-a6baf0817329
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-4edf-07cf9c9b7fe2
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-3005-2b9d453f42e2
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-ccb1-5705b2f00eac
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-dc7c-d13fc6b50e64
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-e57a-3c37d506dcc9
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-ed3f-9a1b465b3ca7
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-8ac6-bd82fae7e99c
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-85a2-08b9252962a6
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-0d13-8bdd0fc89e79
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-943b-43206fc07ab9
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f6d2-78a25038dd0e
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-9df9-22dfad97b739
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-9998-1464a7d490f9
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-c732-181a7f3b3a39
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-79e1-dbdc624beb96
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-6a0f-ab627ef7eda4
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-5bdc-6fc2a8e526a7
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-972d-e199450c12c1
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-7151-a00b2cf24a15
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f5b7-0e56680f1ad8
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-d1cc-8d35e35579da
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-5202-535089964952
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-7abb-4420017910b1
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-d3ba-bb88f2b01c75
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-ad42-b2b72dbc1847
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-fbe2-bde7b85c815c
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-d2b1-3bc54ffc2917
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-4387-cae47698acdd
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-1dec-2638071d58bf
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-419f-1d4f83a3b536
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-b12e-3ac7cec23b79
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-2d9d-e39290b0e9b2
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-6b42-6c0917321bae
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-b4a3-3218676941d5
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-cae8-d4a5134ce8fd
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-7eb7-bc0148b5923c
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-5f91-242ac68c5247
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-32cd-de63ac4fa251
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f42a-0d65b761525a
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-26ca-db58b773efa1
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-cc8b-8e3782e9b1ea
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-2565-96ad6fe7ad33
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-8851-c9403bde6553
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-77ef-8617b71b36ef
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-68fc-56590b43b2f6
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-2025-e9df6e2d3ed1
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-57d2-948b9f0c4487
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-6c41-1013170c81df
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-667b-e10c9f32ab11
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-aa45-53b59284a303
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-f147-4325837a865a
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-68c9-1ee66f32bf08
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-de80-292cea7f45b7
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-5530-3ce60f2df72b
00020000-55bf-7deb-d7ab-1a7d036e8397	00030000-55bf-7de9-d573-25fbeb3278a8
\.


--
-- TOC entry 2996 (class 0 OID 11630164)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 11630195)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 11630309)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55bf-7deb-2732-093553fc1761	00090000-55bf-7deb-a41b-055f9a58182b	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55bf-7deb-0f9c-34a36e1cf2fd	00090000-55bf-7deb-fdc2-2b52e94d6351	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55bf-7deb-3021-eee06637f220	00090000-55bf-7deb-3669-91564583c070	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2973 (class 0 OID 11629929)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55bf-7dea-d387-7d946726e308	00040000-55bf-7de9-5f6b-a13d614de37e	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-7dea-c8e6-8b0102c15feb	00040000-55bf-7de9-5f6b-a13d614de37e	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55bf-7dea-143f-d86f3833d0b5	00040000-55bf-7de9-5f6b-a13d614de37e	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-7dea-67a4-7380943fac10	00040000-55bf-7de9-5f6b-a13d614de37e	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-7dea-dfc4-84310b121090	00040000-55bf-7de9-5f6b-a13d614de37e	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-7dea-f2ac-828b4ba0506c	00040000-55bf-7de9-0c57-ef65e738dd2e	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-7dea-c36f-4e9b2a7cd985	00040000-55bf-7de9-c53d-ebb903d532e9	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-7dea-41e0-d01070bb73c9	00040000-55bf-7de9-29c2-c569f9753006	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-7deb-975a-7195af56f8e8	00040000-55bf-7de9-5f6b-a13d614de37e	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2975 (class 0 OID 11629964)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55bf-7de9-6aac-f3c2e0e863c9	8341	Adlešiči
00050000-55bf-7de9-010e-a72e61890032	5270	Ajdovščina
00050000-55bf-7de9-7937-2793634fffba	6280	Ankaran/Ancarano
00050000-55bf-7de9-1315-1621d3bcfa42	9253	Apače
00050000-55bf-7de9-26e7-d89ad0e0aecc	8253	Artiče
00050000-55bf-7de9-fb5a-15aeca402a0b	4275	Begunje na Gorenjskem
00050000-55bf-7de9-8d02-7b6c491260ef	1382	Begunje pri Cerknici
00050000-55bf-7de9-8bd1-90f5c27b2aa0	9231	Beltinci
00050000-55bf-7de9-e117-2cf1b2d40a16	2234	Benedikt
00050000-55bf-7de9-b8bb-e5d2f46c0bbc	2345	Bistrica ob Dravi
00050000-55bf-7de9-ef7b-31296b15de1d	3256	Bistrica ob Sotli
00050000-55bf-7de9-013f-9cca5d193cf9	8259	Bizeljsko
00050000-55bf-7de9-3018-411c3b9cf18c	1223	Blagovica
00050000-55bf-7de9-2ace-328e77d0dce1	8283	Blanca
00050000-55bf-7de9-910e-453bfbc59475	4260	Bled
00050000-55bf-7de9-fcb7-7f5217a18e84	4273	Blejska Dobrava
00050000-55bf-7de9-6e7b-da8a270da810	9265	Bodonci
00050000-55bf-7de9-df0e-89a0a1161eb6	9222	Bogojina
00050000-55bf-7de9-cea1-4a32a83a108c	4263	Bohinjska Bela
00050000-55bf-7de9-bb56-23f4d0b195bd	4264	Bohinjska Bistrica
00050000-55bf-7de9-4d5e-58868408805f	4265	Bohinjsko jezero
00050000-55bf-7de9-ec65-d62021253eb5	1353	Borovnica
00050000-55bf-7de9-7cc1-180e2075773b	8294	Boštanj
00050000-55bf-7de9-7a0c-f46993ab07e1	5230	Bovec
00050000-55bf-7de9-3b71-89c36f30bea7	5295	Branik
00050000-55bf-7de9-c7a3-82e30cfa7c6c	3314	Braslovče
00050000-55bf-7de9-a2e0-879e72c6dbf1	5223	Breginj
00050000-55bf-7de9-b1fb-4c676ba736c4	8280	Brestanica
00050000-55bf-7de9-6784-5f2170dbd6da	2354	Bresternica
00050000-55bf-7de9-aece-d683afb16e44	4243	Brezje
00050000-55bf-7de9-0ed7-41045bfa37cb	1351	Brezovica pri Ljubljani
00050000-55bf-7de9-a6b2-d7e2ca9b5450	8250	Brežice
00050000-55bf-7de9-0edc-9727a10f2ec4	4210	Brnik - Aerodrom
00050000-55bf-7de9-c123-af7cdd23a5b2	8321	Brusnice
00050000-55bf-7de9-e36f-c555daad419c	3255	Buče
00050000-55bf-7de9-0aaa-bdbc0fec40ef	8276	Bučka 
00050000-55bf-7de9-6a29-275165fd72a5	9261	Cankova
00050000-55bf-7de9-8373-15e68c428931	3000	Celje 
00050000-55bf-7de9-ba24-e570add4fe36	3001	Celje - poštni predali
00050000-55bf-7de9-107d-e52d6448fbd8	4207	Cerklje na Gorenjskem
00050000-55bf-7de9-fafe-04aee6cf4311	8263	Cerklje ob Krki
00050000-55bf-7de9-a500-b6be7ea8acde	1380	Cerknica
00050000-55bf-7de9-2add-f2a58db12f7e	5282	Cerkno
00050000-55bf-7de9-4df4-5478904182ae	2236	Cerkvenjak
00050000-55bf-7de9-8681-6b2856f4f019	2215	Ceršak
00050000-55bf-7de9-eec5-adf9be61d88d	2326	Cirkovce
00050000-55bf-7de9-4f81-82ff15567549	2282	Cirkulane
00050000-55bf-7de9-1f70-bbb93e691295	5273	Col
00050000-55bf-7de9-d070-ce6d65ca8e19	8251	Čatež ob Savi
00050000-55bf-7de9-c443-ff6f69b511c6	1413	Čemšenik
00050000-55bf-7de9-5a9b-55170b747596	5253	Čepovan
00050000-55bf-7de9-74eb-16e7de97fdaf	9232	Črenšovci
00050000-55bf-7de9-ecb6-4fa76436df41	2393	Črna na Koroškem
00050000-55bf-7de9-9d79-413ebe1f975d	6275	Črni Kal
00050000-55bf-7de9-0687-6d3534119086	5274	Črni Vrh nad Idrijo
00050000-55bf-7de9-079c-9c82bb00d128	5262	Črniče
00050000-55bf-7de9-4f48-8cf0cfea5438	8340	Črnomelj
00050000-55bf-7de9-2192-98ccf194208b	6271	Dekani
00050000-55bf-7de9-577e-6af0e6ed123c	5210	Deskle
00050000-55bf-7de9-c157-01838e2cd7ee	2253	Destrnik
00050000-55bf-7de9-8072-f50f9f00ac06	6215	Divača
00050000-55bf-7de9-467f-8237dd6558a4	1233	Dob
00050000-55bf-7de9-2d9f-1f76c4bd3c26	3224	Dobje pri Planini
00050000-55bf-7de9-2ee6-d005800aa937	8257	Dobova
00050000-55bf-7de9-e38c-296c6494ccde	1423	Dobovec
00050000-55bf-7de9-c9a7-0b06dd6e3ef5	5263	Dobravlje
00050000-55bf-7de9-0eea-a9984207ea5d	3204	Dobrna
00050000-55bf-7de9-8743-1326c57b5620	8211	Dobrnič
00050000-55bf-7de9-59d4-49ae7ac7cc75	1356	Dobrova
00050000-55bf-7de9-31da-603622019c04	9223	Dobrovnik/Dobronak 
00050000-55bf-7de9-e665-6ec498d69474	5212	Dobrovo v Brdih
00050000-55bf-7de9-e8c3-9c3e3722e2fb	1431	Dol pri Hrastniku
00050000-55bf-7de9-6f9b-8edcca9587c5	1262	Dol pri Ljubljani
00050000-55bf-7de9-b889-fb2582f5681f	1273	Dole pri Litiji
00050000-55bf-7de9-44c4-d93d1fcc1ed0	1331	Dolenja vas
00050000-55bf-7de9-1c80-bb0d867cdb18	8350	Dolenjske Toplice
00050000-55bf-7de9-784d-59b4455d9a21	1230	Domžale
00050000-55bf-7de9-0921-32696a5a5430	2252	Dornava
00050000-55bf-7de9-2206-6f2657edd64c	5294	Dornberk
00050000-55bf-7de9-e2c6-dba02024a7b8	1319	Draga
00050000-55bf-7de9-c545-12950db65f8c	8343	Dragatuš
00050000-55bf-7de9-3594-414601075f20	3222	Dramlje
00050000-55bf-7de9-391b-a530d1e73abb	2370	Dravograd
00050000-55bf-7de9-8cd7-433491d3becc	4203	Duplje
00050000-55bf-7de9-01b3-132aaec6a509	6221	Dutovlje
00050000-55bf-7de9-ed6e-ebc6b0258842	8361	Dvor
00050000-55bf-7de9-5d4e-e6f5fc1ecb8b	2343	Fala
00050000-55bf-7de9-039e-a0113054bcda	9208	Fokovci
00050000-55bf-7de9-3518-03dc4400dd20	2313	Fram
00050000-55bf-7de9-e7f6-2a9506c3d3d9	3213	Frankolovo
00050000-55bf-7de9-a660-925e350a492b	1274	Gabrovka
00050000-55bf-7de9-2876-ab0454c76a69	8254	Globoko
00050000-55bf-7de9-7be3-860ca556ce98	5275	Godovič
00050000-55bf-7de9-14b8-ca8b15474b76	4204	Golnik
00050000-55bf-7de9-09d3-f974a53bc1ad	3303	Gomilsko
00050000-55bf-7de9-36c3-41755f234263	4224	Gorenja vas
00050000-55bf-7de9-16be-7af7de06dd21	3263	Gorica pri Slivnici
00050000-55bf-7de9-e02b-9ecaad7ade7b	2272	Gorišnica
00050000-55bf-7de9-c3fb-24327c0ab1e9	9250	Gornja Radgona
00050000-55bf-7de9-02b6-c9604a2b2ec6	3342	Gornji Grad
00050000-55bf-7de9-9a9d-f497d0b35246	4282	Gozd Martuljek
00050000-55bf-7de9-464f-3b6155251e7f	6272	Gračišče
00050000-55bf-7de9-2158-a9c429c57fe6	9264	Grad
00050000-55bf-7de9-5440-98cd52f727ca	8332	Gradac
00050000-55bf-7de9-3e9b-1b8d4bb381dd	1384	Grahovo
00050000-55bf-7de9-97d5-672668228385	5242	Grahovo ob Bači
00050000-55bf-7de9-5881-9f271b1fd3f3	5251	Grgar
00050000-55bf-7de9-dbd5-94af5dbc529b	3302	Griže
00050000-55bf-7de9-69c5-324a21b51f67	3231	Grobelno
00050000-55bf-7de9-3be2-ad6b9e2b7149	1290	Grosuplje
00050000-55bf-7de9-e02e-f1303c83cb5d	2288	Hajdina
00050000-55bf-7de9-b564-64c6cf4e1cc6	8362	Hinje
00050000-55bf-7de9-d0db-dfd89a6e70f8	2311	Hoče
00050000-55bf-7de9-d2a2-3398f89eff82	9205	Hodoš/Hodos
00050000-55bf-7de9-d0b3-2c956c9c0612	1354	Horjul
00050000-55bf-7de9-d57e-24257d1a4a5b	1372	Hotedršica
00050000-55bf-7de9-6210-361e89224e3a	1430	Hrastnik
00050000-55bf-7de9-4853-876bb5ff18dc	6225	Hruševje
00050000-55bf-7de9-f5c3-2895227a6fd3	4276	Hrušica
00050000-55bf-7de9-3151-f64935194132	5280	Idrija
00050000-55bf-7de9-9e8b-4b97819f482e	1292	Ig
00050000-55bf-7de9-7b36-021897073dc4	6250	Ilirska Bistrica
00050000-55bf-7de9-6bb7-2123040115f6	6251	Ilirska Bistrica-Trnovo
00050000-55bf-7de9-69e8-2a2c37d6c34d	1295	Ivančna Gorica
00050000-55bf-7de9-bac4-2f29d41f9ea2	2259	Ivanjkovci
00050000-55bf-7de9-7c40-e5efe7412c8e	1411	Izlake
00050000-55bf-7de9-51a4-4f46382c5cc6	6310	Izola/Isola
00050000-55bf-7de9-167e-fde2267f5d34	2222	Jakobski Dol
00050000-55bf-7de9-3b7a-06be582ad2f6	2221	Jarenina
00050000-55bf-7de9-6fba-7bcc6fe0d0fb	6254	Jelšane
00050000-55bf-7de9-b669-95d48b003534	4270	Jesenice
00050000-55bf-7de9-4226-dd7eeba98926	8261	Jesenice na Dolenjskem
00050000-55bf-7de9-31e8-c6447d95bd69	3273	Jurklošter
00050000-55bf-7de9-8ba8-8706984ebc6c	2223	Jurovski Dol
00050000-55bf-7de9-7611-8053147a0135	2256	Juršinci
00050000-55bf-7de9-2807-49d24217f976	5214	Kal nad Kanalom
00050000-55bf-7de9-7e60-0af9a6e5b82f	3233	Kalobje
00050000-55bf-7de9-9e13-9f92fa54a259	4246	Kamna Gorica
00050000-55bf-7de9-2a89-48ef6ea04259	2351	Kamnica
00050000-55bf-7de9-1358-037f39cab832	1241	Kamnik
00050000-55bf-7de9-0b45-4ad3ab82b4b5	5213	Kanal
00050000-55bf-7de9-9563-beb8765bfd21	8258	Kapele
00050000-55bf-7de9-81f6-e02eb635f66c	2362	Kapla
00050000-55bf-7de9-3420-52fd01df0d73	2325	Kidričevo
00050000-55bf-7de9-ab85-400390280fec	1412	Kisovec
00050000-55bf-7de9-3478-42c1a89484ab	6253	Knežak
00050000-55bf-7de9-5418-5042fafe07c4	5222	Kobarid
00050000-55bf-7de9-0765-c183e2560f57	9227	Kobilje
00050000-55bf-7de9-46d9-fd82fe264a77	1330	Kočevje
00050000-55bf-7de9-0964-83f5ab7bddf8	1338	Kočevska Reka
00050000-55bf-7de9-7b78-d20fb2c1aa39	2276	Kog
00050000-55bf-7de9-627d-d46cfef86aa5	5211	Kojsko
00050000-55bf-7de9-54aa-09392d8851dd	6223	Komen
00050000-55bf-7de9-c5dc-8bbd6d630ffb	1218	Komenda
00050000-55bf-7de9-350b-a6203710fd82	6000	Koper/Capodistria 
00050000-55bf-7de9-e353-cd4ee53a0cdd	6001	Koper/Capodistria - poštni predali
00050000-55bf-7de9-b896-aac48957c547	8282	Koprivnica
00050000-55bf-7de9-9f50-edb039648fe6	5296	Kostanjevica na Krasu
00050000-55bf-7de9-d02b-84d3270784ff	8311	Kostanjevica na Krki
00050000-55bf-7de9-af93-6cdb122428ad	1336	Kostel
00050000-55bf-7de9-9ad3-6e3440974b8d	6256	Košana
00050000-55bf-7de9-db0e-fc59d12015f7	2394	Kotlje
00050000-55bf-7de9-8802-48de02433778	6240	Kozina
00050000-55bf-7de9-b908-5e77221b2324	3260	Kozje
00050000-55bf-7de9-4ed5-64e47e448d5e	4000	Kranj 
00050000-55bf-7de9-3938-d2d8bc0ed6af	4001	Kranj - poštni predali
00050000-55bf-7de9-e0f5-4d6f24a383bf	4280	Kranjska Gora
00050000-55bf-7de9-b9f1-9961f6e7c4f5	1281	Kresnice
00050000-55bf-7de9-6feb-cb4f279e60c2	4294	Križe
00050000-55bf-7de9-b2d2-c24280078902	9206	Križevci
00050000-55bf-7de9-7c6b-82b1f1ed168f	9242	Križevci pri Ljutomeru
00050000-55bf-7de9-6784-9d7035df0bd9	1301	Krka
00050000-55bf-7de9-6aa4-ede2798e7f72	8296	Krmelj
00050000-55bf-7de9-ad5f-8773d5a5d9ef	4245	Kropa
00050000-55bf-7de9-673d-d2a75bb13986	8262	Krška vas
00050000-55bf-7de9-fd12-30256fee7ed8	8270	Krško
00050000-55bf-7de9-a456-19a8a0b34769	9263	Kuzma
00050000-55bf-7de9-4cb8-7c6760462d74	2318	Laporje
00050000-55bf-7de9-0f2d-b7f3eab44fab	3270	Laško
00050000-55bf-7de9-ef07-bb3f2795b6c9	1219	Laze v Tuhinju
00050000-55bf-7de9-30a6-080ec5e9b0bc	2230	Lenart v Slovenskih goricah
00050000-55bf-7de9-3eca-c0d7510c5daf	9220	Lendava/Lendva
00050000-55bf-7de9-5ccc-de70597e10b5	4248	Lesce
00050000-55bf-7de9-e73f-b4c9b0c75f34	3261	Lesično
00050000-55bf-7de9-a9f6-27c72fbdb6fc	8273	Leskovec pri Krškem
00050000-55bf-7de9-c61b-aa3fdeadd822	2372	Libeliče
00050000-55bf-7de9-0e06-f4ba6e23d814	2341	Limbuš
00050000-55bf-7de9-ea37-1ac048cdae15	1270	Litija
00050000-55bf-7de9-af43-bef52a06f6a1	3202	Ljubečna
00050000-55bf-7de9-4275-766359d8788e	1000	Ljubljana 
00050000-55bf-7de9-cb88-f50dcdcc7a5c	1001	Ljubljana - poštni predali
00050000-55bf-7de9-38cf-125b952075d0	1231	Ljubljana - Črnuče
00050000-55bf-7de9-1123-56c9841c5b78	1261	Ljubljana - Dobrunje
00050000-55bf-7de9-7c73-e690916c4ed0	1260	Ljubljana - Polje
00050000-55bf-7de9-ee49-82d05a242687	1210	Ljubljana - Šentvid
00050000-55bf-7de9-2e55-3d9068ebf231	1211	Ljubljana - Šmartno
00050000-55bf-7de9-36c9-7f892da62d90	3333	Ljubno ob Savinji
00050000-55bf-7de9-089c-4ed04c03e895	9240	Ljutomer
00050000-55bf-7de9-495b-84599ec29546	3215	Loče
00050000-55bf-7de9-9870-3d00fa2bb99b	5231	Log pod Mangartom
00050000-55bf-7de9-d08c-4b2f13734d89	1358	Log pri Brezovici
00050000-55bf-7de9-62af-e3d8015bba04	1370	Logatec
00050000-55bf-7de9-78c1-42b50ef49973	1371	Logatec
00050000-55bf-7de9-c5bc-0667790fc869	1434	Loka pri Zidanem Mostu
00050000-55bf-7de9-210c-f7bf762ef398	3223	Loka pri Žusmu
00050000-55bf-7de9-6e35-ad73bc0e32cd	6219	Lokev
00050000-55bf-7de9-ac93-83faa024546d	1318	Loški Potok
00050000-55bf-7de9-8b4b-7c581f5115f4	2324	Lovrenc na Dravskem polju
00050000-55bf-7de9-8087-0c95da2f9eac	2344	Lovrenc na Pohorju
00050000-55bf-7de9-9643-6d0b957c28cf	3334	Luče
00050000-55bf-7de9-da77-a50602802347	1225	Lukovica
00050000-55bf-7de9-fcdf-9ca1caa22599	9202	Mačkovci
00050000-55bf-7dea-9bfe-af3b991fd878	2322	Majšperk
00050000-55bf-7dea-c844-7b7ae7e4675d	2321	Makole
00050000-55bf-7dea-1af3-aaa07341e141	9243	Mala Nedelja
00050000-55bf-7dea-665a-e14ab40ff6de	2229	Malečnik
00050000-55bf-7dea-75fc-55e383af40df	6273	Marezige
00050000-55bf-7dea-4088-e63b99bf0286	2000	Maribor 
00050000-55bf-7dea-6134-f3eb87b9c793	2001	Maribor - poštni predali
00050000-55bf-7dea-4fd0-4ba851107797	2206	Marjeta na Dravskem polju
00050000-55bf-7dea-d26f-25a6b715c8c6	2281	Markovci
00050000-55bf-7dea-f95d-9e087be6d938	9221	Martjanci
00050000-55bf-7dea-c604-951014525012	6242	Materija
00050000-55bf-7dea-71f0-a1c61317d50a	4211	Mavčiče
00050000-55bf-7dea-a03c-4a765c4a8ad4	1215	Medvode
00050000-55bf-7dea-9bcd-989830dbc2fc	1234	Mengeš
00050000-55bf-7dea-d1cf-7065b3c12a20	8330	Metlika
00050000-55bf-7dea-ec8b-86ed7258fd94	2392	Mežica
00050000-55bf-7dea-c1a8-c4f62ce63a3c	2204	Miklavž na Dravskem polju
00050000-55bf-7dea-60d7-621d276a718e	2275	Miklavž pri Ormožu
00050000-55bf-7dea-4865-585d5adb48e0	5291	Miren
00050000-55bf-7dea-bf7d-403287816fd6	8233	Mirna
00050000-55bf-7dea-30c5-98d679e6789b	8216	Mirna Peč
00050000-55bf-7dea-3fb3-fffa8705ab7f	2382	Mislinja
00050000-55bf-7dea-42c2-bcd647d63466	4281	Mojstrana
00050000-55bf-7dea-dd44-cfd8ab7b83d5	8230	Mokronog
00050000-55bf-7dea-171c-03ad6cebd0a9	1251	Moravče
00050000-55bf-7dea-fe0b-3ff2144c602d	9226	Moravske Toplice
00050000-55bf-7dea-1b93-1c405ff672ad	5216	Most na Soči
00050000-55bf-7dea-6eeb-cbaec7256922	1221	Motnik
00050000-55bf-7dea-1d9e-9f91119e40f3	3330	Mozirje
00050000-55bf-7dea-ed43-a8b3b5faca46	9000	Murska Sobota 
00050000-55bf-7dea-4c49-80705972babc	9001	Murska Sobota - poštni predali
00050000-55bf-7dea-ff1c-409baba675ec	2366	Muta
00050000-55bf-7dea-98bd-398aff62665d	4202	Naklo
00050000-55bf-7dea-f420-4908c34a571e	3331	Nazarje
00050000-55bf-7dea-b683-b387d6f337ed	1357	Notranje Gorice
00050000-55bf-7dea-6ab9-7eb4909fb50d	3203	Nova Cerkev
00050000-55bf-7dea-1e8c-f4f86f067b5a	5000	Nova Gorica 
00050000-55bf-7dea-9375-fe0af264133a	5001	Nova Gorica - poštni predali
00050000-55bf-7dea-1e5d-49ff4c2d1f02	1385	Nova vas
00050000-55bf-7dea-dc15-497fdbfdfc18	8000	Novo mesto
00050000-55bf-7dea-6c24-f29fddba0b9c	8001	Novo mesto - poštni predali
00050000-55bf-7dea-94ec-1ebd84339208	6243	Obrov
00050000-55bf-7dea-f4d2-c20f97553962	9233	Odranci
00050000-55bf-7dea-b236-4bc54630617e	2317	Oplotnica
00050000-55bf-7dea-3b83-3db17e6b409a	2312	Orehova vas
00050000-55bf-7dea-c487-4074bb1b55ae	2270	Ormož
00050000-55bf-7dea-0e07-72feff31ee7a	1316	Ortnek
00050000-55bf-7dea-8d28-a0789809b3ea	1337	Osilnica
00050000-55bf-7dea-5cdc-ad262159d50c	8222	Otočec
00050000-55bf-7dea-5eb5-e050b17c584a	2361	Ožbalt
00050000-55bf-7dea-9977-f17a458246d3	2231	Pernica
00050000-55bf-7dea-abc9-4fcdba4a742f	2211	Pesnica pri Mariboru
00050000-55bf-7dea-d1c5-a21ecabf82f3	9203	Petrovci
00050000-55bf-7dea-3132-dbb3fbd9fb18	3301	Petrovče
00050000-55bf-7dea-9695-4f47dade5b57	6330	Piran/Pirano
00050000-55bf-7dea-2a6f-eebecb0aa71d	8255	Pišece
00050000-55bf-7dea-f276-fe7a5f5fabac	6257	Pivka
00050000-55bf-7dea-d734-ad0df4dcd75c	6232	Planina
00050000-55bf-7dea-f040-92854de9312b	3225	Planina pri Sevnici
00050000-55bf-7dea-2008-cc9b82a75bf8	6276	Pobegi
00050000-55bf-7dea-06bb-7e8e9e75b65d	8312	Podbočje
00050000-55bf-7dea-3082-a02a43c5e757	5243	Podbrdo
00050000-55bf-7dea-c6c5-f3adfaa7b57d	3254	Podčetrtek
00050000-55bf-7dea-40c9-a90d943572c5	2273	Podgorci
00050000-55bf-7dea-c5e7-5a8c135b092a	6216	Podgorje
00050000-55bf-7dea-8a39-27e7d5b545c4	2381	Podgorje pri Slovenj Gradcu
00050000-55bf-7dea-dc49-f5bef28c0e39	6244	Podgrad
00050000-55bf-7dea-db28-1001f8169815	1414	Podkum
00050000-55bf-7dea-811b-a3a6f73c6030	2286	Podlehnik
00050000-55bf-7dea-7fc3-55f356e68d19	5272	Podnanos
00050000-55bf-7dea-901d-18bd03e694d1	4244	Podnart
00050000-55bf-7dea-8cae-5c763c63dbd5	3241	Podplat
00050000-55bf-7dea-4aaa-ed1b524d13d4	3257	Podsreda
00050000-55bf-7dea-ab3a-b8524d95f9da	2363	Podvelka
00050000-55bf-7dea-f89f-2a5e48b701e2	2208	Pohorje
00050000-55bf-7dea-2153-d0f926604e53	2257	Polenšak
00050000-55bf-7dea-22dc-c6ed18afc9ab	1355	Polhov Gradec
00050000-55bf-7dea-30ff-a8139f1a721d	4223	Poljane nad Škofjo Loko
00050000-55bf-7dea-a1e5-2b022d2a21af	2319	Poljčane
00050000-55bf-7dea-3b00-d7d5577020bd	1272	Polšnik
00050000-55bf-7dea-fee1-9f9052e26601	3313	Polzela
00050000-55bf-7dea-dba7-dfb50c30fd94	3232	Ponikva
00050000-55bf-7dea-a53e-2ee3a2b510c0	6320	Portorož/Portorose
00050000-55bf-7dea-9aad-ce62bcdfdc63	6230	Postojna
00050000-55bf-7dea-96c6-f1a7723ec9d1	2331	Pragersko
00050000-55bf-7dea-3905-339192258935	3312	Prebold
00050000-55bf-7dea-66ce-ab1c18ba17df	4205	Preddvor
00050000-55bf-7dea-4cf5-90b5ebe84760	6255	Prem
00050000-55bf-7dea-7464-1443ace6eec4	1352	Preserje
00050000-55bf-7dea-0555-e0afab49360b	6258	Prestranek
00050000-55bf-7dea-40c5-b1ead7cc114a	2391	Prevalje
00050000-55bf-7dea-c6f6-11774c773718	3262	Prevorje
00050000-55bf-7dea-60d4-9965a0f21299	1276	Primskovo 
00050000-55bf-7dea-0a90-1d502dba2dab	3253	Pristava pri Mestinju
00050000-55bf-7dea-0194-5dc291155c81	9207	Prosenjakovci/Partosfalva
00050000-55bf-7dea-545a-d10239454b79	5297	Prvačina
00050000-55bf-7dea-4d27-fc0e03b2a9c6	2250	Ptuj
00050000-55bf-7dea-bcd3-e8f29ec169f5	2323	Ptujska Gora
00050000-55bf-7dea-d1b1-7392ecd048cf	9201	Puconci
00050000-55bf-7dea-6609-1e0b9e844fbb	2327	Rače
00050000-55bf-7dea-0a37-9cccf3a19025	1433	Radeče
00050000-55bf-7dea-a1a4-6fb9fc0cc6c0	9252	Radenci
00050000-55bf-7dea-2722-6ff881ab8331	2360	Radlje ob Dravi
00050000-55bf-7dea-3b02-5c185e394632	1235	Radomlje
00050000-55bf-7dea-5892-4c28a76f004b	4240	Radovljica
00050000-55bf-7dea-d197-6a1012c8ed74	8274	Raka
00050000-55bf-7dea-a363-33ad64003c1e	1381	Rakek
00050000-55bf-7dea-e510-445c2aaa30ed	4283	Rateče - Planica
00050000-55bf-7dea-e827-3d983830098a	2390	Ravne na Koroškem
00050000-55bf-7dea-f69c-c86f5ba6e67f	9246	Razkrižje
00050000-55bf-7dea-816b-66b76b52e775	3332	Rečica ob Savinji
00050000-55bf-7dea-111b-a4e5e98fe52b	5292	Renče
00050000-55bf-7dea-513b-7ead7b87872b	1310	Ribnica
00050000-55bf-7dea-726b-c1dd20a34bbc	2364	Ribnica na Pohorju
00050000-55bf-7dea-1691-f2884c7dcac2	3272	Rimske Toplice
00050000-55bf-7dea-9589-ad8c61b17de3	1314	Rob
00050000-55bf-7dea-d736-28a7b0346163	5215	Ročinj
00050000-55bf-7dea-8611-82b625d452e4	3250	Rogaška Slatina
00050000-55bf-7dea-6a09-22b74f0e1917	9262	Rogašovci
00050000-55bf-7dea-acd2-cd9d759c0eb7	3252	Rogatec
00050000-55bf-7dea-e941-684e2659015f	1373	Rovte
00050000-55bf-7dea-41cd-56a80f4c6766	2342	Ruše
00050000-55bf-7dea-1287-6895fb48e187	1282	Sava
00050000-55bf-7dea-7798-e2074ea70948	6333	Sečovlje/Sicciole
00050000-55bf-7dea-3305-b89caa0a458a	4227	Selca
00050000-55bf-7dea-5dae-e236b56922ef	2352	Selnica ob Dravi
00050000-55bf-7dea-94ab-de1406c36ff7	8333	Semič
00050000-55bf-7dea-8bfb-1120c098fcb4	8281	Senovo
00050000-55bf-7dea-3eeb-36d6f7a9fe9a	6224	Senožeče
00050000-55bf-7dea-6cf3-4a6f1e9bb234	8290	Sevnica
00050000-55bf-7dea-473b-5ccff68381bf	6210	Sežana
00050000-55bf-7dea-2c55-824c7caa3850	2214	Sladki Vrh
00050000-55bf-7dea-763a-4b7401654ebf	5283	Slap ob Idrijci
00050000-55bf-7dea-0346-ba42dca70204	2380	Slovenj Gradec
00050000-55bf-7dea-5c2d-29fdfddf12bc	2310	Slovenska Bistrica
00050000-55bf-7dea-37aa-330af883dd6e	3210	Slovenske Konjice
00050000-55bf-7dea-4028-107a351fb892	1216	Smlednik
00050000-55bf-7dea-d3a7-7d4289d8e23d	5232	Soča
00050000-55bf-7dea-5cb9-d6746638f199	1317	Sodražica
00050000-55bf-7dea-a8e9-9f4db0f933d4	3335	Solčava
00050000-55bf-7dea-7191-b5652edf46c5	5250	Solkan
00050000-55bf-7dea-8d07-6cb4ef2cd155	4229	Sorica
00050000-55bf-7dea-7c6b-a6453015272d	4225	Sovodenj
00050000-55bf-7dea-a69e-36bad902edd1	5281	Spodnja Idrija
00050000-55bf-7dea-4cf5-f1b6ed0d2764	2241	Spodnji Duplek
00050000-55bf-7dea-283b-df138c52a82f	9245	Spodnji Ivanjci
00050000-55bf-7dea-c45e-e14b8fb0814c	2277	Središče ob Dravi
00050000-55bf-7dea-9110-45f0b3a7aafe	4267	Srednja vas v Bohinju
00050000-55bf-7dea-ea79-75a055cce9a1	8256	Sromlje 
00050000-55bf-7dea-b93d-a1078dc9ac0e	5224	Srpenica
00050000-55bf-7dea-1b2b-1b2b70265c0e	1242	Stahovica
00050000-55bf-7dea-b99a-5762cfa0ba51	1332	Stara Cerkev
00050000-55bf-7dea-30ef-48e9176f789b	8342	Stari trg ob Kolpi
00050000-55bf-7dea-759d-ecbcc7d407cc	1386	Stari trg pri Ložu
00050000-55bf-7dea-dd4b-3d7f9507a441	2205	Starše
00050000-55bf-7dea-7681-1fd254bc4b36	2289	Stoperce
00050000-55bf-7dea-3940-69cb03684659	8322	Stopiče
00050000-55bf-7dea-e91f-dc946c8c55df	3206	Stranice
00050000-55bf-7dea-4fd6-14f93afa72d0	8351	Straža
00050000-55bf-7dea-004e-cdd43dc3cbf5	1313	Struge
00050000-55bf-7dea-c7a6-fd4a9cafff6b	8293	Studenec
00050000-55bf-7dea-fce2-cbf3f01e5b27	8331	Suhor
00050000-55bf-7dea-9113-551e79454153	2233	Sv. Ana v Slovenskih goricah
00050000-55bf-7dea-a6ba-b287237328b4	2235	Sv. Trojica v Slovenskih goricah
00050000-55bf-7dea-435e-4e8c057b894c	2353	Sveti Duh na Ostrem Vrhu
00050000-55bf-7dea-4d08-23944140fe72	9244	Sveti Jurij ob Ščavnici
00050000-55bf-7dea-538a-f42eb9a8de17	3264	Sveti Štefan
00050000-55bf-7dea-504e-6222823dd37d	2258	Sveti Tomaž
00050000-55bf-7dea-909b-878ccef1d806	9204	Šalovci
00050000-55bf-7dea-b48b-86dc1c5a14bb	5261	Šempas
00050000-55bf-7dea-3fd2-1459f9db3f2f	5290	Šempeter pri Gorici
00050000-55bf-7dea-efbb-5b124821d420	3311	Šempeter v Savinjski dolini
00050000-55bf-7dea-e131-510af311c71e	4208	Šenčur
00050000-55bf-7dea-04e4-fc665963e84b	2212	Šentilj v Slovenskih goricah
00050000-55bf-7dea-1e1c-8aed38d1bde5	8297	Šentjanž
00050000-55bf-7dea-2d98-47dd84de2bfd	2373	Šentjanž pri Dravogradu
00050000-55bf-7dea-d053-7e4f83e1d4c2	8310	Šentjernej
00050000-55bf-7dea-c9d2-4664bc813c94	3230	Šentjur
00050000-55bf-7dea-1dab-81ba12520854	3271	Šentrupert
00050000-55bf-7dea-6408-8908173c035f	8232	Šentrupert
00050000-55bf-7dea-9d55-a0e9bb30478c	1296	Šentvid pri Stični
00050000-55bf-7dea-2c90-034af5a887f5	8275	Škocjan
00050000-55bf-7dea-02dd-6bf966bee376	6281	Škofije
00050000-55bf-7dea-ecb1-43b0a31be891	4220	Škofja Loka
00050000-55bf-7dea-c370-96aacb355330	3211	Škofja vas
00050000-55bf-7dea-37c7-f4c3d5947792	1291	Škofljica
00050000-55bf-7dea-1f29-5ea78cfa09ef	6274	Šmarje
00050000-55bf-7dea-0faa-99c3541d26eb	1293	Šmarje - Sap
00050000-55bf-7dea-1e7f-054bc7057b3c	3240	Šmarje pri Jelšah
00050000-55bf-7dea-30ce-614f1d1555ec	8220	Šmarješke Toplice
00050000-55bf-7dea-a78c-cd06b305915e	2315	Šmartno na Pohorju
00050000-55bf-7dea-1a9e-a76c4f84a2dc	3341	Šmartno ob Dreti
00050000-55bf-7dea-9853-3eb0f3d7c961	3327	Šmartno ob Paki
00050000-55bf-7dea-5ba0-31757cc53c0f	1275	Šmartno pri Litiji
00050000-55bf-7dea-2c4d-98b01ed0a620	2383	Šmartno pri Slovenj Gradcu
00050000-55bf-7dea-5728-75adf8c97f53	3201	Šmartno v Rožni dolini
00050000-55bf-7dea-a495-456652454dab	3325	Šoštanj
00050000-55bf-7dea-5a6d-469e6a3b6495	6222	Štanjel
00050000-55bf-7dea-5784-182681de5e85	3220	Štore
00050000-55bf-7dea-e6e3-ef0c3af24cec	3304	Tabor
00050000-55bf-7dea-4c12-077d27e090c4	3221	Teharje
00050000-55bf-7dea-dd67-8ff56551235a	9251	Tišina
00050000-55bf-7dea-0dd2-5ed9ba27b8f2	5220	Tolmin
00050000-55bf-7dea-f45e-0679c575e8f6	3326	Topolšica
00050000-55bf-7dea-d562-70294b0f7425	2371	Trbonje
00050000-55bf-7dea-394f-4e475595edad	1420	Trbovlje
00050000-55bf-7dea-ce85-c9874041a1a3	8231	Trebelno 
00050000-55bf-7dea-050f-29ee524e9fbd	8210	Trebnje
00050000-55bf-7dea-ea39-3d223db2709f	5252	Trnovo pri Gorici
00050000-55bf-7dea-9860-8bcd606759de	2254	Trnovska vas
00050000-55bf-7dea-7877-a8ec0b82afa9	1222	Trojane
00050000-55bf-7dea-411a-03a2ba8e70b0	1236	Trzin
00050000-55bf-7dea-7ffd-6e74ec3ee600	4290	Tržič
00050000-55bf-7dea-5b39-19c16c95d1c5	8295	Tržišče
00050000-55bf-7dea-1356-1200a368e41b	1311	Turjak
00050000-55bf-7dea-8850-646d47b4e510	9224	Turnišče
00050000-55bf-7dea-57a4-fd61a942a486	8323	Uršna sela
00050000-55bf-7dea-4312-8f09de018185	1252	Vače
00050000-55bf-7dea-325e-bd4051257caf	3320	Velenje 
00050000-55bf-7dea-8598-f20a720f6481	3322	Velenje - poštni predali
00050000-55bf-7dea-fad6-ce1a34ae223f	8212	Velika Loka
00050000-55bf-7dea-11d7-afc7f42795be	2274	Velika Nedelja
00050000-55bf-7dea-bd10-d1d5f08db76c	9225	Velika Polana
00050000-55bf-7dea-7e96-e61b70313b33	1315	Velike Lašče
00050000-55bf-7dea-2930-1f6ae3250fec	8213	Veliki Gaber
00050000-55bf-7dea-d405-5f8c62fe909b	9241	Veržej
00050000-55bf-7dea-d7a4-daba197c7e7e	1312	Videm - Dobrepolje
00050000-55bf-7dea-b7f3-860556e72976	2284	Videm pri Ptuju
00050000-55bf-7dea-a588-12b39cc045e9	8344	Vinica
00050000-55bf-7dea-ad7d-68ab644b8753	5271	Vipava
00050000-55bf-7dea-2be1-a4563b6113f9	4212	Visoko
00050000-55bf-7dea-262e-34831e59ee2b	1294	Višnja Gora
00050000-55bf-7dea-b7e0-bb836e972e31	3205	Vitanje
00050000-55bf-7dea-1f4d-445f5dd90136	2255	Vitomarci
00050000-55bf-7dea-bdae-70ff84942bf2	1217	Vodice
00050000-55bf-7dea-9984-58a26d48c161	3212	Vojnik\t
00050000-55bf-7dea-cc35-957011d0497f	5293	Volčja Draga
00050000-55bf-7dea-b126-a8bf1d4ed2ae	2232	Voličina
00050000-55bf-7dea-e4e6-6c17d6b55804	3305	Vransko
00050000-55bf-7dea-a512-aceb66e0eeb5	6217	Vremski Britof
00050000-55bf-7dea-f80d-296629d2eaaf	1360	Vrhnika
00050000-55bf-7dea-6b70-f4f353b4842e	2365	Vuhred
00050000-55bf-7dea-0119-13baf674aa88	2367	Vuzenica
00050000-55bf-7dea-b893-eac30adc83b0	8292	Zabukovje 
00050000-55bf-7dea-a66d-47dcfca6738c	1410	Zagorje ob Savi
00050000-55bf-7dea-4950-1b55d8c2e812	1303	Zagradec
00050000-55bf-7dea-dac9-25cf4ada6ec3	2283	Zavrč
00050000-55bf-7dea-ad96-65c60c45c2b5	8272	Zdole 
00050000-55bf-7dea-dae1-0577ba3037ef	4201	Zgornja Besnica
00050000-55bf-7dea-dad7-e132fce766df	2242	Zgornja Korena
00050000-55bf-7dea-bc38-fae651bd60b4	2201	Zgornja Kungota
00050000-55bf-7dea-e21d-cf71b7a6c592	2316	Zgornja Ložnica
00050000-55bf-7dea-beb6-62de5039f980	2314	Zgornja Polskava
00050000-55bf-7dea-9589-465eeb9199ed	2213	Zgornja Velka
00050000-55bf-7dea-07f8-273768bdb9f1	4247	Zgornje Gorje
00050000-55bf-7dea-dc53-f0752f35a070	4206	Zgornje Jezersko
00050000-55bf-7dea-0fe9-e933a071c6a1	2285	Zgornji Leskovec
00050000-55bf-7dea-e9d4-058c86a1bb8e	1432	Zidani Most
00050000-55bf-7dea-9e30-bc377c656ea0	3214	Zreče
00050000-55bf-7dea-e8b8-63c3fc4dfe4e	4209	Žabnica
00050000-55bf-7dea-25c9-75e643b0dd9b	3310	Žalec
00050000-55bf-7dea-6586-36adfc964261	4228	Železniki
00050000-55bf-7dea-69b7-5f5f64166481	2287	Žetale
00050000-55bf-7dea-b976-ec36db870e17	4226	Žiri
00050000-55bf-7dea-559c-45944517b0ea	4274	Žirovnica
00050000-55bf-7dea-df3f-bd3d2b08e2b0	8360	Žužemberk
\.


--
-- TOC entry 2992 (class 0 OID 11630138)
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
-- TOC entry 2974 (class 0 OID 11629949)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11630027)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11630150)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11630454)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11630464)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55bf-7deb-a1fc-a7658aa4c1ce	00080000-55bf-7deb-975a-7195af56f8e8	0900	AK
00190000-55bf-7deb-9ce8-7dc64bf349ef	00080000-55bf-7dea-143f-d86f3833d0b5	0987	AK
00190000-55bf-7deb-e410-be7642468078	00080000-55bf-7dea-c8e6-8b0102c15feb	0989	AK
00190000-55bf-7deb-2ad3-b919b5431706	00080000-55bf-7dea-67a4-7380943fac10	0986	AK
00190000-55bf-7deb-edd4-90bb5e231615	00080000-55bf-7dea-f2ac-828b4ba0506c	0984	AK
00190000-55bf-7deb-51b0-98a758019338	00080000-55bf-7dea-c36f-4e9b2a7cd985	0983	AK
00190000-55bf-7deb-d268-6ca8e0549795	00080000-55bf-7dea-41e0-d01070bb73c9	0982	AK
\.


--
-- TOC entry 3016 (class 0 OID 11630435)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55bf-7deb-4032-2ab00766a09a	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3019 (class 0 OID 11630472)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11630179)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55bf-7dea-336c-9c144ec66c1c	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55bf-7dea-bb4b-113e3ae0b364	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55bf-7dea-280a-ea40af1bb1ac	0003	Kazinska	t	84	Kazinska dvorana
00220000-55bf-7dea-c4df-1be089b56a05	0004	Mali oder	t	24	Mali oder 
00220000-55bf-7dea-9043-c420b8574900	0005	Komorni oder	t	15	Komorni oder
00220000-55bf-7dea-79bb-1e4312ef7a09	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55bf-7dea-c1a4-ae007332cb84	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2990 (class 0 OID 11630123)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11630113)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11630298)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11630247)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 11629821)
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
-- TOC entry 2999 (class 0 OID 11630189)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 11629859)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55bf-7de9-4349-e10539f48359	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55bf-7de9-3914-401c2b5b60b4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55bf-7de9-a005-3c6e097a0a28	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55bf-7de9-6468-1682e83833b4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55bf-7de9-e5f3-7cf27e392b86	planer	Planer dogodkov v koledarju	t
00020000-55bf-7de9-9926-1b9e2c31798d	kadrovska	Kadrovska služba	t
00020000-55bf-7de9-37f7-58e1c0a9c7f6	arhivar	Ažuriranje arhivalij	t
00020000-55bf-7de9-91eb-6f0a77ee5381	igralec	Igralec	t
00020000-55bf-7de9-d325-3a35fa9dd455	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55bf-7deb-d7ab-1a7d036e8397	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2965 (class 0 OID 11629843)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55bf-7de9-2d53-bded04176ef8	00020000-55bf-7de9-a005-3c6e097a0a28
00010000-55bf-7de9-0811-c567a5cba8c2	00020000-55bf-7de9-a005-3c6e097a0a28
00010000-55bf-7deb-756e-25af0c3539b5	00020000-55bf-7deb-d7ab-1a7d036e8397
\.


--
-- TOC entry 3001 (class 0 OID 11630203)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11630144)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11630094)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11630513)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55bf-7dea-d37d-d5cd2ff3ffd7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55bf-7dea-0893-70cdfc3c9d5b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55bf-7dea-861c-865a73d76d3d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55bf-7dea-5291-eeb6af5a4270	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55bf-7dea-ad8c-ee84b8e27448	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3023 (class 0 OID 11630505)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55bf-7dea-1521-fc0e2d8b9269	00230000-55bf-7dea-5291-eeb6af5a4270	popa
00240000-55bf-7dea-e984-bc9e6c866b56	00230000-55bf-7dea-5291-eeb6af5a4270	oseba
00240000-55bf-7dea-eee6-72c8bc42f5bc	00230000-55bf-7dea-0893-70cdfc3c9d5b	prostor
00240000-55bf-7dea-5cea-8ff45d965690	00230000-55bf-7dea-5291-eeb6af5a4270	besedilo
00240000-55bf-7dea-10e5-036539190f6f	00230000-55bf-7dea-5291-eeb6af5a4270	uprizoritev
00240000-55bf-7dea-d3a4-b800c8262d43	00230000-55bf-7dea-5291-eeb6af5a4270	funkcija
00240000-55bf-7dea-9f1e-1c69784d156e	00230000-55bf-7dea-5291-eeb6af5a4270	tipfunkcije
00240000-55bf-7dea-5f54-9e0465e0a1e4	00230000-55bf-7dea-5291-eeb6af5a4270	alternacija
00240000-55bf-7dea-a2d7-0d630fa93680	00230000-55bf-7dea-d37d-d5cd2ff3ffd7	pogodba
00240000-55bf-7dea-0fc9-14ddd0ba96a2	00230000-55bf-7dea-5291-eeb6af5a4270	zaposlitev
00240000-55bf-7dea-2dc2-9f49759b5cb1	00230000-55bf-7dea-d37d-d5cd2ff3ffd7	programdela
00240000-55bf-7dea-8d9b-be00caee8142	00230000-55bf-7dea-5291-eeb6af5a4270	zapis
\.


--
-- TOC entry 3022 (class 0 OID 11630500)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11630257)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55bf-7deb-cccf-2567be886034	000e0000-55bf-7deb-067d-e7b511250167	00080000-55bf-7dea-d387-7d946726e308	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55bf-7deb-9de6-7da6c2605b23	000e0000-55bf-7deb-067d-e7b511250167	00080000-55bf-7dea-d387-7d946726e308	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55bf-7deb-b907-5b4304a94132	000e0000-55bf-7deb-067d-e7b511250167	00080000-55bf-7dea-dfc4-84310b121090	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55bf-7deb-43df-35e7e6259358	000e0000-55bf-7deb-067d-e7b511250167	00080000-55bf-7dea-dfc4-84310b121090	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2972 (class 0 OID 11629921)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 11630100)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55bf-7deb-3a95-cb05db2d51df	00180000-55bf-7deb-8975-afea5e0d37aa	000c0000-55bf-7deb-b3b7-43d117156a33	00090000-55bf-7deb-6e10-dd1e79ee51cf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-7deb-dae5-feac57b35022	00180000-55bf-7deb-8975-afea5e0d37aa	000c0000-55bf-7deb-36ba-de24763a6a5a	00090000-55bf-7deb-b9f1-64ec5d163725	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-7deb-e75b-e0e14061a898	00180000-55bf-7deb-8975-afea5e0d37aa	000c0000-55bf-7deb-9f53-426dd4f06463	00090000-55bf-7deb-f63d-376f3f9c37be	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-7deb-e145-c94f131d67df	00180000-55bf-7deb-8975-afea5e0d37aa	000c0000-55bf-7deb-2bfa-9b384fe46a2b	00090000-55bf-7deb-adfe-7e1ccbdfb9fd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-7deb-196d-09fd4cd2c0d5	00180000-55bf-7deb-8975-afea5e0d37aa	000c0000-55bf-7deb-e264-12c0492da7ca	00090000-55bf-7deb-58c1-b55cfd6aad27	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-7deb-1a1e-211fab10bb6b	00180000-55bf-7deb-2aac-2903ea223eb4	\N	00090000-55bf-7deb-58c1-b55cfd6aad27	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3008 (class 0 OID 11630287)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55bf-7dea-577c-55c1eb754000	Avtor	Avtorji	Avtorka	umetnik
000f0000-55bf-7dea-54f8-dbeee7fc43ac	Priredba	Priredba	Priredba	umetnik
000f0000-55bf-7dea-285d-e9e12cafd3ca	Prevod	Prevod	Prevod	umetnik
000f0000-55bf-7dea-1dcc-465e3eee745b	Režija	Režija	Režija	umetnik
000f0000-55bf-7dea-2ec8-0528f3521fd3	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55bf-7dea-ec44-d2be09ed15c4	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55bf-7dea-a40f-eb0886f172b3	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55bf-7dea-963d-8f1fc22b737e	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55bf-7dea-0747-79b91d51fa82	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55bf-7dea-0214-ff45d09f5209	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55bf-7dea-cab8-cc4c578f790f	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55bf-7dea-8029-1d1a89071f6d	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55bf-7dea-af11-3479e20dd6af	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55bf-7dea-8410-f15582f19990	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55bf-7dea-5423-2b3458dedcd0	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55bf-7dea-c5d4-5d142866c0c5	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55bf-7dea-14dc-65aab8c7ba22	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55bf-7dea-d2c0-d9dd2ce3610f	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3020 (class 0 OID 11630482)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55bf-7dea-25dc-bb02ad85aefe	01	Velika predstava	f	1.00	1.00
002b0000-55bf-7dea-74da-feb3c58de035	02	Mala predstava	f	0.50	0.50
002b0000-55bf-7dea-8809-0748d1bdc3fe	03	Mala koprodukcija	t	0.40	1.00
002b0000-55bf-7dea-f681-a5725ace569d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55bf-7dea-cc07-d74637b91586	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2977 (class 0 OID 11629984)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11629830)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55bf-7de9-0811-c567a5cba8c2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROSC9DYtZ3MunNGdvtSZCwn1mCqqGz00K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-97d1-e1bd8ce1577c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-dfdf-93fd71645433	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-7e7a-9ec3cb3e57c7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-90de-a719dd06bac6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-6165-06232a979ef1	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-067e-ef11c7f2d7a0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-0f98-adc5b2045c1c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-375b-544bfb64551d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-40e6-e5bb87464cd7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55bf-7deb-756e-25af0c3539b5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55bf-7de9-2d53-bded04176ef8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3012 (class 0 OID 11630335)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55bf-7deb-157d-ac30bb85dfa4	00160000-55bf-7dea-0814-854138fe38d0	00150000-55bf-7dea-6cc0-2044f269a4ac	00140000-55bf-7de9-6cfe-55588b0d2461	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55bf-7dea-9043-c420b8574900
000e0000-55bf-7deb-067d-e7b511250167	00160000-55bf-7dea-6785-65932061b86a	00150000-55bf-7dea-ab01-0817cf2fc0ce	00140000-55bf-7de9-daa6-31c67c189212	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55bf-7dea-79bb-1e4312ef7a09
000e0000-55bf-7deb-15f4-afcda01243af	\N	00150000-55bf-7dea-ab01-0817cf2fc0ce	00140000-55bf-7de9-daa6-31c67c189212	00190000-55bf-7deb-9ce8-7dc64bf349ef	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55bf-7dea-9043-c420b8574900
000e0000-55bf-7deb-f61e-d732043028e4	\N	00150000-55bf-7dea-ab01-0817cf2fc0ce	00140000-55bf-7de9-daa6-31c67c189212	00190000-55bf-7deb-9ce8-7dc64bf349ef	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55bf-7dea-9043-c420b8574900
000e0000-55bf-7deb-201b-cbf3864a624a	\N	00150000-55bf-7dea-ab01-0817cf2fc0ce	00140000-55bf-7de9-daa6-31c67c189212	00190000-55bf-7deb-9ce8-7dc64bf349ef	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55bf-7dea-336c-9c144ec66c1c
\.


--
-- TOC entry 2982 (class 0 OID 11630046)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55bf-7deb-4aa1-900baae45fd4	000e0000-55bf-7deb-067d-e7b511250167	1	
00200000-55bf-7deb-cd71-0e83d8cffd96	000e0000-55bf-7deb-067d-e7b511250167	2	
\.


--
-- TOC entry 2997 (class 0 OID 11630171)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11630552)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11630524)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11630564)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11630240)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55bf-7deb-0b84-b592b261e3d8	00090000-55bf-7deb-b9f1-64ec5d163725	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-7deb-5cff-3540fffb1679	00090000-55bf-7deb-f63d-376f3f9c37be	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-7deb-8009-7f094212ed2e	00090000-55bf-7deb-59da-3c1283a013eb	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-7deb-21f4-7b40af37eaf2	00090000-55bf-7deb-31e6-f2813921aeb3	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-7deb-3aad-5d63b2a4b935	00090000-55bf-7deb-6e10-dd1e79ee51cf	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-7deb-fcb6-64da49d2e104	00090000-55bf-7deb-9c65-29a32bef8558	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2984 (class 0 OID 11630078)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11630325)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55bf-7de9-6cfe-55588b0d2461	01	Drama	drama (SURS 01)
00140000-55bf-7de9-e75b-04e3410824e0	02	Opera	opera (SURS 02)
00140000-55bf-7de9-ed3c-f4ee25d4c676	03	Balet	balet (SURS 03)
00140000-55bf-7de9-0c88-cb972defb6d5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55bf-7de9-65c1-dfb02c0b07bc	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55bf-7de9-daa6-31c67c189212	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55bf-7de9-4388-14fdef925a26	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3003 (class 0 OID 11630230)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55bf-7dea-83ac-dca7ce4ee97b	01	Opera	opera
00150000-55bf-7dea-0471-8babbca2385a	02	Opereta	opereta
00150000-55bf-7dea-e464-f70cf3ae4928	03	Balet	balet
00150000-55bf-7dea-9fa9-3ce881f67cc8	04	Plesne prireditve	plesne prireditve
00150000-55bf-7dea-934e-53e0baf215d1	05	Lutkovno gledališče	lutkovno gledališče
00150000-55bf-7dea-9e97-b8995b94dc3e	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55bf-7dea-f5d9-137c314b7c92	07	Biografska drama	biografska drama
00150000-55bf-7dea-6cc0-2044f269a4ac	08	Komedija	komedija
00150000-55bf-7dea-9052-0c21834ded24	09	Črna komedija	črna komedija
00150000-55bf-7dea-54aa-2764aceb9422	10	E-igra	E-igra
00150000-55bf-7dea-ab01-0817cf2fc0ce	11	Kriminalka	kriminalka
00150000-55bf-7dea-4d08-5dba51978533	12	Musical	musical
\.


--
-- TOC entry 2509 (class 2606 OID 11629884)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 11630382)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11630372)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11630286)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 11630605)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 11630068)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11630093)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11630498)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 11630010)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 11630429)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11630226)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 11630044)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 11630087)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 11630024)
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
-- TOC entry 2601 (class 2606 OID 11630136)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 11630581)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11630588)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 11630613)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 11630163)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 11629982)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 11629893)
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
-- TOC entry 2516 (class 2606 OID 11629917)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 11629873)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2500 (class 2606 OID 11629858)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 11630169)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11630202)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 11630320)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11629946)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 11629970)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11630142)
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
-- TOC entry 2531 (class 2606 OID 11629960)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11630031)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11630154)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11630461)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 11630469)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 11630452)
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
-- TOC entry 2707 (class 2606 OID 11630480)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11630186)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 11630127)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 11630118)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11630308)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 11630254)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11629829)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11630193)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 11629847)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2502 (class 2606 OID 11629867)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11630211)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11630149)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 11630099)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 11630522)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 11630510)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 11630504)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11630267)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 11629926)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 11630109)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11630297)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11630492)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11629995)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 11629842)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11630351)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11630053)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11630177)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 11630562)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 11630546)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 11630570)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 11630245)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11630082)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 11630333)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 11630238)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 11630075)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2649 (class 1259 OID 11630268)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 11630269)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 11630583)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 11630582)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2523 (class 1259 OID 11629948)
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
-- TOC entry 2614 (class 1259 OID 11630170)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 11630550)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 11630549)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 11630551)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 11630548)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 11630547)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 11630156)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 11630155)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 11630054)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 11630227)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 11630229)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 11630228)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2548 (class 1259 OID 11630026)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 11630025)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 11630481)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2659 (class 1259 OID 11630322)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 11630323)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2661 (class 1259 OID 11630324)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 11630571)
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
-- TOC entry 2668 (class 1259 OID 11630356)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2669 (class 1259 OID 11630353)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2670 (class 1259 OID 11630357)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2671 (class 1259 OID 11630355)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2672 (class 1259 OID 11630354)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2538 (class 1259 OID 11629997)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 11629996)
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
-- TOC entry 2514 (class 1259 OID 11629920)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 11630194)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2578 (class 1259 OID 11630088)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 11629874)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2505 (class 1259 OID 11629875)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 11630214)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 11630213)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 11630212)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2552 (class 1259 OID 11630032)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 11630034)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2554 (class 1259 OID 11630033)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2715 (class 1259 OID 11630512)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 11630122)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 11630120)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 11630119)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 11630121)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2495 (class 1259 OID 11629848)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 11629849)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 11630178)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 11630606)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2746 (class 1259 OID 11630614)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 11630615)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 11630143)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 11630255)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 11630256)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 11630434)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2690 (class 1259 OID 11630433)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2691 (class 1259 OID 11630430)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 11630431)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2693 (class 1259 OID 11630432)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 11629962)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2528 (class 1259 OID 11629961)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2529 (class 1259 OID 11629963)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2488 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 11630462)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2698 (class 1259 OID 11630463)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2682 (class 1259 OID 11630386)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2683 (class 1259 OID 11630387)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2684 (class 1259 OID 11630384)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2685 (class 1259 OID 11630385)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 11630246)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 11630131)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 11630130)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 11630128)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 11630129)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2466 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2678 (class 1259 OID 11630374)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 11630373)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2694 (class 1259 OID 11630453)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2559 (class 1259 OID 11630045)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2712 (class 1259 OID 11630499)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 11630589)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 11630590)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2510 (class 1259 OID 11629895)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2511 (class 1259 OID 11629894)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2519 (class 1259 OID 11629927)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 11629928)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2583 (class 1259 OID 11630112)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 11630111)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 11630110)
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
-- TOC entry 2566 (class 1259 OID 11630077)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 11630073)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2568 (class 1259 OID 11630070)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 11630071)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 11630069)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 11630074)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2572 (class 1259 OID 11630072)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 11629947)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11630011)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11630013)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2546 (class 1259 OID 11630012)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2547 (class 1259 OID 11630014)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 11630137)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 11630321)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 11630352)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 11629918)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 11629919)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 11630239)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 11630523)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 11629983)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2718 (class 1259 OID 11630511)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2622 (class 1259 OID 11630188)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 11630187)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 11630383)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 11629971)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 11630334)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 11630563)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2703 (class 1259 OID 11630470)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 11630471)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 11629868)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 11630076)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2775 (class 2606 OID 11630751)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2778 (class 2606 OID 11630736)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 11630741)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 11630761)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 11630731)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2774 (class 2606 OID 11630756)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 11630746)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 11630906)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 11630911)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 11631081)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 11631076)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 11630666)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 11630846)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 11631061)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 11631056)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2836 (class 2606 OID 11631066)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 11631051)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2840 (class 2606 OID 11631046)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 11630841)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 11630836)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 11630726)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 11630876)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11630886)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2803 (class 2606 OID 11630881)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2766 (class 2606 OID 11630701)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11630696)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 11630826)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 11631031)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2812 (class 2606 OID 11630916)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 11630921)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 11630926)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2841 (class 2606 OID 11631071)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2814 (class 2606 OID 11630946)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2817 (class 2606 OID 11630931)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2813 (class 2606 OID 11630951)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2815 (class 2606 OID 11630941)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2816 (class 2606 OID 11630936)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2764 (class 2606 OID 11630691)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11630686)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 11630651)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 11630646)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 11630856)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 11630766)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 11630626)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2752 (class 2606 OID 11630631)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 11630871)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2800 (class 2606 OID 11630866)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 11630861)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 11630706)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 11630716)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2769 (class 2606 OID 11630711)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2835 (class 2606 OID 11631041)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 11630801)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 11630791)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 11630786)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 11630796)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 11630616)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2750 (class 2606 OID 11630621)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 11630851)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2846 (class 2606 OID 11631096)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 11631101)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 11631106)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 11630831)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2807 (class 2606 OID 11630896)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2806 (class 2606 OID 11630901)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 11631006)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 11631001)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2828 (class 2606 OID 11630986)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 11630991)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2826 (class 2606 OID 11630996)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 11630676)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11630671)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 11630681)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 11631016)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2830 (class 2606 OID 11631021)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 11630976)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 11630981)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2823 (class 2606 OID 11630966)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2822 (class 2606 OID 11630971)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2805 (class 2606 OID 11630891)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 11630821)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 11630816)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 11630806)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 11630811)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2818 (class 2606 OID 11630961)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2819 (class 2606 OID 11630956)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2829 (class 2606 OID 11631011)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2771 (class 2606 OID 11630721)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 11631026)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 11631036)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2845 (class 2606 OID 11631086)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2844 (class 2606 OID 11631091)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 11630641)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 11630636)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 11630656)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2758 (class 2606 OID 11630661)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 11630781)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 11630776)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 11630771)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-03 16:42:52 CEST

--
-- PostgreSQL database dump complete
--

