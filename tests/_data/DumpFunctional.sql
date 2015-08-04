--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-04 16:54:47 CEST

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
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 246
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 11824269)
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
-- TOC entry 228 (class 1259 OID 11824772)
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
-- TOC entry 227 (class 1259 OID 11824755)
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
-- TOC entry 221 (class 1259 OID 11824667)
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
-- TOC entry 244 (class 1259 OID 11825014)
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
-- TOC entry 197 (class 1259 OID 11824448)
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
-- TOC entry 200 (class 1259 OID 11824482)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11824916)
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
-- TOC entry 192 (class 1259 OID 11824391)
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
-- TOC entry 229 (class 1259 OID 11824785)
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
-- TOC entry 216 (class 1259 OID 11824612)
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
-- TOC entry 195 (class 1259 OID 11824428)
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
-- TOC entry 199 (class 1259 OID 11824476)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11824408)
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
-- TOC entry 205 (class 1259 OID 11824529)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11824995)
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
-- TOC entry 243 (class 1259 OID 11825007)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11825030)
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
-- TOC entry 209 (class 1259 OID 11824554)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11824365)
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
-- TOC entry 184 (class 1259 OID 11824278)
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
-- TOC entry 185 (class 1259 OID 11824289)
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
-- TOC entry 180 (class 1259 OID 11824243)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11824262)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11824561)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11824592)
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
-- TOC entry 224 (class 1259 OID 11824706)
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
-- TOC entry 187 (class 1259 OID 11824322)
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
-- TOC entry 189 (class 1259 OID 11824357)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11824535)
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
-- TOC entry 188 (class 1259 OID 11824342)
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
-- TOC entry 194 (class 1259 OID 11824420)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11824547)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11824877)
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
-- TOC entry 232 (class 1259 OID 11824887)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11824833)
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
-- TOC entry 233 (class 1259 OID 11824895)
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
-- TOC entry 212 (class 1259 OID 11824576)
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
-- TOC entry 204 (class 1259 OID 11824520)
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
-- TOC entry 203 (class 1259 OID 11824510)
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
-- TOC entry 223 (class 1259 OID 11824695)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11824644)
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
-- TOC entry 177 (class 1259 OID 11824214)
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
-- TOC entry 176 (class 1259 OID 11824212)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 11824586)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11824252)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11824236)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11824600)
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
-- TOC entry 207 (class 1259 OID 11824541)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11824487)
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
-- TOC entry 238 (class 1259 OID 11824936)
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
-- TOC entry 237 (class 1259 OID 11824928)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11824923)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11824654)
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
-- TOC entry 186 (class 1259 OID 11824314)
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
-- TOC entry 202 (class 1259 OID 11824497)
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
-- TOC entry 222 (class 1259 OID 11824684)
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
-- TOC entry 234 (class 1259 OID 11824905)
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
-- TOC entry 191 (class 1259 OID 11824377)
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
-- TOC entry 178 (class 1259 OID 11824223)
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
-- TOC entry 226 (class 1259 OID 11824732)
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
-- TOC entry 196 (class 1259 OID 11824439)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11824568)
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
-- TOC entry 240 (class 1259 OID 11824975)
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
-- TOC entry 239 (class 1259 OID 11824947)
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
-- TOC entry 241 (class 1259 OID 11824987)
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
-- TOC entry 218 (class 1259 OID 11824637)
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
-- TOC entry 198 (class 1259 OID 11824471)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11824722)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11824627)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 11824217)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2997 (class 0 OID 11824269)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 11824772)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c0-d236-4b14-8bd9f8dbef07	000d0000-55c0-d236-a6d2-2c10b30cfac4	\N	00090000-55c0-d236-89bb-f98a98055a81	000b0000-55c0-d236-308e-1107eb825d3f	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c0-d236-6a1b-9c4d8040515f	000d0000-55c0-d236-0a91-8ae09c51c3fa	00100000-55c0-d236-a441-9563aefc8dbe	00090000-55c0-d236-0c71-3fd0e826b447	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c0-d236-5f5e-a053b571d8fe	000d0000-55c0-d236-56c7-9bf2b12006f6	00100000-55c0-d236-f110-71e19083c6c9	00090000-55c0-d236-09f4-6e2a20546d34	\N	0003	t	\N	2015-08-04	\N	2	\N	\N	f	f
000c0000-55c0-d236-2907-b23af4b75289	000d0000-55c0-d236-3ce0-fdce8d543bff	\N	00090000-55c0-d236-3d57-c2ad601b2596	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c0-d236-7eda-affe5e88fd41	000d0000-55c0-d236-6780-0d6409732709	\N	00090000-55c0-d236-ba40-08b3e4bcde08	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c0-d236-772a-b3d72b971d99	000d0000-55c0-d236-68ce-f95703b8aeea	\N	00090000-55c0-d236-ddad-e92064a22420	000b0000-55c0-d236-3f3e-1883453988ab	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c0-d236-4a2f-7690612932f2	000d0000-55c0-d236-c8ce-7cae7cfc217e	00100000-55c0-d236-070a-4554a4f3f54e	00090000-55c0-d236-d06c-0926324dd172	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c0-d236-a463-a70b7d0b44a3	000d0000-55c0-d236-dcbc-b84542f38c06	\N	00090000-55c0-d236-c280-f188f89c5f80	000b0000-55c0-d236-f475-c5517aa9f834	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c0-d236-6040-d8d2e6115d47	000d0000-55c0-d236-c8ce-7cae7cfc217e	00100000-55c0-d236-a6c5-e5432619e1ab	00090000-55c0-d236-d83b-4241a07abcf6	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c0-d236-e0b5-8294aa86f79b	000d0000-55c0-d236-c8ce-7cae7cfc217e	00100000-55c0-d236-2e4d-8eb1f12da911	00090000-55c0-d236-cb80-da3858ba5a58	\N	0010	t	\N	2015-08-04	\N	16	\N	\N	f	t
000c0000-55c0-d236-b28a-49281637d336	000d0000-55c0-d236-c8ce-7cae7cfc217e	00100000-55c0-d236-44c3-c349abd61cb8	00090000-55c0-d236-568d-6c69df086a89	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3041 (class 0 OID 11824755)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 11824667)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c0-d236-67cf-f05aee76195f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c0-d236-4577-92a0a0611290	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c0-d236-0365-492f190944cc	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3058 (class 0 OID 11825014)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11824448)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c0-d236-3d34-7f11d97950eb	\N	\N	00200000-55c0-d236-686d-e6f42196ab5a	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c0-d236-64e7-49a22b44fd74	\N	\N	00200000-55c0-d236-13ef-52f64801df66	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c0-d236-a49e-06805fa3d18e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c0-d236-51cf-57e9aef7022b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c0-d236-a6ea-3ebbe8f9beb0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3014 (class 0 OID 11824482)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 11824916)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11824391)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c0-d233-3f34-a0fe6d8805c2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c0-d233-f753-335aedd49c2f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c0-d233-b2f5-44a43bc84ab8	AL	ALB	008	Albania 	Albanija	\N
00040000-55c0-d233-7509-5113654c6d85	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c0-d233-7186-364b5f9d9a76	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c0-d233-f310-441de5e9f0cd	AD	AND	020	Andorra 	Andora	\N
00040000-55c0-d233-fe7a-3f873052102b	AO	AGO	024	Angola 	Angola	\N
00040000-55c0-d233-6694-dcc478ad1676	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c0-d233-5653-9d2c4365d7d0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c0-d233-33f6-199265eaafcd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c0-d233-65c8-9b1d961b7bb4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c0-d233-eb1e-d1d3ef3d24f6	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c0-d233-1581-e4e32caaf3ab	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c0-d233-c583-35fa44a2927e	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c0-d233-52de-806f1d0a93ed	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c0-d233-a846-b4781d4e89d5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c0-d233-c1b0-f01e721f43ad	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c0-d233-a831-b3139c4d1da5	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c0-d233-2a39-04392e78ffe4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c0-d233-6a13-892a9a194e96	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c0-d233-d11d-c99149e9c623	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c0-d233-f5c3-901eb3038ab7	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c0-d233-3d13-00e6d7ec57ee	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c0-d233-0401-e60d8fed9151	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c0-d233-8d78-1d4a6faefa4e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c0-d233-7af9-07242b6281aa	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c0-d233-a529-b14ba44ce1af	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c0-d233-f1cf-9c7c1cee5580	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c0-d233-0940-4c58caccb0ca	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c0-d233-7785-d324fadecb2a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c0-d233-14cc-3df9b6c8b18c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c0-d233-9d7d-98ca32668ad2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c0-d233-145c-71b01dc4872e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c0-d233-7ffa-cc5b13563a30	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c0-d233-454e-91fd83f8e242	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c0-d233-b5ec-f1c0f96c4cd0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c0-d233-a6f9-3298d2a51cff	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c0-d233-3e68-80fbb79fb9c7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c0-d233-079a-fce9df06b772	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c0-d233-2a44-a34f313b18bd	CA	CAN	124	Canada 	Kanada	\N
00040000-55c0-d233-7780-b7ed78fea698	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c0-d233-7322-1cb89a16e4ff	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c0-d233-31e3-aa69c528c028	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c0-d233-ba02-3282b7918952	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c0-d233-bbc0-c52d82735992	CL	CHL	152	Chile 	Čile	\N
00040000-55c0-d233-540d-db541eac22ae	CN	CHN	156	China 	Kitajska	\N
00040000-55c0-d233-9441-5f6a1a159efc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c0-d233-8134-da8eec94bfa8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c0-d233-6eda-1a6b642d9a4d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c0-d233-99f6-557e03804314	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c0-d233-6691-f112895e0bf8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c0-d233-84c6-41fa59e46f3d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c0-d233-dedb-fe0872b2f782	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c0-d233-fb42-c841c88ab81b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c0-d233-5fd8-2764490fcc68	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c0-d233-1405-0995974e49ec	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c0-d233-a41d-0afadd7e8cdb	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c0-d233-86c9-78ddcd87642b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c0-d233-3530-befa2aac80fd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c0-d233-a8f4-2ee39768aa59	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c0-d233-9d1e-3ba5f78d40a1	DK	DNK	208	Denmark 	Danska	\N
00040000-55c0-d233-2eea-ac0aca727185	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c0-d233-cf9e-b318eb638da9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c0-d233-5326-e1d18442be87	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c0-d233-e895-04a735e2d8d5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c0-d233-80a7-7b6f71c1d7b2	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c0-d233-b0b1-d7c7cab9c23d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c0-d233-4ce2-f244190e23dc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c0-d233-0c0a-d8ac77fa4133	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c0-d233-2074-1707fb7f8426	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c0-d233-6a5c-e2a77bbc0bb4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c0-d233-c1d1-ed29c1081b4f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c0-d233-71c1-f9d6b8757624	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c0-d233-371a-5c75c2149f6b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c0-d233-4a92-62a4b27a41b1	FI	FIN	246	Finland 	Finska	\N
00040000-55c0-d233-bf59-0a911bc88371	FR	FRA	250	France 	Francija	\N
00040000-55c0-d233-0af3-879e98a68c84	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c0-d233-6740-c2dd9dbd29ad	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c0-d233-7d2e-b56c58c35260	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c0-d233-f2c0-885ee6d26aae	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c0-d233-2185-1237c0a481f2	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c0-d233-e372-f1cafef6d785	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c0-d233-945b-553be63e16f0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c0-d233-88c9-b3bed7571392	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c0-d233-57fa-c44859949838	GH	GHA	288	Ghana 	Gana	\N
00040000-55c0-d233-857b-20e15638d0ad	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c0-d233-aef9-de1a359392a0	GR	GRC	300	Greece 	Grčija	\N
00040000-55c0-d233-d835-2337d10df06e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c0-d233-2f20-acf697ee4a31	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c0-d233-62e0-45c13cca1a52	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c0-d233-76e6-695779da80da	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c0-d233-6d55-f0cdf70049ce	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c0-d233-466d-3d17e0caf55a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c0-d233-4ce6-639d120637a0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c0-d233-f52f-177efb99deab	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c0-d233-b495-f65887db5854	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c0-d233-7f04-9b96dd3fa912	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c0-d233-9555-98395cbf17eb	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c0-d233-fb5b-99d6d0eb1815	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c0-d233-66da-c2350082f757	HN	HND	340	Honduras 	Honduras	\N
00040000-55c0-d233-f6c7-aa7ab0e00faa	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c0-d233-1c42-6fa7efe915ae	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c0-d233-bd95-351f70db86c3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c0-d233-e1c0-cbf6a579cba7	IN	IND	356	India 	Indija	\N
00040000-55c0-d233-4eba-e56296031ed0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c0-d233-57a0-b6dc87f95f3e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c0-d233-6e16-7922b0b6e24b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c0-d233-8224-c00c5f434d7e	IE	IRL	372	Ireland 	Irska	\N
00040000-55c0-d233-c8ba-46b236051782	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c0-d233-90c0-a2d494619c8f	IL	ISR	376	Israel 	Izrael	\N
00040000-55c0-d233-a6a8-91ad9cdc31d0	IT	ITA	380	Italy 	Italija	\N
00040000-55c0-d233-8203-a25e7f57add9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c0-d233-1c75-87e0be7e4db8	JP	JPN	392	Japan 	Japonska	\N
00040000-55c0-d233-40d0-fad48170953f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c0-d233-f424-feb70fdaed7c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c0-d233-b85e-aed5135e3638	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c0-d233-602c-fce1fd80df13	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c0-d233-ec29-e7b894610a36	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c0-d233-3d71-c3567e11c632	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c0-d233-773b-9d0419800e13	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c0-d233-f981-084ef1bee335	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c0-d233-9607-d3937492b1e4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c0-d233-12df-ef56747bd47f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c0-d233-f307-4c5fe04236f1	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c0-d233-793d-cb5187f7e5af	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c0-d233-3269-561fc3cdba21	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c0-d233-ca30-bacce5ffa15d	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c0-d233-f501-f827efb8dd82	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c0-d233-8f38-5a73ff48c2c6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c0-d233-270e-8a3d76604617	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c0-d233-821e-787179ba29ff	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c0-d233-9f5b-2b1f5e04df30	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c0-d233-08a8-ceedc5e89308	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c0-d233-bc08-d10c7035165d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c0-d233-1ec5-6df8ef069079	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c0-d233-16f0-1d6fcc61ab1e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c0-d233-8abf-f8474deaacc4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c0-d233-6ed8-aa6673525f6e	ML	MLI	466	Mali 	Mali	\N
00040000-55c0-d233-25e6-9bc89966392a	MT	MLT	470	Malta 	Malta	\N
00040000-55c0-d233-7900-7ee3243a5b84	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c0-d233-c9ba-e37097ecfad9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c0-d233-c9c7-a7d231b1f4a9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c0-d233-7356-f066a8fdeacc	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c0-d233-f94a-22cf420f4eea	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c0-d233-efbc-8ada08025ccb	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c0-d233-86a0-7d8edeec4c21	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c0-d233-a3ce-b4f053adf73f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c0-d233-7b23-9b6e3fc017a1	MC	MCO	492	Monaco 	Monako	\N
00040000-55c0-d233-be15-b66eed288501	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c0-d233-5357-e28f5b71aded	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c0-d233-7876-05a7124c231a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c0-d233-8477-d63e0779e0d8	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c0-d233-bb0b-92ace9de108e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c0-d233-1975-d1bd05f1dfb7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c0-d233-8aa1-feb79475e301	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c0-d233-9847-982f05976fe0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c0-d233-e078-bc0469091e62	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c0-d233-a5f1-ae4528bc6b6e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c0-d233-638c-78652ddac242	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c0-d233-f247-dc58c8fae355	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c0-d233-8e7a-bd2623f6027a	NE	NER	562	Niger 	Niger 	\N
00040000-55c0-d233-1bdb-2518256264eb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c0-d233-7458-7259d9770476	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c0-d233-5386-6010ec5acc17	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c0-d233-8659-8f61bde4f4b5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c0-d233-c9c6-9b2e109a7c42	NO	NOR	578	Norway 	Norveška	\N
00040000-55c0-d233-0b0a-e3d37bd2585b	OM	OMN	512	Oman 	Oman	\N
00040000-55c0-d233-7275-4262d907ec40	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c0-d233-8776-8c21be78ecec	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c0-d233-5318-406ddc7e44da	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c0-d233-2958-123cff7dddc0	PA	PAN	591	Panama 	Panama	\N
00040000-55c0-d233-0864-a0b54ee4a9a9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c0-d233-f7f7-00f4e4139a85	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c0-d233-bafa-ca2e6525439d	PE	PER	604	Peru 	Peru	\N
00040000-55c0-d233-24d3-210c6eafcdc0	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c0-d233-307c-60126128e766	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c0-d233-9a3a-e2e98d7c079d	PL	POL	616	Poland 	Poljska	\N
00040000-55c0-d233-7be9-6c27a09e86a5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c0-d233-4135-cf36791b7fa8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c0-d233-951d-cb5e1361096e	QA	QAT	634	Qatar 	Katar	\N
00040000-55c0-d233-8873-57f978b2a053	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c0-d233-dd3e-e3499494acca	RO	ROU	642	Romania 	Romunija	\N
00040000-55c0-d233-3ef7-bb98800c2b2f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c0-d233-6ab0-81e84cc9d839	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c0-d233-81a9-1c14a9339c4b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c0-d233-b482-975442229f20	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c0-d233-cf94-543f79df6e5e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c0-d233-f977-5e07bb1ac919	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c0-d233-d61f-a75984feda66	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c0-d233-2361-7a16225b657f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c0-d233-263d-453f1328c9cf	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c0-d233-19ca-562d10310754	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c0-d233-03b4-23743cdaf9fe	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c0-d233-c308-c5353826af0c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c0-d233-1dc3-4bed1c789d2f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c0-d233-c30f-dd36cbf1c50c	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c0-d233-6752-45212a97aa02	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c0-d233-78b9-4d1b6ff46892	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c0-d233-c427-6e528d6db9ab	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c0-d233-bd99-0d976fea5fef	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c0-d233-6ce5-c76a9af7fcc4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c0-d233-7c4b-25824862d74c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c0-d233-cc07-115bde2ad36a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c0-d233-06c1-98cfb4e83280	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c0-d233-aabe-6ea0e3111ce5	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c0-d233-fe14-d2d0bd7422b3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c0-d233-9b62-71a1ab4dc58a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c0-d233-247b-c8c52b12c568	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c0-d234-ac4c-fefe2d942b87	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c0-d234-b878-25131b1649fc	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c0-d234-49d5-ab8eff52ae0a	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c0-d234-1874-06eb5eaf3acf	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c0-d234-03bd-a6062fedcd9a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c0-d234-5559-78e98a3b779d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c0-d234-22a4-fe2c27b7f57e	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c0-d234-8147-0a33896796b3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c0-d234-e31e-c320d7685743	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c0-d234-8b55-51de0383019e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c0-d234-7b2c-a5cca22cb0c8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c0-d234-cc4e-84b94b3569fe	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c0-d234-37a7-719502dd1d9d	TH	THA	764	Thailand 	Tajska	\N
00040000-55c0-d234-777d-3f82d1c0fca2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c0-d234-d288-b299a2c297b1	TG	TGO	768	Togo 	Togo	\N
00040000-55c0-d234-f132-ca9e90fe920a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c0-d234-4796-4e697fac5cd0	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c0-d234-da1e-c6141d6c11ca	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c0-d234-a45b-ea6c7190e84f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c0-d234-2ed3-b2d86729862b	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c0-d234-6b18-851131205d2a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c0-d234-a776-ed7d028f6f54	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c0-d234-93ed-85f1d412adcb	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c0-d234-ecaa-b831afbb8554	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c0-d234-7c05-63f02fe29423	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c0-d234-b932-ec4c62080e2b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c0-d234-d286-27790b4bd029	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c0-d234-6597-d10f3b4d1956	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c0-d234-2894-cadb88923873	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c0-d234-021c-8948640de0c3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c0-d234-292f-36d150c6eb8e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c0-d234-40a4-701ede856ad3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c0-d234-3503-168f9d400c27	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c0-d234-391c-cd135815aec2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c0-d234-5934-1df98a084305	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c0-d234-a96c-48dd1de7fa0f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c0-d234-2217-163a5bc90174	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c0-d234-95ac-71ad12b3fd8f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c0-d234-14c9-2556a4701d18	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c0-d234-f634-e8f8b089d378	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c0-d234-ecc7-17c3e66d75a9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3043 (class 0 OID 11824785)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c0-d236-9f79-8a5597ac7071	000e0000-55c0-d236-2416-a9116cdc6f09	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c0-d234-2a84-39431e24930d	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c0-d236-161e-7677ff2b2f16	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c0-d234-78d0-1bbae8267ea5	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c0-d236-dad7-c79b2f318932	000e0000-55c0-d236-63be-b2774c9f95fc	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c0-d234-2a84-39431e24930d	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c0-d236-2f91-b8924b538110	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c0-d236-26f1-63de415f1110	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 11824612)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c0-d236-c8ce-7cae7cfc217e	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c0-d234-03ef-7dce63e79cfd
000d0000-55c0-d236-a6d2-2c10b30cfac4	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c0-d234-03ef-7dce63e79cfd
000d0000-55c0-d236-0a91-8ae09c51c3fa	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c0-d234-8422-fc347926fe64
000d0000-55c0-d236-56c7-9bf2b12006f6	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c0-d234-291f-2bccfb8313d0
000d0000-55c0-d236-3ce0-fdce8d543bff	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c0-d234-e3c6-0139bc1fc03b
000d0000-55c0-d236-6780-0d6409732709	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c0-d234-df70-e3d5a5af8d97
000d0000-55c0-d236-68ce-f95703b8aeea	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c0-d234-03ef-7dce63e79cfd
000d0000-55c0-d236-dcbc-b84542f38c06	000e0000-55c0-d236-c9bc-f34cc2a6e67f	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c0-d234-5467-402624abbb08
\.


--
-- TOC entry 3009 (class 0 OID 11824428)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 11824476)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11824408)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c0-d236-70f6-478dccad5dda	00080000-55c0-d235-fc4a-bccf6c60f3fe	00090000-55c0-d236-cb80-da3858ba5a58	AK		
\.


--
-- TOC entry 2984 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 11824529)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 11824995)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 11825007)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 11825030)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11824554)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11824365)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c0-d234-995c-c9035c823a8d	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c0-d234-13a5-570626f6b123	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c0-d234-00d5-0d2cc0e7bfe1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c0-d234-dd3a-bbf65ddd004a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c0-d234-8066-95839e0cb0ff	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c0-d234-b4e1-c047a16fdb05	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c0-d234-e0b7-5be3d6ce5841	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c0-d234-a521-10fc170f6001	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c0-d234-b420-c00dc9b8ad5d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c0-d234-46c6-16e04cdb07f6	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c0-d234-13a8-31e8427f2d2c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c0-d234-d619-5d9e55fa7dc6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c0-d234-8b8f-2cf8d898f816	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c0-d234-196c-c417d987b6e5	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c0-d236-cfa4-60f325847610	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c0-d236-f4d6-1ee5a8802ef6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c0-d236-77c3-718973ad6db6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c0-d236-2c16-0ab6a6f843ac	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c0-d236-674d-81c6c1918dcf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c0-d236-8788-8867aea20fe6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2998 (class 0 OID 11824278)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c0-d236-788b-142adb275dba	00000000-55c0-d236-f4d6-1ee5a8802ef6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c0-d236-d318-b63b8e2852cb	00000000-55c0-d236-f4d6-1ee5a8802ef6	00010000-55c0-d234-24a9-32180b4878d7	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c0-d236-1358-91d91b975eef	00000000-55c0-d236-77c3-718973ad6db6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2999 (class 0 OID 11824289)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c0-d236-89bb-f98a98055a81	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c0-d236-3d57-c2ad601b2596	00010000-55c0-d236-5f79-0c02d72c3bee	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c0-d236-09f4-6e2a20546d34	00010000-55c0-d236-b4dd-ceca3f082d90	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c0-d236-d83b-4241a07abcf6	00010000-55c0-d236-57d3-8854e10a0096	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c0-d236-8eb4-d577daca4c19	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c0-d236-ddad-e92064a22420	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c0-d236-568d-6c69df086a89	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c0-d236-d06c-0926324dd172	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c0-d236-cb80-da3858ba5a58	00010000-55c0-d236-fa21-baae908311e3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c0-d236-0c71-3fd0e826b447	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c0-d236-7a01-5b0238e10030	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c0-d236-ba40-08b3e4bcde08	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c0-d236-c280-f188f89c5f80	00010000-55c0-d236-4ca8-6fa2cb614037	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2986 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11824243)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c0-d234-4fbb-989792e8e433	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c0-d234-444a-aa8bf0ccbdd6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c0-d234-7fb0-8a404cfa30ca	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c0-d234-4e6b-8b688a7e27aa	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c0-d234-18a6-36b139f18fd7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c0-d234-c11f-6ba7d9580d9d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c0-d234-30c8-79b6365f3cbc	Abonma-read	Abonma - branje	f
00030000-55c0-d234-646f-35a687bfa9be	Abonma-write	Abonma - spreminjanje	f
00030000-55c0-d234-1227-7175ceb191ee	Alternacija-read	Alternacija - branje	f
00030000-55c0-d234-b828-64ec67cfead0	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c0-d234-d73f-b3674a2520ef	Arhivalija-read	Arhivalija - branje	f
00030000-55c0-d234-b3a2-8302d204d95d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c0-d234-8004-59e9de4e1952	Besedilo-read	Besedilo - branje	f
00030000-55c0-d234-d5a3-ed34eca02847	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c0-d234-27b0-a6e1a546ff3f	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c0-d234-6891-e2e560b04253	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c0-d234-55f0-053202938d2a	Dogodek-read	Dogodek - branje	f
00030000-55c0-d234-0c30-0c2dca7487ab	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c0-d234-176b-68a680dbadbe	DrugiVir-read	DrugiVir - branje	f
00030000-55c0-d234-ec1e-47d728bf5f51	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c0-d234-4e21-516356269a44	Drzava-read	Drzava - branje	f
00030000-55c0-d234-4791-a88aa3b359fb	Drzava-write	Drzava - spreminjanje	f
00030000-55c0-d234-37ea-126f76fa89db	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c0-d234-2034-a6833d6e0f72	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c0-d234-e1ca-91b92378755f	Funkcija-read	Funkcija - branje	f
00030000-55c0-d234-e2cc-24e313ccc492	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c0-d234-95d3-91796bced259	Gostovanje-read	Gostovanje - branje	f
00030000-55c0-d234-e52e-289a08403ff6	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c0-d234-eada-9a73e4f4659e	Gostujoca-read	Gostujoca - branje	f
00030000-55c0-d234-c83e-41a392088ebf	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c0-d234-7d8f-932512121af7	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c0-d234-25ed-edc451e83225	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c0-d234-9496-1adedb7bbb8a	Kupec-read	Kupec - branje	f
00030000-55c0-d234-5160-fc91ed2d505d	Kupec-write	Kupec - spreminjanje	f
00030000-55c0-d234-3925-dd1821c56c15	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c0-d234-af1a-257dbf3bcc1e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c0-d234-5209-e481a1237beb	Option-read	Option - branje	f
00030000-55c0-d234-5c40-ccf14022a494	Option-write	Option - spreminjanje	f
00030000-55c0-d234-ef80-7cf15e022389	OptionValue-read	OptionValue - branje	f
00030000-55c0-d234-9073-12595c8fee10	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c0-d234-1650-12f43c8c8e80	Oseba-read	Oseba - branje	f
00030000-55c0-d234-620c-745da03aed63	Oseba-write	Oseba - spreminjanje	f
00030000-55c0-d234-d1d4-bdb649a75fa2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c0-d234-a345-7c9f57a92435	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c0-d234-7bd1-e5ce1773c317	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c0-d234-d01d-96b80bb1715b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c0-d234-b345-1fa13d93536c	Pogodba-read	Pogodba - branje	f
00030000-55c0-d234-75cf-4a36c43098d0	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c0-d234-b1dd-8a7aff646c13	Popa-read	Popa - branje	f
00030000-55c0-d234-6707-cb8dd3122366	Popa-write	Popa - spreminjanje	f
00030000-55c0-d234-6f1a-a3446175dab0	Posta-read	Posta - branje	f
00030000-55c0-d234-5a45-15dbfdf64fec	Posta-write	Posta - spreminjanje	f
00030000-55c0-d234-4b3b-602da7652492	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c0-d234-f560-994ee4cbfd53	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c0-d234-5ce0-549504d089a4	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c0-d234-41e1-ee814e7c8bd7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c0-d234-dc06-167c642135c0	Predstava-read	Predstava - branje	f
00030000-55c0-d234-8055-1044896614c0	Predstava-write	Predstava - spreminjanje	f
00030000-55c0-d234-f7d2-d4689a607958	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c0-d234-219a-3598732251d6	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c0-d234-63a2-87efd7b12c33	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c0-d234-3a3d-a70789c4582c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c0-d234-2342-269df69b8be9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c0-d234-2640-cb84013d3dcb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c0-d234-3dba-9b626a3742ab	ProgramDela-read	ProgramDela - branje	f
00030000-55c0-d234-0a89-67bd82a9f726	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c0-d234-f4ec-3f6327ac41c6	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c0-d234-3920-f8d8cca94fa8	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c0-d234-d0f4-fc012d449b71	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c0-d234-38d3-d2f8671ae9c4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c0-d234-d0b0-101c4fae79b8	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c0-d234-bea4-9b76a36e9211	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c0-d234-ee0b-4ced4480ae59	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c0-d234-4ed5-7b51f1173d20	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c0-d234-1c2a-a77eb5e209bb	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c0-d234-6618-295ae83ea535	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c0-d234-7e6d-d39d1797d669	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c0-d234-f238-0e1ff0e30280	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c0-d234-de94-16f18bbae40a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c0-d234-038d-3cad26d702d8	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c0-d234-a800-e19f599bc0e0	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c0-d234-66b8-5feb47b24a27	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c0-d234-1e96-7e64c9a6b0af	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c0-d234-381a-8db863a76b04	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c0-d234-7a09-e76808ce915e	Prostor-read	Prostor - branje	f
00030000-55c0-d234-d5ff-cc7bcd0dcb98	Prostor-write	Prostor - spreminjanje	f
00030000-55c0-d234-04ae-167b4cb01e43	Racun-read	Racun - branje	f
00030000-55c0-d234-3d09-b3c7a081ab13	Racun-write	Racun - spreminjanje	f
00030000-55c0-d234-c78e-0a1d55c537c9	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c0-d234-9e78-915da86fed4e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c0-d234-35fa-10c46c427cc3	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c0-d234-0b2a-6e1fd256375b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c0-d234-f798-ce9dd62fe4a8	Rekvizit-read	Rekvizit - branje	f
00030000-55c0-d234-9670-c6c486f060c1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c0-d234-865f-2bdcebb4a9b2	Revizija-read	Revizija - branje	f
00030000-55c0-d234-a316-f2152d5f5540	Revizija-write	Revizija - spreminjanje	f
00030000-55c0-d234-a120-fa7ae845d177	Rezervacija-read	Rezervacija - branje	f
00030000-55c0-d234-0a6f-34d85a81a7c3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c0-d234-5c63-1a42565e8c32	SedezniRed-read	SedezniRed - branje	f
00030000-55c0-d234-245e-a9be1a932db0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c0-d234-de73-6922c4e3b6bc	Sedez-read	Sedez - branje	f
00030000-55c0-d234-05a1-05968f7a2d9d	Sedez-write	Sedez - spreminjanje	f
00030000-55c0-d234-7c4b-048b85e8f088	Sezona-read	Sezona - branje	f
00030000-55c0-d234-8e03-f42dcfa896fc	Sezona-write	Sezona - spreminjanje	f
00030000-55c0-d234-80b3-5fac3e46d759	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c0-d234-f4fc-d9e95dc6a2b3	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c0-d234-7d4a-3e23e1338c5c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c0-d234-aa28-3e5f52db2d7d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c0-d234-6868-6d70011f39ac	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c0-d234-44f0-663195066ff1	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c0-d234-ded2-65819196c0fc	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c0-d234-466f-9084fa4eb8dc	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c0-d234-9421-9559dc34f27b	Telefonska-read	Telefonska - branje	f
00030000-55c0-d234-76c7-4d19d744b83a	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c0-d234-6bb4-0ef81c9eae10	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c0-d234-d4dc-6ca827f589ac	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c0-d234-0346-173d8feaac9a	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c0-d234-0144-3d5c0a65a8a3	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c0-d234-96ae-61eb4ef684f2	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c0-d234-bc75-68fae2efad08	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c0-d234-0a07-4716b4b139c5	Trr-read	Trr - branje	f
00030000-55c0-d234-b085-706c0c07ba52	Trr-write	Trr - spreminjanje	f
00030000-55c0-d234-ca11-7518094f3b8f	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c0-d234-3ba3-1b9ceb53f719	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c0-d234-3a27-cec15eb76fc7	Vaja-read	Vaja - branje	f
00030000-55c0-d234-21d0-d6cd8c7c18f1	Vaja-write	Vaja - spreminjanje	f
00030000-55c0-d234-1e45-2880733a297d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c0-d234-c209-367bb0b05a0f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c0-d234-e636-6d9dadaba815	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c0-d234-a7f0-afcad232d540	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c0-d234-8ee9-399821445aad	Zasedenost-read	Zasedenost - branje	f
00030000-55c0-d234-7fa3-faf6c47dfc0f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c0-d234-6e31-98114da8ecd0	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c0-d234-2bce-d587cd0ddac5	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c0-d234-4400-d1520cb9ad10	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c0-d234-68d6-ba0e18c6b1cc	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c0-d234-a5d2-d5a7c3b3caca	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c0-d234-e34f-a6cabfae3e23	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c0-d234-3310-83d178fa69db	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c0-d234-01e6-e6b13ff3a7e3	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c0-d234-17dd-4b88fb804f77	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c0-d234-de14-f77d8599e6a3	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c0-d234-c5dc-7430fe8f5cc5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c0-d234-c31a-b24ddb8c0cb7	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c0-d234-dc14-b048199e7db0	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c0-d234-dd5e-2d74521ce5c8	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c0-d234-150d-6eaeb9511478	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c0-d234-1698-4f23b42a2187	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2996 (class 0 OID 11824262)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c0-d234-bc28-c5acb3005d95	00030000-55c0-d234-444a-aa8bf0ccbdd6
00020000-55c0-d234-422c-9f21039dc758	00030000-55c0-d234-4e21-516356269a44
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-30c8-79b6365f3cbc
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-646f-35a687bfa9be
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-1227-7175ceb191ee
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-b828-64ec67cfead0
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-d73f-b3674a2520ef
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-55f0-053202938d2a
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-4e6b-8b688a7e27aa
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-0c30-0c2dca7487ab
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-4e21-516356269a44
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-4791-a88aa3b359fb
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-e1ca-91b92378755f
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-e2cc-24e313ccc492
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-95d3-91796bced259
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-e52e-289a08403ff6
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-eada-9a73e4f4659e
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-c83e-41a392088ebf
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-7d8f-932512121af7
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-25ed-edc451e83225
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-5209-e481a1237beb
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-ef80-7cf15e022389
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-1650-12f43c8c8e80
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-620c-745da03aed63
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-b1dd-8a7aff646c13
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-6707-cb8dd3122366
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-6f1a-a3446175dab0
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-5a45-15dbfdf64fec
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-5ce0-549504d089a4
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-41e1-ee814e7c8bd7
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-dc06-167c642135c0
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-8055-1044896614c0
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-2342-269df69b8be9
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-2640-cb84013d3dcb
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-7a09-e76808ce915e
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-d5ff-cc7bcd0dcb98
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-35fa-10c46c427cc3
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-0b2a-6e1fd256375b
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-f798-ce9dd62fe4a8
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-9670-c6c486f060c1
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-7c4b-048b85e8f088
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-8e03-f42dcfa896fc
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-0346-173d8feaac9a
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-ca11-7518094f3b8f
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-3ba3-1b9ceb53f719
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-3a27-cec15eb76fc7
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-21d0-d6cd8c7c18f1
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-8ee9-399821445aad
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-7fa3-faf6c47dfc0f
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-6e31-98114da8ecd0
00020000-55c0-d234-35ac-af7a8cb30c19	00030000-55c0-d234-4400-d1520cb9ad10
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-30c8-79b6365f3cbc
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-d73f-b3674a2520ef
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-55f0-053202938d2a
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-4e21-516356269a44
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-95d3-91796bced259
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-eada-9a73e4f4659e
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-7d8f-932512121af7
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-25ed-edc451e83225
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-5209-e481a1237beb
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-ef80-7cf15e022389
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-1650-12f43c8c8e80
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-620c-745da03aed63
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-b1dd-8a7aff646c13
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-6f1a-a3446175dab0
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-5ce0-549504d089a4
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-41e1-ee814e7c8bd7
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-dc06-167c642135c0
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-7a09-e76808ce915e
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-35fa-10c46c427cc3
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-f798-ce9dd62fe4a8
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-7c4b-048b85e8f088
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-9421-9559dc34f27b
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-76c7-4d19d744b83a
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-0a07-4716b4b139c5
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-b085-706c0c07ba52
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-e636-6d9dadaba815
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-a7f0-afcad232d540
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-6e31-98114da8ecd0
00020000-55c0-d234-beb5-640957b8b162	00030000-55c0-d234-4400-d1520cb9ad10
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-30c8-79b6365f3cbc
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-1227-7175ceb191ee
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-d73f-b3674a2520ef
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-b3a2-8302d204d95d
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-8004-59e9de4e1952
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-27b0-a6e1a546ff3f
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-55f0-053202938d2a
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-4e21-516356269a44
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-e1ca-91b92378755f
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-95d3-91796bced259
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-eada-9a73e4f4659e
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-7d8f-932512121af7
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-5209-e481a1237beb
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-ef80-7cf15e022389
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-1650-12f43c8c8e80
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-b1dd-8a7aff646c13
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-6f1a-a3446175dab0
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-dc06-167c642135c0
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-2342-269df69b8be9
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-7a09-e76808ce915e
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-35fa-10c46c427cc3
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-f798-ce9dd62fe4a8
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-7c4b-048b85e8f088
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-0346-173d8feaac9a
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-3a27-cec15eb76fc7
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-8ee9-399821445aad
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-6e31-98114da8ecd0
00020000-55c0-d234-4bb8-b5c327071509	00030000-55c0-d234-4400-d1520cb9ad10
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-30c8-79b6365f3cbc
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-646f-35a687bfa9be
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-b828-64ec67cfead0
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-d73f-b3674a2520ef
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-55f0-053202938d2a
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-4e21-516356269a44
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-95d3-91796bced259
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-eada-9a73e4f4659e
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-5209-e481a1237beb
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-ef80-7cf15e022389
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-b1dd-8a7aff646c13
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-6f1a-a3446175dab0
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-dc06-167c642135c0
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-7a09-e76808ce915e
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-35fa-10c46c427cc3
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-f798-ce9dd62fe4a8
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-7c4b-048b85e8f088
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-0346-173d8feaac9a
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-6e31-98114da8ecd0
00020000-55c0-d234-143c-84e8ecf4848f	00030000-55c0-d234-4400-d1520cb9ad10
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-30c8-79b6365f3cbc
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-d73f-b3674a2520ef
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-55f0-053202938d2a
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-4e21-516356269a44
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-95d3-91796bced259
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-eada-9a73e4f4659e
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-5209-e481a1237beb
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-ef80-7cf15e022389
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-b1dd-8a7aff646c13
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-6f1a-a3446175dab0
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-dc06-167c642135c0
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-7a09-e76808ce915e
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-35fa-10c46c427cc3
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-f798-ce9dd62fe4a8
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-7c4b-048b85e8f088
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-6bb4-0ef81c9eae10
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-7fb0-8a404cfa30ca
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-0346-173d8feaac9a
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-6e31-98114da8ecd0
00020000-55c0-d234-edbb-0ca342bf657e	00030000-55c0-d234-4400-d1520cb9ad10
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-4fbb-989792e8e433
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-444a-aa8bf0ccbdd6
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-7fb0-8a404cfa30ca
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-4e6b-8b688a7e27aa
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-18a6-36b139f18fd7
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-c11f-6ba7d9580d9d
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-30c8-79b6365f3cbc
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-646f-35a687bfa9be
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-1227-7175ceb191ee
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-b828-64ec67cfead0
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-d73f-b3674a2520ef
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-b3a2-8302d204d95d
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-8004-59e9de4e1952
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-d5a3-ed34eca02847
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-27b0-a6e1a546ff3f
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-6891-e2e560b04253
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-55f0-053202938d2a
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-0c30-0c2dca7487ab
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-4e21-516356269a44
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-4791-a88aa3b359fb
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-176b-68a680dbadbe
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-ec1e-47d728bf5f51
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-37ea-126f76fa89db
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-2034-a6833d6e0f72
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-e1ca-91b92378755f
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-e2cc-24e313ccc492
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-95d3-91796bced259
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-e52e-289a08403ff6
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-eada-9a73e4f4659e
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-c83e-41a392088ebf
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-7d8f-932512121af7
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-25ed-edc451e83225
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-9496-1adedb7bbb8a
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-5160-fc91ed2d505d
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-3925-dd1821c56c15
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-af1a-257dbf3bcc1e
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-5209-e481a1237beb
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-5c40-ccf14022a494
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-ef80-7cf15e022389
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-9073-12595c8fee10
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-1650-12f43c8c8e80
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-620c-745da03aed63
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-d1d4-bdb649a75fa2
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-a345-7c9f57a92435
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-7bd1-e5ce1773c317
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-d01d-96b80bb1715b
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-b345-1fa13d93536c
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-75cf-4a36c43098d0
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-b1dd-8a7aff646c13
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-6707-cb8dd3122366
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-6f1a-a3446175dab0
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-5a45-15dbfdf64fec
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-4b3b-602da7652492
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-f560-994ee4cbfd53
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-5ce0-549504d089a4
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-41e1-ee814e7c8bd7
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-dc06-167c642135c0
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-8055-1044896614c0
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-f7d2-d4689a607958
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-219a-3598732251d6
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-63a2-87efd7b12c33
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-3a3d-a70789c4582c
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-2342-269df69b8be9
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-2640-cb84013d3dcb
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-3dba-9b626a3742ab
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-0a89-67bd82a9f726
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-f4ec-3f6327ac41c6
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-3920-f8d8cca94fa8
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-d0f4-fc012d449b71
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-38d3-d2f8671ae9c4
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-d0b0-101c4fae79b8
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-bea4-9b76a36e9211
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-ee0b-4ced4480ae59
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-4ed5-7b51f1173d20
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-1c2a-a77eb5e209bb
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-6618-295ae83ea535
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-7e6d-d39d1797d669
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-f238-0e1ff0e30280
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-de94-16f18bbae40a
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-038d-3cad26d702d8
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-a800-e19f599bc0e0
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-66b8-5feb47b24a27
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-1e96-7e64c9a6b0af
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-381a-8db863a76b04
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-7a09-e76808ce915e
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-d5ff-cc7bcd0dcb98
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-04ae-167b4cb01e43
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-3d09-b3c7a081ab13
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-c78e-0a1d55c537c9
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-9e78-915da86fed4e
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-35fa-10c46c427cc3
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-0b2a-6e1fd256375b
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-f798-ce9dd62fe4a8
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-9670-c6c486f060c1
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-865f-2bdcebb4a9b2
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-a316-f2152d5f5540
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-a120-fa7ae845d177
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-0a6f-34d85a81a7c3
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-5c63-1a42565e8c32
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-245e-a9be1a932db0
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-de73-6922c4e3b6bc
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-05a1-05968f7a2d9d
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-7c4b-048b85e8f088
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-8e03-f42dcfa896fc
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-80b3-5fac3e46d759
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-f4fc-d9e95dc6a2b3
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-7d4a-3e23e1338c5c
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-aa28-3e5f52db2d7d
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-6868-6d70011f39ac
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-44f0-663195066ff1
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-ded2-65819196c0fc
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-466f-9084fa4eb8dc
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-9421-9559dc34f27b
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-76c7-4d19d744b83a
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-6bb4-0ef81c9eae10
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-d4dc-6ca827f589ac
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-0346-173d8feaac9a
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-0144-3d5c0a65a8a3
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-96ae-61eb4ef684f2
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-bc75-68fae2efad08
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-0a07-4716b4b139c5
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-b085-706c0c07ba52
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-ca11-7518094f3b8f
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-3ba3-1b9ceb53f719
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-3a27-cec15eb76fc7
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-21d0-d6cd8c7c18f1
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-1e45-2880733a297d
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-c209-367bb0b05a0f
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-e636-6d9dadaba815
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-a7f0-afcad232d540
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-8ee9-399821445aad
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-7fa3-faf6c47dfc0f
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-6e31-98114da8ecd0
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-2bce-d587cd0ddac5
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-4400-d1520cb9ad10
00020000-55c0-d236-2be9-dcedc4af67f8	00030000-55c0-d234-68d6-ba0e18c6b1cc
\.


--
-- TOC entry 3024 (class 0 OID 11824561)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11824592)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 11824706)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c0-d236-308e-1107eb825d3f	00090000-55c0-d236-89bb-f98a98055a81	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c0-d236-3f3e-1883453988ab	00090000-55c0-d236-ddad-e92064a22420	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c0-d236-f475-c5517aa9f834	00090000-55c0-d236-c280-f188f89c5f80	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3001 (class 0 OID 11824322)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c0-d235-fc4a-bccf6c60f3fe	00040000-55c0-d233-cc07-115bde2ad36a	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-d235-2484-162aad504229	00040000-55c0-d233-cc07-115bde2ad36a	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c0-d235-1719-1964ceac5da4	00040000-55c0-d233-cc07-115bde2ad36a	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-d235-db54-102b67c8d4a8	00040000-55c0-d233-cc07-115bde2ad36a	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-d235-c132-d0dbb4e7c928	00040000-55c0-d233-cc07-115bde2ad36a	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-d235-0842-4e7086d28ce8	00040000-55c0-d233-65c8-9b1d961b7bb4	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-d235-ffdb-389bb77dd1f0	00040000-55c0-d233-1405-0995974e49ec	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-d236-717c-cba2f95c02ba	00040000-55c0-d233-52de-806f1d0a93ed	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c0-d236-018c-b77233d50a3e	00040000-55c0-d233-cc07-115bde2ad36a	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3003 (class 0 OID 11824357)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c0-d234-14b9-13846f1ecff0	8341	Adlešiči
00050000-55c0-d234-ce39-740fea9a50fe	5270	Ajdovščina
00050000-55c0-d234-a983-6ccfd1fe0e5b	6280	Ankaran/Ancarano
00050000-55c0-d234-2353-4e18c696b628	9253	Apače
00050000-55c0-d234-521b-664879e5f7cb	8253	Artiče
00050000-55c0-d234-a5d8-726a4d9a3e9a	4275	Begunje na Gorenjskem
00050000-55c0-d234-94ae-985750b751b9	1382	Begunje pri Cerknici
00050000-55c0-d234-1ee4-4e10a142ffb8	9231	Beltinci
00050000-55c0-d234-74f4-6493693cbee0	2234	Benedikt
00050000-55c0-d234-a7e3-46bd72a80372	2345	Bistrica ob Dravi
00050000-55c0-d234-a3e0-320a33f4feb7	3256	Bistrica ob Sotli
00050000-55c0-d234-0eb7-75c18e3abc58	8259	Bizeljsko
00050000-55c0-d234-951c-59b53c19a1b6	1223	Blagovica
00050000-55c0-d234-0020-b67fde025528	8283	Blanca
00050000-55c0-d234-d6dd-6b17ac6f8180	4260	Bled
00050000-55c0-d234-1536-f69c9c7c02d0	4273	Blejska Dobrava
00050000-55c0-d234-d198-3d05fd08b9c9	9265	Bodonci
00050000-55c0-d234-934b-18fe0d7bc32e	9222	Bogojina
00050000-55c0-d234-fa41-67a4de3ca0e1	4263	Bohinjska Bela
00050000-55c0-d234-d236-33bd0838b025	4264	Bohinjska Bistrica
00050000-55c0-d234-b472-480623d76d45	4265	Bohinjsko jezero
00050000-55c0-d234-cbb2-8956fe7efe2a	1353	Borovnica
00050000-55c0-d234-5b11-26db0cdb981c	8294	Boštanj
00050000-55c0-d234-8d73-7a727f1ba95f	5230	Bovec
00050000-55c0-d234-db7c-d4a412f7101a	5295	Branik
00050000-55c0-d234-cfe7-df74d4823c42	3314	Braslovče
00050000-55c0-d234-6df1-0ebb671abfa1	5223	Breginj
00050000-55c0-d234-61c6-672f6329e7b3	8280	Brestanica
00050000-55c0-d234-37f5-29749bde6376	2354	Bresternica
00050000-55c0-d234-98fc-17b6fa1d4461	4243	Brezje
00050000-55c0-d234-22ef-3d93dd74be41	1351	Brezovica pri Ljubljani
00050000-55c0-d234-9955-f1225d1bea2d	8250	Brežice
00050000-55c0-d234-d55f-a9e5576421c5	4210	Brnik - Aerodrom
00050000-55c0-d234-2b18-78362472ca0a	8321	Brusnice
00050000-55c0-d234-0774-d99e0b56943b	3255	Buče
00050000-55c0-d234-39f9-2d08a87e5a8e	8276	Bučka 
00050000-55c0-d234-03f7-d58b2ea8ab48	9261	Cankova
00050000-55c0-d234-45cc-aa072c88ef92	3000	Celje 
00050000-55c0-d234-16d7-f0158cf1f841	3001	Celje - poštni predali
00050000-55c0-d234-df27-e9648f8bcb19	4207	Cerklje na Gorenjskem
00050000-55c0-d234-d769-3dc2659744d2	8263	Cerklje ob Krki
00050000-55c0-d234-b215-0430d7489ac9	1380	Cerknica
00050000-55c0-d234-a814-86eb4f88d518	5282	Cerkno
00050000-55c0-d234-d206-1ea79d4b4a15	2236	Cerkvenjak
00050000-55c0-d234-03fa-1d7cdd55d768	2215	Ceršak
00050000-55c0-d234-e66a-abe351610fc6	2326	Cirkovce
00050000-55c0-d234-61f5-9389a9128810	2282	Cirkulane
00050000-55c0-d234-154e-2befd26519e5	5273	Col
00050000-55c0-d234-5d93-1a9d097353cd	8251	Čatež ob Savi
00050000-55c0-d234-0117-0e7d2e22ca3e	1413	Čemšenik
00050000-55c0-d234-fa08-0d51ddbc0053	5253	Čepovan
00050000-55c0-d234-edbe-18b7a7117927	9232	Črenšovci
00050000-55c0-d234-4393-c7e9a18882c9	2393	Črna na Koroškem
00050000-55c0-d234-4ba9-2b8e32612327	6275	Črni Kal
00050000-55c0-d234-5e82-f9cb9b540ebf	5274	Črni Vrh nad Idrijo
00050000-55c0-d234-0ad7-637fbf6feb93	5262	Črniče
00050000-55c0-d234-df98-47523b61dac5	8340	Črnomelj
00050000-55c0-d234-7987-77de748f1d7e	6271	Dekani
00050000-55c0-d234-6405-4625ad97ce5c	5210	Deskle
00050000-55c0-d234-bef2-6f682134b91f	2253	Destrnik
00050000-55c0-d234-c866-3fa4925d6cbc	6215	Divača
00050000-55c0-d234-6d08-6aded770ba58	1233	Dob
00050000-55c0-d234-685d-9f7f309daee3	3224	Dobje pri Planini
00050000-55c0-d234-e851-be2bf6063636	8257	Dobova
00050000-55c0-d234-c590-63bafddef58e	1423	Dobovec
00050000-55c0-d234-ede5-732dd3fe290e	5263	Dobravlje
00050000-55c0-d234-c302-ad1c3dbf9f54	3204	Dobrna
00050000-55c0-d234-ba3f-7cd90b758692	8211	Dobrnič
00050000-55c0-d234-200d-2a3b0bc04fba	1356	Dobrova
00050000-55c0-d234-f517-f0042e6b9096	9223	Dobrovnik/Dobronak 
00050000-55c0-d234-0140-76d34b0c96f5	5212	Dobrovo v Brdih
00050000-55c0-d234-33ac-b8301bde6c8c	1431	Dol pri Hrastniku
00050000-55c0-d234-b67c-aeb455138fba	1262	Dol pri Ljubljani
00050000-55c0-d234-a9e5-7830f1105c17	1273	Dole pri Litiji
00050000-55c0-d234-5163-641c557fdf4b	1331	Dolenja vas
00050000-55c0-d234-2db1-308bf9ff6472	8350	Dolenjske Toplice
00050000-55c0-d234-8a53-e310f7603b3e	1230	Domžale
00050000-55c0-d234-c3c0-0b0401c37f65	2252	Dornava
00050000-55c0-d234-cc61-2713c329a30e	5294	Dornberk
00050000-55c0-d234-4aa5-1ac3380df6b9	1319	Draga
00050000-55c0-d234-f3a3-90cb977e8e2f	8343	Dragatuš
00050000-55c0-d234-7d8e-5b5119744db1	3222	Dramlje
00050000-55c0-d234-a34d-77365778d258	2370	Dravograd
00050000-55c0-d234-3875-e326a599aa56	4203	Duplje
00050000-55c0-d234-7ac9-8785276605c9	6221	Dutovlje
00050000-55c0-d234-8f7e-c52a457c9ab4	8361	Dvor
00050000-55c0-d234-fb1c-105e7056792c	2343	Fala
00050000-55c0-d234-4591-a1caa2b08d35	9208	Fokovci
00050000-55c0-d234-39b5-c73f9764b50d	2313	Fram
00050000-55c0-d234-f731-742f2ea696db	3213	Frankolovo
00050000-55c0-d234-b392-2a11fbc19a1a	1274	Gabrovka
00050000-55c0-d234-15e5-eb94a2db7809	8254	Globoko
00050000-55c0-d234-9ffd-851fce7761e5	5275	Godovič
00050000-55c0-d234-2c8c-6d4d14127d0e	4204	Golnik
00050000-55c0-d234-30e4-08d15f6697e5	3303	Gomilsko
00050000-55c0-d234-d510-c1d8ef036474	4224	Gorenja vas
00050000-55c0-d234-f331-8f7590fbea29	3263	Gorica pri Slivnici
00050000-55c0-d234-87e4-90995aa3430b	2272	Gorišnica
00050000-55c0-d234-dc9b-03d18d18f6d1	9250	Gornja Radgona
00050000-55c0-d234-31be-3c8f8b314ebd	3342	Gornji Grad
00050000-55c0-d234-3e1d-ed31a4a5e7e0	4282	Gozd Martuljek
00050000-55c0-d234-c538-4eac8b2f9029	6272	Gračišče
00050000-55c0-d234-6078-041d57ee3096	9264	Grad
00050000-55c0-d234-82ac-1ca6531472da	8332	Gradac
00050000-55c0-d234-bd9d-6105b06c25c3	1384	Grahovo
00050000-55c0-d234-4bf1-c071e78d011d	5242	Grahovo ob Bači
00050000-55c0-d234-e680-02fee38840f4	5251	Grgar
00050000-55c0-d234-7344-8e302da88631	3302	Griže
00050000-55c0-d234-3c43-b5b2cc55e324	3231	Grobelno
00050000-55c0-d234-9489-87290f0b9ec7	1290	Grosuplje
00050000-55c0-d234-2e05-17713e39accb	2288	Hajdina
00050000-55c0-d234-d3ff-24681f082499	8362	Hinje
00050000-55c0-d234-0618-1d37404d773c	2311	Hoče
00050000-55c0-d234-977b-f066b235a4c6	9205	Hodoš/Hodos
00050000-55c0-d234-04db-2ffac2c301e4	1354	Horjul
00050000-55c0-d234-8125-867436efcd91	1372	Hotedršica
00050000-55c0-d234-852e-fcc50728b0ff	1430	Hrastnik
00050000-55c0-d234-0a38-b0c7b2c58cdd	6225	Hruševje
00050000-55c0-d234-0814-ec90e06e8770	4276	Hrušica
00050000-55c0-d234-9421-f5328bdad58c	5280	Idrija
00050000-55c0-d234-f5f0-6047beb98ecd	1292	Ig
00050000-55c0-d234-11d1-2d9cec9276e9	6250	Ilirska Bistrica
00050000-55c0-d234-5da3-0a48b37579d1	6251	Ilirska Bistrica-Trnovo
00050000-55c0-d234-e4fe-46da06c171dd	1295	Ivančna Gorica
00050000-55c0-d234-80ff-6a7282f991c5	2259	Ivanjkovci
00050000-55c0-d234-30b7-9565c5ec6ad7	1411	Izlake
00050000-55c0-d234-0d53-70cf0a118550	6310	Izola/Isola
00050000-55c0-d234-58d2-bae17c13eac0	2222	Jakobski Dol
00050000-55c0-d234-9a8c-6335f5946f32	2221	Jarenina
00050000-55c0-d234-2700-932c98d6fc0d	6254	Jelšane
00050000-55c0-d234-caa4-0aabff6912ed	4270	Jesenice
00050000-55c0-d234-2d7d-36534356dbb6	8261	Jesenice na Dolenjskem
00050000-55c0-d234-86ab-8bd119f2f394	3273	Jurklošter
00050000-55c0-d234-23e6-4e0aa24324d5	2223	Jurovski Dol
00050000-55c0-d234-9b43-c2732bf2f8ed	2256	Juršinci
00050000-55c0-d234-3124-c4008d79e44c	5214	Kal nad Kanalom
00050000-55c0-d234-045e-1b1f57bb1d4a	3233	Kalobje
00050000-55c0-d234-523c-e9b5a2dd6efa	4246	Kamna Gorica
00050000-55c0-d234-1f7f-f9d8417efe3d	2351	Kamnica
00050000-55c0-d234-f726-90a98ebaf370	1241	Kamnik
00050000-55c0-d234-2af9-6f7b29a5c701	5213	Kanal
00050000-55c0-d234-adb6-d34d9532d768	8258	Kapele
00050000-55c0-d234-ee17-093a0764900b	2362	Kapla
00050000-55c0-d234-755a-2701850b1331	2325	Kidričevo
00050000-55c0-d234-36a5-db0c3f25a1bf	1412	Kisovec
00050000-55c0-d234-3b03-4dbfa766e362	6253	Knežak
00050000-55c0-d234-338d-e4b7d6e3857b	5222	Kobarid
00050000-55c0-d234-7ac9-23fe499b08c4	9227	Kobilje
00050000-55c0-d234-d23e-3682c3e345ea	1330	Kočevje
00050000-55c0-d234-48f0-062e3dfe1781	1338	Kočevska Reka
00050000-55c0-d234-1ac1-3d03df7015f8	2276	Kog
00050000-55c0-d234-0d80-9a366aeb0fb2	5211	Kojsko
00050000-55c0-d234-aa4b-55cbf003b66b	6223	Komen
00050000-55c0-d234-2a5a-59699fc30e3d	1218	Komenda
00050000-55c0-d234-84a8-76f1eb681aca	6000	Koper/Capodistria 
00050000-55c0-d234-9976-12d43ff9495b	6001	Koper/Capodistria - poštni predali
00050000-55c0-d234-e0be-925251e5ebd6	8282	Koprivnica
00050000-55c0-d234-a473-24b69fdf4203	5296	Kostanjevica na Krasu
00050000-55c0-d234-eea9-3fb35a5c29ea	8311	Kostanjevica na Krki
00050000-55c0-d234-69b6-d2761de81961	1336	Kostel
00050000-55c0-d234-5593-6970d6b59f43	6256	Košana
00050000-55c0-d234-679a-c80bade1a030	2394	Kotlje
00050000-55c0-d234-592b-34a26e72c322	6240	Kozina
00050000-55c0-d234-c780-d8a68e5d1d20	3260	Kozje
00050000-55c0-d234-19f6-dd08ce7b2afb	4000	Kranj 
00050000-55c0-d234-a81b-34df86a884dc	4001	Kranj - poštni predali
00050000-55c0-d234-6f15-6be12b10d800	4280	Kranjska Gora
00050000-55c0-d234-bb29-2ea204bef5de	1281	Kresnice
00050000-55c0-d234-cbf9-2bb1c92f39a6	4294	Križe
00050000-55c0-d234-269c-e917e319fb71	9206	Križevci
00050000-55c0-d234-bee2-50c424dd50d7	9242	Križevci pri Ljutomeru
00050000-55c0-d234-5f36-bee318197150	1301	Krka
00050000-55c0-d234-3ea5-59dca1558a00	8296	Krmelj
00050000-55c0-d234-0bb2-eb8cad3a372f	4245	Kropa
00050000-55c0-d234-d54a-e528835673dc	8262	Krška vas
00050000-55c0-d234-f9fc-7612ea338bb9	8270	Krško
00050000-55c0-d234-5fed-bab3a512993b	9263	Kuzma
00050000-55c0-d234-e917-24a187b43496	2318	Laporje
00050000-55c0-d234-a934-7293b075a52a	3270	Laško
00050000-55c0-d234-a787-00b32a8ca090	1219	Laze v Tuhinju
00050000-55c0-d234-671d-ba01c5e4fb89	2230	Lenart v Slovenskih goricah
00050000-55c0-d234-bc56-95b7994dd2dc	9220	Lendava/Lendva
00050000-55c0-d234-6c0d-d9ea330d0414	4248	Lesce
00050000-55c0-d234-e37a-cbed0b3add26	3261	Lesično
00050000-55c0-d234-fd6e-98176969c7c6	8273	Leskovec pri Krškem
00050000-55c0-d234-3a88-aaada78bfedc	2372	Libeliče
00050000-55c0-d234-bea0-18942442e4ae	2341	Limbuš
00050000-55c0-d234-c874-b82925723fa9	1270	Litija
00050000-55c0-d234-ae49-6f590d28f234	3202	Ljubečna
00050000-55c0-d234-0d4b-b6dfee51bc4a	1000	Ljubljana 
00050000-55c0-d234-64ff-29b8f526c0ae	1001	Ljubljana - poštni predali
00050000-55c0-d234-3fcc-1a75752d813a	1231	Ljubljana - Črnuče
00050000-55c0-d234-bf87-22337863941d	1261	Ljubljana - Dobrunje
00050000-55c0-d234-58c4-d25b8dfdfe47	1260	Ljubljana - Polje
00050000-55c0-d234-51d5-c07d95522e97	1210	Ljubljana - Šentvid
00050000-55c0-d234-f8e2-8159b7411f28	1211	Ljubljana - Šmartno
00050000-55c0-d234-74df-833b27de8248	3333	Ljubno ob Savinji
00050000-55c0-d234-f190-7255004e80d6	9240	Ljutomer
00050000-55c0-d234-d570-7dbd96335225	3215	Loče
00050000-55c0-d234-69c7-e2b51432c424	5231	Log pod Mangartom
00050000-55c0-d234-e88e-43b010064ee6	1358	Log pri Brezovici
00050000-55c0-d234-e3a6-acd1b5b5fda1	1370	Logatec
00050000-55c0-d234-e507-3965bc5ce1a4	1371	Logatec
00050000-55c0-d234-3ad2-71d74fa5b1fb	1434	Loka pri Zidanem Mostu
00050000-55c0-d234-66fa-b868775b9b6b	3223	Loka pri Žusmu
00050000-55c0-d234-8e78-6a2cf4d7b3a7	6219	Lokev
00050000-55c0-d234-6744-f0cc4670f4ac	1318	Loški Potok
00050000-55c0-d234-c89b-907cea88a91e	2324	Lovrenc na Dravskem polju
00050000-55c0-d234-e502-4295a9422eae	2344	Lovrenc na Pohorju
00050000-55c0-d234-6f2b-4cf62933d428	3334	Luče
00050000-55c0-d234-5dd2-9238757f1b4d	1225	Lukovica
00050000-55c0-d234-d844-5be3e2c896cf	9202	Mačkovci
00050000-55c0-d234-909c-8402aea3862e	2322	Majšperk
00050000-55c0-d234-40d9-da9e4d691a66	2321	Makole
00050000-55c0-d234-c86d-42f9b4cee092	9243	Mala Nedelja
00050000-55c0-d234-9f44-895d4e5719a9	2229	Malečnik
00050000-55c0-d234-23fe-01df9cdf11b5	6273	Marezige
00050000-55c0-d234-4ca9-fc9ff2cc745a	2000	Maribor 
00050000-55c0-d234-20ba-f3243493d2a5	2001	Maribor - poštni predali
00050000-55c0-d234-9549-207b1822401f	2206	Marjeta na Dravskem polju
00050000-55c0-d234-4a5f-9b62266f5416	2281	Markovci
00050000-55c0-d234-63b2-3a199c1d2e0e	9221	Martjanci
00050000-55c0-d234-71ba-26bcc82ed09c	6242	Materija
00050000-55c0-d234-4376-c5bbb5336869	4211	Mavčiče
00050000-55c0-d234-7c1e-33b68cc06060	1215	Medvode
00050000-55c0-d234-cf46-b8eab9fe5801	1234	Mengeš
00050000-55c0-d234-faab-8e57333c9586	8330	Metlika
00050000-55c0-d234-0e8a-511e74fc5c96	2392	Mežica
00050000-55c0-d234-875a-21534fc10a45	2204	Miklavž na Dravskem polju
00050000-55c0-d234-07d6-ceefd973eb90	2275	Miklavž pri Ormožu
00050000-55c0-d234-0efe-26c2d6dcff3d	5291	Miren
00050000-55c0-d234-d32c-735160aaae34	8233	Mirna
00050000-55c0-d234-cd79-b8109f940d5c	8216	Mirna Peč
00050000-55c0-d234-b9e0-2ac2fa5c219c	2382	Mislinja
00050000-55c0-d234-db0e-294cfef75118	4281	Mojstrana
00050000-55c0-d234-9e8c-a0c54eada629	8230	Mokronog
00050000-55c0-d234-61fa-44fc75375670	1251	Moravče
00050000-55c0-d234-8f7c-0f4485e54f66	9226	Moravske Toplice
00050000-55c0-d234-69cc-fa0a4fc43eaa	5216	Most na Soči
00050000-55c0-d234-eb5c-e675008e5ab9	1221	Motnik
00050000-55c0-d234-19f4-c2c91d6090df	3330	Mozirje
00050000-55c0-d234-63e4-5b72573b4501	9000	Murska Sobota 
00050000-55c0-d234-05b3-26620fdc99d2	9001	Murska Sobota - poštni predali
00050000-55c0-d234-08ee-6c89062d2290	2366	Muta
00050000-55c0-d234-5d29-480053b7bc7e	4202	Naklo
00050000-55c0-d234-856d-0bf32f45f67d	3331	Nazarje
00050000-55c0-d234-a893-1504c35c6522	1357	Notranje Gorice
00050000-55c0-d234-a30d-c787ea4abe90	3203	Nova Cerkev
00050000-55c0-d234-3649-cb516207441a	5000	Nova Gorica 
00050000-55c0-d234-bad7-d9fc34f5f7e8	5001	Nova Gorica - poštni predali
00050000-55c0-d234-d8f3-0fd4f98cf0a4	1385	Nova vas
00050000-55c0-d234-51b9-ede158a5ae56	8000	Novo mesto
00050000-55c0-d234-cf02-ff2277dfa7ab	8001	Novo mesto - poštni predali
00050000-55c0-d234-3bb8-08ba574d29a4	6243	Obrov
00050000-55c0-d234-16a6-722de4a4364f	9233	Odranci
00050000-55c0-d234-70b5-9719c68fbdc8	2317	Oplotnica
00050000-55c0-d234-81ed-0a217dc47b61	2312	Orehova vas
00050000-55c0-d234-1a54-4dca51f6a247	2270	Ormož
00050000-55c0-d234-878c-b163c7f9b992	1316	Ortnek
00050000-55c0-d234-575f-763f6e234386	1337	Osilnica
00050000-55c0-d234-83e4-9d93286b6a9b	8222	Otočec
00050000-55c0-d234-32e2-9fb5d0e77e97	2361	Ožbalt
00050000-55c0-d234-3010-92905feffc7f	2231	Pernica
00050000-55c0-d234-77c1-7c8611cada82	2211	Pesnica pri Mariboru
00050000-55c0-d234-0126-65dd6756321e	9203	Petrovci
00050000-55c0-d234-a9f1-a450c4d8e132	3301	Petrovče
00050000-55c0-d234-a419-7afda51aeab3	6330	Piran/Pirano
00050000-55c0-d234-26a5-5f493ceb376c	8255	Pišece
00050000-55c0-d234-d176-4e873a5c556e	6257	Pivka
00050000-55c0-d234-a6f3-ae5f058bb52e	6232	Planina
00050000-55c0-d234-fa34-f290c588401d	3225	Planina pri Sevnici
00050000-55c0-d234-0b75-75733324e5e4	6276	Pobegi
00050000-55c0-d234-b4cb-04ba08f17339	8312	Podbočje
00050000-55c0-d234-2fca-4efb02e9cec7	5243	Podbrdo
00050000-55c0-d234-9ea5-c127d9136076	3254	Podčetrtek
00050000-55c0-d234-205b-07ddd58288ca	2273	Podgorci
00050000-55c0-d234-cac8-f35a9c079c8f	6216	Podgorje
00050000-55c0-d234-394f-e5cd1409db90	2381	Podgorje pri Slovenj Gradcu
00050000-55c0-d234-74bf-837eac3d339f	6244	Podgrad
00050000-55c0-d234-c90b-72d850afb403	1414	Podkum
00050000-55c0-d234-042a-3f71a755308b	2286	Podlehnik
00050000-55c0-d234-97c7-fb6a2689c96e	5272	Podnanos
00050000-55c0-d234-b1fb-97f979298c61	4244	Podnart
00050000-55c0-d234-9b89-e112b715f8ac	3241	Podplat
00050000-55c0-d234-4f09-e68a8e5893e6	3257	Podsreda
00050000-55c0-d234-1739-22d1b012bbb8	2363	Podvelka
00050000-55c0-d234-4bb7-d5e4a8ae819d	2208	Pohorje
00050000-55c0-d234-1656-cd97030ed660	2257	Polenšak
00050000-55c0-d234-1b2b-63914a765e4a	1355	Polhov Gradec
00050000-55c0-d234-2996-ca10f50f1c5a	4223	Poljane nad Škofjo Loko
00050000-55c0-d234-b71c-bbb204553faf	2319	Poljčane
00050000-55c0-d234-0cef-094aa2dbd7ca	1272	Polšnik
00050000-55c0-d234-6214-f94fa83ffc36	3313	Polzela
00050000-55c0-d234-3b10-e45a2e073baf	3232	Ponikva
00050000-55c0-d234-d1df-ce47763a503b	6320	Portorož/Portorose
00050000-55c0-d234-d43c-bab0974bdd38	6230	Postojna
00050000-55c0-d234-44c2-5067b60451bc	2331	Pragersko
00050000-55c0-d234-8f48-3fd37334e12f	3312	Prebold
00050000-55c0-d234-57fe-a84fed2820f0	4205	Preddvor
00050000-55c0-d234-c9e2-eb4cb0b3f917	6255	Prem
00050000-55c0-d234-f5c7-05516a152160	1352	Preserje
00050000-55c0-d234-75d6-c27aba886086	6258	Prestranek
00050000-55c0-d234-3775-d129b83e76d3	2391	Prevalje
00050000-55c0-d234-8aed-1c4b3a17356e	3262	Prevorje
00050000-55c0-d234-556c-d4039f7d6e96	1276	Primskovo 
00050000-55c0-d234-f102-4dfa9df98695	3253	Pristava pri Mestinju
00050000-55c0-d234-4dc7-75c4f2f8e7b9	9207	Prosenjakovci/Partosfalva
00050000-55c0-d234-b14b-de8292b94bf1	5297	Prvačina
00050000-55c0-d234-be6d-790c647fb2f9	2250	Ptuj
00050000-55c0-d234-350f-c8524f42edde	2323	Ptujska Gora
00050000-55c0-d234-c4fd-180a80144499	9201	Puconci
00050000-55c0-d234-3bbc-51444c8c4d95	2327	Rače
00050000-55c0-d234-3209-2d7b45947c3c	1433	Radeče
00050000-55c0-d234-5f79-244698127a70	9252	Radenci
00050000-55c0-d234-fa73-91191dcfb89a	2360	Radlje ob Dravi
00050000-55c0-d234-9ca8-708f1bd14483	1235	Radomlje
00050000-55c0-d234-c984-1eaccf815bbf	4240	Radovljica
00050000-55c0-d234-7c84-efdea4b81058	8274	Raka
00050000-55c0-d234-3aae-c7fa2bf81a06	1381	Rakek
00050000-55c0-d234-fdb4-813d03ffd6f9	4283	Rateče - Planica
00050000-55c0-d234-95ab-f313edc79e8b	2390	Ravne na Koroškem
00050000-55c0-d234-3728-4affd43282a9	9246	Razkrižje
00050000-55c0-d234-4b93-fef4d9c431b9	3332	Rečica ob Savinji
00050000-55c0-d234-adf0-67ddabf7c82c	5292	Renče
00050000-55c0-d234-4fbb-4c199172b720	1310	Ribnica
00050000-55c0-d234-9f58-8bf828845bc7	2364	Ribnica na Pohorju
00050000-55c0-d234-fa74-5a9f269fc1b8	3272	Rimske Toplice
00050000-55c0-d234-cfcc-f593f254c5e3	1314	Rob
00050000-55c0-d234-145d-8efe6da5cd17	5215	Ročinj
00050000-55c0-d234-1f10-539ffe11b7e6	3250	Rogaška Slatina
00050000-55c0-d234-e126-7b70c4bc5a42	9262	Rogašovci
00050000-55c0-d234-3eda-76803723b8f2	3252	Rogatec
00050000-55c0-d234-34a4-7457fdf19a25	1373	Rovte
00050000-55c0-d234-fa99-0c7bb5e1c97d	2342	Ruše
00050000-55c0-d234-bcbd-001962b11b4d	1282	Sava
00050000-55c0-d234-957c-82a52fc1e84d	6333	Sečovlje/Sicciole
00050000-55c0-d234-488c-1bedd3b5e1d3	4227	Selca
00050000-55c0-d234-cd2b-c5e0eb041592	2352	Selnica ob Dravi
00050000-55c0-d234-21a8-1dad8e570ff0	8333	Semič
00050000-55c0-d234-fd2e-156fc87581df	8281	Senovo
00050000-55c0-d234-0b6d-c73d5babe132	6224	Senožeče
00050000-55c0-d234-f126-3dd967ce01a5	8290	Sevnica
00050000-55c0-d234-d8a1-422965926b5c	6210	Sežana
00050000-55c0-d234-05aa-05fb79b3ae84	2214	Sladki Vrh
00050000-55c0-d234-ce4e-a2f38f8dfbfb	5283	Slap ob Idrijci
00050000-55c0-d234-be42-b0ccbd3226a4	2380	Slovenj Gradec
00050000-55c0-d234-d918-9b3ff16f9f76	2310	Slovenska Bistrica
00050000-55c0-d234-d8a6-2a08c0f3e05c	3210	Slovenske Konjice
00050000-55c0-d234-ee60-1f98f880e82c	1216	Smlednik
00050000-55c0-d234-4c1b-3aa700975443	5232	Soča
00050000-55c0-d234-2e89-ea5dba18f934	1317	Sodražica
00050000-55c0-d234-78f9-57b3d2b99cd4	3335	Solčava
00050000-55c0-d234-3c72-7c24539b1f27	5250	Solkan
00050000-55c0-d234-92e5-28ffd3d2b381	4229	Sorica
00050000-55c0-d234-e458-62f971efc915	4225	Sovodenj
00050000-55c0-d234-29ad-8bdf557c99fc	5281	Spodnja Idrija
00050000-55c0-d234-18db-066c9c382269	2241	Spodnji Duplek
00050000-55c0-d234-2d7d-b57731446571	9245	Spodnji Ivanjci
00050000-55c0-d234-fdb6-6bfe697dfdec	2277	Središče ob Dravi
00050000-55c0-d234-5078-dda7d7615f17	4267	Srednja vas v Bohinju
00050000-55c0-d234-4dc7-d9387cbccf19	8256	Sromlje 
00050000-55c0-d234-0abb-764dea802084	5224	Srpenica
00050000-55c0-d234-d0c6-cae70178c145	1242	Stahovica
00050000-55c0-d234-f483-c39c6f333482	1332	Stara Cerkev
00050000-55c0-d234-f3c6-d70d090f2420	8342	Stari trg ob Kolpi
00050000-55c0-d234-9b76-3c2770b6260c	1386	Stari trg pri Ložu
00050000-55c0-d234-a550-7505be763017	2205	Starše
00050000-55c0-d234-61db-59794a32b3cb	2289	Stoperce
00050000-55c0-d234-96be-f24b16eefb16	8322	Stopiče
00050000-55c0-d234-a074-2c6905910d4c	3206	Stranice
00050000-55c0-d234-0d9f-a635a7b0624d	8351	Straža
00050000-55c0-d234-75eb-d84ec6caa036	1313	Struge
00050000-55c0-d234-351c-e21b5e379950	8293	Studenec
00050000-55c0-d234-3b68-f3fffe6ad706	8331	Suhor
00050000-55c0-d234-2620-bfcbd1774b64	2233	Sv. Ana v Slovenskih goricah
00050000-55c0-d234-f714-e7951a0d758e	2235	Sv. Trojica v Slovenskih goricah
00050000-55c0-d234-0877-6bcd582e2bfa	2353	Sveti Duh na Ostrem Vrhu
00050000-55c0-d234-dcb0-82e6a409ead8	9244	Sveti Jurij ob Ščavnici
00050000-55c0-d234-54a7-5d4a482b6583	3264	Sveti Štefan
00050000-55c0-d234-f84f-3e61f1a27ec2	2258	Sveti Tomaž
00050000-55c0-d234-0bc9-13c5d115fe90	9204	Šalovci
00050000-55c0-d234-3f39-a95d06dba2a0	5261	Šempas
00050000-55c0-d234-040d-c32d74ab7bcd	5290	Šempeter pri Gorici
00050000-55c0-d234-3209-0bc4ae2e5f57	3311	Šempeter v Savinjski dolini
00050000-55c0-d234-8ef7-b411339279dd	4208	Šenčur
00050000-55c0-d234-bd67-4627483f36a9	2212	Šentilj v Slovenskih goricah
00050000-55c0-d234-2a3d-7d06876b5057	8297	Šentjanž
00050000-55c0-d234-ecee-22689888a730	2373	Šentjanž pri Dravogradu
00050000-55c0-d234-50b7-a2e09ecfc9ca	8310	Šentjernej
00050000-55c0-d234-b54c-aafb611f6d57	3230	Šentjur
00050000-55c0-d234-5d64-c1888a42d4ae	3271	Šentrupert
00050000-55c0-d234-7b24-d8c1cb5d9696	8232	Šentrupert
00050000-55c0-d234-ee5c-60f592a85dea	1296	Šentvid pri Stični
00050000-55c0-d234-24e9-6addd9e588e6	8275	Škocjan
00050000-55c0-d234-c458-f72720bb06ac	6281	Škofije
00050000-55c0-d234-5c43-05e3cabed472	4220	Škofja Loka
00050000-55c0-d234-502a-4daa55b9f112	3211	Škofja vas
00050000-55c0-d234-6f03-51d8d687022f	1291	Škofljica
00050000-55c0-d234-4a22-3c2eec61b5aa	6274	Šmarje
00050000-55c0-d234-246d-ccbb145efb1a	1293	Šmarje - Sap
00050000-55c0-d234-7f46-16c1da5188a6	3240	Šmarje pri Jelšah
00050000-55c0-d234-e278-fa34e4610c31	8220	Šmarješke Toplice
00050000-55c0-d234-cf66-c0f647824594	2315	Šmartno na Pohorju
00050000-55c0-d234-f0ff-9a69b4589e7b	3341	Šmartno ob Dreti
00050000-55c0-d234-d6fe-2a39ab37d200	3327	Šmartno ob Paki
00050000-55c0-d234-68a8-0f0e278797df	1275	Šmartno pri Litiji
00050000-55c0-d234-fd9d-cbb932050a87	2383	Šmartno pri Slovenj Gradcu
00050000-55c0-d234-b322-32a876847968	3201	Šmartno v Rožni dolini
00050000-55c0-d234-8778-b44818c98d5d	3325	Šoštanj
00050000-55c0-d234-0a5b-032769f59c5d	6222	Štanjel
00050000-55c0-d234-7ab5-0a37f5436bc6	3220	Štore
00050000-55c0-d234-49c6-ad9de205a1a3	3304	Tabor
00050000-55c0-d234-8a7f-391a1acfba44	3221	Teharje
00050000-55c0-d234-4252-3cb460b88a8c	9251	Tišina
00050000-55c0-d234-0958-7f6faf21db6c	5220	Tolmin
00050000-55c0-d234-7aa1-845bd0006d86	3326	Topolšica
00050000-55c0-d234-9a2f-ff15c45e6ac8	2371	Trbonje
00050000-55c0-d234-fbc8-691ea19ec4a6	1420	Trbovlje
00050000-55c0-d234-3fc3-5621dba2712e	8231	Trebelno 
00050000-55c0-d234-40b2-461caeb232b7	8210	Trebnje
00050000-55c0-d234-b23d-85400641b1d8	5252	Trnovo pri Gorici
00050000-55c0-d234-3254-2bd6f783bb87	2254	Trnovska vas
00050000-55c0-d234-7952-7cd39a999d2d	1222	Trojane
00050000-55c0-d234-6639-1ae2be4112b0	1236	Trzin
00050000-55c0-d234-527f-1a12db545906	4290	Tržič
00050000-55c0-d234-fbb4-596c87edbda5	8295	Tržišče
00050000-55c0-d234-cd4e-fd533993ac52	1311	Turjak
00050000-55c0-d234-2dc4-7e15520e2994	9224	Turnišče
00050000-55c0-d234-08ce-37126aeff1f4	8323	Uršna sela
00050000-55c0-d234-a849-d106fc02e58f	1252	Vače
00050000-55c0-d234-3eda-181076301778	3320	Velenje 
00050000-55c0-d234-5e69-794c3db93708	3322	Velenje - poštni predali
00050000-55c0-d234-f1d7-ac019561f028	8212	Velika Loka
00050000-55c0-d234-eef6-4d95d8f68f02	2274	Velika Nedelja
00050000-55c0-d234-63e4-a22010795d97	9225	Velika Polana
00050000-55c0-d234-2a01-ff8737e6d610	1315	Velike Lašče
00050000-55c0-d234-10d8-047b8aa47055	8213	Veliki Gaber
00050000-55c0-d234-b915-1c5f044c9de9	9241	Veržej
00050000-55c0-d234-7e2e-da55dbf284f5	1312	Videm - Dobrepolje
00050000-55c0-d234-d819-fd3d526c7f86	2284	Videm pri Ptuju
00050000-55c0-d234-bad1-7bdb6d144079	8344	Vinica
00050000-55c0-d234-7c4b-bc8c3be01563	5271	Vipava
00050000-55c0-d234-a4a5-b38ed738f707	4212	Visoko
00050000-55c0-d234-e6a4-9ddcd8bde50f	1294	Višnja Gora
00050000-55c0-d234-5c8f-3e35547f2b31	3205	Vitanje
00050000-55c0-d234-5800-11975c76e9c4	2255	Vitomarci
00050000-55c0-d234-1a0b-19f1ac2aa7aa	1217	Vodice
00050000-55c0-d234-56e3-39298d30cfa0	3212	Vojnik\t
00050000-55c0-d234-a4f0-8216d94205f1	5293	Volčja Draga
00050000-55c0-d234-0786-85a78e8958f0	2232	Voličina
00050000-55c0-d234-68cf-1871d7a36fd5	3305	Vransko
00050000-55c0-d234-101c-2706ff00c005	6217	Vremski Britof
00050000-55c0-d234-dac0-895078506cff	1360	Vrhnika
00050000-55c0-d234-454f-e35cbc3beb60	2365	Vuhred
00050000-55c0-d234-49cd-92fc89aea019	2367	Vuzenica
00050000-55c0-d234-050e-0b344d52d6c7	8292	Zabukovje 
00050000-55c0-d234-51e4-e55d7d20aca1	1410	Zagorje ob Savi
00050000-55c0-d234-a7b7-19f54f722c7d	1303	Zagradec
00050000-55c0-d234-2b85-414ffbf2b1f0	2283	Zavrč
00050000-55c0-d234-110d-83c026e6f451	8272	Zdole 
00050000-55c0-d234-6bf3-7ed81fe0686b	4201	Zgornja Besnica
00050000-55c0-d234-6d77-9bc5f0d1f82a	2242	Zgornja Korena
00050000-55c0-d234-7ba8-96de7dd0ab40	2201	Zgornja Kungota
00050000-55c0-d234-fc1f-ec568dbbb7a5	2316	Zgornja Ložnica
00050000-55c0-d234-36f5-315c559591b8	2314	Zgornja Polskava
00050000-55c0-d234-3e83-10829b55bedb	2213	Zgornja Velka
00050000-55c0-d234-11a4-c8af25ecce1e	4247	Zgornje Gorje
00050000-55c0-d234-3720-90a52ff81844	4206	Zgornje Jezersko
00050000-55c0-d234-dabf-a2f7f66262f2	2285	Zgornji Leskovec
00050000-55c0-d234-b137-6f10ffcccbc5	1432	Zidani Most
00050000-55c0-d234-de57-3b28e41edf2b	3214	Zreče
00050000-55c0-d234-548b-a175d9d9057a	4209	Žabnica
00050000-55c0-d234-f930-5f4792ef5d44	3310	Žalec
00050000-55c0-d234-8373-fb4a1cab1ae9	4228	Železniki
00050000-55c0-d234-405d-fe39c0ccef78	2287	Žetale
00050000-55c0-d234-1a2c-89f62288ffe6	4226	Žiri
00050000-55c0-d234-9519-ff29cc688cd8	4274	Žirovnica
00050000-55c0-d234-8bfc-7f9eda233b8c	8360	Žužemberk
\.


--
-- TOC entry 3020 (class 0 OID 11824535)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 11824342)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11824420)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 11824547)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3045 (class 0 OID 11824877)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 11824887)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c0-d236-51d5-e4f8504d0856	00080000-55c0-d236-018c-b77233d50a3e	0900	AK
00190000-55c0-d236-c6f6-095764342ce7	00080000-55c0-d235-1719-1964ceac5da4	0987	AK
00190000-55c0-d236-84fd-e30dc36ff658	00080000-55c0-d235-2484-162aad504229	0989	AK
00190000-55c0-d236-7a6e-945d4fa27aba	00080000-55c0-d235-db54-102b67c8d4a8	0986	AK
00190000-55c0-d236-fe13-548ba0a7a152	00080000-55c0-d235-0842-4e7086d28ce8	0984	AK
00190000-55c0-d236-0b24-9dff7912a40a	00080000-55c0-d235-ffdb-389bb77dd1f0	0983	AK
00190000-55c0-d236-33fc-8b8ee40d1ce2	00080000-55c0-d236-717c-cba2f95c02ba	0982	AK
\.


--
-- TOC entry 3044 (class 0 OID 11824833)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c0-d236-bd9b-9e963ef34bee	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2989 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 11824895)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11824576)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c0-d236-111d-dc2a13b3b07d	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c0-d236-1ce6-e491b7f3525b	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c0-d236-b6c2-01975e9565b5	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c0-d236-e76e-bc65e74fa469	0004	Mali oder	t	24	Mali oder 
00220000-55c0-d236-07cc-64e777f4db98	0005	Komorni oder	t	15	Komorni oder
00220000-55c0-d236-3e64-b20254fd409e	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c0-d236-289a-a381076eeceb	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3018 (class 0 OID 11824520)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11824510)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 11824695)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 11824644)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11824214)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3027 (class 0 OID 11824586)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11824252)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c0-d234-bc28-c5acb3005d95	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c0-d234-422c-9f21039dc758	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c0-d234-9bf2-8f0056451b35	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c0-d234-e82f-c09b16cdc1de	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c0-d234-35ac-af7a8cb30c19	planer	Planer dogodkov v koledarju	t
00020000-55c0-d234-beb5-640957b8b162	kadrovska	Kadrovska služba	t
00020000-55c0-d234-4bb8-b5c327071509	arhivar	Ažuriranje arhivalij	t
00020000-55c0-d234-143c-84e8ecf4848f	igralec	Igralec	t
00020000-55c0-d234-edbb-0ca342bf657e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c0-d236-2be9-dcedc4af67f8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2993 (class 0 OID 11824236)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c0-d234-24a9-32180b4878d7	00020000-55c0-d234-9bf2-8f0056451b35
00010000-55c0-d234-61bc-4000fa8030d0	00020000-55c0-d234-9bf2-8f0056451b35
00010000-55c0-d236-00a7-d80883fd6b79	00020000-55c0-d236-2be9-dcedc4af67f8
\.


--
-- TOC entry 3029 (class 0 OID 11824600)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11824541)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 11824487)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 11824936)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c0-d234-b069-a93e649276ca	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c0-d234-25d1-21db405ba75f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c0-d234-d70c-bd5288d9deea	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c0-d234-da49-c130c2a22c10	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c0-d234-4be8-ff7218ad2859	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3051 (class 0 OID 11824928)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c0-d234-1459-05c8fb0f9cca	00230000-55c0-d234-da49-c130c2a22c10	popa
00240000-55c0-d234-a36a-98181ab14997	00230000-55c0-d234-da49-c130c2a22c10	oseba
00240000-55c0-d234-7f83-84c8faed4105	00230000-55c0-d234-da49-c130c2a22c10	sezona
00240000-55c0-d234-9892-dc4dd16f7bb8	00230000-55c0-d234-25d1-21db405ba75f	prostor
00240000-55c0-d234-ba10-ed1e42805720	00230000-55c0-d234-da49-c130c2a22c10	besedilo
00240000-55c0-d234-395a-d6755c922850	00230000-55c0-d234-da49-c130c2a22c10	uprizoritev
00240000-55c0-d234-cc6f-dd077492ebf7	00230000-55c0-d234-da49-c130c2a22c10	funkcija
00240000-55c0-d234-920e-675551d5dc71	00230000-55c0-d234-da49-c130c2a22c10	tipfunkcije
00240000-55c0-d234-2590-8d605fc47cd6	00230000-55c0-d234-da49-c130c2a22c10	alternacija
00240000-55c0-d234-5177-03dd91ac7f0a	00230000-55c0-d234-b069-a93e649276ca	pogodba
00240000-55c0-d234-b7a4-5a02de164a99	00230000-55c0-d234-da49-c130c2a22c10	zaposlitev
00240000-55c0-d234-7349-b3ca5ca22951	00230000-55c0-d234-b069-a93e649276ca	programdela
00240000-55c0-d234-eca5-46497172706d	00230000-55c0-d234-da49-c130c2a22c10	zapis
\.


--
-- TOC entry 3050 (class 0 OID 11824923)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 11824654)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c0-d236-63bb-706d31f8041e	000e0000-55c0-d236-c9bc-f34cc2a6e67f	00080000-55c0-d235-fc4a-bccf6c60f3fe	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c0-d236-b22f-0dcda296bcb1	000e0000-55c0-d236-c9bc-f34cc2a6e67f	00080000-55c0-d235-fc4a-bccf6c60f3fe	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c0-d236-5eb6-b12d67ee7604	000e0000-55c0-d236-c9bc-f34cc2a6e67f	00080000-55c0-d235-c132-d0dbb4e7c928	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c0-d236-5d21-58852710523a	000e0000-55c0-d236-c9bc-f34cc2a6e67f	00080000-55c0-d235-c132-d0dbb4e7c928	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3000 (class 0 OID 11824314)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11824497)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c0-d236-9a1a-07d52ceb14ff	00180000-55c0-d236-3d34-7f11d97950eb	000c0000-55c0-d236-4b14-8bd9f8dbef07	00090000-55c0-d236-cb80-da3858ba5a58	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-d236-6b1f-304fa3f60c23	00180000-55c0-d236-3d34-7f11d97950eb	000c0000-55c0-d236-6a1b-9c4d8040515f	00090000-55c0-d236-0c71-3fd0e826b447	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-d236-9b6b-e75f5c350e19	00180000-55c0-d236-3d34-7f11d97950eb	000c0000-55c0-d236-5f5e-a053b571d8fe	00090000-55c0-d236-09f4-6e2a20546d34	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-d236-87cf-e55fddf15919	00180000-55c0-d236-3d34-7f11d97950eb	000c0000-55c0-d236-2907-b23af4b75289	00090000-55c0-d236-3d57-c2ad601b2596	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-d236-7c3a-6ccf789bae76	00180000-55c0-d236-3d34-7f11d97950eb	000c0000-55c0-d236-7eda-affe5e88fd41	00090000-55c0-d236-ba40-08b3e4bcde08	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c0-d236-2f02-ee70bc3a5aac	00180000-55c0-d236-a49e-06805fa3d18e	\N	00090000-55c0-d236-ba40-08b3e4bcde08	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3036 (class 0 OID 11824684)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c0-d234-1d38-618c8e93b191	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c0-d234-3508-b536190199fa	Priredba	Priredba	Priredba	umetnik
000f0000-55c0-d234-cab1-1bb4b2c2839b	Prevod	Prevod	Prevod	umetnik
000f0000-55c0-d234-8422-fc347926fe64	Režija	Režija	Režija	umetnik
000f0000-55c0-d234-2309-e5e162c95332	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c0-d234-97e5-95a8da059688	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c0-d234-5af0-ae2bea7e024e	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c0-d234-a7a7-81e9354f2371	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c0-d234-df70-e3d5a5af8d97	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c0-d234-51d4-0399edb8e97e	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c0-d234-5467-402624abbb08	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c0-d234-8593-53c1792ed616	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c0-d234-cd95-c7fe114a8f81	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c0-d234-4752-8628860b7a06	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c0-d234-03ef-7dce63e79cfd	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c0-d234-963d-b07e273da957	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c0-d234-e3c6-0139bc1fc03b	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c0-d234-291f-2bccfb8313d0	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3048 (class 0 OID 11824905)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c0-d234-b3da-47f59759354f	01	Velika predstava	f	1.00	1.00
002b0000-55c0-d234-ae97-41ffc2583a8c	02	Mala predstava	f	0.50	0.50
002b0000-55c0-d234-a8f4-e3db4b215610	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c0-d234-2a84-39431e24930d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c0-d234-78d0-1bbae8267ea5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3005 (class 0 OID 11824377)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 11824223)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c0-d234-61bc-4000fa8030d0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROOixWwPLVBHck/axvzNIq.kXLgp9PnmK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c0-d236-b4dd-ceca3f082d90	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c0-d236-5f79-0c02d72c3bee	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c0-d236-fa21-baae908311e3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c0-d236-4ca8-6fa2cb614037	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c0-d236-57d3-8854e10a0096	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c0-d236-366b-43099f063069	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c0-d236-9035-1ab62a4e970c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c0-d236-4e69-b882a4e5f257	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c0-d236-baac-6aa4598decf3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c0-d236-00a7-d80883fd6b79	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c0-d234-24a9-32180b4878d7	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3040 (class 0 OID 11824732)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c0-d236-2416-a9116cdc6f09	00160000-55c0-d236-67cf-f05aee76195f	00150000-55c0-d234-6d91-78d96490fd7c	00140000-55c0-d233-232c-8e01c5ff4e0d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c0-d236-07cc-64e777f4db98
000e0000-55c0-d236-c9bc-f34cc2a6e67f	00160000-55c0-d236-0365-492f190944cc	00150000-55c0-d234-9636-8e5177a7427d	00140000-55c0-d233-dd1c-db6b829a2ad9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c0-d236-3e64-b20254fd409e
000e0000-55c0-d236-63be-b2774c9f95fc	\N	00150000-55c0-d234-9636-8e5177a7427d	00140000-55c0-d233-dd1c-db6b829a2ad9	00190000-55c0-d236-c6f6-095764342ce7	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c0-d236-07cc-64e777f4db98
000e0000-55c0-d236-ec43-f50e929d4066	\N	00150000-55c0-d234-9636-8e5177a7427d	00140000-55c0-d233-dd1c-db6b829a2ad9	00190000-55c0-d236-c6f6-095764342ce7	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c0-d236-07cc-64e777f4db98
000e0000-55c0-d236-f566-2979e3ebdcc7	\N	00150000-55c0-d234-9636-8e5177a7427d	00140000-55c0-d233-dd1c-db6b829a2ad9	00190000-55c0-d236-c6f6-095764342ce7	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c0-d236-111d-dc2a13b3b07d
\.


--
-- TOC entry 3010 (class 0 OID 11824439)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c0-d236-686d-e6f42196ab5a	000e0000-55c0-d236-c9bc-f34cc2a6e67f	1	
00200000-55c0-d236-13ef-52f64801df66	000e0000-55c0-d236-c9bc-f34cc2a6e67f	2	
\.


--
-- TOC entry 3025 (class 0 OID 11824568)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 11824975)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 11824947)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 11824987)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 11824637)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c0-d236-a441-9563aefc8dbe	00090000-55c0-d236-0c71-3fd0e826b447	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-d236-f110-71e19083c6c9	00090000-55c0-d236-09f4-6e2a20546d34	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-d236-070a-4554a4f3f54e	00090000-55c0-d236-d06c-0926324dd172	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-d236-a6c5-e5432619e1ab	00090000-55c0-d236-d83b-4241a07abcf6	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-d236-2e4d-8eb1f12da911	00090000-55c0-d236-cb80-da3858ba5a58	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c0-d236-44c3-c349abd61cb8	00090000-55c0-d236-568d-6c69df086a89	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3012 (class 0 OID 11824471)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 11824722)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c0-d233-232c-8e01c5ff4e0d	01	Drama	drama (SURS 01)
00140000-55c0-d233-3bf1-ef2a63fdd8af	02	Opera	opera (SURS 02)
00140000-55c0-d233-2ee2-fca356ef21ff	03	Balet	balet (SURS 03)
00140000-55c0-d233-c465-7fe9f7028d3e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c0-d233-c295-7370cb16cf10	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c0-d233-dd1c-db6b829a2ad9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c0-d233-b34d-21200c32f421	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3031 (class 0 OID 11824627)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c0-d234-2137-360a443352a6	01	Opera	opera
00150000-55c0-d234-3dc5-87a1d82f6d92	02	Opereta	opereta
00150000-55c0-d234-e077-c21794fe79f3	03	Balet	balet
00150000-55c0-d234-19f2-3ebfe249f721	04	Plesne prireditve	plesne prireditve
00150000-55c0-d234-a7be-9e1f24419f36	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c0-d234-7d29-d1188538d5c8	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c0-d234-7db2-18d8f8312850	07	Biografska drama	biografska drama
00150000-55c0-d234-6d91-78d96490fd7c	08	Komedija	komedija
00150000-55c0-d234-b96e-a5f3311b4073	09	Črna komedija	črna komedija
00150000-55c0-d234-cb0e-9ea1798aedd4	10	E-igra	E-igra
00150000-55c0-d234-9636-8e5177a7427d	11	Kriminalka	kriminalka
00150000-55c0-d234-d99d-292b579b1901	12	Musical	musical
\.


--
-- TOC entry 2536 (class 2606 OID 11824277)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11824779)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 11824769)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 11824683)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 11825028)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 11824461)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11824486)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 11824921)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 11824403)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 11824827)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 11824623)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 11824437)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 11824480)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 11824417)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 11824533)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 11825004)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 11825011)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2777 (class 2606 OID 11825036)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 11824560)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 11824375)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 11824286)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2543 (class 2606 OID 11824310)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 11824266)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2527 (class 2606 OID 11824251)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 11824566)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11824599)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 11824717)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 11824339)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 11824363)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11824539)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 11824353)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 11824424)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 11824551)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 11824884)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 11824892)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 11824875)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 11824903)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 11824583)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 11824524)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11824515)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 11824705)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 11824651)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 11824222)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11824590)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11824240)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2529 (class 2606 OID 11824260)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 11824608)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11824546)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 11824495)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 11824945)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 11824933)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11824927)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 11824664)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 11824319)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 11824506)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 11824694)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 11824915)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 11824388)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 11824235)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 11824748)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 11824446)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 11824574)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 11824985)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 11824969)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 11824993)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 11824642)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 11824475)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 11824730)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 11824635)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 1259 OID 11824468)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 11824665)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2678 (class 1259 OID 11824666)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2763 (class 1259 OID 11825006)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2764 (class 1259 OID 11825005)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2550 (class 1259 OID 11824341)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2497 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2498 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2499 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2642 (class 1259 OID 11824567)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 11824973)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2751 (class 1259 OID 11824972)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2752 (class 1259 OID 11824974)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2753 (class 1259 OID 11824971)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2754 (class 1259 OID 11824970)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2636 (class 1259 OID 11824553)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2637 (class 1259 OID 11824552)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2587 (class 1259 OID 11824447)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2664 (class 1259 OID 11824624)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 11824626)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2666 (class 1259 OID 11824625)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2575 (class 1259 OID 11824419)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2576 (class 1259 OID 11824418)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2733 (class 1259 OID 11824904)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2687 (class 1259 OID 11824719)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2688 (class 1259 OID 11824720)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2689 (class 1259 OID 11824721)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2760 (class 1259 OID 11824994)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2511 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2512 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2696 (class 1259 OID 11824753)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2697 (class 1259 OID 11824750)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2698 (class 1259 OID 11824754)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2699 (class 1259 OID 11824752)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2700 (class 1259 OID 11824751)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2565 (class 1259 OID 11824390)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 11824389)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2502 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2541 (class 1259 OID 11824313)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2652 (class 1259 OID 11824591)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 11824481)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 11824267)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2532 (class 1259 OID 11824268)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2657 (class 1259 OID 11824611)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2658 (class 1259 OID 11824610)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 11824609)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2579 (class 1259 OID 11824425)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 11824427)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2581 (class 1259 OID 11824426)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2743 (class 1259 OID 11824935)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2616 (class 1259 OID 11824519)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2617 (class 1259 OID 11824517)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2618 (class 1259 OID 11824516)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2619 (class 1259 OID 11824518)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2522 (class 1259 OID 11824241)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2523 (class 1259 OID 11824242)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2645 (class 1259 OID 11824575)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2773 (class 1259 OID 11825029)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2774 (class 1259 OID 11825037)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2775 (class 1259 OID 11825038)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2631 (class 1259 OID 11824540)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2673 (class 1259 OID 11824652)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2674 (class 1259 OID 11824653)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2717 (class 1259 OID 11824832)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2718 (class 1259 OID 11824831)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2719 (class 1259 OID 11824828)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2720 (class 1259 OID 11824829)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2721 (class 1259 OID 11824830)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2554 (class 1259 OID 11824355)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2555 (class 1259 OID 11824354)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2556 (class 1259 OID 11824356)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2515 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2725 (class 1259 OID 11824885)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2726 (class 1259 OID 11824886)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2710 (class 1259 OID 11824783)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2711 (class 1259 OID 11824784)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2712 (class 1259 OID 11824781)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2713 (class 1259 OID 11824782)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2670 (class 1259 OID 11824643)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2622 (class 1259 OID 11824528)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2623 (class 1259 OID 11824527)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2624 (class 1259 OID 11824525)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2625 (class 1259 OID 11824526)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2493 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2706 (class 1259 OID 11824771)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2707 (class 1259 OID 11824770)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 11824876)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2586 (class 1259 OID 11824438)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 11824922)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2767 (class 1259 OID 11825012)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2768 (class 1259 OID 11825013)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2537 (class 1259 OID 11824288)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2538 (class 1259 OID 11824287)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2546 (class 1259 OID 11824320)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 11824321)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 11824509)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2612 (class 1259 OID 11824508)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2613 (class 1259 OID 11824507)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2507 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2593 (class 1259 OID 11824470)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2594 (class 1259 OID 11824466)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2595 (class 1259 OID 11824463)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2596 (class 1259 OID 11824464)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2597 (class 1259 OID 11824462)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2598 (class 1259 OID 11824467)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2599 (class 1259 OID 11824465)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2553 (class 1259 OID 11824340)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 11824404)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 11824406)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2573 (class 1259 OID 11824405)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2574 (class 1259 OID 11824407)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2630 (class 1259 OID 11824534)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2692 (class 1259 OID 11824718)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2701 (class 1259 OID 11824749)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11824311)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11824312)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2667 (class 1259 OID 11824636)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2749 (class 1259 OID 11824946)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 11824376)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2746 (class 1259 OID 11824934)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2650 (class 1259 OID 11824585)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2651 (class 1259 OID 11824584)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 11824780)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2561 (class 1259 OID 11824364)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 11824731)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2757 (class 1259 OID 11824986)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2731 (class 1259 OID 11824893)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2732 (class 1259 OID 11824894)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 11824496)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 11824261)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2600 (class 1259 OID 11824469)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2803 (class 2606 OID 11825174)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2806 (class 2606 OID 11825159)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2805 (class 2606 OID 11825164)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2801 (class 2606 OID 11825184)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2807 (class 2606 OID 11825154)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2802 (class 2606 OID 11825179)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2804 (class 2606 OID 11825169)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 11825329)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2836 (class 2606 OID 11825334)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2870 (class 2606 OID 11825504)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2871 (class 2606 OID 11825499)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2788 (class 2606 OID 11825089)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2824 (class 2606 OID 11825269)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2865 (class 2606 OID 11825484)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2866 (class 2606 OID 11825479)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2864 (class 2606 OID 11825489)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 11825474)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2868 (class 2606 OID 11825469)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2822 (class 2606 OID 11825264)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2823 (class 2606 OID 11825259)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2800 (class 2606 OID 11825149)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 11825299)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 11825309)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2831 (class 2606 OID 11825304)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2794 (class 2606 OID 11825124)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2795 (class 2606 OID 11825119)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2820 (class 2606 OID 11825249)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2861 (class 2606 OID 11825454)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2840 (class 2606 OID 11825339)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 11825344)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 11825349)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2869 (class 2606 OID 11825494)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2842 (class 2606 OID 11825369)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2845 (class 2606 OID 11825354)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2841 (class 2606 OID 11825374)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2843 (class 2606 OID 11825364)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2844 (class 2606 OID 11825359)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2792 (class 2606 OID 11825114)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2793 (class 2606 OID 11825109)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2784 (class 2606 OID 11825074)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2785 (class 2606 OID 11825069)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2826 (class 2606 OID 11825279)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2808 (class 2606 OID 11825189)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2781 (class 2606 OID 11825049)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2780 (class 2606 OID 11825054)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2827 (class 2606 OID 11825294)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2828 (class 2606 OID 11825289)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2829 (class 2606 OID 11825284)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2798 (class 2606 OID 11825129)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 11825139)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2797 (class 2606 OID 11825134)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2863 (class 2606 OID 11825464)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2812 (class 2606 OID 11825224)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2814 (class 2606 OID 11825214)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2815 (class 2606 OID 11825209)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2813 (class 2606 OID 11825219)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2779 (class 2606 OID 11825039)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2778 (class 2606 OID 11825044)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2825 (class 2606 OID 11825274)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2874 (class 2606 OID 11825519)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 11825524)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2875 (class 2606 OID 11825529)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2821 (class 2606 OID 11825254)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2835 (class 2606 OID 11825319)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2834 (class 2606 OID 11825324)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2852 (class 2606 OID 11825429)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2853 (class 2606 OID 11825424)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2856 (class 2606 OID 11825409)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2855 (class 2606 OID 11825414)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2854 (class 2606 OID 11825419)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2790 (class 2606 OID 11825099)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 11825094)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 11825104)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2859 (class 2606 OID 11825439)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 11825444)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2849 (class 2606 OID 11825399)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2848 (class 2606 OID 11825404)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2851 (class 2606 OID 11825389)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2850 (class 2606 OID 11825394)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2833 (class 2606 OID 11825314)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2816 (class 2606 OID 11825244)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2817 (class 2606 OID 11825239)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2819 (class 2606 OID 11825229)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2818 (class 2606 OID 11825234)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2846 (class 2606 OID 11825384)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 11825379)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2857 (class 2606 OID 11825434)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2799 (class 2606 OID 11825144)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 11825449)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 11825459)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2873 (class 2606 OID 11825509)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2872 (class 2606 OID 11825514)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2782 (class 2606 OID 11825064)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 11825059)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2787 (class 2606 OID 11825079)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 11825084)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 11825204)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2810 (class 2606 OID 11825199)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2811 (class 2606 OID 11825194)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-04 16:54:47 CEST

--
-- PostgreSQL database dump complete
--

