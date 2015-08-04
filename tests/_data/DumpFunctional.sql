--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-04 10:27:51 CEST

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
-- TOC entry 183 (class 1259 OID 11684028)
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
-- TOC entry 228 (class 1259 OID 11684531)
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
-- TOC entry 227 (class 1259 OID 11684514)
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
-- TOC entry 221 (class 1259 OID 11684426)
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
-- TOC entry 244 (class 1259 OID 11684747)
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
-- TOC entry 197 (class 1259 OID 11684207)
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
-- TOC entry 200 (class 1259 OID 11684241)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11684649)
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
-- TOC entry 192 (class 1259 OID 11684150)
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
-- TOC entry 229 (class 1259 OID 11684544)
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
-- TOC entry 216 (class 1259 OID 11684371)
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
-- TOC entry 195 (class 1259 OID 11684187)
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
-- TOC entry 199 (class 1259 OID 11684235)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11684167)
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
-- TOC entry 205 (class 1259 OID 11684288)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11684728)
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
-- TOC entry 243 (class 1259 OID 11684740)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11684763)
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
-- TOC entry 209 (class 1259 OID 11684313)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11684124)
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
-- TOC entry 184 (class 1259 OID 11684037)
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
-- TOC entry 185 (class 1259 OID 11684048)
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
-- TOC entry 180 (class 1259 OID 11684002)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11684021)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11684320)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11684351)
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
-- TOC entry 224 (class 1259 OID 11684465)
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
-- TOC entry 187 (class 1259 OID 11684081)
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
-- TOC entry 189 (class 1259 OID 11684116)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11684294)
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
-- TOC entry 188 (class 1259 OID 11684101)
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
-- TOC entry 194 (class 1259 OID 11684179)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11684306)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11684610)
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
-- TOC entry 232 (class 1259 OID 11684620)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11684591)
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
-- TOC entry 233 (class 1259 OID 11684628)
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
-- TOC entry 212 (class 1259 OID 11684335)
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
-- TOC entry 204 (class 1259 OID 11684279)
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
-- TOC entry 203 (class 1259 OID 11684269)
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
-- TOC entry 223 (class 1259 OID 11684454)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11684403)
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
-- TOC entry 177 (class 1259 OID 11683973)
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
-- TOC entry 176 (class 1259 OID 11683971)
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
-- TOC entry 213 (class 1259 OID 11684345)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11684011)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11683995)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11684359)
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
-- TOC entry 207 (class 1259 OID 11684300)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11684246)
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
-- TOC entry 238 (class 1259 OID 11684669)
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
-- TOC entry 237 (class 1259 OID 11684661)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11684656)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11684413)
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
-- TOC entry 186 (class 1259 OID 11684073)
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
-- TOC entry 202 (class 1259 OID 11684256)
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
-- TOC entry 222 (class 1259 OID 11684443)
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
-- TOC entry 234 (class 1259 OID 11684638)
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
-- TOC entry 191 (class 1259 OID 11684136)
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
-- TOC entry 178 (class 1259 OID 11683982)
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
-- TOC entry 226 (class 1259 OID 11684491)
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
-- TOC entry 196 (class 1259 OID 11684198)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11684327)
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
-- TOC entry 240 (class 1259 OID 11684708)
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
-- TOC entry 239 (class 1259 OID 11684680)
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
-- TOC entry 241 (class 1259 OID 11684720)
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
-- TOC entry 218 (class 1259 OID 11684396)
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
-- TOC entry 198 (class 1259 OID 11684230)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11684481)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11684386)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 11683976)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2971 (class 0 OID 11684028)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11684531)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c0-7787-e98f-da3b130faba3	000d0000-55c0-7786-25cb-6d931268c250	\N	00090000-55c0-7786-63ff-04faa3c971f6	000b0000-55c0-7786-8e37-3c8584d5aa23	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c0-7787-13f7-dfef9dcb184e	000d0000-55c0-7786-c85b-22def092ffda	00100000-55c0-7786-5d17-874a8df4be1a	00090000-55c0-7786-63b5-4241638e8475	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c0-7787-52a0-080ad4b0a011	000d0000-55c0-7786-d979-7232c8e3c62c	00100000-55c0-7786-e2f5-327fc8482cb4	00090000-55c0-7786-1632-ccd971a9593d	\N	0003	t	\N	2015-08-04	\N	2	\N	\N	f	f
000c0000-55c0-7787-819e-2a18ee1f1aae	000d0000-55c0-7786-433c-8dfd84f7813c	\N	00090000-55c0-7786-14a7-9ffbd4130bac	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c0-7787-4ba8-f0cb50764a8e	000d0000-55c0-7786-e7eb-f2343dfaa23b	\N	00090000-55c0-7786-85a7-a7fbf1e5ba5d	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c0-7787-c073-4ca42406a584	000d0000-55c0-7786-27d0-9eb384d64a74	\N	00090000-55c0-7786-e30c-f378f0e8f6b3	000b0000-55c0-7786-6ce8-cc56d7f8468f	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c0-7787-abef-401234a5565b	000d0000-55c0-7786-2eef-a8bc09b55d7b	00100000-55c0-7786-e1b6-436ef44c567c	00090000-55c0-7786-4f5e-62fcfac434b7	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c0-7787-068f-207471db83e7	000d0000-55c0-7786-4254-00ce28101a4c	\N	00090000-55c0-7786-6a24-15466426fbf8	000b0000-55c0-7786-dfa9-6b075d5fb050	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c0-7787-b899-478ee098e12c	000d0000-55c0-7786-2eef-a8bc09b55d7b	00100000-55c0-7786-1398-ddf2aa3348e1	00090000-55c0-7786-ee2e-55de1762bbd1	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c0-7787-e9ab-3c64ef5271e4	000d0000-55c0-7786-2eef-a8bc09b55d7b	00100000-55c0-7786-fb89-6dacdbe76810	00090000-55c0-7786-8a3a-a93631aebbf2	\N	0010	t	\N	2015-08-04	\N	16	\N	\N	f	t
000c0000-55c0-7787-68b5-9a1908262c5d	000d0000-55c0-7786-2eef-a8bc09b55d7b	00100000-55c0-7786-aa17-647a064254f3	00090000-55c0-7786-9b63-0f958895039c	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3015 (class 0 OID 11684514)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11684426)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c0-7786-f4bc-b8d42bdf7391	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c0-7786-b622-959aa46b1b75	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c0-7786-b3f0-ae3d1be9165b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3032 (class 0 OID 11684747)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11684207)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c0-7786-c5fa-df5736453872	\N	\N	00200000-55c0-7786-84ac-89131a4bc1da	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c0-7786-6984-804bc8e56f08	\N	\N	00200000-55c0-7786-e2bc-78b996480605	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c0-7786-42da-7d769fd5c19d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c0-7786-d67d-2b7cd49feb14	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c0-7786-e8f0-87ae4cbccd1f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2988 (class 0 OID 11684241)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11684649)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11684150)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c0-7784-5ac7-ce85815fe977	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c0-7784-aef3-9b1343895c7a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c0-7784-12a3-3b249e521c94	AL	ALB	008	Albania 	Albanija	\N
00040000-55c0-7784-a83c-028ec90e439e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c0-7784-f151-4451eefb4b18	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c0-7784-535e-ebe4aa168e95	AD	AND	020	Andorra 	Andora	\N
00040000-55c0-7784-74d4-0c1b99d811cd	AO	AGO	024	Angola 	Angola	\N
00040000-55c0-7784-8491-3b46fd9c6769	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c0-7784-9ef0-b299993a6452	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c0-7784-d6e3-6984c33af35f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c0-7784-ace3-056940d5846b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c0-7784-314c-6aaad4dfb0b4	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c0-7784-0c24-19ca1256715e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c0-7784-daa0-285f9e15acb1	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c0-7784-e838-4cdca4f2ab64	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c0-7784-ca6e-d82672b42162	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c0-7784-255b-46ce4bf721c7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c0-7784-524d-8904e2b742b0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c0-7784-2540-83e2a5e8cdaf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c0-7784-a880-f0ec7949e674	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c0-7784-1bcc-036744eb3f33	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c0-7784-d78d-b48bdc7ff876	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c0-7784-c440-f2f35df62272	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c0-7785-db4b-68e0cb017253	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c0-7785-d8f5-ef787579f95a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c0-7785-d06a-2cd61330a7e9	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c0-7785-24fe-cd6fac6c22a8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c0-7785-6f91-b34dedbfdd27	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c0-7785-a3b4-025d9ca84bfd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c0-7785-8748-760f3f78b633	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c0-7785-bd72-53acbf07cc89	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c0-7785-a1d4-0c733299b67b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c0-7785-d85e-b866b949abe5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c0-7785-e638-281be2bbea3c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c0-7785-abbf-888753b127b3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c0-7785-db76-42e060f1f4f3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c0-7785-af24-7b86a3bb0c11	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c0-7785-7caa-14327c9adc9a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c0-7785-6f68-ee088f41f908	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c0-7785-7aa7-dacb4a9b56a4	CA	CAN	124	Canada 	Kanada	\N
00040000-55c0-7785-66d7-6c50d91fe8e3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c0-7785-739e-f34c5729e80b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c0-7785-bc6f-0d58eb2382be	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c0-7785-7398-d94a58752a04	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c0-7785-cfa6-b5dfde4c9a30	CL	CHL	152	Chile 	Čile	\N
00040000-55c0-7785-29dc-ac9ad1e83024	CN	CHN	156	China 	Kitajska	\N
00040000-55c0-7785-53a0-d6297c34b5e2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c0-7785-037b-c92c4453aa49	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c0-7785-9c68-b78c3ef48b65	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c0-7785-344e-c62b7f5fdc82	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c0-7785-2e4c-8abefcf1d521	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c0-7785-fa3f-bd9dea759887	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c0-7785-380e-245aae9bcb55	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c0-7785-f4f7-2ce3df8e12ed	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c0-7785-6089-c58c4844aece	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c0-7785-d93e-c54b7c9a6e65	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c0-7785-6f51-0ac376f62d5a	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c0-7785-550e-bb43ae623584	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c0-7785-f420-ee6df4860ce0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c0-7785-2c32-fd27ee15c0e3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c0-7785-f651-e5f3b9daa30c	DK	DNK	208	Denmark 	Danska	\N
00040000-55c0-7785-12bf-1bde47123d56	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c0-7785-5869-8bc418565001	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c0-7785-1876-a6b9f489bec9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c0-7785-f03a-eb9579553d50	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c0-7785-c187-ebc28635e74f	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c0-7785-b7a4-81a62f25dae2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c0-7785-e3d6-0f3e0ef3cba2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c0-7785-538e-7d5443dc8890	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c0-7785-44a7-9fb5c47e5c39	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c0-7785-2825-05035920b415	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c0-7785-c533-894e9859988b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c0-7785-5eec-34194174b8b6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c0-7785-591c-a7ea928405fb	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c0-7785-9b87-ebf2ef505720	FI	FIN	246	Finland 	Finska	\N
00040000-55c0-7785-565f-6ef1e846b8fe	FR	FRA	250	France 	Francija	\N
00040000-55c0-7785-399b-6553c0092451	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c0-7785-6570-8296f9ed65c7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c0-7785-2fba-78cec88c3ffa	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c0-7785-2da3-b96940d55a35	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c0-7785-df3f-a402e89021ef	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c0-7785-6370-7c1a50c27e41	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c0-7785-1410-b782467ca2a0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c0-7785-cf9b-e345886ff8f9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c0-7785-0227-8a501346729a	GH	GHA	288	Ghana 	Gana	\N
00040000-55c0-7785-79ce-8a3555fedf48	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c0-7785-1411-d4bcd0747eff	GR	GRC	300	Greece 	Grčija	\N
00040000-55c0-7785-953c-34aac9ce52d5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c0-7785-00ca-e32482189dcc	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c0-7785-ef3b-01a308602fc0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c0-7785-4c1f-d3eed70bb84e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c0-7785-4264-837049fc49b3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c0-7785-e2ec-ae846764b1cc	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c0-7785-bf54-e4341ebc026d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c0-7785-f0eb-170c3dba40e9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c0-7785-483a-f0d68d2aa77f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c0-7785-61e9-c6e8f89e323f	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c0-7785-92bd-1d94bf318633	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c0-7785-2664-088207ab1a01	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c0-7785-80de-89438a0db986	HN	HND	340	Honduras 	Honduras	\N
00040000-55c0-7785-0a85-ad90a4c4e65a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c0-7785-f8a9-b3e782ae51bb	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c0-7785-9c0d-df902a15eb09	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c0-7785-e277-61aeaef1306c	IN	IND	356	India 	Indija	\N
00040000-55c0-7785-3c9f-dd5f3b895521	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c0-7785-2684-7623586c7053	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c0-7785-6586-a0fd9908a683	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c0-7785-a2ec-061437260462	IE	IRL	372	Ireland 	Irska	\N
00040000-55c0-7785-df5a-4f3da75fad91	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c0-7785-6ab2-ceff3ab89793	IL	ISR	376	Israel 	Izrael	\N
00040000-55c0-7785-a974-9c5af7686e11	IT	ITA	380	Italy 	Italija	\N
00040000-55c0-7785-7ab0-478c0daae352	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c0-7785-846a-31f594f9c0fd	JP	JPN	392	Japan 	Japonska	\N
00040000-55c0-7785-01bc-c18ff8f7460f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c0-7785-8146-20e3735e69e8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c0-7785-df8e-482f5c4489fe	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c0-7785-84ad-db599ee6692f	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c0-7785-5730-af18b278b1ee	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c0-7785-9a36-a5566fa1af59	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c0-7785-30c5-3e855dea5d69	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c0-7785-7444-04abd69c4b95	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c0-7785-97b0-1df60f82659b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c0-7785-74e1-3c03c10922f0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c0-7785-f176-033544310af0	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c0-7785-5867-d14f386fffd0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c0-7785-9ce3-aeb35c02fd12	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c0-7785-764d-cb6f3e670e60	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c0-7785-17e9-8a1d32c1a8ba	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c0-7785-ea79-fae02c5acd3d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c0-7785-2be7-b06add9c036a	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c0-7785-576c-a80e4149d2ff	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c0-7785-24c0-95df68778b1b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c0-7785-bf03-907aca07ef10	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c0-7785-a8c6-ab692ddfb7ab	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c0-7785-12d7-3f4d0e7d48d7	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c0-7785-2b9d-bd450e110e84	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c0-7785-fc87-776cc94a301a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c0-7785-5e22-b43c27c91cb8	ML	MLI	466	Mali 	Mali	\N
00040000-55c0-7785-ee6a-c5773c482b2d	MT	MLT	470	Malta 	Malta	\N
00040000-55c0-7785-b8de-197db0bc213b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c0-7785-5e56-38468c6fe4b1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c0-7785-4ed9-a292da59ac94	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c0-7785-21f2-5c2d96119bcb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c0-7785-3d2f-4ae92b83c871	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c0-7785-18d6-ea90a022d721	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c0-7785-902a-566c2dfcf14f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c0-7785-3b5d-1ab4e4d5080b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c0-7785-e7f3-6cc5df7c653e	MC	MCO	492	Monaco 	Monako	\N
00040000-55c0-7785-ab9f-a658df4b4b53	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c0-7785-79e1-348c9008f223	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c0-7785-debb-3e1dc3bcbdeb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c0-7785-117a-23933dc3ec76	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c0-7785-26e8-46874a21833b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c0-7785-bed4-4c07d10e867e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c0-7785-96b7-ef1216f64bf0	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c0-7785-857e-aadaf88da85d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c0-7785-1358-2f538283a7a5	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c0-7785-2470-36610f706343	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c0-7785-3b09-a86cc7562960	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c0-7785-3f65-6ce8479239ea	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c0-7785-a564-a24f42de905c	NE	NER	562	Niger 	Niger 	\N
00040000-55c0-7785-d826-3595d620404a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c0-7785-20d4-228878820b22	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c0-7785-1d7c-d0d09d37c42d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c0-7785-5719-87d3f297184c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c0-7785-3961-51aacef0fe7f	NO	NOR	578	Norway 	Norveška	\N
00040000-55c0-7785-5b60-e6f20023706e	OM	OMN	512	Oman 	Oman	\N
00040000-55c0-7785-c513-af1c8ff42485	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c0-7785-4976-51f6a4690080	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c0-7785-d6ef-1713495a9ca5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c0-7785-67eb-6babc3f79332	PA	PAN	591	Panama 	Panama	\N
00040000-55c0-7785-438c-87ea56c2e6f7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c0-7785-3cfb-ea8d5ee64056	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c0-7785-5ce8-8c9069bcd2d2	PE	PER	604	Peru 	Peru	\N
00040000-55c0-7785-0900-55de40a43477	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c0-7785-a511-7cca34ecdc7d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c0-7785-27b7-935ca641e005	PL	POL	616	Poland 	Poljska	\N
00040000-55c0-7785-f88f-c022275603fe	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c0-7785-c5ef-21b103d46891	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c0-7785-1c19-c2008277ae15	QA	QAT	634	Qatar 	Katar	\N
00040000-55c0-7785-4ede-ea91fa56afd2	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c0-7785-a5d3-ddb81c2d9287	RO	ROU	642	Romania 	Romunija	\N
00040000-55c0-7785-8129-b498091963f1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c0-7785-bab4-20c46ed75ead	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c0-7785-edc4-6d7e47957a9f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c0-7785-92c5-12cc9c65ee5c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c0-7785-cdff-ff67d0a3af10	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c0-7785-d04a-76ed9b027145	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c0-7785-a735-b59a6e796600	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c0-7785-eea9-8b8f84b30bba	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c0-7785-12d3-d3c3e2cfd9aa	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c0-7785-cfab-b7ab25fcfd51	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c0-7785-f391-ec2c1bfe77d4	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c0-7785-c5a7-f03f26076a82	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c0-7785-0818-6721a3de3043	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c0-7785-598b-c0b505431dde	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c0-7785-cdb6-9a1091ebc51c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c0-7785-749e-43007b35d49e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c0-7785-abbe-031223b62906	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c0-7785-2bf9-23655b413684	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c0-7785-73fc-82a8fc11b5b2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c0-7785-ca10-045beb94db18	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c0-7785-1f5c-7a4981e5181d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c0-7785-7ff1-aaf95c1d5618	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c0-7785-2f74-318ca7d9cd3f	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c0-7785-b661-0a153e475967	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c0-7785-8be8-891af4858601	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c0-7785-6ba3-824d40630a98	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c0-7785-53d9-f24e791d193e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c0-7785-12c9-fcefe8ce9e7f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c0-7785-8eec-119571bce83f	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c0-7785-ef01-a1fbf7df9a41	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c0-7785-cf44-b5d6fb3e3457	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c0-7785-1b9d-f81cf4c84ff1	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c0-7785-c9db-9b3b45454198	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c0-7785-82df-cc1a89a254e0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c0-7785-f877-2cad10610cfa	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c0-7785-7d86-cca732d49642	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c0-7785-2ec8-1bb718283867	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c0-7785-54d1-3375b1005e1b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c0-7785-2ebf-9b446035f0b0	TH	THA	764	Thailand 	Tajska	\N
00040000-55c0-7785-a3dc-5e43dbb7af1f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c0-7785-370b-0d28ad8e0963	TG	TGO	768	Togo 	Togo	\N
00040000-55c0-7785-482b-1eaa13f28b05	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c0-7785-ffc8-dc944112aff0	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c0-7785-6685-1459326ee134	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c0-7785-a796-522a0db1730e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c0-7785-d97e-17eba27869ed	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c0-7785-f52d-89e6b27041f4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c0-7785-b260-bd6f2ffe61bf	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c0-7785-21ec-32b92e622ecf	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c0-7785-47d1-99bf9cfd17ee	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c0-7785-6157-592ddecfcb47	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c0-7785-4ade-527edec503b7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c0-7785-90f9-a6b593952cd2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c0-7785-b3c3-2a6aec247c53	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c0-7785-4fe6-f67f6ae22015	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c0-7785-7234-0244e58381fe	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c0-7785-d426-d3d39ee056dd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c0-7785-bd29-52a828f2585e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c0-7785-47e4-bbba5210161c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c0-7785-5a46-c5d10a4cd89f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c0-7785-47dc-2b42487c4c94	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c0-7785-fb10-18b8c46de114	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c0-7785-bf01-27fd43be8b5d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c0-7785-df0c-a25093c785c2	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c0-7785-1e71-6bf6446a5741	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c0-7785-3ceb-a95bca5c4dc3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c0-7785-2c1a-b2c2d5cee5d0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3017 (class 0 OID 11684544)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c0-7786-5662-03384021bf97	000e0000-55c0-7786-d481-7d4b0904f1a1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c0-7785-47bc-526470e0b966	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c0-7786-8f02-f6d4595182e5	000e0000-55c0-7786-f713-ec419e9e23fa	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c0-7785-9bd4-c25b78366ad1	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c0-7786-e375-5804ca210cf7	000e0000-55c0-7786-e5c8-4ec10e1fb33e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c0-7785-47bc-526470e0b966	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c0-7787-6919-42e585f499c4	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c0-7787-fbcb-36b53e908661	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3004 (class 0 OID 11684371)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c0-7786-2eef-a8bc09b55d7b	000e0000-55c0-7786-f713-ec419e9e23fa	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c0-7785-94ee-7dbf5d65cd15
000d0000-55c0-7786-25cb-6d931268c250	000e0000-55c0-7786-f713-ec419e9e23fa	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c0-7785-94ee-7dbf5d65cd15
000d0000-55c0-7786-c85b-22def092ffda	000e0000-55c0-7786-f713-ec419e9e23fa	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c0-7785-12f3-11754d48ac6a
000d0000-55c0-7786-d979-7232c8e3c62c	000e0000-55c0-7786-f713-ec419e9e23fa	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c0-7785-dde2-2622327641c2
000d0000-55c0-7786-433c-8dfd84f7813c	000e0000-55c0-7786-f713-ec419e9e23fa	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c0-7785-0c80-7bb5b11aacc3
000d0000-55c0-7786-e7eb-f2343dfaa23b	000e0000-55c0-7786-f713-ec419e9e23fa	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c0-7785-ebd0-e069f0ff73bf
000d0000-55c0-7786-27d0-9eb384d64a74	000e0000-55c0-7786-f713-ec419e9e23fa	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c0-7785-94ee-7dbf5d65cd15
000d0000-55c0-7786-4254-00ce28101a4c	000e0000-55c0-7786-f713-ec419e9e23fa	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c0-7785-6438-f37832d3004f
\.


--
-- TOC entry 2983 (class 0 OID 11684187)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11684235)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 11684167)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c0-7786-9d29-d811ff709853	00080000-55c0-7786-6c62-ec9c1b8e5887	00090000-55c0-7786-8a3a-a93631aebbf2	AK		
\.


--
-- TOC entry 2958 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11684288)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 11684728)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11684740)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 11684763)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 11684313)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11684124)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c0-7785-79bf-a51b45e9e51c	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c0-7785-9cc6-004e2b0c62a1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c0-7785-4c69-85757af440fb	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c0-7785-7692-258c930dd576	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c0-7785-b871-5abbd30f0403	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c0-7785-aa0d-093da9884f47	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c0-7785-02db-0fdc4f466002	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c0-7785-8546-e7179b336db1	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c0-7785-591f-f704174473f6	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c0-7785-135c-ae992f6da0ef	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c0-7785-388a-76d896ef9aa1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c0-7785-826a-00ab372f0e60	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c0-7785-de13-e1c08d578a9e	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c0-7785-112e-41d627f6cb38	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c0-7786-0067-7b9702ae5bea	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c0-7786-14c4-ffc08d7c570f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c0-7786-e271-f2be5c0b3624	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c0-7786-f468-06304692b7e1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c0-7786-4fff-a533602cb283	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c0-7786-16ca-42a9e84211ca	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2972 (class 0 OID 11684037)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c0-7786-41d3-60aeba0c8e6f	00000000-55c0-7786-14c4-ffc08d7c570f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c0-7786-27ac-67cb1898bea8	00000000-55c0-7786-14c4-ffc08d7c570f	00010000-55c0-7785-51f8-119f51156469	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c0-7786-f1e2-9e53b0d65dad	00000000-55c0-7786-e271-f2be5c0b3624	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2973 (class 0 OID 11684048)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c0-7786-63ff-04faa3c971f6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c0-7786-14a7-9ffbd4130bac	00010000-55c0-7786-5e21-c88072f836ad	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c0-7786-1632-ccd971a9593d	00010000-55c0-7786-d44d-e7ec3125d7d7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c0-7786-ee2e-55de1762bbd1	00010000-55c0-7786-ae29-ef8b1a78ea32	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c0-7786-fc66-2bbfd358ba52	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c0-7786-e30c-f378f0e8f6b3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c0-7786-9b63-0f958895039c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c0-7786-4f5e-62fcfac434b7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c0-7786-8a3a-a93631aebbf2	00010000-55c0-7786-7812-62c88f74dc4e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c0-7786-63b5-4241638e8475	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c0-7786-1c65-5b91dfa643f0	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c0-7786-85a7-a7fbf1e5ba5d	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c0-7786-6a24-15466426fbf8	00010000-55c0-7786-4fd9-e83d6ea11e6c	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 11684002)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c0-7785-3faf-a24b78951ef5	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c0-7785-4679-dcaa2e419be8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c0-7785-4ec4-c31e153cab59	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c0-7785-4a6e-800ddd0b7c6c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c0-7785-6f53-76f5efc27dbf	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c0-7785-8faa-d6f80217c6e6	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c0-7785-5104-78feffa3b78b	Abonma-read	Abonma - branje	f
00030000-55c0-7785-ede9-6c6f705634e8	Abonma-write	Abonma - spreminjanje	f
00030000-55c0-7785-5168-70b5bee1938a	Alternacija-read	Alternacija - branje	f
00030000-55c0-7785-f1d8-90b8d51cbdc1	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c0-7785-5009-039a10fc4eee	Arhivalija-read	Arhivalija - branje	f
00030000-55c0-7785-811b-06c7938a3490	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c0-7785-12d8-09e800dc0bb8	Besedilo-read	Besedilo - branje	f
00030000-55c0-7785-ac43-f8a826e2f361	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c0-7785-74c5-8e842139a36b	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c0-7785-86a2-27a0dc28a129	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c0-7785-7a6a-6599b71f5eab	Dogodek-read	Dogodek - branje	f
00030000-55c0-7785-df66-531af6c91c71	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c0-7785-7996-4e30cd34380e	DrugiVir-read	DrugiVir - branje	f
00030000-55c0-7785-df95-67b6aa741873	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c0-7785-d550-5a1feecdf33e	Drzava-read	Drzava - branje	f
00030000-55c0-7785-31db-cdca3a76d508	Drzava-write	Drzava - spreminjanje	f
00030000-55c0-7785-9a18-147a9a63a7e0	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c0-7785-bd96-783a3e044bb3	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c0-7785-8f82-df6d67eb6616	Funkcija-read	Funkcija - branje	f
00030000-55c0-7785-df5e-c5f2289e4324	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c0-7785-6451-61683fd1dd58	Gostovanje-read	Gostovanje - branje	f
00030000-55c0-7785-9ee5-cdb204fd511a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c0-7785-fa41-443b90f05c64	Gostujoca-read	Gostujoca - branje	f
00030000-55c0-7785-f496-84b2f746d1f9	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c0-7785-b35c-d91645de7dd0	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c0-7785-c7cf-d4369a006b67	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c0-7785-3e16-e7ea326fd847	Kupec-read	Kupec - branje	f
00030000-55c0-7785-2cdc-457939a555b4	Kupec-write	Kupec - spreminjanje	f
00030000-55c0-7785-96e1-871050de643d	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c0-7785-f9ea-cb68bdc5aa48	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c0-7785-1b32-470e5bf1353e	Option-read	Option - branje	f
00030000-55c0-7785-375f-8b00036adeef	Option-write	Option - spreminjanje	f
00030000-55c0-7785-96ed-e3555740ca0f	OptionValue-read	OptionValue - branje	f
00030000-55c0-7785-7d20-0a4508590eb1	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c0-7785-239d-0db351eb6b88	Oseba-read	Oseba - branje	f
00030000-55c0-7785-071e-f25022e81777	Oseba-write	Oseba - spreminjanje	f
00030000-55c0-7785-fb1b-52a46d057438	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c0-7785-da9d-c8e5384e2b3d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c0-7785-bcf6-e301c87a1d9c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c0-7785-3d1f-45019b4365fb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c0-7785-8a41-35d7dda627cc	Pogodba-read	Pogodba - branje	f
00030000-55c0-7785-b8e0-a44cf6b055c9	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c0-7785-5edf-f00e71a89c6e	Popa-read	Popa - branje	f
00030000-55c0-7785-bca5-fc38787647cb	Popa-write	Popa - spreminjanje	f
00030000-55c0-7785-ea35-4f54272968a1	Posta-read	Posta - branje	f
00030000-55c0-7785-191b-e8f87e7b27d6	Posta-write	Posta - spreminjanje	f
00030000-55c0-7785-3a36-ec72a5531496	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c0-7785-95f6-9a0aac375b8a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c0-7785-f117-67c2607f1fc3	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c0-7785-6eb4-72423285e639	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c0-7785-eaf9-49001aeccbc8	Predstava-read	Predstava - branje	f
00030000-55c0-7785-35b9-f39b3b48700f	Predstava-write	Predstava - spreminjanje	f
00030000-55c0-7785-dd21-510efc4dea30	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c0-7785-136b-0b98af056fef	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c0-7785-e564-ef4e841ec10f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c0-7785-cb83-a834daa06505	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c0-7785-60a6-cc65293f7438	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c0-7785-92fb-228f917d4cd9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c0-7785-7bc8-ca78c2d3a49d	ProgramDela-read	ProgramDela - branje	f
00030000-55c0-7785-7bd6-f7ffbe4fe9a8	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c0-7785-30a2-597fee432734	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c0-7785-de48-4c3f78b7adcf	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c0-7785-c8e1-23f98dc67364	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c0-7785-a095-1428bedc70db	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c0-7785-1b32-20e813983b0b	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c0-7785-126b-e4390332353a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c0-7785-cb3d-2b0b8481b62e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c0-7785-8321-0f3c1880d8b7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c0-7785-b9cd-ef65201f1a0c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c0-7785-2476-c0f1ee06a859	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c0-7785-0352-dc173a38c55f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c0-7785-efc7-1d7e932bae73	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c0-7785-cfc7-54b1771b970b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c0-7785-95c8-5fbdac4656ed	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c0-7785-ed3e-426964314fe3	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c0-7785-a37f-49fd9b3b0025	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c0-7785-b7ab-988189c410e2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c0-7785-ea04-6a3b6159b910	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c0-7785-2702-6de67efae24f	Prostor-read	Prostor - branje	f
00030000-55c0-7785-c15e-c99601d57343	Prostor-write	Prostor - spreminjanje	f
00030000-55c0-7785-4322-3cc287815990	Racun-read	Racun - branje	f
00030000-55c0-7785-50c1-d780d9ed3d91	Racun-write	Racun - spreminjanje	f
00030000-55c0-7785-3b25-462ed3c9bddb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c0-7785-6c5c-8216dfc767c3	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c0-7785-95d1-1338ea58a20b	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c0-7785-b20e-766179b91e02	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c0-7785-6422-150fda49e45a	Rekvizit-read	Rekvizit - branje	f
00030000-55c0-7785-e622-cac0d214d984	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c0-7785-2078-9d5a37c081cf	Revizija-read	Revizija - branje	f
00030000-55c0-7785-28fd-0ed542e60e81	Revizija-write	Revizija - spreminjanje	f
00030000-55c0-7785-fd60-d6787748621c	Rezervacija-read	Rezervacija - branje	f
00030000-55c0-7785-dda3-d83a69d257d4	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c0-7785-6e52-5027842c8322	SedezniRed-read	SedezniRed - branje	f
00030000-55c0-7785-b362-5ed51277a392	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c0-7785-6121-cf34b30aef9e	Sedez-read	Sedez - branje	f
00030000-55c0-7785-9153-f93aad5920e5	Sedez-write	Sedez - spreminjanje	f
00030000-55c0-7785-4e54-cccdef828cd6	Sezona-read	Sezona - branje	f
00030000-55c0-7785-367e-48d569358ec6	Sezona-write	Sezona - spreminjanje	f
00030000-55c0-7785-62e6-05165c6e8b93	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c0-7785-5e9f-aac387cd749f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c0-7785-93d5-7886bea6e202	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c0-7785-306b-a8326ec1db08	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c0-7785-0edf-e34c9635ff6e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c0-7785-7d18-773f77dc58a6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c0-7785-7bbb-d292a38c6c8e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c0-7785-d8ae-7b13dfdae406	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c0-7785-ddce-ffc04b871e16	Telefonska-read	Telefonska - branje	f
00030000-55c0-7785-93f0-059612e83c83	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c0-7785-eb21-299c25449fb0	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c0-7785-e12c-521229d1a701	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c0-7785-6b8b-ce7fa7436d76	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c0-7785-55fb-05ef3c554070	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c0-7785-485b-86be70a67900	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c0-7785-98f2-fe6926a8484d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c0-7785-9879-fbade0290e5e	Trr-read	Trr - branje	f
00030000-55c0-7785-418d-30eb9010558f	Trr-write	Trr - spreminjanje	f
00030000-55c0-7785-5269-ed9541ae7c9c	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c0-7785-b784-a266b4a6c639	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c0-7785-23d1-678f919ad970	Vaja-read	Vaja - branje	f
00030000-55c0-7785-6c50-5e876214df95	Vaja-write	Vaja - spreminjanje	f
00030000-55c0-7785-fdb8-b396a4ae5126	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c0-7785-48ee-5889d44bdbbe	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c0-7785-45b0-93727e421bb3	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c0-7785-93cc-9970fa7e25b1	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c0-7785-a65e-555097b9a1ef	Zasedenost-read	Zasedenost - branje	f
00030000-55c0-7785-591e-4bba1d124d9e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c0-7785-a327-8f2cd5d7213a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c0-7785-3601-345b175f4020	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c0-7785-8ee1-869d07ba448c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c0-7785-9b17-927b989f53cf	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c0-7785-6c2b-7914c42d2751	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c0-7785-46a1-b2e49e65a380	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c0-7785-a19f-51016d6eff78	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c0-7785-d7e5-f61e0813fce2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c0-7785-afb2-8797c504609d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c0-7785-080a-e5df3bef4dbe	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c0-7785-bf5f-26e27cd11f1e	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c0-7785-e367-7f338ca5f928	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c0-7785-175d-e33c36c86566	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c0-7785-b03b-591c4d3b59b8	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c0-7785-32e0-899f7b2301ff	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c0-7785-5a2a-ba8753e2f5b1	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2970 (class 0 OID 11684021)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c0-7785-ebe4-0cf2ef23454d	00030000-55c0-7785-4679-dcaa2e419be8
00020000-55c0-7785-517d-205f10c5b439	00030000-55c0-7785-d550-5a1feecdf33e
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-5104-78feffa3b78b
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-ede9-6c6f705634e8
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-5168-70b5bee1938a
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-f1d8-90b8d51cbdc1
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-5009-039a10fc4eee
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-7a6a-6599b71f5eab
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-4a6e-800ddd0b7c6c
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-df66-531af6c91c71
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-d550-5a1feecdf33e
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-31db-cdca3a76d508
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-8f82-df6d67eb6616
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-df5e-c5f2289e4324
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-6451-61683fd1dd58
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-9ee5-cdb204fd511a
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-fa41-443b90f05c64
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-f496-84b2f746d1f9
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-b35c-d91645de7dd0
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-c7cf-d4369a006b67
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-1b32-470e5bf1353e
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-96ed-e3555740ca0f
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-239d-0db351eb6b88
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-071e-f25022e81777
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-5edf-f00e71a89c6e
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-bca5-fc38787647cb
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-ea35-4f54272968a1
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-191b-e8f87e7b27d6
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-f117-67c2607f1fc3
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-6eb4-72423285e639
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-eaf9-49001aeccbc8
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-35b9-f39b3b48700f
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-60a6-cc65293f7438
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-92fb-228f917d4cd9
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-2702-6de67efae24f
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-c15e-c99601d57343
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-95d1-1338ea58a20b
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-b20e-766179b91e02
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-6422-150fda49e45a
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-e622-cac0d214d984
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-4e54-cccdef828cd6
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-367e-48d569358ec6
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-6b8b-ce7fa7436d76
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-5269-ed9541ae7c9c
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-b784-a266b4a6c639
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-23d1-678f919ad970
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-6c50-5e876214df95
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-a65e-555097b9a1ef
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-591e-4bba1d124d9e
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-a327-8f2cd5d7213a
00020000-55c0-7785-474f-0c7e63fd190d	00030000-55c0-7785-8ee1-869d07ba448c
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-5104-78feffa3b78b
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-5009-039a10fc4eee
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-7a6a-6599b71f5eab
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-d550-5a1feecdf33e
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-6451-61683fd1dd58
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-fa41-443b90f05c64
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-b35c-d91645de7dd0
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-c7cf-d4369a006b67
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-1b32-470e5bf1353e
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-96ed-e3555740ca0f
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-239d-0db351eb6b88
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-071e-f25022e81777
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-5edf-f00e71a89c6e
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-ea35-4f54272968a1
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-f117-67c2607f1fc3
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-6eb4-72423285e639
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-eaf9-49001aeccbc8
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-2702-6de67efae24f
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-95d1-1338ea58a20b
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-6422-150fda49e45a
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-4e54-cccdef828cd6
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-ddce-ffc04b871e16
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-93f0-059612e83c83
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-9879-fbade0290e5e
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-418d-30eb9010558f
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-45b0-93727e421bb3
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-93cc-9970fa7e25b1
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-a327-8f2cd5d7213a
00020000-55c0-7785-c0e3-94c40c1f88a8	00030000-55c0-7785-8ee1-869d07ba448c
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-5104-78feffa3b78b
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-5168-70b5bee1938a
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-5009-039a10fc4eee
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-811b-06c7938a3490
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-12d8-09e800dc0bb8
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-74c5-8e842139a36b
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-7a6a-6599b71f5eab
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-d550-5a1feecdf33e
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-8f82-df6d67eb6616
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-6451-61683fd1dd58
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-fa41-443b90f05c64
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-b35c-d91645de7dd0
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-1b32-470e5bf1353e
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-96ed-e3555740ca0f
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-239d-0db351eb6b88
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-5edf-f00e71a89c6e
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-ea35-4f54272968a1
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-eaf9-49001aeccbc8
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-60a6-cc65293f7438
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-2702-6de67efae24f
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-95d1-1338ea58a20b
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-6422-150fda49e45a
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-4e54-cccdef828cd6
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-6b8b-ce7fa7436d76
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-23d1-678f919ad970
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-a65e-555097b9a1ef
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-a327-8f2cd5d7213a
00020000-55c0-7785-3b80-5bff6cdd8327	00030000-55c0-7785-8ee1-869d07ba448c
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-5104-78feffa3b78b
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-ede9-6c6f705634e8
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-f1d8-90b8d51cbdc1
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-5009-039a10fc4eee
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-7a6a-6599b71f5eab
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-d550-5a1feecdf33e
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-6451-61683fd1dd58
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-fa41-443b90f05c64
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-1b32-470e5bf1353e
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-96ed-e3555740ca0f
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-5edf-f00e71a89c6e
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-ea35-4f54272968a1
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-eaf9-49001aeccbc8
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-2702-6de67efae24f
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-95d1-1338ea58a20b
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-6422-150fda49e45a
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-4e54-cccdef828cd6
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-6b8b-ce7fa7436d76
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-a327-8f2cd5d7213a
00020000-55c0-7785-1d5b-3538ce6c8c3b	00030000-55c0-7785-8ee1-869d07ba448c
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-5104-78feffa3b78b
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-5009-039a10fc4eee
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-7a6a-6599b71f5eab
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-d550-5a1feecdf33e
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-6451-61683fd1dd58
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-fa41-443b90f05c64
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-1b32-470e5bf1353e
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-96ed-e3555740ca0f
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-5edf-f00e71a89c6e
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-ea35-4f54272968a1
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-eaf9-49001aeccbc8
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-2702-6de67efae24f
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-95d1-1338ea58a20b
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-6422-150fda49e45a
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-4e54-cccdef828cd6
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-eb21-299c25449fb0
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-4ec4-c31e153cab59
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-6b8b-ce7fa7436d76
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-a327-8f2cd5d7213a
00020000-55c0-7785-bc9f-235c352455cd	00030000-55c0-7785-8ee1-869d07ba448c
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-3faf-a24b78951ef5
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-4679-dcaa2e419be8
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-4ec4-c31e153cab59
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-4a6e-800ddd0b7c6c
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6f53-76f5efc27dbf
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-8faa-d6f80217c6e6
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-5104-78feffa3b78b
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-ede9-6c6f705634e8
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-5168-70b5bee1938a
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-f1d8-90b8d51cbdc1
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-5009-039a10fc4eee
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-811b-06c7938a3490
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-12d8-09e800dc0bb8
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-ac43-f8a826e2f361
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-74c5-8e842139a36b
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-86a2-27a0dc28a129
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-7a6a-6599b71f5eab
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-df66-531af6c91c71
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-d550-5a1feecdf33e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-31db-cdca3a76d508
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-7996-4e30cd34380e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-df95-67b6aa741873
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-9a18-147a9a63a7e0
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-bd96-783a3e044bb3
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-8f82-df6d67eb6616
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-df5e-c5f2289e4324
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6451-61683fd1dd58
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-9ee5-cdb204fd511a
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-fa41-443b90f05c64
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-f496-84b2f746d1f9
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-b35c-d91645de7dd0
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-c7cf-d4369a006b67
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-3e16-e7ea326fd847
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-2cdc-457939a555b4
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-96e1-871050de643d
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-f9ea-cb68bdc5aa48
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-1b32-470e5bf1353e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-375f-8b00036adeef
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-96ed-e3555740ca0f
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-7d20-0a4508590eb1
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-239d-0db351eb6b88
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-071e-f25022e81777
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-fb1b-52a46d057438
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-da9d-c8e5384e2b3d
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-bcf6-e301c87a1d9c
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-3d1f-45019b4365fb
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-8a41-35d7dda627cc
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-b8e0-a44cf6b055c9
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-5edf-f00e71a89c6e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-bca5-fc38787647cb
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-ea35-4f54272968a1
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-191b-e8f87e7b27d6
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-3a36-ec72a5531496
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-95f6-9a0aac375b8a
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-f117-67c2607f1fc3
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6eb4-72423285e639
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-eaf9-49001aeccbc8
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-35b9-f39b3b48700f
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-dd21-510efc4dea30
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-136b-0b98af056fef
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-e564-ef4e841ec10f
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-cb83-a834daa06505
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-60a6-cc65293f7438
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-92fb-228f917d4cd9
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-7bc8-ca78c2d3a49d
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-7bd6-f7ffbe4fe9a8
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-30a2-597fee432734
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-de48-4c3f78b7adcf
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-c8e1-23f98dc67364
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-a095-1428bedc70db
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-1b32-20e813983b0b
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-126b-e4390332353a
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-cb3d-2b0b8481b62e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-8321-0f3c1880d8b7
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-b9cd-ef65201f1a0c
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-2476-c0f1ee06a859
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-0352-dc173a38c55f
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-efc7-1d7e932bae73
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-cfc7-54b1771b970b
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-95c8-5fbdac4656ed
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-ed3e-426964314fe3
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-a37f-49fd9b3b0025
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-b7ab-988189c410e2
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-ea04-6a3b6159b910
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-2702-6de67efae24f
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-c15e-c99601d57343
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-4322-3cc287815990
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-50c1-d780d9ed3d91
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-3b25-462ed3c9bddb
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6c5c-8216dfc767c3
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-95d1-1338ea58a20b
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-b20e-766179b91e02
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6422-150fda49e45a
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-e622-cac0d214d984
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-2078-9d5a37c081cf
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-28fd-0ed542e60e81
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-fd60-d6787748621c
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-dda3-d83a69d257d4
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6e52-5027842c8322
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-b362-5ed51277a392
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6121-cf34b30aef9e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-9153-f93aad5920e5
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-4e54-cccdef828cd6
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-367e-48d569358ec6
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-62e6-05165c6e8b93
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-5e9f-aac387cd749f
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-93d5-7886bea6e202
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-306b-a8326ec1db08
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-0edf-e34c9635ff6e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-7d18-773f77dc58a6
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-7bbb-d292a38c6c8e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-d8ae-7b13dfdae406
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-ddce-ffc04b871e16
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-93f0-059612e83c83
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-eb21-299c25449fb0
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-e12c-521229d1a701
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6b8b-ce7fa7436d76
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-55fb-05ef3c554070
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-485b-86be70a67900
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-98f2-fe6926a8484d
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-9879-fbade0290e5e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-418d-30eb9010558f
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-5269-ed9541ae7c9c
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-b784-a266b4a6c639
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-23d1-678f919ad970
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-6c50-5e876214df95
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-fdb8-b396a4ae5126
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-48ee-5889d44bdbbe
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-45b0-93727e421bb3
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-93cc-9970fa7e25b1
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-a65e-555097b9a1ef
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-591e-4bba1d124d9e
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-a327-8f2cd5d7213a
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-3601-345b175f4020
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-8ee1-869d07ba448c
00020000-55c0-7786-57c5-4fd44269d7c0	00030000-55c0-7785-9b17-927b989f53cf
\.


--
-- TOC entry 2998 (class 0 OID 11684320)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 11684351)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 11684465)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c0-7786-8e37-3c8584d5aa23	00090000-55c0-7786-63ff-04faa3c971f6	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c0-7786-6ce8-cc56d7f8468f	00090000-55c0-7786-e30c-f378f0e8f6b3	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c0-7786-dfa9-6b075d5fb050	00090000-55c0-7786-6a24-15466426fbf8	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2975 (class 0 OID 11684081)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c0-7786-6c62-ec9c1b8e5887	00040000-55c0-7785-1f5c-7a4981e5181d	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-7786-e418-fa15ddb3b565	00040000-55c0-7785-1f5c-7a4981e5181d	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c0-7786-cf0f-5e22e7afd22d	00040000-55c0-7785-1f5c-7a4981e5181d	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-7786-6862-17ad849caa5b	00040000-55c0-7785-1f5c-7a4981e5181d	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-7786-651e-b9b33316b118	00040000-55c0-7785-1f5c-7a4981e5181d	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-7786-15e6-fac6c1d58af9	00040000-55c0-7784-ace3-056940d5846b	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-7786-63bc-017fa8b3d3c1	00040000-55c0-7785-d93e-c54b7c9a6e65	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-7786-86a4-de1065b78b92	00040000-55c0-7784-e838-4cdca4f2ab64	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-7786-13a8-b20a36cf760d	00040000-55c0-7785-1f5c-7a4981e5181d	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2977 (class 0 OID 11684116)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c0-7785-80d9-72a4a6a35760	8341	Adlešiči
00050000-55c0-7785-2d29-da5ab1bd58fe	5270	Ajdovščina
00050000-55c0-7785-e04a-746fe9bde5cd	6280	Ankaran/Ancarano
00050000-55c0-7785-5eab-f7e6ec49624d	9253	Apače
00050000-55c0-7785-e0fd-5e52c71bcf71	8253	Artiče
00050000-55c0-7785-8e27-2f9bb7469601	4275	Begunje na Gorenjskem
00050000-55c0-7785-f761-6768fd148f4e	1382	Begunje pri Cerknici
00050000-55c0-7785-c0aa-13a9f0419171	9231	Beltinci
00050000-55c0-7785-5541-dc205067145f	2234	Benedikt
00050000-55c0-7785-51f3-6a122da8df75	2345	Bistrica ob Dravi
00050000-55c0-7785-c506-33266d65c8a1	3256	Bistrica ob Sotli
00050000-55c0-7785-09e6-2b9990b115b9	8259	Bizeljsko
00050000-55c0-7785-e1fb-c157af142b69	1223	Blagovica
00050000-55c0-7785-651e-1cae2ed92d60	8283	Blanca
00050000-55c0-7785-20ba-5697b288ee00	4260	Bled
00050000-55c0-7785-318d-4c477887bca1	4273	Blejska Dobrava
00050000-55c0-7785-5b7c-afa62efd5058	9265	Bodonci
00050000-55c0-7785-2670-c9a2676c4805	9222	Bogojina
00050000-55c0-7785-7bd5-25a1b27ed83c	4263	Bohinjska Bela
00050000-55c0-7785-99ec-097d1772e5ed	4264	Bohinjska Bistrica
00050000-55c0-7785-1dfa-16ebf232a6c7	4265	Bohinjsko jezero
00050000-55c0-7785-1deb-6ffda44a1770	1353	Borovnica
00050000-55c0-7785-1b6a-39242602aed4	8294	Boštanj
00050000-55c0-7785-5aef-95c40cf6fb46	5230	Bovec
00050000-55c0-7785-6117-f9d9a537548c	5295	Branik
00050000-55c0-7785-f3c8-6e8996368e6d	3314	Braslovče
00050000-55c0-7785-2dfa-d8ba9ded57db	5223	Breginj
00050000-55c0-7785-eb4c-fb04d3dd168e	8280	Brestanica
00050000-55c0-7785-fcfb-55352feb2aa8	2354	Bresternica
00050000-55c0-7785-a485-2eaa393c3a9b	4243	Brezje
00050000-55c0-7785-7dcc-2f4e646070d7	1351	Brezovica pri Ljubljani
00050000-55c0-7785-3a5a-38f88aed64ed	8250	Brežice
00050000-55c0-7785-e2da-4a6b274cc2d4	4210	Brnik - Aerodrom
00050000-55c0-7785-1444-1e69e97acc2c	8321	Brusnice
00050000-55c0-7785-4702-4700d0cdfd37	3255	Buče
00050000-55c0-7785-afcb-df50851f3e4e	8276	Bučka 
00050000-55c0-7785-19d7-510fbefebeb7	9261	Cankova
00050000-55c0-7785-db36-9b66ef7d3bc1	3000	Celje 
00050000-55c0-7785-b97a-daffb831ae4b	3001	Celje - poštni predali
00050000-55c0-7785-e872-7a4c4dda8215	4207	Cerklje na Gorenjskem
00050000-55c0-7785-702a-8ddadca860c1	8263	Cerklje ob Krki
00050000-55c0-7785-4060-ff9283cac761	1380	Cerknica
00050000-55c0-7785-cd32-91643725a54b	5282	Cerkno
00050000-55c0-7785-b9ca-12a1839d2257	2236	Cerkvenjak
00050000-55c0-7785-f59c-aa997ad6e344	2215	Ceršak
00050000-55c0-7785-0e6f-be2740558599	2326	Cirkovce
00050000-55c0-7785-1bae-3856406688fb	2282	Cirkulane
00050000-55c0-7785-08c1-72b9b86c91fe	5273	Col
00050000-55c0-7785-e8a3-5e36c732b1fe	8251	Čatež ob Savi
00050000-55c0-7785-2f25-1683833b9e17	1413	Čemšenik
00050000-55c0-7785-da8a-afc4b620cc57	5253	Čepovan
00050000-55c0-7785-40cc-688e0f3663df	9232	Črenšovci
00050000-55c0-7785-965d-bd7d23139371	2393	Črna na Koroškem
00050000-55c0-7785-54f4-4e79f0b83593	6275	Črni Kal
00050000-55c0-7785-1ec2-e968f5ee45a5	5274	Črni Vrh nad Idrijo
00050000-55c0-7785-eab3-af0a14c3cfb0	5262	Črniče
00050000-55c0-7785-c10c-6c617c07f3d6	8340	Črnomelj
00050000-55c0-7785-7d3a-cdc071b1808e	6271	Dekani
00050000-55c0-7785-1f2c-52d98b508cec	5210	Deskle
00050000-55c0-7785-e93c-82f8e159bb33	2253	Destrnik
00050000-55c0-7785-6228-a5ff3dbbaa84	6215	Divača
00050000-55c0-7785-464f-5192f5db0d41	1233	Dob
00050000-55c0-7785-a495-deb8da9327a1	3224	Dobje pri Planini
00050000-55c0-7785-b197-22a21706a60b	8257	Dobova
00050000-55c0-7785-778b-20e7766ebf65	1423	Dobovec
00050000-55c0-7785-46cf-9ffee7f21c4c	5263	Dobravlje
00050000-55c0-7785-6dbc-7be93b6bcd0b	3204	Dobrna
00050000-55c0-7785-011f-d6ede39bd996	8211	Dobrnič
00050000-55c0-7785-0322-7f46b6db67d9	1356	Dobrova
00050000-55c0-7785-a5f0-8692f06ec805	9223	Dobrovnik/Dobronak 
00050000-55c0-7785-e153-01aef22dfbeb	5212	Dobrovo v Brdih
00050000-55c0-7785-e41b-a85a1db1321d	1431	Dol pri Hrastniku
00050000-55c0-7785-6a9c-af68fa492f19	1262	Dol pri Ljubljani
00050000-55c0-7785-c58a-dc2475ff9100	1273	Dole pri Litiji
00050000-55c0-7785-fdce-061792523d00	1331	Dolenja vas
00050000-55c0-7785-e6b6-265071497a12	8350	Dolenjske Toplice
00050000-55c0-7785-5463-cc251f66dd8c	1230	Domžale
00050000-55c0-7785-30ed-84e26b477418	2252	Dornava
00050000-55c0-7785-9fb6-cc6d55cd5bbf	5294	Dornberk
00050000-55c0-7785-60b4-7afdf93d7e6b	1319	Draga
00050000-55c0-7785-8b60-6b2cf7cb81c7	8343	Dragatuš
00050000-55c0-7785-ec0b-7f1abe162ed9	3222	Dramlje
00050000-55c0-7785-2caf-1195bb5c3c4b	2370	Dravograd
00050000-55c0-7785-d9c4-b8c636ecf2db	4203	Duplje
00050000-55c0-7785-3dfe-206c5eaed0df	6221	Dutovlje
00050000-55c0-7785-06a8-3fdd2a21e1c3	8361	Dvor
00050000-55c0-7785-0ab9-6d1f8151bbf7	2343	Fala
00050000-55c0-7785-4a5d-e6b80441fca5	9208	Fokovci
00050000-55c0-7785-ddc4-bfb3ccb38174	2313	Fram
00050000-55c0-7785-5966-1d8bb3e1101d	3213	Frankolovo
00050000-55c0-7785-3f03-c5c63cdfa57f	1274	Gabrovka
00050000-55c0-7785-89a3-6553dadfdce9	8254	Globoko
00050000-55c0-7785-1781-803b90375b08	5275	Godovič
00050000-55c0-7785-9017-94151579fe81	4204	Golnik
00050000-55c0-7785-d3d6-acaa8e3ca260	3303	Gomilsko
00050000-55c0-7785-94b1-0ed4cd5dd2f8	4224	Gorenja vas
00050000-55c0-7785-9f51-818df074dc6f	3263	Gorica pri Slivnici
00050000-55c0-7785-5026-20ad6058300f	2272	Gorišnica
00050000-55c0-7785-f9be-a368927c5b9d	9250	Gornja Radgona
00050000-55c0-7785-a591-bd9a770494ba	3342	Gornji Grad
00050000-55c0-7785-6ce3-f4244149fae2	4282	Gozd Martuljek
00050000-55c0-7785-7268-7a538217ad55	6272	Gračišče
00050000-55c0-7785-b292-73cb6a41a11b	9264	Grad
00050000-55c0-7785-31b3-daa2a831248b	8332	Gradac
00050000-55c0-7785-60e5-222b07fcbeb1	1384	Grahovo
00050000-55c0-7785-17f6-2be18f522139	5242	Grahovo ob Bači
00050000-55c0-7785-de22-b2a84a40979d	5251	Grgar
00050000-55c0-7785-b195-cf54d7f40100	3302	Griže
00050000-55c0-7785-5600-454eaa463055	3231	Grobelno
00050000-55c0-7785-c9be-fb36f58ecba7	1290	Grosuplje
00050000-55c0-7785-3828-b00e5cca6b59	2288	Hajdina
00050000-55c0-7785-c5c1-92841d627262	8362	Hinje
00050000-55c0-7785-4be5-f0eac483bd4e	2311	Hoče
00050000-55c0-7785-a394-66c46607db58	9205	Hodoš/Hodos
00050000-55c0-7785-abb6-83111a352142	1354	Horjul
00050000-55c0-7785-960f-c53cbd88c8f1	1372	Hotedršica
00050000-55c0-7785-e42c-52310aa13064	1430	Hrastnik
00050000-55c0-7785-e0cf-0b4fc6629520	6225	Hruševje
00050000-55c0-7785-95ab-dcba216b24d7	4276	Hrušica
00050000-55c0-7785-4b20-196ea945eeef	5280	Idrija
00050000-55c0-7785-91d6-885c1e19ba55	1292	Ig
00050000-55c0-7785-e8dd-496bed4302f2	6250	Ilirska Bistrica
00050000-55c0-7785-166b-90d8157c0dfa	6251	Ilirska Bistrica-Trnovo
00050000-55c0-7785-45bb-200423486195	1295	Ivančna Gorica
00050000-55c0-7785-c6fe-050a77254a6d	2259	Ivanjkovci
00050000-55c0-7785-b87b-422fa5375818	1411	Izlake
00050000-55c0-7785-b1bd-c89879546b61	6310	Izola/Isola
00050000-55c0-7785-93d4-fc40ed43d59c	2222	Jakobski Dol
00050000-55c0-7785-4cf0-280efa4e6cef	2221	Jarenina
00050000-55c0-7785-94a4-ed8d6fb21041	6254	Jelšane
00050000-55c0-7785-e10d-8030ef896192	4270	Jesenice
00050000-55c0-7785-568f-89c55cfe85ff	8261	Jesenice na Dolenjskem
00050000-55c0-7785-e473-08df3d56a5ad	3273	Jurklošter
00050000-55c0-7785-4d6e-86b571d7815d	2223	Jurovski Dol
00050000-55c0-7785-251f-4744e6b2b5f0	2256	Juršinci
00050000-55c0-7785-4004-bd28633171ae	5214	Kal nad Kanalom
00050000-55c0-7785-4f97-b5e3ecbd2a09	3233	Kalobje
00050000-55c0-7785-94a9-80d39cf12474	4246	Kamna Gorica
00050000-55c0-7785-dccc-face7d6c630b	2351	Kamnica
00050000-55c0-7785-ccfc-1ee1044be939	1241	Kamnik
00050000-55c0-7785-a93a-7458fc6a6f05	5213	Kanal
00050000-55c0-7785-9fcd-c88419d02828	8258	Kapele
00050000-55c0-7785-5dee-6f584756c951	2362	Kapla
00050000-55c0-7785-fa0a-3ec16e6f2e87	2325	Kidričevo
00050000-55c0-7785-3205-c8a401a229a9	1412	Kisovec
00050000-55c0-7785-b9f8-021f92edd722	6253	Knežak
00050000-55c0-7785-5019-8d905b9eeb18	5222	Kobarid
00050000-55c0-7785-1940-e7f138cbcbdb	9227	Kobilje
00050000-55c0-7785-5a72-2cc372d2ead0	1330	Kočevje
00050000-55c0-7785-bc61-f71dba356748	1338	Kočevska Reka
00050000-55c0-7785-791d-65bf80a8b778	2276	Kog
00050000-55c0-7785-2eb7-eeea26b4a5f8	5211	Kojsko
00050000-55c0-7785-22f9-324ead81167e	6223	Komen
00050000-55c0-7785-f67d-72e641ede759	1218	Komenda
00050000-55c0-7785-cf83-82f411f906f1	6000	Koper/Capodistria 
00050000-55c0-7785-0055-5e1906ac950d	6001	Koper/Capodistria - poštni predali
00050000-55c0-7785-70d9-29bb3145f627	8282	Koprivnica
00050000-55c0-7785-5d8f-fa39f7387e62	5296	Kostanjevica na Krasu
00050000-55c0-7785-5e86-90a71aeaef8e	8311	Kostanjevica na Krki
00050000-55c0-7785-99f0-a7c47f5b5000	1336	Kostel
00050000-55c0-7785-0098-c3c64ccf431a	6256	Košana
00050000-55c0-7785-14b5-c4e361c1da0c	2394	Kotlje
00050000-55c0-7785-7582-37989e680361	6240	Kozina
00050000-55c0-7785-d623-db8448454135	3260	Kozje
00050000-55c0-7785-c31d-016e62366460	4000	Kranj 
00050000-55c0-7785-fbec-eac246beaa9f	4001	Kranj - poštni predali
00050000-55c0-7785-7d87-a0f941a2efb0	4280	Kranjska Gora
00050000-55c0-7785-22be-7171f5854a28	1281	Kresnice
00050000-55c0-7785-cbe9-4dba7a012eca	4294	Križe
00050000-55c0-7785-beb6-50fb2060eb6a	9206	Križevci
00050000-55c0-7785-5717-4e5f511b6871	9242	Križevci pri Ljutomeru
00050000-55c0-7785-57cf-a2624e105e0d	1301	Krka
00050000-55c0-7785-7be0-dc6e52c65968	8296	Krmelj
00050000-55c0-7785-c313-049ec4777e2e	4245	Kropa
00050000-55c0-7785-4491-0fb9b0ca7e20	8262	Krška vas
00050000-55c0-7785-2dab-c24ec7eec7c6	8270	Krško
00050000-55c0-7785-90ce-6f55a6b35591	9263	Kuzma
00050000-55c0-7785-7ad8-7b9e63906e14	2318	Laporje
00050000-55c0-7785-6fda-fcec0d6e604e	3270	Laško
00050000-55c0-7785-0155-04a3c871cf70	1219	Laze v Tuhinju
00050000-55c0-7785-45a8-70fba740632e	2230	Lenart v Slovenskih goricah
00050000-55c0-7785-134e-273208b9d1fd	9220	Lendava/Lendva
00050000-55c0-7785-552a-e26aa1ee8995	4248	Lesce
00050000-55c0-7785-b32e-5f867bf23db3	3261	Lesično
00050000-55c0-7785-7f3d-48de76f57177	8273	Leskovec pri Krškem
00050000-55c0-7785-8a15-634242f7a919	2372	Libeliče
00050000-55c0-7785-5681-720e0cdf1440	2341	Limbuš
00050000-55c0-7785-b202-8c33a48c320b	1270	Litija
00050000-55c0-7785-82ce-479eaa7d83da	3202	Ljubečna
00050000-55c0-7785-d2bb-e2f88df014a1	1000	Ljubljana 
00050000-55c0-7785-d342-5a5ad07d1d69	1001	Ljubljana - poštni predali
00050000-55c0-7785-5f9e-4ca326ae23bd	1231	Ljubljana - Črnuče
00050000-55c0-7785-c051-a08c87ca9d2b	1261	Ljubljana - Dobrunje
00050000-55c0-7785-f2ff-ae4550a468f8	1260	Ljubljana - Polje
00050000-55c0-7785-eb6c-a6ff1b16affd	1210	Ljubljana - Šentvid
00050000-55c0-7785-4913-0bdaa643c560	1211	Ljubljana - Šmartno
00050000-55c0-7785-91bd-ae18a8e5c279	3333	Ljubno ob Savinji
00050000-55c0-7785-6396-2c1b1b1dbfb7	9240	Ljutomer
00050000-55c0-7785-a0c5-bc5ef841f9ef	3215	Loče
00050000-55c0-7785-a63e-866bc2205fa8	5231	Log pod Mangartom
00050000-55c0-7785-0694-2b6c63bb85b9	1358	Log pri Brezovici
00050000-55c0-7785-3f6b-d18194345219	1370	Logatec
00050000-55c0-7785-6bb5-135cd6833430	1371	Logatec
00050000-55c0-7785-4266-8d78f7208291	1434	Loka pri Zidanem Mostu
00050000-55c0-7785-cfc7-e766e2e692f1	3223	Loka pri Žusmu
00050000-55c0-7785-aa86-bf50f7eef1d4	6219	Lokev
00050000-55c0-7785-71ef-31887aa283eb	1318	Loški Potok
00050000-55c0-7785-e0ba-86c453a42f0e	2324	Lovrenc na Dravskem polju
00050000-55c0-7785-ce05-8cc7e49a1451	2344	Lovrenc na Pohorju
00050000-55c0-7785-3d3f-d368fe9b1d42	3334	Luče
00050000-55c0-7785-93ff-918498701d0c	1225	Lukovica
00050000-55c0-7785-043c-33d0b85d9bb3	9202	Mačkovci
00050000-55c0-7785-d51e-e6cbbbbf1159	2322	Majšperk
00050000-55c0-7785-9052-5557a003b58e	2321	Makole
00050000-55c0-7785-015b-32c8a180d309	9243	Mala Nedelja
00050000-55c0-7785-dc72-2602b7ce440e	2229	Malečnik
00050000-55c0-7785-50b7-87acea8628c8	6273	Marezige
00050000-55c0-7785-88a2-8ad06b1ae74a	2000	Maribor 
00050000-55c0-7785-4dd7-860f4b914da0	2001	Maribor - poštni predali
00050000-55c0-7785-c552-f25a5fbf536d	2206	Marjeta na Dravskem polju
00050000-55c0-7785-0aa4-f8496a7b0087	2281	Markovci
00050000-55c0-7785-a3dc-2a5c7be23948	9221	Martjanci
00050000-55c0-7785-17c6-872bd9a1a41e	6242	Materija
00050000-55c0-7785-c136-f280adc7f4af	4211	Mavčiče
00050000-55c0-7785-cbe1-5b2f712af456	1215	Medvode
00050000-55c0-7785-c793-d1e3a92b1c5c	1234	Mengeš
00050000-55c0-7785-400e-eb51bd33abd5	8330	Metlika
00050000-55c0-7785-9563-cd6f319d4f69	2392	Mežica
00050000-55c0-7785-9683-86b93420af4e	2204	Miklavž na Dravskem polju
00050000-55c0-7785-d245-5cad619ff895	2275	Miklavž pri Ormožu
00050000-55c0-7785-3d3e-d83ff0bf8ced	5291	Miren
00050000-55c0-7785-0a70-4ae6a338ebbe	8233	Mirna
00050000-55c0-7785-4209-fe65172b0c8a	8216	Mirna Peč
00050000-55c0-7785-9c10-4f2fa4a215a7	2382	Mislinja
00050000-55c0-7785-a566-d68ea078c7d0	4281	Mojstrana
00050000-55c0-7785-f4ec-d1051abb5cea	8230	Mokronog
00050000-55c0-7785-6b99-9bf51e3b9c19	1251	Moravče
00050000-55c0-7785-7200-1fecd26eb9bb	9226	Moravske Toplice
00050000-55c0-7785-a14f-f66aa67500c3	5216	Most na Soči
00050000-55c0-7785-ac1b-e7bd4299c7fc	1221	Motnik
00050000-55c0-7785-0f4e-1dfe2bc327b0	3330	Mozirje
00050000-55c0-7785-038c-e279ad68ce41	9000	Murska Sobota 
00050000-55c0-7785-b2c7-4960d47e42b6	9001	Murska Sobota - poštni predali
00050000-55c0-7785-f18e-81a1e4e4cd12	2366	Muta
00050000-55c0-7785-a6f6-0209df723890	4202	Naklo
00050000-55c0-7785-28ac-babd83859678	3331	Nazarje
00050000-55c0-7785-5358-2620529dd999	1357	Notranje Gorice
00050000-55c0-7785-ebcc-a50f9bd4d942	3203	Nova Cerkev
00050000-55c0-7785-fffe-7514eca6ffa1	5000	Nova Gorica 
00050000-55c0-7785-1c39-b808a5eae730	5001	Nova Gorica - poštni predali
00050000-55c0-7785-3723-5c55d87f6c94	1385	Nova vas
00050000-55c0-7785-6568-beca3a0f384d	8000	Novo mesto
00050000-55c0-7785-cf06-a86effcc4e18	8001	Novo mesto - poštni predali
00050000-55c0-7785-7478-9e9d37308f66	6243	Obrov
00050000-55c0-7785-fa11-712121631374	9233	Odranci
00050000-55c0-7785-b7f3-da1f8da24bb0	2317	Oplotnica
00050000-55c0-7785-9a96-5cd57e0c98a6	2312	Orehova vas
00050000-55c0-7785-1327-7c93289047e6	2270	Ormož
00050000-55c0-7785-be24-561731af5228	1316	Ortnek
00050000-55c0-7785-d475-a3891b4b9f04	1337	Osilnica
00050000-55c0-7785-26c7-3d7ffa48e206	8222	Otočec
00050000-55c0-7785-33f1-6475e889ea11	2361	Ožbalt
00050000-55c0-7785-bf99-b10bcb7015a7	2231	Pernica
00050000-55c0-7785-2cf0-51e05daf9b22	2211	Pesnica pri Mariboru
00050000-55c0-7785-d80c-a05916da5062	9203	Petrovci
00050000-55c0-7785-bbd3-947b473ccf93	3301	Petrovče
00050000-55c0-7785-0417-955173d15e59	6330	Piran/Pirano
00050000-55c0-7785-fc67-b84a7aae1dcb	8255	Pišece
00050000-55c0-7785-3226-bdf56efb1623	6257	Pivka
00050000-55c0-7785-8eb6-9a02ef809954	6232	Planina
00050000-55c0-7785-62a7-042d52cb5df6	3225	Planina pri Sevnici
00050000-55c0-7785-afcf-0e1c68d253bf	6276	Pobegi
00050000-55c0-7785-62b9-d39673e1bd56	8312	Podbočje
00050000-55c0-7785-ba90-f32ceb214629	5243	Podbrdo
00050000-55c0-7785-ed23-32d72e3e6e8d	3254	Podčetrtek
00050000-55c0-7785-7a9e-faf2e83aae16	2273	Podgorci
00050000-55c0-7785-2554-e532c6f80359	6216	Podgorje
00050000-55c0-7785-2953-0a5e6b2f5417	2381	Podgorje pri Slovenj Gradcu
00050000-55c0-7785-2ca3-a7f20b3bd537	6244	Podgrad
00050000-55c0-7785-a69a-63d25237b8dc	1414	Podkum
00050000-55c0-7785-069c-d3011384d70f	2286	Podlehnik
00050000-55c0-7785-e319-d177330c071d	5272	Podnanos
00050000-55c0-7785-1a29-014e82c9a30d	4244	Podnart
00050000-55c0-7785-ef8a-e607b7c1d78f	3241	Podplat
00050000-55c0-7785-0031-4df0df281284	3257	Podsreda
00050000-55c0-7785-29c3-d19c78800e9f	2363	Podvelka
00050000-55c0-7785-a164-f66c544bb33f	2208	Pohorje
00050000-55c0-7785-c0e9-a355c5bc2456	2257	Polenšak
00050000-55c0-7785-3b75-118524852103	1355	Polhov Gradec
00050000-55c0-7785-7f8d-082396f2bafd	4223	Poljane nad Škofjo Loko
00050000-55c0-7785-24e6-8357d1a63fd1	2319	Poljčane
00050000-55c0-7785-7d95-78d06bf2f770	1272	Polšnik
00050000-55c0-7785-f65b-bc72c95f2c30	3313	Polzela
00050000-55c0-7785-b8e8-4208768d2d15	3232	Ponikva
00050000-55c0-7785-f7ed-944c7c48aa30	6320	Portorož/Portorose
00050000-55c0-7785-429d-1b2d8189f4aa	6230	Postojna
00050000-55c0-7785-4eb4-275b4e103934	2331	Pragersko
00050000-55c0-7785-a261-ef715ced38c5	3312	Prebold
00050000-55c0-7785-d8c8-a8f8ef335103	4205	Preddvor
00050000-55c0-7785-8109-a5b4d6a1642c	6255	Prem
00050000-55c0-7785-f197-fc9342ff7e0d	1352	Preserje
00050000-55c0-7785-aa74-c5a32d6fb435	6258	Prestranek
00050000-55c0-7785-0dd9-7aaba54ede00	2391	Prevalje
00050000-55c0-7785-f511-766adadffad7	3262	Prevorje
00050000-55c0-7785-64b7-9f3994a635c3	1276	Primskovo 
00050000-55c0-7785-3ef4-6f37c86eebc8	3253	Pristava pri Mestinju
00050000-55c0-7785-09b6-5b10b299f300	9207	Prosenjakovci/Partosfalva
00050000-55c0-7785-31f8-f0f4acbc0180	5297	Prvačina
00050000-55c0-7785-736b-c38857c900ea	2250	Ptuj
00050000-55c0-7785-f82c-3663e753db62	2323	Ptujska Gora
00050000-55c0-7785-60bc-ae61e92e43a8	9201	Puconci
00050000-55c0-7785-e926-9c9d0c7f801e	2327	Rače
00050000-55c0-7785-ac98-4376cfd1db3b	1433	Radeče
00050000-55c0-7785-c9ce-f43e1b31748d	9252	Radenci
00050000-55c0-7785-0852-c0a8e2570aa3	2360	Radlje ob Dravi
00050000-55c0-7785-53e6-dd95de6ad6f4	1235	Radomlje
00050000-55c0-7785-1b39-6c4282a5d61b	4240	Radovljica
00050000-55c0-7785-e738-c9a2a81a7159	8274	Raka
00050000-55c0-7785-bb2c-78416bce02e1	1381	Rakek
00050000-55c0-7785-34fd-4da0548db461	4283	Rateče - Planica
00050000-55c0-7785-18ab-a8ff0aec1653	2390	Ravne na Koroškem
00050000-55c0-7785-b259-56b7d11340cd	9246	Razkrižje
00050000-55c0-7785-340b-07336146e0b4	3332	Rečica ob Savinji
00050000-55c0-7785-4264-34916851e48a	5292	Renče
00050000-55c0-7785-53b0-cab051a434fd	1310	Ribnica
00050000-55c0-7785-ec42-35f93bbaa18d	2364	Ribnica na Pohorju
00050000-55c0-7785-92ba-fabcf4410d46	3272	Rimske Toplice
00050000-55c0-7785-5fc2-46bf14b7ae0f	1314	Rob
00050000-55c0-7785-3230-c5e3bc4b204b	5215	Ročinj
00050000-55c0-7785-18e1-76e29c906176	3250	Rogaška Slatina
00050000-55c0-7785-3dda-e357e9266f58	9262	Rogašovci
00050000-55c0-7785-8b3d-b3d29830a40e	3252	Rogatec
00050000-55c0-7785-9338-b9beb0579d94	1373	Rovte
00050000-55c0-7785-e05f-4f701b2dd26b	2342	Ruše
00050000-55c0-7785-3239-a826c319a6e3	1282	Sava
00050000-55c0-7785-1399-bdfe77da9d65	6333	Sečovlje/Sicciole
00050000-55c0-7785-6c1e-bd47ca592b22	4227	Selca
00050000-55c0-7785-3d8a-278bb6a7a17e	2352	Selnica ob Dravi
00050000-55c0-7785-083d-3319fa5882bd	8333	Semič
00050000-55c0-7785-0ee8-70aff754d1c1	8281	Senovo
00050000-55c0-7785-4017-56903792093c	6224	Senožeče
00050000-55c0-7785-93ca-50c4b13ca54d	8290	Sevnica
00050000-55c0-7785-388e-9665bea443a8	6210	Sežana
00050000-55c0-7785-62b4-05b27198edf3	2214	Sladki Vrh
00050000-55c0-7785-1c72-bc45791be754	5283	Slap ob Idrijci
00050000-55c0-7785-0b52-a66bd4a9ee4f	2380	Slovenj Gradec
00050000-55c0-7785-fff9-55499be36ec8	2310	Slovenska Bistrica
00050000-55c0-7785-b425-503501cc6f33	3210	Slovenske Konjice
00050000-55c0-7785-1307-156f5709ec50	1216	Smlednik
00050000-55c0-7785-1ae2-9bdd503273ab	5232	Soča
00050000-55c0-7785-9fa5-f88b56d6d3a0	1317	Sodražica
00050000-55c0-7785-7504-b994ef65c78f	3335	Solčava
00050000-55c0-7785-649d-f3f4c6cf4bfc	5250	Solkan
00050000-55c0-7785-9927-8011141bfdd7	4229	Sorica
00050000-55c0-7785-f385-3d11ec8c25f2	4225	Sovodenj
00050000-55c0-7785-5bed-0229d0bc7f96	5281	Spodnja Idrija
00050000-55c0-7785-42ac-c9d8ae1ec3fd	2241	Spodnji Duplek
00050000-55c0-7785-68b7-cc32a3fe30b3	9245	Spodnji Ivanjci
00050000-55c0-7785-7508-a7ce5acc7a05	2277	Središče ob Dravi
00050000-55c0-7785-7112-379b11a7cc39	4267	Srednja vas v Bohinju
00050000-55c0-7785-6c28-fb0c18739bdc	8256	Sromlje 
00050000-55c0-7785-ccb1-257dc1225af1	5224	Srpenica
00050000-55c0-7785-7af8-e82d5e1d5447	1242	Stahovica
00050000-55c0-7785-cdbb-d97031ccb350	1332	Stara Cerkev
00050000-55c0-7785-16fc-087ec0ca8a0e	8342	Stari trg ob Kolpi
00050000-55c0-7785-6974-8a76715b9ffe	1386	Stari trg pri Ložu
00050000-55c0-7785-d3ca-7107558fe25e	2205	Starše
00050000-55c0-7785-6cce-a59428f1237c	2289	Stoperce
00050000-55c0-7785-c790-bf1d1db68b37	8322	Stopiče
00050000-55c0-7785-136f-1f9b20a4b7cb	3206	Stranice
00050000-55c0-7785-56d8-d41d7985beff	8351	Straža
00050000-55c0-7785-dbec-111ccc9e36a1	1313	Struge
00050000-55c0-7785-e014-89a6eac84046	8293	Studenec
00050000-55c0-7785-7cfb-8053acaba66e	8331	Suhor
00050000-55c0-7785-bdcd-e01f0911366d	2233	Sv. Ana v Slovenskih goricah
00050000-55c0-7785-afed-c3b6c07c9197	2235	Sv. Trojica v Slovenskih goricah
00050000-55c0-7785-9a66-5be29e5f0fbf	2353	Sveti Duh na Ostrem Vrhu
00050000-55c0-7785-d4ef-eba1b1489e94	9244	Sveti Jurij ob Ščavnici
00050000-55c0-7785-cef8-69988ef4b928	3264	Sveti Štefan
00050000-55c0-7785-5af1-48924418e486	2258	Sveti Tomaž
00050000-55c0-7785-0d7c-069bde72d73e	9204	Šalovci
00050000-55c0-7785-b3ad-e71d8e4e15c4	5261	Šempas
00050000-55c0-7785-d739-f51c6e879284	5290	Šempeter pri Gorici
00050000-55c0-7785-27d3-b57a863b361a	3311	Šempeter v Savinjski dolini
00050000-55c0-7785-c718-a27946107b7b	4208	Šenčur
00050000-55c0-7785-e4f9-321ba34ed69b	2212	Šentilj v Slovenskih goricah
00050000-55c0-7785-d9f1-f0d9049eece3	8297	Šentjanž
00050000-55c0-7785-2b5e-029423f59411	2373	Šentjanž pri Dravogradu
00050000-55c0-7785-6d11-e987c296162a	8310	Šentjernej
00050000-55c0-7785-4550-decab7df81b8	3230	Šentjur
00050000-55c0-7785-33b6-c33e07fb8b63	3271	Šentrupert
00050000-55c0-7785-7c35-43665fab5a3a	8232	Šentrupert
00050000-55c0-7785-3845-653a26ce0b72	1296	Šentvid pri Stični
00050000-55c0-7785-a608-d2fdbf73e685	8275	Škocjan
00050000-55c0-7785-54bc-af097b0fb304	6281	Škofije
00050000-55c0-7785-b3f9-532d2069bec8	4220	Škofja Loka
00050000-55c0-7785-8b7e-8ab1b47bb65a	3211	Škofja vas
00050000-55c0-7785-1276-08a0a82c1072	1291	Škofljica
00050000-55c0-7785-1e80-cfa80395e701	6274	Šmarje
00050000-55c0-7785-563c-fa0772887658	1293	Šmarje - Sap
00050000-55c0-7785-8e98-0714972b6fa7	3240	Šmarje pri Jelšah
00050000-55c0-7785-a762-9c2564d3746b	8220	Šmarješke Toplice
00050000-55c0-7785-92bb-1a6bff85fe59	2315	Šmartno na Pohorju
00050000-55c0-7785-6feb-d70ff4abc19d	3341	Šmartno ob Dreti
00050000-55c0-7785-8381-0e719f1ed000	3327	Šmartno ob Paki
00050000-55c0-7785-df34-2c3655561dc7	1275	Šmartno pri Litiji
00050000-55c0-7785-8f9e-bdc0cb6c80e2	2383	Šmartno pri Slovenj Gradcu
00050000-55c0-7785-ddf5-f89b8bb64404	3201	Šmartno v Rožni dolini
00050000-55c0-7785-a726-578ff5f16cb0	3325	Šoštanj
00050000-55c0-7785-b69f-217a23d1a40e	6222	Štanjel
00050000-55c0-7785-52a0-6fd0fdc07452	3220	Štore
00050000-55c0-7785-6ab6-33920edbc097	3304	Tabor
00050000-55c0-7785-6729-d6bf7a21c950	3221	Teharje
00050000-55c0-7785-6e99-a335e2ca0c04	9251	Tišina
00050000-55c0-7785-f834-fc5f4f435360	5220	Tolmin
00050000-55c0-7785-497a-26c6e5f82af1	3326	Topolšica
00050000-55c0-7785-0465-6766b8010b68	2371	Trbonje
00050000-55c0-7785-c9dc-9d8418c72cc2	1420	Trbovlje
00050000-55c0-7785-c95b-fabaa091aadc	8231	Trebelno 
00050000-55c0-7785-c598-780432a8af79	8210	Trebnje
00050000-55c0-7785-1d77-78846fed493e	5252	Trnovo pri Gorici
00050000-55c0-7785-c09b-a222f1541555	2254	Trnovska vas
00050000-55c0-7785-eb73-83de9eccb4a5	1222	Trojane
00050000-55c0-7785-04b5-f76c590360eb	1236	Trzin
00050000-55c0-7785-921a-c55be81604f2	4290	Tržič
00050000-55c0-7785-861e-690d35f03b27	8295	Tržišče
00050000-55c0-7785-2cdb-2698a4b91f00	1311	Turjak
00050000-55c0-7785-b27b-b8d7a9a618ff	9224	Turnišče
00050000-55c0-7785-e2f1-efd9f23f81c2	8323	Uršna sela
00050000-55c0-7785-6f40-87791d337823	1252	Vače
00050000-55c0-7785-a09a-2c9547fcd297	3320	Velenje 
00050000-55c0-7785-ec81-bb5f66786452	3322	Velenje - poštni predali
00050000-55c0-7785-369a-271cee966866	8212	Velika Loka
00050000-55c0-7785-6438-22ebd4f7e20c	2274	Velika Nedelja
00050000-55c0-7785-8238-5c44e474524b	9225	Velika Polana
00050000-55c0-7785-0a3a-905504aa3655	1315	Velike Lašče
00050000-55c0-7785-3b2c-83de045ba039	8213	Veliki Gaber
00050000-55c0-7785-a8c0-c5a9abfb2935	9241	Veržej
00050000-55c0-7785-923a-bffafcc6b606	1312	Videm - Dobrepolje
00050000-55c0-7785-07f4-1eda3828fe23	2284	Videm pri Ptuju
00050000-55c0-7785-ea09-232511b3c8ff	8344	Vinica
00050000-55c0-7785-1ad7-df25056f1b1b	5271	Vipava
00050000-55c0-7785-2a73-07ba1c8d47a9	4212	Visoko
00050000-55c0-7785-048d-8fedbb6318a9	1294	Višnja Gora
00050000-55c0-7785-d384-f75c65683c4d	3205	Vitanje
00050000-55c0-7785-7ecf-276db02152a1	2255	Vitomarci
00050000-55c0-7785-102c-eaab1b2783d7	1217	Vodice
00050000-55c0-7785-03ef-a9008ec8e043	3212	Vojnik\t
00050000-55c0-7785-ddd7-6a8d65de3204	5293	Volčja Draga
00050000-55c0-7785-2c8f-c9dbe3c37a37	2232	Voličina
00050000-55c0-7785-9ca8-fcb818cb07e2	3305	Vransko
00050000-55c0-7785-ce39-9abdb92c0dd2	6217	Vremski Britof
00050000-55c0-7785-9ac4-806bb01cdbd5	1360	Vrhnika
00050000-55c0-7785-0bac-ab2e02be7816	2365	Vuhred
00050000-55c0-7785-9c65-7d508bc76510	2367	Vuzenica
00050000-55c0-7785-1706-d79b4cb35dd5	8292	Zabukovje 
00050000-55c0-7785-259f-2d27ed9f8965	1410	Zagorje ob Savi
00050000-55c0-7785-925d-edd0ab3b821e	1303	Zagradec
00050000-55c0-7785-d7e4-0580fd9ac359	2283	Zavrč
00050000-55c0-7785-90d6-3cae2f905845	8272	Zdole 
00050000-55c0-7785-1225-35ca74d22c72	4201	Zgornja Besnica
00050000-55c0-7785-6137-a8ac62b49e25	2242	Zgornja Korena
00050000-55c0-7785-8a9a-905501ab7eac	2201	Zgornja Kungota
00050000-55c0-7785-affc-91dc2e16fd53	2316	Zgornja Ložnica
00050000-55c0-7785-a0e5-1e9b7e8db797	2314	Zgornja Polskava
00050000-55c0-7785-5750-a9a807d139af	2213	Zgornja Velka
00050000-55c0-7785-bd53-ea5af7f36359	4247	Zgornje Gorje
00050000-55c0-7785-d397-71ebc55fe735	4206	Zgornje Jezersko
00050000-55c0-7785-e365-aa3bb2d4d5fa	2285	Zgornji Leskovec
00050000-55c0-7785-18d3-1771d58c0db4	1432	Zidani Most
00050000-55c0-7785-b106-37c193a00594	3214	Zreče
00050000-55c0-7785-2f19-6e84326f3d35	4209	Žabnica
00050000-55c0-7785-7014-e1bcdda6ab6e	3310	Žalec
00050000-55c0-7785-177f-520e13ee1322	4228	Železniki
00050000-55c0-7785-90e2-86ecdd1ee635	2287	Žetale
00050000-55c0-7785-11a6-42261f766fa3	4226	Žiri
00050000-55c0-7785-3217-4ee6e73dab6e	4274	Žirovnica
00050000-55c0-7785-068e-aa991a3649c1	8360	Žužemberk
\.


--
-- TOC entry 2994 (class 0 OID 11684294)
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
-- TOC entry 2976 (class 0 OID 11684101)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 11684179)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 11684306)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 11684610)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 11684620)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c0-7786-6115-860b92f371cc	00080000-55c0-7786-13a8-b20a36cf760d	0900	AK
00190000-55c0-7786-6252-3cc02666c909	00080000-55c0-7786-cf0f-5e22e7afd22d	0987	AK
00190000-55c0-7786-d0cc-24a645af84c9	00080000-55c0-7786-e418-fa15ddb3b565	0989	AK
00190000-55c0-7786-ccd8-de761003db17	00080000-55c0-7786-6862-17ad849caa5b	0986	AK
00190000-55c0-7786-9152-d3e340f19d17	00080000-55c0-7786-15e6-fac6c1d58af9	0984	AK
00190000-55c0-7786-9827-cbfdd4f318ff	00080000-55c0-7786-63bc-017fa8b3d3c1	0983	AK
00190000-55c0-7786-bdd8-4926f780bd89	00080000-55c0-7786-86a4-de1065b78b92	0982	AK
\.


--
-- TOC entry 3018 (class 0 OID 11684591)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55c0-7787-3a4c-94b1b81c13a7	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3021 (class 0 OID 11684628)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 11684335)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c0-7786-e5c6-11c841efe5ab	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c0-7786-cd61-096fdfe119df	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c0-7786-54f2-82e153480258	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c0-7786-c09b-432dc8b0231b	0004	Mali oder	t	24	Mali oder 
00220000-55c0-7786-60f9-5cd5d95dd0cd	0005	Komorni oder	t	15	Komorni oder
00220000-55c0-7786-6b88-b04efa22bb5c	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c0-7786-436c-ae0b09e92145	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2992 (class 0 OID 11684279)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11684269)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11684454)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11684403)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 11683973)
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
-- TOC entry 3001 (class 0 OID 11684345)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 11684011)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c0-7785-ebe4-0cf2ef23454d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c0-7785-517d-205f10c5b439	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c0-7785-3ebf-d2be34aa784f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c0-7785-348f-9bf1bede93b3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c0-7785-474f-0c7e63fd190d	planer	Planer dogodkov v koledarju	t
00020000-55c0-7785-c0e3-94c40c1f88a8	kadrovska	Kadrovska služba	t
00020000-55c0-7785-3b80-5bff6cdd8327	arhivar	Ažuriranje arhivalij	t
00020000-55c0-7785-1d5b-3538ce6c8c3b	igralec	Igralec	t
00020000-55c0-7785-bc9f-235c352455cd	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c0-7786-57c5-4fd44269d7c0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2967 (class 0 OID 11683995)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c0-7785-51f8-119f51156469	00020000-55c0-7785-3ebf-d2be34aa784f
00010000-55c0-7785-47d5-a152102a0a3e	00020000-55c0-7785-3ebf-d2be34aa784f
00010000-55c0-7786-65b6-445f16924512	00020000-55c0-7786-57c5-4fd44269d7c0
\.


--
-- TOC entry 3003 (class 0 OID 11684359)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11684300)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11684246)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11684669)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c0-7785-b142-7a330ea9877b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c0-7785-7a30-68fdcf70abf8	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c0-7785-48a5-632b93ac057e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c0-7785-a0fa-2a725ca8170e	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c0-7785-af73-eaca3169445e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3025 (class 0 OID 11684661)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c0-7785-ca10-e91db2874716	00230000-55c0-7785-a0fa-2a725ca8170e	popa
00240000-55c0-7785-d96c-dc3ca7b9c4f7	00230000-55c0-7785-a0fa-2a725ca8170e	oseba
00240000-55c0-7785-47cc-71b334b3b2f4	00230000-55c0-7785-a0fa-2a725ca8170e	sezona
00240000-55c0-7785-4a79-e21668e0c7d4	00230000-55c0-7785-7a30-68fdcf70abf8	prostor
00240000-55c0-7785-c3f7-ba56b67027ea	00230000-55c0-7785-a0fa-2a725ca8170e	besedilo
00240000-55c0-7785-979b-e958d6c1b5ad	00230000-55c0-7785-a0fa-2a725ca8170e	uprizoritev
00240000-55c0-7785-1c3f-d723a6820008	00230000-55c0-7785-a0fa-2a725ca8170e	funkcija
00240000-55c0-7785-2641-0f8d58175256	00230000-55c0-7785-a0fa-2a725ca8170e	tipfunkcije
00240000-55c0-7785-6eb8-e4021fd17337	00230000-55c0-7785-a0fa-2a725ca8170e	alternacija
00240000-55c0-7785-0f05-112a2a98e332	00230000-55c0-7785-b142-7a330ea9877b	pogodba
00240000-55c0-7785-027f-4f5f64c0e525	00230000-55c0-7785-a0fa-2a725ca8170e	zaposlitev
00240000-55c0-7785-4656-fc0d2d6e53d7	00230000-55c0-7785-b142-7a330ea9877b	programdela
00240000-55c0-7785-efbd-ae4d0785dea0	00230000-55c0-7785-a0fa-2a725ca8170e	zapis
\.


--
-- TOC entry 3024 (class 0 OID 11684656)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11684413)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c0-7787-f95a-27156c61319c	000e0000-55c0-7786-f713-ec419e9e23fa	00080000-55c0-7786-6c62-ec9c1b8e5887	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c0-7787-6cfd-58015e35c6e3	000e0000-55c0-7786-f713-ec419e9e23fa	00080000-55c0-7786-6c62-ec9c1b8e5887	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c0-7787-0297-1b0c71923a52	000e0000-55c0-7786-f713-ec419e9e23fa	00080000-55c0-7786-651e-b9b33316b118	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c0-7787-6db0-b1da3063b164	000e0000-55c0-7786-f713-ec419e9e23fa	00080000-55c0-7786-651e-b9b33316b118	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2974 (class 0 OID 11684073)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 11684256)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c0-7787-1edc-b9b5880d54e2	00180000-55c0-7786-c5fa-df5736453872	000c0000-55c0-7787-e98f-da3b130faba3	00090000-55c0-7786-8a3a-a93631aebbf2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-7787-f022-9770a80fa8fb	00180000-55c0-7786-c5fa-df5736453872	000c0000-55c0-7787-13f7-dfef9dcb184e	00090000-55c0-7786-63b5-4241638e8475	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-7787-7050-81f4aed69c3e	00180000-55c0-7786-c5fa-df5736453872	000c0000-55c0-7787-52a0-080ad4b0a011	00090000-55c0-7786-1632-ccd971a9593d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-7787-8d5f-c016a4871202	00180000-55c0-7786-c5fa-df5736453872	000c0000-55c0-7787-819e-2a18ee1f1aae	00090000-55c0-7786-14a7-9ffbd4130bac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-7787-a009-e83bf74aaef5	00180000-55c0-7786-c5fa-df5736453872	000c0000-55c0-7787-4ba8-f0cb50764a8e	00090000-55c0-7786-85a7-a7fbf1e5ba5d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-7787-d1a6-737c83fed1a6	00180000-55c0-7786-42da-7d769fd5c19d	\N	00090000-55c0-7786-85a7-a7fbf1e5ba5d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3010 (class 0 OID 11684443)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c0-7785-c311-8d2f9d7c0099	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c0-7785-19c8-4d78c61a65d6	Priredba	Priredba	Priredba	umetnik
000f0000-55c0-7785-f52a-9d1136be01e7	Prevod	Prevod	Prevod	umetnik
000f0000-55c0-7785-12f3-11754d48ac6a	Režija	Režija	Režija	umetnik
000f0000-55c0-7785-5daf-379e636e0c7f	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c0-7785-a70d-635a772c6f29	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c0-7785-33d1-50a813fcd7a4	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c0-7785-1afe-e97bcfbed638	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c0-7785-ebd0-e069f0ff73bf	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c0-7785-554c-897eac5d9575	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c0-7785-6438-f37832d3004f	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c0-7785-1427-8f5b3cf95372	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c0-7785-c0cd-71110b2b44b5	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c0-7785-10c9-6a596af4aa2b	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c0-7785-94ee-7dbf5d65cd15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c0-7785-8bf9-87e42723e050	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c0-7785-0c80-7bb5b11aacc3	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c0-7785-dde2-2622327641c2	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3022 (class 0 OID 11684638)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c0-7785-07c2-f1bca0b4cf1e	01	Velika predstava	f	1.00	1.00
002b0000-55c0-7785-3d81-83cd5faeadf3	02	Mala predstava	f	0.50	0.50
002b0000-55c0-7785-7778-600e65ce1731	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c0-7785-47bc-526470e0b966	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c0-7785-9bd4-c25b78366ad1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2979 (class 0 OID 11684136)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11683982)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c0-7785-47d5-a152102a0a3e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwMye.AKheeDxkuoVKfJ5PSCfQ8h5lN2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c0-7786-d44d-e7ec3125d7d7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c0-7786-5e21-c88072f836ad	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c0-7786-7812-62c88f74dc4e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c0-7786-4fd9-e83d6ea11e6c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c0-7786-ae29-ef8b1a78ea32	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c0-7786-e018-7279bb752dde	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c0-7786-6534-7ad1a7782c4e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c0-7786-baee-a524e7c2dd92	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c0-7786-5160-b3e6f7943b07	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c0-7786-65b6-445f16924512	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c0-7785-51f8-119f51156469	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 11684491)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c0-7786-d481-7d4b0904f1a1	00160000-55c0-7786-f4bc-b8d42bdf7391	00150000-55c0-7785-bbdf-048db44e7d37	00140000-55c0-7784-f72a-e9d5331dee4f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c0-7786-60f9-5cd5d95dd0cd
000e0000-55c0-7786-f713-ec419e9e23fa	00160000-55c0-7786-b3f0-ae3d1be9165b	00150000-55c0-7785-1106-cead681eaab0	00140000-55c0-7784-6286-d875f60be48e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c0-7786-6b88-b04efa22bb5c
000e0000-55c0-7786-e5c8-4ec10e1fb33e	\N	00150000-55c0-7785-1106-cead681eaab0	00140000-55c0-7784-6286-d875f60be48e	00190000-55c0-7786-6252-3cc02666c909	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c0-7786-60f9-5cd5d95dd0cd
000e0000-55c0-7786-fe80-17919d5f1084	\N	00150000-55c0-7785-1106-cead681eaab0	00140000-55c0-7784-6286-d875f60be48e	00190000-55c0-7786-6252-3cc02666c909	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c0-7786-60f9-5cd5d95dd0cd
000e0000-55c0-7786-95b2-71abaa0d48e4	\N	00150000-55c0-7785-1106-cead681eaab0	00140000-55c0-7784-6286-d875f60be48e	00190000-55c0-7786-6252-3cc02666c909	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c0-7786-e5c6-11c841efe5ab
\.


--
-- TOC entry 2984 (class 0 OID 11684198)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c0-7786-84ac-89131a4bc1da	000e0000-55c0-7786-f713-ec419e9e23fa	1	
00200000-55c0-7786-e2bc-78b996480605	000e0000-55c0-7786-f713-ec419e9e23fa	2	
\.


--
-- TOC entry 2999 (class 0 OID 11684327)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11684708)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11684680)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11684720)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11684396)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c0-7786-5d17-874a8df4be1a	00090000-55c0-7786-63b5-4241638e8475	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-7786-e2f5-327fc8482cb4	00090000-55c0-7786-1632-ccd971a9593d	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-7786-e1b6-436ef44c567c	00090000-55c0-7786-4f5e-62fcfac434b7	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-7786-1398-ddf2aa3348e1	00090000-55c0-7786-ee2e-55de1762bbd1	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-7786-fb89-6dacdbe76810	00090000-55c0-7786-8a3a-a93631aebbf2	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-7786-aa17-647a064254f3	00090000-55c0-7786-9b63-0f958895039c	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2986 (class 0 OID 11684230)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 11684481)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c0-7784-f72a-e9d5331dee4f	01	Drama	drama (SURS 01)
00140000-55c0-7784-5fa3-1f0d72f0d52a	02	Opera	opera (SURS 02)
00140000-55c0-7784-23ad-e8ebbffefc5c	03	Balet	balet (SURS 03)
00140000-55c0-7784-f1d1-d2c5a71a080d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c0-7784-177a-08cf433065e6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c0-7784-6286-d875f60be48e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c0-7784-8360-1b91d83250c8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3005 (class 0 OID 11684386)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c0-7785-5de4-828350862c6a	01	Opera	opera
00150000-55c0-7785-7f55-87c5947ae0c4	02	Opereta	opereta
00150000-55c0-7785-a057-5125d0458185	03	Balet	balet
00150000-55c0-7785-2a6c-c527b012f442	04	Plesne prireditve	plesne prireditve
00150000-55c0-7785-aa74-20a88ad3a231	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c0-7785-98b6-99202dd53617	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c0-7785-ae6e-0308c93398ba	07	Biografska drama	biografska drama
00150000-55c0-7785-bbdf-048db44e7d37	08	Komedija	komedija
00150000-55c0-7785-eac2-4d65eb70c4cd	09	Črna komedija	črna komedija
00150000-55c0-7785-ecd1-55743a10742d	10	E-igra	E-igra
00150000-55c0-7785-1106-cead681eaab0	11	Kriminalka	kriminalka
00150000-55c0-7785-bd2d-601f5667e5a1	12	Musical	musical
\.


--
-- TOC entry 2510 (class 2606 OID 11684036)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 11684538)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 11684528)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11684442)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 11684761)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 11684220)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 11684245)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 11684654)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 11684162)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 11684585)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 11684382)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 11684196)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 11684239)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 11684176)
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
-- TOC entry 2603 (class 2606 OID 11684292)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 11684737)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 11684744)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2751 (class 2606 OID 11684769)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 11684319)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 11684134)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 11684045)
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
-- TOC entry 2517 (class 2606 OID 11684069)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 11684025)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2501 (class 2606 OID 11684010)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 11684325)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 11684358)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 11684476)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 11684098)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 11684122)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11684298)
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
-- TOC entry 2532 (class 2606 OID 11684112)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 11684183)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 11684310)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 11684617)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 11684625)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 11684608)
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
-- TOC entry 2709 (class 2606 OID 11684636)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 11684342)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 11684283)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 11684274)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 11684464)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 11684410)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 11683981)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11684349)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 11683999)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2503 (class 2606 OID 11684019)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11684367)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 11684305)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 11684254)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 11684678)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 11684666)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 11684660)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11684423)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 11684078)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 11684265)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11684453)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11684648)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 11684147)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 11683994)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11684507)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 11684205)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11684333)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 11684718)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 11684702)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 11684726)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 11684401)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 11684234)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 11684489)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 11684394)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 1259 OID 11684227)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2651 (class 1259 OID 11684424)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 11684425)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2737 (class 1259 OID 11684739)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2738 (class 1259 OID 11684738)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2524 (class 1259 OID 11684100)
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
-- TOC entry 2616 (class 1259 OID 11684326)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2724 (class 1259 OID 11684706)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2725 (class 1259 OID 11684705)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2726 (class 1259 OID 11684707)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2727 (class 1259 OID 11684704)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2728 (class 1259 OID 11684703)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2610 (class 1259 OID 11684312)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2611 (class 1259 OID 11684311)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 11684206)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2638 (class 1259 OID 11684383)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 11684385)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2640 (class 1259 OID 11684384)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2549 (class 1259 OID 11684178)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2550 (class 1259 OID 11684177)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2707 (class 1259 OID 11684637)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2661 (class 1259 OID 11684478)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 11684479)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 11684480)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2734 (class 1259 OID 11684727)
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
-- TOC entry 2670 (class 1259 OID 11684512)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2671 (class 1259 OID 11684509)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2672 (class 1259 OID 11684513)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2673 (class 1259 OID 11684511)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2674 (class 1259 OID 11684510)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2539 (class 1259 OID 11684149)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2540 (class 1259 OID 11684148)
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
-- TOC entry 2515 (class 1259 OID 11684072)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2626 (class 1259 OID 11684350)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2579 (class 1259 OID 11684240)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2505 (class 1259 OID 11684026)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2506 (class 1259 OID 11684027)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2631 (class 1259 OID 11684370)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2632 (class 1259 OID 11684369)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2633 (class 1259 OID 11684368)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2553 (class 1259 OID 11684184)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 11684186)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2555 (class 1259 OID 11684185)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2717 (class 1259 OID 11684668)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2590 (class 1259 OID 11684278)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2591 (class 1259 OID 11684276)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2592 (class 1259 OID 11684275)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2593 (class 1259 OID 11684277)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2496 (class 1259 OID 11684000)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2497 (class 1259 OID 11684001)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2619 (class 1259 OID 11684334)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 11684762)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2748 (class 1259 OID 11684770)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2749 (class 1259 OID 11684771)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2605 (class 1259 OID 11684299)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2647 (class 1259 OID 11684411)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2648 (class 1259 OID 11684412)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2691 (class 1259 OID 11684590)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2692 (class 1259 OID 11684589)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2693 (class 1259 OID 11684586)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2694 (class 1259 OID 11684587)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2695 (class 1259 OID 11684588)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2528 (class 1259 OID 11684114)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 11684113)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2530 (class 1259 OID 11684115)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2489 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2699 (class 1259 OID 11684618)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2700 (class 1259 OID 11684619)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2684 (class 1259 OID 11684542)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2685 (class 1259 OID 11684543)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2686 (class 1259 OID 11684540)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2687 (class 1259 OID 11684541)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2644 (class 1259 OID 11684402)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 11684287)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2597 (class 1259 OID 11684286)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2598 (class 1259 OID 11684284)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2599 (class 1259 OID 11684285)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2467 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2680 (class 1259 OID 11684530)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2681 (class 1259 OID 11684529)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2696 (class 1259 OID 11684609)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2560 (class 1259 OID 11684197)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2714 (class 1259 OID 11684655)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2741 (class 1259 OID 11684745)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2742 (class 1259 OID 11684746)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2511 (class 1259 OID 11684047)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2512 (class 1259 OID 11684046)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2520 (class 1259 OID 11684079)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 11684080)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2585 (class 1259 OID 11684268)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 11684267)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2587 (class 1259 OID 11684266)
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
-- TOC entry 2567 (class 1259 OID 11684229)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2568 (class 1259 OID 11684225)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2569 (class 1259 OID 11684222)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2570 (class 1259 OID 11684223)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2571 (class 1259 OID 11684221)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2572 (class 1259 OID 11684226)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2573 (class 1259 OID 11684224)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2527 (class 1259 OID 11684099)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11684163)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 11684165)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2547 (class 1259 OID 11684164)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2548 (class 1259 OID 11684166)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2604 (class 1259 OID 11684293)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2666 (class 1259 OID 11684477)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 11684508)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 11684070)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 11684071)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2641 (class 1259 OID 11684395)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2723 (class 1259 OID 11684679)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2538 (class 1259 OID 11684135)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2720 (class 1259 OID 11684667)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2624 (class 1259 OID 11684344)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2625 (class 1259 OID 11684343)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 11684539)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2535 (class 1259 OID 11684123)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 11684490)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2731 (class 1259 OID 11684719)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2705 (class 1259 OID 11684626)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2706 (class 1259 OID 11684627)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2584 (class 1259 OID 11684255)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 11684020)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2574 (class 1259 OID 11684228)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2777 (class 2606 OID 11684907)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2780 (class 2606 OID 11684892)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2779 (class 2606 OID 11684897)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2775 (class 2606 OID 11684917)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2781 (class 2606 OID 11684887)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2776 (class 2606 OID 11684912)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2778 (class 2606 OID 11684902)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2811 (class 2606 OID 11685062)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 11685067)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 11685237)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2845 (class 2606 OID 11685232)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 11684822)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 11685002)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2839 (class 2606 OID 11685217)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2840 (class 2606 OID 11685212)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2838 (class 2606 OID 11685222)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2841 (class 2606 OID 11685207)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2842 (class 2606 OID 11685202)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2796 (class 2606 OID 11684997)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2797 (class 2606 OID 11684992)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2774 (class 2606 OID 11684882)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 11685032)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 11685042)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2805 (class 2606 OID 11685037)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2768 (class 2606 OID 11684857)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2769 (class 2606 OID 11684852)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 11684982)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2835 (class 2606 OID 11685187)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2814 (class 2606 OID 11685072)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2813 (class 2606 OID 11685077)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 11685082)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2843 (class 2606 OID 11685227)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2816 (class 2606 OID 11685102)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2819 (class 2606 OID 11685087)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2815 (class 2606 OID 11685107)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2817 (class 2606 OID 11685097)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2818 (class 2606 OID 11685092)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2766 (class 2606 OID 11684847)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11684842)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 11684807)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2759 (class 2606 OID 11684802)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2800 (class 2606 OID 11685012)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2782 (class 2606 OID 11684922)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 11684782)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2754 (class 2606 OID 11684787)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2801 (class 2606 OID 11685027)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2802 (class 2606 OID 11685022)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2803 (class 2606 OID 11685017)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2772 (class 2606 OID 11684862)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 11684872)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2771 (class 2606 OID 11684867)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 11685197)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2786 (class 2606 OID 11684957)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2788 (class 2606 OID 11684947)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2789 (class 2606 OID 11684942)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2787 (class 2606 OID 11684952)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 11684772)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2752 (class 2606 OID 11684777)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2799 (class 2606 OID 11685007)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2848 (class 2606 OID 11685252)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2850 (class 2606 OID 11685257)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 11685262)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2795 (class 2606 OID 11684987)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2809 (class 2606 OID 11685052)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2808 (class 2606 OID 11685057)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2826 (class 2606 OID 11685162)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2827 (class 2606 OID 11685157)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2830 (class 2606 OID 11685142)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2829 (class 2606 OID 11685147)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2828 (class 2606 OID 11685152)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2764 (class 2606 OID 11684832)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11684827)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 11684837)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2833 (class 2606 OID 11685172)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2832 (class 2606 OID 11685177)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2823 (class 2606 OID 11685132)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 11685137)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2825 (class 2606 OID 11685122)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2824 (class 2606 OID 11685127)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2807 (class 2606 OID 11685047)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 11684977)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2791 (class 2606 OID 11684972)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2793 (class 2606 OID 11684962)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2792 (class 2606 OID 11684967)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2820 (class 2606 OID 11685117)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2821 (class 2606 OID 11685112)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2831 (class 2606 OID 11685167)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2773 (class 2606 OID 11684877)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2834 (class 2606 OID 11685182)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 11685192)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2847 (class 2606 OID 11685242)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2846 (class 2606 OID 11685247)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2756 (class 2606 OID 11684797)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 11684792)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2761 (class 2606 OID 11684812)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 11684817)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 11684937)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 11684932)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2785 (class 2606 OID 11684927)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-04 10:27:52 CEST

--
-- PostgreSQL database dump complete
--

