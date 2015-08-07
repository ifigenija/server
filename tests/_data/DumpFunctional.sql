--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-07 12:50:51 CEST

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
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 12464505)
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
-- TOC entry 228 (class 1259 OID 12465008)
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
-- TOC entry 227 (class 1259 OID 12464991)
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
-- TOC entry 221 (class 1259 OID 12464903)
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
-- TOC entry 244 (class 1259 OID 12465251)
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
-- TOC entry 197 (class 1259 OID 12464684)
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
-- TOC entry 200 (class 1259 OID 12464718)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12465153)
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
-- TOC entry 192 (class 1259 OID 12464627)
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
-- TOC entry 229 (class 1259 OID 12465021)
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
    materialni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    imakoprodukcije boolean,
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
    sttujihselektorjev integer
);


--
-- TOC entry 216 (class 1259 OID 12464848)
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
-- TOC entry 195 (class 1259 OID 12464664)
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
-- TOC entry 199 (class 1259 OID 12464712)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12464644)
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
-- TOC entry 205 (class 1259 OID 12464765)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12465232)
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
-- TOC entry 243 (class 1259 OID 12465244)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12465267)
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
-- TOC entry 209 (class 1259 OID 12464790)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12464601)
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
-- TOC entry 184 (class 1259 OID 12464514)
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
-- TOC entry 185 (class 1259 OID 12464525)
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
-- TOC entry 180 (class 1259 OID 12464479)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12464498)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12464797)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12464828)
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
-- TOC entry 224 (class 1259 OID 12464942)
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
-- TOC entry 187 (class 1259 OID 12464558)
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
-- TOC entry 189 (class 1259 OID 12464593)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12464771)
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
-- TOC entry 188 (class 1259 OID 12464578)
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
-- TOC entry 194 (class 1259 OID 12464656)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12464783)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12465114)
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
-- TOC entry 232 (class 1259 OID 12465124)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12465070)
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
    stint integer,
    stfest integer,
    strazno integer,
    stizjem integer,
    stponprem integer,
    stponprej integer,
    stponprejvelikih integer,
    stponprejmalih integer,
    stponprejmalihkopr integer,
    stponprejsredkopr integer,
    stponprejvelikihkopr integer,
    stgostujo integer,
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
    sredstvazaprosenoprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenogostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoint numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenofest numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenorazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvazaprosenoizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnigostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniint numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnifest numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavnirazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugijavniizjem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriponprem numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriponprej numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirigostujo numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriint numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirifest numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugivirirazno numeric(12,2) DEFAULT NULL::numeric,
    sredstvadrugiviriizjem numeric(12,2) DEFAULT NULL::numeric,
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
-- TOC entry 233 (class 1259 OID 12465132)
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
-- TOC entry 212 (class 1259 OID 12464812)
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
-- TOC entry 204 (class 1259 OID 12464756)
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
-- TOC entry 203 (class 1259 OID 12464746)
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
-- TOC entry 223 (class 1259 OID 12464931)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12464880)
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
-- TOC entry 177 (class 1259 OID 12464450)
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
-- TOC entry 176 (class 1259 OID 12464448)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 12464822)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12464488)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12464472)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12464836)
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
-- TOC entry 207 (class 1259 OID 12464777)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12464723)
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
-- TOC entry 238 (class 1259 OID 12465173)
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
-- TOC entry 237 (class 1259 OID 12465165)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12465160)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12464890)
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
-- TOC entry 186 (class 1259 OID 12464550)
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
-- TOC entry 202 (class 1259 OID 12464733)
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
-- TOC entry 222 (class 1259 OID 12464920)
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
-- TOC entry 234 (class 1259 OID 12465142)
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
-- TOC entry 191 (class 1259 OID 12464613)
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
-- TOC entry 178 (class 1259 OID 12464459)
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
-- TOC entry 226 (class 1259 OID 12464968)
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
-- TOC entry 196 (class 1259 OID 12464675)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12464804)
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
-- TOC entry 240 (class 1259 OID 12465212)
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
-- TOC entry 239 (class 1259 OID 12465184)
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
-- TOC entry 241 (class 1259 OID 12465224)
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
-- TOC entry 218 (class 1259 OID 12464873)
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
-- TOC entry 198 (class 1259 OID 12464707)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12464958)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12464863)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12464453)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12464505)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12465008)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c4-8d8a-3ffb-c184fe72cbd8	000d0000-55c4-8d8a-a4ce-34543e9a1813	\N	00090000-55c4-8d8a-96ad-e1a71e4b994e	000b0000-55c4-8d8a-e714-5d92191a27bb	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c4-8d8a-fc50-665b1929cc45	000d0000-55c4-8d8a-e72a-5f2c7b6e9a8c	00100000-55c4-8d8a-0e14-aa8932a06009	00090000-55c4-8d8a-5b4d-cd5c18edf848	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c4-8d8a-4c84-dbedb0d4bdb7	000d0000-55c4-8d8a-bfd5-890ca14b17c9	00100000-55c4-8d8a-ef71-bd3df00c9d91	00090000-55c4-8d8a-8b2e-1f4c819a0109	\N	0003	t	\N	2015-08-07	\N	2	\N	\N	f	f
000c0000-55c4-8d8a-d0a4-36eb6809d1d0	000d0000-55c4-8d8a-cd4f-bec05efbe018	\N	00090000-55c4-8d8a-9b67-6fef93ad5753	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c4-8d8a-18c8-272462affe54	000d0000-55c4-8d8a-4213-482ccb541474	\N	00090000-55c4-8d8a-deff-da68eebbb760	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c4-8d8a-56b9-d986ae70b03e	000d0000-55c4-8d8a-a518-f716d67f12c6	\N	00090000-55c4-8d8a-ecae-3244ad06e886	000b0000-55c4-8d8a-fbab-41276edd54d1	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c4-8d8a-5808-42523876d588	000d0000-55c4-8d8a-d167-bda62961a1ef	00100000-55c4-8d8a-7c48-33891c3ee0ff	00090000-55c4-8d8a-bf4e-9f0632b8afd6	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c4-8d8a-6fe0-ab68935ec455	000d0000-55c4-8d8a-6e3d-1839d3549546	\N	00090000-55c4-8d8a-37cc-e86ebde27aca	000b0000-55c4-8d8a-0334-a403c8264719	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c4-8d8a-2f26-9e4b997aa06e	000d0000-55c4-8d8a-d167-bda62961a1ef	00100000-55c4-8d8a-4598-dac758addeee	00090000-55c4-8d8a-8e57-e4f92e552281	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c4-8d8a-3f07-cd3fc79c4872	000d0000-55c4-8d8a-d167-bda62961a1ef	00100000-55c4-8d8a-45ca-a0fb8bd110c2	00090000-55c4-8d8a-9c51-cc886d3e17d6	\N	0010	t	\N	2015-08-07	\N	16	\N	\N	f	t
000c0000-55c4-8d8a-a807-9ced0a9389f4	000d0000-55c4-8d8a-d167-bda62961a1ef	00100000-55c4-8d8a-d787-c9c2fda5e960	00090000-55c4-8d8a-09ea-9b08931a8e15	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12464991)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12464903)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c4-8d89-8152-c6ee9352a25d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c4-8d89-481b-7c8439321dda	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c4-8d89-a91f-f2aa72b85021	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12465251)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12464684)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c4-8d8a-b3d3-8c1af9576700	\N	\N	00200000-55c4-8d8a-de7c-8d031b8ef326	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c4-8d8a-d2bc-5a35a5014c55	\N	\N	00200000-55c4-8d8a-392b-1c71b8e482a1	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c4-8d8a-f493-52873c57082f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c4-8d8a-fcef-51d1972313fa	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c4-8d8a-69f4-a48ba6d84b93	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12464718)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12465153)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12464627)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c4-8d87-53bb-922f06f9e9be	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c4-8d87-ef33-96c83b943a12	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c4-8d87-5338-0a9b07f936af	AL	ALB	008	Albania 	Albanija	\N
00040000-55c4-8d87-66d4-2d1da5f1a9c2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c4-8d87-3278-165f6e4923b9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c4-8d87-6b7e-ad8b3c17c55b	AD	AND	020	Andorra 	Andora	\N
00040000-55c4-8d87-dfba-d769aff9f1ff	AO	AGO	024	Angola 	Angola	\N
00040000-55c4-8d87-bb39-2f1f9f9a848c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c4-8d87-8564-1d9563ead757	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c4-8d87-e77e-55268fa6b9c7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c4-8d87-63bc-01bef2246da4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c4-8d87-bc61-1fe36c57bfb2	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c4-8d87-8db1-81e744078cf0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c4-8d87-d7f2-9580ff4ba990	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c4-8d87-58f6-b6be025f7a56	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c4-8d87-fe96-1ac16e7c8828	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c4-8d87-4567-de4e4227abd3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c4-8d87-eb8c-ec4a29ae6b02	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c4-8d87-1b5f-aad7b4a9bb97	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c4-8d87-3e42-d924e5ae0596	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c4-8d87-a24d-ff5741bb84eb	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c4-8d87-6d8a-1076e474035f	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c4-8d87-1f87-e248565daf3c	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c4-8d87-05f0-bd2b8780ea14	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c4-8d87-5460-18c2ff97e2a0	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c4-8d87-cece-924f6c77bee4	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c4-8d87-2b16-46dfa08ffd03	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c4-8d87-81fa-4851b453c5b9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c4-8d87-5aa6-8962b3774f61	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c4-8d87-ecba-56faa5c99cff	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c4-8d87-6d1b-a7f39ee94a15	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c4-8d87-6480-a571440ba8d9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c4-8d87-f6fe-309c55ab43cd	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c4-8d87-7421-adccb8759213	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c4-8d87-3c11-a8bd6aee6905	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c4-8d87-c318-633f0e59775b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c4-8d87-d7a8-1c205b7b449e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c4-8d87-c059-b424e8271b52	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c4-8d87-e714-24d3745fcc29	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c4-8d87-d549-f53550ebb526	CA	CAN	124	Canada 	Kanada	\N
00040000-55c4-8d87-2c90-8ac74a2d1999	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c4-8d87-3a15-973c97616add	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c4-8d87-c1c4-d124597285c0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c4-8d87-d15f-618d25e1516d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c4-8d87-5047-2f6f9df75df4	CL	CHL	152	Chile 	Čile	\N
00040000-55c4-8d87-a50a-634415de0aa0	CN	CHN	156	China 	Kitajska	\N
00040000-55c4-8d87-e0d1-4662d60ca872	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c4-8d87-d799-14235c3e5e29	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c4-8d87-6568-ab5fe0aa7f26	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c4-8d87-d3f9-2528ce325e31	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c4-8d87-987e-f537ca7e56f3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c4-8d87-d68e-573b424b90fc	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c4-8d87-1b01-936f3b81dd6d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c4-8d87-2472-6f56b016252c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c4-8d87-9703-cc6fdb0f7e33	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c4-8d87-28d3-f1248bd63790	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c4-8d87-5c8e-791d9e9f67d3	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c4-8d87-5f10-f30b1f7886a2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c4-8d87-465a-3fc2bf86930f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c4-8d87-0138-1dadbe609c7a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c4-8d87-2f37-64b7a0c3adb2	DK	DNK	208	Denmark 	Danska	\N
00040000-55c4-8d87-89ab-51f6980df91d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c4-8d87-c746-399665e8cc54	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c4-8d87-05c5-12ca3415420b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c4-8d87-cda8-107105856f6f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c4-8d87-c079-0f068f69ba2d	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c4-8d87-1050-9003e73328c6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c4-8d87-7d55-2699d1986d2c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c4-8d87-f3ed-3b73a9e78c9f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c4-8d87-953d-018d18c4da35	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c4-8d87-af0d-089f5919cd16	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c4-8d87-41bf-590b792df045	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c4-8d87-c11a-f211b5a83093	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c4-8d87-51a2-0783330c10ce	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c4-8d87-1224-18b3c11ad170	FI	FIN	246	Finland 	Finska	\N
00040000-55c4-8d87-a8fc-bda8cb747edf	FR	FRA	250	France 	Francija	\N
00040000-55c4-8d87-45e9-4778054fcc6b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c4-8d87-fc5c-9d7b82d807a6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c4-8d87-c08d-2cf2648f8a7a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c4-8d87-ed21-ae09a914cfb7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c4-8d87-2e6d-9d2845ec9220	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c4-8d87-a80c-589eb9e0d687	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c4-8d87-cd10-ed8254c24410	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c4-8d87-1c50-118726a339da	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c4-8d87-d24c-849de1729f13	GH	GHA	288	Ghana 	Gana	\N
00040000-55c4-8d87-bd78-0f1c2c14a477	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c4-8d87-62d3-56cb8cf22bee	GR	GRC	300	Greece 	Grčija	\N
00040000-55c4-8d87-9ef8-11373b270327	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c4-8d87-5c72-7d52471e5cda	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c4-8d87-2e1b-b81e633e5910	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c4-8d87-9a90-ca01e2c6bd7e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c4-8d87-7338-52a5cb095539	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c4-8d87-46e9-5f49ec0d994b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c4-8d87-7f05-cd4da2884ed3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c4-8d87-ac81-5677ce669d3f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c4-8d87-cbcf-db51b7580bc7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c4-8d87-e128-1c2a803b68d9	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c4-8d87-6f23-8dd9bd9f2d67	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c4-8d87-442b-87b8cb1cafe4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c4-8d87-c2e6-5b7086eeab29	HN	HND	340	Honduras 	Honduras	\N
00040000-55c4-8d87-e208-012769cca939	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c4-8d87-b46a-827cff08d37e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c4-8d87-e270-c9f292959f45	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c4-8d87-fc0c-3644bd142d6d	IN	IND	356	India 	Indija	\N
00040000-55c4-8d87-2596-7e697fd2a830	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c4-8d87-99df-357b349e3895	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c4-8d87-e78e-dea9f2fee28a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c4-8d87-ffe9-ebefd1dd20e8	IE	IRL	372	Ireland 	Irska	\N
00040000-55c4-8d87-6c4f-30649b50addf	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c4-8d87-6fcf-ab4e9540badb	IL	ISR	376	Israel 	Izrael	\N
00040000-55c4-8d87-cd8b-d40d6c8312fd	IT	ITA	380	Italy 	Italija	\N
00040000-55c4-8d87-02af-6aba23c09ec6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c4-8d87-884d-e89d9e94d9b1	JP	JPN	392	Japan 	Japonska	\N
00040000-55c4-8d87-c15a-04714e77258c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c4-8d87-0cba-f0045a3f0921	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c4-8d87-f8d0-dcbe2527678d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c4-8d87-cc30-fb7b3d371e86	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c4-8d87-1f78-c63b1381a674	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c4-8d87-3f32-6b359173be18	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c4-8d87-d714-d85d1bca3b70	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c4-8d87-680a-fd831bf381b3	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c4-8d87-d06d-29b175b9da75	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c4-8d87-045e-1d9af1605295	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c4-8d87-3454-617fed3b1a05	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c4-8d87-3813-504b3dd4d449	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c4-8d87-869c-84fbb4227a97	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c4-8d87-ab66-26255b109bf4	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c4-8d87-16ce-9d5f9051b918	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c4-8d87-ad4c-65cbda982048	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c4-8d87-7581-899e23b91ada	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c4-8d87-d09d-8d97130323d2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c4-8d87-f06e-133d51876247	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c4-8d87-6f35-ccee983a2eb0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c4-8d87-1aa0-8b97468dac1e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c4-8d87-411c-6407ae49778f	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c4-8d87-635c-4b11e96cb84b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c4-8d87-d914-43c5f19e177b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c4-8d87-faf0-626c83480f52	ML	MLI	466	Mali 	Mali	\N
00040000-55c4-8d87-d8de-abc88caa9e59	MT	MLT	470	Malta 	Malta	\N
00040000-55c4-8d87-d567-24ef644a3c2a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c4-8d87-419d-5a1814a49f81	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c4-8d87-e478-09945450b7da	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c4-8d87-f85b-e1a5bca186fc	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c4-8d87-15a6-9b9550135fde	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c4-8d87-0dbc-be18075cccbc	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c4-8d87-d973-8469399ac8d3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c4-8d87-6d76-6972751bd3a0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c4-8d87-5b49-ae3d06539c73	MC	MCO	492	Monaco 	Monako	\N
00040000-55c4-8d87-c87f-3d13e98c12cb	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c4-8d87-336b-f3fca8af8e52	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c4-8d87-43af-d1b14090bcda	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c4-8d87-d274-4a43a7f6e598	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c4-8d87-a369-68b25ab3a168	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c4-8d87-eb37-cb34d110717e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c4-8d87-754e-76f927f600da	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c4-8d87-9f0d-9b70d89d20bc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c4-8d87-83d3-f38a2cc4f990	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c4-8d87-7beb-232bb0d3b979	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c4-8d87-cda2-5e0d63e6bff2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c4-8d87-e52f-c7f85389a4f5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c4-8d87-7287-dd8962bd4df0	NE	NER	562	Niger 	Niger 	\N
00040000-55c4-8d87-aaef-beb0c4fd2b32	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c4-8d87-8c90-0493b2ad586d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c4-8d87-d2a2-aa2c277eec3e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c4-8d87-d8ce-7c611b469971	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c4-8d87-5e0b-972d85f3051a	NO	NOR	578	Norway 	Norveška	\N
00040000-55c4-8d87-684f-1aadb9f5aa3e	OM	OMN	512	Oman 	Oman	\N
00040000-55c4-8d87-007e-f7c4ee6b271f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c4-8d87-9f72-6236b0ae98bf	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c4-8d87-b228-e83d204cfc51	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c4-8d87-7ffc-b9c095d45186	PA	PAN	591	Panama 	Panama	\N
00040000-55c4-8d87-8d7e-3b8f07708bfa	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c4-8d87-f252-74a8adc43375	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c4-8d87-4251-045b329f07a6	PE	PER	604	Peru 	Peru	\N
00040000-55c4-8d87-b587-3cc6a623caf3	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c4-8d87-aeba-17024219d593	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c4-8d87-2fe4-493a9ff6f751	PL	POL	616	Poland 	Poljska	\N
00040000-55c4-8d87-22cf-cdb19b8081ad	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c4-8d87-31eb-69aad8511eb0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c4-8d87-2253-a302ac05e902	QA	QAT	634	Qatar 	Katar	\N
00040000-55c4-8d87-caae-eb00c9b65cbb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c4-8d87-4661-0b652fe9a757	RO	ROU	642	Romania 	Romunija	\N
00040000-55c4-8d87-09e3-e79b4d23bab4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c4-8d87-e2de-66a1cd7c57d3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c4-8d87-8281-82c231533537	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c4-8d87-6e7c-21b8072d4225	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c4-8d87-4b43-3f05f55fc75f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c4-8d87-9a06-59ebbd9576e3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c4-8d87-69f8-72011ccb79dc	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c4-8d87-80a5-fed601fc628f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c4-8d87-3976-a84e13ed2fe0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c4-8d87-dbe2-e6a0bf519c21	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c4-8d87-6e20-a5608c215ce7	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c4-8d87-86e2-e3bec44beb40	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c4-8d87-a37b-08aa15bdb860	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c4-8d87-a3e6-fe7dddd6c2cf	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c4-8d87-08f4-101c42a59137	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c4-8d87-d501-e25c6a3a06b5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c4-8d87-89e2-0c15ab68183c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c4-8d87-e3b8-b4587faf9093	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c4-8d87-359e-57381234c944	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c4-8d87-e3da-1f324341234a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c4-8d87-2535-e0e90eeee170	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c4-8d87-b6bb-82133f68bd7d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c4-8d87-b886-70af74a12116	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c4-8d87-f0e6-1d3010a19359	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c4-8d87-b893-eb07cd9f8584	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c4-8d87-8fa6-fda31472d37b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c4-8d87-f7e2-9d19dd5bd24e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c4-8d87-97e0-145a9e978512	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c4-8d87-c01e-db413bb74770	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c4-8d87-ddbb-aa44e0d04e45	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c4-8d87-95f4-a9aa75697c52	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c4-8d87-2027-bff72877f9ea	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c4-8d87-fae1-49502122dc8a	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c4-8d87-440a-37908d6df7c5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c4-8d87-2fac-2cbf46bc5721	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c4-8d87-bf15-227289306a9e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c4-8d87-fca5-83ddc9a054e9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c4-8d87-e019-4a3f05066b2d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c4-8d87-8d45-8669d6594164	TH	THA	764	Thailand 	Tajska	\N
00040000-55c4-8d87-24f4-0461e71407a4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c4-8d87-e3da-0b110dd0dce3	TG	TGO	768	Togo 	Togo	\N
00040000-55c4-8d87-7589-0a8ea0ea531b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c4-8d87-e7cd-a3e8ac16835a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c4-8d87-f718-15829d7e2700	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c4-8d87-38e9-056ae176f748	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c4-8d87-2c19-329f57b561e1	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c4-8d87-e647-88bf6a5141b4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c4-8d87-83b4-74f029efc2a5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c4-8d87-bd18-8f6bea896b47	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c4-8d87-0b84-f74edca29518	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c4-8d87-2e0e-7c5fb72857b9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c4-8d87-b74b-fc0756d5f252	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c4-8d87-23e1-5c4a1b0d126b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c4-8d87-7b6e-45422516a3c4	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c4-8d87-b0d3-3ccbe8290747	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c4-8d87-3000-e59f017eb50c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c4-8d87-01ba-c396fa6bb8f5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c4-8d87-e630-200343c04057	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c4-8d87-4f80-72bb44dcf5b9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c4-8d87-bf74-3293df7ebfd1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c4-8d87-07cc-9ba433911fe6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c4-8d87-c92f-481e95c3dc40	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c4-8d87-e6fc-3d409c50428f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c4-8d87-1020-9ac9b7edd4a5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c4-8d87-ca40-7c91bb49711f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c4-8d87-9fcd-fd2eecc16202	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c4-8d87-d126-4ce2f06edbdc	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12465021)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55c4-8d8a-ff5a-11387d2bd256	000e0000-55c4-8d8a-c7e5-6bd3049b7cf8	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c4-8d88-6561-781e652132f0	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c4-8d8a-d7d7-1638ddc9ee51	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c4-8d88-c5d9-fbcac9e1bce8	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c4-8d8a-fb18-921e23a44eab	000e0000-55c4-8d8a-e975-1634b5ad5df1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c4-8d88-6561-781e652132f0	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c4-8d8a-4b6b-02df8ef6710a	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c4-8d8a-9f9e-1ace8dde40f7	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12464848)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c4-8d8a-d167-bda62961a1ef	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c4-8d88-1384-868010d6865d
000d0000-55c4-8d8a-a4ce-34543e9a1813	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c4-8d88-1384-868010d6865d
000d0000-55c4-8d8a-e72a-5f2c7b6e9a8c	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c4-8d88-efbc-f930431b9845
000d0000-55c4-8d8a-bfd5-890ca14b17c9	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c4-8d88-6718-39b066ddea45
000d0000-55c4-8d8a-cd4f-bec05efbe018	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c4-8d88-e7ac-a77b2fae6336
000d0000-55c4-8d8a-4213-482ccb541474	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c4-8d88-dd02-bed4ff81b75d
000d0000-55c4-8d8a-a518-f716d67f12c6	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c4-8d88-1384-868010d6865d
000d0000-55c4-8d8a-6e3d-1839d3549546	000e0000-55c4-8d8a-847a-9d8c058739d0	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c4-8d88-9d56-003dfeeb3f49
\.


--
-- TOC entry 3010 (class 0 OID 12464664)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12464712)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12464644)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c4-8d8a-f5e8-630990d841aa	00080000-55c4-8d89-b579-b2d5e8db7d99	00090000-55c4-8d8a-9c51-cc886d3e17d6	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12464765)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12465232)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12465244)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12465267)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12464790)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12464601)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c4-8d88-6c3f-3cfe2587039a	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c4-8d88-ca12-76342be3903b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c4-8d88-a453-10734b7c227b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c4-8d88-7b14-ee5ce3d7b5fe	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c4-8d88-786b-47cee5dc5ded	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c4-8d88-8f0a-84281e12139c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c4-8d88-57d2-04bdce6164e1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c4-8d88-8b35-c77a395dd18d	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c4-8d88-8c54-10389c94f4ec	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c4-8d88-5ae1-e261ef0bcb63	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c4-8d88-3603-1260077f8d78	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c4-8d88-c142-f6c192e2bb81	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c4-8d88-6f04-71320b023046	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c4-8d88-2486-30702971c489	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c4-8d89-e383-b8bc723b0613	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c4-8d89-6df6-479dc77d6f70	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c4-8d89-3ab9-6f5b5f66ad88	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c4-8d89-4750-ad3a2822785a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c4-8d89-31e7-7302980038ed	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c4-8d89-198d-76cba4ad709d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12464514)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c4-8d89-3af6-1f17a90538dc	00000000-55c4-8d89-6df6-479dc77d6f70	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c4-8d89-2c01-12a117d0a1ab	00000000-55c4-8d89-6df6-479dc77d6f70	00010000-55c4-8d88-b9e3-7753a1b890ee	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c4-8d89-ef45-af71c47cb016	00000000-55c4-8d89-3ab9-6f5b5f66ad88	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12464525)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c4-8d8a-96ad-e1a71e4b994e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c4-8d8a-9b67-6fef93ad5753	00010000-55c4-8d8a-7fdd-e8e1d4d4da1d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c4-8d8a-8b2e-1f4c819a0109	00010000-55c4-8d8a-c66d-96fe403d6dcf	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c4-8d8a-8e57-e4f92e552281	00010000-55c4-8d8a-d6d4-646ce10b3693	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c4-8d8a-7b1f-30cd76055259	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c4-8d8a-ecae-3244ad06e886	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c4-8d8a-09ea-9b08931a8e15	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c4-8d8a-bf4e-9f0632b8afd6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c4-8d8a-9c51-cc886d3e17d6	00010000-55c4-8d8a-44f3-b0ffddd55f79	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c4-8d8a-5b4d-cd5c18edf848	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c4-8d8a-3fde-305ee6516020	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c4-8d8a-deff-da68eebbb760	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c4-8d8a-37cc-e86ebde27aca	00010000-55c4-8d8a-f287-0543f63fc112	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12464479)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c4-8d88-5e67-30f29655dc91	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c4-8d88-5f63-1494bc263e76	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c4-8d88-3458-f4d90167e813	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c4-8d88-4707-5474d467d729	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c4-8d88-f621-42af80b70ca8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c4-8d88-c2be-f027ca196bcc	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c4-8d88-3e25-a90a0bace340	Abonma-read	Abonma - branje	f
00030000-55c4-8d88-9eb2-6093045dfc64	Abonma-write	Abonma - spreminjanje	f
00030000-55c4-8d88-98ea-2a38be071445	Alternacija-read	Alternacija - branje	f
00030000-55c4-8d88-28df-31e3700a0103	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c4-8d88-e61a-d6547ed13688	Arhivalija-read	Arhivalija - branje	f
00030000-55c4-8d88-201b-cae92f40eaff	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c4-8d88-35a4-856e6003bc8d	Besedilo-read	Besedilo - branje	f
00030000-55c4-8d88-5a89-0677a883d57e	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c4-8d88-ad9b-2ffd985d3fc1	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c4-8d88-f4d4-826c9de86d30	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c4-8d88-2619-07bc4ca0db32	Dogodek-read	Dogodek - branje	f
00030000-55c4-8d88-a65c-5cb83938ab0b	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c4-8d88-19f9-a028182f3d6c	DrugiVir-read	DrugiVir - branje	f
00030000-55c4-8d88-e23c-c2dc4557150b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c4-8d88-06f3-5a9bf714c17f	Drzava-read	Drzava - branje	f
00030000-55c4-8d88-bb47-4aab4dc33f91	Drzava-write	Drzava - spreminjanje	f
00030000-55c4-8d88-1ff6-7ec063416f84	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c4-8d88-e0d7-96dcf5e04389	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c4-8d88-7f92-be6554683e68	Funkcija-read	Funkcija - branje	f
00030000-55c4-8d88-f715-ca7967bf54c4	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c4-8d88-307f-dc223308cd09	Gostovanje-read	Gostovanje - branje	f
00030000-55c4-8d88-1bd2-25ace105566f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c4-8d88-6351-00f41c01950a	Gostujoca-read	Gostujoca - branje	f
00030000-55c4-8d88-a4b4-0dff396f57fc	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c4-8d88-9d25-76a975d385d1	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c4-8d88-6774-4149f316d014	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c4-8d88-0947-352cdcf3e103	Kupec-read	Kupec - branje	f
00030000-55c4-8d88-c92d-9b448f821cf1	Kupec-write	Kupec - spreminjanje	f
00030000-55c4-8d88-71e4-a61f8f5ffca2	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c4-8d88-d691-f210a54eef6b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c4-8d88-a321-db8c0666abc0	Option-read	Option - branje	f
00030000-55c4-8d88-236e-997cdfcc4ba4	Option-write	Option - spreminjanje	f
00030000-55c4-8d88-afb9-f7fd6d3994d5	OptionValue-read	OptionValue - branje	f
00030000-55c4-8d88-5874-b46412a4aa62	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c4-8d88-3b5a-6a98efb095dd	Oseba-read	Oseba - branje	f
00030000-55c4-8d88-44eb-00779db1a823	Oseba-write	Oseba - spreminjanje	f
00030000-55c4-8d88-a7a4-53eb53050249	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c4-8d88-5863-6314ca70b692	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c4-8d88-a787-ce58fff7712d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c4-8d88-6d78-8020f6f28908	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c4-8d88-0446-9a05a3ea6b51	Pogodba-read	Pogodba - branje	f
00030000-55c4-8d88-35bc-6a65bba81085	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c4-8d88-196c-3a2158c7fd28	Popa-read	Popa - branje	f
00030000-55c4-8d88-b95a-06545105893e	Popa-write	Popa - spreminjanje	f
00030000-55c4-8d88-ed7a-81bf8aa06729	Posta-read	Posta - branje	f
00030000-55c4-8d88-0d4e-69f67cb9e4c6	Posta-write	Posta - spreminjanje	f
00030000-55c4-8d88-f228-ccaaeeefefbc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c4-8d88-6246-d7d18014dd7a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c4-8d88-d495-a28628998ea0	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c4-8d88-71a9-8e57e0ed337e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c4-8d88-d207-f2f015a880d8	Predstava-read	Predstava - branje	f
00030000-55c4-8d88-3179-1b16c3d58a7e	Predstava-write	Predstava - spreminjanje	f
00030000-55c4-8d88-7370-64ebce62d869	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c4-8d88-9e77-a2b082b5d867	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c4-8d88-eef0-21a6a3d62cfa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c4-8d88-0028-667a89139011	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c4-8d88-f2b8-fdd8b21d8140	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c4-8d88-b09a-f31d974d0517	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c4-8d88-0180-9d7dbca23634	ProgramDela-read	ProgramDela - branje	f
00030000-55c4-8d88-82f0-4b3cc5cf719d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c4-8d88-fba2-f69a1e71b1cd	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c4-8d88-8a9c-41ec5202b1c7	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c4-8d88-a952-bd9029c80a38	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c4-8d88-bb02-d525682c1e21	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c4-8d88-5424-ee61ff17bee9	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c4-8d88-a825-9c37d466afa7	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c4-8d88-a8c8-699c2cefc046	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c4-8d88-74d0-51b698a7c63a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c4-8d88-3c0b-4b93d3f95e63	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c4-8d88-620d-65b8edb72759	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c4-8d88-a229-1027239fd995	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c4-8d88-69b8-a137469303e9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c4-8d88-a6d4-111c553273ab	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c4-8d88-a462-e8fce4bd9bbc	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c4-8d88-b898-c17973f47c24	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c4-8d88-71c5-3d2be553837f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c4-8d88-5be8-bf926ff7e5c3	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c4-8d88-5018-2f3f87e037a6	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c4-8d88-2093-6f0b9e4aab24	Prostor-read	Prostor - branje	f
00030000-55c4-8d88-265c-6ea612bcd90f	Prostor-write	Prostor - spreminjanje	f
00030000-55c4-8d88-4ca7-c3bbfca25063	Racun-read	Racun - branje	f
00030000-55c4-8d88-db23-272584c6d731	Racun-write	Racun - spreminjanje	f
00030000-55c4-8d88-8e05-8129794f1cfc	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c4-8d88-79e6-bf5c425b6d70	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c4-8d88-90f1-385b798d8f11	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c4-8d88-b10c-dad4e59f5a20	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c4-8d88-dd33-d8b62c818478	Rekvizit-read	Rekvizit - branje	f
00030000-55c4-8d88-09f2-d27560ce27ca	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c4-8d88-9277-8faffa0a056e	Revizija-read	Revizija - branje	f
00030000-55c4-8d88-3a05-8ec5e3256d2e	Revizija-write	Revizija - spreminjanje	f
00030000-55c4-8d88-fc72-3318e74e0f0d	Rezervacija-read	Rezervacija - branje	f
00030000-55c4-8d88-3b61-d7c3bbb1b38b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c4-8d88-a778-040eacf9a82b	SedezniRed-read	SedezniRed - branje	f
00030000-55c4-8d88-43dd-12e46d84f5fd	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c4-8d88-2831-43426814118a	Sedez-read	Sedez - branje	f
00030000-55c4-8d88-34ad-5cd3ebb9660b	Sedez-write	Sedez - spreminjanje	f
00030000-55c4-8d88-d71e-af69c0873a02	Sezona-read	Sezona - branje	f
00030000-55c4-8d88-bfe0-96aaa5efa18f	Sezona-write	Sezona - spreminjanje	f
00030000-55c4-8d88-ff98-01ea227e75b5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c4-8d88-ad89-57f152a37c1d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c4-8d88-bc4a-7063dc1744c5	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c4-8d88-8d44-f039ea3ea018	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c4-8d88-ed11-40f077410f29	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c4-8d88-587f-7908ae3cfa6b	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c4-8d88-9fd2-98567a1a1eaf	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c4-8d88-c08a-fc591374b97a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c4-8d88-e097-9fdaa1a6e789	Telefonska-read	Telefonska - branje	f
00030000-55c4-8d88-feb3-2913607c6b69	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c4-8d88-9e0f-83853dab37f1	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c4-8d88-aa74-164e4939ca30	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c4-8d88-ff6f-02315344979c	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c4-8d88-06c7-2d4f537cf219	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c4-8d88-8e26-ac51cf229657	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c4-8d88-6585-3661305c2b75	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c4-8d88-c293-a40754c2516b	Trr-read	Trr - branje	f
00030000-55c4-8d88-0342-c1d961b1b5ad	Trr-write	Trr - spreminjanje	f
00030000-55c4-8d88-9e17-bf3a1d27b573	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c4-8d88-c3b7-6e80c4762133	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c4-8d88-7428-5fc44928c95c	Vaja-read	Vaja - branje	f
00030000-55c4-8d88-8f98-d1e59cbf78f7	Vaja-write	Vaja - spreminjanje	f
00030000-55c4-8d88-8d03-a1d465be7ca8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c4-8d88-0236-18580e935f70	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c4-8d88-8768-730533947d37	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c4-8d88-ccb7-339cd0ecbc1c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c4-8d88-2f86-88420464cc89	Zasedenost-read	Zasedenost - branje	f
00030000-55c4-8d88-ef20-b7d7438eaef3	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c4-8d88-2925-cda1a8d7cc47	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c4-8d88-7533-dbb776194d13	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c4-8d88-6422-5db57dc6f2a5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c4-8d88-c8f2-7de0c00bd8af	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c4-8d88-d794-c0b9a7589ea8	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c4-8d88-232c-c89d5436c025	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c4-8d88-51cd-c8979b44e9b2	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c4-8d88-9677-6cbbd43b316f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c4-8d88-17d1-2732d5d8453e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c4-8d88-cd46-fb174b570133	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c4-8d88-7c0b-7c3dd87fdeb7	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c4-8d88-dc10-3a8b088aabeb	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c4-8d88-d637-4da8db89c249	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c4-8d88-bd77-3cfdc3d085ed	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c4-8d88-f4b5-41c5b1010960	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c4-8d88-23ea-580279ec8d82	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 12464498)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c4-8d88-bef6-712a79ed1152	00030000-55c4-8d88-5f63-1494bc263e76
00020000-55c4-8d88-db62-a2be0f530cdb	00030000-55c4-8d88-06f3-5a9bf714c17f
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-3e25-a90a0bace340
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-9eb2-6093045dfc64
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-98ea-2a38be071445
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-28df-31e3700a0103
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-e61a-d6547ed13688
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-2619-07bc4ca0db32
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-4707-5474d467d729
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-a65c-5cb83938ab0b
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-06f3-5a9bf714c17f
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-bb47-4aab4dc33f91
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-7f92-be6554683e68
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-f715-ca7967bf54c4
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-307f-dc223308cd09
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-1bd2-25ace105566f
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-6351-00f41c01950a
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-a4b4-0dff396f57fc
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-9d25-76a975d385d1
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-6774-4149f316d014
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-a321-db8c0666abc0
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-afb9-f7fd6d3994d5
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-3b5a-6a98efb095dd
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-44eb-00779db1a823
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-196c-3a2158c7fd28
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-b95a-06545105893e
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-ed7a-81bf8aa06729
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-0d4e-69f67cb9e4c6
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-d495-a28628998ea0
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-71a9-8e57e0ed337e
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-d207-f2f015a880d8
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-3179-1b16c3d58a7e
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-f2b8-fdd8b21d8140
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-b09a-f31d974d0517
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-2093-6f0b9e4aab24
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-265c-6ea612bcd90f
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-90f1-385b798d8f11
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-b10c-dad4e59f5a20
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-dd33-d8b62c818478
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-09f2-d27560ce27ca
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-d71e-af69c0873a02
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-bfe0-96aaa5efa18f
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-ff6f-02315344979c
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-9e17-bf3a1d27b573
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-c3b7-6e80c4762133
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-7428-5fc44928c95c
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-8f98-d1e59cbf78f7
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-2f86-88420464cc89
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-ef20-b7d7438eaef3
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-2925-cda1a8d7cc47
00020000-55c4-8d88-833c-0cd17b0c2767	00030000-55c4-8d88-6422-5db57dc6f2a5
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-3e25-a90a0bace340
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-e61a-d6547ed13688
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-2619-07bc4ca0db32
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-06f3-5a9bf714c17f
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-307f-dc223308cd09
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-6351-00f41c01950a
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-9d25-76a975d385d1
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-6774-4149f316d014
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-a321-db8c0666abc0
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-afb9-f7fd6d3994d5
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-3b5a-6a98efb095dd
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-44eb-00779db1a823
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-196c-3a2158c7fd28
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-ed7a-81bf8aa06729
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-d495-a28628998ea0
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-71a9-8e57e0ed337e
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-d207-f2f015a880d8
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-2093-6f0b9e4aab24
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-90f1-385b798d8f11
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-dd33-d8b62c818478
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-d71e-af69c0873a02
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-e097-9fdaa1a6e789
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-feb3-2913607c6b69
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-c293-a40754c2516b
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-0342-c1d961b1b5ad
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-8768-730533947d37
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-ccb7-339cd0ecbc1c
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-2925-cda1a8d7cc47
00020000-55c4-8d88-da9e-d5315b31622f	00030000-55c4-8d88-6422-5db57dc6f2a5
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-3e25-a90a0bace340
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-98ea-2a38be071445
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-e61a-d6547ed13688
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-201b-cae92f40eaff
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-35a4-856e6003bc8d
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-ad9b-2ffd985d3fc1
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-2619-07bc4ca0db32
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-06f3-5a9bf714c17f
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-7f92-be6554683e68
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-307f-dc223308cd09
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-6351-00f41c01950a
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-9d25-76a975d385d1
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-a321-db8c0666abc0
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-afb9-f7fd6d3994d5
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-3b5a-6a98efb095dd
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-196c-3a2158c7fd28
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-ed7a-81bf8aa06729
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-d207-f2f015a880d8
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-f2b8-fdd8b21d8140
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-2093-6f0b9e4aab24
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-90f1-385b798d8f11
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-dd33-d8b62c818478
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-d71e-af69c0873a02
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-ff6f-02315344979c
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-7428-5fc44928c95c
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-2f86-88420464cc89
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-2925-cda1a8d7cc47
00020000-55c4-8d88-a151-e4f10d8a2f02	00030000-55c4-8d88-6422-5db57dc6f2a5
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-3e25-a90a0bace340
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-9eb2-6093045dfc64
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-28df-31e3700a0103
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-e61a-d6547ed13688
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-2619-07bc4ca0db32
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-06f3-5a9bf714c17f
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-307f-dc223308cd09
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-6351-00f41c01950a
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-a321-db8c0666abc0
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-afb9-f7fd6d3994d5
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-196c-3a2158c7fd28
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-ed7a-81bf8aa06729
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-d207-f2f015a880d8
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-2093-6f0b9e4aab24
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-90f1-385b798d8f11
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-dd33-d8b62c818478
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-d71e-af69c0873a02
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-ff6f-02315344979c
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-2925-cda1a8d7cc47
00020000-55c4-8d88-ae65-38ed0f8d518a	00030000-55c4-8d88-6422-5db57dc6f2a5
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-3e25-a90a0bace340
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-e61a-d6547ed13688
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-2619-07bc4ca0db32
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-06f3-5a9bf714c17f
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-307f-dc223308cd09
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-6351-00f41c01950a
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-a321-db8c0666abc0
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-afb9-f7fd6d3994d5
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-196c-3a2158c7fd28
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-ed7a-81bf8aa06729
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-d207-f2f015a880d8
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-2093-6f0b9e4aab24
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-90f1-385b798d8f11
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-dd33-d8b62c818478
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-d71e-af69c0873a02
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-9e0f-83853dab37f1
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-3458-f4d90167e813
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-ff6f-02315344979c
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-2925-cda1a8d7cc47
00020000-55c4-8d88-0645-1eb4c3d8d0b6	00030000-55c4-8d88-6422-5db57dc6f2a5
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-5e67-30f29655dc91
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-5f63-1494bc263e76
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-3458-f4d90167e813
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-4707-5474d467d729
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-f621-42af80b70ca8
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-c2be-f027ca196bcc
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-3e25-a90a0bace340
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-9eb2-6093045dfc64
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-98ea-2a38be071445
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-28df-31e3700a0103
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-e61a-d6547ed13688
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-201b-cae92f40eaff
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-35a4-856e6003bc8d
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-5a89-0677a883d57e
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-ad9b-2ffd985d3fc1
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-f4d4-826c9de86d30
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-2619-07bc4ca0db32
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a65c-5cb83938ab0b
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-06f3-5a9bf714c17f
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-bb47-4aab4dc33f91
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-19f9-a028182f3d6c
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-e23c-c2dc4557150b
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-1ff6-7ec063416f84
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-e0d7-96dcf5e04389
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-7f92-be6554683e68
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-f715-ca7967bf54c4
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-307f-dc223308cd09
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-1bd2-25ace105566f
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-6351-00f41c01950a
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a4b4-0dff396f57fc
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-9d25-76a975d385d1
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-6774-4149f316d014
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-0947-352cdcf3e103
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-c92d-9b448f821cf1
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-71e4-a61f8f5ffca2
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-d691-f210a54eef6b
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a321-db8c0666abc0
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-236e-997cdfcc4ba4
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-afb9-f7fd6d3994d5
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-5874-b46412a4aa62
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-3b5a-6a98efb095dd
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-44eb-00779db1a823
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a7a4-53eb53050249
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-5863-6314ca70b692
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a787-ce58fff7712d
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-6d78-8020f6f28908
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-0446-9a05a3ea6b51
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-35bc-6a65bba81085
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-196c-3a2158c7fd28
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-b95a-06545105893e
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-ed7a-81bf8aa06729
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-0d4e-69f67cb9e4c6
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-f228-ccaaeeefefbc
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-6246-d7d18014dd7a
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-d495-a28628998ea0
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-71a9-8e57e0ed337e
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-d207-f2f015a880d8
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-3179-1b16c3d58a7e
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-7370-64ebce62d869
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-9e77-a2b082b5d867
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-eef0-21a6a3d62cfa
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-0028-667a89139011
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-f2b8-fdd8b21d8140
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-b09a-f31d974d0517
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-0180-9d7dbca23634
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-82f0-4b3cc5cf719d
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-fba2-f69a1e71b1cd
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-8a9c-41ec5202b1c7
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a952-bd9029c80a38
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-bb02-d525682c1e21
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-5424-ee61ff17bee9
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a825-9c37d466afa7
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a8c8-699c2cefc046
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-74d0-51b698a7c63a
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-3c0b-4b93d3f95e63
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-620d-65b8edb72759
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a229-1027239fd995
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-69b8-a137469303e9
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a6d4-111c553273ab
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a462-e8fce4bd9bbc
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-b898-c17973f47c24
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-71c5-3d2be553837f
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-5be8-bf926ff7e5c3
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-5018-2f3f87e037a6
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-2093-6f0b9e4aab24
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-265c-6ea612bcd90f
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-4ca7-c3bbfca25063
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-db23-272584c6d731
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-8e05-8129794f1cfc
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-79e6-bf5c425b6d70
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-90f1-385b798d8f11
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-b10c-dad4e59f5a20
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-dd33-d8b62c818478
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-09f2-d27560ce27ca
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-9277-8faffa0a056e
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-3a05-8ec5e3256d2e
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-fc72-3318e74e0f0d
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-3b61-d7c3bbb1b38b
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-a778-040eacf9a82b
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-43dd-12e46d84f5fd
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-2831-43426814118a
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-34ad-5cd3ebb9660b
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-d71e-af69c0873a02
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-bfe0-96aaa5efa18f
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-ff98-01ea227e75b5
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-ad89-57f152a37c1d
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-bc4a-7063dc1744c5
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-8d44-f039ea3ea018
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-ed11-40f077410f29
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-587f-7908ae3cfa6b
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-9fd2-98567a1a1eaf
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-c08a-fc591374b97a
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-e097-9fdaa1a6e789
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-feb3-2913607c6b69
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-9e0f-83853dab37f1
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-aa74-164e4939ca30
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-ff6f-02315344979c
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-06c7-2d4f537cf219
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-8e26-ac51cf229657
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-6585-3661305c2b75
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-c293-a40754c2516b
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-0342-c1d961b1b5ad
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-9e17-bf3a1d27b573
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-c3b7-6e80c4762133
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-7428-5fc44928c95c
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-8f98-d1e59cbf78f7
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-8d03-a1d465be7ca8
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-0236-18580e935f70
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-8768-730533947d37
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-ccb7-339cd0ecbc1c
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-2f86-88420464cc89
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-ef20-b7d7438eaef3
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-2925-cda1a8d7cc47
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-7533-dbb776194d13
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-6422-5db57dc6f2a5
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	00030000-55c4-8d88-c8f2-7de0c00bd8af
\.


--
-- TOC entry 3025 (class 0 OID 12464797)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12464828)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12464942)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c4-8d8a-e714-5d92191a27bb	00090000-55c4-8d8a-96ad-e1a71e4b994e	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c4-8d8a-fbab-41276edd54d1	00090000-55c4-8d8a-ecae-3244ad06e886	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c4-8d8a-0334-a403c8264719	00090000-55c4-8d8a-37cc-e86ebde27aca	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12464558)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c4-8d89-b579-b2d5e8db7d99	00040000-55c4-8d87-2535-e0e90eeee170	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-8d89-9f4d-4bc1d8b2a8ef	00040000-55c4-8d87-2535-e0e90eeee170	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c4-8d89-0820-9d5c37402a85	00040000-55c4-8d87-2535-e0e90eeee170	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-8d89-7b5c-1c6c7a7824d8	00040000-55c4-8d87-2535-e0e90eeee170	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-8d89-f962-0292105533f7	00040000-55c4-8d87-2535-e0e90eeee170	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-8d89-605f-f98c4280784d	00040000-55c4-8d87-63bc-01bef2246da4	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-8d89-1f96-b3b588da58c0	00040000-55c4-8d87-28d3-f1248bd63790	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-8d89-7b8b-aaae9fb1df3a	00040000-55c4-8d87-58f6-b6be025f7a56	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-8d8a-cce6-49cedd44f233	00040000-55c4-8d87-2535-e0e90eeee170	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12464593)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c4-8d88-870b-23f97c3b7e06	8341	Adlešiči
00050000-55c4-8d88-83bb-f74ba2a5315c	5270	Ajdovščina
00050000-55c4-8d88-952b-befe4f4ac798	6280	Ankaran/Ancarano
00050000-55c4-8d88-af23-8e3e9ab02984	9253	Apače
00050000-55c4-8d88-3f00-778a16a4d334	8253	Artiče
00050000-55c4-8d88-2b55-77ff939c1c75	4275	Begunje na Gorenjskem
00050000-55c4-8d88-bfd6-d547550ee182	1382	Begunje pri Cerknici
00050000-55c4-8d88-fef3-bd010ebcd1a1	9231	Beltinci
00050000-55c4-8d88-ff37-c15a2a0fb05f	2234	Benedikt
00050000-55c4-8d88-c989-289a903480b8	2345	Bistrica ob Dravi
00050000-55c4-8d88-4ef2-70b9ca30a6be	3256	Bistrica ob Sotli
00050000-55c4-8d88-8239-3f8e6c942a06	8259	Bizeljsko
00050000-55c4-8d88-54d7-4fea33c29187	1223	Blagovica
00050000-55c4-8d88-5ff0-a0ed1454190e	8283	Blanca
00050000-55c4-8d88-0f5f-1f7acc3b09c0	4260	Bled
00050000-55c4-8d88-3394-b842646e5c03	4273	Blejska Dobrava
00050000-55c4-8d88-a309-fc3e52ddd1f8	9265	Bodonci
00050000-55c4-8d88-0251-c3f6a41a81f3	9222	Bogojina
00050000-55c4-8d88-383f-670c5ae2b968	4263	Bohinjska Bela
00050000-55c4-8d88-d0bb-e35358630a9e	4264	Bohinjska Bistrica
00050000-55c4-8d88-b038-2b61cced9944	4265	Bohinjsko jezero
00050000-55c4-8d88-d77c-30819b3b8d4d	1353	Borovnica
00050000-55c4-8d88-48c1-84611f0a7dcd	8294	Boštanj
00050000-55c4-8d88-9948-ab4fac58164e	5230	Bovec
00050000-55c4-8d88-b80e-60f5de63bcca	5295	Branik
00050000-55c4-8d88-5a18-bac19db3c9dd	3314	Braslovče
00050000-55c4-8d88-fde9-d377377fefd3	5223	Breginj
00050000-55c4-8d88-0470-006d53b0b078	8280	Brestanica
00050000-55c4-8d88-5f63-28300de14a1d	2354	Bresternica
00050000-55c4-8d88-775a-def9a5861cfa	4243	Brezje
00050000-55c4-8d88-d21e-7a6d56ac6fcb	1351	Brezovica pri Ljubljani
00050000-55c4-8d88-d167-3a9039708e56	8250	Brežice
00050000-55c4-8d88-e79b-71dba5c3af85	4210	Brnik - Aerodrom
00050000-55c4-8d88-99ea-517f840ccece	8321	Brusnice
00050000-55c4-8d88-20de-538ed10c69d7	3255	Buče
00050000-55c4-8d88-0a5e-1f9d16787f1b	8276	Bučka 
00050000-55c4-8d88-57ac-9ecbbffbd342	9261	Cankova
00050000-55c4-8d88-c7d8-798eb95e155e	3000	Celje 
00050000-55c4-8d88-290f-1ddd9e235f30	3001	Celje - poštni predali
00050000-55c4-8d88-0b7e-9381dc2f6a3f	4207	Cerklje na Gorenjskem
00050000-55c4-8d88-c839-fa3dce036072	8263	Cerklje ob Krki
00050000-55c4-8d88-fbfa-e7703888e10c	1380	Cerknica
00050000-55c4-8d88-a0aa-025397e3b465	5282	Cerkno
00050000-55c4-8d88-8197-5659a7d229b2	2236	Cerkvenjak
00050000-55c4-8d88-c9bc-586cd002b570	2215	Ceršak
00050000-55c4-8d88-5b35-d52c5c58671b	2326	Cirkovce
00050000-55c4-8d88-ab7c-268d84668be4	2282	Cirkulane
00050000-55c4-8d88-b804-b43507b91213	5273	Col
00050000-55c4-8d88-d61a-0d777fc5447f	8251	Čatež ob Savi
00050000-55c4-8d88-9e3e-1c30c39ed77a	1413	Čemšenik
00050000-55c4-8d88-1271-4395c3d9f51b	5253	Čepovan
00050000-55c4-8d88-42ac-9fb9540ebe70	9232	Črenšovci
00050000-55c4-8d88-95c7-e627c211b696	2393	Črna na Koroškem
00050000-55c4-8d88-137a-9d4bef3a9014	6275	Črni Kal
00050000-55c4-8d88-aea1-f0f586d966c0	5274	Črni Vrh nad Idrijo
00050000-55c4-8d88-93d5-40f7da0cbe7b	5262	Črniče
00050000-55c4-8d88-6471-0075f5d65919	8340	Črnomelj
00050000-55c4-8d88-c73e-b54e8911222d	6271	Dekani
00050000-55c4-8d88-01aa-1bc5146d4828	5210	Deskle
00050000-55c4-8d88-36ab-40e5425366f8	2253	Destrnik
00050000-55c4-8d88-83f1-66ab9370e039	6215	Divača
00050000-55c4-8d88-6cda-d266101e014c	1233	Dob
00050000-55c4-8d88-8d9f-259166ee3c3f	3224	Dobje pri Planini
00050000-55c4-8d88-6cdd-87fb43e77bbe	8257	Dobova
00050000-55c4-8d88-1529-f7d79cae8cc8	1423	Dobovec
00050000-55c4-8d88-1de6-224d8572d819	5263	Dobravlje
00050000-55c4-8d88-0283-3fe2a523f775	3204	Dobrna
00050000-55c4-8d88-c4d3-d4b9c8b51733	8211	Dobrnič
00050000-55c4-8d88-5dff-af51eba3b946	1356	Dobrova
00050000-55c4-8d88-5b16-f8eb302d0f57	9223	Dobrovnik/Dobronak 
00050000-55c4-8d88-fd37-bd7ac572d92e	5212	Dobrovo v Brdih
00050000-55c4-8d88-4947-d7837bab5939	1431	Dol pri Hrastniku
00050000-55c4-8d88-9329-04f2a9d2d144	1262	Dol pri Ljubljani
00050000-55c4-8d88-a442-98066ac6dfdc	1273	Dole pri Litiji
00050000-55c4-8d88-8ab2-d7b4b05c52b3	1331	Dolenja vas
00050000-55c4-8d88-2110-8839bcdbf300	8350	Dolenjske Toplice
00050000-55c4-8d88-6e85-63fb7c816d05	1230	Domžale
00050000-55c4-8d88-e6cb-deba6b86029b	2252	Dornava
00050000-55c4-8d88-079b-1f41d1e0c015	5294	Dornberk
00050000-55c4-8d88-2f02-690337c369e9	1319	Draga
00050000-55c4-8d88-6b04-db2f27b0f74e	8343	Dragatuš
00050000-55c4-8d88-5369-ca814f37b7d0	3222	Dramlje
00050000-55c4-8d88-c8b1-3fe65c05c824	2370	Dravograd
00050000-55c4-8d88-82ea-915c588c1256	4203	Duplje
00050000-55c4-8d88-8f62-f4ec7a15f0a4	6221	Dutovlje
00050000-55c4-8d88-3e8f-ca3504696e1d	8361	Dvor
00050000-55c4-8d88-f9c3-7891492af738	2343	Fala
00050000-55c4-8d88-0210-169009fbb9ae	9208	Fokovci
00050000-55c4-8d88-2fbb-30f434f7c805	2313	Fram
00050000-55c4-8d88-7eb3-21116c7cee8a	3213	Frankolovo
00050000-55c4-8d88-13aa-27e3a29cfa4a	1274	Gabrovka
00050000-55c4-8d88-e475-6f9a2ce999d8	8254	Globoko
00050000-55c4-8d88-c58b-03639ef5062d	5275	Godovič
00050000-55c4-8d88-bdda-7ba320354fb5	4204	Golnik
00050000-55c4-8d88-0a02-5f60b991698d	3303	Gomilsko
00050000-55c4-8d88-7ce1-4ee23b50f668	4224	Gorenja vas
00050000-55c4-8d88-d31a-e3474bbfc11f	3263	Gorica pri Slivnici
00050000-55c4-8d88-e8c7-7615ee7676ff	2272	Gorišnica
00050000-55c4-8d88-5679-5fd82b5a423b	9250	Gornja Radgona
00050000-55c4-8d88-b7f6-4dd87ebfb641	3342	Gornji Grad
00050000-55c4-8d88-9191-2b4d789ded11	4282	Gozd Martuljek
00050000-55c4-8d88-e341-81f8a84a764b	6272	Gračišče
00050000-55c4-8d88-4637-52e5e677aca4	9264	Grad
00050000-55c4-8d88-7146-ddfda008fa75	8332	Gradac
00050000-55c4-8d88-0b7a-0a2cceca3f07	1384	Grahovo
00050000-55c4-8d88-ff91-48dcef7893c0	5242	Grahovo ob Bači
00050000-55c4-8d88-aa80-e5c705b678d6	5251	Grgar
00050000-55c4-8d88-6687-0d683ece1b4a	3302	Griže
00050000-55c4-8d88-1fb1-2f9e702f26e5	3231	Grobelno
00050000-55c4-8d88-b6d1-554504459d38	1290	Grosuplje
00050000-55c4-8d88-4c0b-a1a135104c3b	2288	Hajdina
00050000-55c4-8d88-55f3-cca0378e07b8	8362	Hinje
00050000-55c4-8d88-5ca9-2d771de01376	2311	Hoče
00050000-55c4-8d88-2511-424e97d804e3	9205	Hodoš/Hodos
00050000-55c4-8d88-261b-be0cfc54376c	1354	Horjul
00050000-55c4-8d88-cf53-638b55163701	1372	Hotedršica
00050000-55c4-8d88-2785-46482d731ce3	1430	Hrastnik
00050000-55c4-8d88-3646-9813164e550c	6225	Hruševje
00050000-55c4-8d88-0214-e3542adfb2c5	4276	Hrušica
00050000-55c4-8d88-db77-8169dfaf20c1	5280	Idrija
00050000-55c4-8d88-d45b-4773542718d3	1292	Ig
00050000-55c4-8d88-968c-71a5eb0cecb5	6250	Ilirska Bistrica
00050000-55c4-8d88-5541-7e8d008f9e2c	6251	Ilirska Bistrica-Trnovo
00050000-55c4-8d88-fd25-c3222dc18bec	1295	Ivančna Gorica
00050000-55c4-8d88-6cb9-d5f9283ba13c	2259	Ivanjkovci
00050000-55c4-8d88-43b9-2c78585bbb34	1411	Izlake
00050000-55c4-8d88-7098-e8b10bc9f6b2	6310	Izola/Isola
00050000-55c4-8d88-5c8a-3d58dfb43c9b	2222	Jakobski Dol
00050000-55c4-8d88-cb23-e6cc6c5b2222	2221	Jarenina
00050000-55c4-8d88-f52c-78c1b0838fc4	6254	Jelšane
00050000-55c4-8d88-a5bb-4af822aa17c1	4270	Jesenice
00050000-55c4-8d88-7fab-4bd82e9ab4ea	8261	Jesenice na Dolenjskem
00050000-55c4-8d88-dbf3-1a4c0332e886	3273	Jurklošter
00050000-55c4-8d88-1e04-bd192163f284	2223	Jurovski Dol
00050000-55c4-8d88-cb2e-c94981bd61cf	2256	Juršinci
00050000-55c4-8d88-005c-d676d5b0c6f0	5214	Kal nad Kanalom
00050000-55c4-8d88-8184-9b91be0b270d	3233	Kalobje
00050000-55c4-8d88-f7f5-42180e691f08	4246	Kamna Gorica
00050000-55c4-8d88-c4c1-68a0b4c06a32	2351	Kamnica
00050000-55c4-8d88-9a37-470ae1d0f03e	1241	Kamnik
00050000-55c4-8d88-4bbc-3675028e119f	5213	Kanal
00050000-55c4-8d88-de68-222d3dcf1086	8258	Kapele
00050000-55c4-8d88-2219-cb9962e57bd0	2362	Kapla
00050000-55c4-8d88-114e-a7c69d60cc13	2325	Kidričevo
00050000-55c4-8d88-1adb-18fc625ede2e	1412	Kisovec
00050000-55c4-8d88-6d72-7ca381b243ea	6253	Knežak
00050000-55c4-8d88-55ac-52c5bc059c15	5222	Kobarid
00050000-55c4-8d88-1298-3f42922b3946	9227	Kobilje
00050000-55c4-8d88-3b08-13a5cb4e5ddc	1330	Kočevje
00050000-55c4-8d88-dcfd-8cacd3dcabe9	1338	Kočevska Reka
00050000-55c4-8d88-e29c-9437370b89eb	2276	Kog
00050000-55c4-8d88-4e21-5991751f548c	5211	Kojsko
00050000-55c4-8d88-4f97-50ebd1d517b7	6223	Komen
00050000-55c4-8d88-1ac3-f901d21b7b59	1218	Komenda
00050000-55c4-8d88-9aa6-4f7bc15ff929	6000	Koper/Capodistria 
00050000-55c4-8d88-ff63-11823b8b00d7	6001	Koper/Capodistria - poštni predali
00050000-55c4-8d88-e3db-f272fe20d266	8282	Koprivnica
00050000-55c4-8d88-a903-f2f4e2b6cf4c	5296	Kostanjevica na Krasu
00050000-55c4-8d88-9063-d658b14d9401	8311	Kostanjevica na Krki
00050000-55c4-8d88-2794-a33890729e75	1336	Kostel
00050000-55c4-8d88-052c-ad7384ffd086	6256	Košana
00050000-55c4-8d88-a4e4-812b28b1a4ce	2394	Kotlje
00050000-55c4-8d88-e401-3ee426170558	6240	Kozina
00050000-55c4-8d88-86d5-7a94b5cf74fe	3260	Kozje
00050000-55c4-8d88-6fbd-4eedde641d96	4000	Kranj 
00050000-55c4-8d88-d032-8cda7df28b67	4001	Kranj - poštni predali
00050000-55c4-8d88-e30d-daa78d1fff25	4280	Kranjska Gora
00050000-55c4-8d88-a5e9-7f6336256499	1281	Kresnice
00050000-55c4-8d88-f409-634a56b86363	4294	Križe
00050000-55c4-8d88-6f99-538f65a76ce3	9206	Križevci
00050000-55c4-8d88-442b-9d3b6fe6cf4e	9242	Križevci pri Ljutomeru
00050000-55c4-8d88-6d94-5f2e31491f29	1301	Krka
00050000-55c4-8d88-fb5f-09a9021bb940	8296	Krmelj
00050000-55c4-8d88-cdc7-dd1a76b9a8a2	4245	Kropa
00050000-55c4-8d88-ebb9-050d2a05e7c0	8262	Krška vas
00050000-55c4-8d88-b33c-7e2100d76cad	8270	Krško
00050000-55c4-8d88-766f-032d84bd354b	9263	Kuzma
00050000-55c4-8d88-ae4d-cdbb6383e1c2	2318	Laporje
00050000-55c4-8d88-9bc3-a6e380812b20	3270	Laško
00050000-55c4-8d88-3300-6b170ff0facb	1219	Laze v Tuhinju
00050000-55c4-8d88-a581-ae107282d636	2230	Lenart v Slovenskih goricah
00050000-55c4-8d88-9b52-c49092ca98a1	9220	Lendava/Lendva
00050000-55c4-8d88-919a-92c478a0e827	4248	Lesce
00050000-55c4-8d88-ce0c-86f20a258db9	3261	Lesično
00050000-55c4-8d88-4686-72fda6f0c8fc	8273	Leskovec pri Krškem
00050000-55c4-8d88-ca1b-398d563d86a5	2372	Libeliče
00050000-55c4-8d88-ada6-4e595dd41bf2	2341	Limbuš
00050000-55c4-8d88-7d64-b11a2bc38e6f	1270	Litija
00050000-55c4-8d88-6d85-57924204944d	3202	Ljubečna
00050000-55c4-8d88-1bf4-be8f68658c92	1000	Ljubljana 
00050000-55c4-8d88-fd3a-f992f57e75cf	1001	Ljubljana - poštni predali
00050000-55c4-8d88-144a-87e3424fcf6b	1231	Ljubljana - Črnuče
00050000-55c4-8d88-281b-6be12b2fe16c	1261	Ljubljana - Dobrunje
00050000-55c4-8d88-5b20-149e750ed592	1260	Ljubljana - Polje
00050000-55c4-8d88-9ddb-6675f00bf4e6	1210	Ljubljana - Šentvid
00050000-55c4-8d88-d4c7-1d2871f712f8	1211	Ljubljana - Šmartno
00050000-55c4-8d88-7399-207bf0529bb1	3333	Ljubno ob Savinji
00050000-55c4-8d88-5fa1-88ee0e6b8736	9240	Ljutomer
00050000-55c4-8d88-14eb-46886708703b	3215	Loče
00050000-55c4-8d88-1b2e-ae0ad2f23a05	5231	Log pod Mangartom
00050000-55c4-8d88-1438-23d371484543	1358	Log pri Brezovici
00050000-55c4-8d88-a457-d519bd4681aa	1370	Logatec
00050000-55c4-8d88-3a0b-abcb7bb877df	1371	Logatec
00050000-55c4-8d88-bf87-d8977952a60d	1434	Loka pri Zidanem Mostu
00050000-55c4-8d88-0735-63c8016197d4	3223	Loka pri Žusmu
00050000-55c4-8d88-8b03-0b6d5562426b	6219	Lokev
00050000-55c4-8d88-0c7d-a37fba6c9d50	1318	Loški Potok
00050000-55c4-8d88-a004-ba11b83e6192	2324	Lovrenc na Dravskem polju
00050000-55c4-8d88-65bb-fea3288e4367	2344	Lovrenc na Pohorju
00050000-55c4-8d88-2711-d8c5c4235e78	3334	Luče
00050000-55c4-8d88-6f7e-d46ea4e0f2af	1225	Lukovica
00050000-55c4-8d88-fb2c-ce685420134f	9202	Mačkovci
00050000-55c4-8d88-6661-c578b3ccc444	2322	Majšperk
00050000-55c4-8d88-700a-d6a71f3ff7ee	2321	Makole
00050000-55c4-8d88-87d1-1392d635ec85	9243	Mala Nedelja
00050000-55c4-8d88-1241-e666832a0dcd	2229	Malečnik
00050000-55c4-8d88-d1b9-26501aa6d22f	6273	Marezige
00050000-55c4-8d88-6ffb-ed80de03158d	2000	Maribor 
00050000-55c4-8d88-a582-041b027787a9	2001	Maribor - poštni predali
00050000-55c4-8d88-a077-5d8c6720f116	2206	Marjeta na Dravskem polju
00050000-55c4-8d88-6e91-3eface3eeb99	2281	Markovci
00050000-55c4-8d88-ff39-995e1405e90c	9221	Martjanci
00050000-55c4-8d88-32e0-817d05a8e7b6	6242	Materija
00050000-55c4-8d88-de10-cb828201b45e	4211	Mavčiče
00050000-55c4-8d88-e964-b4207230984b	1215	Medvode
00050000-55c4-8d88-eac9-9d0a9f257801	1234	Mengeš
00050000-55c4-8d88-01f2-8ba3b67c44e2	8330	Metlika
00050000-55c4-8d88-fc12-3027c9309a35	2392	Mežica
00050000-55c4-8d88-2e7d-08648c3973ba	2204	Miklavž na Dravskem polju
00050000-55c4-8d88-72ac-7dd7331c914b	2275	Miklavž pri Ormožu
00050000-55c4-8d88-f8a4-ed2194a09b93	5291	Miren
00050000-55c4-8d88-e314-09d95c811455	8233	Mirna
00050000-55c4-8d88-81f3-81d3848a95ad	8216	Mirna Peč
00050000-55c4-8d88-9fd6-58304726805b	2382	Mislinja
00050000-55c4-8d88-3e6c-8be098299292	4281	Mojstrana
00050000-55c4-8d88-3582-e74501d3cda9	8230	Mokronog
00050000-55c4-8d88-0b23-72455973cc18	1251	Moravče
00050000-55c4-8d88-114e-812f6b7dbf65	9226	Moravske Toplice
00050000-55c4-8d88-2c8d-47cbecf64346	5216	Most na Soči
00050000-55c4-8d88-c881-b9b4d9107246	1221	Motnik
00050000-55c4-8d88-eb1e-397d1d0482f9	3330	Mozirje
00050000-55c4-8d88-2894-b7992787f85a	9000	Murska Sobota 
00050000-55c4-8d88-0bcf-8be2dec454d1	9001	Murska Sobota - poštni predali
00050000-55c4-8d88-5808-22062f917f54	2366	Muta
00050000-55c4-8d88-f70e-cfa0b8964752	4202	Naklo
00050000-55c4-8d88-9587-a389300b800f	3331	Nazarje
00050000-55c4-8d88-ab74-15a136447f77	1357	Notranje Gorice
00050000-55c4-8d88-598e-ab788b2d112d	3203	Nova Cerkev
00050000-55c4-8d88-d36c-0d6045fb901f	5000	Nova Gorica 
00050000-55c4-8d88-889c-7d816f5a30be	5001	Nova Gorica - poštni predali
00050000-55c4-8d88-8f6e-4d2f6fdeb559	1385	Nova vas
00050000-55c4-8d88-3cd7-b5c580d6d009	8000	Novo mesto
00050000-55c4-8d88-c757-f5daa10007c5	8001	Novo mesto - poštni predali
00050000-55c4-8d88-4a3a-a4e1a0ffb011	6243	Obrov
00050000-55c4-8d88-fb78-70388c54b1ec	9233	Odranci
00050000-55c4-8d88-3d61-da7bfcaa0fea	2317	Oplotnica
00050000-55c4-8d88-26c3-9d84f3259594	2312	Orehova vas
00050000-55c4-8d88-3a0f-69bbb016f31f	2270	Ormož
00050000-55c4-8d88-081d-8fdf87cceb51	1316	Ortnek
00050000-55c4-8d88-3276-6f148324a4c7	1337	Osilnica
00050000-55c4-8d88-4523-e01b725b0021	8222	Otočec
00050000-55c4-8d88-fb39-81ccac61ba0e	2361	Ožbalt
00050000-55c4-8d88-cc0b-c03c07bb1944	2231	Pernica
00050000-55c4-8d88-1a69-775e5beeeac9	2211	Pesnica pri Mariboru
00050000-55c4-8d88-b12d-0287a96c0ce2	9203	Petrovci
00050000-55c4-8d88-ced6-6ce2c3823162	3301	Petrovče
00050000-55c4-8d88-e293-af687632b2e7	6330	Piran/Pirano
00050000-55c4-8d88-96a6-331af6d9a597	8255	Pišece
00050000-55c4-8d88-6c2c-0d5d17ec1a36	6257	Pivka
00050000-55c4-8d88-1ca8-c03df16bca71	6232	Planina
00050000-55c4-8d88-9e86-8b2e1442e01e	3225	Planina pri Sevnici
00050000-55c4-8d88-8102-d15e25b6869e	6276	Pobegi
00050000-55c4-8d88-7f8e-5d150027659d	8312	Podbočje
00050000-55c4-8d88-df77-63ba7e9636bc	5243	Podbrdo
00050000-55c4-8d88-2352-4bd1cd161d3f	3254	Podčetrtek
00050000-55c4-8d88-e90e-924746d68dcd	2273	Podgorci
00050000-55c4-8d88-4031-3b25053b96c4	6216	Podgorje
00050000-55c4-8d88-5561-578b966de9fe	2381	Podgorje pri Slovenj Gradcu
00050000-55c4-8d88-9f82-017ba82aca46	6244	Podgrad
00050000-55c4-8d88-73cb-f4165120fad2	1414	Podkum
00050000-55c4-8d88-94cb-377dff0f474c	2286	Podlehnik
00050000-55c4-8d88-9366-cec135834619	5272	Podnanos
00050000-55c4-8d88-e613-973817ce7970	4244	Podnart
00050000-55c4-8d88-c267-217988edfd28	3241	Podplat
00050000-55c4-8d88-be6c-51bf0450a0f8	3257	Podsreda
00050000-55c4-8d88-757d-a80c2193ece7	2363	Podvelka
00050000-55c4-8d88-ce71-b19cb0ac419e	2208	Pohorje
00050000-55c4-8d88-1af5-f692b7477e2f	2257	Polenšak
00050000-55c4-8d88-5295-bb7f2af8fee1	1355	Polhov Gradec
00050000-55c4-8d88-d67d-b8e8445180f2	4223	Poljane nad Škofjo Loko
00050000-55c4-8d88-d442-5b240c236562	2319	Poljčane
00050000-55c4-8d88-2b66-73fa72fb12ce	1272	Polšnik
00050000-55c4-8d88-a06d-8cb5b3b68c80	3313	Polzela
00050000-55c4-8d88-712e-c8f10479311a	3232	Ponikva
00050000-55c4-8d88-adb6-43f5e682b7d0	6320	Portorož/Portorose
00050000-55c4-8d88-4e52-9593b6e1dd88	6230	Postojna
00050000-55c4-8d88-5bb6-1f8cf1b2949e	2331	Pragersko
00050000-55c4-8d88-4957-e0fd4868bffe	3312	Prebold
00050000-55c4-8d88-9dbf-791780628fda	4205	Preddvor
00050000-55c4-8d88-7bd8-c5a674ccc0a8	6255	Prem
00050000-55c4-8d88-b766-5c4438f472aa	1352	Preserje
00050000-55c4-8d88-362d-8bd65a75b03b	6258	Prestranek
00050000-55c4-8d88-c43c-43e140e1e07b	2391	Prevalje
00050000-55c4-8d88-b2f4-b50562247f19	3262	Prevorje
00050000-55c4-8d88-794d-d9661dfae896	1276	Primskovo 
00050000-55c4-8d88-fb60-56d6c5cb3dac	3253	Pristava pri Mestinju
00050000-55c4-8d88-f43a-d0d7f1d3e2cd	9207	Prosenjakovci/Partosfalva
00050000-55c4-8d88-4f69-01d95f06d3b1	5297	Prvačina
00050000-55c4-8d88-8606-0fd40df6c1a3	2250	Ptuj
00050000-55c4-8d88-2470-fbbc19f1e2e2	2323	Ptujska Gora
00050000-55c4-8d88-63fa-0b02fe31120f	9201	Puconci
00050000-55c4-8d88-0cbe-4137eaf4fba1	2327	Rače
00050000-55c4-8d88-725a-3b5dd7bea540	1433	Radeče
00050000-55c4-8d88-fc3e-640659263d3a	9252	Radenci
00050000-55c4-8d88-a10a-4202dab24375	2360	Radlje ob Dravi
00050000-55c4-8d88-56b1-2a6aa3a95d52	1235	Radomlje
00050000-55c4-8d88-a449-4510f8f20458	4240	Radovljica
00050000-55c4-8d88-246f-1a35fd9e1bff	8274	Raka
00050000-55c4-8d88-9608-cc7b5a977aba	1381	Rakek
00050000-55c4-8d88-e3e5-64406fef617c	4283	Rateče - Planica
00050000-55c4-8d88-7b33-8def6c3c041d	2390	Ravne na Koroškem
00050000-55c4-8d88-09d4-09626d85d5ad	9246	Razkrižje
00050000-55c4-8d88-b034-26167d039831	3332	Rečica ob Savinji
00050000-55c4-8d88-35f3-e9ce56e7ea5c	5292	Renče
00050000-55c4-8d88-131f-8266e2548c74	1310	Ribnica
00050000-55c4-8d88-9c7b-e87c6489f47d	2364	Ribnica na Pohorju
00050000-55c4-8d88-5b14-2fd695147eab	3272	Rimske Toplice
00050000-55c4-8d88-79a4-0f30722d0427	1314	Rob
00050000-55c4-8d88-18c1-03f5a52f1bf6	5215	Ročinj
00050000-55c4-8d88-fbc6-b1b81704ec93	3250	Rogaška Slatina
00050000-55c4-8d88-58e9-bb0aa97e4fd5	9262	Rogašovci
00050000-55c4-8d88-c98b-5e98d6b40ddb	3252	Rogatec
00050000-55c4-8d88-0257-ecd400377e36	1373	Rovte
00050000-55c4-8d88-6fd9-755d358e60e5	2342	Ruše
00050000-55c4-8d88-cfbe-da45c812e174	1282	Sava
00050000-55c4-8d88-063e-f215f274b121	6333	Sečovlje/Sicciole
00050000-55c4-8d88-5cff-c8b45ede6d58	4227	Selca
00050000-55c4-8d88-c525-e411a10b00c2	2352	Selnica ob Dravi
00050000-55c4-8d88-9707-1625d01ea949	8333	Semič
00050000-55c4-8d88-efa3-306792f49a9d	8281	Senovo
00050000-55c4-8d88-39ca-2fbe79a0fb76	6224	Senožeče
00050000-55c4-8d88-43dd-f1656720b0ab	8290	Sevnica
00050000-55c4-8d88-e202-7744e4014450	6210	Sežana
00050000-55c4-8d88-9548-ea7a9b7ba5a8	2214	Sladki Vrh
00050000-55c4-8d88-dfc0-1d66afe9ee1d	5283	Slap ob Idrijci
00050000-55c4-8d88-b7fc-f41de5c2c452	2380	Slovenj Gradec
00050000-55c4-8d88-0b39-8dcf642e62a4	2310	Slovenska Bistrica
00050000-55c4-8d88-6220-90aaab699498	3210	Slovenske Konjice
00050000-55c4-8d88-ee9b-d79347e98450	1216	Smlednik
00050000-55c4-8d88-cb7f-35b6fdb1be50	5232	Soča
00050000-55c4-8d88-81ee-0f9a91eb789b	1317	Sodražica
00050000-55c4-8d88-5349-efbfdc408ca8	3335	Solčava
00050000-55c4-8d88-5bb8-e86f8e17037a	5250	Solkan
00050000-55c4-8d88-30b1-f2b1c33276e6	4229	Sorica
00050000-55c4-8d88-c538-e876ee5a2ecc	4225	Sovodenj
00050000-55c4-8d88-67be-7a8c3c66e1f0	5281	Spodnja Idrija
00050000-55c4-8d88-0499-d97cc659e28c	2241	Spodnji Duplek
00050000-55c4-8d88-1857-49a490f4d3a4	9245	Spodnji Ivanjci
00050000-55c4-8d88-a9f7-ad863f69e611	2277	Središče ob Dravi
00050000-55c4-8d88-4c77-c74ae6a8f52b	4267	Srednja vas v Bohinju
00050000-55c4-8d88-4942-08982cadabf3	8256	Sromlje 
00050000-55c4-8d88-b0b4-ec545e5d1b4d	5224	Srpenica
00050000-55c4-8d88-927a-6b993ebc23b4	1242	Stahovica
00050000-55c4-8d88-0364-a049ae46720e	1332	Stara Cerkev
00050000-55c4-8d88-eed2-b0406387010e	8342	Stari trg ob Kolpi
00050000-55c4-8d88-6830-df9be48538bf	1386	Stari trg pri Ložu
00050000-55c4-8d88-fa51-fe048281f1a7	2205	Starše
00050000-55c4-8d88-1295-824d115e1a66	2289	Stoperce
00050000-55c4-8d88-dd6a-524158e7fca4	8322	Stopiče
00050000-55c4-8d88-6bad-5a12287f64ba	3206	Stranice
00050000-55c4-8d88-b2a6-24fa07a081c7	8351	Straža
00050000-55c4-8d88-08c2-7d5fa4a0f90d	1313	Struge
00050000-55c4-8d88-3122-d090262e71a0	8293	Studenec
00050000-55c4-8d88-7544-5a5ab58059ba	8331	Suhor
00050000-55c4-8d88-72e4-0aea313e9f58	2233	Sv. Ana v Slovenskih goricah
00050000-55c4-8d88-2472-39fe8412220b	2235	Sv. Trojica v Slovenskih goricah
00050000-55c4-8d88-36d4-adce580bdbdf	2353	Sveti Duh na Ostrem Vrhu
00050000-55c4-8d88-6e2c-1b892e93e156	9244	Sveti Jurij ob Ščavnici
00050000-55c4-8d88-2364-60e4d7a7a31d	3264	Sveti Štefan
00050000-55c4-8d88-bc72-1123cd2e7547	2258	Sveti Tomaž
00050000-55c4-8d88-2f92-3e63bcf80af0	9204	Šalovci
00050000-55c4-8d88-a164-13dbf5e052da	5261	Šempas
00050000-55c4-8d88-1db4-0e1e6822c9a7	5290	Šempeter pri Gorici
00050000-55c4-8d88-7c47-54258710fc60	3311	Šempeter v Savinjski dolini
00050000-55c4-8d88-f358-48ec0558543f	4208	Šenčur
00050000-55c4-8d88-289f-fd4df03809fc	2212	Šentilj v Slovenskih goricah
00050000-55c4-8d88-03b1-f59a219e8c6f	8297	Šentjanž
00050000-55c4-8d88-7337-1cbc208e321d	2373	Šentjanž pri Dravogradu
00050000-55c4-8d88-97b9-3d0f3d16b00f	8310	Šentjernej
00050000-55c4-8d88-4b55-aba7a7d8d531	3230	Šentjur
00050000-55c4-8d88-0315-fa3f807c151c	3271	Šentrupert
00050000-55c4-8d88-6c0b-b0ff4d91e595	8232	Šentrupert
00050000-55c4-8d88-b023-b004fa7b5310	1296	Šentvid pri Stični
00050000-55c4-8d88-670a-875a438c3ff5	8275	Škocjan
00050000-55c4-8d88-625f-ac94bb5d4655	6281	Škofije
00050000-55c4-8d88-8189-91788de47c15	4220	Škofja Loka
00050000-55c4-8d88-a9e3-182941b957b9	3211	Škofja vas
00050000-55c4-8d88-1e81-9148b6ed7d3d	1291	Škofljica
00050000-55c4-8d88-5278-744db49639ea	6274	Šmarje
00050000-55c4-8d88-ee6e-95e45a2c2ab2	1293	Šmarje - Sap
00050000-55c4-8d88-e753-a9662e20adb1	3240	Šmarje pri Jelšah
00050000-55c4-8d88-9e85-21811d252278	8220	Šmarješke Toplice
00050000-55c4-8d88-d071-e6ede6a2cf1c	2315	Šmartno na Pohorju
00050000-55c4-8d88-63cd-f7b74bf2b29c	3341	Šmartno ob Dreti
00050000-55c4-8d88-cae0-8bd95e38f2e3	3327	Šmartno ob Paki
00050000-55c4-8d88-bbd7-de3e7743ddde	1275	Šmartno pri Litiji
00050000-55c4-8d88-fb97-1048682ed1e3	2383	Šmartno pri Slovenj Gradcu
00050000-55c4-8d88-cfba-1d1541c120e9	3201	Šmartno v Rožni dolini
00050000-55c4-8d88-9abb-b826315f2efe	3325	Šoštanj
00050000-55c4-8d88-b199-46850d177ae0	6222	Štanjel
00050000-55c4-8d88-7682-d51625d2d2df	3220	Štore
00050000-55c4-8d88-5eb0-2290ac74aa22	3304	Tabor
00050000-55c4-8d88-4ac2-02188610574b	3221	Teharje
00050000-55c4-8d88-0b0c-53dc1a7029e4	9251	Tišina
00050000-55c4-8d88-c79d-7c06be48ce7d	5220	Tolmin
00050000-55c4-8d88-88e7-d2485f69c16c	3326	Topolšica
00050000-55c4-8d88-00ad-540760829858	2371	Trbonje
00050000-55c4-8d88-e717-cc1c681a7103	1420	Trbovlje
00050000-55c4-8d88-cd12-129422830da0	8231	Trebelno 
00050000-55c4-8d88-d963-05f15c2be523	8210	Trebnje
00050000-55c4-8d88-e62a-3cc49a109379	5252	Trnovo pri Gorici
00050000-55c4-8d88-f1bb-7c288244ca23	2254	Trnovska vas
00050000-55c4-8d88-a6de-810083d224ad	1222	Trojane
00050000-55c4-8d88-5d8c-7787139c11c5	1236	Trzin
00050000-55c4-8d88-560c-6a183e25249f	4290	Tržič
00050000-55c4-8d88-9c70-1fcf8e11a516	8295	Tržišče
00050000-55c4-8d88-fc5f-94bc381ba968	1311	Turjak
00050000-55c4-8d88-761b-d01d67160422	9224	Turnišče
00050000-55c4-8d88-9c85-9eedea9365b1	8323	Uršna sela
00050000-55c4-8d88-5e12-a3cb858e53e7	1252	Vače
00050000-55c4-8d88-a375-360ba95f6022	3320	Velenje 
00050000-55c4-8d88-3bfd-f2be342fd467	3322	Velenje - poštni predali
00050000-55c4-8d88-8c53-3d54feba145f	8212	Velika Loka
00050000-55c4-8d88-77c8-cdf2012ce048	2274	Velika Nedelja
00050000-55c4-8d88-5eb3-4b0f873a20bc	9225	Velika Polana
00050000-55c4-8d88-8ffe-31e16e3898a6	1315	Velike Lašče
00050000-55c4-8d88-8183-7d20d2b5ea7c	8213	Veliki Gaber
00050000-55c4-8d88-7504-ac23b42a4822	9241	Veržej
00050000-55c4-8d88-c6d3-e093badda73c	1312	Videm - Dobrepolje
00050000-55c4-8d88-4283-45a695400984	2284	Videm pri Ptuju
00050000-55c4-8d88-64c6-4d729607dde5	8344	Vinica
00050000-55c4-8d88-bf4c-b30fbe51c55d	5271	Vipava
00050000-55c4-8d88-7c08-9143f99ccfc9	4212	Visoko
00050000-55c4-8d88-c513-7f06a4d5631b	1294	Višnja Gora
00050000-55c4-8d88-c486-e8af7aaf017e	3205	Vitanje
00050000-55c4-8d88-84eb-2c4a8a220996	2255	Vitomarci
00050000-55c4-8d88-ffe2-375e49da43d2	1217	Vodice
00050000-55c4-8d88-eeb7-750dc2682e8a	3212	Vojnik\t
00050000-55c4-8d88-d9ae-366fb50edfe4	5293	Volčja Draga
00050000-55c4-8d88-1ec8-51a8a0e5705a	2232	Voličina
00050000-55c4-8d88-3bc5-6828ca59b639	3305	Vransko
00050000-55c4-8d88-8ea3-8e872c1d8b27	6217	Vremski Britof
00050000-55c4-8d88-a6be-3b8f73b15de6	1360	Vrhnika
00050000-55c4-8d88-a6c1-5460787b9768	2365	Vuhred
00050000-55c4-8d88-9186-0b0affc5aa25	2367	Vuzenica
00050000-55c4-8d88-c46c-ee57a30bd2e9	8292	Zabukovje 
00050000-55c4-8d88-7c44-347f4335223e	1410	Zagorje ob Savi
00050000-55c4-8d88-bdb0-9b33ca2fc0b5	1303	Zagradec
00050000-55c4-8d88-d0e5-16a26711aabd	2283	Zavrč
00050000-55c4-8d88-4eba-4e5b2f091e46	8272	Zdole 
00050000-55c4-8d88-e381-f5a1fa38883d	4201	Zgornja Besnica
00050000-55c4-8d88-2779-2cdff53b3ce8	2242	Zgornja Korena
00050000-55c4-8d88-68eb-1ac53c142eca	2201	Zgornja Kungota
00050000-55c4-8d88-5e09-bd37b1aa56c5	2316	Zgornja Ložnica
00050000-55c4-8d88-af9d-ea9c6ad11379	2314	Zgornja Polskava
00050000-55c4-8d88-2cc0-4269fb3e3073	2213	Zgornja Velka
00050000-55c4-8d88-be36-8abe1a9701f7	4247	Zgornje Gorje
00050000-55c4-8d88-f42e-2af3d0c5b4b1	4206	Zgornje Jezersko
00050000-55c4-8d88-443f-196f2703ca3e	2285	Zgornji Leskovec
00050000-55c4-8d88-a625-8b0fd963db16	1432	Zidani Most
00050000-55c4-8d88-b202-28d199296162	3214	Zreče
00050000-55c4-8d88-73d5-d28e44073d33	4209	Žabnica
00050000-55c4-8d88-0c64-2dcbc114f726	3310	Žalec
00050000-55c4-8d88-c314-ceef9f7224ba	4228	Železniki
00050000-55c4-8d88-db37-21c973d0123c	2287	Žetale
00050000-55c4-8d88-f275-39bdeff38e79	4226	Žiri
00050000-55c4-8d88-c1c5-0d06cdf48425	4274	Žirovnica
00050000-55c4-8d88-1833-89125d463972	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12464771)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 12464578)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12464656)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12464783)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12465114)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12465124)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c4-8d8a-3ccb-3fff8ed9fae3	00080000-55c4-8d8a-cce6-49cedd44f233	0900	AK
00190000-55c4-8d8a-776d-3e97f8cd79fc	00080000-55c4-8d89-0820-9d5c37402a85	0987	AK
00190000-55c4-8d8a-78cb-8783bb13c376	00080000-55c4-8d89-9f4d-4bc1d8b2a8ef	0989	AK
00190000-55c4-8d8a-4d2b-8933407fd9fa	00080000-55c4-8d89-7b5c-1c6c7a7824d8	0986	AK
00190000-55c4-8d8a-8aea-877a8a2742c7	00080000-55c4-8d89-605f-f98c4280784d	0984	AK
00190000-55c4-8d8a-d524-3d6c27f28434	00080000-55c4-8d89-1f96-b3b588da58c0	0983	AK
00190000-55c4-8d8a-a1c7-54796a9bd4bf	00080000-55c4-8d89-7b8b-aaae9fb1df3a	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12465070)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c4-8d8a-2769-8757445737fc	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2990 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 12465132)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12464812)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c4-8d89-b24b-afa4e8723300	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c4-8d89-ec03-e9ad5ead5b83	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c4-8d89-b09b-9f91d98c2879	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c4-8d89-7528-36d7c8823452	0004	Mali oder	t	24	Mali oder 
00220000-55c4-8d89-7ffc-7a9d18022e8f	0005	Komorni oder	t	15	Komorni oder
00220000-55c4-8d89-6fda-9aac75193116	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c4-8d89-c098-d698cc10427d	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12464756)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12464746)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12464931)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12464880)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12464450)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3028 (class 0 OID 12464822)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12464488)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c4-8d88-bef6-712a79ed1152	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c4-8d88-db62-a2be0f530cdb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c4-8d88-74e4-1ec09eca8d02	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c4-8d88-236f-b5b9a068a98e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c4-8d88-833c-0cd17b0c2767	planer	Planer dogodkov v koledarju	t
00020000-55c4-8d88-da9e-d5315b31622f	kadrovska	Kadrovska služba	t
00020000-55c4-8d88-a151-e4f10d8a2f02	arhivar	Ažuriranje arhivalij	t
00020000-55c4-8d88-ae65-38ed0f8d518a	igralec	Igralec	t
00020000-55c4-8d88-0645-1eb4c3d8d0b6	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c4-8d8a-4d8e-4410ed3fbc7e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12464472)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c4-8d88-b9e3-7753a1b890ee	00020000-55c4-8d88-74e4-1ec09eca8d02
00010000-55c4-8d88-97ec-9fe7e572bad9	00020000-55c4-8d88-74e4-1ec09eca8d02
00010000-55c4-8d8a-f03d-6833df1dd33c	00020000-55c4-8d8a-4d8e-4410ed3fbc7e
\.


--
-- TOC entry 3030 (class 0 OID 12464836)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12464777)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12464723)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12465173)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c4-8d88-b8d6-d09b4a47fa80	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c4-8d88-d6b7-d6b500757a1d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c4-8d88-1ffc-eda4885cc225	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c4-8d88-ac92-a0a27693646b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c4-8d88-3afb-ef08fd1d9cd6	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12465165)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c4-8d88-5901-7a0e323a52f3	00230000-55c4-8d88-ac92-a0a27693646b	popa
00240000-55c4-8d88-9ef5-6def9b80b9de	00230000-55c4-8d88-ac92-a0a27693646b	oseba
00240000-55c4-8d88-e570-734f89e8ea07	00230000-55c4-8d88-ac92-a0a27693646b	sezona
00240000-55c4-8d88-5983-f67fafe9d1d3	00230000-55c4-8d88-d6b7-d6b500757a1d	prostor
00240000-55c4-8d88-1e97-abc2b5147905	00230000-55c4-8d88-ac92-a0a27693646b	besedilo
00240000-55c4-8d88-779a-d5bd1bbb2c91	00230000-55c4-8d88-ac92-a0a27693646b	uprizoritev
00240000-55c4-8d88-41cb-8e6c8131b188	00230000-55c4-8d88-ac92-a0a27693646b	funkcija
00240000-55c4-8d88-3803-5033bd5cea1f	00230000-55c4-8d88-ac92-a0a27693646b	tipfunkcije
00240000-55c4-8d88-462f-d44956bc4311	00230000-55c4-8d88-ac92-a0a27693646b	alternacija
00240000-55c4-8d88-f4bc-0117244f1088	00230000-55c4-8d88-b8d6-d09b4a47fa80	pogodba
00240000-55c4-8d88-0f8e-eab12160fb4a	00230000-55c4-8d88-ac92-a0a27693646b	zaposlitev
00240000-55c4-8d88-cbce-313325cf7410	00230000-55c4-8d88-b8d6-d09b4a47fa80	programdela
00240000-55c4-8d88-bb3b-2f2b8427ab65	00230000-55c4-8d88-ac92-a0a27693646b	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12465160)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12464890)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c4-8d8a-63ab-7d9065c941a5	000e0000-55c4-8d8a-847a-9d8c058739d0	00080000-55c4-8d89-b579-b2d5e8db7d99	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c4-8d8a-eb3b-5061a63075e5	000e0000-55c4-8d8a-847a-9d8c058739d0	00080000-55c4-8d89-b579-b2d5e8db7d99	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c4-8d8a-fd18-417dbdcc531f	000e0000-55c4-8d8a-847a-9d8c058739d0	00080000-55c4-8d89-f962-0292105533f7	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c4-8d8a-aa22-78f2542d324d	000e0000-55c4-8d8a-847a-9d8c058739d0	00080000-55c4-8d89-f962-0292105533f7	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12464550)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12464733)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c4-8d8a-08c5-d439e9ac9f6d	00180000-55c4-8d8a-b3d3-8c1af9576700	000c0000-55c4-8d8a-3ffb-c184fe72cbd8	00090000-55c4-8d8a-9c51-cc886d3e17d6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-8d8a-6a75-5cbea1a58a2a	00180000-55c4-8d8a-b3d3-8c1af9576700	000c0000-55c4-8d8a-fc50-665b1929cc45	00090000-55c4-8d8a-5b4d-cd5c18edf848	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-8d8a-97c9-8e012d9191da	00180000-55c4-8d8a-b3d3-8c1af9576700	000c0000-55c4-8d8a-4c84-dbedb0d4bdb7	00090000-55c4-8d8a-8b2e-1f4c819a0109	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-8d8a-99f3-cdd99449797c	00180000-55c4-8d8a-b3d3-8c1af9576700	000c0000-55c4-8d8a-d0a4-36eb6809d1d0	00090000-55c4-8d8a-9b67-6fef93ad5753	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-8d8a-98b2-4a368a70c39f	00180000-55c4-8d8a-b3d3-8c1af9576700	000c0000-55c4-8d8a-18c8-272462affe54	00090000-55c4-8d8a-deff-da68eebbb760	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-8d8a-4297-1999071d0f85	00180000-55c4-8d8a-f493-52873c57082f	\N	00090000-55c4-8d8a-deff-da68eebbb760	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12464920)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c4-8d88-0d46-9f61920d79b9	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c4-8d88-e270-afc3e87aedca	Priredba	Priredba	Priredba	umetnik
000f0000-55c4-8d88-801a-713f6991bc86	Prevod	Prevod	Prevod	umetnik
000f0000-55c4-8d88-efbc-f930431b9845	Režija	Režija	Režija	umetnik
000f0000-55c4-8d88-1b66-cca5f3e15e4e	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c4-8d88-7dab-54e993e8329b	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c4-8d88-a825-2c7a2db4a1fc	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c4-8d88-aa64-6dc88ff673b6	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c4-8d88-dd02-bed4ff81b75d	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c4-8d88-f2e0-b12841bf959e	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c4-8d88-9d56-003dfeeb3f49	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c4-8d88-67c4-e0fb1541df77	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c4-8d88-39d3-ccff2083acd6	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c4-8d88-cf1a-afc5e4a4b0a2	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c4-8d88-1384-868010d6865d	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c4-8d88-bbf0-ab7b9eb800f3	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c4-8d88-e7ac-a77b2fae6336	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c4-8d88-6718-39b066ddea45	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12465142)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c4-8d88-99f5-f0bef3ddc969	01	Velika predstava	f	1.00	1.00
002b0000-55c4-8d88-3ce2-e5f963a957f6	02	Mala predstava	f	0.50	0.50
002b0000-55c4-8d88-75d8-235003be6db3	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c4-8d88-6561-781e652132f0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c4-8d88-c5d9-fbcac9e1bce8	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12464613)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12464459)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c4-8d88-97ec-9fe7e572bad9	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROpBSUPZZoOjtprW34PmVPeXepAtt5aca	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-c66d-96fe403d6dcf	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-7fdd-e8e1d4d4da1d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-44f3-b0ffddd55f79	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-f287-0543f63fc112	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-d6d4-646ce10b3693	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-867a-d33d772fae13	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-86cb-bb7c360cf564	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-bb8e-1d0658dac724	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-57b0-20bd23c7417c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c4-8d8a-f03d-6833df1dd33c	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c4-8d88-b9e3-7753a1b890ee	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12464968)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c4-8d8a-c7e5-6bd3049b7cf8	00160000-55c4-8d89-8152-c6ee9352a25d	00150000-55c4-8d88-3e24-4a412a40787a	00140000-55c4-8d87-27dc-7b5f4ca5dec8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c4-8d89-7ffc-7a9d18022e8f
000e0000-55c4-8d8a-847a-9d8c058739d0	00160000-55c4-8d89-a91f-f2aa72b85021	00150000-55c4-8d88-e6d7-458f86b8c249	00140000-55c4-8d87-f5b5-3a4b8e768a98	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c4-8d89-6fda-9aac75193116
000e0000-55c4-8d8a-e975-1634b5ad5df1	\N	00150000-55c4-8d88-e6d7-458f86b8c249	00140000-55c4-8d87-f5b5-3a4b8e768a98	00190000-55c4-8d8a-776d-3e97f8cd79fc	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c4-8d89-7ffc-7a9d18022e8f
000e0000-55c4-8d8a-28d0-c1b75b013fd8	\N	00150000-55c4-8d88-e6d7-458f86b8c249	00140000-55c4-8d87-f5b5-3a4b8e768a98	00190000-55c4-8d8a-776d-3e97f8cd79fc	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c4-8d89-7ffc-7a9d18022e8f
000e0000-55c4-8d8a-f98c-e8f7ce994fc5	\N	00150000-55c4-8d88-e6d7-458f86b8c249	00140000-55c4-8d87-f5b5-3a4b8e768a98	00190000-55c4-8d8a-776d-3e97f8cd79fc	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c4-8d89-b24b-afa4e8723300
\.


--
-- TOC entry 3011 (class 0 OID 12464675)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c4-8d8a-de7c-8d031b8ef326	000e0000-55c4-8d8a-847a-9d8c058739d0	1	
00200000-55c4-8d8a-392b-1c71b8e482a1	000e0000-55c4-8d8a-847a-9d8c058739d0	2	
\.


--
-- TOC entry 3026 (class 0 OID 12464804)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12465212)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12465184)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12465224)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12464873)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c4-8d8a-0e14-aa8932a06009	00090000-55c4-8d8a-5b4d-cd5c18edf848	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-8d8a-ef71-bd3df00c9d91	00090000-55c4-8d8a-8b2e-1f4c819a0109	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-8d8a-7c48-33891c3ee0ff	00090000-55c4-8d8a-bf4e-9f0632b8afd6	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-8d8a-4598-dac758addeee	00090000-55c4-8d8a-8e57-e4f92e552281	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-8d8a-45ca-a0fb8bd110c2	00090000-55c4-8d8a-9c51-cc886d3e17d6	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-8d8a-d787-c9c2fda5e960	00090000-55c4-8d8a-09ea-9b08931a8e15	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12464707)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12464958)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c4-8d87-27dc-7b5f4ca5dec8	01	Drama	drama (SURS 01)
00140000-55c4-8d87-633d-ab1d8a16bab9	02	Opera	opera (SURS 02)
00140000-55c4-8d87-bd6e-bf03b8ee763e	03	Balet	balet (SURS 03)
00140000-55c4-8d87-4ad8-100d7eba9865	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c4-8d87-2ab5-332dca4404f0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c4-8d87-f5b5-3a4b8e768a98	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c4-8d87-5c4a-c44fe406f242	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12464863)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c4-8d88-fcc1-2b4f06178982	01	Opera	opera
00150000-55c4-8d88-3224-a816b6dc7e9b	02	Opereta	opereta
00150000-55c4-8d88-8303-3f787f05adc1	03	Balet	balet
00150000-55c4-8d88-fd93-d9adc938f1e6	04	Plesne prireditve	plesne prireditve
00150000-55c4-8d88-2f92-65d1579afe25	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c4-8d88-25cb-7ace7e023fab	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c4-8d88-cf18-a3249e022c6e	07	Biografska drama	biografska drama
00150000-55c4-8d88-3e24-4a412a40787a	08	Komedija	komedija
00150000-55c4-8d88-cadb-b2590bc5f782	09	Črna komedija	črna komedija
00150000-55c4-8d88-0614-9adeead3f2b4	10	E-igra	E-igra
00150000-55c4-8d88-e6d7-458f86b8c249	11	Kriminalka	kriminalka
00150000-55c4-8d88-299e-387de1ab1cb4	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12464513)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12465015)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12465005)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12464919)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12465265)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12464697)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12464722)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12465158)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12464639)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12465064)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12464859)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12464673)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12464716)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12464653)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 12464769)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12465241)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12465248)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12465273)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12464796)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12464611)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12464522)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2544 (class 2606 OID 12464546)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12464502)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12464487)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12464802)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12464835)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12464953)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12464575)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12464599)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12464775)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 12464589)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12464660)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12464787)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12465121)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12465129)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12465112)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 12465140)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12464819)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12464760)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12464751)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12464941)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12464887)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12464458)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12464826)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12464476)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12464496)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12464844)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12464782)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12464731)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12465182)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12465170)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12465164)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12464900)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12464555)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12464742)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12464930)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12465152)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12464624)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12464471)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12464984)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12464682)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12464810)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12465222)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12465206)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12465230)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12464878)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12464711)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12464966)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12464871)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12464704)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12464901)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12464902)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12465243)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12465242)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12464577)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2498 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2499 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2500 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2643 (class 1259 OID 12464803)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12465210)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12465209)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12465211)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12465208)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12465207)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12464789)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12464788)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12464683)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12464860)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12464862)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12464861)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12464655)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12464654)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12465141)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12464955)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12464956)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12464957)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12465231)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2512 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2513 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 12464989)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12464986)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12464990)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12464988)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12464987)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12464626)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12464625)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2542 (class 1259 OID 12464549)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12464827)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12464717)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12464503)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12464504)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12464847)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12464846)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12464845)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12464661)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12464663)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12464662)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12465172)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12464755)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12464753)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12464752)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12464754)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12464477)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12464478)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12464811)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12465266)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12465274)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12465275)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12464776)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12464888)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12464889)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12465069)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12465068)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12465065)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12465066)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12465067)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12464591)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12464590)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12464592)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12465122)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12465123)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12465019)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12465020)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12465017)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12465018)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12464879)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12464764)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12464763)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12464761)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12464762)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12465007)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12465006)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12465113)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12464674)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12465159)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12465249)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12465250)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12464524)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12464523)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12464556)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12464557)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12464745)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12464744)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12464743)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2508 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2509 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2594 (class 1259 OID 12464706)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12464702)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12464699)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12464700)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12464698)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12464703)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12464701)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12464576)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12464640)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12464642)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12464641)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12464643)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12464770)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12464954)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12464985)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12464547)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12464548)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12464872)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12465183)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12464612)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12465171)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12464821)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12464820)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12465016)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12464600)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12464967)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12465223)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12465130)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12465131)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12464732)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12464497)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12464705)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 12465411)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 12465396)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 12465401)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 12465421)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 12465391)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 12465416)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12465406)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 12465566)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 12465571)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 12465741)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 12465736)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12465326)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12465506)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 12465721)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12465716)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 12465726)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 12465711)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 12465706)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 12465501)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 12465496)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12465386)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12465536)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12465546)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12465541)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 12465361)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 12465356)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12465486)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12465691)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 12465576)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12465581)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 12465586)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12465731)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 12465606)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 12465591)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 12465611)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12465601)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 12465596)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 12465351)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 12465346)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 12465311)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 12465306)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12465516)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12465426)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 12465286)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 12465291)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 12465531)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12465526)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 12465521)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 12465366)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 12465376)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12465371)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12465701)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 12465461)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 12465451)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 12465446)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 12465456)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 12465276)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 12465281)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12465511)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12465756)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 12465761)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 12465766)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12465491)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 12465556)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 12465561)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 12465666)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 12465661)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 12465646)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 12465651)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12465656)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12465336)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 12465331)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 12465341)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 12465676)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 12465681)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 12465636)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 12465641)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 12465626)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 12465631)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12465551)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 12465481)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 12465476)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 12465466)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 12465471)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 12465621)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 12465616)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12465671)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12465381)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12465686)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12465696)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 12465746)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 12465751)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 12465301)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 12465296)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 12465316)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 12465321)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 12465441)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12465436)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 12465431)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-07 12:50:51 CEST

--
-- PostgreSQL database dump complete
--

