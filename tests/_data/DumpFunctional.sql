--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-06 16:58:42 CEST

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
-- TOC entry 183 (class 1259 OID 12316418)
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
-- TOC entry 228 (class 1259 OID 12316921)
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
-- TOC entry 227 (class 1259 OID 12316904)
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
-- TOC entry 221 (class 1259 OID 12316816)
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
-- TOC entry 244 (class 1259 OID 12317164)
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
-- TOC entry 197 (class 1259 OID 12316597)
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
-- TOC entry 200 (class 1259 OID 12316631)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12317066)
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
-- TOC entry 192 (class 1259 OID 12316540)
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
-- TOC entry 229 (class 1259 OID 12316934)
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
-- TOC entry 216 (class 1259 OID 12316761)
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
-- TOC entry 195 (class 1259 OID 12316577)
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
-- TOC entry 199 (class 1259 OID 12316625)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12316557)
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
-- TOC entry 205 (class 1259 OID 12316678)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12317145)
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
-- TOC entry 243 (class 1259 OID 12317157)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12317180)
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
-- TOC entry 209 (class 1259 OID 12316703)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12316514)
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
-- TOC entry 184 (class 1259 OID 12316427)
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
-- TOC entry 185 (class 1259 OID 12316438)
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
-- TOC entry 180 (class 1259 OID 12316392)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12316411)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12316710)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12316741)
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
-- TOC entry 224 (class 1259 OID 12316855)
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
-- TOC entry 187 (class 1259 OID 12316471)
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
-- TOC entry 189 (class 1259 OID 12316506)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12316684)
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
-- TOC entry 188 (class 1259 OID 12316491)
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
-- TOC entry 194 (class 1259 OID 12316569)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12316696)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12317027)
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
-- TOC entry 232 (class 1259 OID 12317037)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12316983)
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
-- TOC entry 233 (class 1259 OID 12317045)
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
-- TOC entry 212 (class 1259 OID 12316725)
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
-- TOC entry 204 (class 1259 OID 12316669)
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
-- TOC entry 203 (class 1259 OID 12316659)
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
-- TOC entry 223 (class 1259 OID 12316844)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12316793)
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
-- TOC entry 177 (class 1259 OID 12316363)
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
-- TOC entry 176 (class 1259 OID 12316361)
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
-- TOC entry 213 (class 1259 OID 12316735)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12316401)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12316385)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12316749)
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
-- TOC entry 207 (class 1259 OID 12316690)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12316636)
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
-- TOC entry 238 (class 1259 OID 12317086)
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
-- TOC entry 237 (class 1259 OID 12317078)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12317073)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12316803)
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
-- TOC entry 186 (class 1259 OID 12316463)
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
-- TOC entry 202 (class 1259 OID 12316646)
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
-- TOC entry 222 (class 1259 OID 12316833)
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
-- TOC entry 234 (class 1259 OID 12317055)
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
-- TOC entry 191 (class 1259 OID 12316526)
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
-- TOC entry 178 (class 1259 OID 12316372)
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
-- TOC entry 226 (class 1259 OID 12316881)
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
-- TOC entry 196 (class 1259 OID 12316588)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12316717)
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
-- TOC entry 240 (class 1259 OID 12317125)
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
-- TOC entry 239 (class 1259 OID 12317097)
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
-- TOC entry 241 (class 1259 OID 12317137)
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
-- TOC entry 218 (class 1259 OID 12316786)
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
-- TOC entry 198 (class 1259 OID 12316620)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12316871)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12316776)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12316366)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12316418)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12316921)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c3-7622-8fbf-bfa5cf89ea98	000d0000-55c3-7621-0a76-bedaff0038bd	\N	00090000-55c3-7621-28f7-e8268234f78b	000b0000-55c3-7621-1a6a-77bdfceb3a20	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c3-7622-48de-43c58735f17c	000d0000-55c3-7621-51a1-5ba8bc96df43	00100000-55c3-7621-2330-0d54346a8bc5	00090000-55c3-7621-bda8-8e84109f1e81	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c3-7622-f672-d0a8c626624f	000d0000-55c3-7621-e17e-f0d3bbc2b9fb	00100000-55c3-7621-b1b3-f16944a1066a	00090000-55c3-7621-324d-3fa6ddecd83d	\N	0003	t	\N	2015-08-06	\N	2	\N	\N	f	f
000c0000-55c3-7622-f508-0577223c7504	000d0000-55c3-7621-ec67-c960a669192a	\N	00090000-55c3-7621-7792-88cc9baca551	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c3-7622-ba62-0438e6532005	000d0000-55c3-7621-66ec-1eb5747cb99f	\N	00090000-55c3-7621-4b04-b1a2bce0b297	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c3-7622-3fdd-b373de7f042c	000d0000-55c3-7621-c75f-45b4531430d0	\N	00090000-55c3-7621-294e-8b67344c9267	000b0000-55c3-7621-895e-3cf6143bf0f7	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c3-7622-dd89-4f3bedb5b1f1	000d0000-55c3-7621-0674-94bd72a9707a	00100000-55c3-7621-49d3-52d74dfba7bc	00090000-55c3-7621-ad9e-b2180076ff83	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c3-7622-ed2d-3f20b5b44446	000d0000-55c3-7621-2a00-689468353f42	\N	00090000-55c3-7621-b018-57f211c13304	000b0000-55c3-7621-5b7b-9e88ae643e26	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c3-7622-6e74-f6503f960901	000d0000-55c3-7621-0674-94bd72a9707a	00100000-55c3-7621-d4ca-aa335c901a34	00090000-55c3-7621-e05b-82674dd30c29	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c3-7622-afa7-7b4e585c48b1	000d0000-55c3-7621-0674-94bd72a9707a	00100000-55c3-7621-3194-9184877c1b83	00090000-55c3-7621-f5b2-9a889ddec932	\N	0010	t	\N	2015-08-06	\N	16	\N	\N	f	t
000c0000-55c3-7622-2789-fe79c6c83979	000d0000-55c3-7621-0674-94bd72a9707a	00100000-55c3-7621-6c8e-773dfbc12e6f	00090000-55c3-7621-35bb-4a8763e26ede	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12316904)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12316816)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c3-7621-c97a-2c405c63b94b	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c3-7621-c3fb-400351efc7d1	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c3-7621-2bae-7472b70fb8a2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12317164)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12316597)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c3-7621-fdc6-d41bbc463534	\N	\N	00200000-55c3-7621-9050-8f556731a43a	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c3-7621-e8a7-f9e4f3360291	\N	\N	00200000-55c3-7621-a802-4738019c9de3	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c3-7621-2c59-b8f349df1cd6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c3-7621-17cb-6de1c134b3a2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c3-7621-c8ba-91b6805fcff7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12316631)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12317066)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12316540)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c3-7620-3f14-8861425fad89	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c3-7620-dd38-c8c818e5a2b8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c3-7620-b64b-92e75e9411d8	AL	ALB	008	Albania 	Albanija	\N
00040000-55c3-7620-a479-0cad99aacb75	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c3-7620-0508-ca1aa66f22e9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c3-7620-3083-a2de174116cc	AD	AND	020	Andorra 	Andora	\N
00040000-55c3-7620-977a-5f6c81c202b2	AO	AGO	024	Angola 	Angola	\N
00040000-55c3-7620-8a12-29ecb9d2dc87	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c3-7620-4434-b97b4dfe0ea6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c3-7620-c74a-3278fe3aae6e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c3-7620-e3c7-85e8819395cd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c3-7620-373e-4f93a038e8e4	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c3-7620-7495-e10eb09c78f0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c3-7620-662b-121825879f34	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c3-7620-e791-c1a2c71f9646	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c3-7620-4b25-a7bc1c4d9bb6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c3-7620-37ca-f4ad0cf431f5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c3-7620-ee5f-e9ece0bc4e62	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c3-7620-b4a2-450ac7d5f544	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c3-7620-d6b4-19cea09b563a	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c3-7620-e14e-f8d4ba02c597	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c3-7620-3baf-f15ecd6143b0	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c3-7620-6d1f-f4ac933a19ac	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c3-7620-d77c-d49ca4c96613	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c3-7620-d95f-8c27edcb5349	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c3-7620-f280-2c9eff3095b5	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c3-7620-0b6d-b45a39417a25	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c3-7620-43db-2ec24957e6cf	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c3-7620-13b1-953597368b0d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c3-7620-b63a-57e4c16315e8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c3-7620-4d79-a0b6f8069927	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c3-7620-69fc-31a9f3a75a16	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c3-7620-d1e2-58a6703e6e45	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c3-7620-4df3-6a907ef4c326	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c3-7620-c49c-810c9d256b18	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c3-7620-a11a-9da6606fcbd9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c3-7620-8c66-ce01f1ba1454	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c3-7620-51c6-9ba12bbb1dcb	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c3-7620-3e82-cd16bf4bb184	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c3-7620-5784-a940c0a1dcbe	CA	CAN	124	Canada 	Kanada	\N
00040000-55c3-7620-d7bc-4306f9cd7482	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c3-7620-e693-e1db871a0dfe	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c3-7620-f337-7905987540e4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c3-7620-65f9-b37b1bc039eb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c3-7620-e626-8829ee75f7be	CL	CHL	152	Chile 	Čile	\N
00040000-55c3-7620-ddb4-f2799bcb4b83	CN	CHN	156	China 	Kitajska	\N
00040000-55c3-7620-6b73-840b8eaa698f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c3-7620-3ebc-cc1cc3390dfc	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c3-7620-f3e9-0378789f01a6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c3-7620-498e-eed118923969	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c3-7620-e0c6-5309a55183a3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c3-7620-a8b4-469b6fdb681e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c3-7620-4e51-ca60759aca03	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c3-7620-047e-5942840c06b9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c3-7620-780d-728e75e29abc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c3-7620-2bc0-65f48f852290	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c3-7620-e922-f4be501bd956	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c3-7620-452d-114f3195d5d8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c3-7620-814e-70a1c4944271	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c3-7620-7e4c-8a03b182e01e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c3-7620-44d8-914913dcb4f8	DK	DNK	208	Denmark 	Danska	\N
00040000-55c3-7620-210d-f6ed24866069	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c3-7620-bc17-5cfc1f5645c9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c3-7620-1d07-3d8bdf317dde	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c3-7620-144f-5a32fdeaf135	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c3-7620-4e47-381307d216e0	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c3-7620-9e35-0a338c6eeb70	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c3-7620-0780-ab25ca98820f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c3-7620-c3b0-51709af85a49	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c3-7620-e5b4-608d6d51771d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c3-7620-3218-33fcf3ff5f86	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c3-7620-cf70-a1ebbf24e2df	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c3-7620-4cce-501e2e0f5485	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c3-7620-21e3-1f6dfaaf4c2c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c3-7620-3781-b93d5783ccb1	FI	FIN	246	Finland 	Finska	\N
00040000-55c3-7620-fb3a-32e30c344317	FR	FRA	250	France 	Francija	\N
00040000-55c3-7620-c700-686bfc0c8c2e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c3-7620-fb96-7cc2d06ab926	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c3-7620-5cce-4060ed854878	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c3-7620-db84-7908e760a3da	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c3-7620-1849-25bb3c550a90	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c3-7620-4227-814e99b8161d	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c3-7620-8e4c-253b351792f3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c3-7620-ec58-fad5f08758f2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c3-7620-a7be-5df4a4374355	GH	GHA	288	Ghana 	Gana	\N
00040000-55c3-7620-8756-f4a6f9edbae9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c3-7620-ae3f-4b3fc6b4ae71	GR	GRC	300	Greece 	Grčija	\N
00040000-55c3-7620-9ebe-00c814f18d3e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c3-7620-1cee-249b3ff7ad28	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c3-7620-7353-bd3f2953cf25	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c3-7620-57c6-f245a0bc3b89	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c3-7620-94f0-b78c8c9a5cab	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c3-7620-6ca4-c27b779653b4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c3-7620-c57b-cb862b790035	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c3-7620-f796-fe6f18d7e327	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c3-7620-874b-007e90d5fce2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c3-7620-6407-bd7d0a21bd54	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c3-7620-bd78-d14700dfa157	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c3-7620-056f-bfee6f8957c7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c3-7620-40f5-e869b35ba9f1	HN	HND	340	Honduras 	Honduras	\N
00040000-55c3-7620-dbcc-eff672b44538	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c3-7620-0f1c-e27994df7c32	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c3-7620-9635-b02ed6eb8861	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c3-7620-b1a8-8772d1029916	IN	IND	356	India 	Indija	\N
00040000-55c3-7620-7f2b-89432d5afd4f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c3-7620-5b78-73fcbaadce8f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c3-7620-b88c-6972fc685219	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c3-7620-c9fe-f29a0a114ccb	IE	IRL	372	Ireland 	Irska	\N
00040000-55c3-7620-22e9-7b8da71eda6d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c3-7620-b9ff-481a6d7d813e	IL	ISR	376	Israel 	Izrael	\N
00040000-55c3-7620-fb2a-e4ac5b3d67cb	IT	ITA	380	Italy 	Italija	\N
00040000-55c3-7620-199a-301715b14748	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c3-7620-a0df-7ee1befc35bc	JP	JPN	392	Japan 	Japonska	\N
00040000-55c3-7620-5c5f-2cda9577df44	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c3-7620-633a-6b73a5c07743	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c3-7620-8296-3091e248dffd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c3-7620-01e5-5cf43c9d197b	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c3-7620-6c37-ddd86d158599	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c3-7620-3445-945085286267	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c3-7620-ce7a-1ee1c22b8a01	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c3-7620-a482-4cad009967df	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c3-7620-1c91-c6688816a548	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c3-7620-becc-21e89abc838d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c3-7620-d9ff-ad7715bc9c1e	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c3-7620-08d0-c493b4e1215e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c3-7620-265c-0d7c5d147bf5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c3-7620-63c7-ac2e780b26d4	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c3-7620-f931-b3119a911ff6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c3-7620-8bfe-1844a23614ac	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c3-7620-290b-7712089c1130	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c3-7620-80cc-9bd261f156de	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c3-7620-5f78-67b35f15125d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c3-7620-6006-617a2b8d242d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c3-7620-ef0d-62f0c328d818	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c3-7620-4b41-de6b2e193f30	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c3-7620-c020-7b5150735379	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c3-7620-dd7c-6a9c4d6c4b77	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c3-7620-160a-3b9f98ea0cd7	ML	MLI	466	Mali 	Mali	\N
00040000-55c3-7620-af1b-e43456375d97	MT	MLT	470	Malta 	Malta	\N
00040000-55c3-7620-f011-f8b6ec19cdcf	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c3-7620-4b09-578c4bf759ce	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c3-7620-0e1f-107d4a4deb12	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c3-7620-3896-814a97140dce	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c3-7620-5ec7-eca4846e1fe0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c3-7620-9be6-be5d4c55227b	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c3-7620-6528-605b0738ee09	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c3-7620-e49a-96b3427b57e2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c3-7620-5b24-aa976593e116	MC	MCO	492	Monaco 	Monako	\N
00040000-55c3-7620-d8bb-13a7162ade09	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c3-7620-96e0-627dff45fbe4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c3-7620-2e59-8c12e6124001	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c3-7620-fd3d-39e2dc538eb1	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c3-7620-4c2a-411555b199a0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c3-7620-4d42-0d55af958b5c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c3-7620-dfaa-e15c78403927	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c3-7620-c6f7-881b9d85709a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c3-7620-cb47-a8c8fd4fa158	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c3-7620-7812-bf3c62f89a56	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c3-7620-7cda-1f771f1171e5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c3-7620-55c5-3785cdfb3796	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c3-7620-f0a6-53fbdc886200	NE	NER	562	Niger 	Niger 	\N
00040000-55c3-7620-2f49-7d1071bcded1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c3-7620-c998-24694dee50fc	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c3-7620-9636-74262ab033c5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c3-7620-b411-be1618b9e718	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c3-7620-6afc-59cbe86035f0	NO	NOR	578	Norway 	Norveška	\N
00040000-55c3-7620-126f-131ea9c9155e	OM	OMN	512	Oman 	Oman	\N
00040000-55c3-7620-1599-1e16fea6acaa	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c3-7620-837b-699e6257fae9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c3-7620-d212-c5c0ffdef199	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c3-7620-b548-880bed88c851	PA	PAN	591	Panama 	Panama	\N
00040000-55c3-7620-fd4a-8ddcf4acf0fa	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c3-7620-d82d-bf7799d640b6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c3-7620-a35c-49104f31413c	PE	PER	604	Peru 	Peru	\N
00040000-55c3-7620-b7e3-967ce4d9d44a	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c3-7620-2853-5d24e72ec923	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c3-7620-58ed-341d51360d98	PL	POL	616	Poland 	Poljska	\N
00040000-55c3-7620-f32c-36b9a2a07228	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c3-7620-ffd3-40c9723ce0e9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c3-7620-422b-5912d886979b	QA	QAT	634	Qatar 	Katar	\N
00040000-55c3-7620-f1ef-ac544198f904	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c3-7620-cfb0-7d8b06446a42	RO	ROU	642	Romania 	Romunija	\N
00040000-55c3-7620-7dff-c6fc47c2d774	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c3-7620-5e5d-721985836645	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c3-7620-7c6c-6816628e2bb3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c3-7620-6883-d32d1758ebc0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c3-7620-d9b4-f854495a0f30	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c3-7620-6d66-5f453160eb31	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c3-7620-1cc4-f43fdceb480c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c3-7620-1da9-f0e88fad4b4b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c3-7620-71f3-563f13a2e3df	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c3-7620-b0b1-51a57899396a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c3-7620-3392-0605e8d85dc6	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c3-7620-d78f-84bfa51083eb	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c3-7620-9659-d6db6d9ee634	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c3-7620-5cdc-6a2e3b047bf8	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c3-7620-1d11-ab4d8eecc892	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c3-7620-9c98-ce6d22d66c02	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c3-7620-32f1-f267829dc01b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c3-7620-2c82-b029bee7e34d	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c3-7620-e42d-03cd807ff39a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c3-7620-1b56-4ede9340b60b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c3-7620-6aa2-e776dc466f8a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c3-7620-36c6-2c672fb6c492	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c3-7620-9f07-ce8dc5c7bba4	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c3-7620-0184-a440e6362a48	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c3-7620-2fb7-6309fce07020	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c3-7620-b67b-4d981a20a4a6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c3-7620-7e5b-5a65d2005d9b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c3-7620-ab2e-62b781cf91c3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c3-7620-4686-8cd3e7e39ecf	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c3-7620-1031-6187c41904de	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c3-7620-6635-4a054670020e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c3-7620-4663-c202abc74321	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c3-7620-1af2-9a363e70a3df	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c3-7620-ee34-cd585cdce001	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c3-7620-1ea3-2c53eec19377	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c3-7620-1ee9-f28662b40a59	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c3-7620-aeac-140211b61382	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c3-7620-e163-cd115a51eb37	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c3-7620-b7c9-5d86fe52b1e8	TH	THA	764	Thailand 	Tajska	\N
00040000-55c3-7620-74c7-ca48d3377e64	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c3-7620-17d0-5d582a22c71a	TG	TGO	768	Togo 	Togo	\N
00040000-55c3-7620-64fc-eea396ae93b9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c3-7620-4680-647ce6fc380d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c3-7620-6df6-37435d2d9c8e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c3-7620-36f1-159e868974b5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c3-7620-23c9-c5ff8970a23f	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c3-7620-dc4b-67bd656abddd	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c3-7620-a3f7-c72abeeb1b84	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c3-7620-04cf-4dd5a392fa48	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c3-7620-20fa-26eb33e21aff	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c3-7620-3857-2c6b5b3417bc	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c3-7620-fffb-efcab4050028	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c3-7620-6be4-88a912738981	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c3-7620-844f-24362390708c	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c3-7620-903f-280885007003	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c3-7620-513b-f4eae228443f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c3-7620-ab4a-24af5491ebbc	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c3-7620-e35b-d11bf3e048af	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c3-7620-cc04-a90f7543ab81	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c3-7620-d5d2-31fc9438f60d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c3-7620-12ea-dd4eada4dec9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c3-7620-6f29-02e63bfefa83	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c3-7620-9120-127bbd7c9656	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c3-7620-7187-2d2748d98938	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c3-7620-9a87-8afae20bce9b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c3-7620-dedc-fd521f0ecc9d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c3-7620-7de2-b96f77fa9fd0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12316934)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55c3-7621-7892-de89d4f273ca	000e0000-55c3-7621-95e2-ff57093aef7f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	0.00	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c3-7620-38de-0f16055560fb	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c3-7621-3b33-217958571e24	000e0000-55c3-7621-217e-38a82ee8bc00	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c3-7620-ef68-656c3be50bb3	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c3-7621-15e4-f777a50b25b6	000e0000-55c3-7621-3684-bbe6e18d781b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c3-7620-38de-0f16055560fb	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c3-7622-ffa6-3208734a4d19	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c3-7622-b93c-c8d7e76858b2	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12316761)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c3-7621-0674-94bd72a9707a	000e0000-55c3-7621-217e-38a82ee8bc00	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c3-7620-03d4-3d53a0e4f31d
000d0000-55c3-7621-0a76-bedaff0038bd	000e0000-55c3-7621-217e-38a82ee8bc00	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c3-7620-03d4-3d53a0e4f31d
000d0000-55c3-7621-51a1-5ba8bc96df43	000e0000-55c3-7621-217e-38a82ee8bc00	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c3-7620-eff0-d49dde3fb050
000d0000-55c3-7621-e17e-f0d3bbc2b9fb	000e0000-55c3-7621-217e-38a82ee8bc00	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c3-7620-f722-9514f35dee01
000d0000-55c3-7621-ec67-c960a669192a	000e0000-55c3-7621-217e-38a82ee8bc00	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c3-7620-0414-04b86bd5fcc0
000d0000-55c3-7621-66ec-1eb5747cb99f	000e0000-55c3-7621-217e-38a82ee8bc00	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c3-7620-fa64-f8ca3ab78f81
000d0000-55c3-7621-c75f-45b4531430d0	000e0000-55c3-7621-217e-38a82ee8bc00	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c3-7620-03d4-3d53a0e4f31d
000d0000-55c3-7621-2a00-689468353f42	000e0000-55c3-7621-217e-38a82ee8bc00	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c3-7620-ea8c-9dee7ef252d1
\.


--
-- TOC entry 3010 (class 0 OID 12316577)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12316625)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12316557)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c3-7621-8ac0-00990fe909da	00080000-55c3-7621-9aaa-ea88867bba8c	00090000-55c3-7621-f5b2-9a889ddec932	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12316678)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12317145)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12317157)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12317180)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12316703)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12316514)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c3-7620-d9fa-b85e9697649a	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c3-7620-e87f-bcd1b3441a5a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c3-7620-9867-80a6500d53ec	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c3-7620-d449-dea7f69ea806	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c3-7620-5f61-54cc944cf62a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c3-7620-7120-43b67486547b	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c3-7620-3dd5-cf27c467f0a6	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c3-7620-8b89-16a7d20f104f	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c3-7620-46b6-7553a65d5c4c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c3-7620-213a-abc985eab2d1	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c3-7620-f876-47c2ab096fe0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c3-7620-c4b4-d3fa01285f2e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c3-7620-8fe9-73d6ee507274	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c3-7620-c3ee-3669b573fa0c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c3-7621-137e-55b5f90a7861	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c3-7621-9ece-ca01aba9e3cb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c3-7621-0500-b3103170f940	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c3-7621-438d-713071639f9b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c3-7621-20ba-345aa5efbd73	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c3-7621-02f2-9fc34b252008	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12316427)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c3-7621-6258-4681d92539d3	00000000-55c3-7621-9ece-ca01aba9e3cb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c3-7621-dc3f-0755b425cdf9	00000000-55c3-7621-9ece-ca01aba9e3cb	00010000-55c3-7620-f0a2-2bf224f7875f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c3-7621-c356-8111e375f951	00000000-55c3-7621-0500-b3103170f940	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12316438)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c3-7621-28f7-e8268234f78b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c3-7621-7792-88cc9baca551	00010000-55c3-7621-7796-a182dfc286e5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c3-7621-324d-3fa6ddecd83d	00010000-55c3-7621-9e22-61729415b091	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c3-7621-e05b-82674dd30c29	00010000-55c3-7621-b96c-9b87e4b6483a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c3-7621-9c0d-279d8d3566f7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c3-7621-294e-8b67344c9267	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c3-7621-35bb-4a8763e26ede	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c3-7621-ad9e-b2180076ff83	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c3-7621-f5b2-9a889ddec932	00010000-55c3-7621-6d42-2228ba78bf29	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c3-7621-bda8-8e84109f1e81	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c3-7621-a614-08537992154f	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c3-7621-4b04-b1a2bce0b297	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c3-7621-b018-57f211c13304	00010000-55c3-7621-519d-8d293563c847	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12316392)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c3-7620-a3bd-f1ee844501b1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c3-7620-bdff-00a0bf0552c4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c3-7620-9b53-b7e530ac0b63	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c3-7620-1497-66bb442ac0a2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c3-7620-bfec-da687a3d4e31	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c3-7620-f66e-cef84415ed9c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c3-7620-1f34-3ca981e92d68	Abonma-read	Abonma - branje	f
00030000-55c3-7620-6454-8fb7aee82256	Abonma-write	Abonma - spreminjanje	f
00030000-55c3-7620-181d-370efca57d51	Alternacija-read	Alternacija - branje	f
00030000-55c3-7620-17b5-ab77076a9ffd	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c3-7620-6b41-3d4617c3af91	Arhivalija-read	Arhivalija - branje	f
00030000-55c3-7620-2fe7-d3db5a0bd2ba	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c3-7620-687a-c3699562d249	Besedilo-read	Besedilo - branje	f
00030000-55c3-7620-0027-3ee1de4b93b4	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c3-7620-9f5c-b72c0e3e2408	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c3-7620-4aff-a18f88310674	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c3-7620-0abe-a07fe2e81d1c	Dogodek-read	Dogodek - branje	f
00030000-55c3-7620-1d97-324dec2c4a5c	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c3-7620-dfa8-711980f412e9	DrugiVir-read	DrugiVir - branje	f
00030000-55c3-7620-ead6-32f3ec937a8b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c3-7620-4ff0-52c2599880dd	Drzava-read	Drzava - branje	f
00030000-55c3-7620-ead8-51ff1aa0b8c8	Drzava-write	Drzava - spreminjanje	f
00030000-55c3-7620-8f6a-351cf99765f2	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c3-7620-58ac-f6188d99effa	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c3-7620-7b43-3e53a723720f	Funkcija-read	Funkcija - branje	f
00030000-55c3-7620-ad34-88f9a1faae03	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c3-7620-efef-48ea1aee3af0	Gostovanje-read	Gostovanje - branje	f
00030000-55c3-7620-1a1e-63564c2f04d5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c3-7620-9940-8fd01d6473a8	Gostujoca-read	Gostujoca - branje	f
00030000-55c3-7620-beae-2776a65028b9	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c3-7620-3c47-cff81e74b1a8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c3-7620-b469-86b9a55d38ea	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c3-7620-183a-bddc242944a1	Kupec-read	Kupec - branje	f
00030000-55c3-7620-119c-d74174aac33a	Kupec-write	Kupec - spreminjanje	f
00030000-55c3-7620-1e14-fcb39014dded	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c3-7620-7a7e-0f1fe40a9f63	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c3-7620-1fe7-3c5f305c21f9	Option-read	Option - branje	f
00030000-55c3-7620-b298-bdb390efaf64	Option-write	Option - spreminjanje	f
00030000-55c3-7620-abe1-bfaee3d9584a	OptionValue-read	OptionValue - branje	f
00030000-55c3-7620-daa3-9cb5350057f1	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c3-7620-01b5-da3b8adf5027	Oseba-read	Oseba - branje	f
00030000-55c3-7620-67e1-cf07a44f498e	Oseba-write	Oseba - spreminjanje	f
00030000-55c3-7620-2be9-2904f876073b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c3-7620-4750-3d17960a93d3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c3-7620-ae32-f52742791057	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c3-7620-c351-0f8681244c8f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c3-7620-6c22-042ff193a6c2	Pogodba-read	Pogodba - branje	f
00030000-55c3-7620-43a0-19aab6a6c51f	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c3-7620-6282-5ecaf37254d8	Popa-read	Popa - branje	f
00030000-55c3-7620-b84b-524f0f44b2bc	Popa-write	Popa - spreminjanje	f
00030000-55c3-7620-1d32-053609fdb252	Posta-read	Posta - branje	f
00030000-55c3-7620-0c09-39ee40455115	Posta-write	Posta - spreminjanje	f
00030000-55c3-7620-235d-65814dfd5091	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c3-7620-0622-111a18dff9a5	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c3-7620-1e3e-234c94087573	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c3-7620-fbff-bc39718e710d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c3-7620-d87b-cb77a36d8159	Predstava-read	Predstava - branje	f
00030000-55c3-7620-68a6-bb48bad8f3f8	Predstava-write	Predstava - spreminjanje	f
00030000-55c3-7620-fcc5-442c0ddf68e6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c3-7620-fe22-408e1f97be8d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c3-7620-6899-3f8024b36e01	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c3-7620-cec9-b812e3a36107	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c3-7620-1902-e2d6f403e44b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c3-7620-5a88-2a51c05713e3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c3-7620-221e-56786cc7dad8	ProgramDela-read	ProgramDela - branje	f
00030000-55c3-7620-a0fc-dee310345f94	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c3-7620-4740-f99df9239fa6	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c3-7620-940b-497000fd1a1e	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c3-7620-a181-52552aad36d5	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c3-7620-91e3-60de73025e04	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c3-7620-1fb4-331a23839d60	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c3-7620-0c27-66096bcf51bd	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c3-7620-57a3-8f8d16b50472	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c3-7620-1084-414ac878f47f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c3-7620-3399-e2f76cec8593	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c3-7620-34d8-66813f172422	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c3-7620-8205-f139b184ec0c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c3-7620-bc47-07c3676f1828	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c3-7620-0847-5bb3096728ca	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c3-7620-8dd3-764cd4d005b1	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c3-7620-8ea4-15ab0dfee2cc	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c3-7620-343c-291881f437c2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c3-7620-f4ea-b91e1324e80a	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c3-7620-1687-4c932470d3d0	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c3-7620-b8f9-936edc097146	Prostor-read	Prostor - branje	f
00030000-55c3-7620-6ade-a0e2910f31f1	Prostor-write	Prostor - spreminjanje	f
00030000-55c3-7620-4ab4-b56bcec33545	Racun-read	Racun - branje	f
00030000-55c3-7620-0d19-6d60c46e0d10	Racun-write	Racun - spreminjanje	f
00030000-55c3-7620-4a25-e412bc3cd028	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c3-7620-356a-9b35f1625353	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c3-7620-bd44-01e25e426456	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c3-7620-69d8-c377e1dc9477	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c3-7620-1769-d65a633cda9d	Rekvizit-read	Rekvizit - branje	f
00030000-55c3-7620-0010-9223eab66738	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c3-7620-6405-d25701c8987f	Revizija-read	Revizija - branje	f
00030000-55c3-7620-fe3a-f0eadfecee0d	Revizija-write	Revizija - spreminjanje	f
00030000-55c3-7620-165f-59db304e059c	Rezervacija-read	Rezervacija - branje	f
00030000-55c3-7620-f1eb-34e639cd203e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c3-7620-a693-cf7de94b3030	SedezniRed-read	SedezniRed - branje	f
00030000-55c3-7620-1b7b-9d62e581ee42	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c3-7620-7912-3fbe4f300a8b	Sedez-read	Sedez - branje	f
00030000-55c3-7620-0a62-0a8d9fa42e03	Sedez-write	Sedez - spreminjanje	f
00030000-55c3-7620-5fde-da409fe6699d	Sezona-read	Sezona - branje	f
00030000-55c3-7620-75ce-56bc83a5b72a	Sezona-write	Sezona - spreminjanje	f
00030000-55c3-7620-6728-8fc6cdd3bb30	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c3-7620-738d-c7daac39c996	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c3-7620-9d2b-02bfe33134f3	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c3-7620-b029-d72f08663e8b	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c3-7620-b1ab-dc0b2bad9630	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c3-7620-92ab-922f6296ebca	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c3-7620-8482-f7c3dbbb0728	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c3-7620-b6fb-77e542a62883	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c3-7620-6077-3fec5324db46	Telefonska-read	Telefonska - branje	f
00030000-55c3-7620-2cdc-dd773a5c599d	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c3-7620-2ae5-ea5a674acfb2	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c3-7620-7646-7adde10dc977	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c3-7620-3cbf-b3388bd9a91e	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c3-7620-9981-c2039f13a5ab	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c3-7620-b5c3-68ed165ff9ac	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c3-7620-a1b0-29574d5c0f29	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c3-7620-fba2-2b6085770eab	Trr-read	Trr - branje	f
00030000-55c3-7620-7c47-0774b17aed5f	Trr-write	Trr - spreminjanje	f
00030000-55c3-7620-589b-be85e01b39b8	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c3-7620-74a6-3e05f44543eb	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c3-7620-1752-e3947a791a4f	Vaja-read	Vaja - branje	f
00030000-55c3-7620-ae64-a51151057d2a	Vaja-write	Vaja - spreminjanje	f
00030000-55c3-7620-bf7e-975ca0ed8f83	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c3-7620-4526-1a3a548eb9cd	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c3-7620-591a-564ca546f3ea	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c3-7620-8000-56061c9aacbe	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c3-7620-a569-6a390bdd55ad	Zasedenost-read	Zasedenost - branje	f
00030000-55c3-7620-ed86-acd749d42021	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c3-7620-a422-af86f4d08564	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c3-7620-a7d4-657bbb5e4fa8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c3-7620-a5bd-a7249f973515	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c3-7620-e041-c5765b9af37b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c3-7620-b13b-32becddfc4a2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c3-7620-3df9-d1ec88f1b173	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c3-7620-d428-44ecb7ea8d02	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c3-7620-ec90-bf492ba429c8	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c3-7620-d8b2-de383762e1ea	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c3-7620-bbb8-8f5c32d6da88	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c3-7620-e8dc-ab5a5f4553f3	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c3-7620-f80b-da5de3dc1a68	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c3-7620-b137-64a0111532c7	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c3-7620-fb10-4010fe871764	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c3-7620-7751-0d53d0dbb5b3	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c3-7620-4479-3fb75fe85c5a	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 12316411)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c3-7620-5710-b4a4cd5ca9fc	00030000-55c3-7620-bdff-00a0bf0552c4
00020000-55c3-7620-168e-4cacc80b3f87	00030000-55c3-7620-4ff0-52c2599880dd
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1f34-3ca981e92d68
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-6454-8fb7aee82256
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-181d-370efca57d51
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-17b5-ab77076a9ffd
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-6b41-3d4617c3af91
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-0abe-a07fe2e81d1c
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1497-66bb442ac0a2
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1d97-324dec2c4a5c
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-4ff0-52c2599880dd
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-ead8-51ff1aa0b8c8
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-7b43-3e53a723720f
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-ad34-88f9a1faae03
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-efef-48ea1aee3af0
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1a1e-63564c2f04d5
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-9940-8fd01d6473a8
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-beae-2776a65028b9
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-3c47-cff81e74b1a8
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-b469-86b9a55d38ea
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1fe7-3c5f305c21f9
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-abe1-bfaee3d9584a
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-01b5-da3b8adf5027
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-67e1-cf07a44f498e
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-6282-5ecaf37254d8
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-b84b-524f0f44b2bc
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1d32-053609fdb252
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-0c09-39ee40455115
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1e3e-234c94087573
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-fbff-bc39718e710d
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-d87b-cb77a36d8159
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-68a6-bb48bad8f3f8
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1902-e2d6f403e44b
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-5a88-2a51c05713e3
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-b8f9-936edc097146
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-6ade-a0e2910f31f1
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-bd44-01e25e426456
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-69d8-c377e1dc9477
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1769-d65a633cda9d
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-0010-9223eab66738
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-5fde-da409fe6699d
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-75ce-56bc83a5b72a
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-3cbf-b3388bd9a91e
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-589b-be85e01b39b8
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-74a6-3e05f44543eb
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-1752-e3947a791a4f
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-ae64-a51151057d2a
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-a569-6a390bdd55ad
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-ed86-acd749d42021
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-a422-af86f4d08564
00020000-55c3-7620-5fda-04c09dcc53be	00030000-55c3-7620-a5bd-a7249f973515
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-1f34-3ca981e92d68
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-6b41-3d4617c3af91
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-0abe-a07fe2e81d1c
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-4ff0-52c2599880dd
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-efef-48ea1aee3af0
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-9940-8fd01d6473a8
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-3c47-cff81e74b1a8
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-b469-86b9a55d38ea
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-1fe7-3c5f305c21f9
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-abe1-bfaee3d9584a
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-01b5-da3b8adf5027
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-67e1-cf07a44f498e
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-6282-5ecaf37254d8
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-1d32-053609fdb252
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-1e3e-234c94087573
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-fbff-bc39718e710d
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-d87b-cb77a36d8159
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-b8f9-936edc097146
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-bd44-01e25e426456
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-1769-d65a633cda9d
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-5fde-da409fe6699d
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-6077-3fec5324db46
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-2cdc-dd773a5c599d
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-fba2-2b6085770eab
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-7c47-0774b17aed5f
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-591a-564ca546f3ea
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-8000-56061c9aacbe
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-a422-af86f4d08564
00020000-55c3-7620-eefd-dbe4fe14d761	00030000-55c3-7620-a5bd-a7249f973515
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-1f34-3ca981e92d68
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-181d-370efca57d51
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-6b41-3d4617c3af91
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-2fe7-d3db5a0bd2ba
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-687a-c3699562d249
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-9f5c-b72c0e3e2408
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-0abe-a07fe2e81d1c
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-4ff0-52c2599880dd
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-7b43-3e53a723720f
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-efef-48ea1aee3af0
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-9940-8fd01d6473a8
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-3c47-cff81e74b1a8
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-1fe7-3c5f305c21f9
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-abe1-bfaee3d9584a
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-01b5-da3b8adf5027
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-6282-5ecaf37254d8
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-1d32-053609fdb252
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-d87b-cb77a36d8159
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-1902-e2d6f403e44b
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-b8f9-936edc097146
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-bd44-01e25e426456
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-1769-d65a633cda9d
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-5fde-da409fe6699d
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-3cbf-b3388bd9a91e
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-1752-e3947a791a4f
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-a569-6a390bdd55ad
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-a422-af86f4d08564
00020000-55c3-7620-25bb-ac91a20caca6	00030000-55c3-7620-a5bd-a7249f973515
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-1f34-3ca981e92d68
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-6454-8fb7aee82256
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-17b5-ab77076a9ffd
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-6b41-3d4617c3af91
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-0abe-a07fe2e81d1c
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-4ff0-52c2599880dd
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-efef-48ea1aee3af0
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-9940-8fd01d6473a8
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-1fe7-3c5f305c21f9
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-abe1-bfaee3d9584a
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-6282-5ecaf37254d8
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-1d32-053609fdb252
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-d87b-cb77a36d8159
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-b8f9-936edc097146
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-bd44-01e25e426456
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-1769-d65a633cda9d
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-5fde-da409fe6699d
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-3cbf-b3388bd9a91e
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-a422-af86f4d08564
00020000-55c3-7620-3c27-7ba1068507ae	00030000-55c3-7620-a5bd-a7249f973515
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-1f34-3ca981e92d68
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-6b41-3d4617c3af91
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-0abe-a07fe2e81d1c
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-4ff0-52c2599880dd
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-efef-48ea1aee3af0
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-9940-8fd01d6473a8
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-1fe7-3c5f305c21f9
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-abe1-bfaee3d9584a
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-6282-5ecaf37254d8
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-1d32-053609fdb252
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-d87b-cb77a36d8159
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-b8f9-936edc097146
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-bd44-01e25e426456
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-1769-d65a633cda9d
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-5fde-da409fe6699d
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-2ae5-ea5a674acfb2
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-9b53-b7e530ac0b63
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-3cbf-b3388bd9a91e
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-a422-af86f4d08564
00020000-55c3-7620-0bf5-e1ad743a4028	00030000-55c3-7620-a5bd-a7249f973515
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a3bd-f1ee844501b1
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-bdff-00a0bf0552c4
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-9b53-b7e530ac0b63
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1497-66bb442ac0a2
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-bfec-da687a3d4e31
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-f66e-cef84415ed9c
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1f34-3ca981e92d68
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6454-8fb7aee82256
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-181d-370efca57d51
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-17b5-ab77076a9ffd
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6b41-3d4617c3af91
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-2fe7-d3db5a0bd2ba
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-687a-c3699562d249
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0027-3ee1de4b93b4
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-9f5c-b72c0e3e2408
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-4aff-a18f88310674
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0abe-a07fe2e81d1c
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1d97-324dec2c4a5c
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-4ff0-52c2599880dd
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-ead8-51ff1aa0b8c8
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-dfa8-711980f412e9
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-ead6-32f3ec937a8b
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-8f6a-351cf99765f2
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-58ac-f6188d99effa
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-7b43-3e53a723720f
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-ad34-88f9a1faae03
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-efef-48ea1aee3af0
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1a1e-63564c2f04d5
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-9940-8fd01d6473a8
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-beae-2776a65028b9
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-3c47-cff81e74b1a8
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-b469-86b9a55d38ea
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-183a-bddc242944a1
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-119c-d74174aac33a
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1e14-fcb39014dded
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-7a7e-0f1fe40a9f63
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1fe7-3c5f305c21f9
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-b298-bdb390efaf64
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-abe1-bfaee3d9584a
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-daa3-9cb5350057f1
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-01b5-da3b8adf5027
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-67e1-cf07a44f498e
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-2be9-2904f876073b
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-4750-3d17960a93d3
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-ae32-f52742791057
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-c351-0f8681244c8f
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6c22-042ff193a6c2
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-43a0-19aab6a6c51f
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6282-5ecaf37254d8
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-b84b-524f0f44b2bc
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1d32-053609fdb252
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0c09-39ee40455115
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-235d-65814dfd5091
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0622-111a18dff9a5
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1e3e-234c94087573
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-fbff-bc39718e710d
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-d87b-cb77a36d8159
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-68a6-bb48bad8f3f8
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-fcc5-442c0ddf68e6
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-fe22-408e1f97be8d
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6899-3f8024b36e01
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-cec9-b812e3a36107
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1902-e2d6f403e44b
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-5a88-2a51c05713e3
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-221e-56786cc7dad8
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a0fc-dee310345f94
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-4740-f99df9239fa6
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-940b-497000fd1a1e
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a181-52552aad36d5
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-91e3-60de73025e04
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1fb4-331a23839d60
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0c27-66096bcf51bd
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-57a3-8f8d16b50472
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1084-414ac878f47f
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-3399-e2f76cec8593
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-34d8-66813f172422
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-8205-f139b184ec0c
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-bc47-07c3676f1828
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0847-5bb3096728ca
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-8dd3-764cd4d005b1
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-8ea4-15ab0dfee2cc
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-343c-291881f437c2
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-f4ea-b91e1324e80a
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1687-4c932470d3d0
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-b8f9-936edc097146
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6ade-a0e2910f31f1
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-4ab4-b56bcec33545
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0d19-6d60c46e0d10
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-4a25-e412bc3cd028
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-356a-9b35f1625353
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-bd44-01e25e426456
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-69d8-c377e1dc9477
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1769-d65a633cda9d
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0010-9223eab66738
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6405-d25701c8987f
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-fe3a-f0eadfecee0d
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-165f-59db304e059c
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-f1eb-34e639cd203e
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a693-cf7de94b3030
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1b7b-9d62e581ee42
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-7912-3fbe4f300a8b
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-0a62-0a8d9fa42e03
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-5fde-da409fe6699d
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-75ce-56bc83a5b72a
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6728-8fc6cdd3bb30
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-738d-c7daac39c996
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-9d2b-02bfe33134f3
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-b029-d72f08663e8b
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-b1ab-dc0b2bad9630
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-92ab-922f6296ebca
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-8482-f7c3dbbb0728
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-b6fb-77e542a62883
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-6077-3fec5324db46
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-2cdc-dd773a5c599d
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-2ae5-ea5a674acfb2
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-7646-7adde10dc977
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-3cbf-b3388bd9a91e
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-9981-c2039f13a5ab
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-b5c3-68ed165ff9ac
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a1b0-29574d5c0f29
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-fba2-2b6085770eab
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-7c47-0774b17aed5f
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-589b-be85e01b39b8
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-74a6-3e05f44543eb
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-1752-e3947a791a4f
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-ae64-a51151057d2a
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-bf7e-975ca0ed8f83
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-4526-1a3a548eb9cd
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-591a-564ca546f3ea
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-8000-56061c9aacbe
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a569-6a390bdd55ad
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-ed86-acd749d42021
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a422-af86f4d08564
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a7d4-657bbb5e4fa8
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-a5bd-a7249f973515
00020000-55c3-7621-36aa-6b0eba451bc1	00030000-55c3-7620-e041-c5765b9af37b
\.


--
-- TOC entry 3025 (class 0 OID 12316710)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12316741)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12316855)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c3-7621-1a6a-77bdfceb3a20	00090000-55c3-7621-28f7-e8268234f78b	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c3-7621-895e-3cf6143bf0f7	00090000-55c3-7621-294e-8b67344c9267	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c3-7621-5b7b-9e88ae643e26	00090000-55c3-7621-b018-57f211c13304	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12316471)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c3-7621-9aaa-ea88867bba8c	00040000-55c3-7620-6aa2-e776dc466f8a	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-7621-46fa-53cdb0a52d61	00040000-55c3-7620-6aa2-e776dc466f8a	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c3-7621-4f71-e35b85d15c02	00040000-55c3-7620-6aa2-e776dc466f8a	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-7621-91c5-3d29f1d66ca7	00040000-55c3-7620-6aa2-e776dc466f8a	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-7621-30b7-1e53e68b8642	00040000-55c3-7620-6aa2-e776dc466f8a	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-7621-4423-c3287f82fb3c	00040000-55c3-7620-e3c7-85e8819395cd	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-7621-5c2b-9401954d6dd8	00040000-55c3-7620-2bc0-65f48f852290	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-7621-b36a-679b4df0afb5	00040000-55c3-7620-e791-c1a2c71f9646	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c3-7621-1e85-9ffd8872a415	00040000-55c3-7620-6aa2-e776dc466f8a	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12316506)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c3-7620-e0e6-bd08319ab66b	8341	Adlešiči
00050000-55c3-7620-800b-b2232ec14ce2	5270	Ajdovščina
00050000-55c3-7620-d2e5-c30d95657343	6280	Ankaran/Ancarano
00050000-55c3-7620-e37e-8699b92790f4	9253	Apače
00050000-55c3-7620-0d5c-a5ca86f5baeb	8253	Artiče
00050000-55c3-7620-c542-e3a628f59da3	4275	Begunje na Gorenjskem
00050000-55c3-7620-8854-456722933c9f	1382	Begunje pri Cerknici
00050000-55c3-7620-c5fd-f40dd588b8fa	9231	Beltinci
00050000-55c3-7620-3c8b-d2c2957bb19d	2234	Benedikt
00050000-55c3-7620-d824-bd3350a359ae	2345	Bistrica ob Dravi
00050000-55c3-7620-2e72-b2ecb2bfb7e2	3256	Bistrica ob Sotli
00050000-55c3-7620-ae9e-3b8e7018fec2	8259	Bizeljsko
00050000-55c3-7620-45dc-6a217f78a358	1223	Blagovica
00050000-55c3-7620-6b93-3cb887129f15	8283	Blanca
00050000-55c3-7620-de5c-4bbfd1cdd54c	4260	Bled
00050000-55c3-7620-bb72-57acc1e4651a	4273	Blejska Dobrava
00050000-55c3-7620-9a14-6efeb18f9b23	9265	Bodonci
00050000-55c3-7620-11b1-f45f4e190ec1	9222	Bogojina
00050000-55c3-7620-fb91-b9a069e899f5	4263	Bohinjska Bela
00050000-55c3-7620-52cf-2210202f811b	4264	Bohinjska Bistrica
00050000-55c3-7620-679e-2acbdef75966	4265	Bohinjsko jezero
00050000-55c3-7620-33be-80bd20c045b6	1353	Borovnica
00050000-55c3-7620-2778-450bc9132a30	8294	Boštanj
00050000-55c3-7620-3cc1-0105d305a69c	5230	Bovec
00050000-55c3-7620-18c5-27f3d4289843	5295	Branik
00050000-55c3-7620-af01-e067af57649c	3314	Braslovče
00050000-55c3-7620-c7e5-1551e3516ecf	5223	Breginj
00050000-55c3-7620-5aaa-c089d41bf38c	8280	Brestanica
00050000-55c3-7620-3fcf-3f3f9c836b82	2354	Bresternica
00050000-55c3-7620-6f53-56a2b30b3a59	4243	Brezje
00050000-55c3-7620-e04a-33448bb33168	1351	Brezovica pri Ljubljani
00050000-55c3-7620-4dee-507232e3c121	8250	Brežice
00050000-55c3-7620-829a-a3f0922b0dfe	4210	Brnik - Aerodrom
00050000-55c3-7620-bc0c-f2bd8c32527e	8321	Brusnice
00050000-55c3-7620-78fe-90807f4a6ae7	3255	Buče
00050000-55c3-7620-510a-13e5c7e8b392	8276	Bučka 
00050000-55c3-7620-3245-3bb689ce7e1c	9261	Cankova
00050000-55c3-7620-a50d-d1d39729baa0	3000	Celje 
00050000-55c3-7620-e167-f898b3697140	3001	Celje - poštni predali
00050000-55c3-7620-1187-d941949c1f9b	4207	Cerklje na Gorenjskem
00050000-55c3-7620-e3e2-99212efb0c97	8263	Cerklje ob Krki
00050000-55c3-7620-48b4-8ca9627df031	1380	Cerknica
00050000-55c3-7620-d0c5-7e4a5933f1a7	5282	Cerkno
00050000-55c3-7620-59f8-0d0aedb383dc	2236	Cerkvenjak
00050000-55c3-7620-ed34-9a8435aa5663	2215	Ceršak
00050000-55c3-7620-ff6e-77bed43cce38	2326	Cirkovce
00050000-55c3-7620-55aa-443cd06c4e11	2282	Cirkulane
00050000-55c3-7620-d819-a8a88beea8d5	5273	Col
00050000-55c3-7620-ae2d-699c0084f4a1	8251	Čatež ob Savi
00050000-55c3-7620-c8ab-70e8edc8e8b7	1413	Čemšenik
00050000-55c3-7620-9453-60c3a8870095	5253	Čepovan
00050000-55c3-7620-6be9-7974ee6d29cf	9232	Črenšovci
00050000-55c3-7620-0144-33f6f92c8f3a	2393	Črna na Koroškem
00050000-55c3-7620-8177-8af64ee0d291	6275	Črni Kal
00050000-55c3-7620-6c3b-32bdc97cba9f	5274	Črni Vrh nad Idrijo
00050000-55c3-7620-f4f4-2a03d66dcbfa	5262	Črniče
00050000-55c3-7620-a672-e6a4f4cf6d29	8340	Črnomelj
00050000-55c3-7620-3693-ab0614b9d514	6271	Dekani
00050000-55c3-7620-807d-91395ef8441b	5210	Deskle
00050000-55c3-7620-4c9b-4f920ada1d92	2253	Destrnik
00050000-55c3-7620-594e-c3134368111c	6215	Divača
00050000-55c3-7620-3bbf-50c6b57ef561	1233	Dob
00050000-55c3-7620-9150-2b7fe212994e	3224	Dobje pri Planini
00050000-55c3-7620-3b46-5bff58a529c4	8257	Dobova
00050000-55c3-7620-1ea5-fd3970674698	1423	Dobovec
00050000-55c3-7620-f198-996a861d826d	5263	Dobravlje
00050000-55c3-7620-a22b-755eaf022e92	3204	Dobrna
00050000-55c3-7620-c698-0fbb4f6e222f	8211	Dobrnič
00050000-55c3-7620-b800-4f99714d2e14	1356	Dobrova
00050000-55c3-7620-718b-a507996dddc0	9223	Dobrovnik/Dobronak 
00050000-55c3-7620-acf7-efe7fcd63d42	5212	Dobrovo v Brdih
00050000-55c3-7620-4910-009bb7eb3f5d	1431	Dol pri Hrastniku
00050000-55c3-7620-efbb-a9bcd5e2576a	1262	Dol pri Ljubljani
00050000-55c3-7620-6d27-fe615fdf5788	1273	Dole pri Litiji
00050000-55c3-7620-ba05-310e997da563	1331	Dolenja vas
00050000-55c3-7620-bb78-b6ad281164aa	8350	Dolenjske Toplice
00050000-55c3-7620-1b18-fde1feddfce4	1230	Domžale
00050000-55c3-7620-8b06-ab4a8bf9867f	2252	Dornava
00050000-55c3-7620-1c1a-11dadd593fe4	5294	Dornberk
00050000-55c3-7620-77ce-25b6fea0cf62	1319	Draga
00050000-55c3-7620-a13c-82893177d97e	8343	Dragatuš
00050000-55c3-7620-f4f6-4944cf840f91	3222	Dramlje
00050000-55c3-7620-44e4-9bee0896ae92	2370	Dravograd
00050000-55c3-7620-29ba-78e810d66990	4203	Duplje
00050000-55c3-7620-0683-b109c908c39c	6221	Dutovlje
00050000-55c3-7620-e2ce-c9c391ac0b94	8361	Dvor
00050000-55c3-7620-35df-ee1423def3e7	2343	Fala
00050000-55c3-7620-0642-7b9dfa70aec6	9208	Fokovci
00050000-55c3-7620-a0d4-1db1fb50ac0f	2313	Fram
00050000-55c3-7620-5c81-7d68e6707c81	3213	Frankolovo
00050000-55c3-7620-8bad-21e0cc7f3dd2	1274	Gabrovka
00050000-55c3-7620-08d3-548e41820e3c	8254	Globoko
00050000-55c3-7620-0b8b-5a0500dfd5f8	5275	Godovič
00050000-55c3-7620-f387-d90fce108c87	4204	Golnik
00050000-55c3-7620-1c1f-5ce3345d0698	3303	Gomilsko
00050000-55c3-7620-4b23-03c9d0ab4c10	4224	Gorenja vas
00050000-55c3-7620-f7ba-da654dae4426	3263	Gorica pri Slivnici
00050000-55c3-7620-9c25-159e53507541	2272	Gorišnica
00050000-55c3-7620-2ce5-adeeaa30575f	9250	Gornja Radgona
00050000-55c3-7620-02e5-c4dfeb3bafb8	3342	Gornji Grad
00050000-55c3-7620-0540-92b5366c2ee2	4282	Gozd Martuljek
00050000-55c3-7620-704d-f24dfad1f3ac	6272	Gračišče
00050000-55c3-7620-ceb3-178ddd9b32d3	9264	Grad
00050000-55c3-7620-b1ac-cbcaf4bba526	8332	Gradac
00050000-55c3-7620-4bae-47d67c4307df	1384	Grahovo
00050000-55c3-7620-ccff-7d154af0be55	5242	Grahovo ob Bači
00050000-55c3-7620-f0dc-02a91b8f8cae	5251	Grgar
00050000-55c3-7620-f0fd-689e3b389eab	3302	Griže
00050000-55c3-7620-c9af-b093d38c1c87	3231	Grobelno
00050000-55c3-7620-cadc-6effc5fcadba	1290	Grosuplje
00050000-55c3-7620-3c58-991a41a338a8	2288	Hajdina
00050000-55c3-7620-9d96-fcf818e390f8	8362	Hinje
00050000-55c3-7620-8c8d-7412c7df9b20	2311	Hoče
00050000-55c3-7620-67b4-117e4cd72166	9205	Hodoš/Hodos
00050000-55c3-7620-7f51-dc8f5900c518	1354	Horjul
00050000-55c3-7620-0cc7-ca443d2d4ebb	1372	Hotedršica
00050000-55c3-7620-80af-d2f1bb5c1151	1430	Hrastnik
00050000-55c3-7620-4dae-d405b76edf8a	6225	Hruševje
00050000-55c3-7620-a85c-ba1b2b24d682	4276	Hrušica
00050000-55c3-7620-79ce-30dc51cdf62f	5280	Idrija
00050000-55c3-7620-587e-56dcaf9118ae	1292	Ig
00050000-55c3-7620-b57c-0df65402d9e9	6250	Ilirska Bistrica
00050000-55c3-7620-7863-4ae977abcf20	6251	Ilirska Bistrica-Trnovo
00050000-55c3-7620-69a7-5017e6f486ce	1295	Ivančna Gorica
00050000-55c3-7620-47db-1fba499ee919	2259	Ivanjkovci
00050000-55c3-7620-f702-aef9efac09bc	1411	Izlake
00050000-55c3-7620-9d3d-770e9c182be0	6310	Izola/Isola
00050000-55c3-7620-d386-3446df23a7bf	2222	Jakobski Dol
00050000-55c3-7620-1bd7-a9e73d816dd8	2221	Jarenina
00050000-55c3-7620-29c8-0ea960e755d6	6254	Jelšane
00050000-55c3-7620-a921-a6cec4542c79	4270	Jesenice
00050000-55c3-7620-008e-f68787cef054	8261	Jesenice na Dolenjskem
00050000-55c3-7620-be39-fcd675ff792c	3273	Jurklošter
00050000-55c3-7620-00f4-856ebf4e4534	2223	Jurovski Dol
00050000-55c3-7620-951a-c8865c5b95ef	2256	Juršinci
00050000-55c3-7620-faf0-4a8a3b2b8387	5214	Kal nad Kanalom
00050000-55c3-7620-feaa-f023ac6529ae	3233	Kalobje
00050000-55c3-7620-6cd7-40bba85eb8bc	4246	Kamna Gorica
00050000-55c3-7620-1073-305ef10c0cec	2351	Kamnica
00050000-55c3-7620-1dfe-f2d3a796a4fe	1241	Kamnik
00050000-55c3-7620-6482-bd6f759d9a41	5213	Kanal
00050000-55c3-7620-08f4-5c1953784f80	8258	Kapele
00050000-55c3-7620-de8d-c3b85a2793e3	2362	Kapla
00050000-55c3-7620-e7b9-685540552785	2325	Kidričevo
00050000-55c3-7620-fffb-c4d8a25fa4a5	1412	Kisovec
00050000-55c3-7620-5601-ad4aced21bab	6253	Knežak
00050000-55c3-7620-e379-c494fdee718f	5222	Kobarid
00050000-55c3-7620-239a-5667bb1ce35e	9227	Kobilje
00050000-55c3-7620-7d2f-6f67fa247dab	1330	Kočevje
00050000-55c3-7620-6ad3-4320d84bebb9	1338	Kočevska Reka
00050000-55c3-7620-32f9-24e1b1df294c	2276	Kog
00050000-55c3-7620-6f16-6754124ef391	5211	Kojsko
00050000-55c3-7620-c4e6-26c8aedd93c0	6223	Komen
00050000-55c3-7620-95b6-a84b62a22a92	1218	Komenda
00050000-55c3-7620-1959-a127e383b3e9	6000	Koper/Capodistria 
00050000-55c3-7620-4c78-7552a3cfa261	6001	Koper/Capodistria - poštni predali
00050000-55c3-7620-11f1-7b1cb388e8da	8282	Koprivnica
00050000-55c3-7620-bb32-d84121d5c4a2	5296	Kostanjevica na Krasu
00050000-55c3-7620-4090-bbadc07023f8	8311	Kostanjevica na Krki
00050000-55c3-7620-e0b3-6c9a871bb4f1	1336	Kostel
00050000-55c3-7620-af34-a8a9ff519df6	6256	Košana
00050000-55c3-7620-b812-cb8769a8415f	2394	Kotlje
00050000-55c3-7620-3bf9-40b1f42d07fb	6240	Kozina
00050000-55c3-7620-7cb3-1d65bf314a1f	3260	Kozje
00050000-55c3-7620-ff1a-b0af2fdfdf90	4000	Kranj 
00050000-55c3-7620-ce6a-310eaefc4625	4001	Kranj - poštni predali
00050000-55c3-7620-d1f6-a7064c8286a5	4280	Kranjska Gora
00050000-55c3-7620-339f-289224343560	1281	Kresnice
00050000-55c3-7620-5734-b71203682ba1	4294	Križe
00050000-55c3-7620-57c2-f731e9f9f74c	9206	Križevci
00050000-55c3-7620-7a28-b208a1b446a3	9242	Križevci pri Ljutomeru
00050000-55c3-7620-ee16-4759b1165847	1301	Krka
00050000-55c3-7620-99e6-eb8f9af6a210	8296	Krmelj
00050000-55c3-7620-f00d-3dba7dd124ba	4245	Kropa
00050000-55c3-7620-46b1-c9a987cbb2b8	8262	Krška vas
00050000-55c3-7620-864a-453410ce5827	8270	Krško
00050000-55c3-7620-882f-45cd8cf7d136	9263	Kuzma
00050000-55c3-7620-cad5-403aeb0acd91	2318	Laporje
00050000-55c3-7620-c15f-81b6b7da7a67	3270	Laško
00050000-55c3-7620-f77e-57076860b1d1	1219	Laze v Tuhinju
00050000-55c3-7620-5dff-c361832d9e09	2230	Lenart v Slovenskih goricah
00050000-55c3-7620-b58f-e120537a0d81	9220	Lendava/Lendva
00050000-55c3-7620-c6c6-b66f471d6d8c	4248	Lesce
00050000-55c3-7620-0b8f-fda0066ca9c7	3261	Lesično
00050000-55c3-7620-542d-4a4fa6b6c4d7	8273	Leskovec pri Krškem
00050000-55c3-7620-08e3-3118ab7a50ae	2372	Libeliče
00050000-55c3-7620-7b29-dd1a0dd67419	2341	Limbuš
00050000-55c3-7620-e73b-55e5b16a9f33	1270	Litija
00050000-55c3-7620-e300-6338eebdfb51	3202	Ljubečna
00050000-55c3-7620-fcf3-c9cf1b7e59b6	1000	Ljubljana 
00050000-55c3-7620-f83e-df6b6084c785	1001	Ljubljana - poštni predali
00050000-55c3-7620-c16a-3be67bb75572	1231	Ljubljana - Črnuče
00050000-55c3-7620-6661-bf14010a5085	1261	Ljubljana - Dobrunje
00050000-55c3-7620-c153-46a722858fa3	1260	Ljubljana - Polje
00050000-55c3-7620-bbbb-13f290be5634	1210	Ljubljana - Šentvid
00050000-55c3-7620-c76a-d26459e2fbf7	1211	Ljubljana - Šmartno
00050000-55c3-7620-df4d-27be6bec71f1	3333	Ljubno ob Savinji
00050000-55c3-7620-2d20-ffa845977910	9240	Ljutomer
00050000-55c3-7620-2f68-ef7caa8ef785	3215	Loče
00050000-55c3-7620-95f6-aac1cf8ecfcd	5231	Log pod Mangartom
00050000-55c3-7620-1b13-f59e4508713f	1358	Log pri Brezovici
00050000-55c3-7620-2f05-1a574397aac4	1370	Logatec
00050000-55c3-7620-59f6-7e617304149d	1371	Logatec
00050000-55c3-7620-a46e-b2b3a959a6a6	1434	Loka pri Zidanem Mostu
00050000-55c3-7620-88f5-65419420b075	3223	Loka pri Žusmu
00050000-55c3-7620-ccac-2ad958082b63	6219	Lokev
00050000-55c3-7620-0ae4-18c58f006516	1318	Loški Potok
00050000-55c3-7620-61d2-956517856a9d	2324	Lovrenc na Dravskem polju
00050000-55c3-7620-ad1e-c47d5d65f354	2344	Lovrenc na Pohorju
00050000-55c3-7620-e596-556149cf281b	3334	Luče
00050000-55c3-7620-b5a2-07c10ee0e15c	1225	Lukovica
00050000-55c3-7620-f883-322a7dcd0ecd	9202	Mačkovci
00050000-55c3-7620-84c9-418bfce506a1	2322	Majšperk
00050000-55c3-7620-c032-e041063ba224	2321	Makole
00050000-55c3-7620-0fa9-6b77adf7c29d	9243	Mala Nedelja
00050000-55c3-7620-6de0-fbedc23c150f	2229	Malečnik
00050000-55c3-7620-08ea-c6da63858c6a	6273	Marezige
00050000-55c3-7620-2611-1d469a0c7e56	2000	Maribor 
00050000-55c3-7620-a35f-d2fd1d52f3aa	2001	Maribor - poštni predali
00050000-55c3-7620-a5ac-9be4beb617df	2206	Marjeta na Dravskem polju
00050000-55c3-7620-d597-220b7008ade1	2281	Markovci
00050000-55c3-7620-95a3-7d34f27c0fa8	9221	Martjanci
00050000-55c3-7620-2bed-f3f857d1e81d	6242	Materija
00050000-55c3-7620-a8cc-bceb6b8662b2	4211	Mavčiče
00050000-55c3-7620-1835-3fbf8d39ac8c	1215	Medvode
00050000-55c3-7620-2e0b-ce7210144eb5	1234	Mengeš
00050000-55c3-7620-429d-ac86709eef9e	8330	Metlika
00050000-55c3-7620-d9cc-b32efac3b903	2392	Mežica
00050000-55c3-7620-1950-b5ff800e3471	2204	Miklavž na Dravskem polju
00050000-55c3-7620-cb01-b61af9acb432	2275	Miklavž pri Ormožu
00050000-55c3-7620-27fd-7fe49fc4b4a7	5291	Miren
00050000-55c3-7620-c9c5-2313ab328686	8233	Mirna
00050000-55c3-7620-10a7-17597cdb6738	8216	Mirna Peč
00050000-55c3-7620-9958-32c598a4be14	2382	Mislinja
00050000-55c3-7620-19fa-71e3ea47e1e1	4281	Mojstrana
00050000-55c3-7620-1ae9-ef8ff3ea3d39	8230	Mokronog
00050000-55c3-7620-0962-d2ec86e5e319	1251	Moravče
00050000-55c3-7620-383d-2313c018428a	9226	Moravske Toplice
00050000-55c3-7620-7490-3c088498c677	5216	Most na Soči
00050000-55c3-7620-809f-0049cb1ebc91	1221	Motnik
00050000-55c3-7620-49d4-d5edb72176a7	3330	Mozirje
00050000-55c3-7620-34d1-2b7c3e684494	9000	Murska Sobota 
00050000-55c3-7620-e09c-165c887caceb	9001	Murska Sobota - poštni predali
00050000-55c3-7620-aeb2-f50d9e791fb3	2366	Muta
00050000-55c3-7620-9851-585fc3875564	4202	Naklo
00050000-55c3-7620-577e-a665fa4472a3	3331	Nazarje
00050000-55c3-7620-3941-8f78f425093e	1357	Notranje Gorice
00050000-55c3-7620-132b-03d85b821436	3203	Nova Cerkev
00050000-55c3-7620-6b83-b9ceecb283ad	5000	Nova Gorica 
00050000-55c3-7620-5a03-7af56e1feccd	5001	Nova Gorica - poštni predali
00050000-55c3-7620-007b-9c7b792bdc34	1385	Nova vas
00050000-55c3-7620-5684-f6ad678a99ef	8000	Novo mesto
00050000-55c3-7620-22d5-04d318ca966a	8001	Novo mesto - poštni predali
00050000-55c3-7620-2a1e-40f38ecf73ed	6243	Obrov
00050000-55c3-7620-bc9a-da4bace912b0	9233	Odranci
00050000-55c3-7620-4bac-77c730f66da7	2317	Oplotnica
00050000-55c3-7620-b67f-9f0d8ff5cf06	2312	Orehova vas
00050000-55c3-7620-ef29-a07d5d03e3ce	2270	Ormož
00050000-55c3-7620-ceea-b00eb4bfb3a6	1316	Ortnek
00050000-55c3-7620-b22d-979d43889ae5	1337	Osilnica
00050000-55c3-7620-1ebe-54582800eb86	8222	Otočec
00050000-55c3-7620-3e6a-8241ff18cd54	2361	Ožbalt
00050000-55c3-7620-0fd1-aae6ca56c67b	2231	Pernica
00050000-55c3-7620-f50e-6ffcf74425f4	2211	Pesnica pri Mariboru
00050000-55c3-7620-5a8e-efd04d8ab53f	9203	Petrovci
00050000-55c3-7620-8318-8d49f8f504ec	3301	Petrovče
00050000-55c3-7620-cc5f-0c827e8c7690	6330	Piran/Pirano
00050000-55c3-7620-f654-8c6676ea2db2	8255	Pišece
00050000-55c3-7620-78d1-e80dbc2e7e55	6257	Pivka
00050000-55c3-7620-14ec-f5a995e22940	6232	Planina
00050000-55c3-7620-80c2-01fa296bc4ad	3225	Planina pri Sevnici
00050000-55c3-7620-0149-4a57416f8028	6276	Pobegi
00050000-55c3-7620-81e5-b8018f3c509f	8312	Podbočje
00050000-55c3-7620-a11c-172002586de5	5243	Podbrdo
00050000-55c3-7620-854c-cbed9b68e4e4	3254	Podčetrtek
00050000-55c3-7620-2eca-321a63776d26	2273	Podgorci
00050000-55c3-7620-0c73-48d146c816bc	6216	Podgorje
00050000-55c3-7620-7fae-1dd6fa606238	2381	Podgorje pri Slovenj Gradcu
00050000-55c3-7620-c0be-c9c54091116c	6244	Podgrad
00050000-55c3-7620-50df-d2f927895b58	1414	Podkum
00050000-55c3-7620-97af-c54270c11ba5	2286	Podlehnik
00050000-55c3-7620-147f-3b992b5a0c28	5272	Podnanos
00050000-55c3-7620-ccca-d8203a66b64f	4244	Podnart
00050000-55c3-7620-778d-1b2aa93431af	3241	Podplat
00050000-55c3-7620-ab94-3af621968f27	3257	Podsreda
00050000-55c3-7620-34f7-04641391ae5f	2363	Podvelka
00050000-55c3-7620-8ada-192aa8fea2bb	2208	Pohorje
00050000-55c3-7620-9d98-9a37b593d439	2257	Polenšak
00050000-55c3-7620-db90-36ad69dd6270	1355	Polhov Gradec
00050000-55c3-7620-ab6f-d5ad8ba1ee82	4223	Poljane nad Škofjo Loko
00050000-55c3-7620-ae85-d3c439d9b533	2319	Poljčane
00050000-55c3-7620-e7b8-d18e938f3e6d	1272	Polšnik
00050000-55c3-7620-6cb1-38c15b3e453c	3313	Polzela
00050000-55c3-7620-2246-24c0225ce050	3232	Ponikva
00050000-55c3-7620-7604-2b09eddf2c43	6320	Portorož/Portorose
00050000-55c3-7620-fc3f-ed24f75a3809	6230	Postojna
00050000-55c3-7620-da71-2aab18090bad	2331	Pragersko
00050000-55c3-7620-3eb6-dd1feedb4e5d	3312	Prebold
00050000-55c3-7620-1e2d-ac1f08d835c2	4205	Preddvor
00050000-55c3-7620-0370-2b1b34748e30	6255	Prem
00050000-55c3-7620-c0e9-1b8bc9eeacde	1352	Preserje
00050000-55c3-7620-e57d-facee44d31f7	6258	Prestranek
00050000-55c3-7620-250f-b4b19c244d8b	2391	Prevalje
00050000-55c3-7620-d4f8-f8b56a0810d4	3262	Prevorje
00050000-55c3-7620-3e73-63bc06046751	1276	Primskovo 
00050000-55c3-7620-97e5-38074cfb1fef	3253	Pristava pri Mestinju
00050000-55c3-7620-0752-860a226a9c01	9207	Prosenjakovci/Partosfalva
00050000-55c3-7620-f22c-2423cb2bcfe2	5297	Prvačina
00050000-55c3-7620-cb38-1a92c8d40d7b	2250	Ptuj
00050000-55c3-7620-03d0-9a3cb67b742e	2323	Ptujska Gora
00050000-55c3-7620-bdb6-574f9f61a834	9201	Puconci
00050000-55c3-7620-4465-30937a581aa9	2327	Rače
00050000-55c3-7620-2426-05389e6c350a	1433	Radeče
00050000-55c3-7620-2dff-99851ad365b1	9252	Radenci
00050000-55c3-7620-1f71-fe575286ebf4	2360	Radlje ob Dravi
00050000-55c3-7620-250a-62df50687129	1235	Radomlje
00050000-55c3-7620-bc97-2cd09f950b58	4240	Radovljica
00050000-55c3-7620-0e68-300252e69910	8274	Raka
00050000-55c3-7620-7ced-5068153fb0f6	1381	Rakek
00050000-55c3-7620-c0d8-c32c76c31553	4283	Rateče - Planica
00050000-55c3-7620-82bb-cd7d8ca7aaef	2390	Ravne na Koroškem
00050000-55c3-7620-7707-dfb0545135a7	9246	Razkrižje
00050000-55c3-7620-fede-100900c36de4	3332	Rečica ob Savinji
00050000-55c3-7620-9c95-321c64c7eee9	5292	Renče
00050000-55c3-7620-dcf7-340d1fd2b2b2	1310	Ribnica
00050000-55c3-7620-b733-bbc01cfb7f5a	2364	Ribnica na Pohorju
00050000-55c3-7620-dae0-40c0bad8f870	3272	Rimske Toplice
00050000-55c3-7620-4234-a77d03b91b63	1314	Rob
00050000-55c3-7620-52b7-3f2b825e364a	5215	Ročinj
00050000-55c3-7620-7bac-24a6e937572f	3250	Rogaška Slatina
00050000-55c3-7620-092f-aae404b9e727	9262	Rogašovci
00050000-55c3-7620-0f13-a4280f7b4914	3252	Rogatec
00050000-55c3-7620-1c7c-b5edc25c323f	1373	Rovte
00050000-55c3-7620-6ae0-713f9c37e60c	2342	Ruše
00050000-55c3-7620-09d4-25028ba7f2a6	1282	Sava
00050000-55c3-7620-4f0d-5fbbac69d423	6333	Sečovlje/Sicciole
00050000-55c3-7620-ee03-de70c52d7d94	4227	Selca
00050000-55c3-7620-1748-86cd832f6d38	2352	Selnica ob Dravi
00050000-55c3-7620-f9a6-faf9a7f11b37	8333	Semič
00050000-55c3-7620-4aab-38c2f22ff81d	8281	Senovo
00050000-55c3-7620-9c8b-13918e9fc502	6224	Senožeče
00050000-55c3-7620-e3eb-c8b987df7107	8290	Sevnica
00050000-55c3-7620-8720-0fb711d6dde3	6210	Sežana
00050000-55c3-7620-4ff7-fc2a5f8038d8	2214	Sladki Vrh
00050000-55c3-7620-41da-8209c9dd497a	5283	Slap ob Idrijci
00050000-55c3-7620-8209-791041b3f7d4	2380	Slovenj Gradec
00050000-55c3-7620-b3dc-f9b4edffb186	2310	Slovenska Bistrica
00050000-55c3-7620-551c-52d44f6ac577	3210	Slovenske Konjice
00050000-55c3-7620-f4ff-e616a7602552	1216	Smlednik
00050000-55c3-7620-19b4-4f43e20a85dc	5232	Soča
00050000-55c3-7620-e8ac-954f15a76e66	1317	Sodražica
00050000-55c3-7620-aa85-f3c800ab75d6	3335	Solčava
00050000-55c3-7620-8082-7de83ccaef93	5250	Solkan
00050000-55c3-7620-ebc2-611c944cd330	4229	Sorica
00050000-55c3-7620-b8d2-9d6de7ba70a0	4225	Sovodenj
00050000-55c3-7620-36a7-903ba0cf8bc5	5281	Spodnja Idrija
00050000-55c3-7620-6c66-da0dcb4d082b	2241	Spodnji Duplek
00050000-55c3-7620-d06b-6128cd7a55cb	9245	Spodnji Ivanjci
00050000-55c3-7620-7242-d99a1fc40f63	2277	Središče ob Dravi
00050000-55c3-7620-d0f2-39a5c2e7aaaa	4267	Srednja vas v Bohinju
00050000-55c3-7620-1d53-eba48c1306aa	8256	Sromlje 
00050000-55c3-7620-5088-ec7bf8207ef8	5224	Srpenica
00050000-55c3-7620-a9a1-834b8eb292d9	1242	Stahovica
00050000-55c3-7620-ea2a-916162f1a690	1332	Stara Cerkev
00050000-55c3-7620-1280-8954da51ab9a	8342	Stari trg ob Kolpi
00050000-55c3-7620-c3a8-709311a95b1e	1386	Stari trg pri Ložu
00050000-55c3-7620-f759-19453868c743	2205	Starše
00050000-55c3-7620-0883-13aea0507db3	2289	Stoperce
00050000-55c3-7620-2f77-fdf0e02dde2e	8322	Stopiče
00050000-55c3-7620-10b9-8c2ccac5ee61	3206	Stranice
00050000-55c3-7620-a369-ae6b88c70864	8351	Straža
00050000-55c3-7620-4356-0d9b803290e0	1313	Struge
00050000-55c3-7620-9794-3560b8cc8b8b	8293	Studenec
00050000-55c3-7620-b820-27a831e97f9b	8331	Suhor
00050000-55c3-7620-23cf-ab0d326c844e	2233	Sv. Ana v Slovenskih goricah
00050000-55c3-7620-d345-4acc27e654af	2235	Sv. Trojica v Slovenskih goricah
00050000-55c3-7620-9ccd-8711e01b1f92	2353	Sveti Duh na Ostrem Vrhu
00050000-55c3-7620-29b0-2be6cd3d5be2	9244	Sveti Jurij ob Ščavnici
00050000-55c3-7620-8744-3d9d3be8751c	3264	Sveti Štefan
00050000-55c3-7620-9c71-e5b50d018792	2258	Sveti Tomaž
00050000-55c3-7620-ab9f-13e78101434e	9204	Šalovci
00050000-55c3-7620-bf11-bf1fc21c6449	5261	Šempas
00050000-55c3-7620-9870-990d0302cb1a	5290	Šempeter pri Gorici
00050000-55c3-7620-bd2a-cd1edfe5ecd5	3311	Šempeter v Savinjski dolini
00050000-55c3-7620-faeb-1a19ade0a4f1	4208	Šenčur
00050000-55c3-7620-3c31-bf77fa009204	2212	Šentilj v Slovenskih goricah
00050000-55c3-7620-0d94-04ceeb75a0b4	8297	Šentjanž
00050000-55c3-7620-ecde-95e2210d8cd6	2373	Šentjanž pri Dravogradu
00050000-55c3-7620-4e19-8ac7c3733689	8310	Šentjernej
00050000-55c3-7620-dc06-9310268289b6	3230	Šentjur
00050000-55c3-7620-8c53-04e02cdfa7f7	3271	Šentrupert
00050000-55c3-7620-9c3f-b093bcbe131d	8232	Šentrupert
00050000-55c3-7620-314d-13285263d13b	1296	Šentvid pri Stični
00050000-55c3-7620-83e0-62448b5a302c	8275	Škocjan
00050000-55c3-7620-2cdb-e8dd6bd94caa	6281	Škofije
00050000-55c3-7620-4cf0-9a559e68a46d	4220	Škofja Loka
00050000-55c3-7620-7f4a-a898c63e6e6a	3211	Škofja vas
00050000-55c3-7620-c041-1abf1e85f8c2	1291	Škofljica
00050000-55c3-7620-a149-23cb6def4731	6274	Šmarje
00050000-55c3-7620-81ca-87d06cc39b6e	1293	Šmarje - Sap
00050000-55c3-7620-717f-a7028b9809ec	3240	Šmarje pri Jelšah
00050000-55c3-7620-8832-0c55024d7b6d	8220	Šmarješke Toplice
00050000-55c3-7620-4046-81e97fc36f35	2315	Šmartno na Pohorju
00050000-55c3-7620-88cd-d5deb8413895	3341	Šmartno ob Dreti
00050000-55c3-7620-1009-d7d4e26963a7	3327	Šmartno ob Paki
00050000-55c3-7620-b959-fdc11b35f47a	1275	Šmartno pri Litiji
00050000-55c3-7620-3a2c-51b35ff2c899	2383	Šmartno pri Slovenj Gradcu
00050000-55c3-7620-ab8f-f6dd65101969	3201	Šmartno v Rožni dolini
00050000-55c3-7620-5748-588b14cb67d6	3325	Šoštanj
00050000-55c3-7620-b2d6-5c75aea7dcde	6222	Štanjel
00050000-55c3-7620-2182-d3b13480a305	3220	Štore
00050000-55c3-7620-0757-9270dd85391c	3304	Tabor
00050000-55c3-7620-ee89-286375ab5fcd	3221	Teharje
00050000-55c3-7620-532f-ba482b99a01b	9251	Tišina
00050000-55c3-7620-196e-0e00002eca00	5220	Tolmin
00050000-55c3-7620-e884-a7ed3026f019	3326	Topolšica
00050000-55c3-7620-4fd6-dcc0b23f133a	2371	Trbonje
00050000-55c3-7620-8ccc-36a399e3a21c	1420	Trbovlje
00050000-55c3-7620-c661-5c875b870d7a	8231	Trebelno 
00050000-55c3-7620-3a01-ffe087355059	8210	Trebnje
00050000-55c3-7620-6e5e-2e6d7765835d	5252	Trnovo pri Gorici
00050000-55c3-7620-c6fb-91c52717c854	2254	Trnovska vas
00050000-55c3-7620-63ea-990742b947d2	1222	Trojane
00050000-55c3-7620-45fd-e2002769f238	1236	Trzin
00050000-55c3-7620-b982-e810888f380d	4290	Tržič
00050000-55c3-7620-c2ee-2abea15187f6	8295	Tržišče
00050000-55c3-7620-3a4c-00adadf0a09d	1311	Turjak
00050000-55c3-7620-080e-031e9ad8d858	9224	Turnišče
00050000-55c3-7620-6827-0fd8448be2fb	8323	Uršna sela
00050000-55c3-7620-694a-f567ee822fef	1252	Vače
00050000-55c3-7620-1d05-f5e8b56612da	3320	Velenje 
00050000-55c3-7620-5f34-8c47c15575ae	3322	Velenje - poštni predali
00050000-55c3-7620-2187-f411ac5f6f9e	8212	Velika Loka
00050000-55c3-7620-a6cc-247f60c424e3	2274	Velika Nedelja
00050000-55c3-7620-8026-294e97938e59	9225	Velika Polana
00050000-55c3-7620-9fd7-2403b3880f5e	1315	Velike Lašče
00050000-55c3-7620-d627-3efcbfebb42a	8213	Veliki Gaber
00050000-55c3-7620-3aa6-c2924efd86f2	9241	Veržej
00050000-55c3-7620-8c5b-e42f03d3440b	1312	Videm - Dobrepolje
00050000-55c3-7620-6e1a-431d4e4d4219	2284	Videm pri Ptuju
00050000-55c3-7620-3cc7-fd6ac604af6c	8344	Vinica
00050000-55c3-7620-fd97-dc8b5b7415a3	5271	Vipava
00050000-55c3-7620-c25e-4f6d611370be	4212	Visoko
00050000-55c3-7620-6108-b09618907d99	1294	Višnja Gora
00050000-55c3-7620-2d10-aea204c4c1ce	3205	Vitanje
00050000-55c3-7620-e29e-9e1af89b73e0	2255	Vitomarci
00050000-55c3-7620-1ac0-abafca909076	1217	Vodice
00050000-55c3-7620-6d27-f1649eef3418	3212	Vojnik\t
00050000-55c3-7620-7245-203c3d3d0c3b	5293	Volčja Draga
00050000-55c3-7620-f00a-1651357e6038	2232	Voličina
00050000-55c3-7620-3234-1cd20d703d25	3305	Vransko
00050000-55c3-7620-d1f0-b8696b9b4091	6217	Vremski Britof
00050000-55c3-7620-dc72-8523945a74b3	1360	Vrhnika
00050000-55c3-7620-9e76-8a536b8742b3	2365	Vuhred
00050000-55c3-7620-d3ca-8c5768841534	2367	Vuzenica
00050000-55c3-7620-58ac-d7131bee0a9a	8292	Zabukovje 
00050000-55c3-7620-0879-df3c97012e55	1410	Zagorje ob Savi
00050000-55c3-7620-1677-8b7c7c76478b	1303	Zagradec
00050000-55c3-7620-8ac4-13725dc51890	2283	Zavrč
00050000-55c3-7620-0a71-7d92e0c00410	8272	Zdole 
00050000-55c3-7620-58ed-d9ed8f3a9a4e	4201	Zgornja Besnica
00050000-55c3-7620-87b1-c918b66a4e70	2242	Zgornja Korena
00050000-55c3-7620-d3db-fbd480534744	2201	Zgornja Kungota
00050000-55c3-7620-8f97-2af75a2db490	2316	Zgornja Ložnica
00050000-55c3-7620-879e-9a4374d5eca6	2314	Zgornja Polskava
00050000-55c3-7620-afab-89963f7e02ee	2213	Zgornja Velka
00050000-55c3-7620-d6ac-f961567d6167	4247	Zgornje Gorje
00050000-55c3-7620-a19d-89bf9f56e240	4206	Zgornje Jezersko
00050000-55c3-7620-ad79-e3504f29580f	2285	Zgornji Leskovec
00050000-55c3-7620-fe80-9f02d2719cfe	1432	Zidani Most
00050000-55c3-7620-e25d-69712b6b4a25	3214	Zreče
00050000-55c3-7620-e584-b17070104c2e	4209	Žabnica
00050000-55c3-7620-b621-941751e3bfc6	3310	Žalec
00050000-55c3-7620-f13e-b3d072bb4a24	4228	Železniki
00050000-55c3-7620-c0b2-22a21cc0583d	2287	Žetale
00050000-55c3-7620-0d53-83c14cb2b9a4	4226	Žiri
00050000-55c3-7620-6c0c-9969c07cade8	4274	Žirovnica
00050000-55c3-7620-9640-06baafbc817d	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12316684)
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
-- TOC entry 3003 (class 0 OID 12316491)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12316569)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12316696)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12317027)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12317037)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c3-7621-bd00-2dbb62d43a98	00080000-55c3-7621-1e85-9ffd8872a415	0900	AK
00190000-55c3-7621-9c00-ba96872b7179	00080000-55c3-7621-4f71-e35b85d15c02	0987	AK
00190000-55c3-7621-8be5-768598f94241	00080000-55c3-7621-46fa-53cdb0a52d61	0989	AK
00190000-55c3-7621-a331-907bdd3549e1	00080000-55c3-7621-91c5-3d29f1d66ca7	0986	AK
00190000-55c3-7621-0d2e-6f64452c4786	00080000-55c3-7621-4423-c3287f82fb3c	0984	AK
00190000-55c3-7621-06f8-ddbb848207db	00080000-55c3-7621-5c2b-9401954d6dd8	0983	AK
00190000-55c3-7621-dc92-a5785f7a29b7	00080000-55c3-7621-b36a-679b4df0afb5	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12316983)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c3-7621-fe5b-96cd99c1fac1	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3048 (class 0 OID 12317045)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12316725)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c3-7621-7b91-7c9ccb667416	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c3-7621-d9fa-02a98d3bcda5	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c3-7621-e4c1-41849b0ce9f1	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c3-7621-e4a3-5db2c8224197	0004	Mali oder	t	24	Mali oder 
00220000-55c3-7621-647c-8c79fb539bfd	0005	Komorni oder	t	15	Komorni oder
00220000-55c3-7621-3b9e-0db6edeb6eca	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c3-7621-1dc1-33b6a09ea36c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12316669)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12316659)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12316844)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12316793)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12316363)
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
-- TOC entry 3028 (class 0 OID 12316735)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12316401)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c3-7620-5710-b4a4cd5ca9fc	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c3-7620-168e-4cacc80b3f87	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c3-7620-cc9d-1c98f91bbc87	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c3-7620-50fc-e17c30beadb4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c3-7620-5fda-04c09dcc53be	planer	Planer dogodkov v koledarju	t
00020000-55c3-7620-eefd-dbe4fe14d761	kadrovska	Kadrovska služba	t
00020000-55c3-7620-25bb-ac91a20caca6	arhivar	Ažuriranje arhivalij	t
00020000-55c3-7620-3c27-7ba1068507ae	igralec	Igralec	t
00020000-55c3-7620-0bf5-e1ad743a4028	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c3-7621-36aa-6b0eba451bc1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12316385)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c3-7620-f0a2-2bf224f7875f	00020000-55c3-7620-cc9d-1c98f91bbc87
00010000-55c3-7620-4e01-0503064cbd22	00020000-55c3-7620-cc9d-1c98f91bbc87
00010000-55c3-7621-43f1-6fde11960aed	00020000-55c3-7621-36aa-6b0eba451bc1
\.


--
-- TOC entry 3030 (class 0 OID 12316749)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12316690)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12316636)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12317086)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c3-7620-306b-15c2288d83e9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c3-7620-1039-21185d6e38d0	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c3-7620-5678-37ba6f8d9de3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c3-7620-6c37-4862d7fbc01a	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c3-7620-a4d6-379a5fbd51ff	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12317078)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c3-7620-2380-fde3bb1cf38c	00230000-55c3-7620-6c37-4862d7fbc01a	popa
00240000-55c3-7620-c5d1-73efc5a7282b	00230000-55c3-7620-6c37-4862d7fbc01a	oseba
00240000-55c3-7620-b3e8-b27f58496bdb	00230000-55c3-7620-6c37-4862d7fbc01a	sezona
00240000-55c3-7620-9b25-3b9c2e43c95a	00230000-55c3-7620-1039-21185d6e38d0	prostor
00240000-55c3-7620-206f-366f2dd00acc	00230000-55c3-7620-6c37-4862d7fbc01a	besedilo
00240000-55c3-7620-e7e8-8601f242c314	00230000-55c3-7620-6c37-4862d7fbc01a	uprizoritev
00240000-55c3-7620-ff6e-9b945d0e2f66	00230000-55c3-7620-6c37-4862d7fbc01a	funkcija
00240000-55c3-7620-6e7b-1a6df17abaa2	00230000-55c3-7620-6c37-4862d7fbc01a	tipfunkcije
00240000-55c3-7620-171a-18526a334168	00230000-55c3-7620-6c37-4862d7fbc01a	alternacija
00240000-55c3-7620-a4f7-2679fcc53bdd	00230000-55c3-7620-306b-15c2288d83e9	pogodba
00240000-55c3-7620-4752-0c44a16bdc84	00230000-55c3-7620-6c37-4862d7fbc01a	zaposlitev
00240000-55c3-7620-d58c-09eb3301621c	00230000-55c3-7620-306b-15c2288d83e9	programdela
00240000-55c3-7620-9983-7496566bf454	00230000-55c3-7620-6c37-4862d7fbc01a	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12317073)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12316803)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c3-7622-c98a-8d4315e49750	000e0000-55c3-7621-217e-38a82ee8bc00	00080000-55c3-7621-9aaa-ea88867bba8c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c3-7622-d5df-7c94f97ca2f1	000e0000-55c3-7621-217e-38a82ee8bc00	00080000-55c3-7621-9aaa-ea88867bba8c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c3-7622-705f-78f2ab7f9265	000e0000-55c3-7621-217e-38a82ee8bc00	00080000-55c3-7621-30b7-1e53e68b8642	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c3-7622-0adb-2befb112104f	000e0000-55c3-7621-217e-38a82ee8bc00	00080000-55c3-7621-30b7-1e53e68b8642	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12316463)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12316646)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c3-7622-88a3-0b2c2b18d0cb	00180000-55c3-7621-fdc6-d41bbc463534	000c0000-55c3-7622-8fbf-bfa5cf89ea98	00090000-55c3-7621-f5b2-9a889ddec932	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-7622-6adf-fcc5e29ac027	00180000-55c3-7621-fdc6-d41bbc463534	000c0000-55c3-7622-48de-43c58735f17c	00090000-55c3-7621-bda8-8e84109f1e81	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-7622-c516-10ed6ec0ff4d	00180000-55c3-7621-fdc6-d41bbc463534	000c0000-55c3-7622-f672-d0a8c626624f	00090000-55c3-7621-324d-3fa6ddecd83d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-7622-11c4-dad2388f5d0f	00180000-55c3-7621-fdc6-d41bbc463534	000c0000-55c3-7622-f508-0577223c7504	00090000-55c3-7621-7792-88cc9baca551	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-7622-4afc-94af4fedcf07	00180000-55c3-7621-fdc6-d41bbc463534	000c0000-55c3-7622-ba62-0438e6532005	00090000-55c3-7621-4b04-b1a2bce0b297	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c3-7622-7588-b95476a2a71d	00180000-55c3-7621-2c59-b8f349df1cd6	\N	00090000-55c3-7621-4b04-b1a2bce0b297	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12316833)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c3-7620-cf9e-98f4f3f9ae6d	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c3-7620-c892-fa383ba23d7e	Priredba	Priredba	Priredba	umetnik
000f0000-55c3-7620-9314-62ae1a28a55b	Prevod	Prevod	Prevod	umetnik
000f0000-55c3-7620-eff0-d49dde3fb050	Režija	Režija	Režija	umetnik
000f0000-55c3-7620-cb60-8571b0324859	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c3-7620-bd3d-4778b580897e	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c3-7620-18d8-dee7f8d20111	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c3-7620-5e8d-92027f8ba65d	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c3-7620-fa64-f8ca3ab78f81	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c3-7620-babf-68fbd0cb44b5	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c3-7620-ea8c-9dee7ef252d1	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c3-7620-e77d-a327ccaaaf66	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c3-7620-7b07-c8f3909a0793	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c3-7620-f017-5b086b8cec22	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c3-7620-03d4-3d53a0e4f31d	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c3-7620-9dca-f4d0a2ba0d70	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c3-7620-0414-04b86bd5fcc0	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c3-7620-f722-9514f35dee01	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12317055)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c3-7620-455b-548a4298e90d	01	Velika predstava	f	1.00	1.00
002b0000-55c3-7620-a956-d5c95d333bfc	02	Mala predstava	f	0.50	0.50
002b0000-55c3-7620-cf85-720502b1b1c8	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c3-7620-38de-0f16055560fb	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c3-7620-ef68-656c3be50bb3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12316526)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12316372)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c3-7620-4e01-0503064cbd22	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO838LlQJBvF3oNzPBhYFRoKusnH16IUG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c3-7621-9e22-61729415b091	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c3-7621-7796-a182dfc286e5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c3-7621-6d42-2228ba78bf29	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c3-7621-519d-8d293563c847	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c3-7621-b96c-9b87e4b6483a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c3-7621-df09-f3eeda4c0b8a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c3-7621-86c4-381f2c92e49e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c3-7621-1204-c7137332cfd5	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c3-7621-9566-f3737f79c983	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c3-7621-43f1-6fde11960aed	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c3-7620-f0a2-2bf224f7875f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12316881)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c3-7621-95e2-ff57093aef7f	00160000-55c3-7621-c97a-2c405c63b94b	00150000-55c3-7620-7e4f-09c585b785c9	00140000-55c3-7620-6519-cde05e8eb10b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c3-7621-647c-8c79fb539bfd
000e0000-55c3-7621-217e-38a82ee8bc00	00160000-55c3-7621-2bae-7472b70fb8a2	00150000-55c3-7620-0e5f-3d5894d7fe23	00140000-55c3-7620-e0ba-1653c62d866a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c3-7621-3b9e-0db6edeb6eca
000e0000-55c3-7621-3684-bbe6e18d781b	\N	00150000-55c3-7620-0e5f-3d5894d7fe23	00140000-55c3-7620-e0ba-1653c62d866a	00190000-55c3-7621-9c00-ba96872b7179	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c3-7621-647c-8c79fb539bfd
000e0000-55c3-7621-eff2-fbf47c318145	\N	00150000-55c3-7620-0e5f-3d5894d7fe23	00140000-55c3-7620-e0ba-1653c62d866a	00190000-55c3-7621-9c00-ba96872b7179	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c3-7621-647c-8c79fb539bfd
000e0000-55c3-7621-a669-d7457f0902ea	\N	00150000-55c3-7620-0e5f-3d5894d7fe23	00140000-55c3-7620-e0ba-1653c62d866a	00190000-55c3-7621-9c00-ba96872b7179	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c3-7621-7b91-7c9ccb667416
\.


--
-- TOC entry 3011 (class 0 OID 12316588)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c3-7621-9050-8f556731a43a	000e0000-55c3-7621-217e-38a82ee8bc00	1	
00200000-55c3-7621-a802-4738019c9de3	000e0000-55c3-7621-217e-38a82ee8bc00	2	
\.


--
-- TOC entry 3026 (class 0 OID 12316717)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12317125)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12317097)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12317137)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12316786)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c3-7621-2330-0d54346a8bc5	00090000-55c3-7621-bda8-8e84109f1e81	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-7621-b1b3-f16944a1066a	00090000-55c3-7621-324d-3fa6ddecd83d	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-7621-49d3-52d74dfba7bc	00090000-55c3-7621-ad9e-b2180076ff83	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-7621-d4ca-aa335c901a34	00090000-55c3-7621-e05b-82674dd30c29	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-7621-3194-9184877c1b83	00090000-55c3-7621-f5b2-9a889ddec932	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c3-7621-6c8e-773dfbc12e6f	00090000-55c3-7621-35bb-4a8763e26ede	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12316620)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12316871)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c3-7620-6519-cde05e8eb10b	01	Drama	drama (SURS 01)
00140000-55c3-7620-3ea7-3fe73a6a80de	02	Opera	opera (SURS 02)
00140000-55c3-7620-07e7-4d2913ef5ab9	03	Balet	balet (SURS 03)
00140000-55c3-7620-69d5-c52376f9656a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c3-7620-09c0-5fa727c0a83b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c3-7620-e0ba-1653c62d866a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c3-7620-c957-2372d00f8908	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12316776)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c3-7620-9208-67e7d7675f46	01	Opera	opera
00150000-55c3-7620-5d73-303246eb6d08	02	Opereta	opereta
00150000-55c3-7620-639c-08dda53026b3	03	Balet	balet
00150000-55c3-7620-dedf-61276b1b1278	04	Plesne prireditve	plesne prireditve
00150000-55c3-7620-2b96-e3cdee339f4b	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c3-7620-ef24-adb2c154c83f	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c3-7620-d136-eeec9dc9d78a	07	Biografska drama	biografska drama
00150000-55c3-7620-7e4f-09c585b785c9	08	Komedija	komedija
00150000-55c3-7620-156b-67dc0cec6073	09	Črna komedija	črna komedija
00150000-55c3-7620-e0f3-5dc70c931cbe	10	E-igra	E-igra
00150000-55c3-7620-0e5f-3d5894d7fe23	11	Kriminalka	kriminalka
00150000-55c3-7620-a311-2d5faad1e50c	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12316426)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12316928)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12316918)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12316832)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12317178)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12316610)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12316635)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12317071)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12316552)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12316977)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12316772)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12316586)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12316629)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12316566)
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
-- TOC entry 2630 (class 2606 OID 12316682)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12317154)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12317161)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12317186)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12316709)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12316524)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12316435)
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
-- TOC entry 2544 (class 2606 OID 12316459)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12316415)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12316400)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12316715)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12316748)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12316866)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12316488)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12316512)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12316688)
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
-- TOC entry 2559 (class 2606 OID 12316502)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12316573)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12316700)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12317034)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12317042)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12317025)
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
-- TOC entry 2736 (class 2606 OID 12317053)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12316732)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12316673)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12316664)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12316854)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12316800)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12316371)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12316739)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12316389)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12316409)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12316757)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12316695)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12316644)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12317095)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12317083)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12317077)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12316813)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12316468)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12316655)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12316843)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12317065)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12316537)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12316384)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12316897)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12316595)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12316723)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12317135)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12317119)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12317143)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12316791)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12316624)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12316879)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12316784)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12316617)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12316814)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12316815)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12317156)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12317155)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12316490)
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
-- TOC entry 2643 (class 1259 OID 12316716)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12317123)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12317122)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12317124)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12317121)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12317120)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12316702)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12316701)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12316596)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12316773)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12316775)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12316774)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12316568)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12316567)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12317054)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12316868)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12316869)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12316870)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12317144)
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
-- TOC entry 2697 (class 1259 OID 12316902)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12316899)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12316903)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12316901)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12316900)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12316539)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12316538)
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
-- TOC entry 2542 (class 1259 OID 12316462)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12316740)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12316630)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12316416)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12316417)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12316760)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12316759)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12316758)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12316574)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12316576)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12316575)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12317085)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12316668)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12316666)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12316665)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12316667)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12316390)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12316391)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12316724)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12317179)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12317187)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12317188)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12316689)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12316801)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12316802)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12316982)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12316981)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12316978)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12316979)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12316980)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12316504)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12316503)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12316505)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12317035)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12317036)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12316932)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12316933)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12316930)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12316931)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12316792)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12316677)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12316676)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12316674)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12316675)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12316920)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12316919)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12317026)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12316587)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12317072)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12317162)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12317163)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12316437)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12316436)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12316469)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12316470)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12316658)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12316657)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12316656)
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
-- TOC entry 2594 (class 1259 OID 12316619)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12316615)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12316612)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12316613)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12316611)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12316616)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12316614)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12316489)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12316553)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12316555)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12316554)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12316556)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12316683)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12316867)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12316898)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12316460)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12316461)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12316785)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12317096)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12316525)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12317084)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12316734)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12316733)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12316929)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12316513)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12316880)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12317136)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12317043)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12317044)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12316645)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12316410)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12316618)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 12317324)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 12317309)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 12317314)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 12317334)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 12317304)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 12317329)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12317319)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 12317479)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 12317484)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 12317654)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 12317649)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12317239)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12317419)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 12317634)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12317629)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 12317639)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 12317624)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 12317619)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 12317414)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 12317409)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12317299)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12317449)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12317459)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12317454)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 12317274)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 12317269)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12317399)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12317604)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 12317489)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12317494)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 12317499)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12317644)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 12317519)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 12317504)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 12317524)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12317514)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 12317509)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 12317264)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 12317259)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 12317224)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 12317219)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12317429)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12317339)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 12317199)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 12317204)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 12317444)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12317439)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 12317434)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 12317279)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 12317289)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12317284)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12317614)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 12317374)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 12317364)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 12317359)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 12317369)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 12317189)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 12317194)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12317424)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12317669)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 12317674)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 12317679)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12317404)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 12317469)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 12317474)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 12317579)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 12317574)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 12317559)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 12317564)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12317569)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12317249)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 12317244)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 12317254)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 12317589)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 12317594)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 12317549)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 12317554)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 12317539)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 12317544)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12317464)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 12317394)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 12317389)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 12317379)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 12317384)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 12317534)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 12317529)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12317584)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12317294)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12317599)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12317609)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 12317659)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 12317664)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 12317214)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 12317209)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 12317229)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 12317234)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 12317354)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12317349)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 12317344)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-06 16:58:43 CEST

--
-- PostgreSQL database dump complete
--

