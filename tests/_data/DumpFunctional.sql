--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-07 10:14:11 CEST

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
-- TOC entry 183 (class 1259 OID 12381834)
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
-- TOC entry 228 (class 1259 OID 12382337)
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
-- TOC entry 227 (class 1259 OID 12382320)
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
-- TOC entry 221 (class 1259 OID 12382232)
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
-- TOC entry 244 (class 1259 OID 12382580)
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
-- TOC entry 197 (class 1259 OID 12382013)
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
-- TOC entry 200 (class 1259 OID 12382047)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12382482)
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
-- TOC entry 192 (class 1259 OID 12381956)
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
-- TOC entry 229 (class 1259 OID 12382350)
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
-- TOC entry 216 (class 1259 OID 12382177)
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
-- TOC entry 195 (class 1259 OID 12381993)
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
-- TOC entry 199 (class 1259 OID 12382041)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12381973)
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
-- TOC entry 205 (class 1259 OID 12382094)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12382561)
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
-- TOC entry 243 (class 1259 OID 12382573)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12382596)
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
-- TOC entry 209 (class 1259 OID 12382119)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12381930)
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
-- TOC entry 184 (class 1259 OID 12381843)
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
-- TOC entry 185 (class 1259 OID 12381854)
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
-- TOC entry 180 (class 1259 OID 12381808)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12381827)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12382126)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12382157)
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
-- TOC entry 224 (class 1259 OID 12382271)
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
-- TOC entry 187 (class 1259 OID 12381887)
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
-- TOC entry 189 (class 1259 OID 12381922)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12382100)
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
-- TOC entry 188 (class 1259 OID 12381907)
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
-- TOC entry 194 (class 1259 OID 12381985)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12382112)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12382443)
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
-- TOC entry 232 (class 1259 OID 12382453)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12382399)
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
-- TOC entry 233 (class 1259 OID 12382461)
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
-- TOC entry 212 (class 1259 OID 12382141)
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
-- TOC entry 204 (class 1259 OID 12382085)
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
-- TOC entry 203 (class 1259 OID 12382075)
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
-- TOC entry 223 (class 1259 OID 12382260)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12382209)
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
-- TOC entry 177 (class 1259 OID 12381779)
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
-- TOC entry 176 (class 1259 OID 12381777)
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
-- TOC entry 213 (class 1259 OID 12382151)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12381817)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12381801)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12382165)
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
-- TOC entry 207 (class 1259 OID 12382106)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12382052)
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
-- TOC entry 238 (class 1259 OID 12382502)
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
-- TOC entry 237 (class 1259 OID 12382494)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12382489)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12382219)
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
-- TOC entry 186 (class 1259 OID 12381879)
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
-- TOC entry 202 (class 1259 OID 12382062)
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
-- TOC entry 222 (class 1259 OID 12382249)
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
-- TOC entry 234 (class 1259 OID 12382471)
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
-- TOC entry 191 (class 1259 OID 12381942)
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
-- TOC entry 178 (class 1259 OID 12381788)
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
-- TOC entry 226 (class 1259 OID 12382297)
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
-- TOC entry 196 (class 1259 OID 12382004)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12382133)
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
-- TOC entry 240 (class 1259 OID 12382541)
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
-- TOC entry 239 (class 1259 OID 12382513)
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
-- TOC entry 241 (class 1259 OID 12382553)
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
-- TOC entry 218 (class 1259 OID 12382202)
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
-- TOC entry 198 (class 1259 OID 12382036)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12382287)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12382192)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12381782)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12381834)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12382337)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c4-68d2-7f1a-f36b8beeedac	000d0000-55c4-68d2-079a-de97a4c6fad7	\N	00090000-55c4-68d2-a411-564a5973069b	000b0000-55c4-68d2-6ff1-c928d4a65f83	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c4-68d2-5e0e-a031a85f157b	000d0000-55c4-68d2-148e-72f779b35023	00100000-55c4-68d2-722a-2d4d73584ace	00090000-55c4-68d2-7de0-9b3bc0208422	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c4-68d2-87be-50e060f79d4d	000d0000-55c4-68d2-2907-dd8d9d0a1042	00100000-55c4-68d2-097e-be4c8e90a71b	00090000-55c4-68d2-41d6-dfb9cf9b45c8	\N	0003	t	\N	2015-08-07	\N	2	\N	\N	f	f
000c0000-55c4-68d2-ec54-54cfbf8a482a	000d0000-55c4-68d2-73cc-82dc2c6ee99e	\N	00090000-55c4-68d2-b023-4b93d4933c52	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c4-68d2-8cbd-1c648a8c17b8	000d0000-55c4-68d2-063c-ff7f318fe23e	\N	00090000-55c4-68d2-3fc9-9e4a93e386c0	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c4-68d2-6faf-f1a361633346	000d0000-55c4-68d2-9632-d8485661ac93	\N	00090000-55c4-68d2-a31d-3f02875fda72	000b0000-55c4-68d2-c82d-6514e80cd089	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c4-68d2-6bea-e1b681ecacb8	000d0000-55c4-68d2-2249-62b86b43ad9d	00100000-55c4-68d2-96bb-bcc1cdfb4698	00090000-55c4-68d2-d803-3745e07165e0	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c4-68d2-8e88-cf0e78697a7f	000d0000-55c4-68d2-53ae-44937034aaf9	\N	00090000-55c4-68d2-9340-5791e3d8c420	000b0000-55c4-68d2-7bd8-a5ef8cd2dd09	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c4-68d2-347d-bed985cfa924	000d0000-55c4-68d2-2249-62b86b43ad9d	00100000-55c4-68d2-797c-2a681486b9fd	00090000-55c4-68d2-b88a-634589a564cf	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c4-68d2-f438-fb0c69f4602a	000d0000-55c4-68d2-2249-62b86b43ad9d	00100000-55c4-68d2-a03c-31dd845be7e1	00090000-55c4-68d2-68c7-1f742f0668c6	\N	0010	t	\N	2015-08-07	\N	16	\N	\N	f	t
000c0000-55c4-68d2-12c5-be44f2d60913	000d0000-55c4-68d2-2249-62b86b43ad9d	00100000-55c4-68d2-d514-2335ccc47b54	00090000-55c4-68d2-5f6d-118fdb9fa065	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12382320)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12382232)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c4-68d2-d264-055ec814cf5a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c4-68d2-7ddc-1fc4fabcd647	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c4-68d2-db63-cd3f8d95f71b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12382580)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12382013)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c4-68d2-3670-0c3a87bf4a9b	\N	\N	00200000-55c4-68d2-5432-93811225491d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c4-68d2-1061-27f09cfa5b17	\N	\N	00200000-55c4-68d2-f71a-5ff9ead63477	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c4-68d2-a08b-bbd479975bd1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c4-68d2-a544-4151f4009d8f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c4-68d2-c34a-8033f94f2216	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12382047)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12382482)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12381956)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c4-68d0-473d-6811710b248e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c4-68d0-7d0f-c4781beb8c17	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c4-68d0-15a5-a7e8b9e0a22f	AL	ALB	008	Albania 	Albanija	\N
00040000-55c4-68d0-3b81-2b194c4270fd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c4-68d0-5553-19a3bddd3c3f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c4-68d0-116e-18cd755e5911	AD	AND	020	Andorra 	Andora	\N
00040000-55c4-68d0-bbbe-3aadb63aa5dd	AO	AGO	024	Angola 	Angola	\N
00040000-55c4-68d0-b6a3-3ce3a2716a9a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c4-68d0-4564-2b43ac6ff03c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c4-68d0-5a03-8ee8d6b90d54	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c4-68d0-d65c-7691c9d9b5f7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c4-68d0-b8ae-80d52d2c4863	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c4-68d0-19f4-5cbff642ef2e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c4-68d0-a6f5-60398a8abb4c	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c4-68d0-22af-9717888367bc	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c4-68d0-4a22-c1e392b5fd1b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c4-68d0-e30e-15dd63966e08	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c4-68d0-5d76-0cf1003cbba9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c4-68d0-fafe-384495a4c426	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c4-68d0-2f29-667b047fdf42	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c4-68d0-924a-2404510b2698	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c4-68d0-936f-d0294c71ee6a	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c4-68d0-5382-577c17cb5f92	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c4-68d0-de66-02ec4c22aeb9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c4-68d0-6dcb-a70ddb2497c8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c4-68d0-60b6-a9a1f2b4b8e5	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c4-68d0-e549-978d52b39702	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c4-68d0-4634-0390d1f94a55	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c4-68d0-57da-862dcb7fcf21	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c4-68d0-63c5-d0de7331dd34	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c4-68d0-24a2-71fb28cb74de	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c4-68d0-4f87-b4c010c87a4d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c4-68d0-1ef1-b2e9584573f2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c4-68d0-6504-3113aaad576a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c4-68d0-3eac-580316de6f0b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c4-68d0-fdc0-eaeeb04dcfe4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c4-68d0-3f16-6f4ecebabc2c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c4-68d0-7c2e-d21b308dd397	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c4-68d0-93a7-5b1dd3124ec1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c4-68d0-2343-1b238686a553	CA	CAN	124	Canada 	Kanada	\N
00040000-55c4-68d0-274c-49d80a47ab26	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c4-68d0-5cb9-800209730a58	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c4-68d0-9a04-73c2bbf64a32	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c4-68d0-2d23-d6f58a3ca187	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c4-68d0-fb79-382a55bf377b	CL	CHL	152	Chile 	Čile	\N
00040000-55c4-68d0-cf81-0834a489083c	CN	CHN	156	China 	Kitajska	\N
00040000-55c4-68d0-62f4-df52a4bd8409	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c4-68d0-38fb-9b12eae3bf5b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c4-68d0-a960-e4821c146005	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c4-68d0-36b2-905d24ce507d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c4-68d0-0323-93ff3b9c2bb1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c4-68d0-6c3c-82f0c02dd018	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c4-68d0-3c31-812f3a714c15	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c4-68d0-9549-c0f4ec41ed80	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c4-68d0-15d9-94249e779b17	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c4-68d0-c719-5f61505724a4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c4-68d0-fc77-5d06affbce72	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c4-68d0-0fcc-8a708dabf428	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c4-68d0-73f3-54c28944fa3d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c4-68d0-65eb-a3198e2705b8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c4-68d0-39a3-065d2b6a7f5b	DK	DNK	208	Denmark 	Danska	\N
00040000-55c4-68d0-e812-df2b72b84846	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c4-68d0-0223-4516891ec018	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c4-68d0-a588-212ce6c2e9cc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c4-68d0-7958-4c7cef611b1f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c4-68d0-60a9-3d636a59a18f	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c4-68d0-2034-8a15e2738c28	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c4-68d0-92a6-74c76ebd49a7	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c4-68d0-d825-96f5ba1f06c5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c4-68d0-70c4-315a06de70b5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c4-68d0-5040-ee36471a3710	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c4-68d0-fcde-fddead4caf1c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c4-68d0-21cb-20491f1ad957	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c4-68d0-54d7-5021989ef035	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c4-68d0-7b09-d37bdcce4e38	FI	FIN	246	Finland 	Finska	\N
00040000-55c4-68d0-5d9d-b743942f5bcc	FR	FRA	250	France 	Francija	\N
00040000-55c4-68d0-ce3c-057a2bba2e22	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c4-68d0-96b8-9a92b1fc3827	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c4-68d0-1008-04d3ee0f3a5e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c4-68d0-825e-bbfe07379a0d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c4-68d0-c5f0-f436650a0119	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c4-68d0-8085-a4a7c0e14052	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c4-68d0-feae-3374333ad9d2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c4-68d0-5830-e45417c764a1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c4-68d0-372a-85c2896d241d	GH	GHA	288	Ghana 	Gana	\N
00040000-55c4-68d0-33ad-17f1f9ab9370	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c4-68d0-b40e-6efebd131147	GR	GRC	300	Greece 	Grčija	\N
00040000-55c4-68d0-b797-da23fb45d9a5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c4-68d0-5868-153c5ab4cd65	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c4-68d0-1294-c315e13c60b9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c4-68d0-6e21-2e8559f346ca	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c4-68d0-0c4c-891eb17a4bac	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c4-68d0-d66e-30fe2c9104e9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c4-68d0-181c-6ab5b22bc4d6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c4-68d0-ffd8-afd4a96706e2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c4-68d0-181e-80ac267bfd13	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c4-68d0-b011-d76e89f0e80d	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c4-68d0-584f-8c6c774a0860	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c4-68d0-88cf-0501c55a7743	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c4-68d0-3415-2b823edf7e11	HN	HND	340	Honduras 	Honduras	\N
00040000-55c4-68d0-89e9-00a9ac2cf931	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c4-68d0-d0ea-33d3c9ee4697	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c4-68d0-9622-a339feb20f09	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c4-68d0-3e93-9b9edf029c13	IN	IND	356	India 	Indija	\N
00040000-55c4-68d0-f6c9-d465357967fb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c4-68d0-57fc-eba9ce27cc63	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c4-68d0-3e32-eae64ad91e59	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c4-68d0-a2d0-12a110833f78	IE	IRL	372	Ireland 	Irska	\N
00040000-55c4-68d0-19dd-0000effb811b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c4-68d0-74c4-60966a1c973e	IL	ISR	376	Israel 	Izrael	\N
00040000-55c4-68d0-eff3-97ae459ed5b7	IT	ITA	380	Italy 	Italija	\N
00040000-55c4-68d0-52b9-01a381086496	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c4-68d0-861e-57023659b76b	JP	JPN	392	Japan 	Japonska	\N
00040000-55c4-68d0-5ff3-ecc2a8694c9f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c4-68d0-3a4e-8059feb09fa5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c4-68d0-d7d1-129674b3b58a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c4-68d0-c384-954d528893dd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c4-68d0-880e-65a601e36c28	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c4-68d0-4689-d1a467530d7f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c4-68d0-30f2-2220d563aa2f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c4-68d0-c8cf-222f6f3e247c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c4-68d0-9ad5-fa9b18f715a2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c4-68d0-2bc6-35c56130f9f9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c4-68d0-61f8-cf2c396387ba	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c4-68d0-a246-b059c9e15dcd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c4-68d0-3480-0c2c28710b0f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c4-68d0-0f4b-d6b9bdb91462	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c4-68d0-9235-d0e6eca201db	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c4-68d0-3026-04a11739185b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c4-68d0-8fb1-86061897c411	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c4-68d0-ef6e-6744e57c87f6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c4-68d0-f0a8-0954f595c9bf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c4-68d0-655c-10f276ab6d7e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c4-68d0-be56-e167187595d4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c4-68d0-81fe-cb2f2e84f321	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c4-68d0-3652-267470ba9b16	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c4-68d0-bb2e-0029f5ffbbb2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c4-68d0-1207-2f76fa753812	ML	MLI	466	Mali 	Mali	\N
00040000-55c4-68d0-1620-1ec214ebde80	MT	MLT	470	Malta 	Malta	\N
00040000-55c4-68d0-9854-be45e150330c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c4-68d0-a0dd-0dd2f1ff6312	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c4-68d0-5f5f-6118b2085185	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c4-68d0-15cd-af7d96d882fd	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c4-68d0-c14f-e86a61f2983a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c4-68d0-3500-fd9f757309ed	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c4-68d0-788a-e48f9fef7192	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c4-68d0-ba28-a20851d7f3d7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c4-68d0-7442-2167d51e95f4	MC	MCO	492	Monaco 	Monako	\N
00040000-55c4-68d0-8a4c-ab2da0b358cc	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c4-68d0-a069-a33a48679f32	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c4-68d0-06b4-bcd426634d49	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c4-68d0-d8b4-8fa9cea3424a	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c4-68d0-83d3-1f3fb36d8a93	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c4-68d0-d7ab-2874d78b387a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c4-68d0-7db7-04b5b2f09894	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c4-68d0-208c-e8bbc640cb08	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c4-68d0-90d9-3f206197daf7	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c4-68d0-ec22-2ce9d87637fc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c4-68d0-7cf7-bc3a666b86db	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c4-68d0-b0d4-75f803bfa135	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c4-68d0-96a6-be8fab76bb08	NE	NER	562	Niger 	Niger 	\N
00040000-55c4-68d0-114e-245e31f7ae5f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c4-68d0-7f26-fc7e99060978	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c4-68d0-9407-e5eb4016cb4e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c4-68d0-0748-f68265c24ec7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c4-68d0-fed0-cc455a792570	NO	NOR	578	Norway 	Norveška	\N
00040000-55c4-68d0-b283-54323b493ec2	OM	OMN	512	Oman 	Oman	\N
00040000-55c4-68d0-5dcb-41c9a00f8a82	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c4-68d0-abb0-6a0a1461489a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c4-68d0-e359-c646afc0920a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c4-68d0-5b85-b3a94389d16d	PA	PAN	591	Panama 	Panama	\N
00040000-55c4-68d0-7ec2-27fef4338d1c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c4-68d0-0e3c-bd051360b8bb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c4-68d0-53a6-4c49cffe2a47	PE	PER	604	Peru 	Peru	\N
00040000-55c4-68d0-df07-50a524b7a7ab	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c4-68d0-3d74-25fa1c52d312	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c4-68d0-a7c2-a4b99dd4f722	PL	POL	616	Poland 	Poljska	\N
00040000-55c4-68d0-951b-5b01c19bd3ce	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c4-68d0-9414-4bd6734235ca	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c4-68d0-c848-9b68f647ba88	QA	QAT	634	Qatar 	Katar	\N
00040000-55c4-68d0-180c-6b2bb54ec2ee	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c4-68d0-78c1-83ddf0cfc5b9	RO	ROU	642	Romania 	Romunija	\N
00040000-55c4-68d0-250c-51322c625c9c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c4-68d0-fe8f-caafd7eef62b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c4-68d0-e66e-371b235a770c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c4-68d0-cedc-10853a97327f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c4-68d0-eafd-536cfc32283b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c4-68d0-16de-057ca0a2864a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c4-68d0-956b-a05d5675bd7f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c4-68d0-4f97-b5edf99a0c80	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c4-68d0-a38d-a520d9eae1b1	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c4-68d0-4bde-f3edc5981723	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c4-68d0-e847-15eeb5aa1d9b	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c4-68d0-3cb2-64da0cd74158	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c4-68d0-df2d-798848bb6346	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c4-68d0-0d6d-dece8530de32	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c4-68d0-3530-f0ac6b1d997a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c4-68d0-6799-d3cdebc868e7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c4-68d0-961c-e783c58bf226	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c4-68d0-6fb0-09d08cfbcb7b	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c4-68d0-a500-b8a0703879f3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c4-68d0-4f91-4ad661eb59a0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c4-68d0-9aed-8d94ce627a31	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c4-68d0-413c-192dc1364c5a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c4-68d0-dce6-18c8ce084bec	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c4-68d0-400a-b99d0c8aeca4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c4-68d0-2d7f-ef43c6c18998	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c4-68d0-0d0c-fd57699b4f6f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c4-68d0-1969-4c34fb9b6ced	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c4-68d0-4164-835466482e9c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c4-68d0-f28a-fd2dcdc9d916	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c4-68d0-d1f0-d7bcaaf47eea	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c4-68d0-eb42-5c6a379e1dc9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c4-68d0-5e8c-3d0d76c566ee	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c4-68d0-7bd4-f26697622e53	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c4-68d0-172e-8838fee5f8ed	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c4-68d0-496b-f27bdbf06669	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c4-68d0-266f-496a4b4befcc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c4-68d0-8558-ff53687e1599	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c4-68d0-2efa-417c4fb26b6d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c4-68d0-42d4-18e80a238bae	TH	THA	764	Thailand 	Tajska	\N
00040000-55c4-68d0-a9b1-0c8573121a1e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c4-68d0-9203-4ca352b66451	TG	TGO	768	Togo 	Togo	\N
00040000-55c4-68d0-5d8a-130f6b51cf41	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c4-68d0-8320-c820a589a532	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c4-68d0-125c-15e79effcc4f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c4-68d0-e378-c00d4f938110	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c4-68d0-cba6-0f22c0a39a7a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c4-68d0-2177-dd370dff62cc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c4-68d0-b2c6-d2cea8e3b9c7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c4-68d0-5d45-15b57d85a90f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c4-68d0-da25-1ec4d19444ee	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c4-68d0-8bd6-a42bc5c197d3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c4-68d0-3127-79d4308ba59f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c4-68d0-05ff-be3ba45944b2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c4-68d0-06e4-d1f83f0423bc	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c4-68d0-c4a7-77aac67dd17f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c4-68d0-bc51-df0ccf49f959	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c4-68d0-3a3a-61bbbdf94a1e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c4-68d0-33d3-81c5078e716c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c4-68d0-228b-62ff9367d80c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c4-68d0-a589-2b0dc72da988	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c4-68d0-8547-982dd5cd523e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c4-68d0-4bc0-46f5f24bb9b3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c4-68d0-7758-1c790eb4f7cb	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c4-68d0-05ce-28535ea587a9	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c4-68d0-cbdf-451a97f858aa	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c4-68d0-d087-43f5c5a28939	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c4-68d0-0c0c-b220a42b34d3	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12382350)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55c4-68d2-b6a7-3257b884b95b	000e0000-55c4-68d2-0231-841d8f78384b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c4-68d1-473f-d6f042a3e47f	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c4-68d2-2ee3-caf7fa0f890a	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c4-68d1-05f8-b1d78b1f1b13	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c4-68d2-ebb8-c8ea398bd088	000e0000-55c4-68d2-8ede-a2abf2d09f93	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c4-68d1-473f-d6f042a3e47f	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c4-68d2-72e7-e019e7c12fed	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c4-68d2-2871-f0b1e190c702	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12382177)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c4-68d2-2249-62b86b43ad9d	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c4-68d1-c689-1ef49871bfb6
000d0000-55c4-68d2-079a-de97a4c6fad7	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c4-68d1-c689-1ef49871bfb6
000d0000-55c4-68d2-148e-72f779b35023	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c4-68d1-b063-392a039c605e
000d0000-55c4-68d2-2907-dd8d9d0a1042	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c4-68d1-d954-43b5a68d4dfb
000d0000-55c4-68d2-73cc-82dc2c6ee99e	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c4-68d1-97e2-fd9c8156857d
000d0000-55c4-68d2-063c-ff7f318fe23e	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c4-68d1-7dbe-318dc327ff9e
000d0000-55c4-68d2-9632-d8485661ac93	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c4-68d1-c689-1ef49871bfb6
000d0000-55c4-68d2-53ae-44937034aaf9	000e0000-55c4-68d2-8d19-cfc4479237f6	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c4-68d1-3b57-7dfc456e300c
\.


--
-- TOC entry 3010 (class 0 OID 12381993)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12382041)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12381973)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c4-68d2-5887-7497ff240654	00080000-55c4-68d2-5f82-532cd302b7eb	00090000-55c4-68d2-68c7-1f742f0668c6	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12382094)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12382561)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12382573)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12382596)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12382119)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12381930)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c4-68d1-7ec6-3e659269858a	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c4-68d1-88ae-aa4609fd8146	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c4-68d1-e83b-a0b9812fe1fc	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c4-68d1-99f1-b7921ec1a60c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c4-68d1-b12b-7e6c255e46a0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c4-68d1-b4e2-87858a5948c8	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c4-68d1-9c29-b70f588b407d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c4-68d1-fc2d-238ba754d7ec	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c4-68d1-b5f1-bef8e490f4cc	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c4-68d1-0ddb-69f4fc139cc0	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c4-68d1-bee7-bf235b777a18	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c4-68d1-bd48-d936dc0c2b29	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c4-68d1-e466-c67513b0d9d1	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c4-68d1-8cc0-9d5de7f3b7dc	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c4-68d2-ebed-ad7e1fe7ed5e	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c4-68d2-2619-5a5bacb27f87	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c4-68d2-2e84-592bc916293f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c4-68d2-8885-dd8840917d25	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c4-68d2-ce63-04cec590da7d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c4-68d2-19b8-fe82cfff77d1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12381843)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c4-68d2-6d16-3891a2cdba17	00000000-55c4-68d2-2619-5a5bacb27f87	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c4-68d2-6af2-35430d1683b2	00000000-55c4-68d2-2619-5a5bacb27f87	00010000-55c4-68d1-85af-40f82623823a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c4-68d2-5798-397eaee3cc8e	00000000-55c4-68d2-2e84-592bc916293f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12381854)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c4-68d2-a411-564a5973069b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c4-68d2-b023-4b93d4933c52	00010000-55c4-68d2-955d-cb8aae569e31	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c4-68d2-41d6-dfb9cf9b45c8	00010000-55c4-68d2-1b40-cb595c5fa6e2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c4-68d2-b88a-634589a564cf	00010000-55c4-68d2-0867-5f73c103a7d2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c4-68d2-7663-c0e2b3093cfe	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c4-68d2-a31d-3f02875fda72	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c4-68d2-5f6d-118fdb9fa065	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c4-68d2-d803-3745e07165e0	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c4-68d2-68c7-1f742f0668c6	00010000-55c4-68d2-963a-4f320e11f5f5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c4-68d2-7de0-9b3bc0208422	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c4-68d2-ed14-93c7006ac43c	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c4-68d2-3fc9-9e4a93e386c0	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c4-68d2-9340-5791e3d8c420	00010000-55c4-68d2-faf6-2d386afadead	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12381808)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c4-68d0-b23b-630b35801c78	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c4-68d0-a541-2b157f062017	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c4-68d0-4583-0b6ed903b302	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c4-68d0-3bd3-3d035a5b790c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c4-68d0-ea9f-84fc75f88263	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c4-68d0-312c-b99d27c89241	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c4-68d0-3a9f-e55a1f7654c7	Abonma-read	Abonma - branje	f
00030000-55c4-68d0-d196-c8888f5e0b66	Abonma-write	Abonma - spreminjanje	f
00030000-55c4-68d0-646d-2e70f7977e66	Alternacija-read	Alternacija - branje	f
00030000-55c4-68d0-556b-2df38a94abc4	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c4-68d0-7780-68c40d45c259	Arhivalija-read	Arhivalija - branje	f
00030000-55c4-68d0-18b1-ce58a44d538a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c4-68d0-dcc6-d328c1f37831	Besedilo-read	Besedilo - branje	f
00030000-55c4-68d0-caaf-b15445779008	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c4-68d0-462a-bf708f57bb24	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c4-68d0-7eb7-a6f6f1ed82e4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c4-68d0-ba9e-a1485e089515	Dogodek-read	Dogodek - branje	f
00030000-55c4-68d0-eb5d-c5a67db640de	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c4-68d0-d515-905896a07557	DrugiVir-read	DrugiVir - branje	f
00030000-55c4-68d0-febf-7588884d73ae	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c4-68d0-8529-aa37b6eed24b	Drzava-read	Drzava - branje	f
00030000-55c4-68d0-6c31-a6abd61214e3	Drzava-write	Drzava - spreminjanje	f
00030000-55c4-68d0-4389-7d867e06363a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c4-68d0-a482-659725ce972c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c4-68d0-2edd-5648a2005c27	Funkcija-read	Funkcija - branje	f
00030000-55c4-68d0-7b5d-792022cca66a	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c4-68d0-74f4-c3ad1083d729	Gostovanje-read	Gostovanje - branje	f
00030000-55c4-68d0-bb7a-eb4370ec1613	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c4-68d0-5f3d-08c4d0ada4d4	Gostujoca-read	Gostujoca - branje	f
00030000-55c4-68d0-8def-1d782be0c4c6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c4-68d0-1116-f2baf2a2a056	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c4-68d0-0e58-004894c10ec0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c4-68d0-42d6-6abd7fd6fdbc	Kupec-read	Kupec - branje	f
00030000-55c4-68d0-6e41-b3a13be14426	Kupec-write	Kupec - spreminjanje	f
00030000-55c4-68d0-5e82-490dc8010e3b	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c4-68d0-e64e-6ffa7563b64a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c4-68d0-963e-0568306c9119	Option-read	Option - branje	f
00030000-55c4-68d0-30e4-4fec0f275237	Option-write	Option - spreminjanje	f
00030000-55c4-68d0-1f88-370d1c3712bf	OptionValue-read	OptionValue - branje	f
00030000-55c4-68d0-ccae-543cb88c84a7	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c4-68d0-ebf5-731dd05dcd44	Oseba-read	Oseba - branje	f
00030000-55c4-68d0-c414-dd0dc4671054	Oseba-write	Oseba - spreminjanje	f
00030000-55c4-68d0-fe9d-670c1950a16e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c4-68d0-7228-71d57fabd818	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c4-68d0-8820-cea5f8725242	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c4-68d0-f3ba-9c8a54c2aaaa	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c4-68d0-c6eb-46a00632052b	Pogodba-read	Pogodba - branje	f
00030000-55c4-68d0-0860-4dcf9fe020e5	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c4-68d0-c726-15790d0d9df1	Popa-read	Popa - branje	f
00030000-55c4-68d0-4434-a35652a3901e	Popa-write	Popa - spreminjanje	f
00030000-55c4-68d0-b77d-3616a1fadcfd	Posta-read	Posta - branje	f
00030000-55c4-68d0-ae27-3c6b7b462fbf	Posta-write	Posta - spreminjanje	f
00030000-55c4-68d0-26c6-36d60d729843	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c4-68d0-d4d9-579f8fec468c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c4-68d0-a815-9b48cc736e96	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c4-68d0-6051-527923d2399a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c4-68d0-45c4-38766dd7110e	Predstava-read	Predstava - branje	f
00030000-55c4-68d0-7fb3-a1ae5a074099	Predstava-write	Predstava - spreminjanje	f
00030000-55c4-68d0-c182-3d1570da3b58	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c4-68d0-f886-ebe06926428b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c4-68d0-5cdd-ec5d8f71130e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c4-68d0-a493-11897c5d0065	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c4-68d0-e62e-f7c2615d4bcd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c4-68d0-e178-53587e044db7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c4-68d0-32cf-9e1b7bf8bdd8	ProgramDela-read	ProgramDela - branje	f
00030000-55c4-68d0-ea52-3a6db1fdbf89	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c4-68d0-fcf4-058dbea66990	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c4-68d0-bf3b-975ff1517d41	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c4-68d0-6f3e-832c56480f55	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c4-68d0-a76a-24ec9daecd86	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c4-68d0-c085-e0837648a326	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c4-68d0-082f-a2dd4961d065	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c4-68d0-b3c6-ddee75163079	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c4-68d0-636a-660430325948	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c4-68d0-cec5-50c03971b330	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c4-68d0-6ebc-79c59e3c7265	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c4-68d0-302e-1642ab724804	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c4-68d0-8942-7a9f533c7ac6	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c4-68d0-a50f-d0fb1aaac4ea	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c4-68d0-d25e-a53dfdba6d1c	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c4-68d0-277a-b28bc5c600a8	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c4-68d0-ed32-956158c64c7c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c4-68d0-9b8a-15d9619acd02	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c4-68d0-1ef7-258506eb4659	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c4-68d0-d521-bb9cbaad7272	Prostor-read	Prostor - branje	f
00030000-55c4-68d0-abc3-c0b18c906c27	Prostor-write	Prostor - spreminjanje	f
00030000-55c4-68d0-ea48-13fd59ec41ad	Racun-read	Racun - branje	f
00030000-55c4-68d0-3861-9cc6762552b8	Racun-write	Racun - spreminjanje	f
00030000-55c4-68d0-227d-11e7a17f8590	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c4-68d0-c340-1051f534e97a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c4-68d0-ea7f-f9004aeea5c5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c4-68d0-ecf5-5aa94ebf5a25	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c4-68d0-c67b-0c39360a3804	Rekvizit-read	Rekvizit - branje	f
00030000-55c4-68d0-b053-957571641be6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c4-68d0-35ba-272f3beed87c	Revizija-read	Revizija - branje	f
00030000-55c4-68d0-1a0e-872ded163e18	Revizija-write	Revizija - spreminjanje	f
00030000-55c4-68d0-68b6-d3ae667fe408	Rezervacija-read	Rezervacija - branje	f
00030000-55c4-68d0-fe71-1bf444b9fee8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c4-68d0-44f8-f1d1fddcf37b	SedezniRed-read	SedezniRed - branje	f
00030000-55c4-68d0-16b4-5421894d777e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c4-68d0-e7c3-8ca4a06527ae	Sedez-read	Sedez - branje	f
00030000-55c4-68d0-c2fe-cc09669079c2	Sedez-write	Sedez - spreminjanje	f
00030000-55c4-68d0-ef4d-d3196b8faac8	Sezona-read	Sezona - branje	f
00030000-55c4-68d0-291f-9f08143c7d97	Sezona-write	Sezona - spreminjanje	f
00030000-55c4-68d0-8085-bf943cbbfcdc	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c4-68d0-25fc-59278a0ca824	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c4-68d0-828c-830a7a6236ed	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c4-68d0-6970-9f3a586f6d41	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c4-68d0-780f-0e7cb760eaf0	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c4-68d0-4ae5-0609629a00ea	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c4-68d0-1c59-a1d4301cf067	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c4-68d0-349d-1b3ada435c62	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c4-68d0-c5b1-7024405f5d39	Telefonska-read	Telefonska - branje	f
00030000-55c4-68d0-e5d6-c8114d174ef6	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c4-68d0-e522-5d316d62ebf7	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c4-68d0-454f-d7331a548f48	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c4-68d0-9bd4-c8cbf74c25f7	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c4-68d0-9eb7-04b8f8f9a550	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c4-68d0-ba61-d47ab4d9ce73	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c4-68d0-a8e4-a3868c36c25c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c4-68d0-13ee-a47602e44050	Trr-read	Trr - branje	f
00030000-55c4-68d0-f521-dfd6639bc0bb	Trr-write	Trr - spreminjanje	f
00030000-55c4-68d0-2ac0-81b5a5fc7321	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c4-68d0-e071-587b4e4c729a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c4-68d0-9df1-b8880ab1c00b	Vaja-read	Vaja - branje	f
00030000-55c4-68d0-a40e-60e49952c776	Vaja-write	Vaja - spreminjanje	f
00030000-55c4-68d0-f875-e17c116aac01	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c4-68d0-252b-44a8de83dac6	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c4-68d0-5333-c384579585de	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c4-68d0-b9e5-fb5b0cbe88ef	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c4-68d0-cb97-95bac7496ef6	Zasedenost-read	Zasedenost - branje	f
00030000-55c4-68d0-1bed-c1b6bf1172a4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c4-68d0-4705-be39cfbcd197	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c4-68d0-33d4-40343aeadf85	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c4-68d0-4c6c-198a23d75943	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c4-68d0-657b-8af5b48795d8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c4-68d0-40b8-66a15ba02357	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c4-68d0-670b-7b1dfa902f24	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c4-68d0-aad5-629d9f5a40d7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c4-68d0-7bc5-55b37b079729	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c4-68d0-82b5-ac6453ccebbd	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c4-68d0-c5aa-52dbdf7c416d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c4-68d0-0864-c23a6eca8539	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c4-68d0-621c-bd19d74dc26e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c4-68d0-ad41-afc5defcc491	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c4-68d0-0e98-c549e2ae512b	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c4-68d0-ddd3-4f891b5f89df	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c4-68d0-d2e3-e7cfc4a88d9c	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 12381827)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c4-68d0-4620-08b88e290f75	00030000-55c4-68d0-a541-2b157f062017
00020000-55c4-68d0-4394-628213742cbd	00030000-55c4-68d0-8529-aa37b6eed24b
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-3a9f-e55a1f7654c7
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-d196-c8888f5e0b66
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-646d-2e70f7977e66
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-556b-2df38a94abc4
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-7780-68c40d45c259
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-ba9e-a1485e089515
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-3bd3-3d035a5b790c
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-eb5d-c5a67db640de
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-8529-aa37b6eed24b
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-6c31-a6abd61214e3
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-2edd-5648a2005c27
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-7b5d-792022cca66a
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-74f4-c3ad1083d729
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-bb7a-eb4370ec1613
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-5f3d-08c4d0ada4d4
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-8def-1d782be0c4c6
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-1116-f2baf2a2a056
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-0e58-004894c10ec0
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-963e-0568306c9119
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-1f88-370d1c3712bf
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-ebf5-731dd05dcd44
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-c414-dd0dc4671054
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-c726-15790d0d9df1
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-4434-a35652a3901e
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-b77d-3616a1fadcfd
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-ae27-3c6b7b462fbf
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-a815-9b48cc736e96
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-6051-527923d2399a
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-45c4-38766dd7110e
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-7fb3-a1ae5a074099
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-e62e-f7c2615d4bcd
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-e178-53587e044db7
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-d521-bb9cbaad7272
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-abc3-c0b18c906c27
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-ea7f-f9004aeea5c5
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-ecf5-5aa94ebf5a25
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-c67b-0c39360a3804
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-b053-957571641be6
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-ef4d-d3196b8faac8
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-291f-9f08143c7d97
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-9bd4-c8cbf74c25f7
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-2ac0-81b5a5fc7321
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-e071-587b4e4c729a
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-9df1-b8880ab1c00b
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-a40e-60e49952c776
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-cb97-95bac7496ef6
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-1bed-c1b6bf1172a4
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-4705-be39cfbcd197
00020000-55c4-68d0-edf1-ae8b25bb69ce	00030000-55c4-68d0-4c6c-198a23d75943
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-3a9f-e55a1f7654c7
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-7780-68c40d45c259
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-ba9e-a1485e089515
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-8529-aa37b6eed24b
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-74f4-c3ad1083d729
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-5f3d-08c4d0ada4d4
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-1116-f2baf2a2a056
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-0e58-004894c10ec0
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-963e-0568306c9119
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-1f88-370d1c3712bf
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-ebf5-731dd05dcd44
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-c414-dd0dc4671054
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-c726-15790d0d9df1
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-b77d-3616a1fadcfd
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-a815-9b48cc736e96
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-6051-527923d2399a
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-45c4-38766dd7110e
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-d521-bb9cbaad7272
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-ea7f-f9004aeea5c5
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-c67b-0c39360a3804
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-ef4d-d3196b8faac8
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-c5b1-7024405f5d39
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-e5d6-c8114d174ef6
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-13ee-a47602e44050
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-f521-dfd6639bc0bb
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-5333-c384579585de
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-b9e5-fb5b0cbe88ef
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-4705-be39cfbcd197
00020000-55c4-68d0-13e5-adf3a02333cf	00030000-55c4-68d0-4c6c-198a23d75943
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-3a9f-e55a1f7654c7
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-646d-2e70f7977e66
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-7780-68c40d45c259
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-18b1-ce58a44d538a
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-dcc6-d328c1f37831
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-462a-bf708f57bb24
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-ba9e-a1485e089515
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-8529-aa37b6eed24b
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-2edd-5648a2005c27
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-74f4-c3ad1083d729
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-5f3d-08c4d0ada4d4
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-1116-f2baf2a2a056
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-963e-0568306c9119
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-1f88-370d1c3712bf
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-ebf5-731dd05dcd44
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-c726-15790d0d9df1
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-b77d-3616a1fadcfd
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-45c4-38766dd7110e
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-e62e-f7c2615d4bcd
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-d521-bb9cbaad7272
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-ea7f-f9004aeea5c5
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-c67b-0c39360a3804
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-ef4d-d3196b8faac8
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-9bd4-c8cbf74c25f7
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-9df1-b8880ab1c00b
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-cb97-95bac7496ef6
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-4705-be39cfbcd197
00020000-55c4-68d0-089d-4f2920d31749	00030000-55c4-68d0-4c6c-198a23d75943
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-3a9f-e55a1f7654c7
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-d196-c8888f5e0b66
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-556b-2df38a94abc4
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-7780-68c40d45c259
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-ba9e-a1485e089515
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-8529-aa37b6eed24b
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-74f4-c3ad1083d729
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-5f3d-08c4d0ada4d4
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-963e-0568306c9119
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-1f88-370d1c3712bf
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-c726-15790d0d9df1
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-b77d-3616a1fadcfd
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-45c4-38766dd7110e
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-d521-bb9cbaad7272
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-ea7f-f9004aeea5c5
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-c67b-0c39360a3804
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-ef4d-d3196b8faac8
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-9bd4-c8cbf74c25f7
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-4705-be39cfbcd197
00020000-55c4-68d0-b5f1-83f407d2690f	00030000-55c4-68d0-4c6c-198a23d75943
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-3a9f-e55a1f7654c7
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-7780-68c40d45c259
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-ba9e-a1485e089515
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-8529-aa37b6eed24b
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-74f4-c3ad1083d729
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-5f3d-08c4d0ada4d4
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-963e-0568306c9119
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-1f88-370d1c3712bf
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-c726-15790d0d9df1
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-b77d-3616a1fadcfd
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-45c4-38766dd7110e
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-d521-bb9cbaad7272
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-ea7f-f9004aeea5c5
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-c67b-0c39360a3804
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-ef4d-d3196b8faac8
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-e522-5d316d62ebf7
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-4583-0b6ed903b302
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-9bd4-c8cbf74c25f7
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-4705-be39cfbcd197
00020000-55c4-68d0-95f8-522f9b9028a9	00030000-55c4-68d0-4c6c-198a23d75943
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-b23b-630b35801c78
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-a541-2b157f062017
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-4583-0b6ed903b302
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-3bd3-3d035a5b790c
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ea9f-84fc75f88263
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-312c-b99d27c89241
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-3a9f-e55a1f7654c7
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-d196-c8888f5e0b66
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-646d-2e70f7977e66
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-556b-2df38a94abc4
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-7780-68c40d45c259
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-18b1-ce58a44d538a
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-dcc6-d328c1f37831
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-caaf-b15445779008
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-462a-bf708f57bb24
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-7eb7-a6f6f1ed82e4
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ba9e-a1485e089515
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-eb5d-c5a67db640de
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-8529-aa37b6eed24b
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-6c31-a6abd61214e3
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-d515-905896a07557
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-febf-7588884d73ae
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-4389-7d867e06363a
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-a482-659725ce972c
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-2edd-5648a2005c27
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-7b5d-792022cca66a
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-74f4-c3ad1083d729
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-bb7a-eb4370ec1613
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-5f3d-08c4d0ada4d4
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-8def-1d782be0c4c6
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-1116-f2baf2a2a056
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-0e58-004894c10ec0
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-42d6-6abd7fd6fdbc
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-6e41-b3a13be14426
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-5e82-490dc8010e3b
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-e64e-6ffa7563b64a
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-963e-0568306c9119
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-30e4-4fec0f275237
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-1f88-370d1c3712bf
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ccae-543cb88c84a7
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ebf5-731dd05dcd44
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c414-dd0dc4671054
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-fe9d-670c1950a16e
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-7228-71d57fabd818
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-8820-cea5f8725242
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-f3ba-9c8a54c2aaaa
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c6eb-46a00632052b
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-0860-4dcf9fe020e5
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c726-15790d0d9df1
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-4434-a35652a3901e
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-b77d-3616a1fadcfd
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ae27-3c6b7b462fbf
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-26c6-36d60d729843
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-d4d9-579f8fec468c
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-a815-9b48cc736e96
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-6051-527923d2399a
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-45c4-38766dd7110e
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-7fb3-a1ae5a074099
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c182-3d1570da3b58
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-f886-ebe06926428b
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-5cdd-ec5d8f71130e
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-a493-11897c5d0065
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-e62e-f7c2615d4bcd
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-e178-53587e044db7
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-32cf-9e1b7bf8bdd8
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ea52-3a6db1fdbf89
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-fcf4-058dbea66990
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-bf3b-975ff1517d41
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-6f3e-832c56480f55
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-a76a-24ec9daecd86
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c085-e0837648a326
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-082f-a2dd4961d065
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-b3c6-ddee75163079
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-636a-660430325948
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-cec5-50c03971b330
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-6ebc-79c59e3c7265
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-302e-1642ab724804
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-8942-7a9f533c7ac6
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-a50f-d0fb1aaac4ea
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-d25e-a53dfdba6d1c
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-277a-b28bc5c600a8
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ed32-956158c64c7c
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-9b8a-15d9619acd02
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-1ef7-258506eb4659
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-d521-bb9cbaad7272
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-abc3-c0b18c906c27
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ea48-13fd59ec41ad
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-3861-9cc6762552b8
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-227d-11e7a17f8590
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c340-1051f534e97a
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ea7f-f9004aeea5c5
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ecf5-5aa94ebf5a25
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c67b-0c39360a3804
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-b053-957571641be6
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-35ba-272f3beed87c
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-1a0e-872ded163e18
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-68b6-d3ae667fe408
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-fe71-1bf444b9fee8
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-44f8-f1d1fddcf37b
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-16b4-5421894d777e
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-e7c3-8ca4a06527ae
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c2fe-cc09669079c2
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ef4d-d3196b8faac8
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-291f-9f08143c7d97
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-8085-bf943cbbfcdc
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-25fc-59278a0ca824
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-828c-830a7a6236ed
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-6970-9f3a586f6d41
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-780f-0e7cb760eaf0
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-4ae5-0609629a00ea
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-1c59-a1d4301cf067
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-349d-1b3ada435c62
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-c5b1-7024405f5d39
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-e5d6-c8114d174ef6
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-e522-5d316d62ebf7
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-454f-d7331a548f48
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-9bd4-c8cbf74c25f7
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-9eb7-04b8f8f9a550
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-ba61-d47ab4d9ce73
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-a8e4-a3868c36c25c
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-13ee-a47602e44050
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-f521-dfd6639bc0bb
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-2ac0-81b5a5fc7321
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-e071-587b4e4c729a
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-9df1-b8880ab1c00b
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-a40e-60e49952c776
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-f875-e17c116aac01
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-252b-44a8de83dac6
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-5333-c384579585de
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-b9e5-fb5b0cbe88ef
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-cb97-95bac7496ef6
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-1bed-c1b6bf1172a4
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-4705-be39cfbcd197
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-33d4-40343aeadf85
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-4c6c-198a23d75943
00020000-55c4-68d2-bf54-36de210901e6	00030000-55c4-68d0-657b-8af5b48795d8
\.


--
-- TOC entry 3025 (class 0 OID 12382126)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12382157)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12382271)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c4-68d2-6ff1-c928d4a65f83	00090000-55c4-68d2-a411-564a5973069b	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c4-68d2-c82d-6514e80cd089	00090000-55c4-68d2-a31d-3f02875fda72	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c4-68d2-7bd8-a5ef8cd2dd09	00090000-55c4-68d2-9340-5791e3d8c420	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12381887)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c4-68d2-5f82-532cd302b7eb	00040000-55c4-68d0-9aed-8d94ce627a31	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-68d2-5e27-61f4d1c9b388	00040000-55c4-68d0-9aed-8d94ce627a31	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c4-68d2-1941-dac8ba4dcd4a	00040000-55c4-68d0-9aed-8d94ce627a31	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-68d2-9373-3d9f35874485	00040000-55c4-68d0-9aed-8d94ce627a31	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-68d2-068a-40ff19fb7489	00040000-55c4-68d0-9aed-8d94ce627a31	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-68d2-7f40-604de98f8d8b	00040000-55c4-68d0-d65c-7691c9d9b5f7	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-68d2-45d7-334901373224	00040000-55c4-68d0-c719-5f61505724a4	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-68d2-3691-b726a627bf6a	00040000-55c4-68d0-22af-9717888367bc	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-68d2-6371-ac1648758d17	00040000-55c4-68d0-9aed-8d94ce627a31	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12381922)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c4-68d1-13d6-5d8f4562f381	8341	Adlešiči
00050000-55c4-68d1-ab05-b8ece2962ae7	5270	Ajdovščina
00050000-55c4-68d1-e07d-132222b834a7	6280	Ankaran/Ancarano
00050000-55c4-68d1-de15-6de84bc358ed	9253	Apače
00050000-55c4-68d1-fa30-1ce813e02700	8253	Artiče
00050000-55c4-68d1-5bda-4543acfa738a	4275	Begunje na Gorenjskem
00050000-55c4-68d1-9339-41e6091542c2	1382	Begunje pri Cerknici
00050000-55c4-68d1-b561-7db61920583f	9231	Beltinci
00050000-55c4-68d1-767a-a46f9420d9c9	2234	Benedikt
00050000-55c4-68d1-3e45-83d5318cf866	2345	Bistrica ob Dravi
00050000-55c4-68d1-31de-ac2ecf29d80e	3256	Bistrica ob Sotli
00050000-55c4-68d1-ade6-f21caabfba29	8259	Bizeljsko
00050000-55c4-68d1-c524-95a9a699ed9d	1223	Blagovica
00050000-55c4-68d1-64d0-c8427becf957	8283	Blanca
00050000-55c4-68d1-aa7a-eeafeead9b70	4260	Bled
00050000-55c4-68d1-9a22-3da744275671	4273	Blejska Dobrava
00050000-55c4-68d1-0016-528c1f8bb283	9265	Bodonci
00050000-55c4-68d1-b604-fb6705d4762c	9222	Bogojina
00050000-55c4-68d1-fbc6-aba8c2b3ad5a	4263	Bohinjska Bela
00050000-55c4-68d1-f78f-a9154a389351	4264	Bohinjska Bistrica
00050000-55c4-68d1-5ba2-4ed8d502a5ec	4265	Bohinjsko jezero
00050000-55c4-68d1-39e3-52f4a232cf28	1353	Borovnica
00050000-55c4-68d1-bae9-13a77aaea392	8294	Boštanj
00050000-55c4-68d1-0786-fed7bf8610b1	5230	Bovec
00050000-55c4-68d1-b25d-282f6230432d	5295	Branik
00050000-55c4-68d1-fb9b-089cb94ed548	3314	Braslovče
00050000-55c4-68d1-0cc2-8b7988096ce1	5223	Breginj
00050000-55c4-68d1-2b61-874bf4978644	8280	Brestanica
00050000-55c4-68d1-269d-4d1ff3ef502e	2354	Bresternica
00050000-55c4-68d1-eaf4-baf5cf30687b	4243	Brezje
00050000-55c4-68d1-2463-48387fbad992	1351	Brezovica pri Ljubljani
00050000-55c4-68d1-1bc8-089af58547e0	8250	Brežice
00050000-55c4-68d1-0a8c-cdc87bf560f0	4210	Brnik - Aerodrom
00050000-55c4-68d1-23b1-1c60ee95a768	8321	Brusnice
00050000-55c4-68d1-572d-40e13b7e87d5	3255	Buče
00050000-55c4-68d1-8ba1-ecedec764963	8276	Bučka 
00050000-55c4-68d1-45ea-58330d7d7b20	9261	Cankova
00050000-55c4-68d1-2c7b-bf59c337bd0b	3000	Celje 
00050000-55c4-68d1-8079-f5d3aaef63ca	3001	Celje - poštni predali
00050000-55c4-68d1-0739-c632e1d0766a	4207	Cerklje na Gorenjskem
00050000-55c4-68d1-f960-1513912e8924	8263	Cerklje ob Krki
00050000-55c4-68d1-05d7-e8749676f628	1380	Cerknica
00050000-55c4-68d1-b88b-7346828afd27	5282	Cerkno
00050000-55c4-68d1-381c-851df0dbc95e	2236	Cerkvenjak
00050000-55c4-68d1-8d67-cf51a368fc88	2215	Ceršak
00050000-55c4-68d1-1a4b-97c45bee8b00	2326	Cirkovce
00050000-55c4-68d1-f4ed-f4651370a8ea	2282	Cirkulane
00050000-55c4-68d1-4d0d-1fa967186922	5273	Col
00050000-55c4-68d1-c6ea-4196d288fbe9	8251	Čatež ob Savi
00050000-55c4-68d1-fa71-a61b49469155	1413	Čemšenik
00050000-55c4-68d1-6e55-d19ef1a542ea	5253	Čepovan
00050000-55c4-68d1-aebb-bec6ebb4153e	9232	Črenšovci
00050000-55c4-68d1-f57e-105b384168a6	2393	Črna na Koroškem
00050000-55c4-68d1-87d6-526efc25aaeb	6275	Črni Kal
00050000-55c4-68d1-0c69-9e39009ed42d	5274	Črni Vrh nad Idrijo
00050000-55c4-68d1-a49b-449a34980a09	5262	Črniče
00050000-55c4-68d1-369b-a507c24b477a	8340	Črnomelj
00050000-55c4-68d1-e9c7-f43c6fadb020	6271	Dekani
00050000-55c4-68d1-dab3-1ea575a8445c	5210	Deskle
00050000-55c4-68d1-1cfe-ecf9e7511735	2253	Destrnik
00050000-55c4-68d1-850a-4258e3b45d1c	6215	Divača
00050000-55c4-68d1-7f23-b45527e29e80	1233	Dob
00050000-55c4-68d1-0390-fbbb711a26fc	3224	Dobje pri Planini
00050000-55c4-68d1-6aeb-8f0186506c70	8257	Dobova
00050000-55c4-68d1-a1a4-6a9c1c41acda	1423	Dobovec
00050000-55c4-68d1-6cde-1af412d2bae3	5263	Dobravlje
00050000-55c4-68d1-ad10-d896b8fd4f8a	3204	Dobrna
00050000-55c4-68d1-d685-ce66e9d7199e	8211	Dobrnič
00050000-55c4-68d1-d7e6-cf946ca76ef4	1356	Dobrova
00050000-55c4-68d1-dbff-eaf25e24f8cd	9223	Dobrovnik/Dobronak 
00050000-55c4-68d1-bf41-83b653390f84	5212	Dobrovo v Brdih
00050000-55c4-68d1-dde2-ddf3e02eca26	1431	Dol pri Hrastniku
00050000-55c4-68d1-9960-4ab7417c128e	1262	Dol pri Ljubljani
00050000-55c4-68d1-6123-2182fa99beff	1273	Dole pri Litiji
00050000-55c4-68d1-0b37-6c7dda0c717a	1331	Dolenja vas
00050000-55c4-68d1-9979-9a737e7b856f	8350	Dolenjske Toplice
00050000-55c4-68d1-2555-4f1af4365fd7	1230	Domžale
00050000-55c4-68d1-e526-553ebc744050	2252	Dornava
00050000-55c4-68d1-9b1b-b52b8c9a50e8	5294	Dornberk
00050000-55c4-68d1-9a29-0d41734f83ee	1319	Draga
00050000-55c4-68d1-0e02-988ce454fe57	8343	Dragatuš
00050000-55c4-68d1-9e38-ea72a6b70882	3222	Dramlje
00050000-55c4-68d1-efcb-11cba04a4f34	2370	Dravograd
00050000-55c4-68d1-fea2-9734b578141b	4203	Duplje
00050000-55c4-68d1-d688-d4358da7f63a	6221	Dutovlje
00050000-55c4-68d1-1df5-e2fd57bcf13f	8361	Dvor
00050000-55c4-68d1-0fe3-93a9e056286b	2343	Fala
00050000-55c4-68d1-e923-5e6a7a59c3d1	9208	Fokovci
00050000-55c4-68d1-a442-5476fb4e8a76	2313	Fram
00050000-55c4-68d1-d6f2-c99910c4ab2e	3213	Frankolovo
00050000-55c4-68d1-dafc-dc4cd36c1b40	1274	Gabrovka
00050000-55c4-68d1-a0fc-1716d0a98d19	8254	Globoko
00050000-55c4-68d1-995e-1c104e502a6b	5275	Godovič
00050000-55c4-68d1-c572-875d206a59ba	4204	Golnik
00050000-55c4-68d1-bedb-75e2795c0ef6	3303	Gomilsko
00050000-55c4-68d1-a7f2-eda3e2452eb8	4224	Gorenja vas
00050000-55c4-68d1-73d9-36b5b2522a64	3263	Gorica pri Slivnici
00050000-55c4-68d1-8968-180513a8317e	2272	Gorišnica
00050000-55c4-68d1-6fa4-c9b95a15bf40	9250	Gornja Radgona
00050000-55c4-68d1-da11-b62233ef4c91	3342	Gornji Grad
00050000-55c4-68d1-9e5b-748878283caa	4282	Gozd Martuljek
00050000-55c4-68d1-92b7-2279973a0795	6272	Gračišče
00050000-55c4-68d1-1397-217668d276e3	9264	Grad
00050000-55c4-68d1-0b70-f2512494fe77	8332	Gradac
00050000-55c4-68d1-1b2e-45d35e55bbd0	1384	Grahovo
00050000-55c4-68d1-03dd-1ab2cea7d9ab	5242	Grahovo ob Bači
00050000-55c4-68d1-b9a0-2b57fcdfc3e3	5251	Grgar
00050000-55c4-68d1-d25e-090404d6ef84	3302	Griže
00050000-55c4-68d1-cc9e-974d325e9447	3231	Grobelno
00050000-55c4-68d1-0f7a-e685d7502a00	1290	Grosuplje
00050000-55c4-68d1-0164-6602154ec700	2288	Hajdina
00050000-55c4-68d1-7726-c6b3c06475b6	8362	Hinje
00050000-55c4-68d1-ea65-d33a61ffc6c7	2311	Hoče
00050000-55c4-68d1-599c-c0dcf9e52cef	9205	Hodoš/Hodos
00050000-55c4-68d1-6a47-8c8fca83ad85	1354	Horjul
00050000-55c4-68d1-d3f0-469f17e5b302	1372	Hotedršica
00050000-55c4-68d1-2077-8b55199fc658	1430	Hrastnik
00050000-55c4-68d1-8e61-6fa3a570e795	6225	Hruševje
00050000-55c4-68d1-f8f5-85f246fcbdb3	4276	Hrušica
00050000-55c4-68d1-9c23-7a6653b5f4a2	5280	Idrija
00050000-55c4-68d1-2012-13172efa05a4	1292	Ig
00050000-55c4-68d1-af8f-093fdbc0ebe1	6250	Ilirska Bistrica
00050000-55c4-68d1-a93b-bd671b39772b	6251	Ilirska Bistrica-Trnovo
00050000-55c4-68d1-dfe1-69735aaf55ae	1295	Ivančna Gorica
00050000-55c4-68d1-18b7-4e245172fc0c	2259	Ivanjkovci
00050000-55c4-68d1-53f9-7402c66fdf8d	1411	Izlake
00050000-55c4-68d1-b1ff-ec59228f8754	6310	Izola/Isola
00050000-55c4-68d1-f13a-23913cca2484	2222	Jakobski Dol
00050000-55c4-68d1-5b56-b5e834a989e6	2221	Jarenina
00050000-55c4-68d1-bd33-6e7641a835d6	6254	Jelšane
00050000-55c4-68d1-e317-2ed5faa6aedd	4270	Jesenice
00050000-55c4-68d1-6848-2455413a7556	8261	Jesenice na Dolenjskem
00050000-55c4-68d1-b2dd-3ad13046ac5c	3273	Jurklošter
00050000-55c4-68d1-de40-d89f2c5d4cdb	2223	Jurovski Dol
00050000-55c4-68d1-0ed2-fac2ca20b165	2256	Juršinci
00050000-55c4-68d1-60df-533883194911	5214	Kal nad Kanalom
00050000-55c4-68d1-2fc1-36dcbc38a878	3233	Kalobje
00050000-55c4-68d1-24d5-4f816e06c83a	4246	Kamna Gorica
00050000-55c4-68d1-5a39-9ec010d5f119	2351	Kamnica
00050000-55c4-68d1-5832-c668f9ba51d3	1241	Kamnik
00050000-55c4-68d1-2203-db1c6985bc5d	5213	Kanal
00050000-55c4-68d1-a713-be23e60f3d82	8258	Kapele
00050000-55c4-68d1-9af3-033ea6b56b5a	2362	Kapla
00050000-55c4-68d1-db42-fa7c0d62c6bc	2325	Kidričevo
00050000-55c4-68d1-d758-974cd2c0d771	1412	Kisovec
00050000-55c4-68d1-2df6-093b9ce9e2b6	6253	Knežak
00050000-55c4-68d1-00a1-86ffad922f52	5222	Kobarid
00050000-55c4-68d1-31fc-d0f9ea9e9a66	9227	Kobilje
00050000-55c4-68d1-668b-f5472c7f914c	1330	Kočevje
00050000-55c4-68d1-a3c0-fdcfec3cf148	1338	Kočevska Reka
00050000-55c4-68d1-e6df-57bc51a7c8f9	2276	Kog
00050000-55c4-68d1-7eaa-b16f35175f59	5211	Kojsko
00050000-55c4-68d1-b016-5b58dc86510a	6223	Komen
00050000-55c4-68d1-1278-ae2294884dd7	1218	Komenda
00050000-55c4-68d1-b53c-90f15bf173f4	6000	Koper/Capodistria 
00050000-55c4-68d1-d492-4f3915ef5bd3	6001	Koper/Capodistria - poštni predali
00050000-55c4-68d1-4333-a1d8ccf9afe3	8282	Koprivnica
00050000-55c4-68d1-263f-4b0eae57f071	5296	Kostanjevica na Krasu
00050000-55c4-68d1-1022-1fbbf07fab80	8311	Kostanjevica na Krki
00050000-55c4-68d1-ac77-77501da4837a	1336	Kostel
00050000-55c4-68d1-e558-f57f982f41e7	6256	Košana
00050000-55c4-68d1-228a-fddf6947abfb	2394	Kotlje
00050000-55c4-68d1-3e46-6e85569d0c86	6240	Kozina
00050000-55c4-68d1-b7e6-08e3661509f3	3260	Kozje
00050000-55c4-68d1-2fa0-d23c565e7962	4000	Kranj 
00050000-55c4-68d1-3a72-15d7c660068f	4001	Kranj - poštni predali
00050000-55c4-68d1-aa77-df27cce63563	4280	Kranjska Gora
00050000-55c4-68d1-4e6b-d726cc85b661	1281	Kresnice
00050000-55c4-68d1-9bf4-40414ac74143	4294	Križe
00050000-55c4-68d1-1995-86ecf6b344a9	9206	Križevci
00050000-55c4-68d1-c4e2-4c813e86e087	9242	Križevci pri Ljutomeru
00050000-55c4-68d1-69f6-80947c21570b	1301	Krka
00050000-55c4-68d1-e9ea-886d3eb50386	8296	Krmelj
00050000-55c4-68d1-2a0a-bf452f81e9be	4245	Kropa
00050000-55c4-68d1-872e-598c43fa86b0	8262	Krška vas
00050000-55c4-68d1-a471-496fe76e4d9c	8270	Krško
00050000-55c4-68d1-447b-5d860bc5aef4	9263	Kuzma
00050000-55c4-68d1-b65b-366554c41f31	2318	Laporje
00050000-55c4-68d1-da34-89bf7d6e6e69	3270	Laško
00050000-55c4-68d1-1bcd-207913201a97	1219	Laze v Tuhinju
00050000-55c4-68d1-670f-42d939eabab9	2230	Lenart v Slovenskih goricah
00050000-55c4-68d1-9d1c-f0360dcddde2	9220	Lendava/Lendva
00050000-55c4-68d1-e02b-c1ce5a33cb54	4248	Lesce
00050000-55c4-68d1-478d-c49669ffa514	3261	Lesično
00050000-55c4-68d1-d674-258b3c43bd1a	8273	Leskovec pri Krškem
00050000-55c4-68d1-156f-529617d84a78	2372	Libeliče
00050000-55c4-68d1-35da-97f8348fc209	2341	Limbuš
00050000-55c4-68d1-faf1-514f6485e9a1	1270	Litija
00050000-55c4-68d1-02f2-a0dd7c2353bb	3202	Ljubečna
00050000-55c4-68d1-fa0b-3957456ff037	1000	Ljubljana 
00050000-55c4-68d1-0a11-7985da8cd917	1001	Ljubljana - poštni predali
00050000-55c4-68d1-048d-49ee1307e120	1231	Ljubljana - Črnuče
00050000-55c4-68d1-48d7-2c1e71e3341e	1261	Ljubljana - Dobrunje
00050000-55c4-68d1-d643-c2d181221d89	1260	Ljubljana - Polje
00050000-55c4-68d1-0427-ca072fb501b5	1210	Ljubljana - Šentvid
00050000-55c4-68d1-a345-fa8c8e9e1dc8	1211	Ljubljana - Šmartno
00050000-55c4-68d1-fa9d-3d74b8a87d9d	3333	Ljubno ob Savinji
00050000-55c4-68d1-bfb7-f44320b0d5e0	9240	Ljutomer
00050000-55c4-68d1-2065-c822cb9e62a5	3215	Loče
00050000-55c4-68d1-6f45-dc879870520f	5231	Log pod Mangartom
00050000-55c4-68d1-a95f-4de9734ff38e	1358	Log pri Brezovici
00050000-55c4-68d1-9f40-8e8441f7d4d2	1370	Logatec
00050000-55c4-68d1-9d52-a02669b167cf	1371	Logatec
00050000-55c4-68d1-ac63-756eea489e34	1434	Loka pri Zidanem Mostu
00050000-55c4-68d1-8d63-6b9787cb18cf	3223	Loka pri Žusmu
00050000-55c4-68d1-e53f-2f8eab0be9f4	6219	Lokev
00050000-55c4-68d1-f23d-fd5e3ff1cec1	1318	Loški Potok
00050000-55c4-68d1-2340-a2c8ed4a5bc2	2324	Lovrenc na Dravskem polju
00050000-55c4-68d1-f99d-2742490ff660	2344	Lovrenc na Pohorju
00050000-55c4-68d1-32b3-77b7a4b68e76	3334	Luče
00050000-55c4-68d1-ed4d-659525e587fc	1225	Lukovica
00050000-55c4-68d1-6cc5-b424aa9a7b23	9202	Mačkovci
00050000-55c4-68d1-3d07-2fc6b6a0148d	2322	Majšperk
00050000-55c4-68d1-4430-dd46551c0f0f	2321	Makole
00050000-55c4-68d1-9e48-49f4cbda9c62	9243	Mala Nedelja
00050000-55c4-68d1-df35-b8a3d94e00e3	2229	Malečnik
00050000-55c4-68d1-4d7d-f293c6bdad0e	6273	Marezige
00050000-55c4-68d1-d25e-006a6a8c7363	2000	Maribor 
00050000-55c4-68d1-645f-33b096e58659	2001	Maribor - poštni predali
00050000-55c4-68d1-c47c-fc060817bebc	2206	Marjeta na Dravskem polju
00050000-55c4-68d1-75e3-f649653c6d8d	2281	Markovci
00050000-55c4-68d1-6c12-4cad12826779	9221	Martjanci
00050000-55c4-68d1-f8e2-1a9d4f1b7f0e	6242	Materija
00050000-55c4-68d1-891c-68d87d82600a	4211	Mavčiče
00050000-55c4-68d1-e282-cd8844b59c65	1215	Medvode
00050000-55c4-68d1-b566-4431fb9a62f9	1234	Mengeš
00050000-55c4-68d1-42cf-487881123bec	8330	Metlika
00050000-55c4-68d1-e7ae-26bfc1bc9356	2392	Mežica
00050000-55c4-68d1-7b70-1fb900682998	2204	Miklavž na Dravskem polju
00050000-55c4-68d1-608f-384afb172ed7	2275	Miklavž pri Ormožu
00050000-55c4-68d1-b3c6-3ee6b9680fee	5291	Miren
00050000-55c4-68d1-cd7b-05468c60d41a	8233	Mirna
00050000-55c4-68d1-ae9c-7422d70d19b8	8216	Mirna Peč
00050000-55c4-68d1-c747-bf9959eda0be	2382	Mislinja
00050000-55c4-68d1-21d8-6b22abf8b7ed	4281	Mojstrana
00050000-55c4-68d1-6cb0-b286482cbaed	8230	Mokronog
00050000-55c4-68d1-dbb3-a45153f08ee4	1251	Moravče
00050000-55c4-68d1-9664-c05c3f77d8ca	9226	Moravske Toplice
00050000-55c4-68d1-8376-7e52310f1dd3	5216	Most na Soči
00050000-55c4-68d1-3d0f-af32084f5a13	1221	Motnik
00050000-55c4-68d1-97b6-c7cd88326ec7	3330	Mozirje
00050000-55c4-68d1-a7ae-55301ceb4a93	9000	Murska Sobota 
00050000-55c4-68d1-e46d-7f5bf7a42b61	9001	Murska Sobota - poštni predali
00050000-55c4-68d1-2d0f-132133a32a37	2366	Muta
00050000-55c4-68d1-ab48-4d6c3de40f88	4202	Naklo
00050000-55c4-68d1-38b7-d2e225e2338d	3331	Nazarje
00050000-55c4-68d1-79b3-1e2b68192b7b	1357	Notranje Gorice
00050000-55c4-68d1-4ba4-fbcebcfcd29d	3203	Nova Cerkev
00050000-55c4-68d1-9c98-840702949b13	5000	Nova Gorica 
00050000-55c4-68d1-9e90-af8c57ac851a	5001	Nova Gorica - poštni predali
00050000-55c4-68d1-0b57-1c14b2750bfb	1385	Nova vas
00050000-55c4-68d1-c490-f129e71c4c2f	8000	Novo mesto
00050000-55c4-68d1-e6db-029090d73bf3	8001	Novo mesto - poštni predali
00050000-55c4-68d1-041e-60add4abd24a	6243	Obrov
00050000-55c4-68d1-5cca-edf4c9aaec63	9233	Odranci
00050000-55c4-68d1-1650-f44cfc135694	2317	Oplotnica
00050000-55c4-68d1-df5d-c928489353cc	2312	Orehova vas
00050000-55c4-68d1-4bb5-0113dc740fe5	2270	Ormož
00050000-55c4-68d1-016b-16f161017bc7	1316	Ortnek
00050000-55c4-68d1-343d-0f815b4a60f2	1337	Osilnica
00050000-55c4-68d1-4c8f-91041567d0f1	8222	Otočec
00050000-55c4-68d1-347d-0994acaddc10	2361	Ožbalt
00050000-55c4-68d1-662a-be6c2bbbb4ea	2231	Pernica
00050000-55c4-68d1-6c5c-f3c4ad16238e	2211	Pesnica pri Mariboru
00050000-55c4-68d1-2586-b32dc8d0c2d1	9203	Petrovci
00050000-55c4-68d1-fd44-dfc23fd72f59	3301	Petrovče
00050000-55c4-68d1-6ce1-daf0c4f6b980	6330	Piran/Pirano
00050000-55c4-68d1-7c37-5ff952a4ead8	8255	Pišece
00050000-55c4-68d1-6973-875c75d305a2	6257	Pivka
00050000-55c4-68d1-ac72-973aaa69235e	6232	Planina
00050000-55c4-68d1-0f2b-658690d5bc7f	3225	Planina pri Sevnici
00050000-55c4-68d1-8df9-9848f3f89406	6276	Pobegi
00050000-55c4-68d1-2e7f-ec6dc8ddac64	8312	Podbočje
00050000-55c4-68d1-7e35-e69d4e9347f8	5243	Podbrdo
00050000-55c4-68d1-d912-ec1b6bff86d5	3254	Podčetrtek
00050000-55c4-68d1-2294-1177ce531fb2	2273	Podgorci
00050000-55c4-68d1-a956-ddd8a7d32910	6216	Podgorje
00050000-55c4-68d1-11d0-f976f60c26bb	2381	Podgorje pri Slovenj Gradcu
00050000-55c4-68d1-e9f5-1130be3a350d	6244	Podgrad
00050000-55c4-68d1-ca30-c2328a72cac7	1414	Podkum
00050000-55c4-68d1-6a69-5bbca6d293c1	2286	Podlehnik
00050000-55c4-68d1-a149-266cb84539e1	5272	Podnanos
00050000-55c4-68d1-2178-8cf571192a02	4244	Podnart
00050000-55c4-68d1-6e89-dc3351e48595	3241	Podplat
00050000-55c4-68d1-268a-62ab0d1da5df	3257	Podsreda
00050000-55c4-68d1-abe4-734c909387ce	2363	Podvelka
00050000-55c4-68d1-73a3-67a1c719bf25	2208	Pohorje
00050000-55c4-68d1-275b-ccf446057ab2	2257	Polenšak
00050000-55c4-68d1-0ba4-7a5bc0e435fa	1355	Polhov Gradec
00050000-55c4-68d1-d748-a3b195929fa6	4223	Poljane nad Škofjo Loko
00050000-55c4-68d1-05f5-20ff7a9e5deb	2319	Poljčane
00050000-55c4-68d1-901f-3caf6c748e49	1272	Polšnik
00050000-55c4-68d1-978c-ce1e6a679cc0	3313	Polzela
00050000-55c4-68d1-9ccf-52a530def05d	3232	Ponikva
00050000-55c4-68d1-8f65-cc29e9777f6d	6320	Portorož/Portorose
00050000-55c4-68d1-951b-bb55160db3a7	6230	Postojna
00050000-55c4-68d1-04bc-dff7078b6d16	2331	Pragersko
00050000-55c4-68d1-a704-16026205b98b	3312	Prebold
00050000-55c4-68d1-5378-e1621e3b4ed4	4205	Preddvor
00050000-55c4-68d1-d880-a04213221cf5	6255	Prem
00050000-55c4-68d1-6006-0d85bc503690	1352	Preserje
00050000-55c4-68d1-d2ec-6af29c3178f4	6258	Prestranek
00050000-55c4-68d1-1ab7-dfa71a1c4e36	2391	Prevalje
00050000-55c4-68d1-b18c-a21bc8903289	3262	Prevorje
00050000-55c4-68d1-4a06-5f3e8e07500d	1276	Primskovo 
00050000-55c4-68d1-ebac-bcb87da7501d	3253	Pristava pri Mestinju
00050000-55c4-68d1-13db-895098309488	9207	Prosenjakovci/Partosfalva
00050000-55c4-68d1-ea6e-0255a7d03cb8	5297	Prvačina
00050000-55c4-68d1-2605-57a541f5a391	2250	Ptuj
00050000-55c4-68d1-c0a0-d50026773819	2323	Ptujska Gora
00050000-55c4-68d1-9c80-fc178c958c75	9201	Puconci
00050000-55c4-68d1-14c1-48e60604ac2e	2327	Rače
00050000-55c4-68d1-e5a1-dec19999e0ef	1433	Radeče
00050000-55c4-68d1-cb4f-615cdd631bcd	9252	Radenci
00050000-55c4-68d1-fea0-b2bbf7b7d81e	2360	Radlje ob Dravi
00050000-55c4-68d1-0798-d695577cb048	1235	Radomlje
00050000-55c4-68d1-b589-b43c357d9a50	4240	Radovljica
00050000-55c4-68d1-04c6-ac2501340af2	8274	Raka
00050000-55c4-68d1-d306-2f47fffe700a	1381	Rakek
00050000-55c4-68d1-786e-0dd50dd1c846	4283	Rateče - Planica
00050000-55c4-68d1-3a78-cb0bdf443df5	2390	Ravne na Koroškem
00050000-55c4-68d1-d8d1-302d01b6ddc4	9246	Razkrižje
00050000-55c4-68d1-2e81-10ee26ae5a71	3332	Rečica ob Savinji
00050000-55c4-68d1-7f3b-3495c57f6497	5292	Renče
00050000-55c4-68d1-543d-d368f46fa145	1310	Ribnica
00050000-55c4-68d1-1736-e8d84dde2ef7	2364	Ribnica na Pohorju
00050000-55c4-68d1-afa5-8a101e27bafd	3272	Rimske Toplice
00050000-55c4-68d1-db46-ed8c4e07fb95	1314	Rob
00050000-55c4-68d1-1388-952e5c472387	5215	Ročinj
00050000-55c4-68d1-629e-48285652a201	3250	Rogaška Slatina
00050000-55c4-68d1-cda4-5cb8034fdc6f	9262	Rogašovci
00050000-55c4-68d1-6570-f04cd1d52ecd	3252	Rogatec
00050000-55c4-68d1-05c6-31c6f93c5921	1373	Rovte
00050000-55c4-68d1-c3da-c2c0fdc07a5f	2342	Ruše
00050000-55c4-68d1-c561-4223a16e8bbb	1282	Sava
00050000-55c4-68d1-2556-a1913c512ca6	6333	Sečovlje/Sicciole
00050000-55c4-68d1-4e29-b9e161d7556f	4227	Selca
00050000-55c4-68d1-81e4-d20eb977d0b8	2352	Selnica ob Dravi
00050000-55c4-68d1-e35b-b8d0e172c1f0	8333	Semič
00050000-55c4-68d1-2254-53154fc705ce	8281	Senovo
00050000-55c4-68d1-7a31-7b000c02b9d0	6224	Senožeče
00050000-55c4-68d1-cd2c-254610b7670b	8290	Sevnica
00050000-55c4-68d1-06ba-f91deede6c63	6210	Sežana
00050000-55c4-68d1-a419-c91c842fd7d9	2214	Sladki Vrh
00050000-55c4-68d1-a6e3-7c3320951042	5283	Slap ob Idrijci
00050000-55c4-68d1-118a-9425bb389185	2380	Slovenj Gradec
00050000-55c4-68d1-705b-65a7d0c5aec2	2310	Slovenska Bistrica
00050000-55c4-68d1-edd0-5cc76cc27e65	3210	Slovenske Konjice
00050000-55c4-68d1-d6e4-e13c5f4ad311	1216	Smlednik
00050000-55c4-68d1-4495-5cb68fb95cb6	5232	Soča
00050000-55c4-68d1-cc94-685c7180f015	1317	Sodražica
00050000-55c4-68d1-c150-f99e4388ac51	3335	Solčava
00050000-55c4-68d1-5dda-abf3c7576d64	5250	Solkan
00050000-55c4-68d1-ea4d-69ee0c5890b9	4229	Sorica
00050000-55c4-68d1-f060-5220419d6130	4225	Sovodenj
00050000-55c4-68d1-2df3-514ffc51c4cd	5281	Spodnja Idrija
00050000-55c4-68d1-98a6-dd175f8675c4	2241	Spodnji Duplek
00050000-55c4-68d1-45e6-d763aad78832	9245	Spodnji Ivanjci
00050000-55c4-68d1-08ce-3b7553cfb583	2277	Središče ob Dravi
00050000-55c4-68d1-8695-19e49b9c7ae8	4267	Srednja vas v Bohinju
00050000-55c4-68d1-0746-bb44ea9f336f	8256	Sromlje 
00050000-55c4-68d1-0642-3395f8810b51	5224	Srpenica
00050000-55c4-68d1-0063-1e54bb2aab10	1242	Stahovica
00050000-55c4-68d1-2297-51bbe19413a0	1332	Stara Cerkev
00050000-55c4-68d1-1b94-c6f3267d1065	8342	Stari trg ob Kolpi
00050000-55c4-68d1-d262-6e9745716fe8	1386	Stari trg pri Ložu
00050000-55c4-68d1-e217-ff55c8bd478e	2205	Starše
00050000-55c4-68d1-d373-daf1022a3fa7	2289	Stoperce
00050000-55c4-68d1-20dc-08e28d36d459	8322	Stopiče
00050000-55c4-68d1-eb25-49f883cc3f2e	3206	Stranice
00050000-55c4-68d1-ca29-818c3782d0a0	8351	Straža
00050000-55c4-68d1-74bc-853cfa9bf639	1313	Struge
00050000-55c4-68d1-0a2e-fae89ef6d850	8293	Studenec
00050000-55c4-68d1-fdf6-d1310a2fde6a	8331	Suhor
00050000-55c4-68d1-fd4f-9ff38832f40a	2233	Sv. Ana v Slovenskih goricah
00050000-55c4-68d1-575d-3be0ae4a1143	2235	Sv. Trojica v Slovenskih goricah
00050000-55c4-68d1-b189-a7bf15193a53	2353	Sveti Duh na Ostrem Vrhu
00050000-55c4-68d1-b162-bd209a03ec52	9244	Sveti Jurij ob Ščavnici
00050000-55c4-68d1-aa02-851aa6395aa9	3264	Sveti Štefan
00050000-55c4-68d1-1888-80ef3b432895	2258	Sveti Tomaž
00050000-55c4-68d1-3208-1f37d9906a88	9204	Šalovci
00050000-55c4-68d1-4a93-971437bec37e	5261	Šempas
00050000-55c4-68d1-1a68-7a9470881da4	5290	Šempeter pri Gorici
00050000-55c4-68d1-0187-d79cf159ec1c	3311	Šempeter v Savinjski dolini
00050000-55c4-68d1-6199-378b4929108d	4208	Šenčur
00050000-55c4-68d1-4b12-0071e74774aa	2212	Šentilj v Slovenskih goricah
00050000-55c4-68d1-fab1-f40a45c6f5f7	8297	Šentjanž
00050000-55c4-68d1-6b8e-d391241aa685	2373	Šentjanž pri Dravogradu
00050000-55c4-68d1-ebcc-fd6a5d355dc1	8310	Šentjernej
00050000-55c4-68d1-9271-69752ff716fb	3230	Šentjur
00050000-55c4-68d1-b459-1efa48865b7c	3271	Šentrupert
00050000-55c4-68d1-e150-582ffe52e63e	8232	Šentrupert
00050000-55c4-68d1-cf64-27ddc6431dd4	1296	Šentvid pri Stični
00050000-55c4-68d1-1458-a771fd1abe53	8275	Škocjan
00050000-55c4-68d1-9c32-8d5944705147	6281	Škofije
00050000-55c4-68d1-287c-0b89e073b9f7	4220	Škofja Loka
00050000-55c4-68d1-2476-4f9e5b2f0e4c	3211	Škofja vas
00050000-55c4-68d1-4d5c-1e3592cc7708	1291	Škofljica
00050000-55c4-68d1-ad4a-3f563bf8d089	6274	Šmarje
00050000-55c4-68d1-8cb0-6d964735c7ef	1293	Šmarje - Sap
00050000-55c4-68d1-3a17-f4f2d058438a	3240	Šmarje pri Jelšah
00050000-55c4-68d1-4e5e-9b06d53a9970	8220	Šmarješke Toplice
00050000-55c4-68d1-b407-f6324eca4494	2315	Šmartno na Pohorju
00050000-55c4-68d1-ea08-9d225a20727f	3341	Šmartno ob Dreti
00050000-55c4-68d1-01a9-11e2fc60a9e1	3327	Šmartno ob Paki
00050000-55c4-68d1-18ab-09a845d2dccb	1275	Šmartno pri Litiji
00050000-55c4-68d1-4488-54506cb1d804	2383	Šmartno pri Slovenj Gradcu
00050000-55c4-68d1-75c4-a68e9abdcafe	3201	Šmartno v Rožni dolini
00050000-55c4-68d1-ac60-12ae49c45958	3325	Šoštanj
00050000-55c4-68d1-ea31-a7557a12dc7c	6222	Štanjel
00050000-55c4-68d1-220f-b457428d839a	3220	Štore
00050000-55c4-68d1-dde1-b3b5c7b617f5	3304	Tabor
00050000-55c4-68d1-759e-f5fc58e8aa69	3221	Teharje
00050000-55c4-68d1-c2c8-750697064000	9251	Tišina
00050000-55c4-68d1-17dd-61413fd7e2b4	5220	Tolmin
00050000-55c4-68d1-65b2-7a0cd5ab4439	3326	Topolšica
00050000-55c4-68d1-eeb0-3a017ed4a231	2371	Trbonje
00050000-55c4-68d1-326c-bfde7f9d2ac3	1420	Trbovlje
00050000-55c4-68d1-edfe-5dbeb15b32ec	8231	Trebelno 
00050000-55c4-68d1-6bc8-7a351a490025	8210	Trebnje
00050000-55c4-68d1-aeea-3b33279e4463	5252	Trnovo pri Gorici
00050000-55c4-68d1-79e1-896e0cd70907	2254	Trnovska vas
00050000-55c4-68d1-6e8e-6073da0d0e32	1222	Trojane
00050000-55c4-68d1-8b69-3fc21548dcb8	1236	Trzin
00050000-55c4-68d1-c84e-754cd8f100f7	4290	Tržič
00050000-55c4-68d1-36d2-970624152b0b	8295	Tržišče
00050000-55c4-68d1-c300-ffaa76766236	1311	Turjak
00050000-55c4-68d1-caa4-0fbeccd60943	9224	Turnišče
00050000-55c4-68d1-4011-293a8ec5706f	8323	Uršna sela
00050000-55c4-68d1-d688-3ec44e264bcb	1252	Vače
00050000-55c4-68d1-4ea1-6a076f527d1b	3320	Velenje 
00050000-55c4-68d1-cb46-a77d801d6f20	3322	Velenje - poštni predali
00050000-55c4-68d1-f807-fab7a0671047	8212	Velika Loka
00050000-55c4-68d1-4b19-4ef04b47524b	2274	Velika Nedelja
00050000-55c4-68d1-aca9-8f68406cdd24	9225	Velika Polana
00050000-55c4-68d1-0a43-52b49849f782	1315	Velike Lašče
00050000-55c4-68d1-03eb-dc44502ecf58	8213	Veliki Gaber
00050000-55c4-68d1-8902-0456842b2d04	9241	Veržej
00050000-55c4-68d1-241c-f28dbbbceee3	1312	Videm - Dobrepolje
00050000-55c4-68d1-e9ab-996c0da131b8	2284	Videm pri Ptuju
00050000-55c4-68d1-b342-685737ef9b5d	8344	Vinica
00050000-55c4-68d1-cc66-688a513ae8ef	5271	Vipava
00050000-55c4-68d1-d545-1aa05167ded2	4212	Visoko
00050000-55c4-68d1-8886-d7bc88dc66b1	1294	Višnja Gora
00050000-55c4-68d1-9ba4-8df069cbafd9	3205	Vitanje
00050000-55c4-68d1-30ca-98e5bcb9bae0	2255	Vitomarci
00050000-55c4-68d1-e9bf-4d5eb2806853	1217	Vodice
00050000-55c4-68d1-efeb-a043a250cc21	3212	Vojnik\t
00050000-55c4-68d1-01f6-b236120ff9c5	5293	Volčja Draga
00050000-55c4-68d1-5ea2-c53115dd8096	2232	Voličina
00050000-55c4-68d1-dae4-bfcea7aec6ce	3305	Vransko
00050000-55c4-68d1-e23a-0d49a764d205	6217	Vremski Britof
00050000-55c4-68d1-7381-65429b9b2ad1	1360	Vrhnika
00050000-55c4-68d1-9d54-14b2ef770057	2365	Vuhred
00050000-55c4-68d1-d3e9-c8ac05b5d696	2367	Vuzenica
00050000-55c4-68d1-4ee3-45e818ec3428	8292	Zabukovje 
00050000-55c4-68d1-9f71-0aef336800ea	1410	Zagorje ob Savi
00050000-55c4-68d1-91a9-7b904a3fddfa	1303	Zagradec
00050000-55c4-68d1-ee1e-8772bf0d90e8	2283	Zavrč
00050000-55c4-68d1-56b6-0ff7c70b105d	8272	Zdole 
00050000-55c4-68d1-14d4-3712b4f57444	4201	Zgornja Besnica
00050000-55c4-68d1-25c2-30a029810a86	2242	Zgornja Korena
00050000-55c4-68d1-6caa-1230d95eb7ff	2201	Zgornja Kungota
00050000-55c4-68d1-de68-a814f03a6e30	2316	Zgornja Ložnica
00050000-55c4-68d1-3c79-87f6a6541411	2314	Zgornja Polskava
00050000-55c4-68d1-62e2-ae3c88eada10	2213	Zgornja Velka
00050000-55c4-68d1-ea0e-7468ac8be2d2	4247	Zgornje Gorje
00050000-55c4-68d1-658b-1bad291c6612	4206	Zgornje Jezersko
00050000-55c4-68d1-ed04-9937d96cd97b	2285	Zgornji Leskovec
00050000-55c4-68d1-1807-2b023e249bb1	1432	Zidani Most
00050000-55c4-68d1-3bf3-b597cd04265b	3214	Zreče
00050000-55c4-68d1-0a95-7b9efd72c111	4209	Žabnica
00050000-55c4-68d1-45c1-b4a7026aeb11	3310	Žalec
00050000-55c4-68d1-bb66-d4e29daf8cf0	4228	Železniki
00050000-55c4-68d1-5e31-c16671bc111a	2287	Žetale
00050000-55c4-68d1-d0af-5b78e53ae4e5	4226	Žiri
00050000-55c4-68d1-0076-a752f0c0d1d0	4274	Žirovnica
00050000-55c4-68d1-0b45-406a6795735e	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12382100)
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
-- TOC entry 3003 (class 0 OID 12381907)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12381985)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12382112)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12382443)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12382453)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c4-68d2-dfa1-2db55f6f1aeb	00080000-55c4-68d2-6371-ac1648758d17	0900	AK
00190000-55c4-68d2-07df-716f212e7107	00080000-55c4-68d2-1941-dac8ba4dcd4a	0987	AK
00190000-55c4-68d2-f019-3a60ea9e4557	00080000-55c4-68d2-5e27-61f4d1c9b388	0989	AK
00190000-55c4-68d2-b616-3b63c8565dc4	00080000-55c4-68d2-9373-3d9f35874485	0986	AK
00190000-55c4-68d2-b92a-8403bdcc6d60	00080000-55c4-68d2-7f40-604de98f8d8b	0984	AK
00190000-55c4-68d2-9fc3-bcc27c8be5c2	00080000-55c4-68d2-45d7-334901373224	0983	AK
00190000-55c4-68d2-da18-5629de13a925	00080000-55c4-68d2-3691-b726a627bf6a	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12382399)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c4-68d2-d8a9-36a6f6830100	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3048 (class 0 OID 12382461)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12382141)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c4-68d2-2db2-4afb046a3562	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c4-68d2-82d0-687109dffbc5	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c4-68d2-1f6a-da6875c153bc	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c4-68d2-94ce-f0a9a9cf12fe	0004	Mali oder	t	24	Mali oder 
00220000-55c4-68d2-e95f-d55db54fbfda	0005	Komorni oder	t	15	Komorni oder
00220000-55c4-68d2-fb16-efb487885bec	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c4-68d2-bd3a-181eafb995d2	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12382085)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12382075)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12382260)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12382209)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12381779)
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
-- TOC entry 3028 (class 0 OID 12382151)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12381817)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c4-68d0-4620-08b88e290f75	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c4-68d0-4394-628213742cbd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c4-68d0-e186-0ccb872a649e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c4-68d0-88b7-120d9a3b3072	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c4-68d0-edf1-ae8b25bb69ce	planer	Planer dogodkov v koledarju	t
00020000-55c4-68d0-13e5-adf3a02333cf	kadrovska	Kadrovska služba	t
00020000-55c4-68d0-089d-4f2920d31749	arhivar	Ažuriranje arhivalij	t
00020000-55c4-68d0-b5f1-83f407d2690f	igralec	Igralec	t
00020000-55c4-68d0-95f8-522f9b9028a9	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c4-68d2-bf54-36de210901e6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12381801)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c4-68d1-85af-40f82623823a	00020000-55c4-68d0-e186-0ccb872a649e
00010000-55c4-68d1-cb5a-f2b7c3da75fe	00020000-55c4-68d0-e186-0ccb872a649e
00010000-55c4-68d2-34fc-72ea40db2be3	00020000-55c4-68d2-bf54-36de210901e6
\.


--
-- TOC entry 3030 (class 0 OID 12382165)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12382106)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12382052)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12382502)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c4-68d1-c591-bc47c2c42b9c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c4-68d1-56bb-ab32be624ad7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c4-68d1-8701-5c9efc2944c1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c4-68d1-d555-7e8168846231	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c4-68d1-9e6c-060654c607e7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12382494)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c4-68d1-e2bc-9b4fb6c470a5	00230000-55c4-68d1-d555-7e8168846231	popa
00240000-55c4-68d1-eb26-060a11ab3c1a	00230000-55c4-68d1-d555-7e8168846231	oseba
00240000-55c4-68d1-6e0b-b4402371a55a	00230000-55c4-68d1-d555-7e8168846231	sezona
00240000-55c4-68d1-7ff6-0abec31560bf	00230000-55c4-68d1-56bb-ab32be624ad7	prostor
00240000-55c4-68d1-5e16-4031898bd66f	00230000-55c4-68d1-d555-7e8168846231	besedilo
00240000-55c4-68d1-3788-8e0148937245	00230000-55c4-68d1-d555-7e8168846231	uprizoritev
00240000-55c4-68d1-4f29-4ebff0c2bb0b	00230000-55c4-68d1-d555-7e8168846231	funkcija
00240000-55c4-68d1-4687-c59a391b4bb0	00230000-55c4-68d1-d555-7e8168846231	tipfunkcije
00240000-55c4-68d1-149e-1344fffaec64	00230000-55c4-68d1-d555-7e8168846231	alternacija
00240000-55c4-68d1-1fb4-370f25f8dacc	00230000-55c4-68d1-c591-bc47c2c42b9c	pogodba
00240000-55c4-68d1-1aae-b268e57a01a5	00230000-55c4-68d1-d555-7e8168846231	zaposlitev
00240000-55c4-68d1-b8dd-9239085302f3	00230000-55c4-68d1-c591-bc47c2c42b9c	programdela
00240000-55c4-68d1-3ff4-1dd96820f270	00230000-55c4-68d1-d555-7e8168846231	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12382489)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12382219)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c4-68d2-5507-6c2a145d19aa	000e0000-55c4-68d2-8d19-cfc4479237f6	00080000-55c4-68d2-5f82-532cd302b7eb	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c4-68d2-c3e9-40dba9eecbf2	000e0000-55c4-68d2-8d19-cfc4479237f6	00080000-55c4-68d2-5f82-532cd302b7eb	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c4-68d2-edd6-38e7aef1ebf8	000e0000-55c4-68d2-8d19-cfc4479237f6	00080000-55c4-68d2-068a-40ff19fb7489	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c4-68d2-ce67-150f7285844d	000e0000-55c4-68d2-8d19-cfc4479237f6	00080000-55c4-68d2-068a-40ff19fb7489	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12381879)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12382062)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c4-68d2-74e0-ed7f9d7d60ad	00180000-55c4-68d2-3670-0c3a87bf4a9b	000c0000-55c4-68d2-7f1a-f36b8beeedac	00090000-55c4-68d2-68c7-1f742f0668c6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-68d2-d695-576fd59a4806	00180000-55c4-68d2-3670-0c3a87bf4a9b	000c0000-55c4-68d2-5e0e-a031a85f157b	00090000-55c4-68d2-7de0-9b3bc0208422	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-68d2-d68d-dbaeda93cb02	00180000-55c4-68d2-3670-0c3a87bf4a9b	000c0000-55c4-68d2-87be-50e060f79d4d	00090000-55c4-68d2-41d6-dfb9cf9b45c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-68d2-c15c-2f00503490c6	00180000-55c4-68d2-3670-0c3a87bf4a9b	000c0000-55c4-68d2-ec54-54cfbf8a482a	00090000-55c4-68d2-b023-4b93d4933c52	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-68d2-6dce-020467842fb1	00180000-55c4-68d2-3670-0c3a87bf4a9b	000c0000-55c4-68d2-8cbd-1c648a8c17b8	00090000-55c4-68d2-3fc9-9e4a93e386c0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-68d2-fb22-c1630b939c86	00180000-55c4-68d2-a08b-bbd479975bd1	\N	00090000-55c4-68d2-3fc9-9e4a93e386c0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12382249)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c4-68d1-d69e-8e84f82d4992	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c4-68d1-e9d3-f7512597af78	Priredba	Priredba	Priredba	umetnik
000f0000-55c4-68d1-e7e4-2cf474d61613	Prevod	Prevod	Prevod	umetnik
000f0000-55c4-68d1-b063-392a039c605e	Režija	Režija	Režija	umetnik
000f0000-55c4-68d1-6665-8a21ac84a193	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c4-68d1-0390-10ce289f6e3a	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c4-68d1-3d79-ed5531320f62	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c4-68d1-4a7c-ef8e8d83a025	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c4-68d1-7dbe-318dc327ff9e	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c4-68d1-6b02-e14204bf57cc	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c4-68d1-3b57-7dfc456e300c	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c4-68d1-3d6c-6718c971aa75	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c4-68d1-353a-47afcada2dd1	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c4-68d1-eb1d-8115e8c6c365	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c4-68d1-c689-1ef49871bfb6	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c4-68d1-e73f-fc8e9e3c2ed4	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c4-68d1-97e2-fd9c8156857d	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c4-68d1-d954-43b5a68d4dfb	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12382471)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c4-68d1-b80b-9a31e1e27679	01	Velika predstava	f	1.00	1.00
002b0000-55c4-68d1-23df-d70f64ad224e	02	Mala predstava	f	0.50	0.50
002b0000-55c4-68d1-f81e-5fbac7b9bb2c	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c4-68d1-473f-d6f042a3e47f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c4-68d1-05f8-b1d78b1f1b13	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12381942)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12381788)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c4-68d1-cb5a-f2b7c3da75fe	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROcpgMFYkkFgB9vhPUrm4z5n4eKzI9cfi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-1b40-cb595c5fa6e2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-955d-cb8aae569e31	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-963a-4f320e11f5f5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-faf6-2d386afadead	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-0867-5f73c103a7d2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-b80b-fed076ef49b4	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-c417-4ec80f740b3e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-ebba-672f07633715	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-83a6-a949491df75f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c4-68d2-34fc-72ea40db2be3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c4-68d1-85af-40f82623823a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12382297)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c4-68d2-0231-841d8f78384b	00160000-55c4-68d2-d264-055ec814cf5a	00150000-55c4-68d1-aee3-6e0923a8c2d5	00140000-55c4-68d0-fed4-de4d60f8c6fb	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c4-68d2-e95f-d55db54fbfda
000e0000-55c4-68d2-8d19-cfc4479237f6	00160000-55c4-68d2-db63-cd3f8d95f71b	00150000-55c4-68d1-2519-b9b033338468	00140000-55c4-68d0-acd9-cfcca7354092	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c4-68d2-fb16-efb487885bec
000e0000-55c4-68d2-8ede-a2abf2d09f93	\N	00150000-55c4-68d1-2519-b9b033338468	00140000-55c4-68d0-acd9-cfcca7354092	00190000-55c4-68d2-07df-716f212e7107	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c4-68d2-e95f-d55db54fbfda
000e0000-55c4-68d2-d0e0-939798554d6d	\N	00150000-55c4-68d1-2519-b9b033338468	00140000-55c4-68d0-acd9-cfcca7354092	00190000-55c4-68d2-07df-716f212e7107	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c4-68d2-e95f-d55db54fbfda
000e0000-55c4-68d2-decf-aa9f60790c0a	\N	00150000-55c4-68d1-2519-b9b033338468	00140000-55c4-68d0-acd9-cfcca7354092	00190000-55c4-68d2-07df-716f212e7107	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c4-68d2-2db2-4afb046a3562
\.


--
-- TOC entry 3011 (class 0 OID 12382004)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c4-68d2-5432-93811225491d	000e0000-55c4-68d2-8d19-cfc4479237f6	1	
00200000-55c4-68d2-f71a-5ff9ead63477	000e0000-55c4-68d2-8d19-cfc4479237f6	2	
\.


--
-- TOC entry 3026 (class 0 OID 12382133)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12382541)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12382513)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12382553)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12382202)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c4-68d2-722a-2d4d73584ace	00090000-55c4-68d2-7de0-9b3bc0208422	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-68d2-097e-be4c8e90a71b	00090000-55c4-68d2-41d6-dfb9cf9b45c8	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-68d2-96bb-bcc1cdfb4698	00090000-55c4-68d2-d803-3745e07165e0	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-68d2-797c-2a681486b9fd	00090000-55c4-68d2-b88a-634589a564cf	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-68d2-a03c-31dd845be7e1	00090000-55c4-68d2-68c7-1f742f0668c6	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-68d2-d514-2335ccc47b54	00090000-55c4-68d2-5f6d-118fdb9fa065	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12382036)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12382287)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c4-68d0-fed4-de4d60f8c6fb	01	Drama	drama (SURS 01)
00140000-55c4-68d0-a31d-c70b0abc9b73	02	Opera	opera (SURS 02)
00140000-55c4-68d0-724e-00add75ae96f	03	Balet	balet (SURS 03)
00140000-55c4-68d0-c1da-a4202c002ca3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c4-68d0-4cf7-e2a1b2974b61	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c4-68d0-acd9-cfcca7354092	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c4-68d0-7ceb-910ab0d27e0c	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12382192)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c4-68d1-dbf8-27330a4a29d3	01	Opera	opera
00150000-55c4-68d1-5788-006cfd61f23e	02	Opereta	opereta
00150000-55c4-68d1-c9ad-2fdbba906a25	03	Balet	balet
00150000-55c4-68d1-5205-d08892978bf8	04	Plesne prireditve	plesne prireditve
00150000-55c4-68d1-a4b7-2d6cb45ad503	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c4-68d1-7e25-5f25567b7d6f	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c4-68d1-071e-cb6af57a4ac5	07	Biografska drama	biografska drama
00150000-55c4-68d1-aee3-6e0923a8c2d5	08	Komedija	komedija
00150000-55c4-68d1-8c9d-bff10de5c927	09	Črna komedija	črna komedija
00150000-55c4-68d1-4adf-014d6e6a3986	10	E-igra	E-igra
00150000-55c4-68d1-2519-b9b033338468	11	Kriminalka	kriminalka
00150000-55c4-68d1-3893-501d3b7a76da	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12381842)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12382344)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12382334)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12382248)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12382594)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12382026)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12382051)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12382487)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12381968)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12382393)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12382188)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12382002)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12382045)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12381982)
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
-- TOC entry 2630 (class 2606 OID 12382098)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12382570)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12382577)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12382602)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12382125)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12381940)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12381851)
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
-- TOC entry 2544 (class 2606 OID 12381875)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12381831)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12381816)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12382131)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12382164)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12382282)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12381904)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12381928)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12382104)
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
-- TOC entry 2559 (class 2606 OID 12381918)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12381989)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12382116)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12382450)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12382458)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12382441)
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
-- TOC entry 2736 (class 2606 OID 12382469)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12382148)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12382089)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12382080)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12382270)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12382216)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12381787)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12382155)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12381805)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12381825)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12382173)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12382111)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12382060)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12382511)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12382499)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12382493)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12382229)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12381884)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12382071)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12382259)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12382481)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12381953)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12381800)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12382313)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12382011)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12382139)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12382551)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12382535)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12382559)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12382207)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12382040)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12382295)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12382200)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12382033)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12382230)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12382231)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12382572)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12382571)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12381906)
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
-- TOC entry 2643 (class 1259 OID 12382132)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12382539)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12382538)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12382540)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12382537)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12382536)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12382118)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12382117)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12382012)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12382189)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12382191)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12382190)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12381984)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12381983)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12382470)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12382284)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12382285)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12382286)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12382560)
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
-- TOC entry 2697 (class 1259 OID 12382318)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12382315)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12382319)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12382317)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12382316)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12381955)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12381954)
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
-- TOC entry 2542 (class 1259 OID 12381878)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12382156)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12382046)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12381832)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12381833)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12382176)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12382175)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12382174)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12381990)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12381992)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12381991)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12382501)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12382084)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12382082)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12382081)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12382083)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12381806)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12381807)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12382140)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12382595)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12382603)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12382604)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12382105)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12382217)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12382218)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12382398)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12382397)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12382394)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12382395)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12382396)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12381920)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12381919)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12381921)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12382451)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12382452)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12382348)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12382349)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12382346)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12382347)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12382208)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12382093)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12382092)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12382090)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12382091)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12382336)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12382335)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12382442)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12382003)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12382488)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12382578)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12382579)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12381853)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12381852)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12381885)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12381886)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12382074)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12382073)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12382072)
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
-- TOC entry 2594 (class 1259 OID 12382035)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12382031)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12382028)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12382029)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12382027)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12382032)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12382030)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12381905)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12381969)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12381971)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12381970)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12381972)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12382099)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12382283)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12382314)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12381876)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12381877)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12382201)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12382512)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12381941)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12382500)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12382150)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12382149)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12382345)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12381929)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12382296)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12382552)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12382459)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12382460)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12382061)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12381826)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12382034)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 12382740)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 12382725)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 12382730)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 12382750)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 12382720)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 12382745)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12382735)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 12382895)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 12382900)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 12383070)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 12383065)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12382655)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12382835)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 12383050)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12383045)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 12383055)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 12383040)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 12383035)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 12382830)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 12382825)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12382715)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12382865)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12382875)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12382870)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 12382690)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 12382685)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12382815)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12383020)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 12382905)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12382910)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 12382915)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12383060)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 12382935)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 12382920)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 12382940)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12382930)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 12382925)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 12382680)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 12382675)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 12382640)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 12382635)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12382845)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12382755)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 12382615)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 12382620)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 12382860)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12382855)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 12382850)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 12382695)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 12382705)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12382700)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12383030)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 12382790)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 12382780)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 12382775)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 12382785)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 12382605)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 12382610)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12382840)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12383085)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 12383090)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 12383095)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12382820)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 12382885)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 12382890)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 12382995)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 12382990)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 12382975)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 12382980)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12382985)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12382665)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 12382660)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 12382670)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 12383005)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 12383010)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 12382965)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 12382970)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 12382955)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 12382960)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12382880)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 12382810)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 12382805)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 12382795)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 12382800)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 12382950)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 12382945)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12383000)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12382710)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12383015)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12383025)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 12383075)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 12383080)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 12382630)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 12382625)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 12382645)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 12382650)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 12382770)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12382765)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 12382760)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-07 10:14:11 CEST

--
-- PostgreSQL database dump complete
--

