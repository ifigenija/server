--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-07 16:14:14 CEST

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
-- TOC entry 183 (class 1259 OID 12590563)
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
-- TOC entry 228 (class 1259 OID 12591067)
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
-- TOC entry 227 (class 1259 OID 12591050)
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
-- TOC entry 221 (class 1259 OID 12590962)
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
-- TOC entry 244 (class 1259 OID 12591310)
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
-- TOC entry 197 (class 1259 OID 12590743)
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
-- TOC entry 200 (class 1259 OID 12590777)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12591212)
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
-- TOC entry 192 (class 1259 OID 12590686)
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
-- TOC entry 229 (class 1259 OID 12591080)
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
-- TOC entry 216 (class 1259 OID 12590907)
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
-- TOC entry 195 (class 1259 OID 12590723)
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
-- TOC entry 199 (class 1259 OID 12590771)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12590703)
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
-- TOC entry 205 (class 1259 OID 12590824)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12591291)
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
-- TOC entry 243 (class 1259 OID 12591303)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12591326)
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
-- TOC entry 209 (class 1259 OID 12590849)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12590660)
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
-- TOC entry 184 (class 1259 OID 12590573)
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
-- TOC entry 185 (class 1259 OID 12590584)
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
-- TOC entry 180 (class 1259 OID 12590536)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12590555)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12590856)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12590887)
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
-- TOC entry 224 (class 1259 OID 12591001)
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
-- TOC entry 187 (class 1259 OID 12590617)
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
-- TOC entry 189 (class 1259 OID 12590652)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12590830)
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
-- TOC entry 188 (class 1259 OID 12590637)
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
-- TOC entry 194 (class 1259 OID 12590715)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12590842)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12591173)
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
-- TOC entry 232 (class 1259 OID 12591183)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12591129)
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
-- TOC entry 233 (class 1259 OID 12591191)
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
-- TOC entry 212 (class 1259 OID 12590871)
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
-- TOC entry 204 (class 1259 OID 12590815)
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
-- TOC entry 203 (class 1259 OID 12590805)
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
-- TOC entry 223 (class 1259 OID 12590990)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12590939)
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
-- TOC entry 177 (class 1259 OID 12590507)
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
-- TOC entry 176 (class 1259 OID 12590505)
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
-- TOC entry 213 (class 1259 OID 12590881)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12590545)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12590529)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12590895)
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
-- TOC entry 207 (class 1259 OID 12590836)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12590782)
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
-- TOC entry 238 (class 1259 OID 12591232)
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
-- TOC entry 237 (class 1259 OID 12591224)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12591219)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12590949)
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
-- TOC entry 186 (class 1259 OID 12590609)
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
-- TOC entry 202 (class 1259 OID 12590792)
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
-- TOC entry 222 (class 1259 OID 12590979)
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
-- TOC entry 234 (class 1259 OID 12591201)
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
-- TOC entry 191 (class 1259 OID 12590672)
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
-- TOC entry 178 (class 1259 OID 12590516)
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
-- TOC entry 226 (class 1259 OID 12591027)
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
-- TOC entry 196 (class 1259 OID 12590734)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12590863)
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
-- TOC entry 240 (class 1259 OID 12591271)
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
-- TOC entry 239 (class 1259 OID 12591243)
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
-- TOC entry 241 (class 1259 OID 12591283)
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
-- TOC entry 218 (class 1259 OID 12590932)
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
-- TOC entry 198 (class 1259 OID 12590766)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12591017)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12590922)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12590510)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12590563)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12591067)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c4-bd35-184d-c1414027923e	000d0000-55c4-bd35-ef97-ad5d5f98239a	\N	00090000-55c4-bd35-77c9-8a05da7ac8ee	000b0000-55c4-bd35-c2cc-f70434139b58	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c4-bd35-955d-fe6b5d1cfd63	000d0000-55c4-bd35-6022-98cb1062e556	00100000-55c4-bd35-f0eb-3e02f60797a3	00090000-55c4-bd35-8ecc-feb0a6c65c0d	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c4-bd35-2494-c827aeac5d0a	000d0000-55c4-bd35-8139-c3f5c2761602	00100000-55c4-bd35-3df5-c2ef14d81576	00090000-55c4-bd35-7d74-c4b18118e6fd	\N	0003	t	\N	2015-08-07	\N	2	\N	\N	f	f
000c0000-55c4-bd35-d2af-0f842de645ca	000d0000-55c4-bd35-ee8d-59296d3b4f88	\N	00090000-55c4-bd35-0783-cee933866378	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c4-bd35-32c9-845b484e9e94	000d0000-55c4-bd35-9e65-d72e78d12f73	\N	00090000-55c4-bd35-cbdb-4ad1031c20c7	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c4-bd35-14a0-33a7091fe383	000d0000-55c4-bd35-6353-bfe56f3ed492	\N	00090000-55c4-bd35-75ff-a2778c89c5fa	000b0000-55c4-bd35-f0c5-5a8963780632	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c4-bd35-289d-ee44c1622ab7	000d0000-55c4-bd35-4dd9-501f9e4514b3	00100000-55c4-bd35-71dd-f55634f41118	00090000-55c4-bd35-db0c-b5a00348bdea	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c4-bd35-585d-7566fa7f3242	000d0000-55c4-bd35-025d-cafda64a8a98	\N	00090000-55c4-bd35-7a8f-a6b62ee6e9fa	000b0000-55c4-bd35-fb68-2d8c472cba18	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c4-bd35-ff73-e71d356d6fce	000d0000-55c4-bd35-4dd9-501f9e4514b3	00100000-55c4-bd35-96f6-2b9b485c9ba4	00090000-55c4-bd35-cf7f-bb8872986aec	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c4-bd35-2f38-baeab2c8d219	000d0000-55c4-bd35-4dd9-501f9e4514b3	00100000-55c4-bd35-2633-2cbcfb2eb661	00090000-55c4-bd35-491f-5b0058d8d753	\N	0010	t	\N	2015-08-07	\N	16	\N	\N	f	t
000c0000-55c4-bd35-319d-742e4ee2d9e3	000d0000-55c4-bd35-4dd9-501f9e4514b3	00100000-55c4-bd35-7cd8-7941ae1b1586	00090000-55c4-bd35-1fbd-1d6151509c81	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12591050)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12590962)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c4-bd35-0582-b0fb037b2831	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c4-bd35-c2a2-76da557861f5	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c4-bd35-6371-feffa8ad5701	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12591310)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12590743)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c4-bd35-cdfc-26dfa239da01	\N	\N	00200000-55c4-bd35-df4e-7bacf5bab41c	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c4-bd35-5bd8-6bad626a2da9	\N	\N	00200000-55c4-bd35-882e-c75057c88fa2	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c4-bd35-9a3f-3b6e73af20e7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c4-bd35-c776-0634f26eb91b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c4-bd35-2082-c6be2b6bf76c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12590777)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12591212)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12590686)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c4-bd33-f502-e3d6e40cc45a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c4-bd33-cabd-9c6d07102603	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c4-bd33-f08b-8f1cffc488c9	AL	ALB	008	Albania 	Albanija	\N
00040000-55c4-bd33-7702-73b1db79ef8f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c4-bd33-14c6-9f34783ff54d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c4-bd33-e5ac-aa145395ddbc	AD	AND	020	Andorra 	Andora	\N
00040000-55c4-bd33-a87d-8c82032085eb	AO	AGO	024	Angola 	Angola	\N
00040000-55c4-bd33-a3ca-54033d38ea94	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c4-bd33-7e9b-8b48e6706449	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c4-bd33-3669-8a201646e0be	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c4-bd33-eeb0-d388993b4270	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c4-bd33-aab7-7b14c1738e80	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c4-bd33-08ba-a1033cfd5eea	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c4-bd33-f60c-a04f5532e642	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c4-bd33-6dce-c32efd497b77	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c4-bd33-66ba-9825c574ef91	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c4-bd33-b55d-f30a933ee04d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c4-bd33-f5cb-9add5f914a36	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c4-bd33-8aee-c9c384add54b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c4-bd33-e5de-a7e5f7f7b368	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c4-bd33-15f2-c88a292bbea8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c4-bd33-a784-8f62b82e8340	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c4-bd33-ebf2-ffc441802d98	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c4-bd33-b972-440b96fc64a9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c4-bd33-d690-4bf406714655	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c4-bd33-bebd-c5eb699f3120	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c4-bd33-d923-08931e0bba10	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c4-bd33-d8dc-df2cd0f3f495	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c4-bd33-f2db-ab92d03c0ef0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c4-bd33-c1cb-922b41c8aae7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c4-bd33-ae63-1a6676ee312d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c4-bd33-8345-fec7c721f191	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c4-bd33-df6d-aa6793ecfe18	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c4-bd33-f705-f2cc29f62eb0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c4-bd33-4370-d6df81841493	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c4-bd33-863f-2d4cef2db56c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c4-bd33-c0e4-015481a8ed50	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c4-bd33-1901-d60c2a498738	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c4-bd33-637b-6cdaa10c7fc8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c4-bd33-2493-39d4112b47cf	CA	CAN	124	Canada 	Kanada	\N
00040000-55c4-bd33-03d6-c7175aaf1792	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c4-bd33-cf2d-9a82cb0e6c34	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c4-bd33-8bba-a746e97fce5e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c4-bd33-4df0-c13309ce8908	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c4-bd33-6ab3-12f895b4c468	CL	CHL	152	Chile 	Čile	\N
00040000-55c4-bd33-4d27-f2e51559a84e	CN	CHN	156	China 	Kitajska	\N
00040000-55c4-bd33-66a4-098954aac63b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c4-bd33-1ead-6bba6226013d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c4-bd33-4431-e21a7db33533	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c4-bd33-3e45-ab157bafcd65	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c4-bd33-284c-0b69aa9dda67	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c4-bd33-620a-e73dc8fee4ab	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c4-bd34-90ef-d1ab6797d746	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c4-bd34-e873-c484b0ee1019	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c4-bd34-0889-f73b3f3ff7af	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c4-bd34-3900-10c85a670bd6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c4-bd34-af7b-7ba692a528da	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c4-bd34-405b-1e0aa394c118	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c4-bd34-066e-2ee4bd1a820a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c4-bd34-ca9a-dbae4e32fbb8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c4-bd34-23de-f9725c19743a	DK	DNK	208	Denmark 	Danska	\N
00040000-55c4-bd34-7b2a-2dca1a418dd8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c4-bd34-a574-4986c41bd971	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c4-bd34-741d-f03372c9aa30	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c4-bd34-3e43-4194880e5838	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c4-bd34-9c36-e75420df4a5e	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c4-bd34-336a-904b084638bb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c4-bd34-322b-1d159bed5c32	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c4-bd34-2e27-03d4d4baa0c6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c4-bd34-d749-86bbfe454500	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c4-bd34-0ec1-28bd8b8f3d1c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c4-bd34-61fb-6b0599bbc990	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c4-bd34-3960-94aa2785a638	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c4-bd34-cb19-15200645492f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c4-bd34-e6f9-420b2eaca74d	FI	FIN	246	Finland 	Finska	\N
00040000-55c4-bd34-2e49-36e394540959	FR	FRA	250	France 	Francija	\N
00040000-55c4-bd34-3a81-df778e93f606	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c4-bd34-239d-829a94bc1901	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c4-bd34-33b3-33d2970ed340	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c4-bd34-d607-5c7a9846910d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c4-bd34-397e-3f7646820751	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c4-bd34-034a-e19ecabb5a0a	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c4-bd34-13a7-d9c179864cff	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c4-bd34-ee59-1b30583b362d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c4-bd34-48de-d61ae6a4f6e0	GH	GHA	288	Ghana 	Gana	\N
00040000-55c4-bd34-2c7b-5454ab133ad4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c4-bd34-90e8-8f31edc6f6a8	GR	GRC	300	Greece 	Grčija	\N
00040000-55c4-bd34-dff8-d962fc4c6e15	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c4-bd34-0d7e-7bf784fc5848	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c4-bd34-c41d-bd19a0f60a31	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c4-bd34-7424-acf33b22a485	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c4-bd34-e31f-23563644e955	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c4-bd34-d72a-194393dc083a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c4-bd34-610b-57b51f31ff37	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c4-bd34-87e9-ba07b474b4d5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c4-bd34-f89c-c64a65b155d6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c4-bd34-61ee-bc8b272f267a	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c4-bd34-6ad0-e8238ef6cbf2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c4-bd34-ae76-fd627c46f075	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c4-bd34-8152-a8b4644bb4f6	HN	HND	340	Honduras 	Honduras	\N
00040000-55c4-bd34-709c-f050d5fb4aed	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c4-bd34-7cac-4f52a66652ae	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c4-bd34-250d-f924a911259d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c4-bd34-a078-d4347d169726	IN	IND	356	India 	Indija	\N
00040000-55c4-bd34-65aa-e50b1c392ef7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c4-bd34-82cb-cfbc74933ee5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c4-bd34-b016-2ad7d3a15fbc	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c4-bd34-bfd3-1fdd482f7509	IE	IRL	372	Ireland 	Irska	\N
00040000-55c4-bd34-f434-98a0ea951996	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c4-bd34-f106-144e4223fc5c	IL	ISR	376	Israel 	Izrael	\N
00040000-55c4-bd34-cca8-4c764c8315d5	IT	ITA	380	Italy 	Italija	\N
00040000-55c4-bd34-17a5-76ab0a97fc2a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c4-bd34-127b-0e2fb0833488	JP	JPN	392	Japan 	Japonska	\N
00040000-55c4-bd34-4e37-eec9c94e81ae	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c4-bd34-c09c-1dc17e7921ba	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c4-bd34-d3a5-49635e72d01f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c4-bd34-ecb9-869d46d3b1a3	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c4-bd34-6a40-c892ede6d97e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c4-bd34-6042-827a33785e33	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c4-bd34-3dc2-d185c41cd0aa	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c4-bd34-5cf5-ae46c8106ac3	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c4-bd34-367a-01669c9834e3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c4-bd34-d5b7-fe7db20dba37	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c4-bd34-f838-4474449ca9a7	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c4-bd34-df1f-e5180e59f0e0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c4-bd34-3b10-b2718eae80ef	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c4-bd34-52ed-f45692bd7cb2	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c4-bd34-49c4-6906d9702cbd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c4-bd34-e6d2-41cfbfb6f22b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c4-bd34-5855-f8006c1532f0	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c4-bd34-53c5-9cd19cfb4d8f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c4-bd34-0160-cac5965ec93f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c4-bd34-9b6a-36a0f55c83b4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c4-bd34-745e-1910509807aa	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c4-bd34-e45c-385ee47c4627	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c4-bd34-1c03-fc9eb7cafa11	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c4-bd34-779e-57bd2a4d7927	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c4-bd34-32ec-d51ec81dd187	ML	MLI	466	Mali 	Mali	\N
00040000-55c4-bd34-00bf-35e4943b7c26	MT	MLT	470	Malta 	Malta	\N
00040000-55c4-bd34-fa43-79aa59476450	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c4-bd34-bbfd-ea6330e38844	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c4-bd34-989e-96c6116fc33c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c4-bd34-d1f5-922e65eee676	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c4-bd34-4d8a-29b14793d18a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c4-bd34-8edb-015eda08e22f	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c4-bd34-d99f-be3c25dc3cff	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c4-bd34-c168-81a77c605799	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c4-bd34-1f47-372dc951bc16	MC	MCO	492	Monaco 	Monako	\N
00040000-55c4-bd34-a0f1-1669bd25db8f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c4-bd34-03c9-41519ae10c86	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c4-bd34-4e26-c660f7292229	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c4-bd34-9314-41a3cecadeaf	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c4-bd34-c8d4-3eab48f686f6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c4-bd34-962f-e3d46a4158d4	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c4-bd34-1ad5-2ceb94bfa050	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c4-bd34-61c4-e9fd49b62783	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c4-bd34-a2c8-9bfd29dbc59e	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c4-bd34-0dc1-7666e1879f39	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c4-bd34-23d5-42481d3f841f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c4-bd34-44ca-007e7108ab95	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c4-bd34-169e-2f21478b8c4c	NE	NER	562	Niger 	Niger 	\N
00040000-55c4-bd34-686e-34565a989b31	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c4-bd34-d728-0921b16dcc4d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c4-bd34-c447-6923b78773ef	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c4-bd34-f4d9-d716b42dc405	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c4-bd34-5d54-575d6aab723d	NO	NOR	578	Norway 	Norveška	\N
00040000-55c4-bd34-5778-71ba5d5db6fb	OM	OMN	512	Oman 	Oman	\N
00040000-55c4-bd34-dcc3-a262061b9540	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c4-bd34-cd21-e6491018d8cd	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c4-bd34-7b63-f4247c5e9562	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c4-bd34-d974-fced1e77d5a0	PA	PAN	591	Panama 	Panama	\N
00040000-55c4-bd34-57b3-03badd462597	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c4-bd34-7463-6c1cd03b78f0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c4-bd34-b4fb-4defd3c5c3b8	PE	PER	604	Peru 	Peru	\N
00040000-55c4-bd34-2b2a-770726b8aff3	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c4-bd34-d50f-fc285427c350	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c4-bd34-33ba-6ab77718e85d	PL	POL	616	Poland 	Poljska	\N
00040000-55c4-bd34-84d6-187bc8e67e91	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c4-bd34-3c07-d06353bd54f7	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c4-bd34-8abb-32300fb67279	QA	QAT	634	Qatar 	Katar	\N
00040000-55c4-bd34-50c6-7bf8ad64458e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c4-bd34-3a91-ce5bbbd2b2fc	RO	ROU	642	Romania 	Romunija	\N
00040000-55c4-bd34-afe2-417cffaaed56	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c4-bd34-79b2-a3a9197f79a2	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c4-bd34-9be4-e61d8f287aa0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c4-bd34-7482-3d3af7480dfc	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c4-bd34-ab0f-2ea41cfb1692	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c4-bd34-4ab6-d7cc4fd4c0f3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c4-bd34-ca0d-0d2657e7a22d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c4-bd34-1006-cd4a0e9d896b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c4-bd34-dbc5-4a12295d56bc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c4-bd34-35a5-5be8b8638484	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c4-bd34-5163-b142d4b44216	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c4-bd34-6471-576a86aa789a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c4-bd34-fcb6-6d50f54e7a7b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c4-bd34-0f8f-d92105789fac	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c4-bd34-8a5e-9763e7fdec20	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c4-bd34-24b7-74af9ee3ffb8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c4-bd34-a627-422a46dce32c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c4-bd34-f124-92aae13ec516	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c4-bd34-a411-40585402c501	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c4-bd34-ae02-0d05b97bb46e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c4-bd34-61ca-48e60baaee93	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c4-bd34-f304-a1f608200e86	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c4-bd34-6577-f0cf9b01d8e6	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c4-bd34-9c79-b43c8e2cade4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c4-bd34-e98d-b14006d2576e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c4-bd34-a5fd-61caf5030162	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c4-bd34-48df-1ba4ca4bf1c9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c4-bd34-e8db-111a50dcb167	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c4-bd34-7382-35ff9312ea2d	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c4-bd34-3f23-d23162c5f004	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c4-bd34-b29e-747bfd3fa247	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c4-bd34-e6e1-6306e3a58ca0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c4-bd34-7a9f-daeb4c019856	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c4-bd34-ab78-a54558e04bc3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c4-bd34-7008-e6295872d307	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c4-bd34-a3c5-a235e53c0d23	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c4-bd34-abdb-3d5e7aea5bf8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c4-bd34-9f5f-f5e79a916309	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c4-bd34-bdf5-b9cdd98b64d5	TH	THA	764	Thailand 	Tajska	\N
00040000-55c4-bd34-08a3-03b73bc5f6ec	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c4-bd34-1fcc-ea8c7462a689	TG	TGO	768	Togo 	Togo	\N
00040000-55c4-bd34-dab2-1ef75e4831d5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c4-bd34-64ea-e3a66bd02494	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c4-bd34-6683-1add9e88ac88	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c4-bd34-af7d-7c7e2ef27c12	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c4-bd34-959f-b8ada0214864	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c4-bd34-475d-e9664ed31b91	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c4-bd34-40ff-85785ebe9415	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c4-bd34-e4eb-9b35ddd88c5f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c4-bd34-bb44-53f84d1a83b2	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c4-bd34-db70-cdbcd90c44ef	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c4-bd34-6910-80cb1ff2224a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c4-bd34-7817-e0c3f87cedfe	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c4-bd34-bc24-c13abea79f2f	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c4-bd34-874e-52800946d8be	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c4-bd34-0d91-0c8b8bfd071b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c4-bd34-9b67-3265baaf882a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c4-bd34-3976-13270e15a8d7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c4-bd34-f693-b822b0e556cb	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c4-bd34-938a-aa8d49c58540	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c4-bd34-ce0f-d23392b7c0e0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c4-bd34-fdfc-cba4c4dd49d5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c4-bd34-9729-ac3b73c7592f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c4-bd34-2386-603b3e88ac3a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c4-bd34-702d-0ccf6279c5e7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c4-bd34-63b8-18a853e9c552	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c4-bd34-8b2b-3542881a56b5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12591080)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55c4-bd35-bf6a-d5910daff8a6	000e0000-55c4-bd35-f6be-6579d4aad745	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c4-bd34-523d-a43f0ea73aa4	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c4-bd35-0973-e38f08ea96be	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c4-bd34-c448-c6f388a6f668	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c4-bd35-6e73-2765903affee	000e0000-55c4-bd35-36c5-478fd807bea1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c4-bd34-523d-a43f0ea73aa4	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c4-bd35-c202-4fbcd31c2747	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c4-bd35-bc5f-a81d301d620d	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12590907)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c4-bd35-4dd9-501f9e4514b3	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c4-bd34-9dce-37d237d3dab9
000d0000-55c4-bd35-ef97-ad5d5f98239a	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c4-bd34-9dce-37d237d3dab9
000d0000-55c4-bd35-6022-98cb1062e556	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c4-bd34-75f6-1646800188a8
000d0000-55c4-bd35-8139-c3f5c2761602	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c4-bd34-fa54-b6fb0d50b211
000d0000-55c4-bd35-ee8d-59296d3b4f88	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c4-bd34-b12a-47c5665e2d6a
000d0000-55c4-bd35-9e65-d72e78d12f73	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c4-bd34-244f-b0b9a2a2b3ea
000d0000-55c4-bd35-6353-bfe56f3ed492	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c4-bd34-9dce-37d237d3dab9
000d0000-55c4-bd35-025d-cafda64a8a98	000e0000-55c4-bd35-cb52-bfbbe9d96274	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c4-bd34-10d9-49beedf5295f
\.


--
-- TOC entry 3010 (class 0 OID 12590723)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12590771)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12590703)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c4-bd35-025d-e80ed866565f	00080000-55c4-bd35-abab-23b2dae3bda8	00090000-55c4-bd35-491f-5b0058d8d753	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12590824)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12591291)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12591303)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12591326)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12590849)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12590660)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c4-bd34-c4d0-fe3d1a47068f	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c4-bd34-2950-d8c8cc43110d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c4-bd34-b5d7-fb1da27657cc	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c4-bd34-05a4-95e1e1158ea4	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c4-bd34-119c-67385ae756f5	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c4-bd34-526e-230a333e56ec	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c4-bd34-9ace-a1cd8955aa3e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c4-bd34-f14d-57679beea90a	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c4-bd34-eb3f-41e3f28ec6b1	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c4-bd34-cc3c-96672ce14233	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c4-bd34-5010-665265190821	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c4-bd34-e383-6ffa3e185f66	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c4-bd34-ec13-04f7b07a0e16	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c4-bd34-8ddd-1cd3599e1dbb	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c4-bd35-18e0-e98412708b52	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c4-bd35-20bb-514c5f0bfdf9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c4-bd35-d201-5e11749ca212	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c4-bd35-6978-c1a10c8effbd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c4-bd35-d201-bea386f248d2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c4-bd35-384f-ff3429cd24c1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12590573)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c4-bd35-a482-33d99b3cccee	00000000-55c4-bd35-20bb-514c5f0bfdf9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c4-bd35-8f95-28aa6eb30140	00000000-55c4-bd35-20bb-514c5f0bfdf9	00010000-55c4-bd34-75df-2fd90fc27186	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c4-bd35-46eb-bd627f1d7244	00000000-55c4-bd35-d201-5e11749ca212	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12590584)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c4-bd35-77c9-8a05da7ac8ee	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c4-bd35-0783-cee933866378	00010000-55c4-bd35-2f49-99d21962584d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c4-bd35-7d74-c4b18118e6fd	00010000-55c4-bd35-73e7-775fc6b353b0	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c4-bd35-cf7f-bb8872986aec	00010000-55c4-bd35-0ad9-e65b6c65045b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c4-bd35-59b1-5c2a561cc02c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c4-bd35-75ff-a2778c89c5fa	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c4-bd35-1fbd-1d6151509c81	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c4-bd35-db0c-b5a00348bdea	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c4-bd35-491f-5b0058d8d753	00010000-55c4-bd35-d46e-21a3b36443fc	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c4-bd35-8ecc-feb0a6c65c0d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c4-bd35-febc-f237b6805470	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c4-bd35-cbdb-4ad1031c20c7	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c4-bd35-7a8f-a6b62ee6e9fa	00010000-55c4-bd35-0513-6eac66f912bf	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12590536)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c4-bd34-1746-1f665ea887b7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c4-bd34-3106-5365a41ee710	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c4-bd34-da5e-7609b0cb5c19	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c4-bd34-6f14-28efce2994e1	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c4-bd34-e522-fc33393d0bfa	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c4-bd34-4de0-fcf0771e275a	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c4-bd34-1809-f06ea5b071e1	Abonma-read	Abonma - branje	f
00030000-55c4-bd34-c993-2d1ef64a50d8	Abonma-write	Abonma - spreminjanje	f
00030000-55c4-bd34-fb62-63338f14b010	Alternacija-read	Alternacija - branje	f
00030000-55c4-bd34-8a29-d452b2a7972a	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c4-bd34-9b41-379946b2f136	Arhivalija-read	Arhivalija - branje	f
00030000-55c4-bd34-418e-cbc6cb639bba	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c4-bd34-4068-d5a3edb5758a	Besedilo-read	Besedilo - branje	f
00030000-55c4-bd34-44c2-c5b6766ae0e8	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c4-bd34-1432-5dad4f5367c1	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c4-bd34-2a41-4e26f8f53452	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c4-bd34-618c-4470ae79bb27	Dogodek-read	Dogodek - branje	f
00030000-55c4-bd34-1fa2-c0ee59aeaa5e	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c4-bd34-0b09-4dded078840d	DrugiVir-read	DrugiVir - branje	f
00030000-55c4-bd34-dd8e-0f38ecbc3782	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c4-bd34-8a5e-6049110b2cfd	Drzava-read	Drzava - branje	f
00030000-55c4-bd34-6022-4d89298023ce	Drzava-write	Drzava - spreminjanje	f
00030000-55c4-bd34-7ef5-9443b829d861	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c4-bd34-2ce9-d2ce122a3bc9	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c4-bd34-25b7-10230dec0732	Funkcija-read	Funkcija - branje	f
00030000-55c4-bd34-13b3-129dc49cdc93	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c4-bd34-2c20-df93e67d752f	Gostovanje-read	Gostovanje - branje	f
00030000-55c4-bd34-23c5-3de9e0fd5a15	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c4-bd34-065d-d27925518e3a	Gostujoca-read	Gostujoca - branje	f
00030000-55c4-bd34-3b47-00e0bdefa6ca	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c4-bd34-24f3-227af3619eab	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c4-bd34-440f-18cf831f2cd8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c4-bd34-73cb-96501f42acf6	Kupec-read	Kupec - branje	f
00030000-55c4-bd34-2168-81bcf3307594	Kupec-write	Kupec - spreminjanje	f
00030000-55c4-bd34-8afd-4486282e3d0c	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c4-bd34-d3e3-01a0c048109f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c4-bd34-918e-9fbf5873ef7f	Option-read	Option - branje	f
00030000-55c4-bd34-1554-ddb71d9e25dd	Option-write	Option - spreminjanje	f
00030000-55c4-bd34-8a03-3c3d70c0334d	OptionValue-read	OptionValue - branje	f
00030000-55c4-bd34-104e-f52adc7eecc2	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c4-bd34-59f5-34c02baba6ad	Oseba-read	Oseba - branje	f
00030000-55c4-bd34-6e3b-4bc7ff3fc30c	Oseba-write	Oseba - spreminjanje	f
00030000-55c4-bd34-be1b-7496c0274299	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c4-bd34-3a89-0831d3ec118e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c4-bd34-8917-743d7cfc882d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c4-bd34-579d-f9f84492e523	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c4-bd34-ba96-231065f6c996	Pogodba-read	Pogodba - branje	f
00030000-55c4-bd34-27f0-5c409fb12daf	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c4-bd34-d0a7-efad9b7957c3	Popa-read	Popa - branje	f
00030000-55c4-bd34-94c1-3f08c205d118	Popa-write	Popa - spreminjanje	f
00030000-55c4-bd34-b87e-962888632c03	Posta-read	Posta - branje	f
00030000-55c4-bd34-262f-bad6cf598a52	Posta-write	Posta - spreminjanje	f
00030000-55c4-bd34-07b7-f9a5c99b3a0d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c4-bd34-d670-93fbb902f9ab	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c4-bd34-8f63-874074c77e58	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c4-bd34-bdde-555ff71bd707	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c4-bd34-87e2-263892f116ce	Predstava-read	Predstava - branje	f
00030000-55c4-bd34-61f9-65b09dfca9bd	Predstava-write	Predstava - spreminjanje	f
00030000-55c4-bd34-8319-7b13a6240589	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c4-bd34-dd56-91969a28526a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c4-bd34-9396-20d7726f8d11	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c4-bd34-c91a-70072cf89023	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c4-bd34-b070-ff8521ff6b2a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c4-bd34-5e35-895955e562c8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c4-bd34-0a60-8248b68d7451	ProgramDela-read	ProgramDela - branje	f
00030000-55c4-bd34-f130-5c3ffc1e5c7f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c4-bd34-f601-3134d3ac1ec1	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c4-bd34-1a10-71faac0331c5	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c4-bd34-419e-113eabb7c00f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c4-bd34-a35a-6a4ce4328ba2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c4-bd34-f951-9af98b72c264	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c4-bd34-9185-0d835b3cc7c2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c4-bd34-7100-4927b4b3b968	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c4-bd34-315d-9d76f77d33c7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c4-bd34-c7fd-9e3ad87b9e13	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c4-bd34-a38f-529d6910b70c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c4-bd34-599a-c5962ddc745f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c4-bd34-1277-53f817322d35	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c4-bd34-9852-1f906b660225	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c4-bd34-8824-55facb05eabf	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c4-bd34-b5f6-81b75b169e7f	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c4-bd34-ff3b-6937cb4ed979	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c4-bd34-85e4-e12ea3e01954	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c4-bd34-e2e2-b71827f348b3	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c4-bd34-e7d6-c4ae5c83ba19	Prostor-read	Prostor - branje	f
00030000-55c4-bd34-1c64-6e19591edce8	Prostor-write	Prostor - spreminjanje	f
00030000-55c4-bd34-5e4a-c6bc35fa8963	Racun-read	Racun - branje	f
00030000-55c4-bd34-3bb9-ec127981ce94	Racun-write	Racun - spreminjanje	f
00030000-55c4-bd34-20e6-4ef4a8594621	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c4-bd34-1524-4a9515a549ba	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c4-bd34-be41-178accc20a46	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c4-bd34-8b19-3fd3498cbb8b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c4-bd34-d421-a6e42c31a254	Rekvizit-read	Rekvizit - branje	f
00030000-55c4-bd34-2f2b-7375b0955a9a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c4-bd34-597f-feb3c0e4aaef	Revizija-read	Revizija - branje	f
00030000-55c4-bd34-e004-38a42c570ff4	Revizija-write	Revizija - spreminjanje	f
00030000-55c4-bd34-e572-6d53b4690d73	Rezervacija-read	Rezervacija - branje	f
00030000-55c4-bd34-dccb-9bd766e52c4e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c4-bd34-9b87-a80cc2a30182	SedezniRed-read	SedezniRed - branje	f
00030000-55c4-bd34-e6c5-f4f5f8639c68	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c4-bd34-3e56-ba25ebe80015	Sedez-read	Sedez - branje	f
00030000-55c4-bd34-cafd-02758c0d6307	Sedez-write	Sedez - spreminjanje	f
00030000-55c4-bd34-818e-13dd3be5f446	Sezona-read	Sezona - branje	f
00030000-55c4-bd34-2131-b13820027161	Sezona-write	Sezona - spreminjanje	f
00030000-55c4-bd34-8f5f-5232ca84dd11	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c4-bd34-041b-f4c7fdf1a317	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c4-bd34-ee6c-8724b7e5307f	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c4-bd34-5359-9f37b1a44086	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c4-bd34-16df-81d7e190f60a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c4-bd34-48f2-9fe5e8356d3e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c4-bd34-95c2-4060d6cd22c8	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c4-bd34-230b-459759d452ca	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c4-bd34-f1ff-d411c28a4d57	Telefonska-read	Telefonska - branje	f
00030000-55c4-bd34-c559-b05c7861c890	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c4-bd34-f199-04a1538801ac	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c4-bd34-c5e9-07366dea64cb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c4-bd34-4d85-5db674262e7b	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c4-bd34-cef7-7a2a6136c080	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c4-bd34-fcfc-600d4898dac0	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c4-bd34-1904-a202619f3e98	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c4-bd34-9d7d-f7a3b14c1278	Trr-read	Trr - branje	f
00030000-55c4-bd34-87b3-b3dca09faa48	Trr-write	Trr - spreminjanje	f
00030000-55c4-bd34-a68a-848193080309	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c4-bd34-7a76-bee07cfc9661	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c4-bd34-d338-b1fc15bbf458	Vaja-read	Vaja - branje	f
00030000-55c4-bd34-fec9-d783bcecdca7	Vaja-write	Vaja - spreminjanje	f
00030000-55c4-bd34-1c0d-761f7058d0fd	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c4-bd34-a36a-00eafeaadf11	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c4-bd34-e470-d2430fbef35a	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c4-bd34-2720-fa162ecbe1b4	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c4-bd34-33a8-a47e4b3ac812	Zasedenost-read	Zasedenost - branje	f
00030000-55c4-bd34-70d2-9e4c6aafe345	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c4-bd34-b628-6ab71454d078	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c4-bd34-73ed-2b6372947e2c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c4-bd34-3a7b-6ed72b2d4ae4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c4-bd34-da71-fc6a050071ed	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c4-bd34-23dc-6a8bf9f448f4	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c4-bd34-329f-4bb554e89b6e	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c4-bd34-4657-bca336666379	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c4-bd34-eb49-0630e10538a0	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c4-bd34-fa40-e8350ff0d275	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c4-bd34-1513-6a3b09520c59	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c4-bd34-6984-a97e4b8a241a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c4-bd34-0dc6-b48160b61eee	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c4-bd34-e45d-925a2824239d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c4-bd34-51dd-5c274a7c10d2	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c4-bd34-7db7-9d862a05b410	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c4-bd34-0ab0-5267d680d20f	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 12590555)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c4-bd34-181b-b8f8d38dc22b	00030000-55c4-bd34-3106-5365a41ee710
00020000-55c4-bd34-961b-e5cfd8b21dce	00030000-55c4-bd34-8a5e-6049110b2cfd
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-1809-f06ea5b071e1
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-c993-2d1ef64a50d8
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-fb62-63338f14b010
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-8a29-d452b2a7972a
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-9b41-379946b2f136
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-618c-4470ae79bb27
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-6f14-28efce2994e1
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-1fa2-c0ee59aeaa5e
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-8a5e-6049110b2cfd
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-6022-4d89298023ce
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-25b7-10230dec0732
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-13b3-129dc49cdc93
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-2c20-df93e67d752f
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-23c5-3de9e0fd5a15
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-065d-d27925518e3a
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-3b47-00e0bdefa6ca
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-24f3-227af3619eab
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-440f-18cf831f2cd8
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-918e-9fbf5873ef7f
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-8a03-3c3d70c0334d
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-59f5-34c02baba6ad
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-6e3b-4bc7ff3fc30c
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-d0a7-efad9b7957c3
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-94c1-3f08c205d118
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-b87e-962888632c03
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-262f-bad6cf598a52
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-8f63-874074c77e58
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-bdde-555ff71bd707
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-87e2-263892f116ce
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-61f9-65b09dfca9bd
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-b070-ff8521ff6b2a
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-5e35-895955e562c8
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-e7d6-c4ae5c83ba19
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-1c64-6e19591edce8
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-be41-178accc20a46
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-8b19-3fd3498cbb8b
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-d421-a6e42c31a254
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-2f2b-7375b0955a9a
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-818e-13dd3be5f446
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-2131-b13820027161
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-4d85-5db674262e7b
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-a68a-848193080309
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-7a76-bee07cfc9661
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-d338-b1fc15bbf458
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-fec9-d783bcecdca7
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-33a8-a47e4b3ac812
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-70d2-9e4c6aafe345
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-b628-6ab71454d078
00020000-55c4-bd34-a1b8-2b025a23dc89	00030000-55c4-bd34-3a7b-6ed72b2d4ae4
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-1809-f06ea5b071e1
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-9b41-379946b2f136
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-618c-4470ae79bb27
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-8a5e-6049110b2cfd
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-2c20-df93e67d752f
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-065d-d27925518e3a
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-24f3-227af3619eab
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-440f-18cf831f2cd8
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-918e-9fbf5873ef7f
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-8a03-3c3d70c0334d
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-59f5-34c02baba6ad
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-6e3b-4bc7ff3fc30c
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-d0a7-efad9b7957c3
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-b87e-962888632c03
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-8f63-874074c77e58
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-bdde-555ff71bd707
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-87e2-263892f116ce
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-e7d6-c4ae5c83ba19
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-be41-178accc20a46
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-d421-a6e42c31a254
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-818e-13dd3be5f446
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-f1ff-d411c28a4d57
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-c559-b05c7861c890
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-9d7d-f7a3b14c1278
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-87b3-b3dca09faa48
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-e470-d2430fbef35a
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-2720-fa162ecbe1b4
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-b628-6ab71454d078
00020000-55c4-bd34-0b6c-3a33d787c003	00030000-55c4-bd34-3a7b-6ed72b2d4ae4
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-1809-f06ea5b071e1
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-fb62-63338f14b010
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-9b41-379946b2f136
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-418e-cbc6cb639bba
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-4068-d5a3edb5758a
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-1432-5dad4f5367c1
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-618c-4470ae79bb27
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-8a5e-6049110b2cfd
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-25b7-10230dec0732
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-2c20-df93e67d752f
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-065d-d27925518e3a
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-24f3-227af3619eab
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-918e-9fbf5873ef7f
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-8a03-3c3d70c0334d
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-59f5-34c02baba6ad
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-d0a7-efad9b7957c3
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-b87e-962888632c03
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-87e2-263892f116ce
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-b070-ff8521ff6b2a
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-e7d6-c4ae5c83ba19
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-be41-178accc20a46
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-d421-a6e42c31a254
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-818e-13dd3be5f446
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-4d85-5db674262e7b
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-d338-b1fc15bbf458
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-33a8-a47e4b3ac812
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-b628-6ab71454d078
00020000-55c4-bd34-7fa0-acf6ce82e474	00030000-55c4-bd34-3a7b-6ed72b2d4ae4
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-1809-f06ea5b071e1
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-c993-2d1ef64a50d8
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-8a29-d452b2a7972a
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-9b41-379946b2f136
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-618c-4470ae79bb27
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-8a5e-6049110b2cfd
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-2c20-df93e67d752f
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-065d-d27925518e3a
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-918e-9fbf5873ef7f
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-8a03-3c3d70c0334d
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-d0a7-efad9b7957c3
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-b87e-962888632c03
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-87e2-263892f116ce
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-e7d6-c4ae5c83ba19
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-be41-178accc20a46
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-d421-a6e42c31a254
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-818e-13dd3be5f446
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-4d85-5db674262e7b
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-b628-6ab71454d078
00020000-55c4-bd34-7817-615d29dc7b90	00030000-55c4-bd34-3a7b-6ed72b2d4ae4
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-1809-f06ea5b071e1
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-9b41-379946b2f136
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-618c-4470ae79bb27
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-8a5e-6049110b2cfd
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-2c20-df93e67d752f
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-065d-d27925518e3a
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-918e-9fbf5873ef7f
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-8a03-3c3d70c0334d
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-d0a7-efad9b7957c3
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-b87e-962888632c03
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-87e2-263892f116ce
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-e7d6-c4ae5c83ba19
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-be41-178accc20a46
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-d421-a6e42c31a254
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-818e-13dd3be5f446
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-f199-04a1538801ac
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-da5e-7609b0cb5c19
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-4d85-5db674262e7b
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-b628-6ab71454d078
00020000-55c4-bd34-41b4-46815eb3a7aa	00030000-55c4-bd34-3a7b-6ed72b2d4ae4
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1746-1f665ea887b7
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-3106-5365a41ee710
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-da5e-7609b0cb5c19
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-6f14-28efce2994e1
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-e522-fc33393d0bfa
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-4de0-fcf0771e275a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1809-f06ea5b071e1
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-c993-2d1ef64a50d8
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-fb62-63338f14b010
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8a29-d452b2a7972a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-9b41-379946b2f136
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-418e-cbc6cb639bba
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-4068-d5a3edb5758a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-44c2-c5b6766ae0e8
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1432-5dad4f5367c1
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-2a41-4e26f8f53452
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-618c-4470ae79bb27
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1fa2-c0ee59aeaa5e
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8a5e-6049110b2cfd
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-6022-4d89298023ce
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-0b09-4dded078840d
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-dd8e-0f38ecbc3782
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-7ef5-9443b829d861
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-2ce9-d2ce122a3bc9
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-25b7-10230dec0732
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-13b3-129dc49cdc93
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-2c20-df93e67d752f
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-23c5-3de9e0fd5a15
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-065d-d27925518e3a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-3b47-00e0bdefa6ca
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-24f3-227af3619eab
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-440f-18cf831f2cd8
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-73cb-96501f42acf6
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-2168-81bcf3307594
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8afd-4486282e3d0c
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-d3e3-01a0c048109f
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-918e-9fbf5873ef7f
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1554-ddb71d9e25dd
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8a03-3c3d70c0334d
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-104e-f52adc7eecc2
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-59f5-34c02baba6ad
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-6e3b-4bc7ff3fc30c
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-be1b-7496c0274299
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-3a89-0831d3ec118e
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8917-743d7cfc882d
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-579d-f9f84492e523
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-ba96-231065f6c996
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-27f0-5c409fb12daf
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-d0a7-efad9b7957c3
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-94c1-3f08c205d118
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-b87e-962888632c03
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-262f-bad6cf598a52
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-07b7-f9a5c99b3a0d
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-d670-93fbb902f9ab
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8f63-874074c77e58
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-bdde-555ff71bd707
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-87e2-263892f116ce
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-61f9-65b09dfca9bd
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8319-7b13a6240589
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-dd56-91969a28526a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-9396-20d7726f8d11
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-c91a-70072cf89023
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-b070-ff8521ff6b2a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-5e35-895955e562c8
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-0a60-8248b68d7451
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-f130-5c3ffc1e5c7f
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-f601-3134d3ac1ec1
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1a10-71faac0331c5
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-419e-113eabb7c00f
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-a35a-6a4ce4328ba2
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-f951-9af98b72c264
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-9185-0d835b3cc7c2
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-7100-4927b4b3b968
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-315d-9d76f77d33c7
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-c7fd-9e3ad87b9e13
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-a38f-529d6910b70c
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-599a-c5962ddc745f
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1277-53f817322d35
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-9852-1f906b660225
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8824-55facb05eabf
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-b5f6-81b75b169e7f
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-ff3b-6937cb4ed979
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-85e4-e12ea3e01954
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-e2e2-b71827f348b3
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-e7d6-c4ae5c83ba19
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1c64-6e19591edce8
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-5e4a-c6bc35fa8963
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-3bb9-ec127981ce94
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-20e6-4ef4a8594621
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1524-4a9515a549ba
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-be41-178accc20a46
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8b19-3fd3498cbb8b
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-d421-a6e42c31a254
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-2f2b-7375b0955a9a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-597f-feb3c0e4aaef
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-e004-38a42c570ff4
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-e572-6d53b4690d73
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-dccb-9bd766e52c4e
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-9b87-a80cc2a30182
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-e6c5-f4f5f8639c68
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-3e56-ba25ebe80015
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-cafd-02758c0d6307
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-818e-13dd3be5f446
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-2131-b13820027161
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-8f5f-5232ca84dd11
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-041b-f4c7fdf1a317
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-ee6c-8724b7e5307f
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-5359-9f37b1a44086
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-16df-81d7e190f60a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-48f2-9fe5e8356d3e
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-95c2-4060d6cd22c8
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-230b-459759d452ca
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-f1ff-d411c28a4d57
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-c559-b05c7861c890
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-f199-04a1538801ac
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-c5e9-07366dea64cb
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-4d85-5db674262e7b
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-cef7-7a2a6136c080
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-fcfc-600d4898dac0
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1904-a202619f3e98
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-9d7d-f7a3b14c1278
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-87b3-b3dca09faa48
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-a68a-848193080309
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-7a76-bee07cfc9661
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-d338-b1fc15bbf458
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-fec9-d783bcecdca7
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-1c0d-761f7058d0fd
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-a36a-00eafeaadf11
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-e470-d2430fbef35a
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-2720-fa162ecbe1b4
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-33a8-a47e4b3ac812
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-70d2-9e4c6aafe345
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-b628-6ab71454d078
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-73ed-2b6372947e2c
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-3a7b-6ed72b2d4ae4
00020000-55c4-bd35-df60-df69608d35b1	00030000-55c4-bd34-da71-fc6a050071ed
\.


--
-- TOC entry 3025 (class 0 OID 12590856)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12590887)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12591001)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c4-bd35-c2cc-f70434139b58	00090000-55c4-bd35-77c9-8a05da7ac8ee	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c4-bd35-f0c5-5a8963780632	00090000-55c4-bd35-75ff-a2778c89c5fa	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c4-bd35-fb68-2d8c472cba18	00090000-55c4-bd35-7a8f-a6b62ee6e9fa	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12590617)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c4-bd35-abab-23b2dae3bda8	00040000-55c4-bd34-61ca-48e60baaee93	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-bd35-5afc-522ed55becf2	00040000-55c4-bd34-61ca-48e60baaee93	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c4-bd35-bc85-37dabed826a5	00040000-55c4-bd34-61ca-48e60baaee93	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-bd35-14b7-d1c1428c5fb5	00040000-55c4-bd34-61ca-48e60baaee93	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-bd35-bd79-037dc54146a0	00040000-55c4-bd34-61ca-48e60baaee93	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-bd35-d1f2-d0c4e0994552	00040000-55c4-bd33-eeb0-d388993b4270	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-bd35-c1b7-5a323325e232	00040000-55c4-bd34-3900-10c85a670bd6	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-bd35-31bb-f93c045d09f2	00040000-55c4-bd33-6dce-c32efd497b77	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-bd35-12f7-e065793f022f	00040000-55c4-bd34-61ca-48e60baaee93	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12590652)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c4-bd34-ec2b-e82c913e3f4a	8341	Adlešiči
00050000-55c4-bd34-95fa-bec607a0b5f9	5270	Ajdovščina
00050000-55c4-bd34-2264-dd52faed81b0	6280	Ankaran/Ancarano
00050000-55c4-bd34-d8f9-45e15f5fb819	9253	Apače
00050000-55c4-bd34-3b7e-4bf71683df7c	8253	Artiče
00050000-55c4-bd34-6fbc-b762f561a329	4275	Begunje na Gorenjskem
00050000-55c4-bd34-d2d6-85c7daeaf1b9	1382	Begunje pri Cerknici
00050000-55c4-bd34-b0b0-75974c8714b7	9231	Beltinci
00050000-55c4-bd34-1840-0994f8075dba	2234	Benedikt
00050000-55c4-bd34-cdf9-f15cdbf5829e	2345	Bistrica ob Dravi
00050000-55c4-bd34-9234-3f3b7e9d88cb	3256	Bistrica ob Sotli
00050000-55c4-bd34-fa4d-abc40a69fa80	8259	Bizeljsko
00050000-55c4-bd34-c8d5-675e9af50282	1223	Blagovica
00050000-55c4-bd34-8e09-01e4ad51f754	8283	Blanca
00050000-55c4-bd34-f88c-f4ea18c72ece	4260	Bled
00050000-55c4-bd34-8bde-0ca16c984d17	4273	Blejska Dobrava
00050000-55c4-bd34-acf6-151b56d78c05	9265	Bodonci
00050000-55c4-bd34-b71e-26c02a8a10e7	9222	Bogojina
00050000-55c4-bd34-bc57-8097eeb7c420	4263	Bohinjska Bela
00050000-55c4-bd34-5c67-16ced8c7f2db	4264	Bohinjska Bistrica
00050000-55c4-bd34-39c0-fbbf9d214f1e	4265	Bohinjsko jezero
00050000-55c4-bd34-0885-23618158387c	1353	Borovnica
00050000-55c4-bd34-407e-78907fecfc63	8294	Boštanj
00050000-55c4-bd34-16f5-3f76681bc9bf	5230	Bovec
00050000-55c4-bd34-1047-a9634f75ead7	5295	Branik
00050000-55c4-bd34-5323-4a2e6eb52682	3314	Braslovče
00050000-55c4-bd34-9db5-e451b55c3a95	5223	Breginj
00050000-55c4-bd34-1d23-0463fc254e49	8280	Brestanica
00050000-55c4-bd34-5030-b17002174821	2354	Bresternica
00050000-55c4-bd34-7d00-3b129abb1642	4243	Brezje
00050000-55c4-bd34-758b-21661334f97c	1351	Brezovica pri Ljubljani
00050000-55c4-bd34-c81b-1568610bc43b	8250	Brežice
00050000-55c4-bd34-df80-b710ad70564d	4210	Brnik - Aerodrom
00050000-55c4-bd34-62c5-9381019c2581	8321	Brusnice
00050000-55c4-bd34-aa1c-c5195ed09741	3255	Buče
00050000-55c4-bd34-41d3-35984db472a7	8276	Bučka 
00050000-55c4-bd34-006f-9cedf0e17261	9261	Cankova
00050000-55c4-bd34-4d6c-7ebf411bca30	3000	Celje 
00050000-55c4-bd34-3167-3b0745b11f8b	3001	Celje - poštni predali
00050000-55c4-bd34-9a43-cda74405217a	4207	Cerklje na Gorenjskem
00050000-55c4-bd34-96da-3e88128b9fb0	8263	Cerklje ob Krki
00050000-55c4-bd34-30bd-b4356f9d5956	1380	Cerknica
00050000-55c4-bd34-f162-3b5530ae03a6	5282	Cerkno
00050000-55c4-bd34-f055-b966eb1b18bc	2236	Cerkvenjak
00050000-55c4-bd34-e443-ba8600b979e4	2215	Ceršak
00050000-55c4-bd34-a705-f6082f34e309	2326	Cirkovce
00050000-55c4-bd34-0525-becd6154c735	2282	Cirkulane
00050000-55c4-bd34-e73d-557717c57c5b	5273	Col
00050000-55c4-bd34-5999-7725575278a3	8251	Čatež ob Savi
00050000-55c4-bd34-2e3c-f3dbb8d71efc	1413	Čemšenik
00050000-55c4-bd34-f4e5-dc7e5e0bddee	5253	Čepovan
00050000-55c4-bd34-0405-43c01eb9db85	9232	Črenšovci
00050000-55c4-bd34-daec-d0481073efb0	2393	Črna na Koroškem
00050000-55c4-bd34-7b20-2c00787679a8	6275	Črni Kal
00050000-55c4-bd34-e048-226c9e017543	5274	Črni Vrh nad Idrijo
00050000-55c4-bd34-e61f-10732a9afd9b	5262	Črniče
00050000-55c4-bd34-d25d-6ccef3de9b66	8340	Črnomelj
00050000-55c4-bd34-691d-84c985a5e243	6271	Dekani
00050000-55c4-bd34-61f2-3cdea8854b2f	5210	Deskle
00050000-55c4-bd34-f215-c093411bbb05	2253	Destrnik
00050000-55c4-bd34-f6f5-9832cf535209	6215	Divača
00050000-55c4-bd34-0087-b52f1812ee3e	1233	Dob
00050000-55c4-bd34-6be2-e1448907f240	3224	Dobje pri Planini
00050000-55c4-bd34-42ae-bf33519d1d9f	8257	Dobova
00050000-55c4-bd34-be22-38a5217a2b1d	1423	Dobovec
00050000-55c4-bd34-8c80-44dcb81dddc9	5263	Dobravlje
00050000-55c4-bd34-49d0-9cbcfa05b07f	3204	Dobrna
00050000-55c4-bd34-5aa9-7ad6f5710dbd	8211	Dobrnič
00050000-55c4-bd34-e3de-6b32e8069e4e	1356	Dobrova
00050000-55c4-bd34-683d-d4c41b95a71e	9223	Dobrovnik/Dobronak 
00050000-55c4-bd34-65c7-f35ee77e4e87	5212	Dobrovo v Brdih
00050000-55c4-bd34-3190-99e58381a639	1431	Dol pri Hrastniku
00050000-55c4-bd34-c1a8-425a12d51492	1262	Dol pri Ljubljani
00050000-55c4-bd34-a599-fd9a9540ec32	1273	Dole pri Litiji
00050000-55c4-bd34-e110-f8104f405655	1331	Dolenja vas
00050000-55c4-bd34-bcf7-85bd37b5e0eb	8350	Dolenjske Toplice
00050000-55c4-bd34-2ab3-12c5d051e2d8	1230	Domžale
00050000-55c4-bd34-c3c2-0cb364b7fcb7	2252	Dornava
00050000-55c4-bd34-1200-924088c3d842	5294	Dornberk
00050000-55c4-bd34-0103-c657a0b07ee4	1319	Draga
00050000-55c4-bd34-394c-0c20dcdeb761	8343	Dragatuš
00050000-55c4-bd34-8596-388c09a59822	3222	Dramlje
00050000-55c4-bd34-1efd-72c6b6edf268	2370	Dravograd
00050000-55c4-bd34-ab40-ce3a02474dc9	4203	Duplje
00050000-55c4-bd34-7624-6bfa6c24e5bf	6221	Dutovlje
00050000-55c4-bd34-a334-707c4cce0d0a	8361	Dvor
00050000-55c4-bd34-c987-3a5862f7c8fa	2343	Fala
00050000-55c4-bd34-b947-a2aace865669	9208	Fokovci
00050000-55c4-bd34-71a1-d55a27db6ed6	2313	Fram
00050000-55c4-bd34-4c2c-f2ada56154ad	3213	Frankolovo
00050000-55c4-bd34-7402-7756407b900d	1274	Gabrovka
00050000-55c4-bd34-a7e2-44a0c8f2cda0	8254	Globoko
00050000-55c4-bd34-8f5e-a0212e70c7a3	5275	Godovič
00050000-55c4-bd34-a699-da8872cd5969	4204	Golnik
00050000-55c4-bd34-73c9-9fb46a2db2d9	3303	Gomilsko
00050000-55c4-bd34-a4b2-dc5c3231db7c	4224	Gorenja vas
00050000-55c4-bd34-6106-2a1c29910d0a	3263	Gorica pri Slivnici
00050000-55c4-bd34-d0b3-e680d33ae381	2272	Gorišnica
00050000-55c4-bd34-ce60-780b83829327	9250	Gornja Radgona
00050000-55c4-bd34-f89c-1bdd31612059	3342	Gornji Grad
00050000-55c4-bd34-87d1-f4764ca8388f	4282	Gozd Martuljek
00050000-55c4-bd34-752f-e777285f8171	6272	Gračišče
00050000-55c4-bd34-73ee-ac204dea488c	9264	Grad
00050000-55c4-bd34-78db-96933a339ecb	8332	Gradac
00050000-55c4-bd34-8134-11f25ba1af02	1384	Grahovo
00050000-55c4-bd34-60d3-1345a74b09c5	5242	Grahovo ob Bači
00050000-55c4-bd34-b4cd-9701a94ddb66	5251	Grgar
00050000-55c4-bd34-de5e-8bc0575aba48	3302	Griže
00050000-55c4-bd34-c239-95977b3e7de0	3231	Grobelno
00050000-55c4-bd34-0b21-cb51ccfbebf4	1290	Grosuplje
00050000-55c4-bd34-2078-d6ae56020dd3	2288	Hajdina
00050000-55c4-bd34-a511-326156e7cc9b	8362	Hinje
00050000-55c4-bd34-e812-d2530d9ca06e	2311	Hoče
00050000-55c4-bd34-5d79-8418e7e5a2c5	9205	Hodoš/Hodos
00050000-55c4-bd34-a8b0-97c22ed61825	1354	Horjul
00050000-55c4-bd34-10cd-85e3be0a859f	1372	Hotedršica
00050000-55c4-bd34-308f-12c31a5fc41e	1430	Hrastnik
00050000-55c4-bd34-b808-04a80cbf215b	6225	Hruševje
00050000-55c4-bd34-722a-f2e3d069460c	4276	Hrušica
00050000-55c4-bd34-a857-c44c885f2b97	5280	Idrija
00050000-55c4-bd34-c674-2c4da507c8e7	1292	Ig
00050000-55c4-bd34-7d0b-aba533d8f819	6250	Ilirska Bistrica
00050000-55c4-bd34-e94d-ef7689066a43	6251	Ilirska Bistrica-Trnovo
00050000-55c4-bd34-f917-1bd11a594eca	1295	Ivančna Gorica
00050000-55c4-bd34-ff82-da7d5a94d96a	2259	Ivanjkovci
00050000-55c4-bd34-a7cc-76770623435c	1411	Izlake
00050000-55c4-bd34-9667-98fc7a2fa22b	6310	Izola/Isola
00050000-55c4-bd34-72e0-9f83a829ac00	2222	Jakobski Dol
00050000-55c4-bd34-6cf8-c218de8acce7	2221	Jarenina
00050000-55c4-bd34-9d7b-6ae33d01670f	6254	Jelšane
00050000-55c4-bd34-ef94-c1be277a43f0	4270	Jesenice
00050000-55c4-bd34-17d1-5408b44cd9e1	8261	Jesenice na Dolenjskem
00050000-55c4-bd34-71ab-7d9fa7c4bcb5	3273	Jurklošter
00050000-55c4-bd34-7274-26fadf09fc44	2223	Jurovski Dol
00050000-55c4-bd34-6585-dffecb553b66	2256	Juršinci
00050000-55c4-bd34-3eb4-5133c3853dfe	5214	Kal nad Kanalom
00050000-55c4-bd34-306f-969dab37e9be	3233	Kalobje
00050000-55c4-bd34-d726-93e2bf50e66e	4246	Kamna Gorica
00050000-55c4-bd34-15c5-c85ce9325f07	2351	Kamnica
00050000-55c4-bd34-8e9e-ff9592fe1013	1241	Kamnik
00050000-55c4-bd34-0588-6a2aaee33c8e	5213	Kanal
00050000-55c4-bd34-787a-56b77addb93d	8258	Kapele
00050000-55c4-bd34-cc80-2bc69bdf8c82	2362	Kapla
00050000-55c4-bd34-85fc-3f1e94c5b196	2325	Kidričevo
00050000-55c4-bd34-01af-14d7dcfaf2bb	1412	Kisovec
00050000-55c4-bd34-f8cf-acdcabcd9dde	6253	Knežak
00050000-55c4-bd34-1c0b-656a57b78511	5222	Kobarid
00050000-55c4-bd34-915d-e5b439fd8ae9	9227	Kobilje
00050000-55c4-bd34-3517-86653417affd	1330	Kočevje
00050000-55c4-bd34-a00e-de676d166554	1338	Kočevska Reka
00050000-55c4-bd34-b938-981fd860538d	2276	Kog
00050000-55c4-bd34-742e-d01395c2cc09	5211	Kojsko
00050000-55c4-bd34-7dba-ab3725ddfa86	6223	Komen
00050000-55c4-bd34-f383-b6a4f50cfd0b	1218	Komenda
00050000-55c4-bd34-1963-198744aad3d8	6000	Koper/Capodistria 
00050000-55c4-bd34-ff4b-3ecea91a67a8	6001	Koper/Capodistria - poštni predali
00050000-55c4-bd34-61e1-8dc2cacdb592	8282	Koprivnica
00050000-55c4-bd34-ea3e-ae92b7c09809	5296	Kostanjevica na Krasu
00050000-55c4-bd34-b628-836c7183d57c	8311	Kostanjevica na Krki
00050000-55c4-bd34-f3ec-d8e444b1b1f7	1336	Kostel
00050000-55c4-bd34-07c6-8281114c3058	6256	Košana
00050000-55c4-bd34-2137-b40b83d78978	2394	Kotlje
00050000-55c4-bd34-eb81-f1201aa327fc	6240	Kozina
00050000-55c4-bd34-aef5-602c53e606c7	3260	Kozje
00050000-55c4-bd34-79c1-7f8aaf64e621	4000	Kranj 
00050000-55c4-bd34-3032-0bd0ba7b7860	4001	Kranj - poštni predali
00050000-55c4-bd34-8700-b50089e16471	4280	Kranjska Gora
00050000-55c4-bd34-b21c-5bac1632ffdb	1281	Kresnice
00050000-55c4-bd34-ec72-0a8a1bb37a9f	4294	Križe
00050000-55c4-bd34-afad-66c899c8cb4e	9206	Križevci
00050000-55c4-bd34-b29a-748af7f5d14d	9242	Križevci pri Ljutomeru
00050000-55c4-bd34-09db-baae9dd8656e	1301	Krka
00050000-55c4-bd34-97a0-bb3453be325f	8296	Krmelj
00050000-55c4-bd34-9b1a-fcdb63bb7440	4245	Kropa
00050000-55c4-bd34-38d2-1b778dbdd004	8262	Krška vas
00050000-55c4-bd34-c38e-6250ff63d065	8270	Krško
00050000-55c4-bd34-dda7-6b40f6e94119	9263	Kuzma
00050000-55c4-bd34-116b-8be68bcd29b6	2318	Laporje
00050000-55c4-bd34-3659-17d87a69e8b7	3270	Laško
00050000-55c4-bd34-6d0d-b913a6330e79	1219	Laze v Tuhinju
00050000-55c4-bd34-d02a-d98245a2bbe3	2230	Lenart v Slovenskih goricah
00050000-55c4-bd34-5274-77a35f53abfb	9220	Lendava/Lendva
00050000-55c4-bd34-f534-363b202a307d	4248	Lesce
00050000-55c4-bd34-4471-465a6c1cf00a	3261	Lesično
00050000-55c4-bd34-5f63-27e5babbfed0	8273	Leskovec pri Krškem
00050000-55c4-bd34-f9e2-04b841b74a8b	2372	Libeliče
00050000-55c4-bd34-7fc8-09f0a4169c61	2341	Limbuš
00050000-55c4-bd34-1e31-ccf622911862	1270	Litija
00050000-55c4-bd34-ca28-abccf8665da9	3202	Ljubečna
00050000-55c4-bd34-d1db-c5d77fa5f0b8	1000	Ljubljana 
00050000-55c4-bd34-a692-a135fdf28b4a	1001	Ljubljana - poštni predali
00050000-55c4-bd34-ada7-fa00ec7c58fa	1231	Ljubljana - Črnuče
00050000-55c4-bd34-0f14-fd95091efce5	1261	Ljubljana - Dobrunje
00050000-55c4-bd34-2bbd-6cddbd9ebeae	1260	Ljubljana - Polje
00050000-55c4-bd34-d771-8fde2fc05bbc	1210	Ljubljana - Šentvid
00050000-55c4-bd34-7f4c-fde6ac21815d	1211	Ljubljana - Šmartno
00050000-55c4-bd34-d0ed-5fc8c35d8be0	3333	Ljubno ob Savinji
00050000-55c4-bd34-5e2e-2fc717ebcf32	9240	Ljutomer
00050000-55c4-bd34-e9ce-b92a5ac1acfc	3215	Loče
00050000-55c4-bd34-ed39-875287d43aa4	5231	Log pod Mangartom
00050000-55c4-bd34-83ae-7fdcbd1c95dc	1358	Log pri Brezovici
00050000-55c4-bd34-8046-6d2187464fa5	1370	Logatec
00050000-55c4-bd34-9632-7f654e6ea873	1371	Logatec
00050000-55c4-bd34-f777-af220b0d43b2	1434	Loka pri Zidanem Mostu
00050000-55c4-bd34-a08c-5d1aa9009a2b	3223	Loka pri Žusmu
00050000-55c4-bd34-f409-9ee4d932c353	6219	Lokev
00050000-55c4-bd34-a35a-3b0109a638cc	1318	Loški Potok
00050000-55c4-bd34-9fad-b2ff86d546df	2324	Lovrenc na Dravskem polju
00050000-55c4-bd34-83e8-7e21b4411bd3	2344	Lovrenc na Pohorju
00050000-55c4-bd34-b43e-96a1a99527c3	3334	Luče
00050000-55c4-bd34-55e5-cf87744790e3	1225	Lukovica
00050000-55c4-bd34-d049-99e1d8b1f65d	9202	Mačkovci
00050000-55c4-bd34-2be6-ae0cab11870e	2322	Majšperk
00050000-55c4-bd34-c3a7-821fa8f596dc	2321	Makole
00050000-55c4-bd34-8b79-13c73685c3d1	9243	Mala Nedelja
00050000-55c4-bd34-bd8e-c528e87406df	2229	Malečnik
00050000-55c4-bd34-5f6a-5dd0f5a3a1f9	6273	Marezige
00050000-55c4-bd34-2377-ebedf1bfcfa1	2000	Maribor 
00050000-55c4-bd34-dcad-c780a2005341	2001	Maribor - poštni predali
00050000-55c4-bd34-63ca-8654e37cc29b	2206	Marjeta na Dravskem polju
00050000-55c4-bd34-3013-0fcbaed219b2	2281	Markovci
00050000-55c4-bd34-3fd7-db697e31b06f	9221	Martjanci
00050000-55c4-bd34-4631-63bf448009fd	6242	Materija
00050000-55c4-bd34-ed9b-486e0d4b2631	4211	Mavčiče
00050000-55c4-bd34-0303-ccdda7f896ae	1215	Medvode
00050000-55c4-bd34-1ccb-0bb2eeac6f98	1234	Mengeš
00050000-55c4-bd34-78a4-9f76b9a6d90e	8330	Metlika
00050000-55c4-bd34-bc47-d2ab2a187b32	2392	Mežica
00050000-55c4-bd34-51a9-396f84551125	2204	Miklavž na Dravskem polju
00050000-55c4-bd34-34f6-aa46ec70df0e	2275	Miklavž pri Ormožu
00050000-55c4-bd34-8f12-9e1dc9a825b7	5291	Miren
00050000-55c4-bd34-6b21-283b5fefaf40	8233	Mirna
00050000-55c4-bd34-36f3-8528530bac06	8216	Mirna Peč
00050000-55c4-bd34-8adc-4ee2d2e46a90	2382	Mislinja
00050000-55c4-bd34-1ca3-fc641df62404	4281	Mojstrana
00050000-55c4-bd34-5509-71ae6316552a	8230	Mokronog
00050000-55c4-bd34-964e-6602926d3b27	1251	Moravče
00050000-55c4-bd34-4818-fa8d5cf17315	9226	Moravske Toplice
00050000-55c4-bd34-36d6-4aac81bbfe1a	5216	Most na Soči
00050000-55c4-bd34-eacf-db42c7c70b3f	1221	Motnik
00050000-55c4-bd34-315b-b314446745d9	3330	Mozirje
00050000-55c4-bd34-440c-f269de2186a9	9000	Murska Sobota 
00050000-55c4-bd34-c8fd-1ddf1f7e7618	9001	Murska Sobota - poštni predali
00050000-55c4-bd34-28ab-7cf1b7a2b263	2366	Muta
00050000-55c4-bd34-4261-052b96402666	4202	Naklo
00050000-55c4-bd34-14d8-5b7f5856d89a	3331	Nazarje
00050000-55c4-bd34-8d81-d207da837ec6	1357	Notranje Gorice
00050000-55c4-bd34-fbd1-82af77cf1d1b	3203	Nova Cerkev
00050000-55c4-bd34-fc2a-dc56da583035	5000	Nova Gorica 
00050000-55c4-bd34-5547-475942d5767d	5001	Nova Gorica - poštni predali
00050000-55c4-bd34-d6a1-c34d53d3d3ad	1385	Nova vas
00050000-55c4-bd34-bf9c-ad9ff4482da6	8000	Novo mesto
00050000-55c4-bd34-b5d7-51556d6154ea	8001	Novo mesto - poštni predali
00050000-55c4-bd34-a1d9-e1f30870601b	6243	Obrov
00050000-55c4-bd34-e72c-fdb248f8f337	9233	Odranci
00050000-55c4-bd34-4399-fe6f8e2d6782	2317	Oplotnica
00050000-55c4-bd34-e470-019214e312d4	2312	Orehova vas
00050000-55c4-bd34-58ff-dd4830436ddf	2270	Ormož
00050000-55c4-bd34-4219-78fc70784aa2	1316	Ortnek
00050000-55c4-bd34-effa-17e21e6072d2	1337	Osilnica
00050000-55c4-bd34-17ef-662a5b173333	8222	Otočec
00050000-55c4-bd34-3165-1d8465cd384d	2361	Ožbalt
00050000-55c4-bd34-f7a8-062cf58bbb9f	2231	Pernica
00050000-55c4-bd34-0997-8a79b271e9bc	2211	Pesnica pri Mariboru
00050000-55c4-bd34-75c2-fed0193c3ed2	9203	Petrovci
00050000-55c4-bd34-cae9-3356dde67e16	3301	Petrovče
00050000-55c4-bd34-297b-257180dd55ec	6330	Piran/Pirano
00050000-55c4-bd34-195b-854ffd1241c7	8255	Pišece
00050000-55c4-bd34-9056-eaf2285ab5ad	6257	Pivka
00050000-55c4-bd34-77c6-09f763729132	6232	Planina
00050000-55c4-bd34-4eb0-208f1f411656	3225	Planina pri Sevnici
00050000-55c4-bd34-cdfb-46d061f562b2	6276	Pobegi
00050000-55c4-bd34-6710-c9fdba238ff5	8312	Podbočje
00050000-55c4-bd34-8104-227900e4bd61	5243	Podbrdo
00050000-55c4-bd34-9060-ccd39dfc1de9	3254	Podčetrtek
00050000-55c4-bd34-d144-948a9c709ab2	2273	Podgorci
00050000-55c4-bd34-6e05-e49c7a1ff233	6216	Podgorje
00050000-55c4-bd34-9f2f-cccae4673861	2381	Podgorje pri Slovenj Gradcu
00050000-55c4-bd34-836e-33531a795137	6244	Podgrad
00050000-55c4-bd34-42ad-dbcb68b2898d	1414	Podkum
00050000-55c4-bd34-ba89-4a03116a6b75	2286	Podlehnik
00050000-55c4-bd34-ad2d-561bb97c774f	5272	Podnanos
00050000-55c4-bd34-9965-8afb9ab24a53	4244	Podnart
00050000-55c4-bd34-3832-7726e7f84cf3	3241	Podplat
00050000-55c4-bd34-de04-9912ab63790b	3257	Podsreda
00050000-55c4-bd34-b259-321cce1256a6	2363	Podvelka
00050000-55c4-bd34-65b3-e7d43c97e392	2208	Pohorje
00050000-55c4-bd34-7cc3-0bb53d5a903e	2257	Polenšak
00050000-55c4-bd34-a526-f32db8f8626a	1355	Polhov Gradec
00050000-55c4-bd34-24d2-b691028c87d1	4223	Poljane nad Škofjo Loko
00050000-55c4-bd34-98fa-fce3bda81609	2319	Poljčane
00050000-55c4-bd34-07de-d6c6ceefcd55	1272	Polšnik
00050000-55c4-bd34-6a64-6a7166c6cbac	3313	Polzela
00050000-55c4-bd34-0a2d-ad0b7c891622	3232	Ponikva
00050000-55c4-bd34-2a88-59919035ceb4	6320	Portorož/Portorose
00050000-55c4-bd34-4ef8-14bea1ae40ec	6230	Postojna
00050000-55c4-bd34-6e39-300aad30eec5	2331	Pragersko
00050000-55c4-bd34-1760-199ab437d84c	3312	Prebold
00050000-55c4-bd34-3ab7-6f99a062a495	4205	Preddvor
00050000-55c4-bd34-ee6c-f0bd2e50055b	6255	Prem
00050000-55c4-bd34-2640-10fcdddee855	1352	Preserje
00050000-55c4-bd34-2704-d59317defa96	6258	Prestranek
00050000-55c4-bd34-fc0d-541ef615c46c	2391	Prevalje
00050000-55c4-bd34-3188-4e8815dfc38b	3262	Prevorje
00050000-55c4-bd34-9c54-c7266007aa8f	1276	Primskovo 
00050000-55c4-bd34-ec76-a2d9d514b953	3253	Pristava pri Mestinju
00050000-55c4-bd34-3e22-b31f9eb33f52	9207	Prosenjakovci/Partosfalva
00050000-55c4-bd34-e1b5-c4d1a33fe5d4	5297	Prvačina
00050000-55c4-bd34-d205-176893a368f1	2250	Ptuj
00050000-55c4-bd34-f36a-71157d4eea26	2323	Ptujska Gora
00050000-55c4-bd34-0503-62915862f0d4	9201	Puconci
00050000-55c4-bd34-8d95-3e1ede56d328	2327	Rače
00050000-55c4-bd34-8d6c-190377ad2876	1433	Radeče
00050000-55c4-bd34-8093-7323569a9bff	9252	Radenci
00050000-55c4-bd34-c252-c19729d95f43	2360	Radlje ob Dravi
00050000-55c4-bd34-7c97-cd56f46dcc4e	1235	Radomlje
00050000-55c4-bd34-b94e-554f5e984587	4240	Radovljica
00050000-55c4-bd34-e268-83af087f5169	8274	Raka
00050000-55c4-bd34-bec2-a2cac2faceb1	1381	Rakek
00050000-55c4-bd34-104f-f6d21798371e	4283	Rateče - Planica
00050000-55c4-bd34-ef9e-5b84f1715af5	2390	Ravne na Koroškem
00050000-55c4-bd34-519f-0dad3381ec99	9246	Razkrižje
00050000-55c4-bd34-6016-b1acd9f0d6f3	3332	Rečica ob Savinji
00050000-55c4-bd34-ed3f-639f57cd9fb9	5292	Renče
00050000-55c4-bd34-778d-3c5439b60e27	1310	Ribnica
00050000-55c4-bd34-8ee2-de90dd34dc37	2364	Ribnica na Pohorju
00050000-55c4-bd34-5857-1f26a5a9d3d8	3272	Rimske Toplice
00050000-55c4-bd34-20f3-94dd123aed73	1314	Rob
00050000-55c4-bd34-6625-363a9fda3254	5215	Ročinj
00050000-55c4-bd34-9e6f-8da700ca2769	3250	Rogaška Slatina
00050000-55c4-bd34-b017-b5768f418ca5	9262	Rogašovci
00050000-55c4-bd34-f7f0-bb7f2e74bc26	3252	Rogatec
00050000-55c4-bd34-a404-062f0009418a	1373	Rovte
00050000-55c4-bd34-dc46-b9173cec0a5b	2342	Ruše
00050000-55c4-bd34-8e27-2c246cd4daf8	1282	Sava
00050000-55c4-bd34-ecc7-0b9cf737ed9d	6333	Sečovlje/Sicciole
00050000-55c4-bd34-e180-115aa70da712	4227	Selca
00050000-55c4-bd34-6b9e-7f51ab906794	2352	Selnica ob Dravi
00050000-55c4-bd34-8d9f-ef8433132d5b	8333	Semič
00050000-55c4-bd34-bcd2-66ca661f27b1	8281	Senovo
00050000-55c4-bd34-c097-4556532a7453	6224	Senožeče
00050000-55c4-bd34-810d-f42ead45a16e	8290	Sevnica
00050000-55c4-bd34-fe68-4c8b101dadc8	6210	Sežana
00050000-55c4-bd34-0615-e9ecb00e57de	2214	Sladki Vrh
00050000-55c4-bd34-9879-44d49bb83d5b	5283	Slap ob Idrijci
00050000-55c4-bd34-aee3-c28ceef981e0	2380	Slovenj Gradec
00050000-55c4-bd34-65a1-46f37d5fb668	2310	Slovenska Bistrica
00050000-55c4-bd34-6246-7820c03063b0	3210	Slovenske Konjice
00050000-55c4-bd34-6b6b-7aaf756c7d25	1216	Smlednik
00050000-55c4-bd34-dacf-438c60111a29	5232	Soča
00050000-55c4-bd34-f4ab-b07056622158	1317	Sodražica
00050000-55c4-bd34-68f6-85621a2592ab	3335	Solčava
00050000-55c4-bd34-11be-e4ec39dddd58	5250	Solkan
00050000-55c4-bd34-9ca3-f027ef17eb93	4229	Sorica
00050000-55c4-bd34-b697-3e85373099e2	4225	Sovodenj
00050000-55c4-bd34-84ae-ca9e23deb941	5281	Spodnja Idrija
00050000-55c4-bd34-2206-4cd4238a609f	2241	Spodnji Duplek
00050000-55c4-bd34-8a80-0054772d4e83	9245	Spodnji Ivanjci
00050000-55c4-bd34-b2bb-d7295425e56f	2277	Središče ob Dravi
00050000-55c4-bd34-a465-9b0c913f5fcc	4267	Srednja vas v Bohinju
00050000-55c4-bd34-701d-9a96f27d80fc	8256	Sromlje 
00050000-55c4-bd34-75ba-b6442e78b588	5224	Srpenica
00050000-55c4-bd34-5580-cac289f9f984	1242	Stahovica
00050000-55c4-bd34-8f29-a884c9d7fe37	1332	Stara Cerkev
00050000-55c4-bd34-0b07-ac44998e9a46	8342	Stari trg ob Kolpi
00050000-55c4-bd34-edc2-dc3740ebb4ab	1386	Stari trg pri Ložu
00050000-55c4-bd34-4c26-e6b28b5f46de	2205	Starše
00050000-55c4-bd34-4515-2e35dd3c7f24	2289	Stoperce
00050000-55c4-bd34-b6b6-77b8f727f9ac	8322	Stopiče
00050000-55c4-bd34-87f7-2ec3d006e34e	3206	Stranice
00050000-55c4-bd34-2590-b0bafa024d45	8351	Straža
00050000-55c4-bd34-63e6-a3169bd8a760	1313	Struge
00050000-55c4-bd34-21fa-30306c9a3437	8293	Studenec
00050000-55c4-bd34-a21e-13a828058fe6	8331	Suhor
00050000-55c4-bd34-5e30-83a5904c72eb	2233	Sv. Ana v Slovenskih goricah
00050000-55c4-bd34-a5e6-fa89d79dade8	2235	Sv. Trojica v Slovenskih goricah
00050000-55c4-bd34-6d00-0d0cbe599bbc	2353	Sveti Duh na Ostrem Vrhu
00050000-55c4-bd34-4e35-53cbf4cb90a5	9244	Sveti Jurij ob Ščavnici
00050000-55c4-bd34-62b5-ab45a497af9b	3264	Sveti Štefan
00050000-55c4-bd34-d16a-9cfb1f62d0c9	2258	Sveti Tomaž
00050000-55c4-bd34-a723-372a8fef4a94	9204	Šalovci
00050000-55c4-bd34-8502-635826e39612	5261	Šempas
00050000-55c4-bd34-3fa2-62a00696a468	5290	Šempeter pri Gorici
00050000-55c4-bd34-6e07-f061d91d46c8	3311	Šempeter v Savinjski dolini
00050000-55c4-bd34-18a9-090856f78813	4208	Šenčur
00050000-55c4-bd34-801e-54ccbc79dd27	2212	Šentilj v Slovenskih goricah
00050000-55c4-bd34-f86d-004221d68f09	8297	Šentjanž
00050000-55c4-bd34-ee82-2a99e35eda90	2373	Šentjanž pri Dravogradu
00050000-55c4-bd34-b702-37efa9f1e839	8310	Šentjernej
00050000-55c4-bd34-3d28-48c0c0f13bc5	3230	Šentjur
00050000-55c4-bd34-ee7b-ec264492d118	3271	Šentrupert
00050000-55c4-bd34-9319-dd376354b9a6	8232	Šentrupert
00050000-55c4-bd34-acbd-2d516420ecfb	1296	Šentvid pri Stični
00050000-55c4-bd34-cb90-91388a6bc951	8275	Škocjan
00050000-55c4-bd34-d2ba-48e5226a8738	6281	Škofije
00050000-55c4-bd34-a9fb-df91914d39c6	4220	Škofja Loka
00050000-55c4-bd34-eb88-6bcac47aea6f	3211	Škofja vas
00050000-55c4-bd34-0966-44433e884943	1291	Škofljica
00050000-55c4-bd34-914f-c5de562acdda	6274	Šmarje
00050000-55c4-bd34-ecd9-8adb47e112fe	1293	Šmarje - Sap
00050000-55c4-bd34-d6fe-7c99c9c2fda8	3240	Šmarje pri Jelšah
00050000-55c4-bd34-70d2-dfcb1cc85b41	8220	Šmarješke Toplice
00050000-55c4-bd34-07c5-1bbc38bd580b	2315	Šmartno na Pohorju
00050000-55c4-bd34-55ed-e774b18c46c2	3341	Šmartno ob Dreti
00050000-55c4-bd34-4a94-9bf1dbb5a3e5	3327	Šmartno ob Paki
00050000-55c4-bd34-3087-e22a491b6e3d	1275	Šmartno pri Litiji
00050000-55c4-bd34-2ba3-e9547680c71e	2383	Šmartno pri Slovenj Gradcu
00050000-55c4-bd34-1762-f06f64e83e4b	3201	Šmartno v Rožni dolini
00050000-55c4-bd34-bdd1-5749cf9239d3	3325	Šoštanj
00050000-55c4-bd34-0f74-b8028c709159	6222	Štanjel
00050000-55c4-bd34-ed33-9c29923b6eb6	3220	Štore
00050000-55c4-bd34-a1eb-b30f67a97495	3304	Tabor
00050000-55c4-bd34-eff2-80e1b22be106	3221	Teharje
00050000-55c4-bd34-9a41-50d97fed7b59	9251	Tišina
00050000-55c4-bd34-1935-5ebb00bfc1d7	5220	Tolmin
00050000-55c4-bd34-ba76-4af5ad0b6590	3326	Topolšica
00050000-55c4-bd34-2b87-0ce11ee7e59f	2371	Trbonje
00050000-55c4-bd34-0602-ca770556b972	1420	Trbovlje
00050000-55c4-bd34-3a6d-68c9f1099d0a	8231	Trebelno 
00050000-55c4-bd34-64b2-4d8e95550f0d	8210	Trebnje
00050000-55c4-bd34-3829-0ac86be8d23f	5252	Trnovo pri Gorici
00050000-55c4-bd34-98c4-d8d64f80f1c7	2254	Trnovska vas
00050000-55c4-bd34-7d17-4c90945d4ab4	1222	Trojane
00050000-55c4-bd34-4a4e-1c6ab03631d1	1236	Trzin
00050000-55c4-bd34-10f7-6c173d14f400	4290	Tržič
00050000-55c4-bd34-3e83-76191e9089a9	8295	Tržišče
00050000-55c4-bd34-b617-9b96de49b1ec	1311	Turjak
00050000-55c4-bd34-436b-e8975ed099a9	9224	Turnišče
00050000-55c4-bd34-3c15-22d678c576e2	8323	Uršna sela
00050000-55c4-bd34-c2eb-e85c21e0821a	1252	Vače
00050000-55c4-bd34-e621-80e2994ff686	3320	Velenje 
00050000-55c4-bd34-8762-21ffdfcfe09c	3322	Velenje - poštni predali
00050000-55c4-bd34-a999-5326cc88bf1c	8212	Velika Loka
00050000-55c4-bd34-94ce-9bf2a9c5c9bc	2274	Velika Nedelja
00050000-55c4-bd34-81b3-b3d480c0675f	9225	Velika Polana
00050000-55c4-bd34-687c-27ea746ac146	1315	Velike Lašče
00050000-55c4-bd34-4bfd-5b6b64f9942d	8213	Veliki Gaber
00050000-55c4-bd34-ae97-5668c701dcbf	9241	Veržej
00050000-55c4-bd34-75d5-572261835aff	1312	Videm - Dobrepolje
00050000-55c4-bd34-188c-f809d3f721da	2284	Videm pri Ptuju
00050000-55c4-bd34-7384-68afb2b773ee	8344	Vinica
00050000-55c4-bd34-5bb4-707fe355463b	5271	Vipava
00050000-55c4-bd34-541f-5671c39fb032	4212	Visoko
00050000-55c4-bd34-2d86-26c2ba9bd4c5	1294	Višnja Gora
00050000-55c4-bd34-e001-d7aaf58423fe	3205	Vitanje
00050000-55c4-bd34-fe91-cd3430beacf9	2255	Vitomarci
00050000-55c4-bd34-1f3c-075c3f7d6b75	1217	Vodice
00050000-55c4-bd34-b290-1ace72066a29	3212	Vojnik\t
00050000-55c4-bd34-3377-56124f27408a	5293	Volčja Draga
00050000-55c4-bd34-7742-ca2a50458d22	2232	Voličina
00050000-55c4-bd34-1be4-a0f6770c71bc	3305	Vransko
00050000-55c4-bd34-1165-52b8750a0e56	6217	Vremski Britof
00050000-55c4-bd34-fb74-280d68e10643	1360	Vrhnika
00050000-55c4-bd34-2465-09770d02ac35	2365	Vuhred
00050000-55c4-bd34-2ad7-89089b522a84	2367	Vuzenica
00050000-55c4-bd34-62ba-7f06811757d7	8292	Zabukovje 
00050000-55c4-bd34-b921-370a10065424	1410	Zagorje ob Savi
00050000-55c4-bd34-cf0c-f318dbf4ca12	1303	Zagradec
00050000-55c4-bd34-7244-2d58dc4234b5	2283	Zavrč
00050000-55c4-bd34-e5f7-9e165e63e19c	8272	Zdole 
00050000-55c4-bd34-2886-c904a49b6f0a	4201	Zgornja Besnica
00050000-55c4-bd34-afbc-bebde58d4fe7	2242	Zgornja Korena
00050000-55c4-bd34-0b78-437bae94f9be	2201	Zgornja Kungota
00050000-55c4-bd34-f170-388a527c183b	2316	Zgornja Ložnica
00050000-55c4-bd34-249e-e0a5198a59ab	2314	Zgornja Polskava
00050000-55c4-bd34-b342-55551698c006	2213	Zgornja Velka
00050000-55c4-bd34-0dbd-58fb0cfd43fd	4247	Zgornje Gorje
00050000-55c4-bd34-557b-5f2082a73b07	4206	Zgornje Jezersko
00050000-55c4-bd34-4b85-09d33c06c375	2285	Zgornji Leskovec
00050000-55c4-bd34-3081-27f1169e599b	1432	Zidani Most
00050000-55c4-bd34-b8c5-13789d560294	3214	Zreče
00050000-55c4-bd34-c122-15284a623607	4209	Žabnica
00050000-55c4-bd34-8eb8-a6d7a61ba3ab	3310	Žalec
00050000-55c4-bd34-e777-033a33413557	4228	Železniki
00050000-55c4-bd34-b7bd-a36db854f7ba	2287	Žetale
00050000-55c4-bd34-9871-1ff9211dc766	4226	Žiri
00050000-55c4-bd34-5dcc-b9dab04bfb08	4274	Žirovnica
00050000-55c4-bd34-f8a2-945a2673d18c	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12590830)
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
-- TOC entry 3003 (class 0 OID 12590637)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12590715)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12590842)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12591173)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12591183)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c4-bd35-ceea-83d01747df3d	00080000-55c4-bd35-12f7-e065793f022f	0900	AK
00190000-55c4-bd35-3000-af1cd7cb0835	00080000-55c4-bd35-bc85-37dabed826a5	0987	AK
00190000-55c4-bd35-e6cf-42c91cdaf9f9	00080000-55c4-bd35-5afc-522ed55becf2	0989	AK
00190000-55c4-bd35-da89-7e047f97dee1	00080000-55c4-bd35-14b7-d1c1428c5fb5	0986	AK
00190000-55c4-bd35-e99c-ad37af6a377a	00080000-55c4-bd35-d1f2-d0c4e0994552	0984	AK
00190000-55c4-bd35-e283-83d865942a67	00080000-55c4-bd35-c1b7-5a323325e232	0983	AK
00190000-55c4-bd35-807a-83114247e871	00080000-55c4-bd35-31bb-f93c045d09f2	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12591129)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c4-bd35-1f3d-9e999e3531c6	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3048 (class 0 OID 12591191)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12590871)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c4-bd35-0f29-8e51bda98773	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c4-bd35-4122-da7be3e59e61	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c4-bd35-9d94-12fe9ff9cd72	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c4-bd35-aa76-4788e3536565	0004	Mali oder	t	24	Mali oder 
00220000-55c4-bd35-8249-6bc90a7e8aba	0005	Komorni oder	t	15	Komorni oder
00220000-55c4-bd35-d76b-d21a9e104c46	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c4-bd35-4db1-47b96bbf40dc	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12590815)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12590805)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12590990)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12590939)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12590507)
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
-- TOC entry 3028 (class 0 OID 12590881)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12590545)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c4-bd34-181b-b8f8d38dc22b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c4-bd34-961b-e5cfd8b21dce	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c4-bd34-d58d-b58dc711b885	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c4-bd34-2056-1c4755a95f82	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c4-bd34-a1b8-2b025a23dc89	planer	Planer dogodkov v koledarju	t
00020000-55c4-bd34-0b6c-3a33d787c003	kadrovska	Kadrovska služba	t
00020000-55c4-bd34-7fa0-acf6ce82e474	arhivar	Ažuriranje arhivalij	t
00020000-55c4-bd34-7817-615d29dc7b90	igralec	Igralec	t
00020000-55c4-bd34-41b4-46815eb3a7aa	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c4-bd35-df60-df69608d35b1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12590529)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c4-bd34-75df-2fd90fc27186	00020000-55c4-bd34-d58d-b58dc711b885
00010000-55c4-bd34-f1dc-0a30c28e0018	00020000-55c4-bd34-d58d-b58dc711b885
00010000-55c4-bd35-fd48-997bf66d8d00	00020000-55c4-bd35-df60-df69608d35b1
\.


--
-- TOC entry 3030 (class 0 OID 12590895)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12590836)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12590782)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12591232)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c4-bd34-89ec-c0661e7d22e3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c4-bd34-e54d-3c828b1de131	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c4-bd34-5890-8b9a8182849d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c4-bd34-8469-66b78d78bdbc	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c4-bd34-757d-8a839e22f66c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12591224)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c4-bd34-81ef-80b3bccf6187	00230000-55c4-bd34-8469-66b78d78bdbc	popa
00240000-55c4-bd34-e69e-2ed83b3abb37	00230000-55c4-bd34-8469-66b78d78bdbc	oseba
00240000-55c4-bd34-fb84-871d54a9f9c3	00230000-55c4-bd34-8469-66b78d78bdbc	sezona
00240000-55c4-bd34-aa72-2c21009dff65	00230000-55c4-bd34-e54d-3c828b1de131	prostor
00240000-55c4-bd34-393e-aa04b5631860	00230000-55c4-bd34-8469-66b78d78bdbc	besedilo
00240000-55c4-bd34-9736-5bfe59fcf6da	00230000-55c4-bd34-8469-66b78d78bdbc	uprizoritev
00240000-55c4-bd34-3056-7ad8cc39a8aa	00230000-55c4-bd34-8469-66b78d78bdbc	funkcija
00240000-55c4-bd34-7194-cec4c17614ba	00230000-55c4-bd34-8469-66b78d78bdbc	tipfunkcije
00240000-55c4-bd34-7639-e22b35bc6b68	00230000-55c4-bd34-8469-66b78d78bdbc	alternacija
00240000-55c4-bd34-217d-e9e9e70bfeef	00230000-55c4-bd34-89ec-c0661e7d22e3	pogodba
00240000-55c4-bd34-bacb-2cc198035e01	00230000-55c4-bd34-8469-66b78d78bdbc	zaposlitev
00240000-55c4-bd34-6876-f8a887a8890c	00230000-55c4-bd34-89ec-c0661e7d22e3	programdela
00240000-55c4-bd34-72fd-a20310b3a193	00230000-55c4-bd34-8469-66b78d78bdbc	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12591219)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12590949)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c4-bd35-6cdc-3c05d1451179	000e0000-55c4-bd35-cb52-bfbbe9d96274	00080000-55c4-bd35-abab-23b2dae3bda8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c4-bd35-7878-ec96c906c043	000e0000-55c4-bd35-cb52-bfbbe9d96274	00080000-55c4-bd35-abab-23b2dae3bda8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c4-bd35-7fb3-71e4a316b47f	000e0000-55c4-bd35-cb52-bfbbe9d96274	00080000-55c4-bd35-bd79-037dc54146a0	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c4-bd35-c632-ee9f620af4a3	000e0000-55c4-bd35-cb52-bfbbe9d96274	00080000-55c4-bd35-bd79-037dc54146a0	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12590609)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12590792)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c4-bd35-e1c4-2444bc7a9dd6	00180000-55c4-bd35-cdfc-26dfa239da01	000c0000-55c4-bd35-184d-c1414027923e	00090000-55c4-bd35-491f-5b0058d8d753	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-bd35-0b86-aa3e3e744c69	00180000-55c4-bd35-cdfc-26dfa239da01	000c0000-55c4-bd35-955d-fe6b5d1cfd63	00090000-55c4-bd35-8ecc-feb0a6c65c0d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-bd35-af6f-9cab889a6335	00180000-55c4-bd35-cdfc-26dfa239da01	000c0000-55c4-bd35-2494-c827aeac5d0a	00090000-55c4-bd35-7d74-c4b18118e6fd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-bd35-3c0a-62e37fe97a12	00180000-55c4-bd35-cdfc-26dfa239da01	000c0000-55c4-bd35-d2af-0f842de645ca	00090000-55c4-bd35-0783-cee933866378	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-bd35-4283-c07c1c985812	00180000-55c4-bd35-cdfc-26dfa239da01	000c0000-55c4-bd35-32c9-845b484e9e94	00090000-55c4-bd35-cbdb-4ad1031c20c7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-bd35-e140-d0fb3fa3daf9	00180000-55c4-bd35-9a3f-3b6e73af20e7	\N	00090000-55c4-bd35-cbdb-4ad1031c20c7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12590979)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c4-bd34-910e-f5519a8efd09	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c4-bd34-5be4-56cf004e393d	Priredba	Priredba	Priredba	umetnik
000f0000-55c4-bd34-c2c4-0a86a68548bd	Prevod	Prevod	Prevod	umetnik
000f0000-55c4-bd34-75f6-1646800188a8	Režija	Režija	Režija	umetnik
000f0000-55c4-bd34-130b-04e9a6e38729	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c4-bd34-159c-55a3217ccb13	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c4-bd34-a283-70e21b42f632	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c4-bd34-cd37-a5bdd9b92a2c	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c4-bd34-244f-b0b9a2a2b3ea	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c4-bd34-884b-33ee9e5dfe7b	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c4-bd34-10d9-49beedf5295f	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c4-bd34-95dd-33ca950f5a01	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c4-bd34-c839-a39cd88ca1f7	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c4-bd34-6635-a9724b984ef7	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c4-bd34-9dce-37d237d3dab9	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c4-bd34-dca0-a61b27799170	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c4-bd34-b12a-47c5665e2d6a	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c4-bd34-fa54-b6fb0d50b211	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12591201)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c4-bd34-64aa-8b2addb1dd18	01	Velika predstava	f	1.00	1.00
002b0000-55c4-bd34-aeb2-6068e123f86d	02	Mala predstava	f	0.50	0.50
002b0000-55c4-bd34-7dbf-d7eeade92d37	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c4-bd34-523d-a43f0ea73aa4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c4-bd34-c448-c6f388a6f668	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12590672)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12590516)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c4-bd34-f1dc-0a30c28e0018	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO0c7TzjlVF9lthuBoO9cO6IRj./.syvC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-73e7-775fc6b353b0	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-2f49-99d21962584d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-d46e-21a3b36443fc	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-0513-6eac66f912bf	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-0ad9-e65b6c65045b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-b18c-4533d9d49952	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-be57-68334fc8ba3d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-1d36-49c6637dc536	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-387b-6cae7cb904fd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c4-bd35-fd48-997bf66d8d00	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c4-bd34-75df-2fd90fc27186	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12591027)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c4-bd35-f6be-6579d4aad745	00160000-55c4-bd35-0582-b0fb037b2831	00150000-55c4-bd34-9591-cc15d974fe43	00140000-55c4-bd33-bf20-a8e0f1fa7a6e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c4-bd35-8249-6bc90a7e8aba
000e0000-55c4-bd35-cb52-bfbbe9d96274	00160000-55c4-bd35-6371-feffa8ad5701	00150000-55c4-bd34-42ee-2459661a1ceb	00140000-55c4-bd33-525e-03eca005efbe	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c4-bd35-d76b-d21a9e104c46
000e0000-55c4-bd35-36c5-478fd807bea1	\N	00150000-55c4-bd34-42ee-2459661a1ceb	00140000-55c4-bd33-525e-03eca005efbe	00190000-55c4-bd35-3000-af1cd7cb0835	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c4-bd35-8249-6bc90a7e8aba
000e0000-55c4-bd35-85d2-48f4281b20b4	\N	00150000-55c4-bd34-42ee-2459661a1ceb	00140000-55c4-bd33-525e-03eca005efbe	00190000-55c4-bd35-3000-af1cd7cb0835	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c4-bd35-8249-6bc90a7e8aba
000e0000-55c4-bd35-e798-98f0cba8ea22	\N	00150000-55c4-bd34-42ee-2459661a1ceb	00140000-55c4-bd33-525e-03eca005efbe	00190000-55c4-bd35-3000-af1cd7cb0835	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c4-bd35-0f29-8e51bda98773
\.


--
-- TOC entry 3011 (class 0 OID 12590734)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c4-bd35-df4e-7bacf5bab41c	000e0000-55c4-bd35-cb52-bfbbe9d96274	1	
00200000-55c4-bd35-882e-c75057c88fa2	000e0000-55c4-bd35-cb52-bfbbe9d96274	2	
\.


--
-- TOC entry 3026 (class 0 OID 12590863)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12591271)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12591243)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12591283)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12590932)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c4-bd35-f0eb-3e02f60797a3	00090000-55c4-bd35-8ecc-feb0a6c65c0d	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-bd35-3df5-c2ef14d81576	00090000-55c4-bd35-7d74-c4b18118e6fd	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-bd35-71dd-f55634f41118	00090000-55c4-bd35-db0c-b5a00348bdea	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-bd35-96f6-2b9b485c9ba4	00090000-55c4-bd35-cf7f-bb8872986aec	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-bd35-2633-2cbcfb2eb661	00090000-55c4-bd35-491f-5b0058d8d753	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-bd35-7cd8-7941ae1b1586	00090000-55c4-bd35-1fbd-1d6151509c81	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12590766)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12591017)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c4-bd33-bf20-a8e0f1fa7a6e	01	Drama	drama (SURS 01)
00140000-55c4-bd33-3677-1765dad5c1b6	02	Opera	opera (SURS 02)
00140000-55c4-bd33-7d74-c1beb6f41a2e	03	Balet	balet (SURS 03)
00140000-55c4-bd33-52b5-11f80738e86e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c4-bd33-d6ba-b549ce354e3c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c4-bd33-525e-03eca005efbe	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c4-bd33-3ad2-086ed6e36de5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12590922)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c4-bd34-c7e2-9168784e91de	01	Opera	opera
00150000-55c4-bd34-117a-257ce9a931cb	02	Opereta	opereta
00150000-55c4-bd34-ffa0-17a87468244b	03	Balet	balet
00150000-55c4-bd34-0980-1fbc23ae5fe5	04	Plesne prireditve	plesne prireditve
00150000-55c4-bd34-8b3d-497947356e37	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c4-bd34-05e0-59966f34a3a3	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c4-bd34-9433-e292e5ebf067	07	Biografska drama	biografska drama
00150000-55c4-bd34-9591-cc15d974fe43	08	Komedija	komedija
00150000-55c4-bd34-9899-5582848f6c56	09	Črna komedija	črna komedija
00150000-55c4-bd34-c481-cfbf9e4953f9	10	E-igra	E-igra
00150000-55c4-bd34-42ee-2459661a1ceb	11	Kriminalka	kriminalka
00150000-55c4-bd34-c463-44122b0fba74	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12590572)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12591074)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12591064)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12590978)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12591324)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12590756)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12590781)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12591217)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12590698)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12591123)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12590918)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12590732)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12590775)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12590712)
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
-- TOC entry 2630 (class 2606 OID 12590828)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12591300)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12591307)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12591332)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12590855)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12590670)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12590581)
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
-- TOC entry 2544 (class 2606 OID 12590605)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12590559)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12590544)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12590861)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12590894)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12591012)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12590634)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12590658)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12590834)
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
-- TOC entry 2559 (class 2606 OID 12590648)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12590719)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12590846)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12591180)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12591188)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12591171)
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
-- TOC entry 2736 (class 2606 OID 12591199)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12590878)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12590819)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12590810)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12591000)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12590946)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12590515)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12590885)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12590533)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12590553)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12590903)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12590841)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12590790)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12591241)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12591229)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12591223)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12590959)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12590614)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12590801)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12590989)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12591211)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12590683)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12590528)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12591043)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12590741)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12590869)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12591281)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12591265)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12591289)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12590937)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12590770)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12591025)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12590930)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12590763)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12590960)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12590961)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12591302)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12591301)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12590636)
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
-- TOC entry 2643 (class 1259 OID 12590862)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12591269)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12591268)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12591270)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12591267)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12591266)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12590848)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12590847)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12590742)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12590919)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12590921)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12590920)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12590714)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12590713)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12591200)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12591014)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12591015)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12591016)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12591290)
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
-- TOC entry 2697 (class 1259 OID 12591048)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12591045)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12591049)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12591047)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12591046)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12590685)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12590684)
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
-- TOC entry 2542 (class 1259 OID 12590608)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12590886)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12590776)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12590560)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12590562)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12590906)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12590905)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12590904)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12590720)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12590722)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12590721)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12591231)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12590814)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12590812)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12590811)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12590813)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12590534)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12590535)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12590870)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12591325)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12591333)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12591334)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12590835)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12590947)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12590948)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12591128)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12591127)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12591124)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12591125)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12591126)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12590650)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12590649)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12590651)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12591181)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12591182)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12591078)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12591079)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12591076)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12591077)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12590938)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12590823)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12590822)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12590820)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12590821)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12591066)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12591065)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12591172)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12590733)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12591218)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12591308)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12591309)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12590583)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12590582)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12590615)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12590616)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12590804)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12590803)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12590802)
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
-- TOC entry 2594 (class 1259 OID 12590765)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12590761)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12590758)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12590759)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12590757)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12590762)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12590760)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12590635)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12590699)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12590701)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12590700)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12590702)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12590829)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12591013)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12591044)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12590606)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12590607)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12590931)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12591242)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12590671)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12591230)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12590880)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12590879)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12591075)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12590659)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12591026)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12591282)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12591189)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12591190)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12590791)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12590554)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12590764)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 12591470)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 12591455)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 12591460)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 12591480)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 12591450)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 12591475)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12591465)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 12591625)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 12591630)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 12591800)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 12591795)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12591385)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12591565)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 12591780)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12591775)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 12591785)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 12591770)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 12591765)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 12591560)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 12591555)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12591445)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12591595)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12591605)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12591600)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 12591420)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 12591415)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12591545)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12591750)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 12591635)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12591640)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 12591645)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12591790)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 12591665)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 12591650)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 12591670)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12591660)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 12591655)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 12591410)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 12591405)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 12591370)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 12591365)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12591575)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12591485)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 12591345)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 12591350)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 12591590)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12591585)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 12591580)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 12591425)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 12591435)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12591430)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12591760)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 12591520)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 12591510)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 12591505)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 12591515)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 12591335)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 12591340)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12591570)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12591815)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 12591820)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 12591825)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12591550)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 12591615)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 12591620)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 12591725)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 12591720)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 12591705)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 12591710)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12591715)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12591395)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 12591390)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 12591400)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 12591735)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 12591740)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 12591695)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 12591700)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 12591685)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 12591690)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12591610)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 12591540)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 12591535)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 12591525)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 12591530)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 12591680)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 12591675)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12591730)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12591440)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12591745)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12591755)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 12591805)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 12591810)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 12591360)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 12591355)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 12591375)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 12591380)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 12591500)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12591495)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 12591490)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-07 16:14:14 CEST

--
-- PostgreSQL database dump complete
--

