--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-07 10:53:58 CEST

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
-- TOC entry 183 (class 1259 OID 12410850)
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
-- TOC entry 228 (class 1259 OID 12411353)
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
-- TOC entry 227 (class 1259 OID 12411336)
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
-- TOC entry 221 (class 1259 OID 12411248)
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
-- TOC entry 244 (class 1259 OID 12411596)
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
-- TOC entry 197 (class 1259 OID 12411029)
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
-- TOC entry 200 (class 1259 OID 12411063)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12411498)
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
-- TOC entry 192 (class 1259 OID 12410972)
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
-- TOC entry 229 (class 1259 OID 12411366)
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
-- TOC entry 216 (class 1259 OID 12411193)
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
-- TOC entry 195 (class 1259 OID 12411009)
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
-- TOC entry 199 (class 1259 OID 12411057)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12410989)
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
-- TOC entry 205 (class 1259 OID 12411110)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12411577)
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
-- TOC entry 243 (class 1259 OID 12411589)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12411612)
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
-- TOC entry 209 (class 1259 OID 12411135)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12410946)
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
-- TOC entry 184 (class 1259 OID 12410859)
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
-- TOC entry 185 (class 1259 OID 12410870)
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
-- TOC entry 180 (class 1259 OID 12410824)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12410843)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12411142)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12411173)
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
-- TOC entry 224 (class 1259 OID 12411287)
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
-- TOC entry 187 (class 1259 OID 12410903)
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
-- TOC entry 189 (class 1259 OID 12410938)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12411116)
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
-- TOC entry 188 (class 1259 OID 12410923)
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
-- TOC entry 194 (class 1259 OID 12411001)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12411128)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12411459)
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
-- TOC entry 232 (class 1259 OID 12411469)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12411415)
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
-- TOC entry 233 (class 1259 OID 12411477)
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
-- TOC entry 212 (class 1259 OID 12411157)
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
-- TOC entry 204 (class 1259 OID 12411101)
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
-- TOC entry 203 (class 1259 OID 12411091)
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
-- TOC entry 223 (class 1259 OID 12411276)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12411225)
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
-- TOC entry 177 (class 1259 OID 12410795)
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
-- TOC entry 176 (class 1259 OID 12410793)
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
-- TOC entry 213 (class 1259 OID 12411167)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12410833)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12410817)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12411181)
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
-- TOC entry 207 (class 1259 OID 12411122)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12411068)
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
-- TOC entry 238 (class 1259 OID 12411518)
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
-- TOC entry 237 (class 1259 OID 12411510)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12411505)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12411235)
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
-- TOC entry 186 (class 1259 OID 12410895)
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
-- TOC entry 202 (class 1259 OID 12411078)
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
-- TOC entry 222 (class 1259 OID 12411265)
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
-- TOC entry 234 (class 1259 OID 12411487)
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
-- TOC entry 191 (class 1259 OID 12410958)
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
-- TOC entry 178 (class 1259 OID 12410804)
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
-- TOC entry 226 (class 1259 OID 12411313)
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
-- TOC entry 196 (class 1259 OID 12411020)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12411149)
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
-- TOC entry 240 (class 1259 OID 12411557)
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
-- TOC entry 239 (class 1259 OID 12411529)
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
-- TOC entry 241 (class 1259 OID 12411569)
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
-- TOC entry 218 (class 1259 OID 12411218)
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
-- TOC entry 198 (class 1259 OID 12411052)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12411303)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12411208)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12410798)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12410850)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12411353)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c4-7225-d442-8fa6e8150f72	000d0000-55c4-7225-29f5-292f6c3b1511	\N	00090000-55c4-7225-e3d0-a79168f15691	000b0000-55c4-7225-fc5d-c991bb8e17ec	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c4-7225-262f-5d8b8a3dde73	000d0000-55c4-7225-645a-f7265f5d40e7	00100000-55c4-7225-7713-a67b6085e06a	00090000-55c4-7225-b106-bfebcf48830b	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c4-7225-2526-0999db49582e	000d0000-55c4-7225-4107-3e51fb82e868	00100000-55c4-7225-4d02-5c9a248eda3c	00090000-55c4-7225-29ee-e36908727d1d	\N	0003	t	\N	2015-08-07	\N	2	\N	\N	f	f
000c0000-55c4-7225-6f92-4ccc102ca18b	000d0000-55c4-7225-9540-90d3a7f9567f	\N	00090000-55c4-7225-8b8d-31b9fd0dcef2	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c4-7225-7837-bfef74f73326	000d0000-55c4-7225-f287-45199d6ccdd7	\N	00090000-55c4-7225-ea0b-517a2a03eb97	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c4-7225-3d17-7362ad80e3b2	000d0000-55c4-7225-a79c-580054eba765	\N	00090000-55c4-7225-944c-7ff16b87a211	000b0000-55c4-7225-4338-503984cde364	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c4-7225-364d-14a5c805131c	000d0000-55c4-7225-9022-28ecd4264f92	00100000-55c4-7225-bfe0-3419ce3c11d1	00090000-55c4-7225-ad4c-d9c0d6eb53d7	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c4-7225-ecf2-ba4d6c5dbc54	000d0000-55c4-7225-0f54-4b8a4f7bbd0c	\N	00090000-55c4-7225-e165-378ece2ce66b	000b0000-55c4-7225-c84d-3352f145d5c2	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c4-7225-78b4-5b873b8b6fa0	000d0000-55c4-7225-9022-28ecd4264f92	00100000-55c4-7225-2793-fc1612522517	00090000-55c4-7225-2c29-378139a5cced	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c4-7225-b11f-03da43806ef0	000d0000-55c4-7225-9022-28ecd4264f92	00100000-55c4-7225-c62c-d68111f41b3f	00090000-55c4-7225-2850-9ff8631ab4b6	\N	0010	t	\N	2015-08-07	\N	16	\N	\N	f	t
000c0000-55c4-7225-dab8-f1569cd3d535	000d0000-55c4-7225-9022-28ecd4264f92	00100000-55c4-7225-ff8f-bfb33a6f6c9e	00090000-55c4-7225-b9ef-8367091c86f3	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12411336)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12411248)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c4-7225-da1b-a0f292bc6894	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c4-7225-d7d3-c625fb2c401b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c4-7225-7182-17bcb1b3707d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12411596)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12411029)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c4-7225-076e-42c060924015	\N	\N	00200000-55c4-7225-92f5-237e85f5a241	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c4-7225-bb2a-9eb0c18c0a6a	\N	\N	00200000-55c4-7225-719d-a6d9f4f0b36c	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c4-7225-4e9c-0505c25ad00c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c4-7225-b0d5-e798547ce758	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c4-7225-37c1-59764fc05a15	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12411063)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12411498)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12410972)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c4-7223-5f05-751a3f2f1e4f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c4-7223-0164-105ef12433bf	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c4-7223-180a-a997b8e61d30	AL	ALB	008	Albania 	Albanija	\N
00040000-55c4-7223-b222-9902afe1bb90	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c4-7223-d93b-8d02035b56ac	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c4-7223-abe6-2d9aa21fe3c9	AD	AND	020	Andorra 	Andora	\N
00040000-55c4-7223-b6f6-9d2cab44816b	AO	AGO	024	Angola 	Angola	\N
00040000-55c4-7223-a9dd-3dd225670663	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c4-7223-ffdb-a23a8b329ebb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c4-7223-9681-db4891e5df6d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c4-7223-d090-bc5c1b9b30f8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c4-7223-ec6b-a9ef160fed32	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c4-7223-d3c7-6c009689f61f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c4-7223-0f3b-6521f22518bd	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c4-7223-8b3b-244bf7526657	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c4-7223-22f1-626bf2ee82be	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c4-7223-329f-4601ad6c8c2a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c4-7223-80d7-6b019876b05c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c4-7223-485d-3a449bfbc638	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c4-7223-0bfb-5e46c7945d8c	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c4-7223-4215-eef7fc864807	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c4-7223-9509-105658d639f3	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c4-7223-b994-6159917aa9f7	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c4-7223-77dd-65476603d44e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c4-7223-a2e3-206c2b4b2d84	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c4-7223-1807-a0231a3d5959	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c4-7223-1d99-38633e29a412	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c4-7223-7349-48b227bb1614	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c4-7223-f185-c7262bb552ed	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c4-7223-4903-1c588fb688af	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c4-7223-ea24-84c09543d48d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c4-7223-1b1d-503ac12cf488	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c4-7223-0796-69a6858dfb94	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c4-7223-9902-ec7ab27040de	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c4-7223-cf84-d25f5ded2770	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c4-7223-b401-affb259d21ac	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c4-7223-d6d6-29d7cf9ef85b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c4-7223-03fd-f26194696721	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c4-7223-e192-9bafe212d4a6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c4-7223-5070-cfb94d196a73	CA	CAN	124	Canada 	Kanada	\N
00040000-55c4-7223-fcf1-d1fbe462ced2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c4-7223-4613-371050ad5dc5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c4-7223-08a3-7802c93ef76b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c4-7223-33ed-3eb367e8b17f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c4-7223-5c09-bc775dc48333	CL	CHL	152	Chile 	Čile	\N
00040000-55c4-7223-e280-77772d5b8cea	CN	CHN	156	China 	Kitajska	\N
00040000-55c4-7223-c8a3-761bf442d720	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c4-7223-4723-bc56b28daa20	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c4-7223-8e0f-3d4e12072457	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c4-7223-0ff0-6980e0602f55	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c4-7223-7ae0-a9c559175888	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c4-7223-9476-a99d3f81fb92	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c4-7223-bc00-e76f76d96d6e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c4-7223-6d21-44046a1c698b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c4-7223-eaa1-a41187763397	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c4-7223-ca40-4debcde2d717	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c4-7223-789d-50284640db9e	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c4-7223-5bad-284d51153b17	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c4-7223-088f-efa0a16b58d6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c4-7223-e472-27fcf4155a07	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c4-7223-a7e1-0844686a76cb	DK	DNK	208	Denmark 	Danska	\N
00040000-55c4-7223-cf21-0508991fbad7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c4-7223-411e-9c57c408ddf6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c4-7223-b762-8ee0f14cb4ea	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c4-7223-c539-bf4498da9d0d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c4-7223-2a73-26efa4eef932	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c4-7223-09d9-0fc18af940bd	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c4-7223-3016-b3c57bc0901c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c4-7223-1490-de70884f59f1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c4-7223-1577-0b7e0a130295	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c4-7223-0fe0-1bd1cfbf7088	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c4-7223-6d92-d5272c0f43da	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c4-7223-1974-2f23b6bcf308	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c4-7223-d12d-465cb61c5978	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c4-7223-d74d-1347a08390b7	FI	FIN	246	Finland 	Finska	\N
00040000-55c4-7223-55e9-8120653eaa0c	FR	FRA	250	France 	Francija	\N
00040000-55c4-7223-1b22-381f7d5f827d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c4-7223-86c6-15c4a7b77d4a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c4-7223-7432-c1ce2b673115	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c4-7223-8d3d-74540ac92a01	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c4-7223-913a-30ef8f7dca29	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c4-7223-1c4f-e30ba4ae89b7	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c4-7223-2132-959bf9df2ffe	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c4-7223-ccdb-6544a8902638	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c4-7223-0280-fb468675015d	GH	GHA	288	Ghana 	Gana	\N
00040000-55c4-7223-220d-bebbafcf96e7	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c4-7223-4278-d84b652e12e1	GR	GRC	300	Greece 	Grčija	\N
00040000-55c4-7223-ca1c-e9f1e97c10b9	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c4-7223-2a6f-411ecc7e428f	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c4-7223-9fc0-cb1d96fda5be	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c4-7223-c198-e096252bde25	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c4-7223-373d-cc1657f22fb1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c4-7223-4b41-99f08c822532	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c4-7223-225c-05a98445331f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c4-7223-2cf3-cb80bb53c22d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c4-7223-2dda-9cf5961fddc6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c4-7223-79a2-943ce29e1c8d	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c4-7223-efe6-b437844f9e68	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c4-7223-aa63-41f72580e58e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c4-7223-7591-24693f6348d7	HN	HND	340	Honduras 	Honduras	\N
00040000-55c4-7223-f940-c4703d9b82a8	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c4-7223-09ab-fde1d77e2655	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c4-7223-cf44-736c3b604b9c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c4-7223-7ef4-fe4632ea4fd3	IN	IND	356	India 	Indija	\N
00040000-55c4-7223-a693-c0b848c892b6	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c4-7223-0e1c-b87ae94e2e10	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c4-7223-25d9-33e48754743e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c4-7223-e779-b487e89da792	IE	IRL	372	Ireland 	Irska	\N
00040000-55c4-7223-3895-d9528c1745a7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c4-7223-f326-ed35c7b2b484	IL	ISR	376	Israel 	Izrael	\N
00040000-55c4-7223-0cef-c88245fab894	IT	ITA	380	Italy 	Italija	\N
00040000-55c4-7223-8504-20ee2db031df	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c4-7223-1c36-a18a0e1d1115	JP	JPN	392	Japan 	Japonska	\N
00040000-55c4-7223-12e8-16cbae787b14	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c4-7223-14b9-bcc71b4c7f64	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c4-7223-d7e8-91114bc3e059	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c4-7223-5f46-44bfc044b82b	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c4-7223-9e4a-109c12b7cbc6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c4-7223-dae3-d0b2e433710e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c4-7223-2d05-f8eaef999e23	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c4-7223-9353-b0f86a7fc01d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c4-7223-1dcd-9f65161a5a7a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c4-7223-153b-48d36e52977e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c4-7223-2469-94e025d6cc19	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c4-7223-d07f-370a8b0b2ab7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c4-7223-c4bd-6bd21079ca5f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c4-7223-d846-6ca44ff34c38	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c4-7223-38b8-fcb0ce6eea63	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c4-7223-c755-b6d08f8a4af9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c4-7223-a53e-214d1417a15c	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c4-7223-7b70-dfe96c7f2741	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c4-7223-8ca5-2f0400f4b8df	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c4-7223-409a-1293372ac45f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c4-7223-c9ce-75b651ade2bb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c4-7223-fd00-d1c68b117c7b	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c4-7223-a8eb-ed6d141a7749	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c4-7223-8269-ba6a27b6c9de	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c4-7223-7392-3af8715c6678	ML	MLI	466	Mali 	Mali	\N
00040000-55c4-7223-1808-dfcfa5e67ac0	MT	MLT	470	Malta 	Malta	\N
00040000-55c4-7223-1ded-d4e88cfbed2b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c4-7223-953e-f31341c84717	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c4-7223-4795-63f9e0f78935	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c4-7223-d770-ea3dc9194fa3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c4-7223-b064-f8ca8a23a0ee	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c4-7223-f625-e512de509354	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c4-7223-58b4-e6bfe50e3947	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c4-7223-02e4-18b9dcd9653f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c4-7223-de58-94dcbdac16a8	MC	MCO	492	Monaco 	Monako	\N
00040000-55c4-7223-486c-6f03e9cc5641	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c4-7223-35f4-473a81f54371	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c4-7223-ed0a-c131b1e86f6b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c4-7223-d005-f5ef539a2cdd	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c4-7223-30a9-27a25f2d7470	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c4-7223-325b-ecbd35a4db80	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c4-7223-6262-f0445c61269b	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c4-7223-ca3e-05c92f11a98e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c4-7223-177c-438129589cac	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c4-7223-fe16-02e04c3773b8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c4-7223-917f-b67b63ca2074	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c4-7223-3723-23e1563426bd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c4-7223-f204-feaaaedc35ea	NE	NER	562	Niger 	Niger 	\N
00040000-55c4-7223-49f6-3021f9aa2c1b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c4-7223-bf0c-62d9e629f706	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c4-7223-0fa1-07262f0b17db	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c4-7223-5278-be261f717edd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c4-7223-9396-a08bd490f7b9	NO	NOR	578	Norway 	Norveška	\N
00040000-55c4-7223-0934-e77ce446fb6b	OM	OMN	512	Oman 	Oman	\N
00040000-55c4-7223-c636-6bacde11b08a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c4-7223-00ef-faff0c4b8159	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c4-7223-9956-3f22f8dcdff8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c4-7223-e28a-4dbbc740a14f	PA	PAN	591	Panama 	Panama	\N
00040000-55c4-7223-94c4-2d66e6d93851	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c4-7223-56de-83bbfb94c4a5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c4-7223-2ae8-cf0c81169e30	PE	PER	604	Peru 	Peru	\N
00040000-55c4-7223-db6a-22053859fde6	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c4-7223-9a87-9438828148dd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c4-7223-ebad-f3ad47f413f9	PL	POL	616	Poland 	Poljska	\N
00040000-55c4-7223-2cc2-b9580ce14110	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c4-7223-cf90-2e8116c0d6a4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c4-7223-2b5b-65b870108c15	QA	QAT	634	Qatar 	Katar	\N
00040000-55c4-7223-a86e-851a7e6b13a8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c4-7223-68b3-cb6b9653cae7	RO	ROU	642	Romania 	Romunija	\N
00040000-55c4-7223-de74-37b7ddbe4d08	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c4-7223-a5ec-3e87a5e4e9f3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c4-7223-6044-c7860b7aaed0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c4-7223-fd49-bf10b5865858	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c4-7223-23c0-9a1d7ccbcbbc	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c4-7223-dda2-8cde5542db76	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c4-7223-6ac6-e47ced74c68b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c4-7223-7099-85d58f090265	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c4-7223-499d-d82842375a14	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c4-7223-c53b-aa4a817c0b5c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c4-7223-9385-0360dd370c58	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c4-7223-9be0-b8a583d431ca	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c4-7223-6717-bd40092f7fa3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c4-7223-a0eb-2f9f9ead9833	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c4-7223-af23-33f3f556a80f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c4-7223-2aae-91c74fe775e7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c4-7223-45fa-ccc05fd82362	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c4-7223-59c4-6a677fc5663c	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c4-7223-968f-2fc30cac54c0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c4-7223-af10-baa161534c8e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c4-7223-231f-69c63ab1997c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c4-7223-211d-c0d8fefba008	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c4-7223-ff00-acaa4dc1c7f3	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c4-7223-29f0-068d34770e61	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c4-7223-51da-c03f17e6ce1b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c4-7223-5934-44dc7b62f86c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c4-7223-4d55-3645e92194fc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c4-7223-9c96-6b6c153578d4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c4-7223-a821-dac17ca83836	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c4-7223-9d25-02d40dbfeaa7	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c4-7223-aa6a-5c135b28cf33	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c4-7223-e4c2-1f76caf79e87	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c4-7223-ea44-cb1dd299498e	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c4-7223-8a41-0e69a2e04af2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c4-7223-429c-f3d828c5ff39	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c4-7223-e233-41619743e927	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c4-7223-8a61-95a39e54902a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c4-7223-16dd-ed48f2b22b76	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c4-7223-11a1-86811577c248	TH	THA	764	Thailand 	Tajska	\N
00040000-55c4-7223-78ec-f3c4151a804b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c4-7223-5d89-8368fbad1766	TG	TGO	768	Togo 	Togo	\N
00040000-55c4-7223-722d-74fe37d7a001	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c4-7223-1dc3-28f129b17833	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c4-7223-fb6a-76124421007a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c4-7223-aa99-5d75c2714677	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c4-7223-e1ea-31ba65f62db3	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c4-7223-28f4-9781a697ada1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c4-7223-c03e-7e92949ab340	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c4-7223-8fd3-9eb68bc86a69	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c4-7223-b54e-9e0d7e83697a	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c4-7223-ed2c-167302ce13cb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c4-7223-6c4f-8e991cd9c471	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c4-7223-8f45-004dc73dbbbd	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c4-7223-37b3-677104c8a924	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c4-7223-bd45-ba1c9657c27e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c4-7223-23fe-84725a1c4763	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c4-7223-1319-e2e9736f0b61	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c4-7223-2271-ff17f16a41d0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c4-7223-a562-49ceff3e625a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c4-7223-f321-e67d0552addf	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c4-7223-98c0-41b2ce74cfa0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c4-7223-b9ec-cc6e241414d6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c4-7223-4d17-f0cf790f9f14	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c4-7223-029d-30d4cc9d2f70	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c4-7223-8cb7-0df455b3faa7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c4-7223-8da8-ca0a3557928a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c4-7223-bb36-b8a76b61709f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12411366)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55c4-7225-33fe-618f72a103d6	000e0000-55c4-7225-1cc7-d0d324c7a145	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c4-7224-ff7e-d7a28524872a	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c4-7225-9f4f-b631defa5ca9	000e0000-55c4-7225-e4c0-47c25736df4a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c4-7224-5554-a7b91711f2bf	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c4-7225-a1fd-7ecff5a00470	000e0000-55c4-7225-3a42-5918847a0d74	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c4-7224-ff7e-d7a28524872a	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c4-7225-9dc2-c36925ed896a	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c4-7225-12ea-d3dff4180b08	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12411193)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c4-7225-9022-28ecd4264f92	000e0000-55c4-7225-e4c0-47c25736df4a	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c4-7224-318b-b1cde25c0cfa
000d0000-55c4-7225-29f5-292f6c3b1511	000e0000-55c4-7225-e4c0-47c25736df4a	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c4-7224-318b-b1cde25c0cfa
000d0000-55c4-7225-645a-f7265f5d40e7	000e0000-55c4-7225-e4c0-47c25736df4a	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c4-7224-6397-2c6c85f09d6b
000d0000-55c4-7225-4107-3e51fb82e868	000e0000-55c4-7225-e4c0-47c25736df4a	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c4-7224-6f50-980aa04d4d61
000d0000-55c4-7225-9540-90d3a7f9567f	000e0000-55c4-7225-e4c0-47c25736df4a	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c4-7224-5384-26c552654843
000d0000-55c4-7225-f287-45199d6ccdd7	000e0000-55c4-7225-e4c0-47c25736df4a	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c4-7224-5f2d-7b69abf1eaa3
000d0000-55c4-7225-a79c-580054eba765	000e0000-55c4-7225-e4c0-47c25736df4a	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c4-7224-318b-b1cde25c0cfa
000d0000-55c4-7225-0f54-4b8a4f7bbd0c	000e0000-55c4-7225-e4c0-47c25736df4a	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c4-7224-b192-8550bec921de
\.


--
-- TOC entry 3010 (class 0 OID 12411009)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12411057)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12410989)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c4-7225-248f-8020b5de109e	00080000-55c4-7225-0eca-d55539e82207	00090000-55c4-7225-2850-9ff8631ab4b6	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12411110)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12411577)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12411589)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12411612)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12411135)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12410946)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c4-7224-4609-6f20262821e4	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c4-7224-b924-de44e89251d1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c4-7224-c7ea-915f3c266303	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c4-7224-1ea1-c04126d2a587	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c4-7224-1c17-bdb87b6eaddc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c4-7224-275a-2b5092858dfa	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c4-7224-2fae-d7a9e2bfabcb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c4-7224-8e39-9d491458cefc	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c4-7224-ca09-1a8a229c589c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c4-7224-2362-5b3d55df9a20	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c4-7224-30bb-14cefeeee793	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c4-7224-4ba8-5c8d86ea592b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c4-7224-3de5-d5474902bf8f	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c4-7224-2104-5303401be3e2	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c4-7225-28e0-1803c4cfd6cb	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c4-7225-4a21-8fdfc57bb0da	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c4-7225-ff6b-5f57d486caf1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c4-7225-2b60-ea2521c14e7d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c4-7225-f0d6-cc46118c9285	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c4-7225-641b-f123c1c46086	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12410859)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c4-7225-e954-d184df19ea7d	00000000-55c4-7225-4a21-8fdfc57bb0da	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c4-7225-7377-8ef5001aea75	00000000-55c4-7225-4a21-8fdfc57bb0da	00010000-55c4-7224-906e-3ae3019c8b16	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c4-7225-0b1e-fedd91be5502	00000000-55c4-7225-ff6b-5f57d486caf1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12410870)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c4-7225-e3d0-a79168f15691	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c4-7225-8b8d-31b9fd0dcef2	00010000-55c4-7225-86d3-0ef244a1ad81	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c4-7225-29ee-e36908727d1d	00010000-55c4-7225-d140-ef0b25ac47fe	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c4-7225-2c29-378139a5cced	00010000-55c4-7225-855b-8144c5a79349	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c4-7225-985f-83f32cc4fe0d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c4-7225-944c-7ff16b87a211	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c4-7225-b9ef-8367091c86f3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c4-7225-ad4c-d9c0d6eb53d7	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c4-7225-2850-9ff8631ab4b6	00010000-55c4-7225-191f-ce231aa9f122	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c4-7225-b106-bfebcf48830b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c4-7225-8494-aca6ca376c4c	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c4-7225-ea0b-517a2a03eb97	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c4-7225-e165-378ece2ce66b	00010000-55c4-7225-0f2b-6050463b5250	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12410824)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c4-7223-9e5a-d0c7b5fc9389	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c4-7223-031f-b6aff9a2a69b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c4-7223-0561-412d73b08f6a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c4-7223-7c5c-f6b21e961d6d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c4-7223-ca33-b6d9ee16824a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c4-7223-9a7a-41812fde6162	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c4-7223-69cc-d8c76fb12efe	Abonma-read	Abonma - branje	f
00030000-55c4-7223-cc3c-579064048efb	Abonma-write	Abonma - spreminjanje	f
00030000-55c4-7223-35aa-abec20a5cfd7	Alternacija-read	Alternacija - branje	f
00030000-55c4-7223-af5d-453bc08c978c	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c4-7223-0304-e1902f166a80	Arhivalija-read	Arhivalija - branje	f
00030000-55c4-7223-7063-b3ff71a6eb46	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c4-7223-e7da-ad1cd7bf6476	Besedilo-read	Besedilo - branje	f
00030000-55c4-7223-ba75-48e980e04ccf	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c4-7223-abda-851bf1216cfc	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c4-7223-e60b-484777492e84	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c4-7223-b0d7-e8f2a2ac9912	Dogodek-read	Dogodek - branje	f
00030000-55c4-7223-bc0b-aada640cd0bf	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c4-7223-4b0e-579f5e5a3735	DrugiVir-read	DrugiVir - branje	f
00030000-55c4-7223-e8fe-14784f709277	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c4-7223-6fc0-7dc3f1fc64ef	Drzava-read	Drzava - branje	f
00030000-55c4-7223-4dcb-142785c7dce6	Drzava-write	Drzava - spreminjanje	f
00030000-55c4-7224-1ab9-49ce8cf65ac6	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c4-7224-4ab1-9a003a4ba2f6	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c4-7224-891e-adba0094b5f7	Funkcija-read	Funkcija - branje	f
00030000-55c4-7224-b935-acf8bcd5db42	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c4-7224-95b2-113218ef6aee	Gostovanje-read	Gostovanje - branje	f
00030000-55c4-7224-0019-c9c09791fcf4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c4-7224-2f86-a19700b3f6e7	Gostujoca-read	Gostujoca - branje	f
00030000-55c4-7224-4650-a35d344a4f00	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c4-7224-40d9-4624a4c3f647	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c4-7224-84c5-902e1908053f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c4-7224-cfbe-c9a9ba03bc62	Kupec-read	Kupec - branje	f
00030000-55c4-7224-be65-2f2fe2ff69a2	Kupec-write	Kupec - spreminjanje	f
00030000-55c4-7224-a54d-73be9afcd632	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c4-7224-1ec7-5d3ec0f0ace5	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c4-7224-70b9-a3b72ed357da	Option-read	Option - branje	f
00030000-55c4-7224-ec03-3a4f13752bd3	Option-write	Option - spreminjanje	f
00030000-55c4-7224-d302-48b698aeeff8	OptionValue-read	OptionValue - branje	f
00030000-55c4-7224-7d04-2315b99e3d9e	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c4-7224-bbe3-7f9545b26a58	Oseba-read	Oseba - branje	f
00030000-55c4-7224-89a9-5af2e0ad2107	Oseba-write	Oseba - spreminjanje	f
00030000-55c4-7224-ee0e-5ddedc5ba888	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c4-7224-0c87-ecc9c0a21f2a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c4-7224-ecd7-ad74af582222	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c4-7224-8493-9840fd5d96f7	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c4-7224-af2d-6b307f9ec4c3	Pogodba-read	Pogodba - branje	f
00030000-55c4-7224-8843-deba7b8cdd2c	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c4-7224-7a7a-758ce7a0df3e	Popa-read	Popa - branje	f
00030000-55c4-7224-9332-fe0ef187c01a	Popa-write	Popa - spreminjanje	f
00030000-55c4-7224-f90c-98ee0f3ef5eb	Posta-read	Posta - branje	f
00030000-55c4-7224-8e67-09c706a28642	Posta-write	Posta - spreminjanje	f
00030000-55c4-7224-914c-207011e6bfc3	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c4-7224-e712-1d8f3a7b0a9d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c4-7224-c957-fae8b54dd802	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c4-7224-ba9d-e585eebdc171	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c4-7224-5f33-cc82394749c4	Predstava-read	Predstava - branje	f
00030000-55c4-7224-3637-830c4b4d4735	Predstava-write	Predstava - spreminjanje	f
00030000-55c4-7224-d578-9119db1ec19e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c4-7224-3e4b-8398cdf8f2a1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c4-7224-f0fd-a5f40d89eb44	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c4-7224-4e95-870cdab4950e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c4-7224-23c2-f5c5671c1db6	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c4-7224-e45f-7c3527733c20	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c4-7224-ac3f-fdd74a3c01e6	ProgramDela-read	ProgramDela - branje	f
00030000-55c4-7224-c6c4-3023ff070fa7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c4-7224-ae5c-83218fc747b3	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c4-7224-456a-4b5436423912	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c4-7224-3211-7172fc3a9ae0	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c4-7224-0a75-835d696566d4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c4-7224-716b-498182096f30	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c4-7224-d146-478694674757	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c4-7224-455b-a31e0e7a79c0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c4-7224-25db-01ce61f0881f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c4-7224-3a8a-f2134d6d0e9d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c4-7224-0299-85beb980b245	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c4-7224-19a7-f739afc89d62	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c4-7224-6d90-ef8eef20cd25	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c4-7224-cc0b-b5bcf6a038d3	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c4-7224-8d90-a2d32f006f98	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c4-7224-f026-d5f1d3519143	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c4-7224-e802-185313bfb5ae	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c4-7224-a0ef-6be18172dfc1	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c4-7224-87d8-bc7e6d2b88a0	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c4-7224-2413-07f1f79fa59b	Prostor-read	Prostor - branje	f
00030000-55c4-7224-dc65-598b35668ae4	Prostor-write	Prostor - spreminjanje	f
00030000-55c4-7224-fd90-9c14df9e9d6c	Racun-read	Racun - branje	f
00030000-55c4-7224-d609-cf87c7486008	Racun-write	Racun - spreminjanje	f
00030000-55c4-7224-56f5-72c721dfaaeb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c4-7224-5039-ee204e9e6b8a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c4-7224-8880-d4b029c44919	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c4-7224-3725-1d81783750b4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c4-7224-3dee-862bc4fd3850	Rekvizit-read	Rekvizit - branje	f
00030000-55c4-7224-a757-15919712e687	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c4-7224-2d63-d43d412a9192	Revizija-read	Revizija - branje	f
00030000-55c4-7224-8a8c-46402ad131e0	Revizija-write	Revizija - spreminjanje	f
00030000-55c4-7224-6205-9cdc2f8939af	Rezervacija-read	Rezervacija - branje	f
00030000-55c4-7224-2c7a-033836013ded	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c4-7224-a2b8-d4665b09d7f2	SedezniRed-read	SedezniRed - branje	f
00030000-55c4-7224-c844-e07228cdb95a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c4-7224-4026-7dd2a725abff	Sedez-read	Sedez - branje	f
00030000-55c4-7224-71ea-1213b470927f	Sedez-write	Sedez - spreminjanje	f
00030000-55c4-7224-cd73-825153e2a702	Sezona-read	Sezona - branje	f
00030000-55c4-7224-f435-261db3de8510	Sezona-write	Sezona - spreminjanje	f
00030000-55c4-7224-de7c-d2347a98f40e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c4-7224-f001-e2c9a1f9864a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c4-7224-06a3-cc6f8011397f	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c4-7224-0d57-93d8e8f5e4e2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c4-7224-73af-896607a46170	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c4-7224-4fde-67600a416937	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c4-7224-aaaa-b31abbb1a37e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c4-7224-1615-2d1ac53484e0	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c4-7224-35e8-4058a554f627	Telefonska-read	Telefonska - branje	f
00030000-55c4-7224-f0d2-5ae62a589fe8	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c4-7224-03a9-2a827bd74988	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c4-7224-232c-4834094ede78	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c4-7224-a811-cbd6fd698e5b	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c4-7224-634d-2ff23eb36335	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c4-7224-c0a0-43e205b91642	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c4-7224-6407-41a52def8041	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c4-7224-a185-15fa31c3b368	Trr-read	Trr - branje	f
00030000-55c4-7224-417f-089c2ec867a5	Trr-write	Trr - spreminjanje	f
00030000-55c4-7224-9fcf-764b24704059	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c4-7224-9096-37b899978319	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c4-7224-3d13-0c7c13622c65	Vaja-read	Vaja - branje	f
00030000-55c4-7224-e5e8-69696fb28f17	Vaja-write	Vaja - spreminjanje	f
00030000-55c4-7224-408a-774251cf60ef	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c4-7224-df72-853cf965418e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c4-7224-f2fc-df652c171da7	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c4-7224-1ada-fca03640607b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c4-7224-aa62-fd94d450ea13	Zasedenost-read	Zasedenost - branje	f
00030000-55c4-7224-e70e-6610efcac71e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c4-7224-b897-333ea0868860	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c4-7224-0bff-612c056c0e66	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c4-7224-df78-13efa27809c3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c4-7224-2dc2-8a927687bca4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c4-7224-e3f8-9a6f1e7fd3b0	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c4-7224-76c4-66fca783e72f	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c4-7224-5bd0-d7212819e474	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c4-7224-680a-863675ae26fb	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c4-7224-e5c8-d81c7e081780	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c4-7224-db02-811c75ba9c9b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c4-7224-1825-d8fc81b13741	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c4-7224-a7f8-4151fab7fd55	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c4-7224-f35e-b13f7858475e	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c4-7224-2f12-350b4242b44f	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c4-7224-ebc4-a92cca78daf7	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c4-7224-f81c-1def03e653d9	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 12410843)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c4-7224-8170-da0dd27b29e9	00030000-55c4-7223-031f-b6aff9a2a69b
00020000-55c4-7224-60a9-8860cbb58c2d	00030000-55c4-7223-6fc0-7dc3f1fc64ef
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-69cc-d8c76fb12efe
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-cc3c-579064048efb
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-35aa-abec20a5cfd7
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-af5d-453bc08c978c
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-0304-e1902f166a80
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-b0d7-e8f2a2ac9912
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-7c5c-f6b21e961d6d
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-bc0b-aada640cd0bf
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-6fc0-7dc3f1fc64ef
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7223-4dcb-142785c7dce6
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-891e-adba0094b5f7
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-b935-acf8bcd5db42
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-95b2-113218ef6aee
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-0019-c9c09791fcf4
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-2f86-a19700b3f6e7
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-4650-a35d344a4f00
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-40d9-4624a4c3f647
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-84c5-902e1908053f
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-70b9-a3b72ed357da
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-d302-48b698aeeff8
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-bbe3-7f9545b26a58
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-89a9-5af2e0ad2107
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-7a7a-758ce7a0df3e
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-9332-fe0ef187c01a
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-f90c-98ee0f3ef5eb
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-8e67-09c706a28642
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-c957-fae8b54dd802
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-ba9d-e585eebdc171
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-5f33-cc82394749c4
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-3637-830c4b4d4735
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-23c2-f5c5671c1db6
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-e45f-7c3527733c20
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-2413-07f1f79fa59b
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-dc65-598b35668ae4
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-8880-d4b029c44919
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-3725-1d81783750b4
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-3dee-862bc4fd3850
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-a757-15919712e687
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-cd73-825153e2a702
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-f435-261db3de8510
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-a811-cbd6fd698e5b
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-9fcf-764b24704059
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-9096-37b899978319
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-3d13-0c7c13622c65
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-e5e8-69696fb28f17
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-aa62-fd94d450ea13
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-e70e-6610efcac71e
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-b897-333ea0868860
00020000-55c4-7224-9044-d7eebfb858a0	00030000-55c4-7224-df78-13efa27809c3
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7223-69cc-d8c76fb12efe
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7223-0304-e1902f166a80
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7223-b0d7-e8f2a2ac9912
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7223-6fc0-7dc3f1fc64ef
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-95b2-113218ef6aee
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-2f86-a19700b3f6e7
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-40d9-4624a4c3f647
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-84c5-902e1908053f
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-70b9-a3b72ed357da
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-d302-48b698aeeff8
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-bbe3-7f9545b26a58
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-89a9-5af2e0ad2107
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-7a7a-758ce7a0df3e
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-f90c-98ee0f3ef5eb
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-c957-fae8b54dd802
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-ba9d-e585eebdc171
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-5f33-cc82394749c4
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-2413-07f1f79fa59b
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-8880-d4b029c44919
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-3dee-862bc4fd3850
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-cd73-825153e2a702
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-35e8-4058a554f627
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-f0d2-5ae62a589fe8
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-a185-15fa31c3b368
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-417f-089c2ec867a5
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-f2fc-df652c171da7
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-1ada-fca03640607b
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-b897-333ea0868860
00020000-55c4-7224-f10d-3b49b19055e3	00030000-55c4-7224-df78-13efa27809c3
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7223-69cc-d8c76fb12efe
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7223-35aa-abec20a5cfd7
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7223-0304-e1902f166a80
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7223-7063-b3ff71a6eb46
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7223-e7da-ad1cd7bf6476
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7223-abda-851bf1216cfc
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7223-b0d7-e8f2a2ac9912
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7223-6fc0-7dc3f1fc64ef
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-891e-adba0094b5f7
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-95b2-113218ef6aee
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-2f86-a19700b3f6e7
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-40d9-4624a4c3f647
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-70b9-a3b72ed357da
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-d302-48b698aeeff8
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-bbe3-7f9545b26a58
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-7a7a-758ce7a0df3e
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-f90c-98ee0f3ef5eb
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-5f33-cc82394749c4
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-23c2-f5c5671c1db6
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-2413-07f1f79fa59b
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-8880-d4b029c44919
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-3dee-862bc4fd3850
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-cd73-825153e2a702
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-a811-cbd6fd698e5b
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-3d13-0c7c13622c65
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-aa62-fd94d450ea13
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-b897-333ea0868860
00020000-55c4-7224-93d5-d5795e7a4db7	00030000-55c4-7224-df78-13efa27809c3
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7223-69cc-d8c76fb12efe
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7223-cc3c-579064048efb
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7223-af5d-453bc08c978c
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7223-0304-e1902f166a80
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7223-b0d7-e8f2a2ac9912
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7223-6fc0-7dc3f1fc64ef
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-95b2-113218ef6aee
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-2f86-a19700b3f6e7
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-70b9-a3b72ed357da
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-d302-48b698aeeff8
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-7a7a-758ce7a0df3e
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-f90c-98ee0f3ef5eb
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-5f33-cc82394749c4
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-2413-07f1f79fa59b
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-8880-d4b029c44919
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-3dee-862bc4fd3850
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-cd73-825153e2a702
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-a811-cbd6fd698e5b
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-b897-333ea0868860
00020000-55c4-7224-bf70-f1994f324d14	00030000-55c4-7224-df78-13efa27809c3
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7223-69cc-d8c76fb12efe
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7223-0304-e1902f166a80
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7223-b0d7-e8f2a2ac9912
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7223-6fc0-7dc3f1fc64ef
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-95b2-113218ef6aee
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-2f86-a19700b3f6e7
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-70b9-a3b72ed357da
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-d302-48b698aeeff8
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-7a7a-758ce7a0df3e
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-f90c-98ee0f3ef5eb
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-5f33-cc82394749c4
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-2413-07f1f79fa59b
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-8880-d4b029c44919
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-3dee-862bc4fd3850
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-cd73-825153e2a702
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-03a9-2a827bd74988
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7223-0561-412d73b08f6a
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-a811-cbd6fd698e5b
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-b897-333ea0868860
00020000-55c4-7224-5631-a2ba662ac9e5	00030000-55c4-7224-df78-13efa27809c3
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-9e5a-d0c7b5fc9389
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-031f-b6aff9a2a69b
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-0561-412d73b08f6a
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-7c5c-f6b21e961d6d
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-ca33-b6d9ee16824a
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-9a7a-41812fde6162
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-69cc-d8c76fb12efe
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-cc3c-579064048efb
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-35aa-abec20a5cfd7
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-af5d-453bc08c978c
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-0304-e1902f166a80
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-7063-b3ff71a6eb46
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-e7da-ad1cd7bf6476
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-ba75-48e980e04ccf
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-abda-851bf1216cfc
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-e60b-484777492e84
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-b0d7-e8f2a2ac9912
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-bc0b-aada640cd0bf
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-6fc0-7dc3f1fc64ef
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-4dcb-142785c7dce6
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-4b0e-579f5e5a3735
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7223-e8fe-14784f709277
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-1ab9-49ce8cf65ac6
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-4ab1-9a003a4ba2f6
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-891e-adba0094b5f7
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-b935-acf8bcd5db42
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-95b2-113218ef6aee
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-0019-c9c09791fcf4
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-2f86-a19700b3f6e7
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-4650-a35d344a4f00
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-40d9-4624a4c3f647
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-84c5-902e1908053f
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-cfbe-c9a9ba03bc62
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-be65-2f2fe2ff69a2
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-a54d-73be9afcd632
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-1ec7-5d3ec0f0ace5
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-70b9-a3b72ed357da
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-ec03-3a4f13752bd3
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-d302-48b698aeeff8
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-7d04-2315b99e3d9e
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-bbe3-7f9545b26a58
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-89a9-5af2e0ad2107
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-ee0e-5ddedc5ba888
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-0c87-ecc9c0a21f2a
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-ecd7-ad74af582222
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-8493-9840fd5d96f7
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-af2d-6b307f9ec4c3
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-8843-deba7b8cdd2c
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-7a7a-758ce7a0df3e
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-9332-fe0ef187c01a
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-f90c-98ee0f3ef5eb
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-8e67-09c706a28642
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-914c-207011e6bfc3
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-e712-1d8f3a7b0a9d
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-c957-fae8b54dd802
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-ba9d-e585eebdc171
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-5f33-cc82394749c4
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-3637-830c4b4d4735
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-d578-9119db1ec19e
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-3e4b-8398cdf8f2a1
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-f0fd-a5f40d89eb44
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-4e95-870cdab4950e
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-23c2-f5c5671c1db6
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-e45f-7c3527733c20
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-ac3f-fdd74a3c01e6
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-c6c4-3023ff070fa7
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-ae5c-83218fc747b3
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-456a-4b5436423912
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-3211-7172fc3a9ae0
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-0a75-835d696566d4
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-716b-498182096f30
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-d146-478694674757
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-455b-a31e0e7a79c0
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-25db-01ce61f0881f
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-3a8a-f2134d6d0e9d
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-0299-85beb980b245
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-19a7-f739afc89d62
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-6d90-ef8eef20cd25
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-cc0b-b5bcf6a038d3
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-8d90-a2d32f006f98
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-f026-d5f1d3519143
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-e802-185313bfb5ae
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-a0ef-6be18172dfc1
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-87d8-bc7e6d2b88a0
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-2413-07f1f79fa59b
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-dc65-598b35668ae4
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-fd90-9c14df9e9d6c
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-d609-cf87c7486008
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-56f5-72c721dfaaeb
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-5039-ee204e9e6b8a
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-8880-d4b029c44919
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-3725-1d81783750b4
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-3dee-862bc4fd3850
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-a757-15919712e687
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-2d63-d43d412a9192
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-8a8c-46402ad131e0
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-6205-9cdc2f8939af
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-2c7a-033836013ded
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-a2b8-d4665b09d7f2
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-c844-e07228cdb95a
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-4026-7dd2a725abff
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-71ea-1213b470927f
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-cd73-825153e2a702
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-f435-261db3de8510
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-de7c-d2347a98f40e
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-f001-e2c9a1f9864a
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-06a3-cc6f8011397f
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-0d57-93d8e8f5e4e2
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-73af-896607a46170
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-4fde-67600a416937
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-aaaa-b31abbb1a37e
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-1615-2d1ac53484e0
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-35e8-4058a554f627
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-f0d2-5ae62a589fe8
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-03a9-2a827bd74988
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-232c-4834094ede78
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-a811-cbd6fd698e5b
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-634d-2ff23eb36335
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-c0a0-43e205b91642
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-6407-41a52def8041
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-a185-15fa31c3b368
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-417f-089c2ec867a5
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-9fcf-764b24704059
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-9096-37b899978319
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-3d13-0c7c13622c65
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-e5e8-69696fb28f17
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-408a-774251cf60ef
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-df72-853cf965418e
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-f2fc-df652c171da7
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-1ada-fca03640607b
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-aa62-fd94d450ea13
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-e70e-6610efcac71e
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-b897-333ea0868860
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-0bff-612c056c0e66
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-df78-13efa27809c3
00020000-55c4-7225-041f-f77ae7dacffd	00030000-55c4-7224-2dc2-8a927687bca4
\.


--
-- TOC entry 3025 (class 0 OID 12411142)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12411173)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12411287)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c4-7225-fc5d-c991bb8e17ec	00090000-55c4-7225-e3d0-a79168f15691	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c4-7225-4338-503984cde364	00090000-55c4-7225-944c-7ff16b87a211	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c4-7225-c84d-3352f145d5c2	00090000-55c4-7225-e165-378ece2ce66b	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12410903)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c4-7225-0eca-d55539e82207	00040000-55c4-7223-231f-69c63ab1997c	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-7225-a499-175ead784356	00040000-55c4-7223-231f-69c63ab1997c	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c4-7225-6ab7-6cd8ea64a08f	00040000-55c4-7223-231f-69c63ab1997c	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-7225-99f0-fb76f5a45d9f	00040000-55c4-7223-231f-69c63ab1997c	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-7225-c8f0-05df269a30da	00040000-55c4-7223-231f-69c63ab1997c	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-7225-654a-f6cec8770523	00040000-55c4-7223-d090-bc5c1b9b30f8	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-7225-0234-f676c0ca5fc8	00040000-55c4-7223-ca40-4debcde2d717	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-7225-e190-5c029af562c5	00040000-55c4-7223-8b3b-244bf7526657	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c4-7225-05f8-7e540509dfaa	00040000-55c4-7223-231f-69c63ab1997c	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12410938)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c4-7224-177a-2777fec83743	8341	Adlešiči
00050000-55c4-7224-8cc5-7807ab92a7ac	5270	Ajdovščina
00050000-55c4-7224-b964-f2957cbc6033	6280	Ankaran/Ancarano
00050000-55c4-7224-9cab-25b80941ad98	9253	Apače
00050000-55c4-7224-2515-293c79788664	8253	Artiče
00050000-55c4-7224-71cc-0a4e1f980b12	4275	Begunje na Gorenjskem
00050000-55c4-7224-53b5-4d87e8d89e10	1382	Begunje pri Cerknici
00050000-55c4-7224-bb1e-db3d2b837179	9231	Beltinci
00050000-55c4-7224-8e4e-ae38d821920a	2234	Benedikt
00050000-55c4-7224-4825-14b94e5d00da	2345	Bistrica ob Dravi
00050000-55c4-7224-45db-4215baf4a4d1	3256	Bistrica ob Sotli
00050000-55c4-7224-9595-adbcbf214f18	8259	Bizeljsko
00050000-55c4-7224-5c68-55b24096ef9b	1223	Blagovica
00050000-55c4-7224-89f7-3eb161f683fc	8283	Blanca
00050000-55c4-7224-ae2e-736549a6e6ed	4260	Bled
00050000-55c4-7224-f032-e42661a12ff3	4273	Blejska Dobrava
00050000-55c4-7224-269d-f7b1c2b6eab1	9265	Bodonci
00050000-55c4-7224-58cf-1882c1f76b14	9222	Bogojina
00050000-55c4-7224-203a-5896702f31fe	4263	Bohinjska Bela
00050000-55c4-7224-1e26-55be058331ca	4264	Bohinjska Bistrica
00050000-55c4-7224-dc4f-c7f53f1b0e69	4265	Bohinjsko jezero
00050000-55c4-7224-108e-5eb37ec55175	1353	Borovnica
00050000-55c4-7224-bfc2-0793d98e4711	8294	Boštanj
00050000-55c4-7224-1d6b-cb94910feaaa	5230	Bovec
00050000-55c4-7224-1575-6ddbcf0f928c	5295	Branik
00050000-55c4-7224-2eb8-3b6230e84990	3314	Braslovče
00050000-55c4-7224-027b-59f3df7e42a0	5223	Breginj
00050000-55c4-7224-c69b-64cb0345c55f	8280	Brestanica
00050000-55c4-7224-fcda-0be8173c6b89	2354	Bresternica
00050000-55c4-7224-7fc1-7ec6f96750eb	4243	Brezje
00050000-55c4-7224-5e8a-eac54a427680	1351	Brezovica pri Ljubljani
00050000-55c4-7224-c41e-de726c4263e5	8250	Brežice
00050000-55c4-7224-07a4-3d953efb2273	4210	Brnik - Aerodrom
00050000-55c4-7224-0941-850a880847e9	8321	Brusnice
00050000-55c4-7224-5d9f-25f91a0ec7d6	3255	Buče
00050000-55c4-7224-86c6-9f5b63929bf7	8276	Bučka 
00050000-55c4-7224-78a3-c305b728d75a	9261	Cankova
00050000-55c4-7224-acb3-64b2fb0da231	3000	Celje 
00050000-55c4-7224-58d5-34d25fb74389	3001	Celje - poštni predali
00050000-55c4-7224-3a12-b7aac3ddeeb4	4207	Cerklje na Gorenjskem
00050000-55c4-7224-1130-4c45f331bdcf	8263	Cerklje ob Krki
00050000-55c4-7224-6701-07b24b032f1a	1380	Cerknica
00050000-55c4-7224-212f-64b43018cfb7	5282	Cerkno
00050000-55c4-7224-d4cf-ee865eeb5776	2236	Cerkvenjak
00050000-55c4-7224-6285-c3e9b9bd5aae	2215	Ceršak
00050000-55c4-7224-c717-f52d7587e104	2326	Cirkovce
00050000-55c4-7224-2b30-c377303a7138	2282	Cirkulane
00050000-55c4-7224-c7d1-a5755d98ebd0	5273	Col
00050000-55c4-7224-a439-0ac30a69fed2	8251	Čatež ob Savi
00050000-55c4-7224-b951-5bb33a2e9dc3	1413	Čemšenik
00050000-55c4-7224-1ad6-bf4f963b0626	5253	Čepovan
00050000-55c4-7224-ede4-2851ec7a2ac0	9232	Črenšovci
00050000-55c4-7224-51aa-5359eaf783b4	2393	Črna na Koroškem
00050000-55c4-7224-1ffe-51e32b66e0a0	6275	Črni Kal
00050000-55c4-7224-e85e-ff3a86e26485	5274	Črni Vrh nad Idrijo
00050000-55c4-7224-ab9e-6a53a8b39c00	5262	Črniče
00050000-55c4-7224-5442-c31f94842496	8340	Črnomelj
00050000-55c4-7224-e1b0-137ec8931bcb	6271	Dekani
00050000-55c4-7224-6d1a-890718339f62	5210	Deskle
00050000-55c4-7224-d246-01ef65b4f38c	2253	Destrnik
00050000-55c4-7224-769c-9c6fabb9a93f	6215	Divača
00050000-55c4-7224-d314-2aeec3dba4ce	1233	Dob
00050000-55c4-7224-67ee-2fb3fa9c9b1c	3224	Dobje pri Planini
00050000-55c4-7224-b499-743af434799e	8257	Dobova
00050000-55c4-7224-1d6e-c8792d55f7a2	1423	Dobovec
00050000-55c4-7224-32e4-95573e426609	5263	Dobravlje
00050000-55c4-7224-d20e-a70aed6b50f4	3204	Dobrna
00050000-55c4-7224-52c1-9addbdf95203	8211	Dobrnič
00050000-55c4-7224-6658-fed0c407a2e6	1356	Dobrova
00050000-55c4-7224-cd04-9114201f5535	9223	Dobrovnik/Dobronak 
00050000-55c4-7224-81f9-f07e3b32b60a	5212	Dobrovo v Brdih
00050000-55c4-7224-9c8f-1e9d5547374c	1431	Dol pri Hrastniku
00050000-55c4-7224-b5df-605e75bcb7cd	1262	Dol pri Ljubljani
00050000-55c4-7224-c01f-3b17d07884aa	1273	Dole pri Litiji
00050000-55c4-7224-89fa-20a409edf294	1331	Dolenja vas
00050000-55c4-7224-895e-265cfdf3cd31	8350	Dolenjske Toplice
00050000-55c4-7224-ce0c-8f62dda14fc7	1230	Domžale
00050000-55c4-7224-8105-1baa88cb5c50	2252	Dornava
00050000-55c4-7224-59e8-cd5f1de9566c	5294	Dornberk
00050000-55c4-7224-b4c5-a314507d2050	1319	Draga
00050000-55c4-7224-2f39-7a8eeeb2b13f	8343	Dragatuš
00050000-55c4-7224-e9a8-0b724c6de7d7	3222	Dramlje
00050000-55c4-7224-ac80-3f5a3d2ee986	2370	Dravograd
00050000-55c4-7224-81fb-bbcd983cad10	4203	Duplje
00050000-55c4-7224-adba-7aac5b509bba	6221	Dutovlje
00050000-55c4-7224-8167-0ea273365291	8361	Dvor
00050000-55c4-7224-8570-3e858622ae66	2343	Fala
00050000-55c4-7224-09bf-6ca0e1cb9daa	9208	Fokovci
00050000-55c4-7224-71ee-9cf8cbac4d78	2313	Fram
00050000-55c4-7224-972a-7b16087bb7ef	3213	Frankolovo
00050000-55c4-7224-5e91-82b5b133d873	1274	Gabrovka
00050000-55c4-7224-e522-265ff6cfe422	8254	Globoko
00050000-55c4-7224-2dc5-5ba118e0fd11	5275	Godovič
00050000-55c4-7224-6753-568a8e0d040b	4204	Golnik
00050000-55c4-7224-ef27-3785204df032	3303	Gomilsko
00050000-55c4-7224-6ea5-f16bdb160827	4224	Gorenja vas
00050000-55c4-7224-b020-7e3be1bb51f9	3263	Gorica pri Slivnici
00050000-55c4-7224-b3bc-2a709fb3ac31	2272	Gorišnica
00050000-55c4-7224-8fd2-ed318113eded	9250	Gornja Radgona
00050000-55c4-7224-d9d3-9d2847199bc9	3342	Gornji Grad
00050000-55c4-7224-9ccc-a63a82fb71f7	4282	Gozd Martuljek
00050000-55c4-7224-21c5-c0af78466acb	6272	Gračišče
00050000-55c4-7224-05ba-48bb02062182	9264	Grad
00050000-55c4-7224-5c06-3856537124cd	8332	Gradac
00050000-55c4-7224-f45c-dbb7619aa4c9	1384	Grahovo
00050000-55c4-7224-8da6-4c902b4aa1bf	5242	Grahovo ob Bači
00050000-55c4-7224-dbd8-440004fbde6d	5251	Grgar
00050000-55c4-7224-8e02-e49245365dc2	3302	Griže
00050000-55c4-7224-f941-e1a0fd7c8808	3231	Grobelno
00050000-55c4-7224-cc96-c48539663f9d	1290	Grosuplje
00050000-55c4-7224-32d8-5d6758b508f0	2288	Hajdina
00050000-55c4-7224-3e34-fca9a418ddbf	8362	Hinje
00050000-55c4-7224-244e-96524c817235	2311	Hoče
00050000-55c4-7224-10cf-5491547de021	9205	Hodoš/Hodos
00050000-55c4-7224-d5e5-be2712e467cc	1354	Horjul
00050000-55c4-7224-9584-1c7e55252273	1372	Hotedršica
00050000-55c4-7224-0125-0ea1b24e29fe	1430	Hrastnik
00050000-55c4-7224-7161-dfaad32a3f75	6225	Hruševje
00050000-55c4-7224-5455-d031074c6992	4276	Hrušica
00050000-55c4-7224-04c6-3e2e2557ed42	5280	Idrija
00050000-55c4-7224-e244-0d2e22936fdf	1292	Ig
00050000-55c4-7224-f128-dbd21cf8d954	6250	Ilirska Bistrica
00050000-55c4-7224-1e05-c42616431b25	6251	Ilirska Bistrica-Trnovo
00050000-55c4-7224-4326-4d60d2d75967	1295	Ivančna Gorica
00050000-55c4-7224-ead2-7dd97343357d	2259	Ivanjkovci
00050000-55c4-7224-e9a4-6c8e95c79782	1411	Izlake
00050000-55c4-7224-c27f-80c59b2949df	6310	Izola/Isola
00050000-55c4-7224-dfa2-fc203f8d2798	2222	Jakobski Dol
00050000-55c4-7224-f761-ba7b81283276	2221	Jarenina
00050000-55c4-7224-18e3-9f1938924dc4	6254	Jelšane
00050000-55c4-7224-28b2-cac551a6eed8	4270	Jesenice
00050000-55c4-7224-788c-641613d2b0ea	8261	Jesenice na Dolenjskem
00050000-55c4-7224-06ce-c1dd9568f438	3273	Jurklošter
00050000-55c4-7224-243f-c049a5f97db2	2223	Jurovski Dol
00050000-55c4-7224-435a-46fb25eb5b0e	2256	Juršinci
00050000-55c4-7224-b396-702dc9215e0c	5214	Kal nad Kanalom
00050000-55c4-7224-2472-826623fc05e5	3233	Kalobje
00050000-55c4-7224-c459-aee88edc0c66	4246	Kamna Gorica
00050000-55c4-7224-4fff-573b9a3b8fad	2351	Kamnica
00050000-55c4-7224-af4d-3c5f894646d2	1241	Kamnik
00050000-55c4-7224-aaa1-aecb82dbc3c2	5213	Kanal
00050000-55c4-7224-a67c-233a1d4684e6	8258	Kapele
00050000-55c4-7224-0c20-af60bd821006	2362	Kapla
00050000-55c4-7224-e061-9b5c50d77ba0	2325	Kidričevo
00050000-55c4-7224-55c0-d07389db3c7f	1412	Kisovec
00050000-55c4-7224-f707-2d69ba395044	6253	Knežak
00050000-55c4-7224-c1b2-44b431c6f6df	5222	Kobarid
00050000-55c4-7224-0b55-cb74ac8fb90f	9227	Kobilje
00050000-55c4-7224-70d1-0ee267e619e3	1330	Kočevje
00050000-55c4-7224-ecdd-c493710e7435	1338	Kočevska Reka
00050000-55c4-7224-b596-d93f26bb566c	2276	Kog
00050000-55c4-7224-13bf-2edceac5cd84	5211	Kojsko
00050000-55c4-7224-d120-ab708533b0c9	6223	Komen
00050000-55c4-7224-6064-0c2c19b16d80	1218	Komenda
00050000-55c4-7224-0b5c-3269b35eb70e	6000	Koper/Capodistria 
00050000-55c4-7224-d760-a10f435e0a16	6001	Koper/Capodistria - poštni predali
00050000-55c4-7224-7f3f-306b4a3a2596	8282	Koprivnica
00050000-55c4-7224-b559-35cdfa2f844c	5296	Kostanjevica na Krasu
00050000-55c4-7224-cd7c-43bad955e9c1	8311	Kostanjevica na Krki
00050000-55c4-7224-e599-cf21381ee13a	1336	Kostel
00050000-55c4-7224-dca9-d4be9414fc03	6256	Košana
00050000-55c4-7224-3f95-f62363dabf69	2394	Kotlje
00050000-55c4-7224-5eb2-7218f3019e40	6240	Kozina
00050000-55c4-7224-ec85-3cb36e239568	3260	Kozje
00050000-55c4-7224-3b1c-f3e44eac5fb0	4000	Kranj 
00050000-55c4-7224-dd97-c1c58a9257f8	4001	Kranj - poštni predali
00050000-55c4-7224-1b34-a4ef2a68117d	4280	Kranjska Gora
00050000-55c4-7224-0536-faeaa44e3b02	1281	Kresnice
00050000-55c4-7224-0b0d-e1a58c575c9a	4294	Križe
00050000-55c4-7224-0776-f0c2a2e3e88f	9206	Križevci
00050000-55c4-7224-20a1-75916da71e0a	9242	Križevci pri Ljutomeru
00050000-55c4-7224-ab2d-13a4f7b67f3c	1301	Krka
00050000-55c4-7224-40d3-8a321b0c96da	8296	Krmelj
00050000-55c4-7224-eb02-487c163d3deb	4245	Kropa
00050000-55c4-7224-681e-bd0ea5208db6	8262	Krška vas
00050000-55c4-7224-90a1-e9776c6f9e0e	8270	Krško
00050000-55c4-7224-426b-efa86716721a	9263	Kuzma
00050000-55c4-7224-2fa4-d35b1ddd02fc	2318	Laporje
00050000-55c4-7224-8807-bfe8c65161e2	3270	Laško
00050000-55c4-7224-ab21-de8a7bdf97cb	1219	Laze v Tuhinju
00050000-55c4-7224-6409-2fdae77cd9ba	2230	Lenart v Slovenskih goricah
00050000-55c4-7224-0362-31d3a09bb135	9220	Lendava/Lendva
00050000-55c4-7224-2486-a5451605f855	4248	Lesce
00050000-55c4-7224-f3cc-39170a802d25	3261	Lesično
00050000-55c4-7224-53db-0180aa3c48e1	8273	Leskovec pri Krškem
00050000-55c4-7224-aaa6-daf68295f7fd	2372	Libeliče
00050000-55c4-7224-e91a-9e7436a32903	2341	Limbuš
00050000-55c4-7224-ae31-222012c8c0dd	1270	Litija
00050000-55c4-7224-b8bb-5f29dea43337	3202	Ljubečna
00050000-55c4-7224-c467-1a808291005c	1000	Ljubljana 
00050000-55c4-7224-a5b7-015561eb7dba	1001	Ljubljana - poštni predali
00050000-55c4-7224-f138-0ec572c58871	1231	Ljubljana - Črnuče
00050000-55c4-7224-2b37-c7cf9d7fe688	1261	Ljubljana - Dobrunje
00050000-55c4-7224-c284-19495d0b54e2	1260	Ljubljana - Polje
00050000-55c4-7224-043d-5f6c788a983b	1210	Ljubljana - Šentvid
00050000-55c4-7224-1cbb-0f4a8c58d4ab	1211	Ljubljana - Šmartno
00050000-55c4-7224-6f8c-4174c374d63f	3333	Ljubno ob Savinji
00050000-55c4-7224-7648-a58737ba757f	9240	Ljutomer
00050000-55c4-7224-8545-9258d9c890a7	3215	Loče
00050000-55c4-7224-2a63-1d92dce91035	5231	Log pod Mangartom
00050000-55c4-7224-a8db-3314b45f41c1	1358	Log pri Brezovici
00050000-55c4-7224-63f4-7dcb04949796	1370	Logatec
00050000-55c4-7224-f3a0-bd2d367c988d	1371	Logatec
00050000-55c4-7224-2f13-8ab31d909247	1434	Loka pri Zidanem Mostu
00050000-55c4-7224-e7e8-276a24bcf887	3223	Loka pri Žusmu
00050000-55c4-7224-0abe-e81e49a1429b	6219	Lokev
00050000-55c4-7224-2e16-e098d8be9b42	1318	Loški Potok
00050000-55c4-7224-81e6-79146d85352e	2324	Lovrenc na Dravskem polju
00050000-55c4-7224-2f83-6c572811e78d	2344	Lovrenc na Pohorju
00050000-55c4-7224-6bdc-b68f3cf36d1a	3334	Luče
00050000-55c4-7224-943c-d8eff9679bc5	1225	Lukovica
00050000-55c4-7224-59d5-4beb86be7e15	9202	Mačkovci
00050000-55c4-7224-36cd-67702759d6ef	2322	Majšperk
00050000-55c4-7224-c076-0f6ceec2d591	2321	Makole
00050000-55c4-7224-d5ed-da3384a0d887	9243	Mala Nedelja
00050000-55c4-7224-1e55-1a4e1182d9e0	2229	Malečnik
00050000-55c4-7224-2869-d810f80af217	6273	Marezige
00050000-55c4-7224-45e3-959017bd4398	2000	Maribor 
00050000-55c4-7224-e0ab-51b355ca244d	2001	Maribor - poštni predali
00050000-55c4-7224-4193-b8e9af692cf7	2206	Marjeta na Dravskem polju
00050000-55c4-7224-5f88-e99caebb3d78	2281	Markovci
00050000-55c4-7224-30f8-f294be0d5864	9221	Martjanci
00050000-55c4-7224-40d4-9453b86bb6c6	6242	Materija
00050000-55c4-7224-39f6-f3dd62532b89	4211	Mavčiče
00050000-55c4-7224-5133-0786b2d086b9	1215	Medvode
00050000-55c4-7224-6457-1e7e764b2f0d	1234	Mengeš
00050000-55c4-7224-0ae4-feb4f2e81204	8330	Metlika
00050000-55c4-7224-bb7a-bd8843eec9d8	2392	Mežica
00050000-55c4-7224-f52d-855b1b35c4c5	2204	Miklavž na Dravskem polju
00050000-55c4-7224-953f-adc6c90b23fc	2275	Miklavž pri Ormožu
00050000-55c4-7224-223a-cd1ab694e19b	5291	Miren
00050000-55c4-7224-91c2-d635e0e68de7	8233	Mirna
00050000-55c4-7224-6448-22df7b26c03f	8216	Mirna Peč
00050000-55c4-7224-b056-a7bdfe7b0c46	2382	Mislinja
00050000-55c4-7224-1eb0-8aafb69a5858	4281	Mojstrana
00050000-55c4-7224-e88a-b51c00e86207	8230	Mokronog
00050000-55c4-7224-e792-8bf17634109b	1251	Moravče
00050000-55c4-7224-b65c-b4f4e5af1d61	9226	Moravske Toplice
00050000-55c4-7224-0ec2-1707d073b34f	5216	Most na Soči
00050000-55c4-7224-784c-1bc8fb5964ab	1221	Motnik
00050000-55c4-7224-de5c-a5aea6535551	3330	Mozirje
00050000-55c4-7224-62dc-970290d6196a	9000	Murska Sobota 
00050000-55c4-7224-c257-917aef6e9b98	9001	Murska Sobota - poštni predali
00050000-55c4-7224-3134-d1a87d2a324a	2366	Muta
00050000-55c4-7224-3256-7029521aa3fe	4202	Naklo
00050000-55c4-7224-96b1-55bc2a1b6ee7	3331	Nazarje
00050000-55c4-7224-b694-7f1b5a55304f	1357	Notranje Gorice
00050000-55c4-7224-6e6c-11b19a221a3a	3203	Nova Cerkev
00050000-55c4-7224-99b9-5482462952d8	5000	Nova Gorica 
00050000-55c4-7224-93ce-ea97177483fe	5001	Nova Gorica - poštni predali
00050000-55c4-7224-3e0d-39d91dd7dc0e	1385	Nova vas
00050000-55c4-7224-30b8-a22ec61b9d29	8000	Novo mesto
00050000-55c4-7224-061e-521f5ccb001a	8001	Novo mesto - poštni predali
00050000-55c4-7224-9361-dca1a1e18078	6243	Obrov
00050000-55c4-7224-8139-0b9b26cd7495	9233	Odranci
00050000-55c4-7224-3fbc-37caac73a022	2317	Oplotnica
00050000-55c4-7224-54ed-8519646ee8b4	2312	Orehova vas
00050000-55c4-7224-daad-2299d577f378	2270	Ormož
00050000-55c4-7224-4ca7-56ef5bc13557	1316	Ortnek
00050000-55c4-7224-d5fa-bd6acdc6a151	1337	Osilnica
00050000-55c4-7224-fe23-25a0e10f62bd	8222	Otočec
00050000-55c4-7224-f959-341069eed44c	2361	Ožbalt
00050000-55c4-7224-1608-4091417237f7	2231	Pernica
00050000-55c4-7224-2124-9f942469beef	2211	Pesnica pri Mariboru
00050000-55c4-7224-156f-4c121031107e	9203	Petrovci
00050000-55c4-7224-459c-d81ab0af5d5c	3301	Petrovče
00050000-55c4-7224-5587-ca760c4f24fc	6330	Piran/Pirano
00050000-55c4-7224-4aeb-579392060c2d	8255	Pišece
00050000-55c4-7224-ca3a-205a72197cc2	6257	Pivka
00050000-55c4-7224-8538-9864c51bb797	6232	Planina
00050000-55c4-7224-c3d1-c82b4a5888c2	3225	Planina pri Sevnici
00050000-55c4-7224-eb52-1f9e7fd6f646	6276	Pobegi
00050000-55c4-7224-04ed-b2d37de4af45	8312	Podbočje
00050000-55c4-7224-e3f7-609f793ce2fe	5243	Podbrdo
00050000-55c4-7224-2520-c30bbb40fcf0	3254	Podčetrtek
00050000-55c4-7224-337d-ab444be9db1e	2273	Podgorci
00050000-55c4-7224-a0f0-d7c8b8a6bb9f	6216	Podgorje
00050000-55c4-7224-66ec-14fa761c826e	2381	Podgorje pri Slovenj Gradcu
00050000-55c4-7224-f14b-d90e9f0e1ddd	6244	Podgrad
00050000-55c4-7224-92d2-44dbc44b78d5	1414	Podkum
00050000-55c4-7224-d83e-19cff0566675	2286	Podlehnik
00050000-55c4-7224-c266-1c102e7bfd30	5272	Podnanos
00050000-55c4-7224-ba41-265cc58b6218	4244	Podnart
00050000-55c4-7224-f7d8-9bac7a0ec857	3241	Podplat
00050000-55c4-7224-1c28-5f136320f988	3257	Podsreda
00050000-55c4-7224-83fc-424b5dbf3db6	2363	Podvelka
00050000-55c4-7224-eca9-d0333960bf75	2208	Pohorje
00050000-55c4-7224-93d6-dd107e09813c	2257	Polenšak
00050000-55c4-7224-0667-495384d16bad	1355	Polhov Gradec
00050000-55c4-7224-bd43-29c9d985c4df	4223	Poljane nad Škofjo Loko
00050000-55c4-7224-8098-3af4363725fc	2319	Poljčane
00050000-55c4-7224-8a8c-d1334931899f	1272	Polšnik
00050000-55c4-7224-326d-7781f05ea922	3313	Polzela
00050000-55c4-7224-cf71-544ce6fc69ea	3232	Ponikva
00050000-55c4-7224-4714-87eabb1999b8	6320	Portorož/Portorose
00050000-55c4-7224-d6ef-89e683cfbc47	6230	Postojna
00050000-55c4-7224-989f-00665f57b918	2331	Pragersko
00050000-55c4-7224-58f8-b2c5659fd271	3312	Prebold
00050000-55c4-7224-7920-ea78c5e684ce	4205	Preddvor
00050000-55c4-7224-9d1e-8370ea30ff36	6255	Prem
00050000-55c4-7224-211c-f106e9feeddd	1352	Preserje
00050000-55c4-7224-6216-f3eb208f826d	6258	Prestranek
00050000-55c4-7224-3818-758d83982644	2391	Prevalje
00050000-55c4-7224-99e5-1d038a94b4b8	3262	Prevorje
00050000-55c4-7224-0fa7-51f24a28c796	1276	Primskovo 
00050000-55c4-7224-be98-45aadbb2514c	3253	Pristava pri Mestinju
00050000-55c4-7224-28c6-a528a4372ca1	9207	Prosenjakovci/Partosfalva
00050000-55c4-7224-e736-adb37148d7b3	5297	Prvačina
00050000-55c4-7224-71ab-b846b931dcae	2250	Ptuj
00050000-55c4-7224-9785-8d70cdd5431c	2323	Ptujska Gora
00050000-55c4-7224-dd24-a3a06f283327	9201	Puconci
00050000-55c4-7224-298f-1b5eec572cdd	2327	Rače
00050000-55c4-7224-67e8-a317ed4c9557	1433	Radeče
00050000-55c4-7224-db34-724e14f183e6	9252	Radenci
00050000-55c4-7224-7dfb-3ee6390f710e	2360	Radlje ob Dravi
00050000-55c4-7224-9fac-b4ea7572530a	1235	Radomlje
00050000-55c4-7224-18d0-e5f7c1190388	4240	Radovljica
00050000-55c4-7224-e7af-d645fef04209	8274	Raka
00050000-55c4-7224-432a-c413a9e4fc3b	1381	Rakek
00050000-55c4-7224-0543-d066481f630e	4283	Rateče - Planica
00050000-55c4-7224-608a-fb4d4d12d2e6	2390	Ravne na Koroškem
00050000-55c4-7224-5b60-00035271cc13	9246	Razkrižje
00050000-55c4-7224-bce4-e153a7e6e2b4	3332	Rečica ob Savinji
00050000-55c4-7224-2a67-f6429b079884	5292	Renče
00050000-55c4-7224-b829-2322d62345ee	1310	Ribnica
00050000-55c4-7224-ec16-2a7f98e3e187	2364	Ribnica na Pohorju
00050000-55c4-7224-c0b9-9fc82586ae56	3272	Rimske Toplice
00050000-55c4-7224-3e32-8042fbc92e87	1314	Rob
00050000-55c4-7224-1978-03406422501b	5215	Ročinj
00050000-55c4-7224-59df-ff713ff5cdb7	3250	Rogaška Slatina
00050000-55c4-7224-e025-c831f02e97df	9262	Rogašovci
00050000-55c4-7224-3a01-65ab26a387b9	3252	Rogatec
00050000-55c4-7224-22f1-636879224178	1373	Rovte
00050000-55c4-7224-34ee-f604ffd22992	2342	Ruše
00050000-55c4-7224-d544-897a87f83928	1282	Sava
00050000-55c4-7224-8b24-5956ec6d1643	6333	Sečovlje/Sicciole
00050000-55c4-7224-4fcd-5705217e2977	4227	Selca
00050000-55c4-7224-3364-3457c8cd2ffa	2352	Selnica ob Dravi
00050000-55c4-7224-749d-596f06db9aa2	8333	Semič
00050000-55c4-7224-9f91-d2939993cb39	8281	Senovo
00050000-55c4-7224-eb53-64fc28ae63cf	6224	Senožeče
00050000-55c4-7224-f8a0-c40c208b4d17	8290	Sevnica
00050000-55c4-7224-e225-da2667d8b5dd	6210	Sežana
00050000-55c4-7224-1589-e5232b280393	2214	Sladki Vrh
00050000-55c4-7224-7e5f-d205334f7273	5283	Slap ob Idrijci
00050000-55c4-7224-c1ef-01f290ce01a4	2380	Slovenj Gradec
00050000-55c4-7224-4113-b33cdfc447b8	2310	Slovenska Bistrica
00050000-55c4-7224-3905-447f3de7dc6f	3210	Slovenske Konjice
00050000-55c4-7224-574f-966cc506fc11	1216	Smlednik
00050000-55c4-7224-2848-edabf77f7f2a	5232	Soča
00050000-55c4-7224-255c-dcc6a3ca668e	1317	Sodražica
00050000-55c4-7224-d202-bdb097365c57	3335	Solčava
00050000-55c4-7224-bab3-ae8698b77862	5250	Solkan
00050000-55c4-7224-4e30-ae4ff1f019c1	4229	Sorica
00050000-55c4-7224-3040-d13bd1bd1ec6	4225	Sovodenj
00050000-55c4-7224-fac4-fd4b2b5af574	5281	Spodnja Idrija
00050000-55c4-7224-0245-87415633b095	2241	Spodnji Duplek
00050000-55c4-7224-0efb-a45d30ec7cb0	9245	Spodnji Ivanjci
00050000-55c4-7224-ee1b-e4ad4219052e	2277	Središče ob Dravi
00050000-55c4-7224-6fbf-d7ccba309abd	4267	Srednja vas v Bohinju
00050000-55c4-7224-80ae-43924b9964d0	8256	Sromlje 
00050000-55c4-7224-df3b-89f8302fff8a	5224	Srpenica
00050000-55c4-7224-a50f-bf233da2aae2	1242	Stahovica
00050000-55c4-7224-7486-5529f5bd5143	1332	Stara Cerkev
00050000-55c4-7224-bbe3-9b82f5b0774f	8342	Stari trg ob Kolpi
00050000-55c4-7224-21e8-b72a54add8ff	1386	Stari trg pri Ložu
00050000-55c4-7224-58e0-46620259a91b	2205	Starše
00050000-55c4-7224-4099-37da95f38647	2289	Stoperce
00050000-55c4-7224-10c4-d440c9499f70	8322	Stopiče
00050000-55c4-7224-1543-946b223d6355	3206	Stranice
00050000-55c4-7224-1bf0-b2e61456ca81	8351	Straža
00050000-55c4-7224-e267-0c53144f4c77	1313	Struge
00050000-55c4-7224-0725-f0a6763d7783	8293	Studenec
00050000-55c4-7224-8b2f-e04c970c2ce8	8331	Suhor
00050000-55c4-7224-e470-bb0aaaace8d2	2233	Sv. Ana v Slovenskih goricah
00050000-55c4-7224-c646-71f1bcd205fe	2235	Sv. Trojica v Slovenskih goricah
00050000-55c4-7224-47c0-9049969463e2	2353	Sveti Duh na Ostrem Vrhu
00050000-55c4-7224-61dc-9b109c13bc80	9244	Sveti Jurij ob Ščavnici
00050000-55c4-7224-94ab-1e0c5f063345	3264	Sveti Štefan
00050000-55c4-7224-5d24-ec7fca4b8d0c	2258	Sveti Tomaž
00050000-55c4-7224-1f61-c243269f3b41	9204	Šalovci
00050000-55c4-7224-a3f6-e19e7704c2c9	5261	Šempas
00050000-55c4-7224-ff98-b1068e4470b0	5290	Šempeter pri Gorici
00050000-55c4-7224-8b06-ecd64e7391e6	3311	Šempeter v Savinjski dolini
00050000-55c4-7224-d3f3-6cf09ddf9630	4208	Šenčur
00050000-55c4-7224-c049-46a77683e741	2212	Šentilj v Slovenskih goricah
00050000-55c4-7224-2bea-b81f9777f522	8297	Šentjanž
00050000-55c4-7224-f1bd-a5935a1ab505	2373	Šentjanž pri Dravogradu
00050000-55c4-7224-3c28-8db15c8d1ba0	8310	Šentjernej
00050000-55c4-7224-b6b6-926c4d0c8bde	3230	Šentjur
00050000-55c4-7224-3475-9c9f78ad7c3e	3271	Šentrupert
00050000-55c4-7224-c0ff-66dcbaa782a7	8232	Šentrupert
00050000-55c4-7224-77ac-a7dd23a55192	1296	Šentvid pri Stični
00050000-55c4-7224-7048-1059bbce7d7b	8275	Škocjan
00050000-55c4-7224-8529-2d1c1dfc1399	6281	Škofije
00050000-55c4-7224-1ebb-05f8c9f37522	4220	Škofja Loka
00050000-55c4-7224-4cdc-067ebda00fae	3211	Škofja vas
00050000-55c4-7224-4fd9-ed318ec5fec6	1291	Škofljica
00050000-55c4-7224-15e3-164354940dea	6274	Šmarje
00050000-55c4-7224-f23f-050bc3a64d89	1293	Šmarje - Sap
00050000-55c4-7224-b0dc-dad990d959e5	3240	Šmarje pri Jelšah
00050000-55c4-7224-513c-b6692b73aa76	8220	Šmarješke Toplice
00050000-55c4-7224-aa9d-1d6d54a56993	2315	Šmartno na Pohorju
00050000-55c4-7224-6388-9d5e9ffcb380	3341	Šmartno ob Dreti
00050000-55c4-7224-91f1-b8bdb0a333fa	3327	Šmartno ob Paki
00050000-55c4-7224-87ac-68100d2711f3	1275	Šmartno pri Litiji
00050000-55c4-7224-ff54-a6c67c825ca2	2383	Šmartno pri Slovenj Gradcu
00050000-55c4-7224-5905-e94ae583fa69	3201	Šmartno v Rožni dolini
00050000-55c4-7224-99af-16c100b99e3a	3325	Šoštanj
00050000-55c4-7224-df56-d0470f51f61f	6222	Štanjel
00050000-55c4-7224-0547-e9e632ababb5	3220	Štore
00050000-55c4-7224-437f-2c0c69c3c7b4	3304	Tabor
00050000-55c4-7224-f8f1-10d5a21c0aa5	3221	Teharje
00050000-55c4-7224-f986-d59706731582	9251	Tišina
00050000-55c4-7224-f520-e8610ce6d09c	5220	Tolmin
00050000-55c4-7224-7547-7ca12ea879d5	3326	Topolšica
00050000-55c4-7224-40e0-92f1575aa654	2371	Trbonje
00050000-55c4-7224-fa47-e5aaf0f31be5	1420	Trbovlje
00050000-55c4-7224-9a21-9fc495424f2d	8231	Trebelno 
00050000-55c4-7224-0a58-7cfe7a74cb0a	8210	Trebnje
00050000-55c4-7224-c7a7-5ac4b7d364e5	5252	Trnovo pri Gorici
00050000-55c4-7224-77f8-11618aa54ba3	2254	Trnovska vas
00050000-55c4-7224-687e-dd6b782888c3	1222	Trojane
00050000-55c4-7224-56f0-bdade72cf872	1236	Trzin
00050000-55c4-7224-5139-f826ed48fc56	4290	Tržič
00050000-55c4-7224-f12d-63d4f66dbbfb	8295	Tržišče
00050000-55c4-7224-0906-cb58b706e2a8	1311	Turjak
00050000-55c4-7224-1636-0d2183ed6ba1	9224	Turnišče
00050000-55c4-7224-8cf4-5fc90a76714c	8323	Uršna sela
00050000-55c4-7224-f942-de2b2e3d0d49	1252	Vače
00050000-55c4-7224-10d2-27f938d7b1f4	3320	Velenje 
00050000-55c4-7224-36b6-98c1b8c33886	3322	Velenje - poštni predali
00050000-55c4-7224-8d16-fa8b2f4dca3b	8212	Velika Loka
00050000-55c4-7224-f6c4-62ecba12473c	2274	Velika Nedelja
00050000-55c4-7224-d6c4-ca12e7d41dbc	9225	Velika Polana
00050000-55c4-7224-82f7-2b3800a923c9	1315	Velike Lašče
00050000-55c4-7224-6c86-ed95b109da4a	8213	Veliki Gaber
00050000-55c4-7224-74f5-d55e60ff744d	9241	Veržej
00050000-55c4-7224-808b-57a69260965f	1312	Videm - Dobrepolje
00050000-55c4-7224-0304-3b49c40890cf	2284	Videm pri Ptuju
00050000-55c4-7224-9709-3c6d27ed8b70	8344	Vinica
00050000-55c4-7224-9c7e-f9cdcbaf02a7	5271	Vipava
00050000-55c4-7224-a66c-bb9ce3968fc2	4212	Visoko
00050000-55c4-7224-d2a5-6a079f119547	1294	Višnja Gora
00050000-55c4-7224-699d-76671f7f512d	3205	Vitanje
00050000-55c4-7224-f3b4-a6e325fde4ad	2255	Vitomarci
00050000-55c4-7224-3226-5a67a73c0fc8	1217	Vodice
00050000-55c4-7224-5ffa-9df76139572a	3212	Vojnik\t
00050000-55c4-7224-306f-daaa33bec9e7	5293	Volčja Draga
00050000-55c4-7224-66f3-58ba603f01e0	2232	Voličina
00050000-55c4-7224-e7bf-7307611d326b	3305	Vransko
00050000-55c4-7224-235d-3246f4c7362a	6217	Vremski Britof
00050000-55c4-7224-00b0-05de1aa2b268	1360	Vrhnika
00050000-55c4-7224-d5c7-2fbb1938458f	2365	Vuhred
00050000-55c4-7224-1cf0-1ed7fa788040	2367	Vuzenica
00050000-55c4-7224-cb16-e964dff4c795	8292	Zabukovje 
00050000-55c4-7224-851f-cef3361f3011	1410	Zagorje ob Savi
00050000-55c4-7224-687e-b77c1f91ee30	1303	Zagradec
00050000-55c4-7224-de21-793c5f157eaa	2283	Zavrč
00050000-55c4-7224-4159-123ff0abe98c	8272	Zdole 
00050000-55c4-7224-6c96-8d6cf4e557fe	4201	Zgornja Besnica
00050000-55c4-7224-a4c9-3b7c023d336a	2242	Zgornja Korena
00050000-55c4-7224-24bd-ba571c8dd447	2201	Zgornja Kungota
00050000-55c4-7224-1062-494863d90fd3	2316	Zgornja Ložnica
00050000-55c4-7224-edd6-153d24baf7a2	2314	Zgornja Polskava
00050000-55c4-7224-6da4-9e44dab7b663	2213	Zgornja Velka
00050000-55c4-7224-753f-c4864ef82c92	4247	Zgornje Gorje
00050000-55c4-7224-ec62-c5580e4be486	4206	Zgornje Jezersko
00050000-55c4-7224-311a-6cb9a6205edd	2285	Zgornji Leskovec
00050000-55c4-7224-a2df-641e766f8684	1432	Zidani Most
00050000-55c4-7224-5c07-8db10860adc5	3214	Zreče
00050000-55c4-7224-5315-7a84c026b68e	4209	Žabnica
00050000-55c4-7224-63f8-2a0d6a85ab00	3310	Žalec
00050000-55c4-7224-6d4a-65938b98760f	4228	Železniki
00050000-55c4-7224-40ba-4f6360f7a8e3	2287	Žetale
00050000-55c4-7224-b6b0-e1f810d938d7	4226	Žiri
00050000-55c4-7224-6232-de4aad32c3c0	4274	Žirovnica
00050000-55c4-7224-6796-f2c302f360af	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12411116)
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
-- TOC entry 3003 (class 0 OID 12410923)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12411001)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12411128)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12411459)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12411469)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c4-7225-46ae-97f2c36164a9	00080000-55c4-7225-05f8-7e540509dfaa	0900	AK
00190000-55c4-7225-6bce-f158356959c1	00080000-55c4-7225-6ab7-6cd8ea64a08f	0987	AK
00190000-55c4-7225-6ce3-6fa22f8544d0	00080000-55c4-7225-a499-175ead784356	0989	AK
00190000-55c4-7225-6703-54365bae344b	00080000-55c4-7225-99f0-fb76f5a45d9f	0986	AK
00190000-55c4-7225-1135-99bfd4846c9d	00080000-55c4-7225-654a-f6cec8770523	0984	AK
00190000-55c4-7225-cc51-6d1fbf7d2b18	00080000-55c4-7225-0234-f676c0ca5fc8	0983	AK
00190000-55c4-7225-4b07-95cacdc3765a	00080000-55c4-7225-e190-5c029af562c5	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12411415)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c4-7225-cc57-2e14780fabd7	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3048 (class 0 OID 12411477)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12411157)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c4-7225-f72d-aa0e3288e626	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c4-7225-da42-5eb0ce392710	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c4-7225-e583-c7ab54558509	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c4-7225-fe77-c90ef927450e	0004	Mali oder	t	24	Mali oder 
00220000-55c4-7225-6bd5-8d153377c465	0005	Komorni oder	t	15	Komorni oder
00220000-55c4-7225-0901-abee8228ad22	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c4-7225-5c92-4c53d9f465d7	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12411101)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12411091)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12411276)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12411225)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12410795)
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
-- TOC entry 3028 (class 0 OID 12411167)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12410833)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c4-7224-8170-da0dd27b29e9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c4-7224-60a9-8860cbb58c2d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c4-7224-af95-e2589c67c150	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c4-7224-e49a-4f444c77f057	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c4-7224-9044-d7eebfb858a0	planer	Planer dogodkov v koledarju	t
00020000-55c4-7224-f10d-3b49b19055e3	kadrovska	Kadrovska služba	t
00020000-55c4-7224-93d5-d5795e7a4db7	arhivar	Ažuriranje arhivalij	t
00020000-55c4-7224-bf70-f1994f324d14	igralec	Igralec	t
00020000-55c4-7224-5631-a2ba662ac9e5	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c4-7225-041f-f77ae7dacffd	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12410817)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c4-7224-906e-3ae3019c8b16	00020000-55c4-7224-af95-e2589c67c150
00010000-55c4-7224-84d8-4e7f3dbdb325	00020000-55c4-7224-af95-e2589c67c150
00010000-55c4-7225-2b43-7e3592c68ced	00020000-55c4-7225-041f-f77ae7dacffd
\.


--
-- TOC entry 3030 (class 0 OID 12411181)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12411122)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12411068)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12411518)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c4-7224-fb3d-148966c516d5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c4-7224-79c0-c6d4a0dde0b6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c4-7224-705c-1205b65cded3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c4-7224-aef0-890a25354a6a	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c4-7224-02e0-112c13535871	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12411510)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c4-7224-7dfc-f1cf281d7dfe	00230000-55c4-7224-aef0-890a25354a6a	popa
00240000-55c4-7224-4430-fda1319f0243	00230000-55c4-7224-aef0-890a25354a6a	oseba
00240000-55c4-7224-df33-54b710bd1e69	00230000-55c4-7224-aef0-890a25354a6a	sezona
00240000-55c4-7224-9818-cc71c84b1c2d	00230000-55c4-7224-79c0-c6d4a0dde0b6	prostor
00240000-55c4-7224-f1d0-c63cd2d6d480	00230000-55c4-7224-aef0-890a25354a6a	besedilo
00240000-55c4-7224-1b3d-745f11905393	00230000-55c4-7224-aef0-890a25354a6a	uprizoritev
00240000-55c4-7224-a006-5797c0e29da8	00230000-55c4-7224-aef0-890a25354a6a	funkcija
00240000-55c4-7224-14b4-f2ba53682b1b	00230000-55c4-7224-aef0-890a25354a6a	tipfunkcije
00240000-55c4-7224-07ff-dae410f07b74	00230000-55c4-7224-aef0-890a25354a6a	alternacija
00240000-55c4-7224-1efc-58d297139ec8	00230000-55c4-7224-fb3d-148966c516d5	pogodba
00240000-55c4-7224-4102-c74e8ff678c2	00230000-55c4-7224-aef0-890a25354a6a	zaposlitev
00240000-55c4-7224-6888-6323a24fd28d	00230000-55c4-7224-fb3d-148966c516d5	programdela
00240000-55c4-7224-5b3d-43577e1b7e1d	00230000-55c4-7224-aef0-890a25354a6a	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12411505)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12411235)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c4-7225-ac06-00e89fcff7b5	000e0000-55c4-7225-e4c0-47c25736df4a	00080000-55c4-7225-0eca-d55539e82207	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c4-7225-b203-b50f98ed2a2f	000e0000-55c4-7225-e4c0-47c25736df4a	00080000-55c4-7225-0eca-d55539e82207	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c4-7225-0bd2-b81518e24e39	000e0000-55c4-7225-e4c0-47c25736df4a	00080000-55c4-7225-c8f0-05df269a30da	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c4-7225-0481-6f4ef07dbc30	000e0000-55c4-7225-e4c0-47c25736df4a	00080000-55c4-7225-c8f0-05df269a30da	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12410895)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12411078)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c4-7225-01b3-63929fe8a461	00180000-55c4-7225-076e-42c060924015	000c0000-55c4-7225-d442-8fa6e8150f72	00090000-55c4-7225-2850-9ff8631ab4b6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-7225-363e-5f76a3cc8bde	00180000-55c4-7225-076e-42c060924015	000c0000-55c4-7225-262f-5d8b8a3dde73	00090000-55c4-7225-b106-bfebcf48830b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-7225-f13c-98634054c800	00180000-55c4-7225-076e-42c060924015	000c0000-55c4-7225-2526-0999db49582e	00090000-55c4-7225-29ee-e36908727d1d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-7225-67ba-ccee57d05a73	00180000-55c4-7225-076e-42c060924015	000c0000-55c4-7225-6f92-4ccc102ca18b	00090000-55c4-7225-8b8d-31b9fd0dcef2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-7225-d352-c32471740d31	00180000-55c4-7225-076e-42c060924015	000c0000-55c4-7225-7837-bfef74f73326	00090000-55c4-7225-ea0b-517a2a03eb97	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c4-7225-c49c-95958d2ef533	00180000-55c4-7225-4e9c-0505c25ad00c	\N	00090000-55c4-7225-ea0b-517a2a03eb97	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12411265)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c4-7224-1ed1-4e722c14c769	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c4-7224-2d92-fd36c3cb85a5	Priredba	Priredba	Priredba	umetnik
000f0000-55c4-7224-5b90-6b3678db41e2	Prevod	Prevod	Prevod	umetnik
000f0000-55c4-7224-6397-2c6c85f09d6b	Režija	Režija	Režija	umetnik
000f0000-55c4-7224-7d21-9af63bf94395	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c4-7224-329d-ea264af8b29e	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c4-7224-9f87-0cdf8f6cac15	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c4-7224-65ee-0f2dc7f9a3a7	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c4-7224-5f2d-7b69abf1eaa3	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c4-7224-cbcc-c4b226505d52	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c4-7224-b192-8550bec921de	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c4-7224-10cd-c6f196289418	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c4-7224-6cd8-28a46780a2b5	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c4-7224-b642-2572616adc74	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c4-7224-318b-b1cde25c0cfa	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c4-7224-9796-9b41254c1030	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c4-7224-5384-26c552654843	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c4-7224-6f50-980aa04d4d61	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12411487)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c4-7224-dd5d-72f556c700a8	01	Velika predstava	f	1.00	1.00
002b0000-55c4-7224-0346-815a6648d6c0	02	Mala predstava	f	0.50	0.50
002b0000-55c4-7224-5803-11c29a600829	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c4-7224-ff7e-d7a28524872a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c4-7224-5554-a7b91711f2bf	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12410958)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12410804)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c4-7224-84d8-4e7f3dbdb325	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROA3idh73hOZEUktzoNusoupaVHu4Kw0e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c4-7225-d140-ef0b25ac47fe	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c4-7225-86d3-0ef244a1ad81	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c4-7225-191f-ce231aa9f122	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c4-7225-0f2b-6050463b5250	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c4-7225-855b-8144c5a79349	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c4-7225-684c-97c79f70b524	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c4-7225-3f3a-5271280aef6c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c4-7225-aaef-3f37bb301233	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c4-7225-884d-7dd2069d7856	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c4-7225-2b43-7e3592c68ced	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c4-7224-906e-3ae3019c8b16	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12411313)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c4-7225-1cc7-d0d324c7a145	00160000-55c4-7225-da1b-a0f292bc6894	00150000-55c4-7224-8053-941664920ec2	00140000-55c4-7223-2dac-118dbb3a7073	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c4-7225-6bd5-8d153377c465
000e0000-55c4-7225-e4c0-47c25736df4a	00160000-55c4-7225-7182-17bcb1b3707d	00150000-55c4-7224-dd07-af9c888ea1f7	00140000-55c4-7223-42c7-d104e81ca78b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c4-7225-0901-abee8228ad22
000e0000-55c4-7225-3a42-5918847a0d74	\N	00150000-55c4-7224-dd07-af9c888ea1f7	00140000-55c4-7223-42c7-d104e81ca78b	00190000-55c4-7225-6bce-f158356959c1	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c4-7225-6bd5-8d153377c465
000e0000-55c4-7225-de22-bb4c336a375a	\N	00150000-55c4-7224-dd07-af9c888ea1f7	00140000-55c4-7223-42c7-d104e81ca78b	00190000-55c4-7225-6bce-f158356959c1	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c4-7225-6bd5-8d153377c465
000e0000-55c4-7225-5441-ff55d8cc51e0	\N	00150000-55c4-7224-dd07-af9c888ea1f7	00140000-55c4-7223-42c7-d104e81ca78b	00190000-55c4-7225-6bce-f158356959c1	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c4-7225-f72d-aa0e3288e626
\.


--
-- TOC entry 3011 (class 0 OID 12411020)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c4-7225-92f5-237e85f5a241	000e0000-55c4-7225-e4c0-47c25736df4a	1	
00200000-55c4-7225-719d-a6d9f4f0b36c	000e0000-55c4-7225-e4c0-47c25736df4a	2	
\.


--
-- TOC entry 3026 (class 0 OID 12411149)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12411557)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12411529)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12411569)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12411218)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c4-7225-7713-a67b6085e06a	00090000-55c4-7225-b106-bfebcf48830b	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-7225-4d02-5c9a248eda3c	00090000-55c4-7225-29ee-e36908727d1d	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-7225-bfe0-3419ce3c11d1	00090000-55c4-7225-ad4c-d9c0d6eb53d7	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-7225-2793-fc1612522517	00090000-55c4-7225-2c29-378139a5cced	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-7225-c62c-d68111f41b3f	00090000-55c4-7225-2850-9ff8631ab4b6	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c4-7225-ff8f-bfb33a6f6c9e	00090000-55c4-7225-b9ef-8367091c86f3	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12411052)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12411303)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c4-7223-2dac-118dbb3a7073	01	Drama	drama (SURS 01)
00140000-55c4-7223-7b41-fdc7663d98a1	02	Opera	opera (SURS 02)
00140000-55c4-7223-5f83-86cc817e3a32	03	Balet	balet (SURS 03)
00140000-55c4-7223-68f6-583808da9b02	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c4-7223-d885-03e05e38e617	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c4-7223-42c7-d104e81ca78b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c4-7223-698c-cc95fec857e4	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12411208)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c4-7224-3361-442401715940	01	Opera	opera
00150000-55c4-7224-1409-3eb98d5adc58	02	Opereta	opereta
00150000-55c4-7224-884a-d6c30ba27fff	03	Balet	balet
00150000-55c4-7224-3520-63245adb0146	04	Plesne prireditve	plesne prireditve
00150000-55c4-7224-d369-e62bd9ea8682	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c4-7224-a3ba-b0a0d173b374	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c4-7224-993f-04f81e7149e5	07	Biografska drama	biografska drama
00150000-55c4-7224-8053-941664920ec2	08	Komedija	komedija
00150000-55c4-7224-1fa2-19bd10d1f53b	09	Črna komedija	črna komedija
00150000-55c4-7224-20c8-ed7a2ad12172	10	E-igra	E-igra
00150000-55c4-7224-dd07-af9c888ea1f7	11	Kriminalka	kriminalka
00150000-55c4-7224-fb08-f998661e47fc	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12410858)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12411360)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12411350)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12411264)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12411610)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12411042)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12411067)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12411503)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12410984)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12411409)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12411204)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12411018)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12411061)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12410998)
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
-- TOC entry 2630 (class 2606 OID 12411114)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12411586)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12411593)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12411618)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12411141)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12410956)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12410867)
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
-- TOC entry 2544 (class 2606 OID 12410891)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12410847)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12410832)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12411147)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12411180)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12411298)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12410920)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12410944)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12411120)
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
-- TOC entry 2559 (class 2606 OID 12410934)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12411005)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12411132)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12411466)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12411474)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12411457)
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
-- TOC entry 2736 (class 2606 OID 12411485)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12411164)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12411105)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12411096)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12411286)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12411232)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12410803)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12411171)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12410821)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12410841)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12411189)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12411127)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12411076)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12411527)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12411515)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12411509)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12411245)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12410900)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12411087)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12411275)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12411497)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12410969)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12410816)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12411329)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12411027)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12411155)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12411567)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12411551)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12411575)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12411223)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12411056)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12411311)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12411216)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12411049)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12411246)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12411247)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12411588)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12411587)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12410922)
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
-- TOC entry 2643 (class 1259 OID 12411148)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12411555)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12411554)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12411556)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12411553)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12411552)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12411134)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12411133)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12411028)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12411205)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12411207)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12411206)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12411000)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12410999)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12411486)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12411300)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12411301)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12411302)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12411576)
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
-- TOC entry 2697 (class 1259 OID 12411334)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12411331)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12411335)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12411333)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12411332)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12410971)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12410970)
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
-- TOC entry 2542 (class 1259 OID 12410894)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12411172)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12411062)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12410848)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12410849)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12411192)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12411191)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12411190)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12411006)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12411008)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12411007)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12411517)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12411100)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12411098)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12411097)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12411099)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12410822)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12410823)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12411156)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12411611)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12411619)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12411620)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12411121)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12411233)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12411234)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12411414)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12411413)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12411410)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12411411)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12411412)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12410936)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12410935)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12410937)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12411467)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12411468)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12411364)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12411365)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12411362)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12411363)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12411224)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12411109)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12411108)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12411106)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12411107)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12411352)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12411351)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12411458)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12411019)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12411504)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12411594)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12411595)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12410869)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12410868)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12410901)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12410902)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12411090)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12411089)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12411088)
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
-- TOC entry 2594 (class 1259 OID 12411051)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12411047)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12411044)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12411045)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12411043)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12411048)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12411046)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12410921)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12410985)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12410987)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12410986)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12410988)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12411115)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12411299)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12411330)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12410892)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12410893)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12411217)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12411528)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12410957)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12411516)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12411166)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12411165)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12411361)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12410945)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12411312)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12411568)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12411475)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12411476)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12411077)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12410842)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12411050)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 12411756)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 12411741)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 12411746)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 12411766)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 12411736)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 12411761)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12411751)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 12411911)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 12411916)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 12412086)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 12412081)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12411671)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12411851)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 12412066)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12412061)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 12412071)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 12412056)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 12412051)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 12411846)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 12411841)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12411731)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12411881)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12411891)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12411886)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 12411706)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 12411701)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12411831)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12412036)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 12411921)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12411926)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 12411931)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12412076)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 12411951)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 12411936)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 12411956)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12411946)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 12411941)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 12411696)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 12411691)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 12411656)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 12411651)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12411861)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12411771)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 12411631)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 12411636)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 12411876)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12411871)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 12411866)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 12411711)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 12411721)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12411716)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12412046)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 12411806)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 12411796)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 12411791)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 12411801)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 12411621)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 12411626)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12411856)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12412101)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 12412106)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 12412111)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12411836)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 12411901)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 12411906)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 12412011)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 12412006)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 12411991)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 12411996)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12412001)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12411681)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 12411676)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 12411686)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 12412021)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 12412026)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 12411981)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 12411986)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 12411971)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 12411976)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12411896)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 12411826)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 12411821)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 12411811)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 12411816)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 12411966)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 12411961)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12412016)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12411726)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12412031)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12412041)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 12412091)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 12412096)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 12411646)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 12411641)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 12411661)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 12411666)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 12411786)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12411781)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 12411776)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-07 10:53:58 CEST

--
-- PostgreSQL database dump complete
--

