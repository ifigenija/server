--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-03 10:56:14 CEST

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
-- TOC entry 183 (class 1259 OID 11448730)
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
-- TOC entry 228 (class 1259 OID 11449229)
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
-- TOC entry 227 (class 1259 OID 11449212)
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
-- TOC entry 221 (class 1259 OID 11449124)
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
-- TOC entry 244 (class 1259 OID 11449443)
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
-- TOC entry 197 (class 1259 OID 11448909)
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
-- TOC entry 200 (class 1259 OID 11448943)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11449345)
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
-- TOC entry 192 (class 1259 OID 11448852)
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
-- TOC entry 229 (class 1259 OID 11449242)
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
-- TOC entry 216 (class 1259 OID 11449069)
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
-- TOC entry 195 (class 1259 OID 11448889)
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
-- TOC entry 199 (class 1259 OID 11448937)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11448869)
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
-- TOC entry 205 (class 1259 OID 11448986)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11449424)
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
-- TOC entry 243 (class 1259 OID 11449436)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11449459)
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
-- TOC entry 209 (class 1259 OID 11449011)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11448826)
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
-- TOC entry 184 (class 1259 OID 11448739)
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
-- TOC entry 185 (class 1259 OID 11448750)
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
-- TOC entry 180 (class 1259 OID 11448704)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11448723)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11449018)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11449049)
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
-- TOC entry 224 (class 1259 OID 11449163)
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
-- TOC entry 187 (class 1259 OID 11448783)
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
-- TOC entry 189 (class 1259 OID 11448818)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11448992)
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
-- TOC entry 188 (class 1259 OID 11448803)
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
-- TOC entry 194 (class 1259 OID 11448881)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11449004)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11449306)
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
-- TOC entry 232 (class 1259 OID 11449316)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11449287)
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
-- TOC entry 233 (class 1259 OID 11449324)
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
-- TOC entry 212 (class 1259 OID 11449033)
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
-- TOC entry 204 (class 1259 OID 11448977)
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
-- TOC entry 203 (class 1259 OID 11448967)
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
-- TOC entry 223 (class 1259 OID 11449152)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11449101)
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
-- TOC entry 177 (class 1259 OID 11448675)
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
-- TOC entry 176 (class 1259 OID 11448673)
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
-- TOC entry 213 (class 1259 OID 11449043)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11448713)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11448697)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11449057)
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
-- TOC entry 207 (class 1259 OID 11448998)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11448948)
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
-- TOC entry 238 (class 1259 OID 11449365)
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
-- TOC entry 237 (class 1259 OID 11449357)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11449352)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11449111)
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
-- TOC entry 186 (class 1259 OID 11448775)
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
-- TOC entry 202 (class 1259 OID 11448954)
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
-- TOC entry 222 (class 1259 OID 11449141)
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
-- TOC entry 234 (class 1259 OID 11449334)
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
-- TOC entry 191 (class 1259 OID 11448838)
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
-- TOC entry 178 (class 1259 OID 11448684)
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
-- TOC entry 226 (class 1259 OID 11449189)
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
-- TOC entry 196 (class 1259 OID 11448900)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11449025)
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
-- TOC entry 240 (class 1259 OID 11449404)
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
-- TOC entry 239 (class 1259 OID 11449376)
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
-- TOC entry 241 (class 1259 OID 11449416)
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
-- TOC entry 218 (class 1259 OID 11449094)
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
-- TOC entry 198 (class 1259 OID 11448932)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11449179)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11449084)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11448678)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2967 (class 0 OID 11448730)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 11449229)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55bf-2cae-b91c-ace725aa6fcc	000d0000-55bf-2cae-fc73-0e5a3a5a88ab	\N	00090000-55bf-2cae-16be-7c2b4de97829	000b0000-55bf-2cae-997b-fa18ff13fefc	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55bf-2cae-5453-a206a70f0cfc	000d0000-55bf-2cae-edae-d5ffdc60ea04	00100000-55bf-2cae-df3d-386d1ee2ee50	00090000-55bf-2cae-0d04-56925849b3e2	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55bf-2cae-637c-adf0bd26402f	000d0000-55bf-2cae-59d7-005dd7ecc4d6	00100000-55bf-2cae-abbf-f50f20ef4624	00090000-55bf-2cae-02e0-d821662c2d04	\N	0003	t	\N	2015-08-03	\N	2	\N	\N	f	f
000c0000-55bf-2cae-1c04-e59bb60cf634	000d0000-55bf-2cae-5480-0c489205bc4f	\N	00090000-55bf-2cae-5e19-ae5a85ca4332	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55bf-2cae-6c4c-7e077c3d62a4	000d0000-55bf-2cae-8b4a-cde8fb12dcff	\N	00090000-55bf-2cae-28cd-4d6a97251b2f	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55bf-2cae-a16d-a1685aae44db	000d0000-55bf-2cae-8d89-6b827533f997	\N	00090000-55bf-2cae-3d50-529f46fdfb8f	000b0000-55bf-2cae-cef4-8ef3e5613cbf	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55bf-2cae-9f48-4e1ac2f98aac	000d0000-55bf-2cae-c3bb-f1007134e8b6	00100000-55bf-2cae-17ed-d5b339734706	00090000-55bf-2cae-8843-78274d664728	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55bf-2cae-e579-95433408489e	000d0000-55bf-2cae-f9a2-17c099e925ef	\N	00090000-55bf-2cae-9332-6b0c83adad75	000b0000-55bf-2cae-035c-2f56e9c90f50	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55bf-2cae-39aa-309f61c9f18f	000d0000-55bf-2cae-c3bb-f1007134e8b6	00100000-55bf-2cae-90fd-53fe3a2ebdaa	00090000-55bf-2cae-495b-939f324ee6d9	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55bf-2cae-1b0e-c8810d7a18d7	000d0000-55bf-2cae-c3bb-f1007134e8b6	00100000-55bf-2cae-e92e-fc88276981f2	00090000-55bf-2cae-e804-a34ec1f75e76	\N	0010	t	\N	2015-08-03	\N	16	\N	\N	f	t
000c0000-55bf-2cae-10ef-23f4ceb8996f	000d0000-55bf-2cae-c3bb-f1007134e8b6	00100000-55bf-2cae-996e-af8c3e4d8121	00090000-55bf-2cae-4801-626d445a353d	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3011 (class 0 OID 11449212)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11449124)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55bf-2cad-497a-7d2ba3bd2596	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55bf-2cad-205e-fb85e1bc289d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55bf-2cad-746f-80b31aaab496	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3028 (class 0 OID 11449443)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 11448909)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55bf-2cae-074b-a0f43e667300	\N	\N	00200000-55bf-2cae-8eae-83aca4022b12	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55bf-2cae-3f0d-66ac8b810240	\N	\N	00200000-55bf-2cae-a21b-dd882ce72b09	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55bf-2cae-de12-52cb16ed7d41	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55bf-2cae-a297-84ef0b37f17c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55bf-2cae-2c19-cc74a44676df	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2984 (class 0 OID 11448943)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 11449345)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11448852)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55bf-2cab-7f43-aa180c772cdb	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55bf-2cab-962c-a496fc96ae1e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55bf-2cab-5a6f-0d80f5adaac1	AL	ALB	008	Albania 	Albanija	\N
00040000-55bf-2cab-2d12-8cc10ae1ea5f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55bf-2cab-e29a-6a081fa6d465	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55bf-2cab-510c-6c088f53d198	AD	AND	020	Andorra 	Andora	\N
00040000-55bf-2cab-1666-e07ffbd5b0a6	AO	AGO	024	Angola 	Angola	\N
00040000-55bf-2cab-15da-629e58e36bb9	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55bf-2cab-36b2-724d704818ee	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55bf-2cab-1050-e6aad12c0961	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-2cab-2b52-8a1a50b3388a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55bf-2cab-4e50-0a75b9262213	AM	ARM	051	Armenia 	Armenija	\N
00040000-55bf-2cab-48f9-9747b81ad47a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55bf-2cab-f053-fa161294525b	AU	AUS	036	Australia 	Avstralija	\N
00040000-55bf-2cab-729a-38072f904da2	AT	AUT	040	Austria 	Avstrija	\N
00040000-55bf-2cab-8a54-61204a7146cb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55bf-2cab-01e2-52a18a0f6a61	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55bf-2cab-e93e-1d4aec2ba94e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55bf-2cab-2d2d-b03f85b9b80f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55bf-2cab-a491-a224cb8245a0	BB	BRB	052	Barbados 	Barbados	\N
00040000-55bf-2cab-7364-bffe00372dd7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55bf-2cab-f997-b3493b9d2421	BE	BEL	056	Belgium 	Belgija	\N
00040000-55bf-2cab-c561-be7398e9b582	BZ	BLZ	084	Belize 	Belize	\N
00040000-55bf-2cab-7936-46d38391d7d6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55bf-2cab-867a-1b63c6b21803	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55bf-2cab-06bc-a3083b281be9	BT	BTN	064	Bhutan 	Butan	\N
00040000-55bf-2cab-cac5-1857cef3bbec	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55bf-2cab-bc90-303256a93596	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55bf-2cab-70d8-d3dfe5f90ebc	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55bf-2cab-ba38-86491d3ed89d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55bf-2cab-b880-f966fe7b207b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55bf-2cab-2382-2b4a8f96e424	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55bf-2cab-1822-cad1bfd34db4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55bf-2cab-4358-1d529e6b64b6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55bf-2cab-b1c1-8631675ca945	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55bf-2cab-a13c-a5639617f0eb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55bf-2cab-d09c-9425c2f8f347	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55bf-2cab-ae7f-8ffc4a71537b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55bf-2cab-06c5-48db874ce4d8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55bf-2cab-2055-b18fb6c2f76c	CA	CAN	124	Canada 	Kanada	\N
00040000-55bf-2cab-672a-3bed3df4df49	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55bf-2cab-6bf7-b9eb0d4d94a0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55bf-2cab-e79d-7e6028067bb0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55bf-2cab-4145-ba7170ab59f1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55bf-2cab-57db-56bf4fd9caf7	CL	CHL	152	Chile 	Čile	\N
00040000-55bf-2cab-7341-85e256775bc7	CN	CHN	156	China 	Kitajska	\N
00040000-55bf-2cab-127f-f865752f462f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55bf-2cab-0008-f129180d6ff6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55bf-2cab-8fef-1c6d3fa27916	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55bf-2cab-34fa-490d2a392fa6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55bf-2cab-604e-6e53b39adcb3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55bf-2cab-b2dd-0381cb29398e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55bf-2cab-9a8d-26245f03369c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55bf-2cab-b8da-619f691137f9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55bf-2cab-e589-d0969e8c90a1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55bf-2cab-f1a4-fa7f7fb913d0	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55bf-2cab-a8b4-e6b670744abc	CU	CUB	192	Cuba 	Kuba	\N
00040000-55bf-2cab-0dfd-674d835ef4c5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55bf-2cab-9f9e-f7fe2e9c64c8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55bf-2cab-18c2-af3ffc1bc40d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55bf-2cab-8fd1-7975a28ce311	DK	DNK	208	Denmark 	Danska	\N
00040000-55bf-2cab-443b-86a60b70c8b6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55bf-2cab-ec02-46cff1433956	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55bf-2cab-55f9-201ea84ab1b1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55bf-2cac-9924-431e20545cfa	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55bf-2cac-758a-7bc765befd36	EG	EGY	818	Egypt 	Egipt	\N
00040000-55bf-2cac-f0e8-f2f29c1a88b5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55bf-2cac-b8e6-8349050c074b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55bf-2cac-3ec6-120762da158d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55bf-2cac-e6e4-037abc3f33d8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55bf-2cac-9083-dc831e952635	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55bf-2cac-3340-d04846186ddb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55bf-2cac-29e6-ca485fd4898b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55bf-2cac-e809-810f27e4f07d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55bf-2cac-c016-b1dbfb73abc4	FI	FIN	246	Finland 	Finska	\N
00040000-55bf-2cac-ec09-978ed50e642b	FR	FRA	250	France 	Francija	\N
00040000-55bf-2cac-49cf-65b21123456a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55bf-2cac-2014-ba656bf88b60	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55bf-2cac-baaf-a042e5e6953d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55bf-2cac-0e29-87f23a99f3ad	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55bf-2cac-9c18-cda31ee129d3	GA	GAB	266	Gabon 	Gabon	\N
00040000-55bf-2cac-239e-c79676e354eb	GM	GMB	270	Gambia 	Gambija	\N
00040000-55bf-2cac-cdd9-d09d6f9c84b6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55bf-2cac-fbe1-4c0a90fbc075	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55bf-2cac-ae91-41144e91668e	GH	GHA	288	Ghana 	Gana	\N
00040000-55bf-2cac-7fc7-776c3a554240	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55bf-2cac-79e6-4f3f6886c47c	GR	GRC	300	Greece 	Grčija	\N
00040000-55bf-2cac-23a1-9f240028d965	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55bf-2cac-f575-f97f85d53708	GD	GRD	308	Grenada 	Grenada	\N
00040000-55bf-2cac-e598-666bd3efdfe9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55bf-2cac-71e9-f67179a5c37f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55bf-2cac-c4e4-f1eeca874688	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55bf-2cac-c708-8bd5defb39f6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55bf-2cac-e8eb-be363201cf8a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55bf-2cac-76fc-cbe7b5fd03b8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55bf-2cac-15ad-b68a7a8e14ea	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55bf-2cac-c573-f3f62dd8fca3	HT	HTI	332	Haiti 	Haiti	\N
00040000-55bf-2cac-bcce-df9d56b7bf03	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55bf-2cac-c522-597e8e9d11b3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55bf-2cac-fbb0-f7562f0bc934	HN	HND	340	Honduras 	Honduras	\N
00040000-55bf-2cac-be9d-7e007c640ee9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55bf-2cac-0d54-f56dc4076647	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55bf-2cac-d0a1-c8b815f5066d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55bf-2cac-331d-bb7cb1af8f73	IN	IND	356	India 	Indija	\N
00040000-55bf-2cac-001b-db4fee45cb60	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55bf-2cac-dc95-d70e96523ea5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55bf-2cac-cf17-7315663f745f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55bf-2cac-a5c4-039dc1cfe2ac	IE	IRL	372	Ireland 	Irska	\N
00040000-55bf-2cac-ece2-e953e90ee623	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55bf-2cac-e383-5f6dc5beef1b	IL	ISR	376	Israel 	Izrael	\N
00040000-55bf-2cac-cc1f-33839c6f0cc7	IT	ITA	380	Italy 	Italija	\N
00040000-55bf-2cac-09a8-5feb91dbebdb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55bf-2cac-5125-f1b65cf73889	JP	JPN	392	Japan 	Japonska	\N
00040000-55bf-2cac-e2eb-cfe1ac69cd6d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55bf-2cac-6fce-10794f6557a2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55bf-2cac-5759-003fbce87669	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55bf-2cac-4af5-e44e641431f8	KE	KEN	404	Kenya 	Kenija	\N
00040000-55bf-2cac-7b39-1b7254263245	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55bf-2cac-71cd-963de3fd9e9b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55bf-2cac-3c1a-4e17b4697bf7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55bf-2cac-217f-20f84a8ceb71	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55bf-2cac-bec6-3abad7145318	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55bf-2cac-48f3-02a8e95c53d4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55bf-2cac-49fd-24ddc9197571	LV	LVA	428	Latvia 	Latvija	\N
00040000-55bf-2cac-66de-b8a75934bff9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55bf-2cac-35af-030e73065823	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55bf-2cac-e0f2-55bedc3484e8	LR	LBR	430	Liberia 	Liberija	\N
00040000-55bf-2cac-6344-0d5000a0a6ed	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55bf-2cac-3103-e76baf2f6fbf	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55bf-2cac-fa4b-f8bc1f6d3848	LT	LTU	440	Lithuania 	Litva	\N
00040000-55bf-2cac-ee0c-0a91b220a5c2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55bf-2cac-9de4-d78931f9ef3b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55bf-2cac-ec53-c5e0e5f29cef	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55bf-2cac-ad41-10c56375c8db	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55bf-2cac-c3c8-4b762edc4c1e	MW	MWI	454	Malawi 	Malavi	\N
00040000-55bf-2cac-b5a7-0f0620e77d5e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55bf-2cac-557e-489a595a9849	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55bf-2cac-a1dc-b85a15025e7d	ML	MLI	466	Mali 	Mali	\N
00040000-55bf-2cac-5cc2-9ab90c0a7017	MT	MLT	470	Malta 	Malta	\N
00040000-55bf-2cac-3baf-12acf01d0b76	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55bf-2cac-dbcd-0bca1d67be35	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55bf-2cac-94fa-37a1b6ecef44	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55bf-2cac-9c2c-391d45aa9652	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55bf-2cac-0dee-d07a9c238e4c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55bf-2cac-eecb-e01194598678	MX	MEX	484	Mexico 	Mehika	\N
00040000-55bf-2cac-b967-bee68c10a9b6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55bf-2cac-9327-1c2f08868d28	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55bf-2cac-9c38-4f45b466bb18	MC	MCO	492	Monaco 	Monako	\N
00040000-55bf-2cac-0ba1-93b6e6d17004	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55bf-2cac-69ab-0d5d58be37ff	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55bf-2cac-82c5-0b79db3cfedf	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55bf-2cac-3ca4-b6935f68b771	MA	MAR	504	Morocco 	Maroko	\N
00040000-55bf-2cac-781d-5a614366d619	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55bf-2cac-4c5d-282b0830c5f5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55bf-2cac-e6df-99e5fd5e0161	NA	NAM	516	Namibia 	Namibija	\N
00040000-55bf-2cac-4dce-d56b2604786d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55bf-2cac-0ebf-122c6ce79b2c	NP	NPL	524	Nepal 	Nepal	\N
00040000-55bf-2cac-a979-a4d72cbc9564	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55bf-2cac-c964-38d46c9a060b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55bf-2cac-ead8-868e62e04d00	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55bf-2cac-41e8-5746e4bfe9a4	NE	NER	562	Niger 	Niger 	\N
00040000-55bf-2cac-ea19-1469d1cc930a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55bf-2cac-a752-ceccf90c2fbe	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55bf-2cac-9b7d-04cee4c907f5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55bf-2cac-6010-f36b3aba295c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55bf-2cac-dffe-eff2f212bdc0	NO	NOR	578	Norway 	Norveška	\N
00040000-55bf-2cac-c2b8-bea8ee198e24	OM	OMN	512	Oman 	Oman	\N
00040000-55bf-2cac-a6b8-62f64c16d256	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55bf-2cac-7856-3b0ab75e7d43	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55bf-2cac-61a0-2e67b1dc34f2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55bf-2cac-dd0e-305840d1b517	PA	PAN	591	Panama 	Panama	\N
00040000-55bf-2cac-8885-dcdc79d0cdd3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55bf-2cac-19bf-c6f29ac7178b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55bf-2cac-1708-530d1a950982	PE	PER	604	Peru 	Peru	\N
00040000-55bf-2cac-584b-bcdb80e55082	PH	PHL	608	Philippines 	Filipini	\N
00040000-55bf-2cac-5282-b8cf563e4bd4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55bf-2cac-50ee-6461aa881fb0	PL	POL	616	Poland 	Poljska	\N
00040000-55bf-2cac-2eba-16ae838ff7ae	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55bf-2cac-605c-259cb2b33518	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55bf-2cac-8721-751d89087139	QA	QAT	634	Qatar 	Katar	\N
00040000-55bf-2cac-6cff-f57e9d21abfd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55bf-2cac-1048-5ecbad1a77d7	RO	ROU	642	Romania 	Romunija	\N
00040000-55bf-2cac-9a14-e4fb701e5b3c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55bf-2cac-ed4a-e814deb999c3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55bf-2cac-4177-205d05a79613	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55bf-2cac-0d91-35c7455a5654	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55bf-2cac-47be-74ebd28bf51c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55bf-2cac-14c6-bcd4397710df	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55bf-2cac-add2-8af61871241b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55bf-2cac-a498-3d8e5f9155f5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55bf-2cac-b91d-746c46566e14	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55bf-2cac-436b-903e06cd37e2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55bf-2cac-6402-f1efb8857d66	SM	SMR	674	San Marino 	San Marino	\N
00040000-55bf-2cac-6b2b-d7f00cf116d3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55bf-2cac-5c13-94ac6696d647	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55bf-2cac-1949-b90ddd9f031d	SN	SEN	686	Senegal 	Senegal	\N
00040000-55bf-2cac-f97d-2de2327cab57	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55bf-2cac-2699-e3dbba4c8870	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55bf-2cac-f4bb-c641ad62a5e6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55bf-2cac-5820-f7a217ae55a8	SG	SGP	702	Singapore 	Singapur	\N
00040000-55bf-2cac-ebca-218fda359985	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55bf-2cac-85b8-3153398bc654	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55bf-2cac-2c64-6de78a8185e9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55bf-2cac-de51-ff8946b64dbf	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55bf-2cac-1448-c3faf14c571c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55bf-2cac-3a31-aff0e8ebbc99	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55bf-2cac-ff0f-bbb3de24fd23	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55bf-2cac-ee4a-b291800fe234	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55bf-2cac-1776-dffe41e3a64f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55bf-2cac-fd74-bacafbbc29df	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55bf-2cac-d93b-e95a45a3a8f9	SD	SDN	729	Sudan 	Sudan	\N
00040000-55bf-2cac-e2bb-54162e1cd2ec	SR	SUR	740	Suriname 	Surinam	\N
00040000-55bf-2cac-f862-c85e766d89dd	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55bf-2cac-54cd-b0428a3a0943	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55bf-2cac-f36a-2a920d0309be	SE	SWE	752	Sweden 	Švedska	\N
00040000-55bf-2cac-6dbe-4e98e66ae077	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55bf-2cac-1c64-3a677bdca3ea	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55bf-2cac-eb04-8c11a730e5d7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55bf-2cac-393d-1e1b51760bb8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55bf-2cac-3f93-823993ba7713	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55bf-2cac-6602-35766e79839d	TH	THA	764	Thailand 	Tajska	\N
00040000-55bf-2cac-2ec1-cb0f24a115d5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55bf-2cac-1f87-088496fd44cf	TG	TGO	768	Togo 	Togo	\N
00040000-55bf-2cac-fc87-19b031b32c62	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55bf-2cac-b2ed-d59ff5a8c3c9	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55bf-2cac-7338-3b7be92f7850	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55bf-2cac-70b9-0c3f23fba12f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55bf-2cac-0c2f-087983b6db1a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55bf-2cac-3006-d51ce338f9d5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55bf-2cac-5c88-9bf93542215d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-2cac-0f37-a156ab05ebd6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55bf-2cac-3239-caa510a0c498	UG	UGA	800	Uganda 	Uganda	\N
00040000-55bf-2cac-6461-5ca5f13a4e6a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55bf-2cac-e18f-eac88ba5efa6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55bf-2cac-111e-b9f08eccaadd	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55bf-2cac-cd8d-5b4eb716a17e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55bf-2cac-2f3d-602bd1db56e6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55bf-2cac-9053-99e5de3f9f67	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55bf-2cac-7c4d-ef446e8f1ee7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55bf-2cac-5e59-330b9fd2c64b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55bf-2cac-5300-6a7ee8a1bbae	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55bf-2cac-d99a-9d749a73ef0a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55bf-2cac-bf1b-5d3ef60cdbb6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55bf-2cac-444e-21d264930d37	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55bf-2cac-457e-88b963afbb53	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55bf-2cac-5f0b-b01315938461	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55bf-2cac-5592-75ac7e192c3b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55bf-2cac-fa73-86ad62a8d558	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55bf-2cac-48f0-6acc6c0fad40	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3013 (class 0 OID 11449242)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55bf-2cae-c02f-9d112bcb1d9c	000e0000-55bf-2cae-c59e-e289aea6f076	\N	\N	9000.30	9000.30	0.00	0.00	3600.12	5299.98	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55bf-2cac-ae34-db434f80b48d	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55bf-2cae-eecd-bf2ba0b8e772	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	\N	4900.20	4900.20	0.00	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55bf-2cac-e09c-1ff5e59439e7	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-2cae-0614-ac08e16c2112	\N	\N	\N	300.00	300.00	0.00	0.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55bf-2cae-bb5a-9011e6b30001	\N	\N	\N	203.00	203.00	0.00	0.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3000 (class 0 OID 11449069)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55bf-2cae-c3bb-f1007134e8b6	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55bf-2cac-bb5b-965642aba5f3
000d0000-55bf-2cae-fc73-0e5a3a5a88ab	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-2cac-bb5b-965642aba5f3
000d0000-55bf-2cae-edae-d5ffdc60ea04	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55bf-2cac-5d96-de9e1d40b0df
000d0000-55bf-2cae-59d7-005dd7ecc4d6	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55bf-2cac-13cd-d707e58df7a0
000d0000-55bf-2cae-5480-0c489205bc4f	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55bf-2cac-b0fe-57faac926dbd
000d0000-55bf-2cae-8b4a-cde8fb12dcff	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55bf-2cac-0b91-8e54669348c6
000d0000-55bf-2cae-8d89-6b827533f997	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55bf-2cac-bb5b-965642aba5f3
000d0000-55bf-2cae-f9a2-17c099e925ef	000e0000-55bf-2cae-3333-b119cd9f46b4	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55bf-2cac-d8ae-f2d52dfafb92
\.


--
-- TOC entry 2979 (class 0 OID 11448889)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11448937)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 11448869)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55bf-2cae-4b2e-01f33df39f5d	00080000-55bf-2cad-fb3d-2117415c925a	00090000-55bf-2cae-e804-a34ec1f75e76	AK		
\.


--
-- TOC entry 2954 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11448986)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11449424)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11449436)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11449459)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11449011)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 11448826)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55bf-2cac-dc8c-4cf41fcab87f	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55bf-2cac-79b0-7fab20b6bed7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55bf-2cac-b660-39eb02d8c8fe	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55bf-2cac-c4b5-a629993ac9dc	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55bf-2cac-b3a4-40515deb6057	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55bf-2cac-4aab-9f9cb9a566f5	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55bf-2cac-6a0e-844d82b3b3f5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55bf-2cac-5707-3fa9ec7089eb	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-2cac-ad3f-3c16a55d2218	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55bf-2cac-1321-c73279456ae6	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55bf-2cac-a8f3-3191cb675390	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55bf-2cac-6cfc-0243ec58fe29	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55bf-2cac-46ee-97546a5ec39e	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55bf-2cac-775c-ae57ffe1e726	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55bf-2cad-c0cd-1fa7fd5f4ba8	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55bf-2cad-52fb-5ca04cc0a163	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55bf-2cad-dd9f-eedeb9491ac3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55bf-2cad-b8c1-470c66b27cc0	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55bf-2cad-9e4c-2c59b384af1d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55bf-2cad-460c-5140c7bb6e49	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2968 (class 0 OID 11448739)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55bf-2cad-7641-4dccea9cdfa3	00000000-55bf-2cad-52fb-5ca04cc0a163	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55bf-2cad-5cb8-03f9d2db7a9a	00000000-55bf-2cad-52fb-5ca04cc0a163	00010000-55bf-2cac-b967-2527b6b3e68b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55bf-2cad-8723-8f1b467f12f6	00000000-55bf-2cad-dd9f-eedeb9491ac3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2969 (class 0 OID 11448750)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55bf-2cae-16be-7c2b4de97829	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55bf-2cae-5e19-ae5a85ca4332	00010000-55bf-2cad-1452-eb7838166891	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55bf-2cae-02e0-d821662c2d04	00010000-55bf-2cad-b532-13c5b61a807d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55bf-2cae-495b-939f324ee6d9	00010000-55bf-2cad-c918-14716c3322dc	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55bf-2cae-7839-a932399179f2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55bf-2cae-3d50-529f46fdfb8f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55bf-2cae-4801-626d445a353d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55bf-2cae-8843-78274d664728	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55bf-2cae-e804-a34ec1f75e76	00010000-55bf-2cad-8086-0976406e2837	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55bf-2cae-0d04-56925849b3e2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55bf-2cae-dd00-a6df77ab1042	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55bf-2cae-28cd-4d6a97251b2f	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55bf-2cae-9332-6b0c83adad75	00010000-55bf-2cad-5be6-b1cbf72ec6ac	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11448704)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55bf-2cac-299a-001e30020206	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55bf-2cac-f03a-d9cf1546e362	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55bf-2cac-8c4e-e3f1f09e4197	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55bf-2cac-d97f-b1768a860d55	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55bf-2cac-cd8c-31cf8817b79a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55bf-2cac-c3ec-a34b510815d8	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55bf-2cac-b91d-dcdff5c6ad84	Abonma-read	Abonma - branje	f
00030000-55bf-2cac-32e1-30511fa10f64	Abonma-write	Abonma - spreminjanje	f
00030000-55bf-2cac-7d5a-302162cdcecc	Alternacija-read	Alternacija - branje	f
00030000-55bf-2cac-93c0-93c028f82238	Alternacija-write	Alternacija - spreminjanje	f
00030000-55bf-2cac-2b91-4da765d0a2f6	Arhivalija-read	Arhivalija - branje	f
00030000-55bf-2cac-d8f9-f85faae2169b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55bf-2cac-40b9-5f6b3f68edbc	Besedilo-read	Besedilo - branje	f
00030000-55bf-2cac-5b0e-d0024b25e3b8	Besedilo-write	Besedilo - spreminjanje	f
00030000-55bf-2cac-6269-14b285025adb	DogodekIzven-read	DogodekIzven - branje	f
00030000-55bf-2cac-1a6c-9086493827de	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55bf-2cac-fd31-7a812ac84649	Dogodek-read	Dogodek - branje	f
00030000-55bf-2cac-fb46-fcaa87ac39ba	Dogodek-write	Dogodek - spreminjanje	f
00030000-55bf-2cac-c85e-442dabce0556	DrugiVir-read	DrugiVir - branje	f
00030000-55bf-2cac-095d-0561935dd145	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55bf-2cac-6a1b-5d73eed74906	Drzava-read	Drzava - branje	f
00030000-55bf-2cac-6eeb-de7abda36727	Drzava-write	Drzava - spreminjanje	f
00030000-55bf-2cac-9637-58ccb3f21a00	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55bf-2cac-1784-0d6bffeeaed0	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55bf-2cac-4f4c-44a1e763f5bb	Funkcija-read	Funkcija - branje	f
00030000-55bf-2cac-44e4-1ccf45b00686	Funkcija-write	Funkcija - spreminjanje	f
00030000-55bf-2cac-ce58-363cad6d7501	Gostovanje-read	Gostovanje - branje	f
00030000-55bf-2cac-2c1f-dbe399a01fdf	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55bf-2cac-0c8a-b8d80473ef96	Gostujoca-read	Gostujoca - branje	f
00030000-55bf-2cac-6b92-11ee1c3bdf7a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55bf-2cac-c3ee-6c3c8e2ce5c8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55bf-2cac-ba16-85ed09d05206	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55bf-2cac-05ea-7ffd9e805772	Kupec-read	Kupec - branje	f
00030000-55bf-2cac-2b4b-808f1637a328	Kupec-write	Kupec - spreminjanje	f
00030000-55bf-2cac-da40-34aa8e763df8	NacinPlacina-read	NacinPlacina - branje	f
00030000-55bf-2cac-a398-400af8b37f87	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55bf-2cac-dee8-d5ac672899b8	Option-read	Option - branje	f
00030000-55bf-2cac-062a-06aa7431f009	Option-write	Option - spreminjanje	f
00030000-55bf-2cac-3616-771290bd8fb1	OptionValue-read	OptionValue - branje	f
00030000-55bf-2cac-fb27-95fcf90dc41d	OptionValue-write	OptionValue - spreminjanje	f
00030000-55bf-2cac-cd71-824e23526547	Oseba-read	Oseba - branje	f
00030000-55bf-2cac-d670-e7b4a475af51	Oseba-write	Oseba - spreminjanje	f
00030000-55bf-2cac-db50-32cbeca375f6	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55bf-2cac-a6ba-f6f3836628d2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55bf-2cac-3799-a2d025275e87	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55bf-2cac-c06d-21bcf7df93d7	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55bf-2cac-801f-7e3429f53948	Pogodba-read	Pogodba - branje	f
00030000-55bf-2cac-2a3c-52df59422117	Pogodba-write	Pogodba - spreminjanje	f
00030000-55bf-2cac-82a2-08e9066bdc3a	Popa-read	Popa - branje	f
00030000-55bf-2cac-c34e-6b41cd5aa501	Popa-write	Popa - spreminjanje	f
00030000-55bf-2cac-e2fd-82917e4d730c	Posta-read	Posta - branje	f
00030000-55bf-2cac-b746-21c11bb0ee96	Posta-write	Posta - spreminjanje	f
00030000-55bf-2cac-749c-3fa97517d5b1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55bf-2cac-6cbb-692714c9eeea	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55bf-2cac-365a-8407f252de9a	PostniNaslov-read	PostniNaslov - branje	f
00030000-55bf-2cac-bb7f-3e802b75a7a1	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55bf-2cac-f9b1-a957b6135da6	Predstava-read	Predstava - branje	f
00030000-55bf-2cac-8ac3-c11ada7272ac	Predstava-write	Predstava - spreminjanje	f
00030000-55bf-2cac-a8ff-64ab8158189d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55bf-2cac-817f-46462150d4dc	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55bf-2cac-db44-02945cff4c63	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55bf-2cac-44fc-4c319db46fea	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55bf-2cac-ed8d-3e02cb1050dd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55bf-2cac-c01f-b90ca9253b02	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55bf-2cac-c290-a96deb85e9fb	ProgramDela-read	ProgramDela - branje	f
00030000-55bf-2cac-d43c-74ec61c7e556	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55bf-2cac-937d-1b345b35399e	ProgramFestival-read	ProgramFestival - branje	f
00030000-55bf-2cac-6f00-59914bddc4c6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55bf-2cac-9313-8a199c1ac12b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55bf-2cac-9356-41e71e5ada62	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55bf-2cac-2a03-7a287d5e16ff	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55bf-2cac-3e52-aa4b3989ecd1	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55bf-2cac-a440-b613024b1000	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55bf-2cac-18b6-725ac9d18e8a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55bf-2cac-9017-b49aa0408e3e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55bf-2cac-6948-4f9002afa044	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55bf-2cac-fdb3-b1897af539a1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55bf-2cac-5ae4-2ad8d97a0cae	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55bf-2cac-4d94-b73028966e5b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55bf-2cac-b51b-e2d0d0731856	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55bf-2cac-9436-71892ff3ecd4	ProgramRazno-read	ProgramRazno - branje	f
00030000-55bf-2cac-6a1f-afc26abc2941	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55bf-2cac-8a6f-786049a25153	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55bf-2cac-54bb-4a2e7eca9f59	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55bf-2cac-46e6-13e8feb6c567	Prostor-read	Prostor - branje	f
00030000-55bf-2cac-2ff3-f9154bd88197	Prostor-write	Prostor - spreminjanje	f
00030000-55bf-2cac-17c5-02fa48cbb6fd	Racun-read	Racun - branje	f
00030000-55bf-2cac-63d4-8ed1b0b9db64	Racun-write	Racun - spreminjanje	f
00030000-55bf-2cac-cd94-294cd784233b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55bf-2cac-cbf4-9f83b0ad4f41	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55bf-2cac-ceae-2e0af38c34e7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55bf-2cac-1997-fd3ef38151af	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55bf-2cac-4dc8-408426129225	Rekvizit-read	Rekvizit - branje	f
00030000-55bf-2cac-93e1-361f5643ade7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55bf-2cac-9767-8d7566888dc3	Revizija-read	Revizija - branje	f
00030000-55bf-2cac-83e5-670cdbcb429b	Revizija-write	Revizija - spreminjanje	f
00030000-55bf-2cac-6649-2d17617ec774	Rezervacija-read	Rezervacija - branje	f
00030000-55bf-2cac-eb5f-8a9e5e88d461	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55bf-2cac-1e61-446ad9aa60e3	SedezniRed-read	SedezniRed - branje	f
00030000-55bf-2cac-10bc-b922912a4d64	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55bf-2cac-8903-29af5cf3c18d	Sedez-read	Sedez - branje	f
00030000-55bf-2cac-7c0c-20b70c5c216b	Sedez-write	Sedez - spreminjanje	f
00030000-55bf-2cac-4d03-59d57c333364	Sezona-read	Sezona - branje	f
00030000-55bf-2cac-f816-aa6209495cca	Sezona-write	Sezona - spreminjanje	f
00030000-55bf-2cac-7cf4-0ffca6f13849	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55bf-2cac-0879-3741fb70c9c1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55bf-2cac-ad2b-31f0750bd5c5	Stevilcenje-read	Stevilcenje - branje	f
00030000-55bf-2cac-4b5e-fc59ee24fb08	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55bf-2cac-dd6b-920ebe076cca	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55bf-2cac-6d83-578bd45cb244	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55bf-2cac-37f9-ae8526578813	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55bf-2cac-f90f-20da99af285f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55bf-2cac-e43d-4fb0827050e1	Telefonska-read	Telefonska - branje	f
00030000-55bf-2cac-9404-3c827fcb4e84	Telefonska-write	Telefonska - spreminjanje	f
00030000-55bf-2cac-0939-dac29379cb12	TerminStoritve-read	TerminStoritve - branje	f
00030000-55bf-2cac-a200-855bb74241cc	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55bf-2cac-1aff-9bbf1597a079	TipFunkcije-read	TipFunkcije - branje	f
00030000-55bf-2cac-7f26-8dd81e3f0aea	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55bf-2cac-8ccb-a5b4c718e370	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55bf-2cac-cb4d-14389b350e29	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55bf-2cac-f281-9228f8b557cc	Trr-read	Trr - branje	f
00030000-55bf-2cac-4a1c-1c35f3ee76d8	Trr-write	Trr - spreminjanje	f
00030000-55bf-2cac-f27c-d6b2d341ed89	Uprizoritev-read	Uprizoritev - branje	f
00030000-55bf-2cac-029f-03c473ab8035	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55bf-2cac-66b6-0be8305b8b5f	Vaja-read	Vaja - branje	f
00030000-55bf-2cac-756f-cfd1ace0ad1b	Vaja-write	Vaja - spreminjanje	f
00030000-55bf-2cac-df15-d45a94fff0cf	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55bf-2cac-86ee-c09807dd8858	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55bf-2cac-4c27-ea698bbeffee	Zaposlitev-read	Zaposlitev - branje	f
00030000-55bf-2cac-0484-56355c491cac	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55bf-2cac-3675-e1cfa0ebcec9	Zasedenost-read	Zasedenost - branje	f
00030000-55bf-2cac-0474-f64c4aa0556f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55bf-2cac-5eb5-ff3aedd06952	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55bf-2cac-08a9-1c26963b1b38	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55bf-2cac-ecf5-591bfddd3df2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55bf-2cac-bb4b-7e13270c8bad	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55bf-2cac-2b9d-9567b0cb9834	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55bf-2cac-97c5-394fe22b52ce	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55bf-2cac-f99c-dd34330e0600	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55bf-2cac-9390-b1c0305f9729	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55bf-2cac-2833-40ad53a96c0a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-2cac-195b-ae86de44a3ca	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55bf-2cac-380b-0e480515aebf	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-2cac-17f3-756b93eb46e5	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55bf-2cac-69fc-5ed387ba28f2	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55bf-2cac-e9dc-ee10782c8527	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55bf-2cac-08e7-e2e164cf8946	Datoteka-write	Datoteka - spreminjanje	f
00030000-55bf-2cac-c168-bdb35afc099d	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2966 (class 0 OID 11448723)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55bf-2cac-563d-13c6b1a05a53	00030000-55bf-2cac-f03a-d9cf1546e362
00020000-55bf-2cac-f0ab-fdeae3285599	00030000-55bf-2cac-6a1b-5d73eed74906
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-b91d-dcdff5c6ad84
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-32e1-30511fa10f64
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-7d5a-302162cdcecc
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-93c0-93c028f82238
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-2b91-4da765d0a2f6
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-fd31-7a812ac84649
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-d97f-b1768a860d55
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-fb46-fcaa87ac39ba
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-6a1b-5d73eed74906
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-6eeb-de7abda36727
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-4f4c-44a1e763f5bb
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-44e4-1ccf45b00686
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-ce58-363cad6d7501
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-2c1f-dbe399a01fdf
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-0c8a-b8d80473ef96
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-6b92-11ee1c3bdf7a
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-c3ee-6c3c8e2ce5c8
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-ba16-85ed09d05206
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-dee8-d5ac672899b8
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-3616-771290bd8fb1
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-cd71-824e23526547
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-d670-e7b4a475af51
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-82a2-08e9066bdc3a
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-c34e-6b41cd5aa501
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-e2fd-82917e4d730c
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-b746-21c11bb0ee96
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-365a-8407f252de9a
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-bb7f-3e802b75a7a1
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-f9b1-a957b6135da6
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-8ac3-c11ada7272ac
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-ed8d-3e02cb1050dd
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-c01f-b90ca9253b02
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-46e6-13e8feb6c567
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-2ff3-f9154bd88197
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-ceae-2e0af38c34e7
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-1997-fd3ef38151af
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-4dc8-408426129225
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-93e1-361f5643ade7
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-4d03-59d57c333364
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-f816-aa6209495cca
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-1aff-9bbf1597a079
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-f27c-d6b2d341ed89
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-029f-03c473ab8035
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-66b6-0be8305b8b5f
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-756f-cfd1ace0ad1b
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-3675-e1cfa0ebcec9
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-0474-f64c4aa0556f
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-5eb5-ff3aedd06952
00020000-55bf-2cac-fa7c-32c342545d9c	00030000-55bf-2cac-ecf5-591bfddd3df2
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-b91d-dcdff5c6ad84
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-2b91-4da765d0a2f6
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-fd31-7a812ac84649
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-6a1b-5d73eed74906
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-ce58-363cad6d7501
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-0c8a-b8d80473ef96
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-c3ee-6c3c8e2ce5c8
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-ba16-85ed09d05206
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-dee8-d5ac672899b8
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-3616-771290bd8fb1
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-cd71-824e23526547
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-d670-e7b4a475af51
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-82a2-08e9066bdc3a
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-e2fd-82917e4d730c
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-365a-8407f252de9a
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-bb7f-3e802b75a7a1
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-f9b1-a957b6135da6
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-46e6-13e8feb6c567
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-ceae-2e0af38c34e7
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-4dc8-408426129225
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-4d03-59d57c333364
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-e43d-4fb0827050e1
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-9404-3c827fcb4e84
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-f281-9228f8b557cc
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-4a1c-1c35f3ee76d8
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-4c27-ea698bbeffee
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-0484-56355c491cac
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-5eb5-ff3aedd06952
00020000-55bf-2cac-64d8-05b42c1ee143	00030000-55bf-2cac-ecf5-591bfddd3df2
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-b91d-dcdff5c6ad84
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-7d5a-302162cdcecc
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-2b91-4da765d0a2f6
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-d8f9-f85faae2169b
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-40b9-5f6b3f68edbc
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-6269-14b285025adb
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-fd31-7a812ac84649
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-6a1b-5d73eed74906
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-4f4c-44a1e763f5bb
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-ce58-363cad6d7501
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-0c8a-b8d80473ef96
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-c3ee-6c3c8e2ce5c8
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-dee8-d5ac672899b8
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-3616-771290bd8fb1
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-cd71-824e23526547
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-82a2-08e9066bdc3a
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-e2fd-82917e4d730c
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-f9b1-a957b6135da6
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-ed8d-3e02cb1050dd
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-46e6-13e8feb6c567
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-ceae-2e0af38c34e7
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-4dc8-408426129225
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-4d03-59d57c333364
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-1aff-9bbf1597a079
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-66b6-0be8305b8b5f
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-3675-e1cfa0ebcec9
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-5eb5-ff3aedd06952
00020000-55bf-2cac-9fa5-baad8b149323	00030000-55bf-2cac-ecf5-591bfddd3df2
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-b91d-dcdff5c6ad84
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-32e1-30511fa10f64
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-93c0-93c028f82238
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-2b91-4da765d0a2f6
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-fd31-7a812ac84649
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-6a1b-5d73eed74906
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-ce58-363cad6d7501
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-0c8a-b8d80473ef96
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-dee8-d5ac672899b8
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-3616-771290bd8fb1
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-82a2-08e9066bdc3a
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-e2fd-82917e4d730c
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-f9b1-a957b6135da6
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-46e6-13e8feb6c567
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-ceae-2e0af38c34e7
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-4dc8-408426129225
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-4d03-59d57c333364
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-1aff-9bbf1597a079
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-5eb5-ff3aedd06952
00020000-55bf-2cac-86a7-8247c7d11365	00030000-55bf-2cac-ecf5-591bfddd3df2
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-b91d-dcdff5c6ad84
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-2b91-4da765d0a2f6
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-fd31-7a812ac84649
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-6a1b-5d73eed74906
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-ce58-363cad6d7501
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-0c8a-b8d80473ef96
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-dee8-d5ac672899b8
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-3616-771290bd8fb1
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-82a2-08e9066bdc3a
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-e2fd-82917e4d730c
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-f9b1-a957b6135da6
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-46e6-13e8feb6c567
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-ceae-2e0af38c34e7
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-4dc8-408426129225
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-4d03-59d57c333364
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-0939-dac29379cb12
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-8c4e-e3f1f09e4197
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-1aff-9bbf1597a079
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-5eb5-ff3aedd06952
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	00030000-55bf-2cac-ecf5-591bfddd3df2
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-299a-001e30020206
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-f03a-d9cf1546e362
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-8c4e-e3f1f09e4197
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-d97f-b1768a860d55
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-cd8c-31cf8817b79a
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-c3ec-a34b510815d8
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-b91d-dcdff5c6ad84
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-32e1-30511fa10f64
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-7d5a-302162cdcecc
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-93c0-93c028f82238
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-2b91-4da765d0a2f6
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-d8f9-f85faae2169b
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-40b9-5f6b3f68edbc
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-5b0e-d0024b25e3b8
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6269-14b285025adb
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-1a6c-9086493827de
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-fd31-7a812ac84649
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-fb46-fcaa87ac39ba
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6a1b-5d73eed74906
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6eeb-de7abda36727
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-c85e-442dabce0556
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-095d-0561935dd145
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-9637-58ccb3f21a00
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-1784-0d6bffeeaed0
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-4f4c-44a1e763f5bb
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-44e4-1ccf45b00686
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-ce58-363cad6d7501
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-2c1f-dbe399a01fdf
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-0c8a-b8d80473ef96
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6b92-11ee1c3bdf7a
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-c3ee-6c3c8e2ce5c8
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-ba16-85ed09d05206
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-05ea-7ffd9e805772
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-2b4b-808f1637a328
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-da40-34aa8e763df8
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-a398-400af8b37f87
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-dee8-d5ac672899b8
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-062a-06aa7431f009
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-3616-771290bd8fb1
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-fb27-95fcf90dc41d
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-cd71-824e23526547
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-d670-e7b4a475af51
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-db50-32cbeca375f6
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-a6ba-f6f3836628d2
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-3799-a2d025275e87
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-c06d-21bcf7df93d7
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-801f-7e3429f53948
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-2a3c-52df59422117
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-82a2-08e9066bdc3a
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-c34e-6b41cd5aa501
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-e2fd-82917e4d730c
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-b746-21c11bb0ee96
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-749c-3fa97517d5b1
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6cbb-692714c9eeea
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-365a-8407f252de9a
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-bb7f-3e802b75a7a1
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-f9b1-a957b6135da6
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-8ac3-c11ada7272ac
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-a8ff-64ab8158189d
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-817f-46462150d4dc
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-db44-02945cff4c63
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-44fc-4c319db46fea
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-ed8d-3e02cb1050dd
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-c01f-b90ca9253b02
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-c290-a96deb85e9fb
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-d43c-74ec61c7e556
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-937d-1b345b35399e
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6f00-59914bddc4c6
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-9313-8a199c1ac12b
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-9356-41e71e5ada62
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-2a03-7a287d5e16ff
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-3e52-aa4b3989ecd1
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-a440-b613024b1000
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-18b6-725ac9d18e8a
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-9017-b49aa0408e3e
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6948-4f9002afa044
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-fdb3-b1897af539a1
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-5ae4-2ad8d97a0cae
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-4d94-b73028966e5b
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-b51b-e2d0d0731856
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-9436-71892ff3ecd4
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6a1f-afc26abc2941
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-8a6f-786049a25153
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-54bb-4a2e7eca9f59
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-46e6-13e8feb6c567
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-2ff3-f9154bd88197
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-17c5-02fa48cbb6fd
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-63d4-8ed1b0b9db64
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-cd94-294cd784233b
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-cbf4-9f83b0ad4f41
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-ceae-2e0af38c34e7
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-1997-fd3ef38151af
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-4dc8-408426129225
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-93e1-361f5643ade7
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-9767-8d7566888dc3
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-83e5-670cdbcb429b
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6649-2d17617ec774
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-eb5f-8a9e5e88d461
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-1e61-446ad9aa60e3
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-10bc-b922912a4d64
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-8903-29af5cf3c18d
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-7c0c-20b70c5c216b
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-4d03-59d57c333364
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-f816-aa6209495cca
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-7cf4-0ffca6f13849
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-0879-3741fb70c9c1
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-ad2b-31f0750bd5c5
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-4b5e-fc59ee24fb08
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-dd6b-920ebe076cca
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-6d83-578bd45cb244
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-37f9-ae8526578813
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-f90f-20da99af285f
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-e43d-4fb0827050e1
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-9404-3c827fcb4e84
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-0939-dac29379cb12
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-a200-855bb74241cc
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-1aff-9bbf1597a079
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-7f26-8dd81e3f0aea
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-8ccb-a5b4c718e370
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-cb4d-14389b350e29
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-f281-9228f8b557cc
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-4a1c-1c35f3ee76d8
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-f27c-d6b2d341ed89
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-029f-03c473ab8035
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-66b6-0be8305b8b5f
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-756f-cfd1ace0ad1b
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-df15-d45a94fff0cf
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-86ee-c09807dd8858
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-4c27-ea698bbeffee
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-0484-56355c491cac
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-3675-e1cfa0ebcec9
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-0474-f64c4aa0556f
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-5eb5-ff3aedd06952
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-08a9-1c26963b1b38
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-ecf5-591bfddd3df2
00020000-55bf-2cad-6bc0-2d3854d009a8	00030000-55bf-2cac-bb4b-7e13270c8bad
\.


--
-- TOC entry 2994 (class 0 OID 11449018)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11449049)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11449163)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55bf-2cae-997b-fa18ff13fefc	00090000-55bf-2cae-16be-7c2b4de97829	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55bf-2cae-cef4-8ef3e5613cbf	00090000-55bf-2cae-3d50-529f46fdfb8f	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55bf-2cae-035c-2f56e9c90f50	00090000-55bf-2cae-9332-6b0c83adad75	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2971 (class 0 OID 11448783)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55bf-2cad-fb3d-2117415c925a	00040000-55bf-2cac-2c64-6de78a8185e9	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-2cad-7aea-baefca9b1d53	00040000-55bf-2cac-2c64-6de78a8185e9	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55bf-2cad-7e0b-03706947ca3a	00040000-55bf-2cac-2c64-6de78a8185e9	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-2cad-2b87-a4a591c064d7	00040000-55bf-2cac-2c64-6de78a8185e9	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-2cad-730b-0ff17e46e21b	00040000-55bf-2cac-2c64-6de78a8185e9	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-2cad-0628-7833b620a672	00040000-55bf-2cab-2b52-8a1a50b3388a	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-2cad-c8e5-c5884e0f9476	00040000-55bf-2cab-f1a4-fa7f7fb913d0	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-2cad-e3ee-4cfefd1a266f	00040000-55bf-2cab-729a-38072f904da2	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55bf-2cae-ea6d-954a383a0c5a	00040000-55bf-2cac-2c64-6de78a8185e9	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2973 (class 0 OID 11448818)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55bf-2cac-3198-8d5b2f6c9569	8341	Adlešiči
00050000-55bf-2cac-9643-40a7bc326d9d	5270	Ajdovščina
00050000-55bf-2cac-6ce6-43f292afd05c	6280	Ankaran/Ancarano
00050000-55bf-2cac-c979-eb2a9a0988e5	9253	Apače
00050000-55bf-2cac-d58c-1b3c73f186ac	8253	Artiče
00050000-55bf-2cac-95e7-2fac804ecd30	4275	Begunje na Gorenjskem
00050000-55bf-2cac-7a9c-ddbd29b4e56e	1382	Begunje pri Cerknici
00050000-55bf-2cac-09aa-d746ec534b51	9231	Beltinci
00050000-55bf-2cac-8e81-03d06c1989e9	2234	Benedikt
00050000-55bf-2cac-65ab-1c007264d57d	2345	Bistrica ob Dravi
00050000-55bf-2cac-cff3-277e89497ea1	3256	Bistrica ob Sotli
00050000-55bf-2cac-3ee7-15b9e66ecbb7	8259	Bizeljsko
00050000-55bf-2cac-ff22-1696d717b40d	1223	Blagovica
00050000-55bf-2cac-0a59-7c893f2e20be	8283	Blanca
00050000-55bf-2cac-569b-b0b34afbad03	4260	Bled
00050000-55bf-2cac-7c38-0442c58cec58	4273	Blejska Dobrava
00050000-55bf-2cac-38bc-47327b86d29b	9265	Bodonci
00050000-55bf-2cac-76da-0fba7a176736	9222	Bogojina
00050000-55bf-2cac-928e-0ddbf3792438	4263	Bohinjska Bela
00050000-55bf-2cac-3f23-8ce5dae91479	4264	Bohinjska Bistrica
00050000-55bf-2cac-b50f-fb0b9406cade	4265	Bohinjsko jezero
00050000-55bf-2cac-0d65-d02f95d43be6	1353	Borovnica
00050000-55bf-2cac-cfea-571ff0982981	8294	Boštanj
00050000-55bf-2cac-cabd-1f467b7f0154	5230	Bovec
00050000-55bf-2cac-febf-fde6e97202ca	5295	Branik
00050000-55bf-2cac-c8b1-2d5202f509a8	3314	Braslovče
00050000-55bf-2cac-cddd-0b2549946966	5223	Breginj
00050000-55bf-2cac-8c20-d285c99e09f3	8280	Brestanica
00050000-55bf-2cac-3bd7-6987504934d9	2354	Bresternica
00050000-55bf-2cac-56a8-1cb8ffbb7d17	4243	Brezje
00050000-55bf-2cac-155f-08f0bfc9ae5e	1351	Brezovica pri Ljubljani
00050000-55bf-2cac-b561-da15b76dfc1a	8250	Brežice
00050000-55bf-2cac-9c97-27825b7c286d	4210	Brnik - Aerodrom
00050000-55bf-2cac-1d4d-42c53331f2a5	8321	Brusnice
00050000-55bf-2cac-95c7-fc5cc7a0fcb1	3255	Buče
00050000-55bf-2cac-67a2-980547642857	8276	Bučka 
00050000-55bf-2cac-f3e1-b95dd8b6bcf7	9261	Cankova
00050000-55bf-2cac-cd70-4585e6d52046	3000	Celje 
00050000-55bf-2cac-9516-a9c77e875a52	3001	Celje - poštni predali
00050000-55bf-2cac-6ecc-509e56aaa5e4	4207	Cerklje na Gorenjskem
00050000-55bf-2cac-17e1-c181b30f8d8c	8263	Cerklje ob Krki
00050000-55bf-2cac-116a-bb30a8cb80a6	1380	Cerknica
00050000-55bf-2cac-56e4-797a65e2fb3a	5282	Cerkno
00050000-55bf-2cac-88cd-3b1d0b143651	2236	Cerkvenjak
00050000-55bf-2cac-f749-f264d14a9dfd	2215	Ceršak
00050000-55bf-2cac-2366-5b0a06dd6961	2326	Cirkovce
00050000-55bf-2cac-dc26-3fcc5402bc13	2282	Cirkulane
00050000-55bf-2cac-7412-966043e5579a	5273	Col
00050000-55bf-2cac-b665-bdc2db52af75	8251	Čatež ob Savi
00050000-55bf-2cac-87a8-8cc74d000584	1413	Čemšenik
00050000-55bf-2cac-3088-04742f30bf08	5253	Čepovan
00050000-55bf-2cac-3570-8382e4c7e512	9232	Črenšovci
00050000-55bf-2cac-81aa-bd06c25fdff9	2393	Črna na Koroškem
00050000-55bf-2cac-cd38-d2289b850767	6275	Črni Kal
00050000-55bf-2cac-620c-41696a9ae0a7	5274	Črni Vrh nad Idrijo
00050000-55bf-2cac-77a1-031aab7b6286	5262	Črniče
00050000-55bf-2cac-0bc0-0e59417c24de	8340	Črnomelj
00050000-55bf-2cac-6314-0cc2570145f3	6271	Dekani
00050000-55bf-2cac-7b4f-7d7e106f4223	5210	Deskle
00050000-55bf-2cac-33cd-c0e9b3ba48f1	2253	Destrnik
00050000-55bf-2cac-a8d9-144bcb749b38	6215	Divača
00050000-55bf-2cac-06b8-1e7c58ffbcdc	1233	Dob
00050000-55bf-2cac-276c-7651b0bffca0	3224	Dobje pri Planini
00050000-55bf-2cac-8c19-6d2fb13cf8e7	8257	Dobova
00050000-55bf-2cac-9bf6-b96f29cd5e79	1423	Dobovec
00050000-55bf-2cac-e452-1a9c36ae5b24	5263	Dobravlje
00050000-55bf-2cac-d939-1ab01c8b8b2e	3204	Dobrna
00050000-55bf-2cac-fda0-ac65f01a8023	8211	Dobrnič
00050000-55bf-2cac-48fc-9d20f437c0e4	1356	Dobrova
00050000-55bf-2cac-4e37-1c7160dada56	9223	Dobrovnik/Dobronak 
00050000-55bf-2cac-d27b-a7a609cb93a9	5212	Dobrovo v Brdih
00050000-55bf-2cac-1717-5b31841eb298	1431	Dol pri Hrastniku
00050000-55bf-2cac-8b5b-1bfe86f47dcf	1262	Dol pri Ljubljani
00050000-55bf-2cac-189b-de13fd8d36eb	1273	Dole pri Litiji
00050000-55bf-2cac-37d2-444c8edf8841	1331	Dolenja vas
00050000-55bf-2cac-6647-6f1566decb66	8350	Dolenjske Toplice
00050000-55bf-2cac-49f6-3580774cbb02	1230	Domžale
00050000-55bf-2cac-af8d-95e58dc2ce09	2252	Dornava
00050000-55bf-2cac-4c72-3c612a028c2f	5294	Dornberk
00050000-55bf-2cac-6ef0-a102b3af1517	1319	Draga
00050000-55bf-2cac-c05a-39ebb5203640	8343	Dragatuš
00050000-55bf-2cac-70c9-430190164a1c	3222	Dramlje
00050000-55bf-2cac-7203-d19d94eb1b2f	2370	Dravograd
00050000-55bf-2cac-0eeb-09d557daf6c9	4203	Duplje
00050000-55bf-2cac-7075-232473a8745b	6221	Dutovlje
00050000-55bf-2cac-877a-0e3434f29de4	8361	Dvor
00050000-55bf-2cac-ba73-a53a61c007f9	2343	Fala
00050000-55bf-2cac-94de-e840992fea32	9208	Fokovci
00050000-55bf-2cac-298f-00d09dc22494	2313	Fram
00050000-55bf-2cac-b16e-3e90b751cf7d	3213	Frankolovo
00050000-55bf-2cac-a22b-b9ced1e02cf8	1274	Gabrovka
00050000-55bf-2cac-e872-01fa506dc3b7	8254	Globoko
00050000-55bf-2cac-8402-c2c95c3f2fad	5275	Godovič
00050000-55bf-2cac-96fb-ecbfaa23be4c	4204	Golnik
00050000-55bf-2cac-996c-bef65b13b007	3303	Gomilsko
00050000-55bf-2cac-3fcb-d7d11ace6a6f	4224	Gorenja vas
00050000-55bf-2cac-30b9-ffc6a37875c6	3263	Gorica pri Slivnici
00050000-55bf-2cac-9238-b3b133d65724	2272	Gorišnica
00050000-55bf-2cac-c490-dd4cbb305825	9250	Gornja Radgona
00050000-55bf-2cac-79f3-5c7b46b0f1b0	3342	Gornji Grad
00050000-55bf-2cac-83f9-dae6119dce86	4282	Gozd Martuljek
00050000-55bf-2cac-6602-bf7f4f81e1bb	6272	Gračišče
00050000-55bf-2cac-c648-37aa651577fe	9264	Grad
00050000-55bf-2cac-59d5-1465df447601	8332	Gradac
00050000-55bf-2cac-c8a4-b2f25fd24780	1384	Grahovo
00050000-55bf-2cac-e6e7-75069c2f44ba	5242	Grahovo ob Bači
00050000-55bf-2cac-73a6-e7caa88423f4	5251	Grgar
00050000-55bf-2cac-9e6a-8bf0715e750f	3302	Griže
00050000-55bf-2cac-6dec-f98be310221b	3231	Grobelno
00050000-55bf-2cac-8e26-52657cca45ed	1290	Grosuplje
00050000-55bf-2cac-1a50-5a4e83557eb7	2288	Hajdina
00050000-55bf-2cac-1353-ba82f624421c	8362	Hinje
00050000-55bf-2cac-4b5e-7d6ac660a3e2	2311	Hoče
00050000-55bf-2cac-5282-045b610a0817	9205	Hodoš/Hodos
00050000-55bf-2cac-1cbe-e184f4dbba84	1354	Horjul
00050000-55bf-2cac-141d-d6b6eb978f64	1372	Hotedršica
00050000-55bf-2cac-b519-c78db2cac5d3	1430	Hrastnik
00050000-55bf-2cac-d824-3372b2ba6704	6225	Hruševje
00050000-55bf-2cac-8741-290b30cdc9ae	4276	Hrušica
00050000-55bf-2cac-d091-3734e7678058	5280	Idrija
00050000-55bf-2cac-2ec3-20f81efe00e5	1292	Ig
00050000-55bf-2cac-c0c9-589934cc8458	6250	Ilirska Bistrica
00050000-55bf-2cac-c15a-74f590d5126f	6251	Ilirska Bistrica-Trnovo
00050000-55bf-2cac-b1ca-8e3f470b17cc	1295	Ivančna Gorica
00050000-55bf-2cac-d5f9-c974aa476fc5	2259	Ivanjkovci
00050000-55bf-2cac-61b9-f2f50365c9d5	1411	Izlake
00050000-55bf-2cac-6a4c-783ab8959dac	6310	Izola/Isola
00050000-55bf-2cac-0909-94df47234543	2222	Jakobski Dol
00050000-55bf-2cac-f96d-cb4a9663dcac	2221	Jarenina
00050000-55bf-2cac-8f7a-f97c4add84aa	6254	Jelšane
00050000-55bf-2cac-f464-fb977f0eb005	4270	Jesenice
00050000-55bf-2cac-0140-9e3e76bf1449	8261	Jesenice na Dolenjskem
00050000-55bf-2cac-67cc-219c65914b9d	3273	Jurklošter
00050000-55bf-2cac-5a3e-38221ef2bd82	2223	Jurovski Dol
00050000-55bf-2cac-4963-df8bcc83a418	2256	Juršinci
00050000-55bf-2cac-b0bc-7319bfc1f208	5214	Kal nad Kanalom
00050000-55bf-2cac-7c3a-69912faf5983	3233	Kalobje
00050000-55bf-2cac-6191-bc63502933a0	4246	Kamna Gorica
00050000-55bf-2cac-76bf-6739a39867cb	2351	Kamnica
00050000-55bf-2cac-1811-f982213e8acf	1241	Kamnik
00050000-55bf-2cac-b56e-a4206be0afcb	5213	Kanal
00050000-55bf-2cac-30bb-d1cc71aba581	8258	Kapele
00050000-55bf-2cac-d10f-4e8cc22c1775	2362	Kapla
00050000-55bf-2cac-0325-18c7c4d1443d	2325	Kidričevo
00050000-55bf-2cac-eea3-90461b429103	1412	Kisovec
00050000-55bf-2cac-d6fe-4d2f517fb23b	6253	Knežak
00050000-55bf-2cac-3284-88289dd4625a	5222	Kobarid
00050000-55bf-2cac-b83b-59f948998e9f	9227	Kobilje
00050000-55bf-2cac-c8a1-c94d80f718e1	1330	Kočevje
00050000-55bf-2cac-275e-0b690e73dac9	1338	Kočevska Reka
00050000-55bf-2cac-b6d8-4fd847034d3b	2276	Kog
00050000-55bf-2cac-1343-f29b3ea8f31e	5211	Kojsko
00050000-55bf-2cac-6435-780c2cd4dcaa	6223	Komen
00050000-55bf-2cac-6dd7-c5ef7edcd0a4	1218	Komenda
00050000-55bf-2cac-4dbd-5a528d01ece7	6000	Koper/Capodistria 
00050000-55bf-2cac-d62b-07447ee6a808	6001	Koper/Capodistria - poštni predali
00050000-55bf-2cac-d202-5d06501a4dda	8282	Koprivnica
00050000-55bf-2cac-a2fd-8fab17016185	5296	Kostanjevica na Krasu
00050000-55bf-2cac-beb7-324f5ea5fa8d	8311	Kostanjevica na Krki
00050000-55bf-2cac-9c98-831d11a9f27c	1336	Kostel
00050000-55bf-2cac-37be-eea3433977e7	6256	Košana
00050000-55bf-2cac-1904-92bfa42f8093	2394	Kotlje
00050000-55bf-2cac-9e8d-659d7d38cae8	6240	Kozina
00050000-55bf-2cac-cfb9-20d1aa715439	3260	Kozje
00050000-55bf-2cac-8815-8f09aa697533	4000	Kranj 
00050000-55bf-2cac-ee89-57859310f536	4001	Kranj - poštni predali
00050000-55bf-2cac-fccc-ea9ebc74cee2	4280	Kranjska Gora
00050000-55bf-2cac-99ac-e79e2c485448	1281	Kresnice
00050000-55bf-2cac-94a3-3626de91c62c	4294	Križe
00050000-55bf-2cac-3545-c8685f17a3a5	9206	Križevci
00050000-55bf-2cac-c396-1ee59090adba	9242	Križevci pri Ljutomeru
00050000-55bf-2cac-662e-98c69fd60d75	1301	Krka
00050000-55bf-2cac-0ff2-6e6c7bfd45f1	8296	Krmelj
00050000-55bf-2cac-90f3-c378e96074a8	4245	Kropa
00050000-55bf-2cac-2c6a-4e035a6f8ab2	8262	Krška vas
00050000-55bf-2cac-686b-dab3fedcb4dc	8270	Krško
00050000-55bf-2cac-09bc-a1280dc9e467	9263	Kuzma
00050000-55bf-2cac-6d81-233dfd25ec00	2318	Laporje
00050000-55bf-2cac-7ef8-844065731267	3270	Laško
00050000-55bf-2cac-b014-dbd261e0e3df	1219	Laze v Tuhinju
00050000-55bf-2cac-064f-7c5a5d0a4087	2230	Lenart v Slovenskih goricah
00050000-55bf-2cac-7489-649316b6c7c8	9220	Lendava/Lendva
00050000-55bf-2cac-5c68-d6315d0ed231	4248	Lesce
00050000-55bf-2cac-64a5-d7a0fa8f67f9	3261	Lesično
00050000-55bf-2cac-8ed6-938efb68d8a4	8273	Leskovec pri Krškem
00050000-55bf-2cac-2ffd-34ee6861d5e0	2372	Libeliče
00050000-55bf-2cac-e174-c8df3b1f5b11	2341	Limbuš
00050000-55bf-2cac-1779-2ef3a9c6becb	1270	Litija
00050000-55bf-2cac-80a0-9ef08ce30e7a	3202	Ljubečna
00050000-55bf-2cac-dd35-64ae9ba7992c	1000	Ljubljana 
00050000-55bf-2cac-5a5d-b4c547ae5139	1001	Ljubljana - poštni predali
00050000-55bf-2cac-76a8-069e761c1cb3	1231	Ljubljana - Črnuče
00050000-55bf-2cac-2864-48b75d2ad93c	1261	Ljubljana - Dobrunje
00050000-55bf-2cac-b778-1c079d51c835	1260	Ljubljana - Polje
00050000-55bf-2cac-5734-50397b62f113	1210	Ljubljana - Šentvid
00050000-55bf-2cac-ecfc-700a840e7cc7	1211	Ljubljana - Šmartno
00050000-55bf-2cac-e32b-5e51eb13749a	3333	Ljubno ob Savinji
00050000-55bf-2cac-2a40-67cb36dc042d	9240	Ljutomer
00050000-55bf-2cac-3bee-c793a43c4c55	3215	Loče
00050000-55bf-2cac-713c-941f4e3458ad	5231	Log pod Mangartom
00050000-55bf-2cac-6eb7-1ad3ddd4d892	1358	Log pri Brezovici
00050000-55bf-2cac-dfc8-95c0033ef663	1370	Logatec
00050000-55bf-2cac-2c97-3fd526215792	1371	Logatec
00050000-55bf-2cac-2d7b-e237d64f7124	1434	Loka pri Zidanem Mostu
00050000-55bf-2cac-445c-b47d4f5352fb	3223	Loka pri Žusmu
00050000-55bf-2cac-97a4-f3ac0fab68fc	6219	Lokev
00050000-55bf-2cac-1063-74d603df648f	1318	Loški Potok
00050000-55bf-2cac-c3d3-3454bfc39e9d	2324	Lovrenc na Dravskem polju
00050000-55bf-2cac-f7cd-12422ddcc891	2344	Lovrenc na Pohorju
00050000-55bf-2cac-b7e1-113111c17381	3334	Luče
00050000-55bf-2cac-7643-32be2b50c5e6	1225	Lukovica
00050000-55bf-2cac-2f47-20ced232d99f	9202	Mačkovci
00050000-55bf-2cac-f162-6aa136cb63b2	2322	Majšperk
00050000-55bf-2cac-fd19-7737a6854f02	2321	Makole
00050000-55bf-2cac-6f87-32ae7e030fc2	9243	Mala Nedelja
00050000-55bf-2cac-9226-fad078d14846	2229	Malečnik
00050000-55bf-2cac-bce3-e394d991a2bf	6273	Marezige
00050000-55bf-2cac-2e91-0ac562ab1cf6	2000	Maribor 
00050000-55bf-2cac-dc35-6efd44ee5f6c	2001	Maribor - poštni predali
00050000-55bf-2cac-d5a5-dbb759c03ca0	2206	Marjeta na Dravskem polju
00050000-55bf-2cac-a683-04a6f7d4fb69	2281	Markovci
00050000-55bf-2cac-a4fa-7a30d0b744f1	9221	Martjanci
00050000-55bf-2cac-cabc-71fe84fae28a	6242	Materija
00050000-55bf-2cac-b2e2-fc7818a70541	4211	Mavčiče
00050000-55bf-2cac-11bd-4ede733f237c	1215	Medvode
00050000-55bf-2cac-4406-d1ca825184d6	1234	Mengeš
00050000-55bf-2cac-1175-946783ccf2a0	8330	Metlika
00050000-55bf-2cac-b2cf-b41c80e52e14	2392	Mežica
00050000-55bf-2cac-d955-1ce504d136e9	2204	Miklavž na Dravskem polju
00050000-55bf-2cac-2733-d5cb3115f3d7	2275	Miklavž pri Ormožu
00050000-55bf-2cac-4e48-7c47153bfc43	5291	Miren
00050000-55bf-2cac-dcb4-602570e669f7	8233	Mirna
00050000-55bf-2cac-5fb3-35888cac694d	8216	Mirna Peč
00050000-55bf-2cac-8334-b0165d8fc345	2382	Mislinja
00050000-55bf-2cac-0063-9cdac39fba00	4281	Mojstrana
00050000-55bf-2cac-57b8-a43f9005284e	8230	Mokronog
00050000-55bf-2cac-f7d9-ea598db375ca	1251	Moravče
00050000-55bf-2cac-362e-2ae29b82e3f7	9226	Moravske Toplice
00050000-55bf-2cac-0398-84fbc5d51cb1	5216	Most na Soči
00050000-55bf-2cac-3e16-430c940dc09b	1221	Motnik
00050000-55bf-2cac-4eb7-c6a95d4a01d5	3330	Mozirje
00050000-55bf-2cac-d5fd-2b40b8d351ad	9000	Murska Sobota 
00050000-55bf-2cac-0bd2-e9ed97f3148e	9001	Murska Sobota - poštni predali
00050000-55bf-2cac-fd08-2b655788dac3	2366	Muta
00050000-55bf-2cac-d407-12c0a15d8d40	4202	Naklo
00050000-55bf-2cac-2dda-82262eb3842b	3331	Nazarje
00050000-55bf-2cac-29f2-3f81838aa0b6	1357	Notranje Gorice
00050000-55bf-2cac-83d9-142f7df6923c	3203	Nova Cerkev
00050000-55bf-2cac-4de2-2eb63bf6fbb3	5000	Nova Gorica 
00050000-55bf-2cac-ac9b-97260c4abee5	5001	Nova Gorica - poštni predali
00050000-55bf-2cac-0aa0-b541c366dea8	1385	Nova vas
00050000-55bf-2cac-1f1d-540e73708f71	8000	Novo mesto
00050000-55bf-2cac-1ad5-9f5c308299cf	8001	Novo mesto - poštni predali
00050000-55bf-2cac-13d7-f88b80fdc873	6243	Obrov
00050000-55bf-2cac-a54c-092365f434c0	9233	Odranci
00050000-55bf-2cac-7a11-6e811d0ea55d	2317	Oplotnica
00050000-55bf-2cac-6a12-95ff4446ba38	2312	Orehova vas
00050000-55bf-2cac-315e-75c874b81249	2270	Ormož
00050000-55bf-2cac-ee4f-84a3acfedc48	1316	Ortnek
00050000-55bf-2cac-a083-a199976f1805	1337	Osilnica
00050000-55bf-2cac-89e0-9adaa4714f3c	8222	Otočec
00050000-55bf-2cac-89f3-0e40692d0b41	2361	Ožbalt
00050000-55bf-2cac-07a6-72747b501718	2231	Pernica
00050000-55bf-2cac-d57b-fe2a2dd5730c	2211	Pesnica pri Mariboru
00050000-55bf-2cac-19a0-1f4c4af7441b	9203	Petrovci
00050000-55bf-2cac-ec2b-84c7abc5198b	3301	Petrovče
00050000-55bf-2cac-c6c2-d53e260dde60	6330	Piran/Pirano
00050000-55bf-2cac-d7a5-3e2817e062c6	8255	Pišece
00050000-55bf-2cac-ef45-15ff19a8eae1	6257	Pivka
00050000-55bf-2cac-62a6-2920e567beb2	6232	Planina
00050000-55bf-2cac-9b64-912d1905452a	3225	Planina pri Sevnici
00050000-55bf-2cac-ce05-4051ff55b76b	6276	Pobegi
00050000-55bf-2cac-d7fc-2dac698f8d0a	8312	Podbočje
00050000-55bf-2cac-eeed-af3e75676268	5243	Podbrdo
00050000-55bf-2cac-6c50-b4ebf0ef6d65	3254	Podčetrtek
00050000-55bf-2cac-b964-ab4a4514ab73	2273	Podgorci
00050000-55bf-2cac-eb2b-790dbc246496	6216	Podgorje
00050000-55bf-2cac-0a85-62dafed930e5	2381	Podgorje pri Slovenj Gradcu
00050000-55bf-2cac-0f19-598735247815	6244	Podgrad
00050000-55bf-2cac-937f-60c6fe05c018	1414	Podkum
00050000-55bf-2cac-e0e1-1026626ec1f0	2286	Podlehnik
00050000-55bf-2cac-eba0-761387ea4591	5272	Podnanos
00050000-55bf-2cac-295e-356ff3d198a9	4244	Podnart
00050000-55bf-2cac-aa7a-3f0dcfd5c6e8	3241	Podplat
00050000-55bf-2cac-222f-c02527ea5769	3257	Podsreda
00050000-55bf-2cac-f75f-1b12d6cb085b	2363	Podvelka
00050000-55bf-2cac-08f5-21747fae4c03	2208	Pohorje
00050000-55bf-2cac-43cf-938cca76c400	2257	Polenšak
00050000-55bf-2cac-5d9f-7fbdbc9d1ca2	1355	Polhov Gradec
00050000-55bf-2cac-5cf3-137fca742f03	4223	Poljane nad Škofjo Loko
00050000-55bf-2cac-eb78-9e245818bcfb	2319	Poljčane
00050000-55bf-2cac-8355-03f2c0fb0d31	1272	Polšnik
00050000-55bf-2cac-6e79-288ffd05cc4f	3313	Polzela
00050000-55bf-2cac-f762-1d4fb50143c5	3232	Ponikva
00050000-55bf-2cac-bb0b-d7c0cd084340	6320	Portorož/Portorose
00050000-55bf-2cac-ee9a-b10f5f146d39	6230	Postojna
00050000-55bf-2cac-062a-2ad28789392f	2331	Pragersko
00050000-55bf-2cac-a369-d28eec33685c	3312	Prebold
00050000-55bf-2cac-b23a-0f98969179e8	4205	Preddvor
00050000-55bf-2cac-d5ae-b079d0a24b48	6255	Prem
00050000-55bf-2cac-bcf3-383e9fedcf42	1352	Preserje
00050000-55bf-2cac-0f48-b3f6ab88a36b	6258	Prestranek
00050000-55bf-2cac-7a6a-b6bf9249f910	2391	Prevalje
00050000-55bf-2cac-b72d-a66f901e3625	3262	Prevorje
00050000-55bf-2cac-7527-3bfaf722772f	1276	Primskovo 
00050000-55bf-2cac-98b6-cc582e11c6f1	3253	Pristava pri Mestinju
00050000-55bf-2cac-6f35-fdcfbc47b694	9207	Prosenjakovci/Partosfalva
00050000-55bf-2cac-dfac-3fea50eff3ca	5297	Prvačina
00050000-55bf-2cac-4198-53981c02e6eb	2250	Ptuj
00050000-55bf-2cac-6f40-6c5094a57c31	2323	Ptujska Gora
00050000-55bf-2cac-0b8f-741e13459135	9201	Puconci
00050000-55bf-2cac-408e-cf2a6e546d24	2327	Rače
00050000-55bf-2cac-ddf3-328db4dcbcce	1433	Radeče
00050000-55bf-2cac-a6b5-1f154e6d240e	9252	Radenci
00050000-55bf-2cac-99f4-2c12b7f43e8e	2360	Radlje ob Dravi
00050000-55bf-2cac-4eae-8d9964226efb	1235	Radomlje
00050000-55bf-2cac-9faa-471c7442597b	4240	Radovljica
00050000-55bf-2cac-5008-75251efcb2f7	8274	Raka
00050000-55bf-2cac-eb0e-b8363362f0a8	1381	Rakek
00050000-55bf-2cac-f7ec-f564e3a6f5f3	4283	Rateče - Planica
00050000-55bf-2cac-9cbc-d2c5b4e7cb49	2390	Ravne na Koroškem
00050000-55bf-2cac-568f-6228d48a6c6a	9246	Razkrižje
00050000-55bf-2cac-3930-15d5bae5e9eb	3332	Rečica ob Savinji
00050000-55bf-2cac-b39d-822f41770b6d	5292	Renče
00050000-55bf-2cac-2a1c-1885427b15bb	1310	Ribnica
00050000-55bf-2cac-1afc-27d3d0a6f162	2364	Ribnica na Pohorju
00050000-55bf-2cac-a002-e786388eda26	3272	Rimske Toplice
00050000-55bf-2cac-6bb2-b709c62a52c3	1314	Rob
00050000-55bf-2cac-1816-288fb411dfb8	5215	Ročinj
00050000-55bf-2cac-74f1-b3c83a694f45	3250	Rogaška Slatina
00050000-55bf-2cac-8ea8-70c407397552	9262	Rogašovci
00050000-55bf-2cac-f424-dc783d27c59f	3252	Rogatec
00050000-55bf-2cac-b6a4-56b4bd5ac0e8	1373	Rovte
00050000-55bf-2cac-c6df-60ee8cb1028b	2342	Ruše
00050000-55bf-2cac-3762-13c6669fdbb1	1282	Sava
00050000-55bf-2cac-60a5-5151d94782a8	6333	Sečovlje/Sicciole
00050000-55bf-2cac-3af6-5229f5485a4d	4227	Selca
00050000-55bf-2cac-7fa1-5cd6b5b4a74a	2352	Selnica ob Dravi
00050000-55bf-2cac-1478-e34ee6648c3a	8333	Semič
00050000-55bf-2cac-16fe-74f9810370da	8281	Senovo
00050000-55bf-2cac-db99-7058a0a729cb	6224	Senožeče
00050000-55bf-2cac-4776-e4bc512f48c5	8290	Sevnica
00050000-55bf-2cac-0a11-3f01dfbf66e0	6210	Sežana
00050000-55bf-2cac-acb3-f933f5baaa30	2214	Sladki Vrh
00050000-55bf-2cac-4b28-2ff603efe6e2	5283	Slap ob Idrijci
00050000-55bf-2cac-43d7-7bc5b061d848	2380	Slovenj Gradec
00050000-55bf-2cac-e804-f7ca5c7894d0	2310	Slovenska Bistrica
00050000-55bf-2cac-f334-1e6ab9e3d6f7	3210	Slovenske Konjice
00050000-55bf-2cac-e03e-35a74d6d9d07	1216	Smlednik
00050000-55bf-2cac-8790-44c29facbbe1	5232	Soča
00050000-55bf-2cac-8695-09770daba03d	1317	Sodražica
00050000-55bf-2cac-2f8a-71ed7de47cc9	3335	Solčava
00050000-55bf-2cac-09d3-276686ce2b4e	5250	Solkan
00050000-55bf-2cac-b3d0-ddeff8922f6b	4229	Sorica
00050000-55bf-2cac-1ab1-6d78bee04001	4225	Sovodenj
00050000-55bf-2cac-c445-b8c03f02bb75	5281	Spodnja Idrija
00050000-55bf-2cac-2a05-f4012d372116	2241	Spodnji Duplek
00050000-55bf-2cac-7387-f1c400c62802	9245	Spodnji Ivanjci
00050000-55bf-2cac-a4d9-10e33d473340	2277	Središče ob Dravi
00050000-55bf-2cac-383a-470cfd887d33	4267	Srednja vas v Bohinju
00050000-55bf-2cac-eed6-d04045b2e9f4	8256	Sromlje 
00050000-55bf-2cac-5871-31d3f24fab30	5224	Srpenica
00050000-55bf-2cac-f3df-64f00a0e838b	1242	Stahovica
00050000-55bf-2cac-f00a-7db8b057fb0e	1332	Stara Cerkev
00050000-55bf-2cac-0244-30d61a5790e5	8342	Stari trg ob Kolpi
00050000-55bf-2cac-44dc-24cc2e669fb7	1386	Stari trg pri Ložu
00050000-55bf-2cac-9516-c44cb8fe28a4	2205	Starše
00050000-55bf-2cac-70e4-1b8b7839a8a6	2289	Stoperce
00050000-55bf-2cac-3759-e8ab16522452	8322	Stopiče
00050000-55bf-2cac-cf24-61db30335cbd	3206	Stranice
00050000-55bf-2cac-a40f-3f3207681e1f	8351	Straža
00050000-55bf-2cac-4c36-fdf446ce5dbe	1313	Struge
00050000-55bf-2cac-0367-44fa52697395	8293	Studenec
00050000-55bf-2cac-4d51-db35f32d215a	8331	Suhor
00050000-55bf-2cac-3970-a572f5017836	2233	Sv. Ana v Slovenskih goricah
00050000-55bf-2cac-5100-4b7c3f345d9e	2235	Sv. Trojica v Slovenskih goricah
00050000-55bf-2cac-b5f6-c2f52ff7c775	2353	Sveti Duh na Ostrem Vrhu
00050000-55bf-2cac-7f20-18dcea4807b8	9244	Sveti Jurij ob Ščavnici
00050000-55bf-2cac-7957-2075e46d1862	3264	Sveti Štefan
00050000-55bf-2cac-7767-0ce88810380c	2258	Sveti Tomaž
00050000-55bf-2cac-9e2a-ed8c654a9b20	9204	Šalovci
00050000-55bf-2cac-a635-393d1ea25545	5261	Šempas
00050000-55bf-2cac-827f-8fcd98f8fb4f	5290	Šempeter pri Gorici
00050000-55bf-2cac-2a5d-b675d4125004	3311	Šempeter v Savinjski dolini
00050000-55bf-2cac-ba65-42d8bdea8a8d	4208	Šenčur
00050000-55bf-2cac-2c88-94dfe938bd0b	2212	Šentilj v Slovenskih goricah
00050000-55bf-2cac-18cc-b352212017b3	8297	Šentjanž
00050000-55bf-2cac-cfc7-ebb8130b6115	2373	Šentjanž pri Dravogradu
00050000-55bf-2cac-6f85-618f6343e1b0	8310	Šentjernej
00050000-55bf-2cac-d31a-59dcbf2f7b14	3230	Šentjur
00050000-55bf-2cac-35c3-f158938ff487	3271	Šentrupert
00050000-55bf-2cac-3e09-bb15fa3f7227	8232	Šentrupert
00050000-55bf-2cac-ae2a-e824293e8588	1296	Šentvid pri Stični
00050000-55bf-2cac-3cae-467d9375a72c	8275	Škocjan
00050000-55bf-2cac-3dbc-7bc7b9efb7b6	6281	Škofije
00050000-55bf-2cac-c937-ae33bee632f5	4220	Škofja Loka
00050000-55bf-2cac-7db6-f4c2706256d0	3211	Škofja vas
00050000-55bf-2cac-0e69-86e84a2d5153	1291	Škofljica
00050000-55bf-2cac-263b-29f5a5540ec1	6274	Šmarje
00050000-55bf-2cac-1d3f-1aa5cd26627b	1293	Šmarje - Sap
00050000-55bf-2cac-39e7-da33688c0807	3240	Šmarje pri Jelšah
00050000-55bf-2cac-fec4-142bc1b6e7d7	8220	Šmarješke Toplice
00050000-55bf-2cac-a164-bb9492b22da0	2315	Šmartno na Pohorju
00050000-55bf-2cac-4529-3c830342c415	3341	Šmartno ob Dreti
00050000-55bf-2cac-f482-c7564e8692e9	3327	Šmartno ob Paki
00050000-55bf-2cac-03cd-523fd2673af5	1275	Šmartno pri Litiji
00050000-55bf-2cac-b7f3-902984b953b6	2383	Šmartno pri Slovenj Gradcu
00050000-55bf-2cac-f78e-d0137b7aabef	3201	Šmartno v Rožni dolini
00050000-55bf-2cac-0e5f-7f4ac4a4ca4f	3325	Šoštanj
00050000-55bf-2cac-9374-9f38cb55d162	6222	Štanjel
00050000-55bf-2cac-6ea3-7bc31499a026	3220	Štore
00050000-55bf-2cac-c0ec-5e489d2efe7d	3304	Tabor
00050000-55bf-2cac-3d8e-823be3de2363	3221	Teharje
00050000-55bf-2cac-86e8-108c5400192b	9251	Tišina
00050000-55bf-2cac-9560-185a92d413df	5220	Tolmin
00050000-55bf-2cac-9c68-29aa355b59f1	3326	Topolšica
00050000-55bf-2cac-d24f-a30cce8cea21	2371	Trbonje
00050000-55bf-2cac-be68-1787b03f1192	1420	Trbovlje
00050000-55bf-2cac-76f5-425a66ebbf5f	8231	Trebelno 
00050000-55bf-2cac-7491-8abefe08b58c	8210	Trebnje
00050000-55bf-2cac-1fde-c7a36f0f3d02	5252	Trnovo pri Gorici
00050000-55bf-2cac-aa89-c48da533e679	2254	Trnovska vas
00050000-55bf-2cac-b134-fe41ef424886	1222	Trojane
00050000-55bf-2cac-ab84-a001a0bd94a9	1236	Trzin
00050000-55bf-2cac-e123-fe17d24b1cc9	4290	Tržič
00050000-55bf-2cac-677a-32d9e3095638	8295	Tržišče
00050000-55bf-2cac-88d2-7f39d5f08cf6	1311	Turjak
00050000-55bf-2cac-8429-4ab5b0f5f5cd	9224	Turnišče
00050000-55bf-2cac-ab19-b5105c6e4d8a	8323	Uršna sela
00050000-55bf-2cac-447e-9988769db10f	1252	Vače
00050000-55bf-2cac-77df-2647f289e43a	3320	Velenje 
00050000-55bf-2cac-9a01-237ee5ab78ac	3322	Velenje - poštni predali
00050000-55bf-2cac-1221-f1a59915f605	8212	Velika Loka
00050000-55bf-2cac-5e81-ef65c483b11a	2274	Velika Nedelja
00050000-55bf-2cac-54e5-1b85e51f726d	9225	Velika Polana
00050000-55bf-2cac-b76e-9dc9b7ec177a	1315	Velike Lašče
00050000-55bf-2cac-0e17-87ea632bbbac	8213	Veliki Gaber
00050000-55bf-2cac-409e-2c228eea6481	9241	Veržej
00050000-55bf-2cac-25cf-8034dc1170b6	1312	Videm - Dobrepolje
00050000-55bf-2cac-6990-f5cd3c2c2eba	2284	Videm pri Ptuju
00050000-55bf-2cac-81b1-553c22e3f8c1	8344	Vinica
00050000-55bf-2cac-7dda-f0c3f597636c	5271	Vipava
00050000-55bf-2cac-5622-d94fc2f15f78	4212	Visoko
00050000-55bf-2cac-b703-b615bffbb512	1294	Višnja Gora
00050000-55bf-2cac-2e9e-bc2f59d7fa0c	3205	Vitanje
00050000-55bf-2cac-1057-648d2f9f8b43	2255	Vitomarci
00050000-55bf-2cac-9cbc-71bef9d2b473	1217	Vodice
00050000-55bf-2cac-0c24-fdc21f0264b6	3212	Vojnik\t
00050000-55bf-2cac-3c79-e99873f21a3b	5293	Volčja Draga
00050000-55bf-2cac-47d5-7c8e063f8ca3	2232	Voličina
00050000-55bf-2cac-843f-09522f8c3c6b	3305	Vransko
00050000-55bf-2cac-2649-85806d7599c2	6217	Vremski Britof
00050000-55bf-2cac-89cb-c8ed9d51cd08	1360	Vrhnika
00050000-55bf-2cac-6b6e-b4a53629b252	2365	Vuhred
00050000-55bf-2cac-176e-8f26f537d651	2367	Vuzenica
00050000-55bf-2cac-be33-87d7ef8a0099	8292	Zabukovje 
00050000-55bf-2cac-48d8-491a35edcd76	1410	Zagorje ob Savi
00050000-55bf-2cac-d23d-692369ddbb51	1303	Zagradec
00050000-55bf-2cac-e10f-b15cc4e09d2e	2283	Zavrč
00050000-55bf-2cac-48b1-3077f3983426	8272	Zdole 
00050000-55bf-2cac-bf7b-6fe11c1007bb	4201	Zgornja Besnica
00050000-55bf-2cac-61f3-e1d24020e501	2242	Zgornja Korena
00050000-55bf-2cac-0b41-61d2045e1a85	2201	Zgornja Kungota
00050000-55bf-2cac-fa31-4fdd506e35dc	2316	Zgornja Ložnica
00050000-55bf-2cac-d8b4-70fef344d4a3	2314	Zgornja Polskava
00050000-55bf-2cac-6d72-7e4f3c9a1ef5	2213	Zgornja Velka
00050000-55bf-2cac-3d50-73e583b2c965	4247	Zgornje Gorje
00050000-55bf-2cac-4a2b-a97c274ed0a2	4206	Zgornje Jezersko
00050000-55bf-2cac-1734-fa143253a437	2285	Zgornji Leskovec
00050000-55bf-2cac-5237-5cefdb96880d	1432	Zidani Most
00050000-55bf-2cac-de95-97cf156f5bfa	3214	Zreče
00050000-55bf-2cac-38f2-9914683319ac	4209	Žabnica
00050000-55bf-2cac-a2d7-07d38029e893	3310	Žalec
00050000-55bf-2cac-c022-6d392ff55712	4228	Železniki
00050000-55bf-2cac-0303-6205752c25cc	2287	Žetale
00050000-55bf-2cac-137c-189b17d24daa	4226	Žiri
00050000-55bf-2cac-1580-549776724c92	4274	Žirovnica
00050000-55bf-2cac-a571-dab2201a8a31	8360	Žužemberk
\.


--
-- TOC entry 2990 (class 0 OID 11448992)
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
-- TOC entry 2972 (class 0 OID 11448803)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11448881)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 11449004)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 11449306)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11449316)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55bf-2cae-52f5-eb1edaed86b6	00080000-55bf-2cae-ea6d-954a383a0c5a	0900	AK
00190000-55bf-2cae-a9fc-7f45a7064dec	00080000-55bf-2cad-7e0b-03706947ca3a	0987	AK
00190000-55bf-2cae-6659-fdf22e9f4896	00080000-55bf-2cad-7aea-baefca9b1d53	0989	AK
00190000-55bf-2cae-4328-1d5716aff988	00080000-55bf-2cad-2b87-a4a591c064d7	0986	AK
00190000-55bf-2cae-f1a7-c4af37418aae	00080000-55bf-2cad-0628-7833b620a672	0984	AK
00190000-55bf-2cae-0f02-1942f3850e1b	00080000-55bf-2cad-c8e5-c5884e0f9476	0983	AK
00190000-55bf-2cae-eb62-b0834c3295e8	00080000-55bf-2cad-e3ee-4cfefd1a266f	0982	AK
\.


--
-- TOC entry 3014 (class 0 OID 11449287)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55bf-2cae-9172-2ff623cd8c7b	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3017 (class 0 OID 11449324)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 11449033)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55bf-2cad-147a-d2cde1b00307	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55bf-2cad-19c0-8347cd84ed3b	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55bf-2cad-47da-74c10df4ce9d	0003	Kazinska	t	84	Kazinska dvorana
00220000-55bf-2cad-0000-f22b1316997b	0004	Mali oder	t	24	Mali oder 
00220000-55bf-2cad-66ac-f65002451a88	0005	Komorni oder	t	15	Komorni oder
00220000-55bf-2cad-6b09-734674165ac5	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55bf-2cad-6c96-4139833bd64d	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2988 (class 0 OID 11448977)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11448967)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11449152)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 11449101)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 11448675)
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
-- TOC entry 2997 (class 0 OID 11449043)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 11448713)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55bf-2cac-563d-13c6b1a05a53	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55bf-2cac-f0ab-fdeae3285599	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55bf-2cac-3203-2ca650b9d413	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55bf-2cac-86fb-aad8e9b7a5c9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55bf-2cac-fa7c-32c342545d9c	planer	Planer dogodkov v koledarju	t
00020000-55bf-2cac-64d8-05b42c1ee143	kadrovska	Kadrovska služba	t
00020000-55bf-2cac-9fa5-baad8b149323	arhivar	Ažuriranje arhivalij	t
00020000-55bf-2cac-86a7-8247c7d11365	igralec	Igralec	t
00020000-55bf-2cac-f89e-7f0bbf0cdc7c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55bf-2cad-6bc0-2d3854d009a8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2963 (class 0 OID 11448697)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55bf-2cac-b967-2527b6b3e68b	00020000-55bf-2cac-3203-2ca650b9d413
00010000-55bf-2cac-1c09-37443d48fbed	00020000-55bf-2cac-3203-2ca650b9d413
00010000-55bf-2cae-140e-86912b0e29fd	00020000-55bf-2cad-6bc0-2d3854d009a8
\.


--
-- TOC entry 2999 (class 0 OID 11449057)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11448998)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11448948)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 11449365)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55bf-2cac-1f6b-f04f675a8e64	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55bf-2cac-78dc-5ad2b8086846	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55bf-2cac-8406-877d1c28ba63	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55bf-2cac-0188-b38bcc86b3bd	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55bf-2cac-26b6-c936b588a492	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3021 (class 0 OID 11449357)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55bf-2cac-f2f1-d5417cf96a46	00230000-55bf-2cac-0188-b38bcc86b3bd	popa
00240000-55bf-2cac-3a06-53e08b33eb55	00230000-55bf-2cac-0188-b38bcc86b3bd	oseba
00240000-55bf-2cac-27fa-45dbef4f76dc	00230000-55bf-2cac-78dc-5ad2b8086846	prostor
00240000-55bf-2cac-9935-d9cfb2518857	00230000-55bf-2cac-0188-b38bcc86b3bd	besedilo
00240000-55bf-2cac-f45c-c7e0f4e89d3f	00230000-55bf-2cac-0188-b38bcc86b3bd	uprizoritev
00240000-55bf-2cac-6bd0-117f009aaea1	00230000-55bf-2cac-0188-b38bcc86b3bd	funkcija
00240000-55bf-2cac-f679-edcbb06d99e4	00230000-55bf-2cac-0188-b38bcc86b3bd	tipfunkcije
00240000-55bf-2cac-6b47-c3df952decb0	00230000-55bf-2cac-0188-b38bcc86b3bd	alternacija
00240000-55bf-2cac-3f75-f4e0c2a6eed3	00230000-55bf-2cac-1f6b-f04f675a8e64	pogodba
00240000-55bf-2cac-45a4-30f25ce9d832	00230000-55bf-2cac-0188-b38bcc86b3bd	zaposlitev
00240000-55bf-2cac-d99e-57f9261ea8ee	00230000-55bf-2cac-1f6b-f04f675a8e64	programdela
00240000-55bf-2cac-148a-90d3b8311a12	00230000-55bf-2cac-0188-b38bcc86b3bd	zapis
\.


--
-- TOC entry 3020 (class 0 OID 11449352)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11449111)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55bf-2cae-3d0f-357f93b81cf4	000e0000-55bf-2cae-3333-b119cd9f46b4	00080000-55bf-2cad-fb3d-2117415c925a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55bf-2cae-36fb-b0e5ad509541	000e0000-55bf-2cae-3333-b119cd9f46b4	00080000-55bf-2cad-fb3d-2117415c925a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55bf-2cae-4194-fc6f07bf11b4	000e0000-55bf-2cae-3333-b119cd9f46b4	00080000-55bf-2cad-730b-0ff17e46e21b	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55bf-2cae-2214-b68cf04d07e1	000e0000-55bf-2cae-3333-b119cd9f46b4	00080000-55bf-2cad-730b-0ff17e46e21b	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2970 (class 0 OID 11448775)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 11448954)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55bf-2cae-c664-646e1ceefe38	00180000-55bf-2cae-074b-a0f43e667300	000c0000-55bf-2cae-b91c-ace725aa6fcc	00090000-55bf-2cae-e804-a34ec1f75e76	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-2cae-4cd4-a7eccf5ea7f7	00180000-55bf-2cae-074b-a0f43e667300	000c0000-55bf-2cae-5453-a206a70f0cfc	00090000-55bf-2cae-0d04-56925849b3e2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-2cae-088e-07dd3611090c	00180000-55bf-2cae-074b-a0f43e667300	000c0000-55bf-2cae-637c-adf0bd26402f	00090000-55bf-2cae-02e0-d821662c2d04	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-2cae-031d-c8eca7a4fcf2	00180000-55bf-2cae-074b-a0f43e667300	000c0000-55bf-2cae-1c04-e59bb60cf634	00090000-55bf-2cae-5e19-ae5a85ca4332	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-2cae-080d-7d0d4c111653	00180000-55bf-2cae-074b-a0f43e667300	000c0000-55bf-2cae-6c4c-7e077c3d62a4	00090000-55bf-2cae-28cd-4d6a97251b2f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55bf-2cae-17b2-7c1290c2b6e1	00180000-55bf-2cae-de12-52cb16ed7d41	\N	00090000-55bf-2cae-28cd-4d6a97251b2f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3006 (class 0 OID 11449141)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55bf-2cac-c287-42fbbf6f271b	Avtor	Avtorji	Avtorka	umetnik
000f0000-55bf-2cac-7ddd-b6bd32559e61	Priredba	Priredba	Priredba	umetnik
000f0000-55bf-2cac-7e3c-f69687af1743	Prevod	Prevod	Prevod	umetnik
000f0000-55bf-2cac-5d96-de9e1d40b0df	Režija	Režija	Režija	umetnik
000f0000-55bf-2cac-dad3-866d9bffc7ce	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55bf-2cac-6e30-0e7dd31ee73e	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55bf-2cac-1c68-3a4a11a36ffc	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55bf-2cac-cc88-192c8ea48176	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55bf-2cac-0b91-8e54669348c6	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55bf-2cac-b547-531b3e471665	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55bf-2cac-d8ae-f2d52dfafb92	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55bf-2cac-bb60-986bf5696264	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55bf-2cac-4e69-2da5c4265b00	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55bf-2cac-aa09-6ef718d7c63e	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55bf-2cac-bb5b-965642aba5f3	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55bf-2cac-cee6-2fb3c447f1fb	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55bf-2cac-b0fe-57faac926dbd	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55bf-2cac-13cd-d707e58df7a0	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3018 (class 0 OID 11449334)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55bf-2cac-b915-2333235ea39d	01	Velika predstava	f	1.00	1.00
002b0000-55bf-2cac-227a-80b1e1166609	02	Mala predstava	f	0.50	0.50
002b0000-55bf-2cac-4186-f0c91ab1dd2b	03	Mala koprodukcija	t	0.40	1.00
002b0000-55bf-2cac-ae34-db434f80b48d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55bf-2cac-e09c-1ff5e59439e7	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2975 (class 0 OID 11448838)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 11448684)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55bf-2cac-1c09-37443d48fbed	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROjVXwDyfdXm3uNkHQCHCP5U2L.QhDveu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55bf-2cad-b532-13c5b61a807d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55bf-2cad-1452-eb7838166891	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55bf-2cad-8086-0976406e2837	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55bf-2cad-5be6-b1cbf72ec6ac	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55bf-2cad-c918-14716c3322dc	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55bf-2cae-8fd8-e84b1f39b665	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55bf-2cae-ad90-235ca0bbb9bc	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55bf-2cae-2bc7-8ecfb539b963	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55bf-2cae-277f-d75f4e8adae9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55bf-2cae-140e-86912b0e29fd	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55bf-2cac-b967-2527b6b3e68b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3010 (class 0 OID 11449189)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55bf-2cae-c59e-e289aea6f076	00160000-55bf-2cad-497a-7d2ba3bd2596	00150000-55bf-2cac-e3e3-9c5bd2c3bb30	00140000-55bf-2cab-c677-3751c5671809	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55bf-2cad-66ac-f65002451a88
000e0000-55bf-2cae-3333-b119cd9f46b4	00160000-55bf-2cad-746f-80b31aaab496	00150000-55bf-2cac-8e84-c6e1860cbc6a	00140000-55bf-2cab-5523-0c87d81b0252	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55bf-2cad-6b09-734674165ac5
000e0000-55bf-2cae-c7e9-50d58dbba9c3	\N	00150000-55bf-2cac-8e84-c6e1860cbc6a	00140000-55bf-2cab-5523-0c87d81b0252	00190000-55bf-2cae-a9fc-7f45a7064dec	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55bf-2cad-66ac-f65002451a88
000e0000-55bf-2cae-6572-27f7ab2c0d73	\N	00150000-55bf-2cac-8e84-c6e1860cbc6a	00140000-55bf-2cab-5523-0c87d81b0252	00190000-55bf-2cae-a9fc-7f45a7064dec	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55bf-2cad-66ac-f65002451a88
000e0000-55bf-2cae-2a5a-08c4f8078106	\N	00150000-55bf-2cac-8e84-c6e1860cbc6a	00140000-55bf-2cab-5523-0c87d81b0252	00190000-55bf-2cae-a9fc-7f45a7064dec	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55bf-2cad-147a-d2cde1b00307
\.


--
-- TOC entry 2980 (class 0 OID 11448900)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55bf-2cae-8eae-83aca4022b12	000e0000-55bf-2cae-3333-b119cd9f46b4	1	
00200000-55bf-2cae-a21b-dd882ce72b09	000e0000-55bf-2cae-3333-b119cd9f46b4	2	
\.


--
-- TOC entry 2995 (class 0 OID 11449025)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11449404)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11449376)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11449416)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 11449094)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55bf-2cae-df3d-386d1ee2ee50	00090000-55bf-2cae-0d04-56925849b3e2	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-2cae-abbf-f50f20ef4624	00090000-55bf-2cae-02e0-d821662c2d04	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-2cae-17ed-d5b339734706	00090000-55bf-2cae-8843-78274d664728	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-2cae-90fd-53fe3a2ebdaa	00090000-55bf-2cae-495b-939f324ee6d9	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-2cae-e92e-fc88276981f2	00090000-55bf-2cae-e804-a34ec1f75e76	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55bf-2cae-996e-af8c3e4d8121	00090000-55bf-2cae-4801-626d445a353d	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2982 (class 0 OID 11448932)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11449179)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55bf-2cab-c677-3751c5671809	01	Drama	drama (SURS 01)
00140000-55bf-2cab-ef7d-bc9cc35bd974	02	Opera	opera (SURS 02)
00140000-55bf-2cab-a7ec-eaa2133923ea	03	Balet	balet (SURS 03)
00140000-55bf-2cab-3bd9-0f7a5ed79f8e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55bf-2cab-1143-1d84b78b4ba0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55bf-2cab-5523-0c87d81b0252	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55bf-2cab-bbf0-155ac46ef479	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3001 (class 0 OID 11449084)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55bf-2cac-db03-8717b8192a72	01	Opera	opera
00150000-55bf-2cac-36fb-5cba35af4f9e	02	Opereta	opereta
00150000-55bf-2cac-c8ba-7e6aa98ee572	03	Balet	balet
00150000-55bf-2cac-dc15-344de2bc9fd4	04	Plesne prireditve	plesne prireditve
00150000-55bf-2cac-a23e-ec433c78d41f	05	Lutkovno gledališče	lutkovno gledališče
00150000-55bf-2cac-b26f-3720846c1d1a	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55bf-2cac-03cf-03584ac84364	07	Biografska drama	biografska drama
00150000-55bf-2cac-e3e3-9c5bd2c3bb30	08	Komedija	komedija
00150000-55bf-2cac-f1a5-0bb894210dad	09	Črna komedija	črna komedija
00150000-55bf-2cac-2aa1-a33a2077f395	10	E-igra	E-igra
00150000-55bf-2cac-8e84-c6e1860cbc6a	11	Kriminalka	kriminalka
00150000-55bf-2cac-8783-f7e3c1efe677	12	Musical	musical
\.


--
-- TOC entry 2507 (class 2606 OID 11448738)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 11449236)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11449226)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11449140)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11449457)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11448922)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 11448947)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11449350)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11448864)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 11449281)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11449080)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11448898)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11448941)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 11448878)
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
-- TOC entry 2599 (class 2606 OID 11448990)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 11449433)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 11449440)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2747 (class 2606 OID 11449465)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11449017)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 11448836)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 11448747)
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
-- TOC entry 2514 (class 2606 OID 11448771)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 11448727)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2498 (class 2606 OID 11448712)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 11449023)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11449056)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 11449174)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 11448800)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 11448824)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 11448996)
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
-- TOC entry 2529 (class 2606 OID 11448814)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 11448885)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 11449008)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 11449313)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11449321)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 11449304)
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
-- TOC entry 2705 (class 2606 OID 11449332)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11449040)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 11448981)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 11448972)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11449162)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 11449108)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 11448683)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 11449047)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 11448701)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2500 (class 2606 OID 11448721)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 11449065)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11449003)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11448953)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 11449374)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 11449362)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 11449356)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 11449121)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 11448780)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 11448963)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11449151)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 11449344)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 11448849)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11448696)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 11449205)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 11448907)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 11449031)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 11449414)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 11449398)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 11449422)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 11449099)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 11448936)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 11449187)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 11449092)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 11448929)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2647 (class 1259 OID 11449122)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2648 (class 1259 OID 11449123)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2733 (class 1259 OID 11449435)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2734 (class 1259 OID 11449434)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2521 (class 1259 OID 11448802)
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
-- TOC entry 2612 (class 1259 OID 11449024)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2720 (class 1259 OID 11449402)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2721 (class 1259 OID 11449401)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2722 (class 1259 OID 11449403)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2723 (class 1259 OID 11449400)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2724 (class 1259 OID 11449399)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 11449010)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 11449009)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 11448908)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 11449081)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 11449083)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2636 (class 1259 OID 11449082)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2546 (class 1259 OID 11448880)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 11448879)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2703 (class 1259 OID 11449333)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2657 (class 1259 OID 11449176)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2658 (class 1259 OID 11449177)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2659 (class 1259 OID 11449178)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2730 (class 1259 OID 11449423)
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
-- TOC entry 2666 (class 1259 OID 11449210)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2667 (class 1259 OID 11449207)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2668 (class 1259 OID 11449211)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2669 (class 1259 OID 11449209)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2670 (class 1259 OID 11449208)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2536 (class 1259 OID 11448851)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 11448850)
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
-- TOC entry 2512 (class 1259 OID 11448774)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 11449048)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2576 (class 1259 OID 11448942)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2502 (class 1259 OID 11448728)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2503 (class 1259 OID 11448729)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2627 (class 1259 OID 11449068)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2628 (class 1259 OID 11449067)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 11449066)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2550 (class 1259 OID 11448886)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 11448888)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2552 (class 1259 OID 11448887)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2713 (class 1259 OID 11449364)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 11448976)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 11448974)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 11448973)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 11448975)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2493 (class 1259 OID 11448702)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2494 (class 1259 OID 11448703)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 11449032)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2743 (class 1259 OID 11449458)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2744 (class 1259 OID 11449466)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2745 (class 1259 OID 11449467)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 11448997)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2643 (class 1259 OID 11449109)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2644 (class 1259 OID 11449110)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2687 (class 1259 OID 11449286)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2688 (class 1259 OID 11449285)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2689 (class 1259 OID 11449282)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2690 (class 1259 OID 11449283)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2691 (class 1259 OID 11449284)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2525 (class 1259 OID 11448816)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 11448815)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2527 (class 1259 OID 11448817)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2486 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2695 (class 1259 OID 11449314)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2696 (class 1259 OID 11449315)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2680 (class 1259 OID 11449240)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2681 (class 1259 OID 11449241)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2682 (class 1259 OID 11449238)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2683 (class 1259 OID 11449239)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2640 (class 1259 OID 11449100)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 11448985)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 11448984)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 11448982)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 11448983)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2464 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2676 (class 1259 OID 11449228)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2677 (class 1259 OID 11449227)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2692 (class 1259 OID 11449305)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2557 (class 1259 OID 11448899)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2710 (class 1259 OID 11449351)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2737 (class 1259 OID 11449441)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2738 (class 1259 OID 11449442)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2508 (class 1259 OID 11448749)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2509 (class 1259 OID 11448748)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2517 (class 1259 OID 11448781)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 11448782)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2581 (class 1259 OID 11448966)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 11448965)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 11448964)
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
-- TOC entry 2564 (class 1259 OID 11448931)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2565 (class 1259 OID 11448927)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2566 (class 1259 OID 11448924)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2567 (class 1259 OID 11448925)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2568 (class 1259 OID 11448923)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2569 (class 1259 OID 11448928)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2570 (class 1259 OID 11448926)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2524 (class 1259 OID 11448801)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 11448865)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 11448867)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2544 (class 1259 OID 11448866)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2545 (class 1259 OID 11448868)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 11448991)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 11449175)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 11449206)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2515 (class 1259 OID 11448772)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2516 (class 1259 OID 11448773)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2637 (class 1259 OID 11449093)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 11449375)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 11448837)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2716 (class 1259 OID 11449363)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2620 (class 1259 OID 11449042)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2621 (class 1259 OID 11449041)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2684 (class 1259 OID 11449237)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2532 (class 1259 OID 11448825)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 11449188)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2727 (class 1259 OID 11449415)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2701 (class 1259 OID 11449322)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 11449323)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2501 (class 1259 OID 11448722)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2571 (class 1259 OID 11448930)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2773 (class 2606 OID 11449603)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2776 (class 2606 OID 11449588)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2775 (class 2606 OID 11449593)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2771 (class 2606 OID 11449613)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2777 (class 2606 OID 11449583)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2772 (class 2606 OID 11449608)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2774 (class 2606 OID 11449598)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2807 (class 2606 OID 11449758)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 11449763)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 11449933)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2841 (class 2606 OID 11449928)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 11449518)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2794 (class 2606 OID 11449698)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2835 (class 2606 OID 11449913)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2836 (class 2606 OID 11449908)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2834 (class 2606 OID 11449918)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2837 (class 2606 OID 11449903)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2838 (class 2606 OID 11449898)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2792 (class 2606 OID 11449693)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2793 (class 2606 OID 11449688)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2770 (class 2606 OID 11449578)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11449728)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 11449738)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2801 (class 2606 OID 11449733)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2764 (class 2606 OID 11449553)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11449548)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 11449678)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2831 (class 2606 OID 11449883)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2810 (class 2606 OID 11449768)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2809 (class 2606 OID 11449773)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2808 (class 2606 OID 11449778)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2839 (class 2606 OID 11449923)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2812 (class 2606 OID 11449798)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2815 (class 2606 OID 11449783)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2811 (class 2606 OID 11449803)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2813 (class 2606 OID 11449793)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2814 (class 2606 OID 11449788)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2762 (class 2606 OID 11449543)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11449538)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 11449503)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2755 (class 2606 OID 11449498)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2796 (class 2606 OID 11449708)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2778 (class 2606 OID 11449618)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 11449478)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2750 (class 2606 OID 11449483)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2797 (class 2606 OID 11449723)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2798 (class 2606 OID 11449718)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2799 (class 2606 OID 11449713)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2768 (class 2606 OID 11449558)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2766 (class 2606 OID 11449568)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2767 (class 2606 OID 11449563)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2833 (class 2606 OID 11449893)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2782 (class 2606 OID 11449653)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2784 (class 2606 OID 11449643)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2785 (class 2606 OID 11449638)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2783 (class 2606 OID 11449648)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2749 (class 2606 OID 11449468)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2748 (class 2606 OID 11449473)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2795 (class 2606 OID 11449703)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2844 (class 2606 OID 11449948)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 11449953)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2845 (class 2606 OID 11449958)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2791 (class 2606 OID 11449683)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2805 (class 2606 OID 11449748)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2804 (class 2606 OID 11449753)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2822 (class 2606 OID 11449858)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2823 (class 2606 OID 11449853)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2826 (class 2606 OID 11449838)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2825 (class 2606 OID 11449843)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2824 (class 2606 OID 11449848)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2760 (class 2606 OID 11449528)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 11449523)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 11449533)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2829 (class 2606 OID 11449868)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2828 (class 2606 OID 11449873)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2819 (class 2606 OID 11449828)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 11449833)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2821 (class 2606 OID 11449818)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2820 (class 2606 OID 11449823)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2803 (class 2606 OID 11449743)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 11449673)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2787 (class 2606 OID 11449668)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2789 (class 2606 OID 11449658)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2788 (class 2606 OID 11449663)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2816 (class 2606 OID 11449813)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2817 (class 2606 OID 11449808)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2827 (class 2606 OID 11449863)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2769 (class 2606 OID 11449573)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2830 (class 2606 OID 11449878)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 11449888)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2843 (class 2606 OID 11449938)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2842 (class 2606 OID 11449943)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2752 (class 2606 OID 11449493)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2753 (class 2606 OID 11449488)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2757 (class 2606 OID 11449508)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 11449513)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 11449633)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 11449628)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2781 (class 2606 OID 11449623)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-03 10:56:15 CEST

--
-- PostgreSQL database dump complete
--

