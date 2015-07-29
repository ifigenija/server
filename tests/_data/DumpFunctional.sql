--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-29 13:28:31 CEST

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
-- TOC entry 183 (class 1259 OID 10872169)
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
-- TOC entry 228 (class 1259 OID 10872668)
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
-- TOC entry 227 (class 1259 OID 10872651)
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
-- TOC entry 221 (class 1259 OID 10872563)
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
-- TOC entry 244 (class 1259 OID 10872884)
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
-- TOC entry 197 (class 1259 OID 10872348)
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
-- TOC entry 200 (class 1259 OID 10872382)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 10872786)
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
-- TOC entry 192 (class 1259 OID 10872291)
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
-- TOC entry 229 (class 1259 OID 10872681)
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
    utemeljitev text NOT NULL,
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
-- TOC entry 216 (class 1259 OID 10872508)
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
-- TOC entry 195 (class 1259 OID 10872328)
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
-- TOC entry 199 (class 1259 OID 10872376)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10872308)
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
-- TOC entry 205 (class 1259 OID 10872425)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 10872865)
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
-- TOC entry 243 (class 1259 OID 10872877)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 10872900)
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
-- TOC entry 209 (class 1259 OID 10872450)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10872265)
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
-- TOC entry 184 (class 1259 OID 10872178)
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
-- TOC entry 185 (class 1259 OID 10872189)
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
-- TOC entry 180 (class 1259 OID 10872143)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10872162)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10872457)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10872488)
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
-- TOC entry 224 (class 1259 OID 10872602)
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
-- TOC entry 187 (class 1259 OID 10872222)
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
-- TOC entry 189 (class 1259 OID 10872257)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10872431)
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
-- TOC entry 188 (class 1259 OID 10872242)
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
-- TOC entry 194 (class 1259 OID 10872320)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10872443)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10872746)
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
-- TOC entry 232 (class 1259 OID 10872757)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10872727)
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
-- TOC entry 233 (class 1259 OID 10872765)
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
-- TOC entry 212 (class 1259 OID 10872472)
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
-- TOC entry 204 (class 1259 OID 10872416)
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
-- TOC entry 203 (class 1259 OID 10872406)
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
-- TOC entry 223 (class 1259 OID 10872591)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10872540)
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
-- TOC entry 177 (class 1259 OID 10872114)
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
-- TOC entry 176 (class 1259 OID 10872112)
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
-- TOC entry 213 (class 1259 OID 10872482)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10872152)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10872136)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10872496)
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
-- TOC entry 207 (class 1259 OID 10872437)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10872387)
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
-- TOC entry 238 (class 1259 OID 10872806)
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
-- TOC entry 237 (class 1259 OID 10872798)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 10872793)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10872550)
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
-- TOC entry 186 (class 1259 OID 10872214)
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
-- TOC entry 202 (class 1259 OID 10872393)
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
-- TOC entry 222 (class 1259 OID 10872580)
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
-- TOC entry 234 (class 1259 OID 10872775)
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
-- TOC entry 191 (class 1259 OID 10872277)
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
-- TOC entry 178 (class 1259 OID 10872123)
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
-- TOC entry 226 (class 1259 OID 10872628)
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
-- TOC entry 196 (class 1259 OID 10872339)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10872464)
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
-- TOC entry 240 (class 1259 OID 10872845)
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
-- TOC entry 239 (class 1259 OID 10872817)
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
-- TOC entry 241 (class 1259 OID 10872857)
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
-- TOC entry 218 (class 1259 OID 10872533)
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
-- TOC entry 198 (class 1259 OID 10872371)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10872618)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10872523)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 10872117)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2969 (class 0 OID 10872169)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 10872668)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55b8-b8de-b05f-bd7175387845	000d0000-55b8-b8de-a3bf-f2b6cbc2c35d	\N	00090000-55b8-b8de-dc9e-37de9400839a	000b0000-55b8-b8de-50d2-fb49495134fd	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55b8-b8de-e9af-4dd383e3005e	000d0000-55b8-b8de-6679-8f9adf9f3ed8	00100000-55b8-b8de-e120-4ef8bf75cdff	00090000-55b8-b8de-5b22-5b02f407e7b2	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55b8-b8de-a361-503732e22641	000d0000-55b8-b8de-38a1-798d40d9276d	00100000-55b8-b8de-9d77-0699b9b02f83	00090000-55b8-b8de-e927-1ece1f1c45aa	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55b8-b8de-02da-d5251f802b93	000d0000-55b8-b8de-6074-1a65269a72b0	\N	00090000-55b8-b8de-e5a9-b36e5f67ead4	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55b8-b8de-0a44-94caf27c4ea0	000d0000-55b8-b8de-b598-271596e8e6d5	\N	00090000-55b8-b8de-a762-6efa52638d9f	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55b8-b8de-e115-409a5dd07506	000d0000-55b8-b8de-8469-b0d01451ee4a	\N	00090000-55b8-b8de-45e0-7f905e2b9782	000b0000-55b8-b8de-679a-9b8e13b6cc74	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55b8-b8de-37c6-3901d5f7b67c	000d0000-55b8-b8de-8963-5d307b136576	00100000-55b8-b8de-51d3-1c0a5fa80984	00090000-55b8-b8de-5c9e-958d0938a582	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55b8-b8de-b566-e09a0ea42d3c	000d0000-55b8-b8de-2ffa-6d0c49da3413	\N	00090000-55b8-b8de-5ddf-a0fbfe64cd7c	000b0000-55b8-b8de-e352-9c42b3a8c6aa	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 3013 (class 0 OID 10872651)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 10872563)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55b8-b8de-0c15-8f3e1ccd9c39	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55b8-b8de-7562-04bc752b881a	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55b8-b8de-a43b-4fc0c8085265	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 10872884)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 10872348)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55b8-b8de-28d3-e2042dbe3130	\N	\N	00200000-55b8-b8de-e804-94b858dfc032	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55b8-b8de-621d-9b75d4d7e6ab	\N	\N	00200000-55b8-b8de-a6e2-62e3433489e5	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55b8-b8de-c355-e4e253be1427	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55b8-b8de-d466-460f13221aa9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55b8-b8de-8cfb-7dacc5cf08f9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2986 (class 0 OID 10872382)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 10872786)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 10872291)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55b8-b8dc-63e5-04f0009e16fa	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55b8-b8dc-e076-62f588ebb6bb	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55b8-b8dc-20fb-57b3f3824794	AL	ALB	008	Albania 	Albanija	\N
00040000-55b8-b8dc-8b25-9f7f344476f9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55b8-b8dc-9fc4-2ffad42ddb5c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55b8-b8dc-c506-6c37a7a4bcc8	AD	AND	020	Andorra 	Andora	\N
00040000-55b8-b8dc-42b6-dd21e3712ce4	AO	AGO	024	Angola 	Angola	\N
00040000-55b8-b8dc-45b9-cac805a80419	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55b8-b8dc-df77-85ce08ba6fb6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55b8-b8dc-c9bd-05dee1086d28	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55b8-b8dc-995d-cfad293cc89e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55b8-b8dc-edf8-eee9218cd7bd	AM	ARM	051	Armenia 	Armenija	\N
00040000-55b8-b8dc-c9d9-206f9fd7e424	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55b8-b8dc-93fe-a095adc86e81	AU	AUS	036	Australia 	Avstralija	\N
00040000-55b8-b8dc-645a-02970a3e4aea	AT	AUT	040	Austria 	Avstrija	\N
00040000-55b8-b8dc-a074-f7beb8bd93a8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55b8-b8dc-37c8-a536ae0ddcee	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55b8-b8dc-fe73-7c7e9c679eb6	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55b8-b8dc-7b31-4af2691d191c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55b8-b8dc-add9-8223fb8d5d67	BB	BRB	052	Barbados 	Barbados	\N
00040000-55b8-b8dc-dc0f-0f0ef8ee1698	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55b8-b8dc-3a08-12bc25183c39	BE	BEL	056	Belgium 	Belgija	\N
00040000-55b8-b8dc-b1cc-3c5ea7da8533	BZ	BLZ	084	Belize 	Belize	\N
00040000-55b8-b8dc-2eba-6ac165fdc69d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55b8-b8dc-36ba-29a1f56b188e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55b8-b8dc-eac4-17ed37fd226c	BT	BTN	064	Bhutan 	Butan	\N
00040000-55b8-b8dc-a396-05b2464ae417	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55b8-b8dc-17fd-35a51ba1169c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55b8-b8dc-84de-23016bc24384	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55b8-b8dc-6080-b66150b4f28a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55b8-b8dc-eb4a-05f9e991038f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55b8-b8dc-171c-038d58460667	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55b8-b8dc-117a-e60f29adb474	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55b8-b8dc-6c46-e9a53d4d2f28	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55b8-b8dc-3670-657ea0ef56a8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55b8-b8dc-31cf-4a73308f0d01	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55b8-b8dc-f366-2361a290d1a5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55b8-b8dc-7fe2-03e5f03cb46a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55b8-b8dc-0485-77871975b3cd	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55b8-b8dc-0b67-be5bfde47bf7	CA	CAN	124	Canada 	Kanada	\N
00040000-55b8-b8dc-6402-a010727c203c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55b8-b8dc-23d7-7819e622d609	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55b8-b8dc-73ed-4a5f67259105	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55b8-b8dc-906d-4a2974ede4a4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55b8-b8dc-9c0d-e09f3c80b521	CL	CHL	152	Chile 	Čile	\N
00040000-55b8-b8dc-3c07-d8800c9e5fa3	CN	CHN	156	China 	Kitajska	\N
00040000-55b8-b8dc-1c83-a96ce5fd1032	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55b8-b8dc-51bd-db4e822c10a8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55b8-b8dc-7a70-0e5c2769c9e5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55b8-b8dc-00b7-9ffffbb766db	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55b8-b8dc-3f9b-c05b4ae2c812	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55b8-b8dc-0241-cdd7b084bab8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55b8-b8dc-587b-6563cf9d6d90	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55b8-b8dc-e118-92f2289af2eb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55b8-b8dc-0774-f51c7b79c1d5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55b8-b8dc-6965-040d1ffb8994	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55b8-b8dc-2f84-409af05a9781	CU	CUB	192	Cuba 	Kuba	\N
00040000-55b8-b8dc-9220-7b3bb12118bd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55b8-b8dc-d3f2-60b58593bb8a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55b8-b8dc-fa8e-b27613459478	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55b8-b8dc-1207-138c208e5325	DK	DNK	208	Denmark 	Danska	\N
00040000-55b8-b8dc-610a-fb23ad2cc7e1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55b8-b8dc-0a01-f1497f4cd6ab	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55b8-b8dc-14ed-589f4206915c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55b8-b8dc-f4f7-e2938bf3084b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55b8-b8dc-4a00-9c0179f48042	EG	EGY	818	Egypt 	Egipt	\N
00040000-55b8-b8dc-5f8a-36efd6c78bb7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55b8-b8dc-cba2-f22bf5d034d6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55b8-b8dc-2e47-ccd8772bd11b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55b8-b8dc-51de-034fea75fec1	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55b8-b8dc-d70a-5ae08a49af0a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55b8-b8dc-d245-91db56f1c151	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55b8-b8dc-576c-5980c9b3e4cc	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55b8-b8dc-84f3-b06051dae35b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55b8-b8dc-2bf4-349b285108df	FI	FIN	246	Finland 	Finska	\N
00040000-55b8-b8dc-d303-7bd054bc81ec	FR	FRA	250	France 	Francija	\N
00040000-55b8-b8dc-3f2a-2bc0475b3692	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55b8-b8dc-24af-b4b6045bf6dc	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55b8-b8dc-6278-0ff19aae86cc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55b8-b8dc-bb05-5275af128c88	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55b8-b8dc-e756-38348c194db1	GA	GAB	266	Gabon 	Gabon	\N
00040000-55b8-b8dc-d959-ae155da2c310	GM	GMB	270	Gambia 	Gambija	\N
00040000-55b8-b8dc-7a87-4f4d4a172b2c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55b8-b8dc-f101-b0ccf7cbeb7a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55b8-b8dc-e037-56c063aae4a8	GH	GHA	288	Ghana 	Gana	\N
00040000-55b8-b8dc-34e7-d26ef307931e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55b8-b8dc-f582-186d3c8b4012	GR	GRC	300	Greece 	Grčija	\N
00040000-55b8-b8dc-883f-eba83341fe32	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55b8-b8dc-91dc-08f84b469329	GD	GRD	308	Grenada 	Grenada	\N
00040000-55b8-b8dc-deea-e1b1c94c09f7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55b8-b8dc-9a46-b5d3a2849199	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55b8-b8dc-f4e0-c99fe9abce3b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55b8-b8dc-d0e9-f45df08b6b1a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55b8-b8dc-94b3-14513deaa541	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55b8-b8dc-f9ce-0adf00e946b6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55b8-b8dc-6e21-9fadedb78c90	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55b8-b8dc-c10d-ed9370104fb1	HT	HTI	332	Haiti 	Haiti	\N
00040000-55b8-b8dc-71a9-a97240f7f09a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55b8-b8dc-51ff-6ebcce665eba	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55b8-b8dc-99d6-c8f5d0bdc5c5	HN	HND	340	Honduras 	Honduras	\N
00040000-55b8-b8dc-e27f-55b4141af76c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55b8-b8dc-bcc6-aefad10a8538	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55b8-b8dc-e47a-c402c78747d7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55b8-b8dc-2558-0b88e7a250d2	IN	IND	356	India 	Indija	\N
00040000-55b8-b8dc-99c1-5b2e02ad4806	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55b8-b8dc-da84-938e4dc5caf1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55b8-b8dc-aacb-88809f18e01d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55b8-b8dc-81d2-93b25c02e9ac	IE	IRL	372	Ireland 	Irska	\N
00040000-55b8-b8dc-0c94-a12edaf26684	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55b8-b8dc-0804-5cbb0f3cc7ba	IL	ISR	376	Israel 	Izrael	\N
00040000-55b8-b8dc-4c34-fe042f76be52	IT	ITA	380	Italy 	Italija	\N
00040000-55b8-b8dc-88b0-9466f66da6e7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55b8-b8dc-56fa-857251e3f57f	JP	JPN	392	Japan 	Japonska	\N
00040000-55b8-b8dc-a378-22d20cfc22fc	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55b8-b8dc-b1c8-a6dcc9b1a547	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55b8-b8dc-1949-7b466cdba327	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55b8-b8dc-d337-791e3c54fde6	KE	KEN	404	Kenya 	Kenija	\N
00040000-55b8-b8dc-92ae-bf4fda6c934b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55b8-b8dc-d2cf-adf0edf13cad	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55b8-b8dc-1b53-b2af76321783	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55b8-b8dc-80ac-95ca3a478b8f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55b8-b8dc-50ee-470efb2cfc48	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55b8-b8dc-b8fa-35dc4417702a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55b8-b8dc-f5a9-0bc84b9a5363	LV	LVA	428	Latvia 	Latvija	\N
00040000-55b8-b8dc-70a2-955f926d290b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55b8-b8dc-20d6-7692be8b954f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55b8-b8dc-1b03-8cb6cc76612a	LR	LBR	430	Liberia 	Liberija	\N
00040000-55b8-b8dc-a414-54c74a632057	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55b8-b8dc-245b-4d7dd9ff8e1c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55b8-b8dc-b1d9-625f5aaabe5c	LT	LTU	440	Lithuania 	Litva	\N
00040000-55b8-b8dc-702f-1daa917d8b42	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55b8-b8dc-85d5-f5aa93296c19	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55b8-b8dc-321f-a7e69047617c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55b8-b8dc-2caf-8606b01adacd	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55b8-b8dc-8847-123185f95390	MW	MWI	454	Malawi 	Malavi	\N
00040000-55b8-b8dc-102f-9659e6b40d5c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55b8-b8dc-f9a3-d9f47ae90984	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55b8-b8dc-1d87-0cb05ad29c59	ML	MLI	466	Mali 	Mali	\N
00040000-55b8-b8dc-856a-094a2fd0f0b3	MT	MLT	470	Malta 	Malta	\N
00040000-55b8-b8dc-26d7-2d64168bbe81	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55b8-b8dc-3efe-4b4248599895	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55b8-b8dc-b9c9-d01b020281af	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55b8-b8dc-e60f-2ffefa58f3d4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55b8-b8dc-9427-34b94dce2fe8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55b8-b8dc-daba-2a72cc308196	MX	MEX	484	Mexico 	Mehika	\N
00040000-55b8-b8dc-e497-be0df2440ffc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55b8-b8dc-2f8e-b5119a779c43	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55b8-b8dc-7b0a-4eba5ec8ed58	MC	MCO	492	Monaco 	Monako	\N
00040000-55b8-b8dc-25ea-3ebfcd2d1d17	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55b8-b8dc-abf1-f471244f9267	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55b8-b8dc-753c-80412b569048	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55b8-b8dc-f84d-5f4e0da9e271	MA	MAR	504	Morocco 	Maroko	\N
00040000-55b8-b8dc-9452-428a8483a47c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55b8-b8dc-350b-0985a1c6c71b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55b8-b8dc-f440-26883cea54f9	NA	NAM	516	Namibia 	Namibija	\N
00040000-55b8-b8dc-d2d7-872ab7f70187	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55b8-b8dc-e6c6-c13270147105	NP	NPL	524	Nepal 	Nepal	\N
00040000-55b8-b8dc-ee3e-c9272cae3a77	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55b8-b8dc-07e4-1010434ccb4a	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55b8-b8dc-bb68-a1eda2971c46	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55b8-b8dc-f2b3-29a31423cf1d	NE	NER	562	Niger 	Niger 	\N
00040000-55b8-b8dc-2b43-3445c66d8a03	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55b8-b8dc-e36f-ea433a00157e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55b8-b8dc-3ba6-73f9d034a706	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55b8-b8dc-5812-4b0ddebc9d71	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55b8-b8dc-48f1-f3f8caed022e	NO	NOR	578	Norway 	Norveška	\N
00040000-55b8-b8dc-7d28-3a506614bcb5	OM	OMN	512	Oman 	Oman	\N
00040000-55b8-b8dc-a97c-de22fb20baa3	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55b8-b8dc-7f0b-9b435d988871	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55b8-b8dc-041e-b25487a739a2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55b8-b8dc-22f6-02233c8f966d	PA	PAN	591	Panama 	Panama	\N
00040000-55b8-b8dc-66fa-35204c64afaa	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55b8-b8dc-76c2-8b24eca618b5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55b8-b8dc-1e3f-964fc3e0c7d5	PE	PER	604	Peru 	Peru	\N
00040000-55b8-b8dc-46e3-44b4a158cb79	PH	PHL	608	Philippines 	Filipini	\N
00040000-55b8-b8dc-b6da-a4e69936103b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55b8-b8dc-92d8-16c100f63149	PL	POL	616	Poland 	Poljska	\N
00040000-55b8-b8dc-24bf-538330b08c07	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55b8-b8dc-f469-2eee7d09b5c0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55b8-b8dc-7def-caa280c483c0	QA	QAT	634	Qatar 	Katar	\N
00040000-55b8-b8dc-47e4-c9e776f6ab76	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55b8-b8dc-1910-7ff997447f9d	RO	ROU	642	Romania 	Romunija	\N
00040000-55b8-b8dc-b556-e817245994e4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55b8-b8dc-baa5-cf361dded75d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55b8-b8dc-5ac2-bd34d3e9a4d5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55b8-b8dc-cee2-81628cded57a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55b8-b8dc-65ec-54cf9cb9de8f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55b8-b8dc-abec-deb7af1fb8b1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55b8-b8dc-72ad-bd492179a1ce	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55b8-b8dc-fceb-4892909da883	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55b8-b8dc-966a-f5ba35e471cc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55b8-b8dc-643d-393666492f4e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55b8-b8dc-5223-6ff8006f3400	SM	SMR	674	San Marino 	San Marino	\N
00040000-55b8-b8dc-8fbb-bad04c64b2f2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55b8-b8dc-daf9-67ad1da37c34	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55b8-b8dc-0935-d477fdcf32fa	SN	SEN	686	Senegal 	Senegal	\N
00040000-55b8-b8dc-dd8b-8986660facc4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55b8-b8dc-a95c-00cb3bc6f85d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55b8-b8dc-6317-c893c30f7c13	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55b8-b8dc-fa02-8ab6d4793bd5	SG	SGP	702	Singapore 	Singapur	\N
00040000-55b8-b8dc-c037-519cd0926257	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55b8-b8dc-4405-84ba861f7837	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55b8-b8dc-7d58-d6526f8c0b5e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55b8-b8dc-8407-3d5e44fd6af0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55b8-b8dc-a1aa-5500e801bb06	SO	SOM	706	Somalia 	Somalija	\N
00040000-55b8-b8dc-f170-3981f046dd77	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55b8-b8dc-68ca-b78e9fc36369	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55b8-b8dc-b562-e929e2746d50	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55b8-b8dc-3344-d822c560f500	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55b8-b8dc-79ad-2c3b99759931	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55b8-b8dc-0c36-f4099ff4ebf8	SD	SDN	729	Sudan 	Sudan	\N
00040000-55b8-b8dc-d541-7006b850ab7c	SR	SUR	740	Suriname 	Surinam	\N
00040000-55b8-b8dc-1dc4-4a76540cad35	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55b8-b8dc-9c08-4dbc8c916931	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55b8-b8dc-ee12-a8569c6c7da5	SE	SWE	752	Sweden 	Švedska	\N
00040000-55b8-b8dc-7de1-ec363c9d447d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55b8-b8dc-734d-cc7adfcdfc66	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55b8-b8dc-59e4-27f86cdcca85	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55b8-b8dc-1c8f-531cc39f7e67	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55b8-b8dc-c6e9-71585246a1f6	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55b8-b8dc-63a4-10752840f843	TH	THA	764	Thailand 	Tajska	\N
00040000-55b8-b8dc-dac1-7c7273e39eda	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55b8-b8dc-9779-3fad76f53df5	TG	TGO	768	Togo 	Togo	\N
00040000-55b8-b8dc-3cce-96ed4a4812e9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55b8-b8dc-f4cb-73b8bd2c24b7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55b8-b8dc-04a0-f42a171f3abc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55b8-b8dc-5818-92f485c7b873	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55b8-b8dc-adb8-578e07851a96	TR	TUR	792	Turkey 	Turčija	\N
00040000-55b8-b8dc-8bef-da5a433a8a5b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55b8-b8dc-e5c8-87a221769614	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55b8-b8dc-ea24-555d85b97ac4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55b8-b8dc-8874-4d207fba9989	UG	UGA	800	Uganda 	Uganda	\N
00040000-55b8-b8dc-51c7-9a3031609547	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55b8-b8dc-11ea-1c3ccb74c227	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55b8-b8dc-f8e4-dcd777b76ac8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55b8-b8dc-eb67-4ddafc12153d	US	USA	840	United States 	Združene države Amerike	\N
00040000-55b8-b8dc-d5cc-33eacbd473e5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55b8-b8dc-07e9-b3fad2db08e7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55b8-b8dc-c3a3-84905dcb0250	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55b8-b8dc-ffb5-d9249db44bbb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55b8-b8dc-97e7-1b23eb154ce9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55b8-b8dc-1bbd-e1b16df147fb	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55b8-b8dc-3578-daacefe3a24e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55b8-b8dc-bf6e-10a7a9cee577	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55b8-b8dc-778e-705640547786	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55b8-b8dc-4871-bf28956a4ebf	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55b8-b8dc-35dc-9b27aca8d59e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55b8-b8dc-a95d-24a1a1f52b86	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55b8-b8dc-5c92-d064dd4c25b9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3015 (class 0 OID 10872681)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55b8-b8de-148f-ed1c19b2c7e2	000e0000-55b8-b8de-6153-132957ed8db3	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0	Raznovrstni dogodek		\N	002b0000-55b8-b8dd-7e2b-cc74aee0f629	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55b8-b8de-537e-abcf7488ccbc	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55b8-b8dd-117b-3e2f00cc9674	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55b8-b8de-a5ce-231f22bedfae	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0		Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55b8-b8de-cf7b-983082b98e96	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0		Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3002 (class 0 OID 10872508)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55b8-b8de-8963-5d307b136576	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55b8-b8dd-f04c-a3bac0d89138
000d0000-55b8-b8de-a3bf-f2b6cbc2c35d	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55b8-b8dd-f04c-a3bac0d89138
000d0000-55b8-b8de-6679-8f9adf9f3ed8	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55b8-b8dd-f573-32eaae156ae3
000d0000-55b8-b8de-38a1-798d40d9276d	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55b8-b8dd-02c3-b87e5e987696
000d0000-55b8-b8de-6074-1a65269a72b0	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55b8-b8dd-8358-0c3d74f1ecb7
000d0000-55b8-b8de-b598-271596e8e6d5	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55b8-b8dd-ade4-dfe6f3e13735
000d0000-55b8-b8de-8469-b0d01451ee4a	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55b8-b8dd-f04c-a3bac0d89138
000d0000-55b8-b8de-2ffa-6d0c49da3413	000e0000-55b8-b8de-120a-8ceeaaa3c959	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55b8-b8dd-dbc2-d25af8ef494f
\.


--
-- TOC entry 2981 (class 0 OID 10872328)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 10872376)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 10872308)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55b8-b8de-21ce-ae07e4ae29bd	00080000-55b8-b8de-1474-7c3d75cd1ba8	00090000-55b8-b8de-a8c2-300995023195	AK		
\.


--
-- TOC entry 2956 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 10872425)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 10872865)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 10872877)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 10872900)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 10872450)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 10872265)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55b8-b8dd-77c2-a761dcc2397f	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55b8-b8dd-1ff4-e68cc76c48d9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55b8-b8dd-f7ac-13aed6186d0e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55b8-b8dd-8f18-831bfaf92b58	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55b8-b8dd-06e2-9a23116c6a59	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55b8-b8dd-3a1d-7dfa19b4092f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55b8-b8dd-4e66-32f003f14038	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55b8-b8dd-6de5-2ced9511cf9c	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55b8-b8dd-4027-80eda32eaabc	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55b8-b8dd-af0d-ef85b88b6893	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55b8-b8dd-34d7-4bf2aed39547	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55b8-b8dd-e49f-6228dbbf5f40	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55b8-b8dd-7ff1-5d8b05022bc6	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55b8-b8dd-048a-0ce80e3e363a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55b8-b8de-1762-0688db8fa43a	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55b8-b8de-9a02-ca833db63511	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55b8-b8de-426a-6c524c50d514	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55b8-b8de-7b5d-dfa7268f183e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55b8-b8de-0fd0-6080ef964f95	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55b8-b8de-63ec-1e5e4ec49eaa	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2970 (class 0 OID 10872178)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55b8-b8de-b8b3-f987f105822f	00000000-55b8-b8de-9a02-ca833db63511	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55b8-b8de-f2df-6e5059254080	00000000-55b8-b8de-9a02-ca833db63511	00010000-55b8-b8dd-3dc2-d71b18a73680	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55b8-b8de-ed9f-da77f0930c44	00000000-55b8-b8de-426a-6c524c50d514	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2971 (class 0 OID 10872189)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55b8-b8de-dc9e-37de9400839a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55b8-b8de-e5a9-b36e5f67ead4	00010000-55b8-b8de-1c3c-d700bb706cc8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55b8-b8de-e927-1ece1f1c45aa	00010000-55b8-b8de-9536-aaef0dc262e0	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55b8-b8de-a6d2-d27189ad8c9d	00010000-55b8-b8de-8a76-b7da45a64650	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55b8-b8de-9396-eed29e8f089b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55b8-b8de-45e0-7f905e2b9782	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55b8-b8de-e94a-28088c6f860f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55b8-b8de-5c9e-958d0938a582	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55b8-b8de-a8c2-300995023195	00010000-55b8-b8de-4bcf-106c4f312c1e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55b8-b8de-5b22-5b02f407e7b2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55b8-b8de-38f0-e2f9b00c8e5e	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55b8-b8de-a762-6efa52638d9f	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55b8-b8de-5ddf-a0fbfe64cd7c	00010000-55b8-b8de-eb99-0332d110358c	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2958 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 10872143)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55b8-b8dc-4c4d-216f41b86ba8	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55b8-b8dc-43ee-4b36d6546f64	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55b8-b8dc-d15e-b3760026d4eb	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55b8-b8dc-ba6a-88f64f6b39d0	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55b8-b8dc-6fed-e297d0c4c97a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55b8-b8dc-32e6-b1cc6deb2567	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55b8-b8dc-0cc7-d2d21efb8739	Abonma-read	Abonma - branje	f
00030000-55b8-b8dc-d260-4302788182db	Abonma-write	Abonma - spreminjanje	f
00030000-55b8-b8dc-4657-1bd45cd042e9	Alternacija-read	Alternacija - branje	f
00030000-55b8-b8dc-bb99-77afa7ad87ba	Alternacija-write	Alternacija - spreminjanje	f
00030000-55b8-b8dc-1986-43781ec1dd97	Arhivalija-read	Arhivalija - branje	f
00030000-55b8-b8dc-8732-eba837d4fea4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55b8-b8dc-faa2-3bb72f7cac57	Besedilo-read	Besedilo - branje	f
00030000-55b8-b8dc-0419-c84e0a5a1225	Besedilo-write	Besedilo - spreminjanje	f
00030000-55b8-b8dc-ffb5-29144ff6a0ae	DogodekIzven-read	DogodekIzven - branje	f
00030000-55b8-b8dc-65af-2802830b10d6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55b8-b8dd-3823-8ffb06659524	Dogodek-read	Dogodek - branje	f
00030000-55b8-b8dd-89e2-ec333813ca47	Dogodek-write	Dogodek - spreminjanje	f
00030000-55b8-b8dd-9c4b-0df260cfefc9	DrugiVir-read	DrugiVir - branje	f
00030000-55b8-b8dd-4c3c-2c7d428443ea	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55b8-b8dd-efed-7d9e105b3f25	Drzava-read	Drzava - branje	f
00030000-55b8-b8dd-ecf5-7938ff6e8499	Drzava-write	Drzava - spreminjanje	f
00030000-55b8-b8dd-3a7d-629cee9b9541	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55b8-b8dd-4c88-03193fb8dcaa	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55b8-b8dd-c4dd-a5e57da07bf7	Funkcija-read	Funkcija - branje	f
00030000-55b8-b8dd-e3e6-ecdafa186061	Funkcija-write	Funkcija - spreminjanje	f
00030000-55b8-b8dd-53d1-802506fee7f8	Gostovanje-read	Gostovanje - branje	f
00030000-55b8-b8dd-beed-6e37a94ff365	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55b8-b8dd-f3a0-ef0f6bca9395	Gostujoca-read	Gostujoca - branje	f
00030000-55b8-b8dd-cc46-7aa2438f68af	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55b8-b8dd-9b84-b5ef60fdf521	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55b8-b8dd-5243-3238537d86b3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55b8-b8dd-2ab5-2330dca6df96	Kupec-read	Kupec - branje	f
00030000-55b8-b8dd-d587-242fb0e35611	Kupec-write	Kupec - spreminjanje	f
00030000-55b8-b8dd-ab8b-11b1241463f6	NacinPlacina-read	NacinPlacina - branje	f
00030000-55b8-b8dd-e49e-8a503cc31372	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55b8-b8dd-c87d-056953bbb102	Option-read	Option - branje	f
00030000-55b8-b8dd-3141-e6b9fd7029a3	Option-write	Option - spreminjanje	f
00030000-55b8-b8dd-b730-bc85526bda98	OptionValue-read	OptionValue - branje	f
00030000-55b8-b8dd-433c-7ccded63d4b6	OptionValue-write	OptionValue - spreminjanje	f
00030000-55b8-b8dd-c48f-ada0f2e3033a	Oseba-read	Oseba - branje	f
00030000-55b8-b8dd-ae72-9f72be4fe2d9	Oseba-write	Oseba - spreminjanje	f
00030000-55b8-b8dd-1b5c-7445d24ddfef	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55b8-b8dd-bbf5-b3699e30d798	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55b8-b8dd-d29d-8196f0a0aa04	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55b8-b8dd-ce7d-5160eb999498	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55b8-b8dd-275e-3b01fe5ceab6	Pogodba-read	Pogodba - branje	f
00030000-55b8-b8dd-d427-b993d81213c9	Pogodba-write	Pogodba - spreminjanje	f
00030000-55b8-b8dd-1b91-f5da08d349d5	Popa-read	Popa - branje	f
00030000-55b8-b8dd-f338-56fb89564f6c	Popa-write	Popa - spreminjanje	f
00030000-55b8-b8dd-f25c-51af126d4dfd	Posta-read	Posta - branje	f
00030000-55b8-b8dd-247f-ce2c1f951a68	Posta-write	Posta - spreminjanje	f
00030000-55b8-b8dd-1517-b05029c5e907	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55b8-b8dd-3390-dd5432a34549	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55b8-b8dd-ad2d-4cb2e251b282	PostniNaslov-read	PostniNaslov - branje	f
00030000-55b8-b8dd-5fae-b8d9915b2fe7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55b8-b8dd-708d-ee408170c059	Predstava-read	Predstava - branje	f
00030000-55b8-b8dd-1027-96f698ba7b2a	Predstava-write	Predstava - spreminjanje	f
00030000-55b8-b8dd-e68d-2c9da3910811	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55b8-b8dd-c4e8-dd4e9f78331d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55b8-b8dd-9405-8bcdfcc050f9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55b8-b8dd-5f48-44d530fe4b70	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55b8-b8dd-cc4e-3de6fb780d57	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55b8-b8dd-710b-074e00a56596	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55b8-b8dd-1caf-1270d4efa3fd	ProgramDela-read	ProgramDela - branje	f
00030000-55b8-b8dd-9f1e-0f4f62cf4cec	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55b8-b8dd-5044-337e8f7e97cd	ProgramFestival-read	ProgramFestival - branje	f
00030000-55b8-b8dd-c03a-89f9b5a9013c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55b8-b8dd-2bb0-65d7c78fd5aa	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55b8-b8dd-3a3c-dff108896533	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55b8-b8dd-7ad8-dff5a9afe245	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55b8-b8dd-013d-7a020749e550	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55b8-b8dd-e220-167e46ab5154	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55b8-b8dd-1130-770a860d5e2d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55b8-b8dd-3f67-4c94dd37b3dd	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55b8-b8dd-942b-6b2b8850d331	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55b8-b8dd-de08-9aad0b737e79	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55b8-b8dd-110e-fc3a9f93ea63	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55b8-b8dd-6f46-3ab1a59e741d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55b8-b8dd-6af4-df2b26a6f633	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55b8-b8dd-276a-071d2983028e	ProgramRazno-read	ProgramRazno - branje	f
00030000-55b8-b8dd-11e2-eceb6527c41f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55b8-b8dd-aea3-309c3b45b7db	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55b8-b8dd-d527-c614e61ff69f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55b8-b8dd-c1fc-f74ec3b8ab31	Prostor-read	Prostor - branje	f
00030000-55b8-b8dd-e644-f77044287ba9	Prostor-write	Prostor - spreminjanje	f
00030000-55b8-b8dd-f51d-11a3616c312b	Racun-read	Racun - branje	f
00030000-55b8-b8dd-b02a-658ddcdeca9d	Racun-write	Racun - spreminjanje	f
00030000-55b8-b8dd-3284-9b2e159cb07e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55b8-b8dd-6fe1-b7ed0c548350	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55b8-b8dd-909e-0c77370017ca	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55b8-b8dd-ff63-5f7c56be2fc0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55b8-b8dd-3b90-b5ba2bfc51a1	Rekvizit-read	Rekvizit - branje	f
00030000-55b8-b8dd-0b53-21cbb3851dff	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55b8-b8dd-a0dc-a6394e60e916	Revizija-read	Revizija - branje	f
00030000-55b8-b8dd-bd5a-4c96c79628b5	Revizija-write	Revizija - spreminjanje	f
00030000-55b8-b8dd-a37f-1fd5c5722886	Rezervacija-read	Rezervacija - branje	f
00030000-55b8-b8dd-0e0a-dc725ccec91a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55b8-b8dd-f0f8-e224f1c64de1	SedezniRed-read	SedezniRed - branje	f
00030000-55b8-b8dd-cbd0-aae59148d1cd	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55b8-b8dd-c111-446638744c40	Sedez-read	Sedez - branje	f
00030000-55b8-b8dd-1466-2a0cc3c89bb0	Sedez-write	Sedez - spreminjanje	f
00030000-55b8-b8dd-de18-cf1e6390e04c	Sezona-read	Sezona - branje	f
00030000-55b8-b8dd-47aa-8f74c43967c6	Sezona-write	Sezona - spreminjanje	f
00030000-55b8-b8dd-f4dd-8fdac49a74fd	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55b8-b8dd-8ea8-c6fe83a1827f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55b8-b8dd-2150-be17ae2784eb	Stevilcenje-read	Stevilcenje - branje	f
00030000-55b8-b8dd-4fde-faa8d4465402	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55b8-b8dd-dac9-d4dbb6c40b5f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55b8-b8dd-3df0-ba76de380116	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55b8-b8dd-abde-30ec41eec6f7	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55b8-b8dd-9b11-9acaec1a702f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55b8-b8dd-ce1f-674df03d7d17	Telefonska-read	Telefonska - branje	f
00030000-55b8-b8dd-6b41-d9ca79eb893f	Telefonska-write	Telefonska - spreminjanje	f
00030000-55b8-b8dd-1b3e-154e1c51a750	TerminStoritve-read	TerminStoritve - branje	f
00030000-55b8-b8dd-b0f8-5782cef78fe1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55b8-b8dd-6e48-705111d9bdad	TipFunkcije-read	TipFunkcije - branje	f
00030000-55b8-b8dd-7465-5e76b24e28e8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55b8-b8dd-5ada-12e4e317e9df	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55b8-b8dd-2cff-14ccc4d29226	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55b8-b8dd-615d-db43197ede4e	Trr-read	Trr - branje	f
00030000-55b8-b8dd-4bc6-ad543d31b134	Trr-write	Trr - spreminjanje	f
00030000-55b8-b8dd-ec97-270ae4c5e853	Uprizoritev-read	Uprizoritev - branje	f
00030000-55b8-b8dd-017c-43b0fdb1f8dd	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55b8-b8dd-e4ec-040f7aa448d3	Vaja-read	Vaja - branje	f
00030000-55b8-b8dd-83e0-719194be4cb0	Vaja-write	Vaja - spreminjanje	f
00030000-55b8-b8dd-1bdf-091eb5abc726	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55b8-b8dd-5cd8-4684976fe525	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55b8-b8dd-e497-568f032e06ee	Zaposlitev-read	Zaposlitev - branje	f
00030000-55b8-b8dd-0e98-98622733bdef	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55b8-b8dd-a7d4-73748db1b042	Zasedenost-read	Zasedenost - branje	f
00030000-55b8-b8dd-82d6-6059b016f64e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55b8-b8dd-24fa-19f59e7beb5e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55b8-b8dd-fb77-4e4e82bbb027	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55b8-b8dd-b39f-91f4c5ab0405	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55b8-b8dd-9c03-5a3ddb987fb7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55b8-b8dd-8c74-de6016ab15e2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55b8-b8dd-e840-b0b59be7e333	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55b8-b8dd-579e-a26b25dea25b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55b8-b8dd-5fd7-87328f354bb3	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55b8-b8dd-755f-c82e18be2d5d	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55b8-b8dd-876f-75e1821b1148	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55b8-b8dd-4b01-04751f219815	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55b8-b8dd-51e6-994c9ddcde37	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55b8-b8dd-1574-5f81ab467d3f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55b8-b8dd-e688-80e3671c7239	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55b8-b8dd-1e95-c319133a7fdd	Datoteka-write	Datoteka - spreminjanje	f
00030000-55b8-b8dd-d9e5-a578c20b347d	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2968 (class 0 OID 10872162)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55b8-b8dd-4229-005a4d6e49a0	00030000-55b8-b8dc-43ee-4b36d6546f64
00020000-55b8-b8dd-f02d-2e376f1e2624	00030000-55b8-b8dd-efed-7d9e105b3f25
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dc-0cc7-d2d21efb8739
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dc-d260-4302788182db
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dc-4657-1bd45cd042e9
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dc-bb99-77afa7ad87ba
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dc-1986-43781ec1dd97
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-3823-8ffb06659524
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dc-ba6a-88f64f6b39d0
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-89e2-ec333813ca47
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-efed-7d9e105b3f25
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-ecf5-7938ff6e8499
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-c4dd-a5e57da07bf7
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-e3e6-ecdafa186061
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-53d1-802506fee7f8
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-beed-6e37a94ff365
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-f3a0-ef0f6bca9395
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-cc46-7aa2438f68af
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-9b84-b5ef60fdf521
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-5243-3238537d86b3
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-c87d-056953bbb102
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-b730-bc85526bda98
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-c48f-ada0f2e3033a
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-ae72-9f72be4fe2d9
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-1b91-f5da08d349d5
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-f338-56fb89564f6c
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-f25c-51af126d4dfd
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-247f-ce2c1f951a68
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-ad2d-4cb2e251b282
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-5fae-b8d9915b2fe7
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-708d-ee408170c059
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-1027-96f698ba7b2a
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-cc4e-3de6fb780d57
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-710b-074e00a56596
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-c1fc-f74ec3b8ab31
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-e644-f77044287ba9
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-909e-0c77370017ca
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-ff63-5f7c56be2fc0
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-3b90-b5ba2bfc51a1
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-0b53-21cbb3851dff
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-de18-cf1e6390e04c
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-47aa-8f74c43967c6
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-6e48-705111d9bdad
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-ec97-270ae4c5e853
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-017c-43b0fdb1f8dd
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-e4ec-040f7aa448d3
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-83e0-719194be4cb0
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-a7d4-73748db1b042
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-82d6-6059b016f64e
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-24fa-19f59e7beb5e
00020000-55b8-b8dd-8e08-f4e87704dc88	00030000-55b8-b8dd-b39f-91f4c5ab0405
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dc-0cc7-d2d21efb8739
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dc-1986-43781ec1dd97
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-3823-8ffb06659524
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-efed-7d9e105b3f25
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-53d1-802506fee7f8
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-f3a0-ef0f6bca9395
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-9b84-b5ef60fdf521
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-5243-3238537d86b3
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-c87d-056953bbb102
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-b730-bc85526bda98
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-c48f-ada0f2e3033a
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-ae72-9f72be4fe2d9
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-1b91-f5da08d349d5
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-f25c-51af126d4dfd
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-ad2d-4cb2e251b282
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-5fae-b8d9915b2fe7
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-708d-ee408170c059
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-c1fc-f74ec3b8ab31
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-909e-0c77370017ca
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-3b90-b5ba2bfc51a1
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-de18-cf1e6390e04c
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-ce1f-674df03d7d17
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-6b41-d9ca79eb893f
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-615d-db43197ede4e
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-4bc6-ad543d31b134
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-e497-568f032e06ee
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-0e98-98622733bdef
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-24fa-19f59e7beb5e
00020000-55b8-b8dd-d20d-7470ac39be7f	00030000-55b8-b8dd-b39f-91f4c5ab0405
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dc-0cc7-d2d21efb8739
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dc-4657-1bd45cd042e9
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dc-1986-43781ec1dd97
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dc-8732-eba837d4fea4
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dc-faa2-3bb72f7cac57
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dc-ffb5-29144ff6a0ae
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-3823-8ffb06659524
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-efed-7d9e105b3f25
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-c4dd-a5e57da07bf7
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-53d1-802506fee7f8
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-f3a0-ef0f6bca9395
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-9b84-b5ef60fdf521
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-c87d-056953bbb102
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-b730-bc85526bda98
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-c48f-ada0f2e3033a
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-1b91-f5da08d349d5
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-f25c-51af126d4dfd
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-708d-ee408170c059
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-cc4e-3de6fb780d57
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-c1fc-f74ec3b8ab31
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-909e-0c77370017ca
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-3b90-b5ba2bfc51a1
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-de18-cf1e6390e04c
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-6e48-705111d9bdad
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-e4ec-040f7aa448d3
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-a7d4-73748db1b042
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-24fa-19f59e7beb5e
00020000-55b8-b8dd-461b-dc90b3a8a9f4	00030000-55b8-b8dd-b39f-91f4c5ab0405
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dc-0cc7-d2d21efb8739
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dc-d260-4302788182db
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dc-bb99-77afa7ad87ba
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dc-1986-43781ec1dd97
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-3823-8ffb06659524
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-efed-7d9e105b3f25
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-53d1-802506fee7f8
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-f3a0-ef0f6bca9395
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-c87d-056953bbb102
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-b730-bc85526bda98
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-1b91-f5da08d349d5
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-f25c-51af126d4dfd
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-708d-ee408170c059
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-c1fc-f74ec3b8ab31
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-909e-0c77370017ca
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-3b90-b5ba2bfc51a1
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-de18-cf1e6390e04c
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-6e48-705111d9bdad
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-24fa-19f59e7beb5e
00020000-55b8-b8dd-e3c8-cf1826b5a22c	00030000-55b8-b8dd-b39f-91f4c5ab0405
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dc-0cc7-d2d21efb8739
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dc-1986-43781ec1dd97
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-3823-8ffb06659524
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-efed-7d9e105b3f25
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-53d1-802506fee7f8
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-f3a0-ef0f6bca9395
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-c87d-056953bbb102
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-b730-bc85526bda98
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-1b91-f5da08d349d5
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-f25c-51af126d4dfd
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-708d-ee408170c059
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-c1fc-f74ec3b8ab31
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-909e-0c77370017ca
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-3b90-b5ba2bfc51a1
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-de18-cf1e6390e04c
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-1b3e-154e1c51a750
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dc-d15e-b3760026d4eb
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-6e48-705111d9bdad
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-24fa-19f59e7beb5e
00020000-55b8-b8dd-2d73-b6d6229d4e91	00030000-55b8-b8dd-b39f-91f4c5ab0405
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-4c4d-216f41b86ba8
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-43ee-4b36d6546f64
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-d15e-b3760026d4eb
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-ba6a-88f64f6b39d0
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-6fed-e297d0c4c97a
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-32e6-b1cc6deb2567
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-0cc7-d2d21efb8739
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-d260-4302788182db
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-4657-1bd45cd042e9
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-bb99-77afa7ad87ba
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-1986-43781ec1dd97
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-8732-eba837d4fea4
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-faa2-3bb72f7cac57
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-0419-c84e0a5a1225
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-ffb5-29144ff6a0ae
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dc-65af-2802830b10d6
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3823-8ffb06659524
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-89e2-ec333813ca47
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-efed-7d9e105b3f25
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-ecf5-7938ff6e8499
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-9c4b-0df260cfefc9
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-4c3c-2c7d428443ea
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3a7d-629cee9b9541
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-4c88-03193fb8dcaa
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-c4dd-a5e57da07bf7
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-e3e6-ecdafa186061
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-53d1-802506fee7f8
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-beed-6e37a94ff365
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-f3a0-ef0f6bca9395
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-cc46-7aa2438f68af
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-9b84-b5ef60fdf521
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-5243-3238537d86b3
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-2ab5-2330dca6df96
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-d587-242fb0e35611
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-ab8b-11b1241463f6
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-e49e-8a503cc31372
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-c87d-056953bbb102
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3141-e6b9fd7029a3
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-b730-bc85526bda98
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-433c-7ccded63d4b6
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-c48f-ada0f2e3033a
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-ae72-9f72be4fe2d9
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1b5c-7445d24ddfef
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-bbf5-b3699e30d798
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-d29d-8196f0a0aa04
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-ce7d-5160eb999498
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-275e-3b01fe5ceab6
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-d427-b993d81213c9
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1b91-f5da08d349d5
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-f338-56fb89564f6c
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-f25c-51af126d4dfd
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-247f-ce2c1f951a68
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1517-b05029c5e907
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3390-dd5432a34549
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-ad2d-4cb2e251b282
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-5fae-b8d9915b2fe7
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-708d-ee408170c059
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1027-96f698ba7b2a
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-e68d-2c9da3910811
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-c4e8-dd4e9f78331d
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-9405-8bcdfcc050f9
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-5f48-44d530fe4b70
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-cc4e-3de6fb780d57
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-710b-074e00a56596
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1caf-1270d4efa3fd
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-9f1e-0f4f62cf4cec
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-5044-337e8f7e97cd
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-c03a-89f9b5a9013c
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-2bb0-65d7c78fd5aa
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3a3c-dff108896533
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-7ad8-dff5a9afe245
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-013d-7a020749e550
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-e220-167e46ab5154
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1130-770a860d5e2d
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3f67-4c94dd37b3dd
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-942b-6b2b8850d331
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-de08-9aad0b737e79
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-110e-fc3a9f93ea63
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-6f46-3ab1a59e741d
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-6af4-df2b26a6f633
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-276a-071d2983028e
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-11e2-eceb6527c41f
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-aea3-309c3b45b7db
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-d527-c614e61ff69f
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-c1fc-f74ec3b8ab31
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-e644-f77044287ba9
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-f51d-11a3616c312b
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-b02a-658ddcdeca9d
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3284-9b2e159cb07e
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-6fe1-b7ed0c548350
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-909e-0c77370017ca
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-ff63-5f7c56be2fc0
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3b90-b5ba2bfc51a1
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-0b53-21cbb3851dff
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-a0dc-a6394e60e916
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-bd5a-4c96c79628b5
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-a37f-1fd5c5722886
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-0e0a-dc725ccec91a
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-f0f8-e224f1c64de1
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-cbd0-aae59148d1cd
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-c111-446638744c40
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1466-2a0cc3c89bb0
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-de18-cf1e6390e04c
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-47aa-8f74c43967c6
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-f4dd-8fdac49a74fd
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-8ea8-c6fe83a1827f
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-2150-be17ae2784eb
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-4fde-faa8d4465402
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-dac9-d4dbb6c40b5f
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-3df0-ba76de380116
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-abde-30ec41eec6f7
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-9b11-9acaec1a702f
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-ce1f-674df03d7d17
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-6b41-d9ca79eb893f
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1b3e-154e1c51a750
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-b0f8-5782cef78fe1
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-6e48-705111d9bdad
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-7465-5e76b24e28e8
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-5ada-12e4e317e9df
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-2cff-14ccc4d29226
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-615d-db43197ede4e
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-4bc6-ad543d31b134
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-ec97-270ae4c5e853
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-017c-43b0fdb1f8dd
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-e4ec-040f7aa448d3
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-83e0-719194be4cb0
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-1bdf-091eb5abc726
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-5cd8-4684976fe525
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-e497-568f032e06ee
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-0e98-98622733bdef
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-a7d4-73748db1b042
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-82d6-6059b016f64e
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-24fa-19f59e7beb5e
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-fb77-4e4e82bbb027
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-b39f-91f4c5ab0405
00020000-55b8-b8de-d7c5-5a8ac59b12c7	00030000-55b8-b8dd-9c03-5a3ddb987fb7
\.


--
-- TOC entry 2996 (class 0 OID 10872457)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 10872488)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 10872602)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55b8-b8de-50d2-fb49495134fd	00090000-55b8-b8de-dc9e-37de9400839a	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55b8-b8de-679a-9b8e13b6cc74	00090000-55b8-b8de-45e0-7f905e2b9782	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55b8-b8de-e352-9c42b3a8c6aa	00090000-55b8-b8de-5ddf-a0fbfe64cd7c	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2973 (class 0 OID 10872222)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55b8-b8de-1474-7c3d75cd1ba8	00040000-55b8-b8dc-7d58-d6526f8c0b5e	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b8-b8de-93b2-ee9a25690df1	00040000-55b8-b8dc-7d58-d6526f8c0b5e	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55b8-b8de-f625-07a834ab85ad	00040000-55b8-b8dc-7d58-d6526f8c0b5e	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b8-b8de-9085-9b123b712810	00040000-55b8-b8dc-7d58-d6526f8c0b5e	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b8-b8de-0abf-115f3bb2c789	00040000-55b8-b8dc-7d58-d6526f8c0b5e	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b8-b8de-7c0e-a6838444f116	00040000-55b8-b8dc-995d-cfad293cc89e	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b8-b8de-8365-71a1bc3a5de1	00040000-55b8-b8dc-6965-040d1ffb8994	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b8-b8de-535b-05a61d517438	00040000-55b8-b8dc-645a-02970a3e4aea	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b8-b8de-af0c-c6d7a9237c51	00040000-55b8-b8dc-7d58-d6526f8c0b5e	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2975 (class 0 OID 10872257)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55b8-b8dd-44d1-dcb50641603f	8341	Adlešiči
00050000-55b8-b8dd-97bd-f163f8334a55	5270	Ajdovščina
00050000-55b8-b8dd-531f-58e9b4a583a9	6280	Ankaran/Ancarano
00050000-55b8-b8dd-a32d-0510038d7f41	9253	Apače
00050000-55b8-b8dd-bae1-6ebaa096ed5d	8253	Artiče
00050000-55b8-b8dd-cdca-71a83603760a	4275	Begunje na Gorenjskem
00050000-55b8-b8dd-fedf-f473fc1ebd53	1382	Begunje pri Cerknici
00050000-55b8-b8dd-2237-60dbaa221965	9231	Beltinci
00050000-55b8-b8dd-898c-eb8191a69a6f	2234	Benedikt
00050000-55b8-b8dd-e336-c409514bfe5c	2345	Bistrica ob Dravi
00050000-55b8-b8dd-8b9d-11cfc3b8d2f3	3256	Bistrica ob Sotli
00050000-55b8-b8dd-9968-953194c3b84e	8259	Bizeljsko
00050000-55b8-b8dd-96c5-04d82988aaef	1223	Blagovica
00050000-55b8-b8dd-7f95-84227a55c199	8283	Blanca
00050000-55b8-b8dd-6ea8-f550613c4ef9	4260	Bled
00050000-55b8-b8dd-0916-2edd323a596f	4273	Blejska Dobrava
00050000-55b8-b8dd-3afb-0a5d1ef2139f	9265	Bodonci
00050000-55b8-b8dd-b500-5129dd4ae902	9222	Bogojina
00050000-55b8-b8dd-53c4-c99145895919	4263	Bohinjska Bela
00050000-55b8-b8dd-34b6-0ac4ffbd0f96	4264	Bohinjska Bistrica
00050000-55b8-b8dd-dc13-1d11f11c4704	4265	Bohinjsko jezero
00050000-55b8-b8dd-5e84-341afc69f8ef	1353	Borovnica
00050000-55b8-b8dd-0dee-79046accd5fd	8294	Boštanj
00050000-55b8-b8dd-f113-843d700d6981	5230	Bovec
00050000-55b8-b8dd-0203-1c6f104961c2	5295	Branik
00050000-55b8-b8dd-5c93-6aba493347b0	3314	Braslovče
00050000-55b8-b8dd-146f-98c396d67782	5223	Breginj
00050000-55b8-b8dd-2a0b-7c4e96d01fa6	8280	Brestanica
00050000-55b8-b8dd-e609-70bd8c6e5861	2354	Bresternica
00050000-55b8-b8dd-12b4-c942a0e51cb1	4243	Brezje
00050000-55b8-b8dd-7b3f-aac29b93aa02	1351	Brezovica pri Ljubljani
00050000-55b8-b8dd-5579-f11278c1abaa	8250	Brežice
00050000-55b8-b8dd-b0d3-64e9d52d5d9f	4210	Brnik - Aerodrom
00050000-55b8-b8dd-1bf0-3f313a048bc9	8321	Brusnice
00050000-55b8-b8dd-890d-c93e978f31a3	3255	Buče
00050000-55b8-b8dd-75f7-deff9191489d	8276	Bučka 
00050000-55b8-b8dd-e011-df61a66825f6	9261	Cankova
00050000-55b8-b8dd-dd06-721d499b5c88	3000	Celje 
00050000-55b8-b8dd-b3ef-f8591364d26d	3001	Celje - poštni predali
00050000-55b8-b8dd-1038-521305dc9c23	4207	Cerklje na Gorenjskem
00050000-55b8-b8dd-1204-abefada43106	8263	Cerklje ob Krki
00050000-55b8-b8dd-fd10-a30bffce57f8	1380	Cerknica
00050000-55b8-b8dd-09ae-af36a4f00fec	5282	Cerkno
00050000-55b8-b8dd-ac36-f2e3f02d3643	2236	Cerkvenjak
00050000-55b8-b8dd-e32e-10a504e38d96	2215	Ceršak
00050000-55b8-b8dd-cff6-0d7aa8b8d3a0	2326	Cirkovce
00050000-55b8-b8dd-7442-91eed444d99d	2282	Cirkulane
00050000-55b8-b8dd-f6e4-b5d5268c6c2d	5273	Col
00050000-55b8-b8dd-b6eb-9040def555e8	8251	Čatež ob Savi
00050000-55b8-b8dd-aa82-cbde298dbea2	1413	Čemšenik
00050000-55b8-b8dd-c380-d4f8dc25b9ca	5253	Čepovan
00050000-55b8-b8dd-5fb0-d2319c648e19	9232	Črenšovci
00050000-55b8-b8dd-7ded-33c8905f0f05	2393	Črna na Koroškem
00050000-55b8-b8dd-b355-a86a796f12fa	6275	Črni Kal
00050000-55b8-b8dd-845c-57adb444880b	5274	Črni Vrh nad Idrijo
00050000-55b8-b8dd-9eb5-bd89516929cf	5262	Črniče
00050000-55b8-b8dd-40b9-9cbf1a53bc6b	8340	Črnomelj
00050000-55b8-b8dd-48db-ddb52718964c	6271	Dekani
00050000-55b8-b8dd-1500-aea5f506ff0c	5210	Deskle
00050000-55b8-b8dd-8618-5d65575f6642	2253	Destrnik
00050000-55b8-b8dd-7026-9d37404b4f9a	6215	Divača
00050000-55b8-b8dd-0b1c-7148ac55d304	1233	Dob
00050000-55b8-b8dd-9c01-b2dd6852954f	3224	Dobje pri Planini
00050000-55b8-b8dd-2b77-cd53661ffd42	8257	Dobova
00050000-55b8-b8dd-3ea1-e30d44bb4176	1423	Dobovec
00050000-55b8-b8dd-5574-3665446d2614	5263	Dobravlje
00050000-55b8-b8dd-4885-ce0699443915	3204	Dobrna
00050000-55b8-b8dd-33dd-6ff3b887ece3	8211	Dobrnič
00050000-55b8-b8dd-e9a1-11904918e9dd	1356	Dobrova
00050000-55b8-b8dd-648b-d6ce1cb2b94d	9223	Dobrovnik/Dobronak 
00050000-55b8-b8dd-3e37-c249049fe20b	5212	Dobrovo v Brdih
00050000-55b8-b8dd-a6a0-2d6b1d5b0e96	1431	Dol pri Hrastniku
00050000-55b8-b8dd-ea53-ef7671abd664	1262	Dol pri Ljubljani
00050000-55b8-b8dd-b5a3-0b76af9c6d39	1273	Dole pri Litiji
00050000-55b8-b8dd-8370-e398ef019397	1331	Dolenja vas
00050000-55b8-b8dd-4955-dbd2fdd47288	8350	Dolenjske Toplice
00050000-55b8-b8dd-6d3f-0c562eadb218	1230	Domžale
00050000-55b8-b8dd-6090-371f62640501	2252	Dornava
00050000-55b8-b8dd-a34e-b9d55fd40668	5294	Dornberk
00050000-55b8-b8dd-9f69-3f553bbdc956	1319	Draga
00050000-55b8-b8dd-9a25-25f77ff622c3	8343	Dragatuš
00050000-55b8-b8dd-8075-1cca90a37ece	3222	Dramlje
00050000-55b8-b8dd-4190-3b0e65f3c6e1	2370	Dravograd
00050000-55b8-b8dd-e31a-5d0c0998f5aa	4203	Duplje
00050000-55b8-b8dd-5502-e8264e46d80d	6221	Dutovlje
00050000-55b8-b8dd-90c9-1ea88cf124e1	8361	Dvor
00050000-55b8-b8dd-f930-8a732b2e3d8e	2343	Fala
00050000-55b8-b8dd-45c1-d2969084fbe9	9208	Fokovci
00050000-55b8-b8dd-5604-c6ef93f3941c	2313	Fram
00050000-55b8-b8dd-bf83-f706d7cfdd34	3213	Frankolovo
00050000-55b8-b8dd-16e1-78648ea36974	1274	Gabrovka
00050000-55b8-b8dd-90a1-a392343c99ab	8254	Globoko
00050000-55b8-b8dd-19fe-45cb441bdc0d	5275	Godovič
00050000-55b8-b8dd-0667-dbd7975b23da	4204	Golnik
00050000-55b8-b8dd-984f-5825be1b8de5	3303	Gomilsko
00050000-55b8-b8dd-9a2f-e4a018c5713d	4224	Gorenja vas
00050000-55b8-b8dd-f3f4-15dfb8a85f9c	3263	Gorica pri Slivnici
00050000-55b8-b8dd-3120-311af6c93472	2272	Gorišnica
00050000-55b8-b8dd-47b7-08eba851d445	9250	Gornja Radgona
00050000-55b8-b8dd-e01d-a79b6a7d23d1	3342	Gornji Grad
00050000-55b8-b8dd-3413-d9c42605a37f	4282	Gozd Martuljek
00050000-55b8-b8dd-7d45-b0750eb4df57	6272	Gračišče
00050000-55b8-b8dd-e117-272ad0edd3b2	9264	Grad
00050000-55b8-b8dd-b6e5-7b28bd00bb32	8332	Gradac
00050000-55b8-b8dd-a181-a829d357b86b	1384	Grahovo
00050000-55b8-b8dd-b6f5-d5da785130f2	5242	Grahovo ob Bači
00050000-55b8-b8dd-d41e-da35de417762	5251	Grgar
00050000-55b8-b8dd-babc-a50338dc9263	3302	Griže
00050000-55b8-b8dd-ddf5-8c271c8afbff	3231	Grobelno
00050000-55b8-b8dd-01f3-daeae9b3040d	1290	Grosuplje
00050000-55b8-b8dd-60b4-b37302922e44	2288	Hajdina
00050000-55b8-b8dd-eac6-605feeb1f244	8362	Hinje
00050000-55b8-b8dd-2ce9-3b77f1d7b572	2311	Hoče
00050000-55b8-b8dd-7365-6c225d398f63	9205	Hodoš/Hodos
00050000-55b8-b8dd-27b4-5f7a2172e71d	1354	Horjul
00050000-55b8-b8dd-0780-b775bd896ee0	1372	Hotedršica
00050000-55b8-b8dd-0c3e-3f25cfa70c89	1430	Hrastnik
00050000-55b8-b8dd-af15-07df275891ae	6225	Hruševje
00050000-55b8-b8dd-ad0e-8300e34f030f	4276	Hrušica
00050000-55b8-b8dd-b9ee-cfb314d9955c	5280	Idrija
00050000-55b8-b8dd-b748-2b8b7a4828cc	1292	Ig
00050000-55b8-b8dd-57e2-b8473dedc3f7	6250	Ilirska Bistrica
00050000-55b8-b8dd-369c-b4371f41687c	6251	Ilirska Bistrica-Trnovo
00050000-55b8-b8dd-8545-b0adfb6b9484	1295	Ivančna Gorica
00050000-55b8-b8dd-8a3a-2b543e964113	2259	Ivanjkovci
00050000-55b8-b8dd-50b4-d21c3a37466a	1411	Izlake
00050000-55b8-b8dd-09ec-8b7a36adb732	6310	Izola/Isola
00050000-55b8-b8dd-783e-47fc26932b4e	2222	Jakobski Dol
00050000-55b8-b8dd-9884-40ef94f8fe92	2221	Jarenina
00050000-55b8-b8dd-f019-a09ae3c3b834	6254	Jelšane
00050000-55b8-b8dd-f6b8-f3fe8fd44299	4270	Jesenice
00050000-55b8-b8dd-77a9-a849cb261543	8261	Jesenice na Dolenjskem
00050000-55b8-b8dd-f6ba-af65810f7a0d	3273	Jurklošter
00050000-55b8-b8dd-415a-aced18ee2c46	2223	Jurovski Dol
00050000-55b8-b8dd-9a68-85d7c5319bd7	2256	Juršinci
00050000-55b8-b8dd-bb83-c694906c117e	5214	Kal nad Kanalom
00050000-55b8-b8dd-4648-9e6eb389d7ea	3233	Kalobje
00050000-55b8-b8dd-0553-3f5b5e99235c	4246	Kamna Gorica
00050000-55b8-b8dd-1d16-463ecdbed05f	2351	Kamnica
00050000-55b8-b8dd-af50-585fedb8ed06	1241	Kamnik
00050000-55b8-b8dd-5219-1539bcc8d02f	5213	Kanal
00050000-55b8-b8dd-0c09-047d0bcbab26	8258	Kapele
00050000-55b8-b8dd-14f3-cf3addb9d763	2362	Kapla
00050000-55b8-b8dd-a305-7164be2bfa1f	2325	Kidričevo
00050000-55b8-b8dd-2ae5-6a1f61d7f212	1412	Kisovec
00050000-55b8-b8dd-06d9-5ae6527f2dfd	6253	Knežak
00050000-55b8-b8dd-1e25-6d5c0b11de14	5222	Kobarid
00050000-55b8-b8dd-c035-63fcc543f691	9227	Kobilje
00050000-55b8-b8dd-eec9-62451f2b7dd9	1330	Kočevje
00050000-55b8-b8dd-47f1-1ab02969d24b	1338	Kočevska Reka
00050000-55b8-b8dd-33d8-7c9242e655a7	2276	Kog
00050000-55b8-b8dd-1a0c-be390cfe0766	5211	Kojsko
00050000-55b8-b8dd-4702-5fd22a7b0528	6223	Komen
00050000-55b8-b8dd-7a4a-6505dd6d440d	1218	Komenda
00050000-55b8-b8dd-6652-1d1a6ca1cfdb	6000	Koper/Capodistria 
00050000-55b8-b8dd-2333-cd644dc54c8b	6001	Koper/Capodistria - poštni predali
00050000-55b8-b8dd-77c7-e8424002cbd1	8282	Koprivnica
00050000-55b8-b8dd-6cc3-767b4c56e254	5296	Kostanjevica na Krasu
00050000-55b8-b8dd-5dd8-164570bf25d2	8311	Kostanjevica na Krki
00050000-55b8-b8dd-9502-4e0d32f91ca7	1336	Kostel
00050000-55b8-b8dd-c79d-8bb47f26736d	6256	Košana
00050000-55b8-b8dd-dc64-1419f725b2e8	2394	Kotlje
00050000-55b8-b8dd-d31e-0eb3b94ca7f1	6240	Kozina
00050000-55b8-b8dd-ec50-e5877b2554a3	3260	Kozje
00050000-55b8-b8dd-a4c1-dc17f2078fca	4000	Kranj 
00050000-55b8-b8dd-1b83-f8077d151a0d	4001	Kranj - poštni predali
00050000-55b8-b8dd-dc98-e04b73cbe7a7	4280	Kranjska Gora
00050000-55b8-b8dd-5d33-bd8e81b99ba6	1281	Kresnice
00050000-55b8-b8dd-783f-c2097bbe722e	4294	Križe
00050000-55b8-b8dd-9829-7205475804b9	9206	Križevci
00050000-55b8-b8dd-8166-6ce3a399480b	9242	Križevci pri Ljutomeru
00050000-55b8-b8dd-6a4f-2e1fdd96c7a5	1301	Krka
00050000-55b8-b8dd-9093-cb24f5641213	8296	Krmelj
00050000-55b8-b8dd-2857-79e22b629524	4245	Kropa
00050000-55b8-b8dd-055f-7adc889e6347	8262	Krška vas
00050000-55b8-b8dd-5c3e-a1533872f830	8270	Krško
00050000-55b8-b8dd-d13f-6431a71534b8	9263	Kuzma
00050000-55b8-b8dd-4476-92d70ba944d5	2318	Laporje
00050000-55b8-b8dd-59ff-1537bf425fe7	3270	Laško
00050000-55b8-b8dd-4a4d-4c635e91c498	1219	Laze v Tuhinju
00050000-55b8-b8dd-a9b0-1791296d1c47	2230	Lenart v Slovenskih goricah
00050000-55b8-b8dd-71f7-ee447b3bac7c	9220	Lendava/Lendva
00050000-55b8-b8dd-1009-3dd3ea98cf5a	4248	Lesce
00050000-55b8-b8dd-209e-8e95ceb72e9c	3261	Lesično
00050000-55b8-b8dd-e9b9-664f26170ed1	8273	Leskovec pri Krškem
00050000-55b8-b8dd-a655-3399524aae8e	2372	Libeliče
00050000-55b8-b8dd-c93e-2403da1ec550	2341	Limbuš
00050000-55b8-b8dd-21ed-3441c06885d7	1270	Litija
00050000-55b8-b8dd-50b2-8ca430d753c2	3202	Ljubečna
00050000-55b8-b8dd-6931-8464f77a495e	1000	Ljubljana 
00050000-55b8-b8dd-3393-01d802114fba	1001	Ljubljana - poštni predali
00050000-55b8-b8dd-1f4b-2e8a386574e3	1231	Ljubljana - Črnuče
00050000-55b8-b8dd-d43f-9c9793e7bf7b	1261	Ljubljana - Dobrunje
00050000-55b8-b8dd-0231-325778a95f1b	1260	Ljubljana - Polje
00050000-55b8-b8dd-b854-fda3522a05e5	1210	Ljubljana - Šentvid
00050000-55b8-b8dd-55cc-c96c3904d88d	1211	Ljubljana - Šmartno
00050000-55b8-b8dd-0a4c-96f4f62c49f4	3333	Ljubno ob Savinji
00050000-55b8-b8dd-c8ed-8a1cc81fd799	9240	Ljutomer
00050000-55b8-b8dd-5ec2-830b74473a2c	3215	Loče
00050000-55b8-b8dd-c90e-b7c81e363955	5231	Log pod Mangartom
00050000-55b8-b8dd-34c9-1d66cddf31e4	1358	Log pri Brezovici
00050000-55b8-b8dd-25fb-45109b498cd4	1370	Logatec
00050000-55b8-b8dd-769c-787a0e4854e2	1371	Logatec
00050000-55b8-b8dd-191e-41ba1ab486d4	1434	Loka pri Zidanem Mostu
00050000-55b8-b8dd-1a17-35ef799f3ed0	3223	Loka pri Žusmu
00050000-55b8-b8dd-1f24-4c090d137d7d	6219	Lokev
00050000-55b8-b8dd-489c-8b863d6c67f1	1318	Loški Potok
00050000-55b8-b8dd-30de-37b3a26c694d	2324	Lovrenc na Dravskem polju
00050000-55b8-b8dd-a954-1f9e9d97f027	2344	Lovrenc na Pohorju
00050000-55b8-b8dd-ffde-c387b9ebeed1	3334	Luče
00050000-55b8-b8dd-aac5-6bc7afa0f61f	1225	Lukovica
00050000-55b8-b8dd-b089-b573241fc247	9202	Mačkovci
00050000-55b8-b8dd-1ab6-4a325fd74711	2322	Majšperk
00050000-55b8-b8dd-4ab5-5b5d00f4126d	2321	Makole
00050000-55b8-b8dd-6d15-bd4cf39a39ac	9243	Mala Nedelja
00050000-55b8-b8dd-4e75-8ac1490a2634	2229	Malečnik
00050000-55b8-b8dd-3935-bd955b6c4e11	6273	Marezige
00050000-55b8-b8dd-526a-b33e280b3a8e	2000	Maribor 
00050000-55b8-b8dd-5563-59f0de1440b4	2001	Maribor - poštni predali
00050000-55b8-b8dd-b17b-d6d2b33e861f	2206	Marjeta na Dravskem polju
00050000-55b8-b8dd-c646-0af68923f750	2281	Markovci
00050000-55b8-b8dd-a6d2-56314cbe0215	9221	Martjanci
00050000-55b8-b8dd-c1c4-fbe1c695bcb8	6242	Materija
00050000-55b8-b8dd-3a1f-1fcc6dffaeb7	4211	Mavčiče
00050000-55b8-b8dd-186e-768a9c3ee0ff	1215	Medvode
00050000-55b8-b8dd-faef-90d101e76676	1234	Mengeš
00050000-55b8-b8dd-e27b-f94e93918fe1	8330	Metlika
00050000-55b8-b8dd-5e96-aef75edf0432	2392	Mežica
00050000-55b8-b8dd-9de1-32ffa7c7337c	2204	Miklavž na Dravskem polju
00050000-55b8-b8dd-efd8-b277f7354b09	2275	Miklavž pri Ormožu
00050000-55b8-b8dd-0d06-25aebfa9962f	5291	Miren
00050000-55b8-b8dd-746d-08ba98edf232	8233	Mirna
00050000-55b8-b8dd-a5f2-b1a3ca3c2178	8216	Mirna Peč
00050000-55b8-b8dd-af2c-5f1a0c4b8984	2382	Mislinja
00050000-55b8-b8dd-ce04-ee38d599bc6b	4281	Mojstrana
00050000-55b8-b8dd-74dc-99fc77717d06	8230	Mokronog
00050000-55b8-b8dd-bbcd-c64d1a6c9a8f	1251	Moravče
00050000-55b8-b8dd-697d-d58107040be5	9226	Moravske Toplice
00050000-55b8-b8dd-f6a5-ae0bb37efd42	5216	Most na Soči
00050000-55b8-b8dd-e4ba-15e6d82531de	1221	Motnik
00050000-55b8-b8dd-58dd-6d4d8bbcb828	3330	Mozirje
00050000-55b8-b8dd-e7c7-126f4732f101	9000	Murska Sobota 
00050000-55b8-b8dd-35de-1828a8f7c211	9001	Murska Sobota - poštni predali
00050000-55b8-b8dd-da92-bd22fe2be25c	2366	Muta
00050000-55b8-b8dd-28b5-3b4e6c05ffff	4202	Naklo
00050000-55b8-b8dd-2e75-b7c1ed659647	3331	Nazarje
00050000-55b8-b8dd-1ab1-3b278884051d	1357	Notranje Gorice
00050000-55b8-b8dd-0e3a-82f09cbca504	3203	Nova Cerkev
00050000-55b8-b8dd-c311-ce95154d66a9	5000	Nova Gorica 
00050000-55b8-b8dd-96c3-dda8358889ec	5001	Nova Gorica - poštni predali
00050000-55b8-b8dd-1035-549747705aa7	1385	Nova vas
00050000-55b8-b8dd-b03b-94864c288291	8000	Novo mesto
00050000-55b8-b8dd-f21e-d7513c12e9d2	8001	Novo mesto - poštni predali
00050000-55b8-b8dd-9107-7b1ec524d7dc	6243	Obrov
00050000-55b8-b8dd-0019-bd1ca4ed60a1	9233	Odranci
00050000-55b8-b8dd-64d9-3995fcbfe088	2317	Oplotnica
00050000-55b8-b8dd-8c4d-4dcfc245a9f5	2312	Orehova vas
00050000-55b8-b8dd-f1c7-ede75ebb61ce	2270	Ormož
00050000-55b8-b8dd-d2d6-c55e93a10cc4	1316	Ortnek
00050000-55b8-b8dd-1413-5abeb964cb84	1337	Osilnica
00050000-55b8-b8dd-d1b6-26fd7f9adc5b	8222	Otočec
00050000-55b8-b8dd-6d2e-3e746d829083	2361	Ožbalt
00050000-55b8-b8dd-c061-941855c57fb9	2231	Pernica
00050000-55b8-b8dd-28de-adf8a7fc39e2	2211	Pesnica pri Mariboru
00050000-55b8-b8dd-8009-4c7615543d18	9203	Petrovci
00050000-55b8-b8dd-cde7-15217938a5c7	3301	Petrovče
00050000-55b8-b8dd-d70e-76f4c3c4e54e	6330	Piran/Pirano
00050000-55b8-b8dd-c4fc-d480e0970509	8255	Pišece
00050000-55b8-b8dd-ccf3-d1958eb695a9	6257	Pivka
00050000-55b8-b8dd-b4fc-38b30d7949b7	6232	Planina
00050000-55b8-b8dd-8034-32d83505efcf	3225	Planina pri Sevnici
00050000-55b8-b8dd-6cb2-98fde73f66a9	6276	Pobegi
00050000-55b8-b8dd-4988-ac13853190da	8312	Podbočje
00050000-55b8-b8dd-5719-413856b23729	5243	Podbrdo
00050000-55b8-b8dd-5116-386d6479b9e6	3254	Podčetrtek
00050000-55b8-b8dd-7d5e-0a92f9d022de	2273	Podgorci
00050000-55b8-b8dd-8691-0b300f5573dd	6216	Podgorje
00050000-55b8-b8dd-0ef5-cb6a3ff68582	2381	Podgorje pri Slovenj Gradcu
00050000-55b8-b8dd-37c1-d4dd45a06f65	6244	Podgrad
00050000-55b8-b8dd-0e57-b3e8481c35d4	1414	Podkum
00050000-55b8-b8dd-90ad-27a4e14d2b25	2286	Podlehnik
00050000-55b8-b8dd-9354-1d0f440c1957	5272	Podnanos
00050000-55b8-b8dd-e9d0-852156b37489	4244	Podnart
00050000-55b8-b8dd-e146-18f26079fd82	3241	Podplat
00050000-55b8-b8dd-e2e8-14072b091404	3257	Podsreda
00050000-55b8-b8dd-5206-a6b7dfaad04f	2363	Podvelka
00050000-55b8-b8dd-74e4-09524f11daab	2208	Pohorje
00050000-55b8-b8dd-7197-cb3ccf54db47	2257	Polenšak
00050000-55b8-b8dd-7e21-ada1973660e8	1355	Polhov Gradec
00050000-55b8-b8dd-cba1-499bbb2d5cc4	4223	Poljane nad Škofjo Loko
00050000-55b8-b8dd-b6a9-065c1e04cf53	2319	Poljčane
00050000-55b8-b8dd-6cdd-755e2528916b	1272	Polšnik
00050000-55b8-b8dd-4b1c-a0a1739cf450	3313	Polzela
00050000-55b8-b8dd-eea0-1ed29c0f88e8	3232	Ponikva
00050000-55b8-b8dd-4725-0f726b5a7e79	6320	Portorož/Portorose
00050000-55b8-b8dd-6f05-15a0c8ee38d0	6230	Postojna
00050000-55b8-b8dd-14c0-5a685a02478b	2331	Pragersko
00050000-55b8-b8dd-f55c-51a5bf03dbeb	3312	Prebold
00050000-55b8-b8dd-6bcd-af0cf3dd56a3	4205	Preddvor
00050000-55b8-b8dd-2025-be64decd558e	6255	Prem
00050000-55b8-b8dd-bcde-3abc181fb83f	1352	Preserje
00050000-55b8-b8dd-5e03-d445380222f1	6258	Prestranek
00050000-55b8-b8dd-ffe2-2b85fbc20842	2391	Prevalje
00050000-55b8-b8dd-be66-8d5dbc8b9bb8	3262	Prevorje
00050000-55b8-b8dd-8e88-0489b1cc400e	1276	Primskovo 
00050000-55b8-b8dd-77d5-d5006fa9a463	3253	Pristava pri Mestinju
00050000-55b8-b8dd-5a48-996820c3c977	9207	Prosenjakovci/Partosfalva
00050000-55b8-b8dd-ddb7-6b674909a5d0	5297	Prvačina
00050000-55b8-b8dd-18e4-1b1b46dc3db3	2250	Ptuj
00050000-55b8-b8dd-ada1-d7b4dad34019	2323	Ptujska Gora
00050000-55b8-b8dd-3708-e35847519a1b	9201	Puconci
00050000-55b8-b8dd-79f8-c78cb6d6d72d	2327	Rače
00050000-55b8-b8dd-1cb6-23c0ef664ae5	1433	Radeče
00050000-55b8-b8dd-c928-e72809d8fbaa	9252	Radenci
00050000-55b8-b8dd-ae0b-5c12b745f671	2360	Radlje ob Dravi
00050000-55b8-b8dd-1881-67f3b83f7b86	1235	Radomlje
00050000-55b8-b8dd-ad5a-133614c4bf1c	4240	Radovljica
00050000-55b8-b8dd-c29d-fbf9d1fe9d6c	8274	Raka
00050000-55b8-b8dd-b39c-74313062a24a	1381	Rakek
00050000-55b8-b8dd-34b2-8ad0fe139769	4283	Rateče - Planica
00050000-55b8-b8dd-71f5-35f14dfad4b0	2390	Ravne na Koroškem
00050000-55b8-b8dd-be51-67626d1ec0cb	9246	Razkrižje
00050000-55b8-b8dd-1e5b-4f3d5647c645	3332	Rečica ob Savinji
00050000-55b8-b8dd-6d47-603e07771372	5292	Renče
00050000-55b8-b8dd-34e0-a3848aab73d8	1310	Ribnica
00050000-55b8-b8dd-3a97-df1f3f801ce8	2364	Ribnica na Pohorju
00050000-55b8-b8dd-c615-390cfb9b3c20	3272	Rimske Toplice
00050000-55b8-b8dd-34a8-d74913d6b7d0	1314	Rob
00050000-55b8-b8dd-67db-1f6f667c0d04	5215	Ročinj
00050000-55b8-b8dd-3881-d836810bb768	3250	Rogaška Slatina
00050000-55b8-b8dd-ea8b-9146a39c0e87	9262	Rogašovci
00050000-55b8-b8dd-9973-b6160bf36584	3252	Rogatec
00050000-55b8-b8dd-2fc7-5b230475e52b	1373	Rovte
00050000-55b8-b8dd-9a52-14cd1bf0dea0	2342	Ruše
00050000-55b8-b8dd-b283-86d1d0e7923e	1282	Sava
00050000-55b8-b8dd-f5b9-5917dab7b41b	6333	Sečovlje/Sicciole
00050000-55b8-b8dd-8b08-0800c8f5d08c	4227	Selca
00050000-55b8-b8dd-f936-f5c35078f34a	2352	Selnica ob Dravi
00050000-55b8-b8dd-6686-c9191c542744	8333	Semič
00050000-55b8-b8dd-b6e0-0ce97064118f	8281	Senovo
00050000-55b8-b8dd-ea0c-8faf15e942a7	6224	Senožeče
00050000-55b8-b8dd-20bb-cb8a67e00bf4	8290	Sevnica
00050000-55b8-b8dd-2304-d5c6152d1a56	6210	Sežana
00050000-55b8-b8dd-0cf3-ec3bdebd1179	2214	Sladki Vrh
00050000-55b8-b8dd-7fec-5d7a0cbcd0da	5283	Slap ob Idrijci
00050000-55b8-b8dd-86a1-c6b0739b0747	2380	Slovenj Gradec
00050000-55b8-b8dd-ef7e-f4c624464cb8	2310	Slovenska Bistrica
00050000-55b8-b8dd-c27c-0c867608db36	3210	Slovenske Konjice
00050000-55b8-b8dd-dfd0-b34ad7d38dae	1216	Smlednik
00050000-55b8-b8dd-9192-99e840012a0a	5232	Soča
00050000-55b8-b8dd-7094-c6bb32a06108	1317	Sodražica
00050000-55b8-b8dd-7361-74bf8ddd118c	3335	Solčava
00050000-55b8-b8dd-4b35-5f9afa98cb80	5250	Solkan
00050000-55b8-b8dd-3b59-639c1f3f1b5a	4229	Sorica
00050000-55b8-b8dd-2218-169d05b469c2	4225	Sovodenj
00050000-55b8-b8dd-2cd3-29e2822e1377	5281	Spodnja Idrija
00050000-55b8-b8dd-c284-f15ef306627d	2241	Spodnji Duplek
00050000-55b8-b8dd-7afa-b4fed65fd69e	9245	Spodnji Ivanjci
00050000-55b8-b8dd-bc41-edfbfead2aa9	2277	Središče ob Dravi
00050000-55b8-b8dd-b70e-fc4492f489c4	4267	Srednja vas v Bohinju
00050000-55b8-b8dd-6882-dc4da052b358	8256	Sromlje 
00050000-55b8-b8dd-c179-301484f54d9d	5224	Srpenica
00050000-55b8-b8dd-43a4-f8a6854e82bd	1242	Stahovica
00050000-55b8-b8dd-3df4-69ad32a52abb	1332	Stara Cerkev
00050000-55b8-b8dd-da4d-c98eb12b3824	8342	Stari trg ob Kolpi
00050000-55b8-b8dd-36c8-194024dde536	1386	Stari trg pri Ložu
00050000-55b8-b8dd-a1b3-318a83cb77be	2205	Starše
00050000-55b8-b8dd-4469-693ad2981101	2289	Stoperce
00050000-55b8-b8dd-8f1c-a19e84557109	8322	Stopiče
00050000-55b8-b8dd-9fae-d140d23a7bd7	3206	Stranice
00050000-55b8-b8dd-4716-780456e06ea8	8351	Straža
00050000-55b8-b8dd-2142-dccd53cc3c8b	1313	Struge
00050000-55b8-b8dd-51a0-88cdcccfb058	8293	Studenec
00050000-55b8-b8dd-f6c5-0c60823bd5e1	8331	Suhor
00050000-55b8-b8dd-d84b-af9fa149bd1b	2233	Sv. Ana v Slovenskih goricah
00050000-55b8-b8dd-5029-28a3f2949729	2235	Sv. Trojica v Slovenskih goricah
00050000-55b8-b8dd-ab9e-554571e81f23	2353	Sveti Duh na Ostrem Vrhu
00050000-55b8-b8dd-04dd-83669b394328	9244	Sveti Jurij ob Ščavnici
00050000-55b8-b8dd-9a06-53ff428717d7	3264	Sveti Štefan
00050000-55b8-b8dd-645e-76f200d9dc21	2258	Sveti Tomaž
00050000-55b8-b8dd-92c6-463658daa7a4	9204	Šalovci
00050000-55b8-b8dd-625c-d801c6bc639b	5261	Šempas
00050000-55b8-b8dd-c780-f822981c5130	5290	Šempeter pri Gorici
00050000-55b8-b8dd-c28d-a7054146940e	3311	Šempeter v Savinjski dolini
00050000-55b8-b8dd-8c82-7650388e970e	4208	Šenčur
00050000-55b8-b8dd-3581-23dbb2ff767e	2212	Šentilj v Slovenskih goricah
00050000-55b8-b8dd-2f70-017f6d408ba1	8297	Šentjanž
00050000-55b8-b8dd-36ed-2091cef12ba8	2373	Šentjanž pri Dravogradu
00050000-55b8-b8dd-c835-e7cdf03d7922	8310	Šentjernej
00050000-55b8-b8dd-5a8a-19cfd147cd2b	3230	Šentjur
00050000-55b8-b8dd-2c74-90d4ffb87cfb	3271	Šentrupert
00050000-55b8-b8dd-fd8e-c6c46700a026	8232	Šentrupert
00050000-55b8-b8dd-b1f2-a66e138fda7f	1296	Šentvid pri Stični
00050000-55b8-b8dd-1bb7-9916de56763f	8275	Škocjan
00050000-55b8-b8dd-e829-1a092ad7013e	6281	Škofije
00050000-55b8-b8dd-5ed1-ac4692a47d8d	4220	Škofja Loka
00050000-55b8-b8dd-6f28-2dbf9c92de55	3211	Škofja vas
00050000-55b8-b8dd-f3d8-7e5f3f0e21e5	1291	Škofljica
00050000-55b8-b8dd-2e5d-de20e4a538c8	6274	Šmarje
00050000-55b8-b8dd-2caa-e5d7491d8ef6	1293	Šmarje - Sap
00050000-55b8-b8dd-e46b-221ea1acd8af	3240	Šmarje pri Jelšah
00050000-55b8-b8dd-e4ab-9bcf309e8c59	8220	Šmarješke Toplice
00050000-55b8-b8dd-8d64-4e0a461acd67	2315	Šmartno na Pohorju
00050000-55b8-b8dd-916e-b6935627f65e	3341	Šmartno ob Dreti
00050000-55b8-b8dd-beab-9af2985c782d	3327	Šmartno ob Paki
00050000-55b8-b8dd-fe9d-d6ddd5e7fc9c	1275	Šmartno pri Litiji
00050000-55b8-b8dd-760e-1940757771df	2383	Šmartno pri Slovenj Gradcu
00050000-55b8-b8dd-7710-a26d4a29c10b	3201	Šmartno v Rožni dolini
00050000-55b8-b8dd-9d00-83ce4e7aa035	3325	Šoštanj
00050000-55b8-b8dd-84c4-37da6f785ea4	6222	Štanjel
00050000-55b8-b8dd-624b-b9b982aaf7d4	3220	Štore
00050000-55b8-b8dd-5a12-45600b5d3238	3304	Tabor
00050000-55b8-b8dd-8228-4be6b6f3c2a6	3221	Teharje
00050000-55b8-b8dd-6d49-21aae7de1fe1	9251	Tišina
00050000-55b8-b8dd-a8f9-3d36ef3e9359	5220	Tolmin
00050000-55b8-b8dd-a04b-f50b8328e32a	3326	Topolšica
00050000-55b8-b8dd-7374-d8dd22e04b5e	2371	Trbonje
00050000-55b8-b8dd-f642-9319bde13084	1420	Trbovlje
00050000-55b8-b8dd-528e-e55091840e42	8231	Trebelno 
00050000-55b8-b8dd-ff98-6b90482d00fe	8210	Trebnje
00050000-55b8-b8dd-74c5-bae16afbb829	5252	Trnovo pri Gorici
00050000-55b8-b8dd-f26b-3caf66aee537	2254	Trnovska vas
00050000-55b8-b8dd-f9a3-075db1642cd2	1222	Trojane
00050000-55b8-b8dd-f9c4-dc3b4daa3789	1236	Trzin
00050000-55b8-b8dd-7f9e-b51878ebdb8f	4290	Tržič
00050000-55b8-b8dd-a33e-9858555c0f74	8295	Tržišče
00050000-55b8-b8dd-fc18-3687c652a3d5	1311	Turjak
00050000-55b8-b8dd-1c6b-92e981ba03bb	9224	Turnišče
00050000-55b8-b8dd-d640-4b03d083f493	8323	Uršna sela
00050000-55b8-b8dd-c373-d233b775c5d7	1252	Vače
00050000-55b8-b8dd-e80d-252d860f3b3f	3320	Velenje 
00050000-55b8-b8dd-0e65-ee8632044933	3322	Velenje - poštni predali
00050000-55b8-b8dd-d474-7fe8271e4aae	8212	Velika Loka
00050000-55b8-b8dd-5016-260ea76d266a	2274	Velika Nedelja
00050000-55b8-b8dd-ccdf-78525dda09c9	9225	Velika Polana
00050000-55b8-b8dd-43ba-fcd8599e1fae	1315	Velike Lašče
00050000-55b8-b8dd-5baf-c28889a75e2b	8213	Veliki Gaber
00050000-55b8-b8dd-b386-93b1032b722c	9241	Veržej
00050000-55b8-b8dd-ddb2-876d7b21a7c6	1312	Videm - Dobrepolje
00050000-55b8-b8dd-04cd-3184998e9f62	2284	Videm pri Ptuju
00050000-55b8-b8dd-a5ae-f7cabe60b692	8344	Vinica
00050000-55b8-b8dd-1f32-22699a394e7a	5271	Vipava
00050000-55b8-b8dd-dae4-98ae37ae3f42	4212	Visoko
00050000-55b8-b8dd-7a17-60c440a2b6d7	1294	Višnja Gora
00050000-55b8-b8dd-4dce-4ab4d891622d	3205	Vitanje
00050000-55b8-b8dd-af1f-a3d16474229e	2255	Vitomarci
00050000-55b8-b8dd-8ee0-a5e05fc97a99	1217	Vodice
00050000-55b8-b8dd-f996-2736b953f0d0	3212	Vojnik\t
00050000-55b8-b8dd-17b2-b2f2b9863e8e	5293	Volčja Draga
00050000-55b8-b8dd-930d-21c3ad2d1da6	2232	Voličina
00050000-55b8-b8dd-ed3b-96682be69b54	3305	Vransko
00050000-55b8-b8dd-2188-698cad1ff267	6217	Vremski Britof
00050000-55b8-b8dd-a33c-8bffd3467697	1360	Vrhnika
00050000-55b8-b8dd-41e0-0906aaa43d6f	2365	Vuhred
00050000-55b8-b8dd-16ad-8af35fb7e68b	2367	Vuzenica
00050000-55b8-b8dd-8b86-07f15a0d6d46	8292	Zabukovje 
00050000-55b8-b8dd-180f-8c88d2693d5d	1410	Zagorje ob Savi
00050000-55b8-b8dd-2189-426be9c2edc1	1303	Zagradec
00050000-55b8-b8dd-64c7-a80d187237a2	2283	Zavrč
00050000-55b8-b8dd-c215-87dfbd45accf	8272	Zdole 
00050000-55b8-b8dd-eb79-d4dac6d27416	4201	Zgornja Besnica
00050000-55b8-b8dd-3431-0abbc61c82db	2242	Zgornja Korena
00050000-55b8-b8dd-dbea-3b260e86c7c1	2201	Zgornja Kungota
00050000-55b8-b8dd-d349-8ccc333841f3	2316	Zgornja Ložnica
00050000-55b8-b8dd-055c-8a9c171ca348	2314	Zgornja Polskava
00050000-55b8-b8dd-5023-83ee551264c7	2213	Zgornja Velka
00050000-55b8-b8dd-c090-16b20f2d8f61	4247	Zgornje Gorje
00050000-55b8-b8dd-fcbf-ee34285634c5	4206	Zgornje Jezersko
00050000-55b8-b8dd-00de-88a8a7f3b4aa	2285	Zgornji Leskovec
00050000-55b8-b8dd-4ef8-66a9d106d370	1432	Zidani Most
00050000-55b8-b8dd-7c64-0ddc52416536	3214	Zreče
00050000-55b8-b8dd-3dfe-99642156bab2	4209	Žabnica
00050000-55b8-b8dd-c564-55e1a608225a	3310	Žalec
00050000-55b8-b8dd-85ed-4fb2f9cc3f40	4228	Železniki
00050000-55b8-b8dd-db53-7463722a21c3	2287	Žetale
00050000-55b8-b8dd-c1e5-ea3917d0cce9	4226	Žiri
00050000-55b8-b8dd-4297-1e65eff47246	4274	Žirovnica
00050000-55b8-b8dd-6a48-0e91994d060f	8360	Žužemberk
\.


--
-- TOC entry 2992 (class 0 OID 10872431)
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
-- TOC entry 2974 (class 0 OID 10872242)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 10872320)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 10872443)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 10872746)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 10872757)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55b8-b8de-f59f-2b776abc1f72	00080000-55b8-b8de-af0c-c6d7a9237c51	0900	AK
00190000-55b8-b8de-7ddd-2c1cae65bb46	00080000-55b8-b8de-f625-07a834ab85ad	0987	AK
00190000-55b8-b8de-2b38-00195137920e	00080000-55b8-b8de-93b2-ee9a25690df1	0989	AK
00190000-55b8-b8de-ce3c-03e47591f8d3	00080000-55b8-b8de-9085-9b123b712810	0986	AK
00190000-55b8-b8de-c4d0-896e31a001a9	00080000-55b8-b8de-7c0e-a6838444f116	0984	AK
00190000-55b8-b8de-4f68-c099d656d341	00080000-55b8-b8de-8365-71a1bc3a5de1	0983	AK
00190000-55b8-b8de-72e6-36aa9d2388c2	00080000-55b8-b8de-535b-05a61d517438	0982	AK
\.


--
-- TOC entry 3016 (class 0 OID 10872727)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55b8-b8de-455f-0136b1383a31	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3019 (class 0 OID 10872765)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 10872472)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55b8-b8de-6974-06a37cd47c93	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55b8-b8de-381c-7d6fbe04713f	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55b8-b8de-5356-23350b5cdd06	0003	Kazinska	t	84	Kazinska dvorana
00220000-55b8-b8de-ab33-fc6089b6abd5	0004	Mali oder	t	24	Mali oder 
00220000-55b8-b8de-fe9d-7b724737f751	0005	Komorni oder	t	15	Komorni oder
00220000-55b8-b8de-84c2-c430e2cac5bb	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55b8-b8de-e512-4b6feb7416ab	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2990 (class 0 OID 10872416)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 10872406)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 10872591)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 10872540)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 10872114)
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
-- TOC entry 2999 (class 0 OID 10872482)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 10872152)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55b8-b8dd-4229-005a4d6e49a0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55b8-b8dd-f02d-2e376f1e2624	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55b8-b8dd-2c42-ec99e507cab6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55b8-b8dd-d2ce-d6156bea476e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55b8-b8dd-8e08-f4e87704dc88	planer	Planer dogodkov v koledarju	t
00020000-55b8-b8dd-d20d-7470ac39be7f	kadrovska	Kadrovska služba	t
00020000-55b8-b8dd-461b-dc90b3a8a9f4	arhivar	Ažuriranje arhivalij	t
00020000-55b8-b8dd-e3c8-cf1826b5a22c	igralec	Igralec	t
00020000-55b8-b8dd-2d73-b6d6229d4e91	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55b8-b8de-d7c5-5a8ac59b12c7	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2965 (class 0 OID 10872136)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55b8-b8dd-3dc2-d71b18a73680	00020000-55b8-b8dd-2c42-ec99e507cab6
00010000-55b8-b8dd-017c-1941709fcec9	00020000-55b8-b8dd-2c42-ec99e507cab6
00010000-55b8-b8de-bf53-197e331eb3c7	00020000-55b8-b8de-d7c5-5a8ac59b12c7
\.


--
-- TOC entry 3001 (class 0 OID 10872496)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 10872437)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 10872387)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 10872806)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55b8-b8dd-47b3-19f937cb19f7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55b8-b8dd-6baa-d5be95acca38	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55b8-b8dd-1846-6e941b32c90c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55b8-b8dd-dea9-7f7940e31b16	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55b8-b8dd-acf2-65a1e99263ff	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3023 (class 0 OID 10872798)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55b8-b8dd-ccc5-2ed94b8b2f43	00230000-55b8-b8dd-dea9-7f7940e31b16	popa
00240000-55b8-b8dd-a3b3-75d52c62b487	00230000-55b8-b8dd-dea9-7f7940e31b16	oseba
00240000-55b8-b8dd-9e4f-879733a63f39	00230000-55b8-b8dd-6baa-d5be95acca38	prostor
00240000-55b8-b8dd-cee7-a3cbd22475a6	00230000-55b8-b8dd-dea9-7f7940e31b16	besedilo
00240000-55b8-b8dd-6ff4-0e204b86ad68	00230000-55b8-b8dd-dea9-7f7940e31b16	uprizoritev
00240000-55b8-b8dd-084f-73d6edbf06b2	00230000-55b8-b8dd-dea9-7f7940e31b16	funkcija
00240000-55b8-b8dd-43d5-3bf85fb6d85c	00230000-55b8-b8dd-dea9-7f7940e31b16	tipfunkcije
00240000-55b8-b8dd-a551-bf0e52bcf5c4	00230000-55b8-b8dd-dea9-7f7940e31b16	alternacija
00240000-55b8-b8dd-cd54-5785c741a494	00230000-55b8-b8dd-47b3-19f937cb19f7	pogodba
00240000-55b8-b8dd-1a6d-fe8af26eb3c1	00230000-55b8-b8dd-dea9-7f7940e31b16	zaposlitev
00240000-55b8-b8dd-9a9a-45c4c0c13f96	00230000-55b8-b8dd-47b3-19f937cb19f7	programdela
00240000-55b8-b8dd-9e85-e782787e89e4	00230000-55b8-b8dd-dea9-7f7940e31b16	zapis
\.


--
-- TOC entry 3022 (class 0 OID 10872793)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 10872550)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55b8-b8de-c39b-8beeedabd9c4	000e0000-55b8-b8de-120a-8ceeaaa3c959	00080000-55b8-b8de-1474-7c3d75cd1ba8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55b8-b8de-bcf7-e6674251f042	000e0000-55b8-b8de-120a-8ceeaaa3c959	00080000-55b8-b8de-1474-7c3d75cd1ba8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55b8-b8de-543d-43e7086745e2	000e0000-55b8-b8de-120a-8ceeaaa3c959	00080000-55b8-b8de-0abf-115f3bb2c789	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55b8-b8de-9e50-046a125e711a	000e0000-55b8-b8de-120a-8ceeaaa3c959	00080000-55b8-b8de-0abf-115f3bb2c789	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2972 (class 0 OID 10872214)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 10872393)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55b8-b8de-27ff-c6a1475df84f	00180000-55b8-b8de-28d3-e2042dbe3130	000c0000-55b8-b8de-b05f-bd7175387845	00090000-55b8-b8de-a8c2-300995023195	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b8-b8de-eaca-4b870ff48a9d	00180000-55b8-b8de-28d3-e2042dbe3130	000c0000-55b8-b8de-e9af-4dd383e3005e	00090000-55b8-b8de-5b22-5b02f407e7b2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b8-b8de-ea25-06b4d7ab3c1b	00180000-55b8-b8de-28d3-e2042dbe3130	000c0000-55b8-b8de-a361-503732e22641	00090000-55b8-b8de-e927-1ece1f1c45aa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b8-b8de-2bb2-e97af066b17e	00180000-55b8-b8de-28d3-e2042dbe3130	000c0000-55b8-b8de-02da-d5251f802b93	00090000-55b8-b8de-e5a9-b36e5f67ead4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b8-b8de-1918-1e613073f497	00180000-55b8-b8de-28d3-e2042dbe3130	000c0000-55b8-b8de-0a44-94caf27c4ea0	00090000-55b8-b8de-a762-6efa52638d9f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b8-b8de-176d-6b4be2151068	00180000-55b8-b8de-c355-e4e253be1427	\N	00090000-55b8-b8de-a762-6efa52638d9f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3008 (class 0 OID 10872580)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55b8-b8dd-f04c-a3bac0d89138	Igralec ali animator	Igralci in animatorji	Igralka ali animatorka	igralec
000f0000-55b8-b8dd-8b09-6014917671c7	Baletnik ali plesalec	Baletniki in plesalci	Baletnica ali plesalka	igralec
000f0000-55b8-b8dd-8e4e-a9c03610c56e	Avtor	Avtorji	Avtorka	umetnik
000f0000-55b8-b8dd-f573-32eaae156ae3	Režiser	Režiserji	Režiserka	umetnik
000f0000-55b8-b8dd-db77-d09303381e0e	Scenograf	Scenografi	Scenografka	tehnik
000f0000-55b8-b8dd-7f85-3286856370ba	Kostumograf	Kostumografi	Kostumografinja	tehnik
000f0000-55b8-b8dd-03a0-35851a9ef814	Oblikovalec maske	Oblikovalci maske	Oblikovalka maske	tehnik
000f0000-55b8-b8dd-c1d9-0a2ef3533c69	Avtor glasbe	Avtorji glasbe	Avtorica glasbe	umetnik
000f0000-55b8-b8dd-ade4-dfe6f3e13735	Oblikovalec svetlobe	Oblikovalci svetlobe	Oblikovalka svetlobe	tehnik
000f0000-55b8-b8dd-d816-1869831f7bb3	Koreograf	Koreografi	Koreografinja	umetnik
000f0000-55b8-b8dd-063a-b09eebedc1fc	Dramaturg	Dramaturgi	Dramaturginja	umetnik
000f0000-55b8-b8dd-dbc2-d25af8ef494f	Lektor	Lektorji	Lektorica	umetnik
000f0000-55b8-b8dd-b22e-689ece37b33c	Prevajalec	Prevajalci	Prevajalka	umetnik
000f0000-55b8-b8dd-5204-a3e6973da898	Oblikovalec videa	Oblikovalci videa	Oblikovalka videa	umetnik
000f0000-55b8-b8dd-c5e0-00bce5a63ec5	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijska ustvarjalka	umetnik
000f0000-55b8-b8dd-933e-7ef597f99724	Nerazvrščeno	Nerazvrščeno	Nerazvrščeno	\N
000f0000-55b8-b8dd-02c3-b87e5e987696	Inšpicient	Inšpicienti	Inšpicientka	inspicient
000f0000-55b8-b8dd-7d5e-4ed8fd0aa994	Šepetalec	Šepetalci	Šepetalka	sepetalec
000f0000-55b8-b8dd-8358-0c3d74f1ecb7	Tehnični vodja	Tehnične vodje	Tehnični vodja	tehnik
\.


--
-- TOC entry 3020 (class 0 OID 10872775)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55b8-b8dd-9b08-42e5ac072b10	01	Velika predstava	f	1.00	1.00
002b0000-55b8-b8dd-a618-da4046dd0174	02	Mala predstava	f	0.50	0.50
002b0000-55b8-b8dd-b487-ab8e73794b3f	03	Mala koprodukcija	t	0.40	1.00
002b0000-55b8-b8dd-7e2b-cc74aee0f629	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55b8-b8dd-117b-3e2f00cc9674	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2977 (class 0 OID 10872277)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 10872123)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55b8-b8dd-017c-1941709fcec9	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO.2KjoFzGMtVhgrmS8qQhKCZm4YmVLhy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-9536-aaef0dc262e0	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-1c3c-d700bb706cc8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-4bcf-106c4f312c1e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-eb99-0332d110358c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-8a76-b7da45a64650	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-0375-f5810d515393	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-674d-8272d29a7836	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-b37a-5fedc92e86d6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-5a6b-71264aa4555b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55b8-b8de-bf53-197e331eb3c7	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55b8-b8dd-3dc2-d71b18a73680	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3012 (class 0 OID 10872628)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55b8-b8de-6153-132957ed8db3	00160000-55b8-b8de-0c15-8f3e1ccd9c39	00150000-55b8-b8dd-0e99-bde6d09f4702	00140000-55b8-b8dc-5362-b07dce1cdd88	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55b8-b8de-fe9d-7b724737f751
000e0000-55b8-b8de-120a-8ceeaaa3c959	00160000-55b8-b8de-a43b-4fc0c8085265	00150000-55b8-b8dd-e514-6be883b1b221	00140000-55b8-b8dc-47ec-5acee1754736	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55b8-b8de-84c2-c430e2cac5bb
000e0000-55b8-b8de-f4f1-af9e48bbb9bc	\N	00150000-55b8-b8dd-e514-6be883b1b221	00140000-55b8-b8dc-47ec-5acee1754736	00190000-55b8-b8de-7ddd-2c1cae65bb46	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55b8-b8de-fe9d-7b724737f751
000e0000-55b8-b8de-2457-f66bbabc1d71	\N	00150000-55b8-b8dd-e514-6be883b1b221	00140000-55b8-b8dc-47ec-5acee1754736	00190000-55b8-b8de-7ddd-2c1cae65bb46	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55b8-b8de-fe9d-7b724737f751
000e0000-55b8-b8de-75bf-569686e7be73	\N	00150000-55b8-b8dd-e514-6be883b1b221	00140000-55b8-b8dc-47ec-5acee1754736	00190000-55b8-b8de-7ddd-2c1cae65bb46	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55b8-b8de-6974-06a37cd47c93
\.


--
-- TOC entry 2982 (class 0 OID 10872339)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55b8-b8de-e804-94b858dfc032	000e0000-55b8-b8de-120a-8ceeaaa3c959	1	
00200000-55b8-b8de-a6e2-62e3433489e5	000e0000-55b8-b8de-120a-8ceeaaa3c959	2	
\.


--
-- TOC entry 2997 (class 0 OID 10872464)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 10872845)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 10872817)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 10872857)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 10872533)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55b8-b8de-e120-4ef8bf75cdff	00090000-55b8-b8de-5b22-5b02f407e7b2	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55b8-b8de-9d77-0699b9b02f83	00090000-55b8-b8de-e927-1ece1f1c45aa	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55b8-b8de-51d3-1c0a5fa80984	00090000-55b8-b8de-5c9e-958d0938a582	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2984 (class 0 OID 10872371)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 10872618)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55b8-b8dc-5362-b07dce1cdd88	01	Drama	drama (SURS 01)
00140000-55b8-b8dc-6dad-fc050646f481	02	Opera	opera (SURS 02)
00140000-55b8-b8dc-801e-be88f451f222	03	Balet	balet (SURS 03)
00140000-55b8-b8dc-bc81-1465e216bc2a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55b8-b8dc-9307-cfc3387586c0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55b8-b8dc-47ec-5acee1754736	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55b8-b8dc-73db-592d85c96521	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3003 (class 0 OID 10872523)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55b8-b8dd-6f60-5feb67fc379d	01	Opera	opera
00150000-55b8-b8dd-a9e0-750ff366aa70	02	Opereta	opereta
00150000-55b8-b8dd-da7c-b531d2c4f2d2	03	Balet	balet
00150000-55b8-b8dd-91f7-d2293841dadc	04	Plesne prireditve	plesne prireditve
00150000-55b8-b8dd-eb2a-e679f0851d94	05	Lutkovno gledališče	lutkovno gledališče
00150000-55b8-b8dd-69d9-5415fb57530f	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55b8-b8dd-58db-2053ae806c15	07	Biografska drama	biografska drama
00150000-55b8-b8dd-0e99-bde6d09f4702	08	Komedija	komedija
00150000-55b8-b8dd-441c-db953eaf5e0c	09	Črna komedija	črna komedija
00150000-55b8-b8dd-a8ff-bc2a4ff190b9	10	E-igra	E-igra
00150000-55b8-b8dd-e514-6be883b1b221	11	Kriminalka	kriminalka
00150000-55b8-b8dd-1932-e2a5567a4037	12	Musical	musical
\.


--
-- TOC entry 2509 (class 2606 OID 10872177)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 10872675)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 10872665)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 10872579)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 10872898)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 10872361)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 10872386)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 10872791)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 10872303)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 10872721)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 10872519)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 10872337)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 10872380)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 10872317)
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
-- TOC entry 2601 (class 2606 OID 10872429)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 10872874)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 10872881)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 10872906)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 10872456)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 10872275)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 10872186)
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
-- TOC entry 2516 (class 2606 OID 10872210)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 10872166)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2500 (class 2606 OID 10872151)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 10872462)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 10872495)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 10872613)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 10872239)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 10872263)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 10872435)
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
-- TOC entry 2531 (class 2606 OID 10872253)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 10872324)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 10872447)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 10872754)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 10872762)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 10872744)
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
-- TOC entry 2707 (class 2606 OID 10872773)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 10872479)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 10872420)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 10872411)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 10872601)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 10872547)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 10872122)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 10872486)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 10872140)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2502 (class 2606 OID 10872160)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 10872504)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 10872442)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 10872392)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 10872815)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 10872803)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 10872797)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 10872560)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 10872219)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 10872402)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 10872590)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 10872785)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 10872288)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 10872135)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 10872644)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 10872346)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 10872470)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 10872855)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 10872839)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 10872863)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 10872538)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 10872375)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 10872626)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 10872531)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 10872368)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2649 (class 1259 OID 10872561)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 10872562)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 10872876)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 10872875)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2523 (class 1259 OID 10872241)
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
-- TOC entry 2614 (class 1259 OID 10872463)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 10872843)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 10872842)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 10872844)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 10872841)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 10872840)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 10872449)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 10872448)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 10872347)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 10872520)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 10872522)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 10872521)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2548 (class 1259 OID 10872319)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 10872318)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 10872774)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2659 (class 1259 OID 10872615)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 10872616)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2661 (class 1259 OID 10872617)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 10872864)
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
-- TOC entry 2668 (class 1259 OID 10872649)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2669 (class 1259 OID 10872646)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2670 (class 1259 OID 10872650)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2671 (class 1259 OID 10872648)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2672 (class 1259 OID 10872647)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2538 (class 1259 OID 10872290)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 10872289)
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
-- TOC entry 2514 (class 1259 OID 10872213)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 10872487)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2578 (class 1259 OID 10872381)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 10872167)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2505 (class 1259 OID 10872168)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 10872507)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 10872506)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 10872505)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2552 (class 1259 OID 10872325)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 10872327)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2554 (class 1259 OID 10872326)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2715 (class 1259 OID 10872805)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 10872415)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 10872413)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 10872412)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 10872414)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2495 (class 1259 OID 10872141)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 10872142)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 10872471)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 10872899)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2746 (class 1259 OID 10872907)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 10872908)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 10872436)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 10872548)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 10872549)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 10872726)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2690 (class 1259 OID 10872725)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2691 (class 1259 OID 10872722)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 10872723)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2693 (class 1259 OID 10872724)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 10872255)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2528 (class 1259 OID 10872254)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2529 (class 1259 OID 10872256)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2488 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 10872755)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2698 (class 1259 OID 10872756)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2682 (class 1259 OID 10872679)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2683 (class 1259 OID 10872677)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2684 (class 1259 OID 10872678)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 10872539)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 10872424)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 10872423)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 10872421)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 10872422)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2466 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2678 (class 1259 OID 10872667)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 10872666)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2694 (class 1259 OID 10872745)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2559 (class 1259 OID 10872338)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2712 (class 1259 OID 10872792)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 10872882)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 10872883)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2510 (class 1259 OID 10872188)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2511 (class 1259 OID 10872187)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2519 (class 1259 OID 10872220)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 10872221)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2583 (class 1259 OID 10872405)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 10872404)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 10872403)
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
-- TOC entry 2566 (class 1259 OID 10872370)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 10872366)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2568 (class 1259 OID 10872363)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 10872364)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 10872362)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 10872367)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2572 (class 1259 OID 10872365)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 10872240)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 10872304)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 10872306)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2546 (class 1259 OID 10872305)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2547 (class 1259 OID 10872307)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 10872430)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 10872614)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 10872645)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 10872211)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 10872212)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 10872532)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 10872816)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 10872276)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2718 (class 1259 OID 10872804)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2622 (class 1259 OID 10872481)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 10872480)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2685 (class 1259 OID 10872676)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 10872680)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2469 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 10872264)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 10872627)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 10872856)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2703 (class 1259 OID 10872763)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 10872764)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 10872161)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 10872369)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2775 (class 2606 OID 10873044)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2778 (class 2606 OID 10873029)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 10873034)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 10873054)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 10873024)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2774 (class 2606 OID 10873049)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 10873039)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 10873199)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 10873204)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 10873374)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 10873369)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 10872959)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 10873139)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 10873354)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 10873349)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2836 (class 2606 OID 10873359)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 10873344)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2840 (class 2606 OID 10873339)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 10873134)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 10873129)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 10873019)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 10873169)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 10873179)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2803 (class 2606 OID 10873174)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2766 (class 2606 OID 10872994)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 10872989)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 10873119)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 10873324)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2812 (class 2606 OID 10873209)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 10873214)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 10873219)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2841 (class 2606 OID 10873364)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2814 (class 2606 OID 10873239)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2817 (class 2606 OID 10873224)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2813 (class 2606 OID 10873244)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2815 (class 2606 OID 10873234)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2816 (class 2606 OID 10873229)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2764 (class 2606 OID 10872984)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 10872979)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 10872944)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 10872939)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 10873149)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 10873059)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 10872919)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2752 (class 2606 OID 10872924)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 10873164)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2800 (class 2606 OID 10873159)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 10873154)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 10872999)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 10873009)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2769 (class 2606 OID 10873004)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2835 (class 2606 OID 10873334)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 10873094)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 10873084)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 10873079)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 10873089)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 10872909)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2750 (class 2606 OID 10872914)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 10873144)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2846 (class 2606 OID 10873389)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 10873394)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 10873399)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 10873124)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2807 (class 2606 OID 10873189)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2806 (class 2606 OID 10873194)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 10873299)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 10873294)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2828 (class 2606 OID 10873279)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 10873284)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2826 (class 2606 OID 10873289)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 10872969)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 10872964)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 10872974)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 10873309)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2830 (class 2606 OID 10873314)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 10873269)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 10873274)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2823 (class 2606 OID 10873259)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2822 (class 2606 OID 10873264)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2805 (class 2606 OID 10873184)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 10873114)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 10873109)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 10873099)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 10873104)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2818 (class 2606 OID 10873254)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2819 (class 2606 OID 10873249)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2829 (class 2606 OID 10873304)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2771 (class 2606 OID 10873014)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 10873319)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 10873329)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2845 (class 2606 OID 10873379)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2844 (class 2606 OID 10873384)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 10872934)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 10872929)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 10872949)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2758 (class 2606 OID 10872954)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 10873074)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 10873069)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 10873064)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-29 13:28:31 CEST

--
-- PostgreSQL database dump complete
--

