--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-11 08:30:52 CEST

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
-- TOC entry 183 (class 1259 OID 12689796)
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
-- TOC entry 228 (class 1259 OID 12690299)
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
-- TOC entry 227 (class 1259 OID 12690282)
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
-- TOC entry 221 (class 1259 OID 12690194)
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
-- TOC entry 244 (class 1259 OID 12690542)
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
-- TOC entry 197 (class 1259 OID 12689975)
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
-- TOC entry 200 (class 1259 OID 12690009)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 12690444)
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
-- TOC entry 192 (class 1259 OID 12689918)
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
-- TOC entry 229 (class 1259 OID 12690312)
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
-- TOC entry 216 (class 1259 OID 12690139)
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
-- TOC entry 195 (class 1259 OID 12689955)
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
-- TOC entry 199 (class 1259 OID 12690003)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 12689935)
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
-- TOC entry 205 (class 1259 OID 12690056)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 12690523)
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
-- TOC entry 243 (class 1259 OID 12690535)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 12690558)
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
-- TOC entry 209 (class 1259 OID 12690081)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 12689892)
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
-- TOC entry 184 (class 1259 OID 12689805)
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
-- TOC entry 185 (class 1259 OID 12689816)
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
-- TOC entry 180 (class 1259 OID 12689770)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 12689789)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 12690088)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 12690119)
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
-- TOC entry 224 (class 1259 OID 12690233)
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
-- TOC entry 187 (class 1259 OID 12689849)
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
-- TOC entry 189 (class 1259 OID 12689884)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 12690062)
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
-- TOC entry 188 (class 1259 OID 12689869)
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
-- TOC entry 194 (class 1259 OID 12689947)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 12690074)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 12690405)
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
-- TOC entry 232 (class 1259 OID 12690415)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 12690361)
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
-- TOC entry 233 (class 1259 OID 12690423)
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
-- TOC entry 212 (class 1259 OID 12690103)
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
-- TOC entry 204 (class 1259 OID 12690047)
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
-- TOC entry 203 (class 1259 OID 12690037)
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
-- TOC entry 223 (class 1259 OID 12690222)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 12690171)
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
-- TOC entry 177 (class 1259 OID 12689741)
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
-- TOC entry 176 (class 1259 OID 12689739)
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
-- TOC entry 213 (class 1259 OID 12690113)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 12689779)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 12689763)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 12690127)
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
-- TOC entry 207 (class 1259 OID 12690068)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 12690014)
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
-- TOC entry 238 (class 1259 OID 12690464)
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
-- TOC entry 237 (class 1259 OID 12690456)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 12690451)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 12690181)
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
-- TOC entry 186 (class 1259 OID 12689841)
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
-- TOC entry 202 (class 1259 OID 12690024)
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
-- TOC entry 222 (class 1259 OID 12690211)
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
-- TOC entry 234 (class 1259 OID 12690433)
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
-- TOC entry 191 (class 1259 OID 12689904)
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
-- TOC entry 178 (class 1259 OID 12689750)
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
-- TOC entry 226 (class 1259 OID 12690259)
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
-- TOC entry 196 (class 1259 OID 12689966)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 12690095)
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
-- TOC entry 240 (class 1259 OID 12690503)
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
-- TOC entry 239 (class 1259 OID 12690475)
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
-- TOC entry 241 (class 1259 OID 12690515)
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
-- TOC entry 218 (class 1259 OID 12690164)
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
-- TOC entry 198 (class 1259 OID 12689998)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 12690249)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 12690154)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 12689744)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 12689796)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 12690299)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c9-969b-9478-63cec56cc220	000d0000-55c9-969b-3a94-9371a5906527	\N	00090000-55c9-969b-cbea-1147c891bbe8	000b0000-55c9-969b-e000-1b0ea1ee2ad5	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c9-969b-3292-696b9793a602	000d0000-55c9-969b-27db-6b6cca755af6	00100000-55c9-969b-9a4d-f391897e667c	00090000-55c9-969b-912a-1dfa00307480	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c9-969b-d731-28dbe59bcbfe	000d0000-55c9-969b-5a1f-0cde4f9382dc	00100000-55c9-969b-2966-974e649d7bc2	00090000-55c9-969b-6991-a44f1ca2dab2	\N	0003	t	\N	2015-08-11	\N	2	\N	\N	f	f
000c0000-55c9-969b-0893-5cef52ba9528	000d0000-55c9-969b-c693-97440749a087	\N	00090000-55c9-969b-c7aa-a357d2a7366d	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c9-969b-ef7c-f50ac1c610a2	000d0000-55c9-969b-9f8c-e7aa933ff871	\N	00090000-55c9-969b-ac5b-6ab4a2fbddb3	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c9-969b-097f-e4349dd51375	000d0000-55c9-969b-1be4-18ab361f8dd2	\N	00090000-55c9-969b-b7c6-456dec2e9695	000b0000-55c9-969b-762f-59e4dee458e7	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c9-969b-1462-39db69b6e212	000d0000-55c9-969b-ca59-eb21850da92c	00100000-55c9-969b-9c69-f07a3c6bdb67	00090000-55c9-969b-acde-fc04d04ade84	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c9-969b-8d75-582ffaff0d4d	000d0000-55c9-969b-902d-3a333896651c	\N	00090000-55c9-969b-83c0-14ddf0b5ae53	000b0000-55c9-969b-8b43-f986b6304ae6	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c9-969b-a276-cb6cd1b08c11	000d0000-55c9-969b-ca59-eb21850da92c	00100000-55c9-969b-bff7-d77d2d2e4703	00090000-55c9-969b-5da8-ce52dede5db1	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c9-969b-cc20-46579ab4eea5	000d0000-55c9-969b-ca59-eb21850da92c	00100000-55c9-969b-5224-dcf729447c80	00090000-55c9-969b-702c-f6aaf35f1de6	\N	0010	t	\N	2015-08-11	\N	16	\N	\N	f	t
000c0000-55c9-969b-53dd-fe614b447905	000d0000-55c9-969b-ca59-eb21850da92c	00100000-55c9-969b-03ee-f6c1f06db0b7	00090000-55c9-969b-98d6-4c304fb1e510	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 12690282)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 12690194)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c9-969b-d080-19a971fc785a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c9-969b-3c9a-59b787eaaa7f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c9-969b-fbf7-dd40b2dae14d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 12690542)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 12689975)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c9-969b-64b8-97b3da91c419	\N	\N	00200000-55c9-969b-70f9-c4f75ccc018f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c9-969b-1d6c-113d4c31329f	\N	\N	00200000-55c9-969b-6872-6537c3f0930d	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c9-969b-0f26-e4b579f31459	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c9-969b-1194-488905097144	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c9-969b-6f59-c6af0f98a988	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 12690009)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 12690444)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 12689918)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c9-9699-86b0-74e3de81c845	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c9-9699-a076-aa80c0c09dd3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c9-9699-e5aa-e1a16eb5747e	AL	ALB	008	Albania 	Albanija	\N
00040000-55c9-9699-8c17-504247dc64f1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c9-9699-180c-32da1b18c12d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c9-9699-eee6-666aa86d8d2f	AD	AND	020	Andorra 	Andora	\N
00040000-55c9-9699-4222-94e7b592162f	AO	AGO	024	Angola 	Angola	\N
00040000-55c9-9699-814a-dcc52968d77a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c9-9699-ad59-245528603d1c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c9-9699-3ba8-a1e7b99f9422	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c9-9699-9450-511511ce53c8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c9-9699-ea4d-3985380615be	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c9-9699-c8a2-f0f29274453a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c9-9699-aec3-9945bbf95a69	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c9-9699-16ea-f99e07dd26c2	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c9-9699-cfda-1bd8628d43d0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c9-9699-5050-e6e2adfb83dc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c9-9699-1952-2e819c5c67d2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c9-9699-1baf-b4fd52107034	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c9-9699-e972-5c8c7cb2efd1	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c9-9699-b76b-c370075209c3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c9-9699-c7a3-fca977052fd2	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c9-9699-5d4e-95dcd6f1add0	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c9-9699-2c3f-534f39b1d30f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c9-9699-a809-bccbf4ae0eb6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c9-9699-eee1-1bf10431e4cb	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c9-9699-cb9a-8a0bc77d88c2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c9-9699-b797-55eaaf52bb17	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c9-9699-789a-2f11a41eb023	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c9-9699-f3cd-4ddae1c49504	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c9-9699-7a1a-f7ee21b5fa10	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c9-9699-1463-45bb01a54b62	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c9-9699-28d2-7910a79660f7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c9-9699-411c-bf0f82ac7e9b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c9-9699-e6fa-e1baabe689f9	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c9-9699-40dd-0a3731a867e3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c9-9699-8166-2f2379e7ec27	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c9-9699-c3cd-e462b3c1065e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c9-9699-74b3-a5e43680acd1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c9-9699-c9a1-b15eb6fdd2e1	CA	CAN	124	Canada 	Kanada	\N
00040000-55c9-9699-f11c-af0a2ce08e18	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c9-9699-70ec-c5507e7094fb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c9-9699-8931-728c157bae3e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c9-9699-716d-8c095e26dcce	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c9-9699-5f7d-34f8e1ccce2a	CL	CHL	152	Chile 	Čile	\N
00040000-55c9-9699-a297-9a52fb5674c8	CN	CHN	156	China 	Kitajska	\N
00040000-55c9-9699-31e5-a05108d79b1f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c9-9699-ef96-c0e2349e7f4b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c9-9699-e399-81619205d450	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c9-9699-a1e1-1826caccf397	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c9-9699-6728-bd933d7c77cc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c9-9699-e7f1-beb77dd7580a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c9-9699-107a-32d0b3917226	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c9-9699-0937-67dc8c6758cc	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c9-9699-301f-a753e74e6fb2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c9-9699-b4a6-b929d9bd8680	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c9-9699-b985-5ae300257ce1	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c9-9699-3f27-ed745c7bf29a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c9-9699-2eac-cfb8cdb18b98	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c9-9699-9dee-fedafe08b602	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c9-9699-29ac-5f310932ed6f	DK	DNK	208	Denmark 	Danska	\N
00040000-55c9-9699-f84e-a613b0e63bc1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c9-9699-6904-799f733c156a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c9-9699-0656-0bca3eecb18c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c9-9699-6d55-45c2f233fe19	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c9-9699-cb22-38eff652d04c	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c9-9699-b7c2-ae9d1d9effff	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c9-9699-b20a-4f571443c0e2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c9-9699-02df-5c81c30798db	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c9-9699-81bc-8d885592a1a8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c9-9699-f97c-75c66f7f9935	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c9-9699-6885-9111232f4935	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c9-9699-caf2-cfcb85bf53f7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c9-9699-45e5-890d633e56e5	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c9-9699-8242-e6e7eda92de7	FI	FIN	246	Finland 	Finska	\N
00040000-55c9-9699-3e91-c633e1b3a51b	FR	FRA	250	France 	Francija	\N
00040000-55c9-9699-9e72-08eb44191aae	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c9-9699-bd2d-5fc1061fab82	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c9-9699-0829-fe10c2127c41	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c9-9699-a1bf-39606d980073	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c9-9699-deee-af8c24ea8e2a	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c9-9699-efdb-174669385ee7	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c9-9699-537f-2293ed07bc9c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c9-9699-275d-49895e86f0aa	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c9-9699-3156-65bdabe92c78	GH	GHA	288	Ghana 	Gana	\N
00040000-55c9-9699-cd31-79629e60b4b2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c9-9699-7eba-d5f3079837cb	GR	GRC	300	Greece 	Grčija	\N
00040000-55c9-9699-5822-9f1e008c6ed8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c9-9699-274e-7e745a8e72e2	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c9-9699-3075-718a90513d47	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c9-9699-ca45-c4c3c6d7ead0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c9-9699-f2f3-b31ec423eb5f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c9-9699-50f2-385b9524ff69	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c9-9699-4414-5c935cd78229	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c9-9699-1ced-5f47b7c877cd	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c9-9699-5d5d-a771c3722461	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c9-9699-0d19-0617fe5cbd64	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c9-9699-25a2-d436d9d90449	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c9-9699-3736-7249f6c90c26	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c9-9699-e716-0563841a6336	HN	HND	340	Honduras 	Honduras	\N
00040000-55c9-9699-ca3d-262ce70d771a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c9-9699-b645-84b08f5c9a59	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c9-9699-89ba-d59f044dfa8e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c9-9699-6bad-391fac493923	IN	IND	356	India 	Indija	\N
00040000-55c9-9699-09a6-d0ad59928c7a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c9-9699-986a-36f1af2c4980	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c9-9699-3667-4f5672b6ca05	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c9-9699-b69a-187c79f953a6	IE	IRL	372	Ireland 	Irska	\N
00040000-55c9-9699-9b5f-3d638b8f79e2	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c9-9699-1f24-ac191c91e35e	IL	ISR	376	Israel 	Izrael	\N
00040000-55c9-9699-dace-d6e0ad4ca9fa	IT	ITA	380	Italy 	Italija	\N
00040000-55c9-9699-4e5c-1ec62e3d896e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c9-9699-61a9-10d97f2db51c	JP	JPN	392	Japan 	Japonska	\N
00040000-55c9-9699-7c41-b400676d5e61	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c9-9699-88e8-fb5228db1747	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c9-9699-6960-2c057bf650d3	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c9-9699-4572-c7da82dcddfd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c9-9699-638a-bcd1efd8999c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c9-9699-5f22-efc7206ebd6b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c9-9699-3a21-a2f2752e0226	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c9-9699-efb4-e0e189856420	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c9-9699-c468-8117d52dba2b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c9-9699-c047-70433114cd33	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c9-9699-6cbe-e2717b732eaf	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c9-9699-46a3-5398d7eaacf0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c9-9699-a287-00fbc93ab75e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c9-9699-d762-34455ffcd1c2	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c9-9699-94d7-7fc4624049d4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c9-9699-cd87-fdb492564d3b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c9-9699-81e4-84545311435f	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c9-9699-6b56-b6142f0ea48b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c9-9699-77f5-7e31b18f3caa	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c9-9699-c82b-3e42a9cf97cd	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c9-9699-fd78-108269906cef	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c9-9699-b2df-9375363fbad6	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c9-9699-8f34-f7944ea582d9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c9-9699-86cf-1779843c2d6b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c9-9699-5383-5f42358a77f2	ML	MLI	466	Mali 	Mali	\N
00040000-55c9-9699-5e8c-202f379a0bab	MT	MLT	470	Malta 	Malta	\N
00040000-55c9-9699-860d-62420a19f0f6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c9-9699-4124-43b4d4f54066	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c9-9699-fcde-94f429903df2	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c9-9699-8fe7-fd53635605ce	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c9-9699-e487-6575368868e3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c9-9699-aad0-f43bd5e0f084	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c9-9699-7671-7980cbe72d5c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c9-9699-0163-12ca8c4d2be8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c9-9699-451d-d861689f643e	MC	MCO	492	Monaco 	Monako	\N
00040000-55c9-9699-5896-bfb888f5d806	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c9-9699-c4f3-30b253d7f58a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c9-9699-6b95-bf4e1124bbce	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c9-9699-9fbb-3dce82229c4a	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c9-9699-030d-8147e4bb4236	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c9-9699-3fc4-66cfb15c3e57	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c9-9699-fb1c-e7f1c1489899	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c9-9699-304b-b387a51356dc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c9-9699-6b6c-491f80ae97fd	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c9-9699-b2f6-9da8e76865a3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c9-9699-1abd-edc89e1064a2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c9-9699-5f4c-436e9a868383	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c9-9699-7b6c-4c267563bd54	NE	NER	562	Niger 	Niger 	\N
00040000-55c9-9699-7918-2e1308eb573b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c9-9699-4642-88f8bde087e7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c9-9699-61e8-609cba77b5fc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c9-9699-b8be-aed6f45ec411	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c9-9699-e246-ab3dcb3243e5	NO	NOR	578	Norway 	Norveška	\N
00040000-55c9-9699-6446-a2b5afc68340	OM	OMN	512	Oman 	Oman	\N
00040000-55c9-9699-3b8d-268b6ebbd31f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c9-9699-7613-18e783efa9b1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c9-9699-552f-10ea2657a1f0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c9-9699-713c-38bc1b6b4ae3	PA	PAN	591	Panama 	Panama	\N
00040000-55c9-9699-570b-36b10cb4a177	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c9-9699-efc6-19b694c1a8a8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c9-9699-fc61-7dcc004b795f	PE	PER	604	Peru 	Peru	\N
00040000-55c9-9699-d19a-58e1054f1a00	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c9-9699-52cd-8d0d062b6fa4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c9-9699-c7b7-4cd3ecaf4fb3	PL	POL	616	Poland 	Poljska	\N
00040000-55c9-9699-d439-0e29948cb1ad	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c9-9699-69c9-d33f9d96433e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c9-9699-b3bc-141629061a54	QA	QAT	634	Qatar 	Katar	\N
00040000-55c9-9699-1cd2-0f92d764f734	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c9-9699-089b-2f3c888f3d73	RO	ROU	642	Romania 	Romunija	\N
00040000-55c9-9699-0dce-080d13ac0192	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c9-9699-d4fe-59c901e5f4ba	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c9-9699-5b9d-d6728099d9bb	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c9-9699-bcb8-af5449189e70	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c9-9699-6b45-f234aa5779a7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c9-9699-f727-86a8015506b8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c9-9699-d011-9ee57e9b2bf6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c9-9699-08bb-1b3c33a47f65	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c9-9699-500a-733109c43dc6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c9-9699-9600-809be53fff66	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c9-9699-66b0-7336b4c35f3f	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c9-9699-1c8d-221e166aa5ba	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c9-9699-0b60-86810f7b2b49	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c9-9699-5be4-9bb389c4dddf	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c9-9699-549f-c14004e19180	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c9-9699-b7d6-61789e93cf1b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c9-9699-b0f5-d2c6f3bd45dd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c9-9699-cda9-1a1dafb650c0	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c9-9699-6668-05a2d22e3568	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c9-9699-247a-97641c846eb7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c9-9699-7b4e-595016312e83	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c9-9699-773f-a3e2ad24e658	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c9-9699-fa04-3fd108225736	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c9-9699-ff0c-0c838d3e47c5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c9-9699-8c7f-bf82a6229916	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c9-9699-a1b6-239596118762	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c9-9699-b87e-eab5d652a03b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c9-9699-2959-6719995e0798	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c9-9699-db3e-2cdd399fd74c	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c9-9699-f0c0-1a5d6fa6245a	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c9-9699-dff9-e8a86fc39548	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c9-9699-3c4f-3a9b027035a6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c9-9699-9594-1209bcaea7e1	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c9-9699-bd87-36ec67ee87c0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c9-9699-2270-d455fab65b6a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c9-9699-1b2c-a904d6526476	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c9-9699-5a96-2a9e9bb340e4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c9-9699-87ef-c2c9688a4679	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c9-9699-c7d6-c702def6a160	TH	THA	764	Thailand 	Tajska	\N
00040000-55c9-9699-7dcf-38bec4c98c5d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c9-9699-6933-cd0f5a072724	TG	TGO	768	Togo 	Togo	\N
00040000-55c9-9699-b524-dad0647dfaa6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c9-9699-3dbc-70cb8472eaa3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c9-9699-7503-d2b36fc8f957	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c9-9699-54de-8adc3d4f2760	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c9-9699-97b7-0171298a56d0	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c9-9699-8dba-710448305ebc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c9-9699-40c6-de44c2008158	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c9-9699-9533-425134d58a6f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c9-9699-cc4b-8b082e26fb0b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c9-9699-f67b-cab911f6c04e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c9-9699-3c9d-45fb67e59eba	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c9-9699-29e1-2f89e3250de9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c9-9699-ea45-7e56fdfbc0e1	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c9-9699-dc0f-b2ef5d2f50c8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c9-9699-4c6f-4e4f9ff85756	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c9-9699-40af-941bdffc358a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c9-9699-0d2a-bc7e9e35834b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c9-9699-8f8a-cefda31465b0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c9-9699-e2cd-d5ba97e1cda2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c9-9699-3b67-3b7c733e1ee0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c9-9699-8dfc-5ca379742b08	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c9-9699-2cde-79eba60f2716	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c9-9699-08cc-990c3809669b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c9-9699-5c3c-406a9ba986de	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c9-9699-6136-b07e27bd6ebf	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c9-9699-5c04-757c3a70d66d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 12690312)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55c9-969b-1e20-4fba6bc573ec	000e0000-55c9-969b-489c-ea2ae942d0b6	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c9-969a-ddac-bb748a3f56b8	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c9-969b-9beb-b2cd9cf240ab	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c9-969a-2425-5bff5596b24f	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c9-969b-c402-789903e15cc4	000e0000-55c9-969b-b948-c05f41f12450	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c9-969a-ddac-bb748a3f56b8	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c9-969b-5d9e-240ec678ecdb	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c9-969b-ef6b-c1b83245e285	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 12690139)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c9-969b-ca59-eb21850da92c	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c9-969a-8a5c-c98302f42e36
000d0000-55c9-969b-3a94-9371a5906527	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c9-969a-8a5c-c98302f42e36
000d0000-55c9-969b-27db-6b6cca755af6	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c9-969a-53ae-39c31f67de08
000d0000-55c9-969b-5a1f-0cde4f9382dc	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c9-969a-6e4e-b839f6bdcd13
000d0000-55c9-969b-c693-97440749a087	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c9-969a-8787-b6c06bea2e8c
000d0000-55c9-969b-9f8c-e7aa933ff871	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c9-969a-3ba2-dfd75ec59c02
000d0000-55c9-969b-1be4-18ab361f8dd2	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c9-969a-8a5c-c98302f42e36
000d0000-55c9-969b-902d-3a333896651c	000e0000-55c9-969b-ff6d-becc0b8f31b0	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c9-969a-091a-a23b42ba082f
\.


--
-- TOC entry 3010 (class 0 OID 12689955)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 12690003)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 12689935)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c9-969b-f98b-212ceab8d74f	00080000-55c9-969b-26dc-ab29b3974ce2	00090000-55c9-969b-702c-f6aaf35f1de6	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 12690056)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 12690523)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 12690535)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 12690558)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 12690081)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 12689892)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c9-969a-6526-6a481e778a80	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c9-969a-9a33-7e511cb80957	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c9-969a-38ae-b2d9c79c2002	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c9-969a-b166-f59865bcf180	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c9-969a-b18a-63049ecdb1b0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c9-969a-eeb2-4fe90a9ff4bd	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c9-969a-15ec-fb6912ee574e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c9-969a-cb3b-0a40fc1b0f22	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c9-969a-6e89-a47d93423501	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c9-969a-ae2f-a28acb3d7c94	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c9-969a-0d69-930d83ff996a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c9-969a-3fa9-97272da17a42	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c9-969a-dec0-266b36c88b74	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c9-969a-bceb-837cf77d73fd	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c9-969b-1f43-ab58631dfd93	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c9-969b-d9fe-fe9a9eb5a7ad	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c9-969b-8fd7-59e4ffe4e98d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c9-969b-e52f-99e4e4776c51	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c9-969b-7e26-9cd4f18831e9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c9-969b-99ff-38d4aaa6b0bc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 12689805)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c9-969b-7b6e-ddb7d4713ed3	00000000-55c9-969b-d9fe-fe9a9eb5a7ad	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c9-969b-39e6-42cb5b1245ad	00000000-55c9-969b-d9fe-fe9a9eb5a7ad	00010000-55c9-969a-52bd-713c0c131075	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c9-969b-8732-706390fc925d	00000000-55c9-969b-8fd7-59e4ffe4e98d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 12689816)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c9-969b-cbea-1147c891bbe8	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c9-969b-c7aa-a357d2a7366d	00010000-55c9-969b-b2ed-ae8c4c8c6caa	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c9-969b-6991-a44f1ca2dab2	00010000-55c9-969b-4f82-ca191dc10518	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c9-969b-5da8-ce52dede5db1	00010000-55c9-969b-a08b-14611984add0	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c9-969b-58fe-7342c166b885	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c9-969b-b7c6-456dec2e9695	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c9-969b-98d6-4c304fb1e510	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c9-969b-acde-fc04d04ade84	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c9-969b-702c-f6aaf35f1de6	00010000-55c9-969b-fd74-c9bbbf57faaf	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c9-969b-912a-1dfa00307480	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c9-969b-ec3a-4ce65467a53f	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c9-969b-ac5b-6ab4a2fbddb3	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c9-969b-83c0-14ddf0b5ae53	00010000-55c9-969b-9c83-205ac74ca2fb	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 12689770)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c9-969a-07ba-df75ea3916aa	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c9-969a-8930-a3be7745942b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c9-969a-78f8-38f74a1d86c9	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c9-969a-58be-44716b1fbd08	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c9-969a-9e0b-9410fd792063	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c9-969a-4e99-ddb19236e635	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c9-969a-3371-f29ed46186ff	Abonma-read	Abonma - branje	f
00030000-55c9-969a-292c-b138a94579f6	Abonma-write	Abonma - spreminjanje	f
00030000-55c9-969a-e043-73f1b21064f4	Alternacija-read	Alternacija - branje	f
00030000-55c9-969a-8869-713e299f07a4	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c9-969a-5d0c-49dca73cba2f	Arhivalija-read	Arhivalija - branje	f
00030000-55c9-969a-af12-77abadb6f625	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c9-969a-1b57-ed78bb4c0649	Besedilo-read	Besedilo - branje	f
00030000-55c9-969a-0aa0-b27d14fb0815	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c9-969a-3531-ec2d11c3c461	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c9-969a-d215-ba37664b7c33	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c9-969a-60d8-a08ef1fca19a	Dogodek-read	Dogodek - branje	f
00030000-55c9-969a-4ae8-b31d97f4f0b5	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c9-969a-5137-a9f5f6b3c787	DrugiVir-read	DrugiVir - branje	f
00030000-55c9-969a-934e-c2b97a62f1cf	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c9-969a-c094-2c6c603a44d2	Drzava-read	Drzava - branje	f
00030000-55c9-969a-5d1a-847d4329da74	Drzava-write	Drzava - spreminjanje	f
00030000-55c9-969a-05ea-056fcfb2f4ab	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c9-969a-b0cd-95f85d30b96c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c9-969a-6797-97610bdf3f6f	Funkcija-read	Funkcija - branje	f
00030000-55c9-969a-ad30-ca2423f7aada	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c9-969a-99ad-707d66aac3cc	Gostovanje-read	Gostovanje - branje	f
00030000-55c9-969a-d53b-397921a51461	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c9-969a-d995-d37637e66652	Gostujoca-read	Gostujoca - branje	f
00030000-55c9-969a-61d8-b4595aa09b85	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c9-969a-c034-13a7783dffa2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c9-969a-5943-7a34fb8a6cdb	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c9-969a-5674-6c85263ebabe	Kupec-read	Kupec - branje	f
00030000-55c9-969a-f8e7-e98fc9553393	Kupec-write	Kupec - spreminjanje	f
00030000-55c9-969a-3eec-c69c8d2514bf	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c9-969a-e3a5-c28052ac2630	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c9-969a-2ce4-556d4ec632e3	Option-read	Option - branje	f
00030000-55c9-969a-94db-4d73fc1e6f49	Option-write	Option - spreminjanje	f
00030000-55c9-969a-21bf-7adbd0be6f65	OptionValue-read	OptionValue - branje	f
00030000-55c9-969a-fda3-426269e52ec4	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c9-969a-641a-4977f0ce1797	Oseba-read	Oseba - branje	f
00030000-55c9-969a-2564-c0301c4d31c9	Oseba-write	Oseba - spreminjanje	f
00030000-55c9-969a-26cd-796e6c5372c0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c9-969a-5acd-7f17b17cddd9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c9-969a-1c3f-41bedd3317d2	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c9-969a-9464-389bf99f6a49	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c9-969a-9050-e14d24d623a0	Pogodba-read	Pogodba - branje	f
00030000-55c9-969a-288a-1cd75ea6b569	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c9-969a-ce86-dbe2ffea9a77	Popa-read	Popa - branje	f
00030000-55c9-969a-eb13-9e5972ccfd52	Popa-write	Popa - spreminjanje	f
00030000-55c9-969a-7aaf-2b2e4bfcb466	Posta-read	Posta - branje	f
00030000-55c9-969a-2aed-381a97fabd9e	Posta-write	Posta - spreminjanje	f
00030000-55c9-969a-d6a4-876ae02e0713	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c9-969a-f387-ec347d1859ad	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c9-969a-da2c-b74cd40abeb0	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c9-969a-767d-7146aef4ce5b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c9-969a-6c89-28543136403e	Predstava-read	Predstava - branje	f
00030000-55c9-969a-7904-4ed0927a977c	Predstava-write	Predstava - spreminjanje	f
00030000-55c9-969a-6c98-f5a2791c2dd7	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c9-969a-c393-02b4b98f10ba	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c9-969a-b905-a1ad7a9111d3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c9-969a-be96-32e08bdc7513	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c9-969a-ded1-59fd2dc1fb22	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c9-969a-7b24-14b77c73159a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c9-969a-bab5-d97f8a427b4f	ProgramDela-read	ProgramDela - branje	f
00030000-55c9-969a-caed-72fef41a5128	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c9-969a-a7bd-1ae48f873292	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c9-969a-e472-15bca50c8312	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c9-969a-7749-6ee45f8dc343	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c9-969a-defa-d47dc13a4496	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c9-969a-07ba-c54620f383e3	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c9-969a-c250-a4d1470d0207	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c9-969a-f870-89d2b72537c0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c9-969a-9fe4-e86125529d39	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c9-969a-7ac2-2a87d60b1e63	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c9-969a-bbb4-874e7dc96d5d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c9-969a-7b94-f864b5e10062	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c9-969a-bc41-13f1a8624ad4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c9-969a-e08b-18b5fc4fe8a4	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c9-969a-f4eb-ef938f4f6f6d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c9-969a-c061-3750ac478729	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c9-969a-dbf1-eafdb5a3c6f2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c9-969a-3fb9-aadfd4724b52	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c9-969a-036e-f9f6585991fa	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c9-969a-32c8-72e18988956d	Prostor-read	Prostor - branje	f
00030000-55c9-969a-ebb8-755641460eb8	Prostor-write	Prostor - spreminjanje	f
00030000-55c9-969a-b3fc-15c6c7debf13	Racun-read	Racun - branje	f
00030000-55c9-969a-dc97-21276a4f3680	Racun-write	Racun - spreminjanje	f
00030000-55c9-969a-6c6a-32633e1cfd18	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c9-969a-ac69-4110890e005d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c9-969a-a269-1fe9842e5153	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c9-969a-10c3-5b415f179e8d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c9-969a-ee30-625955b3af05	Rekvizit-read	Rekvizit - branje	f
00030000-55c9-969a-0ceb-83920d7357b4	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c9-969a-f9b9-6cce91cdd441	Revizija-read	Revizija - branje	f
00030000-55c9-969a-f789-53e432b1b3a8	Revizija-write	Revizija - spreminjanje	f
00030000-55c9-969a-48af-adf5a06920b6	Rezervacija-read	Rezervacija - branje	f
00030000-55c9-969a-8a9e-33a37f12347f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c9-969a-7b0e-76ff3d45fe9d	SedezniRed-read	SedezniRed - branje	f
00030000-55c9-969a-77f1-ecf5f634323b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c9-969a-1eaa-f247ee13f07c	Sedez-read	Sedez - branje	f
00030000-55c9-969a-36e6-65df27bf8c37	Sedez-write	Sedez - spreminjanje	f
00030000-55c9-969a-7deb-41d1871f4e1b	Sezona-read	Sezona - branje	f
00030000-55c9-969a-b906-2040d91b0f3e	Sezona-write	Sezona - spreminjanje	f
00030000-55c9-969a-4f03-e32842facaec	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c9-969a-e5d2-fd548fad4822	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c9-969a-25a2-36728594bd8c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c9-969a-046c-6075c73f4e2c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c9-969a-4353-b521613d566f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c9-969a-27c3-e01850a512b9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c9-969a-7d76-0cd5eaeb9700	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c9-969a-c0b8-ca6b462afde6	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c9-969a-0d2f-c5fbced174c5	Telefonska-read	Telefonska - branje	f
00030000-55c9-969a-751f-5babe997da6f	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c9-969a-da27-a145f166a162	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c9-969a-a210-590f27493d2c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c9-969a-a464-81261c2daef7	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c9-969a-de84-f56e66473226	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c9-969a-4bbc-0bfe37589a16	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c9-969a-1bae-d8bbe56e72c7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c9-969a-27c8-85cf7107dee1	Trr-read	Trr - branje	f
00030000-55c9-969a-f250-7d5b79131a33	Trr-write	Trr - spreminjanje	f
00030000-55c9-969a-4d1e-c6ea6a1997d2	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c9-969a-3918-1417538dd472	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c9-969a-1ad9-59543aed0d21	Vaja-read	Vaja - branje	f
00030000-55c9-969a-c923-c4e50f5d7dd9	Vaja-write	Vaja - spreminjanje	f
00030000-55c9-969a-4584-0c4c970d0b08	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c9-969a-0d91-cc29025c256c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c9-969a-286b-0bd75b986531	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c9-969a-c5e8-3acf57409507	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c9-969a-cb65-e2fffda1a960	Zasedenost-read	Zasedenost - branje	f
00030000-55c9-969a-27b3-66f4c8c03a36	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c9-969a-dc60-a6bcca0f4874	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c9-969a-e85b-a2e8b935ce6e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c9-969a-b1cd-76ffed5e627d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c9-969a-d9d7-456484a4fe93	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c9-969a-9717-f328a0204fbc	ClSkupina-write	Checkliste - urejanje skupin	f
00030000-55c9-969a-2d4a-94a985c9d8f2	ClSkupina-read	Checkliste - branje skupin	f
00030000-55c9-969a-ec61-acbd678d701e	ClSekcija-write	Checkliste - urejanje sekcij	f
00030000-55c9-969a-5578-414cd8cc88f6	ClSekcija-read	Checkliste - branje sekcij	f
00030000-55c9-969a-1fb8-817278379d0d	ClVzorec-write	Checkliste - urejanje glave chekcliste	f
00030000-55c9-969a-9e86-0cd09d38e7ae	ClVzorec-read	Checkliste - branje checkliste	f
00030000-55c9-969a-19e4-353b52cbc94a	ClVzorecPostavka-write	Checkliste - urejanje postavke chekcliste	f
00030000-55c9-969a-7998-b27f9be5a2f2	ClVzorecPostavka-read	Checkliste - branje postavke checkliste	f
00030000-55c9-969a-45bd-5ab576eb1937	ClPregled-write	Checkliste - Razpis checklist  - generično dovoljenje	f
00030000-55c9-969a-8f0a-e6b65504512c	ClPregled-read	Checkliste - branje izpolnjenih checklist - generično dovoljenje	f
00030000-55c9-969a-17cb-ad61aae5bf35	ClVrednost-write	Checkliste - izpolnjevanje checklist - generični permission	f
00030000-55c9-969a-8c5e-25aa9107029c	ClVrednost-read	Checkliste - branje vrednosti checkliste - generični permission	f
\.


--
-- TOC entry 2997 (class 0 OID 12689789)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c9-969a-a71e-aef1272ed20f	00030000-55c9-969a-8930-a3be7745942b
00020000-55c9-969a-bc39-8b120bd0c67f	00030000-55c9-969a-c094-2c6c603a44d2
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-3371-f29ed46186ff
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-292c-b138a94579f6
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-e043-73f1b21064f4
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-8869-713e299f07a4
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-5d0c-49dca73cba2f
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-60d8-a08ef1fca19a
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-58be-44716b1fbd08
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-4ae8-b31d97f4f0b5
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-c094-2c6c603a44d2
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-5d1a-847d4329da74
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-6797-97610bdf3f6f
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-ad30-ca2423f7aada
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-99ad-707d66aac3cc
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-d53b-397921a51461
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-d995-d37637e66652
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-61d8-b4595aa09b85
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-c034-13a7783dffa2
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-5943-7a34fb8a6cdb
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-2ce4-556d4ec632e3
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-21bf-7adbd0be6f65
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-641a-4977f0ce1797
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-2564-c0301c4d31c9
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-ce86-dbe2ffea9a77
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-eb13-9e5972ccfd52
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-7aaf-2b2e4bfcb466
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-2aed-381a97fabd9e
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-da2c-b74cd40abeb0
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-767d-7146aef4ce5b
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-6c89-28543136403e
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-7904-4ed0927a977c
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-ded1-59fd2dc1fb22
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-7b24-14b77c73159a
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-32c8-72e18988956d
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-ebb8-755641460eb8
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-a269-1fe9842e5153
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-10c3-5b415f179e8d
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-ee30-625955b3af05
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-0ceb-83920d7357b4
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-7deb-41d1871f4e1b
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-b906-2040d91b0f3e
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-a464-81261c2daef7
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-4d1e-c6ea6a1997d2
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-3918-1417538dd472
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-1ad9-59543aed0d21
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-c923-c4e50f5d7dd9
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-cb65-e2fffda1a960
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-27b3-66f4c8c03a36
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-dc60-a6bcca0f4874
00020000-55c9-969a-1071-70a5b3a1773f	00030000-55c9-969a-b1cd-76ffed5e627d
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-3371-f29ed46186ff
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-5d0c-49dca73cba2f
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-60d8-a08ef1fca19a
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-c094-2c6c603a44d2
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-99ad-707d66aac3cc
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-d995-d37637e66652
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-c034-13a7783dffa2
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-5943-7a34fb8a6cdb
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-2ce4-556d4ec632e3
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-21bf-7adbd0be6f65
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-641a-4977f0ce1797
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-2564-c0301c4d31c9
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-ce86-dbe2ffea9a77
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-7aaf-2b2e4bfcb466
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-da2c-b74cd40abeb0
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-767d-7146aef4ce5b
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-6c89-28543136403e
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-32c8-72e18988956d
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-a269-1fe9842e5153
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-ee30-625955b3af05
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-7deb-41d1871f4e1b
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-0d2f-c5fbced174c5
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-751f-5babe997da6f
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-27c8-85cf7107dee1
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-f250-7d5b79131a33
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-286b-0bd75b986531
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-c5e8-3acf57409507
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-dc60-a6bcca0f4874
00020000-55c9-969a-a75b-06a42f082984	00030000-55c9-969a-b1cd-76ffed5e627d
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-3371-f29ed46186ff
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-e043-73f1b21064f4
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-5d0c-49dca73cba2f
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-af12-77abadb6f625
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-1b57-ed78bb4c0649
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-3531-ec2d11c3c461
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-60d8-a08ef1fca19a
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-c094-2c6c603a44d2
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-6797-97610bdf3f6f
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-99ad-707d66aac3cc
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-d995-d37637e66652
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-c034-13a7783dffa2
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-2ce4-556d4ec632e3
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-21bf-7adbd0be6f65
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-641a-4977f0ce1797
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-ce86-dbe2ffea9a77
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-7aaf-2b2e4bfcb466
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-6c89-28543136403e
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-ded1-59fd2dc1fb22
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-32c8-72e18988956d
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-a269-1fe9842e5153
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-ee30-625955b3af05
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-7deb-41d1871f4e1b
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-a464-81261c2daef7
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-1ad9-59543aed0d21
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-cb65-e2fffda1a960
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-dc60-a6bcca0f4874
00020000-55c9-969a-35a9-5d1babbff0de	00030000-55c9-969a-b1cd-76ffed5e627d
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-3371-f29ed46186ff
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-292c-b138a94579f6
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-8869-713e299f07a4
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-5d0c-49dca73cba2f
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-60d8-a08ef1fca19a
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-c094-2c6c603a44d2
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-99ad-707d66aac3cc
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-d995-d37637e66652
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-2ce4-556d4ec632e3
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-21bf-7adbd0be6f65
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-ce86-dbe2ffea9a77
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-7aaf-2b2e4bfcb466
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-6c89-28543136403e
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-32c8-72e18988956d
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-a269-1fe9842e5153
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-ee30-625955b3af05
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-7deb-41d1871f4e1b
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-a464-81261c2daef7
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-dc60-a6bcca0f4874
00020000-55c9-969a-9b29-2b7a3721bf04	00030000-55c9-969a-b1cd-76ffed5e627d
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-3371-f29ed46186ff
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-5d0c-49dca73cba2f
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-60d8-a08ef1fca19a
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-c094-2c6c603a44d2
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-99ad-707d66aac3cc
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-d995-d37637e66652
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-2ce4-556d4ec632e3
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-21bf-7adbd0be6f65
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-ce86-dbe2ffea9a77
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-7aaf-2b2e4bfcb466
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-6c89-28543136403e
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-32c8-72e18988956d
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-a269-1fe9842e5153
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-ee30-625955b3af05
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-7deb-41d1871f4e1b
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-da27-a145f166a162
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-78f8-38f74a1d86c9
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-a464-81261c2daef7
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-dc60-a6bcca0f4874
00020000-55c9-969a-090f-5793e7548552	00030000-55c9-969a-b1cd-76ffed5e627d
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-07ba-df75ea3916aa
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-8930-a3be7745942b
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-78f8-38f74a1d86c9
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-58be-44716b1fbd08
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-9e0b-9410fd792063
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-4e99-ddb19236e635
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-3371-f29ed46186ff
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-292c-b138a94579f6
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-e043-73f1b21064f4
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-8869-713e299f07a4
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-5d0c-49dca73cba2f
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-af12-77abadb6f625
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-1b57-ed78bb4c0649
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-0aa0-b27d14fb0815
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-3531-ec2d11c3c461
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-d215-ba37664b7c33
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-60d8-a08ef1fca19a
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-4ae8-b31d97f4f0b5
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-c094-2c6c603a44d2
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-5d1a-847d4329da74
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-5137-a9f5f6b3c787
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-934e-c2b97a62f1cf
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-05ea-056fcfb2f4ab
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-b0cd-95f85d30b96c
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-6797-97610bdf3f6f
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-ad30-ca2423f7aada
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-99ad-707d66aac3cc
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-d53b-397921a51461
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-d995-d37637e66652
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-61d8-b4595aa09b85
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-c034-13a7783dffa2
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-5943-7a34fb8a6cdb
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-5674-6c85263ebabe
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-f8e7-e98fc9553393
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-3eec-c69c8d2514bf
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-e3a5-c28052ac2630
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-2ce4-556d4ec632e3
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-94db-4d73fc1e6f49
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-21bf-7adbd0be6f65
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-fda3-426269e52ec4
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-641a-4977f0ce1797
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-2564-c0301c4d31c9
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-26cd-796e6c5372c0
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-5acd-7f17b17cddd9
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-1c3f-41bedd3317d2
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-9464-389bf99f6a49
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-9050-e14d24d623a0
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-288a-1cd75ea6b569
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-ce86-dbe2ffea9a77
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-eb13-9e5972ccfd52
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7aaf-2b2e4bfcb466
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-2aed-381a97fabd9e
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-d6a4-876ae02e0713
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-f387-ec347d1859ad
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-da2c-b74cd40abeb0
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-767d-7146aef4ce5b
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-6c89-28543136403e
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7904-4ed0927a977c
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-6c98-f5a2791c2dd7
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-c393-02b4b98f10ba
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-b905-a1ad7a9111d3
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-be96-32e08bdc7513
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-ded1-59fd2dc1fb22
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7b24-14b77c73159a
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-bab5-d97f8a427b4f
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-caed-72fef41a5128
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-a7bd-1ae48f873292
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-e472-15bca50c8312
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7749-6ee45f8dc343
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-defa-d47dc13a4496
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-07ba-c54620f383e3
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-c250-a4d1470d0207
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-f870-89d2b72537c0
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-9fe4-e86125529d39
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7ac2-2a87d60b1e63
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-bbb4-874e7dc96d5d
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7b94-f864b5e10062
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-bc41-13f1a8624ad4
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-e08b-18b5fc4fe8a4
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-f4eb-ef938f4f6f6d
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-c061-3750ac478729
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-dbf1-eafdb5a3c6f2
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-3fb9-aadfd4724b52
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-036e-f9f6585991fa
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-32c8-72e18988956d
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-ebb8-755641460eb8
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-b3fc-15c6c7debf13
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-dc97-21276a4f3680
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-6c6a-32633e1cfd18
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-ac69-4110890e005d
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-a269-1fe9842e5153
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-10c3-5b415f179e8d
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-ee30-625955b3af05
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-0ceb-83920d7357b4
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-f9b9-6cce91cdd441
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-f789-53e432b1b3a8
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-48af-adf5a06920b6
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-8a9e-33a37f12347f
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7b0e-76ff3d45fe9d
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-77f1-ecf5f634323b
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-1eaa-f247ee13f07c
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-36e6-65df27bf8c37
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7deb-41d1871f4e1b
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-b906-2040d91b0f3e
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-4f03-e32842facaec
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-e5d2-fd548fad4822
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-25a2-36728594bd8c
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-046c-6075c73f4e2c
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-4353-b521613d566f
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-27c3-e01850a512b9
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-7d76-0cd5eaeb9700
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-c0b8-ca6b462afde6
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-0d2f-c5fbced174c5
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-751f-5babe997da6f
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-da27-a145f166a162
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-a210-590f27493d2c
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-a464-81261c2daef7
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-de84-f56e66473226
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-4bbc-0bfe37589a16
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-1bae-d8bbe56e72c7
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-27c8-85cf7107dee1
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-f250-7d5b79131a33
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-4d1e-c6ea6a1997d2
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-3918-1417538dd472
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-1ad9-59543aed0d21
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-c923-c4e50f5d7dd9
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-4584-0c4c970d0b08
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-0d91-cc29025c256c
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-286b-0bd75b986531
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-c5e8-3acf57409507
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-cb65-e2fffda1a960
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-27b3-66f4c8c03a36
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-dc60-a6bcca0f4874
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-e85b-a2e8b935ce6e
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-b1cd-76ffed5e627d
00020000-55c9-969b-8d7b-547864daac94	00030000-55c9-969a-d9d7-456484a4fe93
\.


--
-- TOC entry 3025 (class 0 OID 12690088)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 12690119)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 12690233)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c9-969b-e000-1b0ea1ee2ad5	00090000-55c9-969b-cbea-1147c891bbe8	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c9-969b-762f-59e4dee458e7	00090000-55c9-969b-b7c6-456dec2e9695	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c9-969b-8b43-f986b6304ae6	00090000-55c9-969b-83c0-14ddf0b5ae53	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 12689849)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c9-969b-26dc-ab29b3974ce2	00040000-55c9-9699-7b4e-595016312e83	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c9-969b-1c60-3af0a405e24c	00040000-55c9-9699-7b4e-595016312e83	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c9-969b-8a91-340f89ad77ba	00040000-55c9-9699-7b4e-595016312e83	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c9-969b-7e7c-1259c655f1d8	00040000-55c9-9699-7b4e-595016312e83	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c9-969b-a865-a85478eaf45f	00040000-55c9-9699-7b4e-595016312e83	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c9-969b-ab2f-c2e81618fdcd	00040000-55c9-9699-9450-511511ce53c8	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c9-969b-dec1-8af47cdad67f	00040000-55c9-9699-b4a6-b929d9bd8680	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c9-969b-1ea6-f95f7ea83b1a	00040000-55c9-9699-16ea-f99e07dd26c2	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c9-969b-e62a-b6f696797074	00040000-55c9-9699-7b4e-595016312e83	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 12689884)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c9-969a-bfd1-82f6d40ae40a	8341	Adlešiči
00050000-55c9-969a-1457-406fc4f35fa3	5270	Ajdovščina
00050000-55c9-969a-0074-221612cc923b	6280	Ankaran/Ancarano
00050000-55c9-969a-2305-c2707abb1df0	9253	Apače
00050000-55c9-969a-9be3-0ccf99597366	8253	Artiče
00050000-55c9-969a-a19f-efcc9a31a7aa	4275	Begunje na Gorenjskem
00050000-55c9-969a-4dfe-56c5a55585a1	1382	Begunje pri Cerknici
00050000-55c9-969a-d565-a32efeb33680	9231	Beltinci
00050000-55c9-969a-2679-dfc82da40834	2234	Benedikt
00050000-55c9-969a-2679-63df8a10ea0f	2345	Bistrica ob Dravi
00050000-55c9-969a-c929-389feaedea03	3256	Bistrica ob Sotli
00050000-55c9-969a-ecb1-372e6781bfdd	8259	Bizeljsko
00050000-55c9-969a-15f6-b152f4ed2444	1223	Blagovica
00050000-55c9-969a-8561-36313a73bb2e	8283	Blanca
00050000-55c9-969a-baeb-e07c32fc5646	4260	Bled
00050000-55c9-969a-47a8-19e19d797bad	4273	Blejska Dobrava
00050000-55c9-969a-5422-65a87d1d710b	9265	Bodonci
00050000-55c9-969a-c50c-2bd904bf335f	9222	Bogojina
00050000-55c9-969a-349e-e20ab25f09a9	4263	Bohinjska Bela
00050000-55c9-969a-6fd1-2eb4c2ff11d0	4264	Bohinjska Bistrica
00050000-55c9-969a-1a54-74670bd6e56c	4265	Bohinjsko jezero
00050000-55c9-969a-ec16-ef3ca03a1cb4	1353	Borovnica
00050000-55c9-969a-2cc2-09562bef32c3	8294	Boštanj
00050000-55c9-969a-3e19-81d47c9431da	5230	Bovec
00050000-55c9-969a-9284-3b240445e381	5295	Branik
00050000-55c9-969a-6dcf-c9a0d6806acc	3314	Braslovče
00050000-55c9-969a-5eac-a80ff0f7f0d0	5223	Breginj
00050000-55c9-969a-4f7f-6e913ffd4b4e	8280	Brestanica
00050000-55c9-969a-d711-867d69a4126c	2354	Bresternica
00050000-55c9-969a-2549-28bc2646573f	4243	Brezje
00050000-55c9-969a-0767-5cf75f5a9a77	1351	Brezovica pri Ljubljani
00050000-55c9-969a-7d6d-19afcfc6cefe	8250	Brežice
00050000-55c9-969a-e3b0-2f1c85d8b002	4210	Brnik - Aerodrom
00050000-55c9-969a-927f-6e9883c082ee	8321	Brusnice
00050000-55c9-969a-1084-21c587c7fa0e	3255	Buče
00050000-55c9-969a-8a16-d7be2e17d78c	8276	Bučka 
00050000-55c9-969a-4c5b-01d9faedfe8e	9261	Cankova
00050000-55c9-969a-a508-211b84a3655c	3000	Celje 
00050000-55c9-969a-932b-ca72502bc564	3001	Celje - poštni predali
00050000-55c9-969a-2295-d1930caf886a	4207	Cerklje na Gorenjskem
00050000-55c9-969a-2a4d-ac29b2dcc5ab	8263	Cerklje ob Krki
00050000-55c9-969a-85ff-f9a24a4e1042	1380	Cerknica
00050000-55c9-969a-18b7-bc22fb108b12	5282	Cerkno
00050000-55c9-969a-ac62-abd98e3ea1b2	2236	Cerkvenjak
00050000-55c9-969a-1820-b043eed21068	2215	Ceršak
00050000-55c9-969a-5516-f5303b79262a	2326	Cirkovce
00050000-55c9-969a-280e-11e39ca065db	2282	Cirkulane
00050000-55c9-969a-c3cd-97cfaa79db97	5273	Col
00050000-55c9-969a-27b1-c02d2de0e200	8251	Čatež ob Savi
00050000-55c9-969a-ff62-9461b989c617	1413	Čemšenik
00050000-55c9-969a-f9cc-07a5903b6d6a	5253	Čepovan
00050000-55c9-969a-ede5-5df3761561fa	9232	Črenšovci
00050000-55c9-969a-55be-a675f7679d10	2393	Črna na Koroškem
00050000-55c9-969a-d731-89884081ed7c	6275	Črni Kal
00050000-55c9-969a-411a-ee6198106374	5274	Črni Vrh nad Idrijo
00050000-55c9-969a-8f76-0686812f59ba	5262	Črniče
00050000-55c9-969a-937d-e575a5717c60	8340	Črnomelj
00050000-55c9-969a-96e5-e00d84090dbe	6271	Dekani
00050000-55c9-969a-faf2-09467f1cd722	5210	Deskle
00050000-55c9-969a-cdf4-0770a7cdd650	2253	Destrnik
00050000-55c9-969a-e4e2-7a51128991fe	6215	Divača
00050000-55c9-969a-09b7-8ef460223600	1233	Dob
00050000-55c9-969a-6c7d-0cad3e8a86f2	3224	Dobje pri Planini
00050000-55c9-969a-5b1e-544c456a8ca1	8257	Dobova
00050000-55c9-969a-cd55-477491454adb	1423	Dobovec
00050000-55c9-969a-44d5-10c3239baf3e	5263	Dobravlje
00050000-55c9-969a-dced-bffbcfd3c82e	3204	Dobrna
00050000-55c9-969a-66a4-e6855c626ac1	8211	Dobrnič
00050000-55c9-969a-6f25-77aaa3a0ff99	1356	Dobrova
00050000-55c9-969a-265c-7b677f3fdf23	9223	Dobrovnik/Dobronak 
00050000-55c9-969a-5e3b-8fa58a0219b4	5212	Dobrovo v Brdih
00050000-55c9-969a-5a6c-ab5ac86e2252	1431	Dol pri Hrastniku
00050000-55c9-969a-1093-9e7f2ac2fe4c	1262	Dol pri Ljubljani
00050000-55c9-969a-7755-179de2caf404	1273	Dole pri Litiji
00050000-55c9-969a-81a8-8517f55e7b9c	1331	Dolenja vas
00050000-55c9-969a-914a-3f003dca3cca	8350	Dolenjske Toplice
00050000-55c9-969a-f90d-24556990b931	1230	Domžale
00050000-55c9-969a-80cb-8227de66c3af	2252	Dornava
00050000-55c9-969a-31fc-b51375b6ea39	5294	Dornberk
00050000-55c9-969a-8966-4e1b415ca7d2	1319	Draga
00050000-55c9-969a-51fd-6c6a4461c1d3	8343	Dragatuš
00050000-55c9-969a-e455-7b7fa3022de9	3222	Dramlje
00050000-55c9-969a-0f21-daf45a4fbfd3	2370	Dravograd
00050000-55c9-969a-9686-930e5f3c4bc7	4203	Duplje
00050000-55c9-969a-12bb-24ea25be0261	6221	Dutovlje
00050000-55c9-969a-23ad-3eff2b6c6e0f	8361	Dvor
00050000-55c9-969a-2d93-45a2a51adf92	2343	Fala
00050000-55c9-969a-b6d3-a587e6de470f	9208	Fokovci
00050000-55c9-969a-3d67-ea6c9b01bfbe	2313	Fram
00050000-55c9-969a-bd4b-a7a60459f4c8	3213	Frankolovo
00050000-55c9-969a-c20e-f444e00c3397	1274	Gabrovka
00050000-55c9-969a-f8fa-06e576bce9de	8254	Globoko
00050000-55c9-969a-5eed-1daef998f4d9	5275	Godovič
00050000-55c9-969a-b799-6c3bb8fb0250	4204	Golnik
00050000-55c9-969a-17d4-ea46f902c4ef	3303	Gomilsko
00050000-55c9-969a-7819-613d361272d3	4224	Gorenja vas
00050000-55c9-969a-eb4c-efa4ed9bde91	3263	Gorica pri Slivnici
00050000-55c9-969a-1900-30bba9373384	2272	Gorišnica
00050000-55c9-969a-0bdd-8440c42c5f41	9250	Gornja Radgona
00050000-55c9-969a-1775-874f604d9022	3342	Gornji Grad
00050000-55c9-969a-80f6-3dcb7ca1504e	4282	Gozd Martuljek
00050000-55c9-969a-71f0-f396ef8e6d13	6272	Gračišče
00050000-55c9-969a-8249-a957b71d99ff	9264	Grad
00050000-55c9-969a-b21d-ed872542434e	8332	Gradac
00050000-55c9-969a-2282-a363186d61ef	1384	Grahovo
00050000-55c9-969a-46fb-aba3649e335e	5242	Grahovo ob Bači
00050000-55c9-969a-727c-9d568ad4df5d	5251	Grgar
00050000-55c9-969a-c182-21652c283023	3302	Griže
00050000-55c9-969a-3788-b899e213b1ec	3231	Grobelno
00050000-55c9-969a-8925-0c5224301bb7	1290	Grosuplje
00050000-55c9-969a-7e4c-5c775afbe018	2288	Hajdina
00050000-55c9-969a-1116-31bb6a55acb9	8362	Hinje
00050000-55c9-969a-04cc-8e0b61637849	2311	Hoče
00050000-55c9-969a-24a1-3ddc33b83e56	9205	Hodoš/Hodos
00050000-55c9-969a-cafc-36f12d15af58	1354	Horjul
00050000-55c9-969a-b9f9-e14b2ac50074	1372	Hotedršica
00050000-55c9-969a-beee-c60089b0e92b	1430	Hrastnik
00050000-55c9-969a-3213-4eddd616e4a3	6225	Hruševje
00050000-55c9-969a-a10c-eb5d571fd755	4276	Hrušica
00050000-55c9-969a-03e8-ed3c3dd9ac5e	5280	Idrija
00050000-55c9-969a-0ff2-f6829f353bf2	1292	Ig
00050000-55c9-969a-58ac-a4bc41219f83	6250	Ilirska Bistrica
00050000-55c9-969a-6ec5-f284d46a001b	6251	Ilirska Bistrica-Trnovo
00050000-55c9-969a-ef2b-f3dd2282773d	1295	Ivančna Gorica
00050000-55c9-969a-3228-e90465bfa2b9	2259	Ivanjkovci
00050000-55c9-969a-fc08-b9b6ae46d769	1411	Izlake
00050000-55c9-969a-80cc-026a8e10449e	6310	Izola/Isola
00050000-55c9-969a-6c3b-921e14b4d6b6	2222	Jakobski Dol
00050000-55c9-969a-b0bc-7b046a944d3d	2221	Jarenina
00050000-55c9-969a-2325-d6ff3fdc7646	6254	Jelšane
00050000-55c9-969a-3ee5-fb40fde3e877	4270	Jesenice
00050000-55c9-969a-d256-5075e188d354	8261	Jesenice na Dolenjskem
00050000-55c9-969a-9979-1bef1ab1fabc	3273	Jurklošter
00050000-55c9-969a-0125-474584130dac	2223	Jurovski Dol
00050000-55c9-969a-588b-a450b6e2f328	2256	Juršinci
00050000-55c9-969a-360c-4ac2545245e4	5214	Kal nad Kanalom
00050000-55c9-969a-ab43-b1e3fec55cd8	3233	Kalobje
00050000-55c9-969a-9827-2ffd1d34e067	4246	Kamna Gorica
00050000-55c9-969a-9b09-660e186e7651	2351	Kamnica
00050000-55c9-969a-32f9-213cd0fcbfd3	1241	Kamnik
00050000-55c9-969a-e0ee-7d07ca88bce2	5213	Kanal
00050000-55c9-969a-57c0-14fbbe82c886	8258	Kapele
00050000-55c9-969a-970b-253facd64b5c	2362	Kapla
00050000-55c9-969a-163a-f89f0a56b20d	2325	Kidričevo
00050000-55c9-969a-b1a2-bb62b106e4a8	1412	Kisovec
00050000-55c9-969a-3535-1747b6eaeccf	6253	Knežak
00050000-55c9-969a-9f9a-5ca98fde0d27	5222	Kobarid
00050000-55c9-969a-0450-992dc682abc4	9227	Kobilje
00050000-55c9-969a-df89-75b69f93329c	1330	Kočevje
00050000-55c9-969a-6f85-7c03cc2af603	1338	Kočevska Reka
00050000-55c9-969a-f204-f18eab1ab2cf	2276	Kog
00050000-55c9-969a-9559-df0f356a7755	5211	Kojsko
00050000-55c9-969a-a3a8-07e0fc9a1325	6223	Komen
00050000-55c9-969a-6e4b-f05eb13049f7	1218	Komenda
00050000-55c9-969a-b18e-18aac1cdf937	6000	Koper/Capodistria 
00050000-55c9-969a-7ef0-e9eb63688eb9	6001	Koper/Capodistria - poštni predali
00050000-55c9-969a-90ad-a6da35129b69	8282	Koprivnica
00050000-55c9-969a-1fa9-b1bebca9c9fb	5296	Kostanjevica na Krasu
00050000-55c9-969a-ade7-3f02d2de9200	8311	Kostanjevica na Krki
00050000-55c9-969a-d57f-ec354c4206cf	1336	Kostel
00050000-55c9-969a-cfcf-a7f7baba06a4	6256	Košana
00050000-55c9-969a-546a-51b34f9e5d5a	2394	Kotlje
00050000-55c9-969a-3b21-da296ef7ab91	6240	Kozina
00050000-55c9-969a-9c25-1684f4ef66e0	3260	Kozje
00050000-55c9-969a-cf97-9d3b2bede947	4000	Kranj 
00050000-55c9-969a-82a2-7ecb17960ad1	4001	Kranj - poštni predali
00050000-55c9-969a-9b00-f5cab77e6d43	4280	Kranjska Gora
00050000-55c9-969a-25d3-cd8a2dde4e96	1281	Kresnice
00050000-55c9-969a-36aa-10b83cfea566	4294	Križe
00050000-55c9-969a-f25d-81d57dc992cf	9206	Križevci
00050000-55c9-969a-cff0-c34ae02ef015	9242	Križevci pri Ljutomeru
00050000-55c9-969a-3055-737aed254916	1301	Krka
00050000-55c9-969a-e627-ad86cb4a04d5	8296	Krmelj
00050000-55c9-969a-49b9-180c1a8e3e16	4245	Kropa
00050000-55c9-969a-c484-8e75619a0d5b	8262	Krška vas
00050000-55c9-969a-1181-6730a1220c46	8270	Krško
00050000-55c9-969a-bdfe-483cef49ea0e	9263	Kuzma
00050000-55c9-969a-d583-6959335e2417	2318	Laporje
00050000-55c9-969a-dd44-353ea81f4568	3270	Laško
00050000-55c9-969a-548c-a2428383e0c9	1219	Laze v Tuhinju
00050000-55c9-969a-55ae-e1eea949e61f	2230	Lenart v Slovenskih goricah
00050000-55c9-969a-8bf3-73e52634d90c	9220	Lendava/Lendva
00050000-55c9-969a-1b45-0e1eaee68496	4248	Lesce
00050000-55c9-969a-47c4-5392bbf29dbb	3261	Lesično
00050000-55c9-969a-5444-4ccfb571cb49	8273	Leskovec pri Krškem
00050000-55c9-969a-d7e9-3209bc3cb6ce	2372	Libeliče
00050000-55c9-969a-6572-63cfc0196e8e	2341	Limbuš
00050000-55c9-969a-7a0b-bc3523d2c77a	1270	Litija
00050000-55c9-969a-f8df-e53f503d4307	3202	Ljubečna
00050000-55c9-969a-2827-c60e7a3147ab	1000	Ljubljana 
00050000-55c9-969a-54c7-f299bb783bde	1001	Ljubljana - poštni predali
00050000-55c9-969a-e872-5a9f6ad44990	1231	Ljubljana - Črnuče
00050000-55c9-969a-f36c-5bdb679fd964	1261	Ljubljana - Dobrunje
00050000-55c9-969a-a9a9-4103fc340810	1260	Ljubljana - Polje
00050000-55c9-969a-00ba-64b8f9b2e8a8	1210	Ljubljana - Šentvid
00050000-55c9-969a-7de1-b6ba3a127048	1211	Ljubljana - Šmartno
00050000-55c9-969a-261b-8a34139752b1	3333	Ljubno ob Savinji
00050000-55c9-969a-d6b1-9a5721db11cb	9240	Ljutomer
00050000-55c9-969a-7ebf-53861e65bdab	3215	Loče
00050000-55c9-969a-84e2-c355e2dcc37e	5231	Log pod Mangartom
00050000-55c9-969a-361c-2926a4de5f13	1358	Log pri Brezovici
00050000-55c9-969a-1a3d-1921440fb86f	1370	Logatec
00050000-55c9-969a-effa-33e2c5020008	1371	Logatec
00050000-55c9-969a-08c3-5753b64d91ff	1434	Loka pri Zidanem Mostu
00050000-55c9-969a-e437-3da8598d328f	3223	Loka pri Žusmu
00050000-55c9-969a-ac28-2096544318ec	6219	Lokev
00050000-55c9-969a-c8e9-325f910ae3b4	1318	Loški Potok
00050000-55c9-969a-9ad2-f901049f8b68	2324	Lovrenc na Dravskem polju
00050000-55c9-969a-0848-45290622715b	2344	Lovrenc na Pohorju
00050000-55c9-969a-0b5e-1841a6b5c1ec	3334	Luče
00050000-55c9-969a-97c8-e607be17f3b5	1225	Lukovica
00050000-55c9-969a-9de9-ba285ad97097	9202	Mačkovci
00050000-55c9-969a-a9ef-fe292320759b	2322	Majšperk
00050000-55c9-969a-45a3-97e434421a68	2321	Makole
00050000-55c9-969a-eb1e-e37f40a7ad94	9243	Mala Nedelja
00050000-55c9-969a-9f59-d42e26192fbc	2229	Malečnik
00050000-55c9-969a-2995-27aebcfd4b85	6273	Marezige
00050000-55c9-969a-2414-5cc5c7ff5ec2	2000	Maribor 
00050000-55c9-969a-1592-f1bba77c8622	2001	Maribor - poštni predali
00050000-55c9-969a-0f5c-b3f9fb80821e	2206	Marjeta na Dravskem polju
00050000-55c9-969a-6eea-ddb9796955b6	2281	Markovci
00050000-55c9-969a-ba6a-67af338880f2	9221	Martjanci
00050000-55c9-969a-f5f0-99bbf7ca063a	6242	Materija
00050000-55c9-969a-9755-5125a70a955a	4211	Mavčiče
00050000-55c9-969a-0e5f-dfe0a10bd9c6	1215	Medvode
00050000-55c9-969a-9283-57125ffef2cb	1234	Mengeš
00050000-55c9-969a-81d0-dcdb096e69ce	8330	Metlika
00050000-55c9-969a-7eb3-763fd679961e	2392	Mežica
00050000-55c9-969a-4b5a-593915768242	2204	Miklavž na Dravskem polju
00050000-55c9-969a-86f9-ac65b4d10abd	2275	Miklavž pri Ormožu
00050000-55c9-969a-487f-e776232f93fc	5291	Miren
00050000-55c9-969a-2439-1b2141cb79f6	8233	Mirna
00050000-55c9-969a-c05d-46b4337ee885	8216	Mirna Peč
00050000-55c9-969a-e048-fbfc577242cd	2382	Mislinja
00050000-55c9-969a-0b6e-26bf9dcdfb74	4281	Mojstrana
00050000-55c9-969a-5b26-ea575922e01a	8230	Mokronog
00050000-55c9-969a-6498-164c210d0934	1251	Moravče
00050000-55c9-969a-5dca-bd50ccce02e2	9226	Moravske Toplice
00050000-55c9-969a-410b-6564c5d401d9	5216	Most na Soči
00050000-55c9-969a-a525-ab640b685a2b	1221	Motnik
00050000-55c9-969a-8b8b-a7115ec4ee48	3330	Mozirje
00050000-55c9-969a-9013-a88699707cd6	9000	Murska Sobota 
00050000-55c9-969a-bcf1-328f4523b6ad	9001	Murska Sobota - poštni predali
00050000-55c9-969a-25af-77a9450da485	2366	Muta
00050000-55c9-969a-739d-1f1a283b2ab9	4202	Naklo
00050000-55c9-969a-bf51-8f5cea1ff44a	3331	Nazarje
00050000-55c9-969a-bbd3-f6afed984dec	1357	Notranje Gorice
00050000-55c9-969a-d343-83bcf97e0f39	3203	Nova Cerkev
00050000-55c9-969a-4a3c-5388d940ed6d	5000	Nova Gorica 
00050000-55c9-969a-f2ed-81e468e4670c	5001	Nova Gorica - poštni predali
00050000-55c9-969a-5d0b-c2120bcb9979	1385	Nova vas
00050000-55c9-969a-e3a1-7c6688dbac90	8000	Novo mesto
00050000-55c9-969a-d2e2-cf2e475365a8	8001	Novo mesto - poštni predali
00050000-55c9-969a-17c9-0aae4e057d26	6243	Obrov
00050000-55c9-969a-b5ef-35a65d47a1d8	9233	Odranci
00050000-55c9-969a-c948-acff0ab77026	2317	Oplotnica
00050000-55c9-969a-9ea5-3715faeeab3d	2312	Orehova vas
00050000-55c9-969a-759d-35a4d3ab5aac	2270	Ormož
00050000-55c9-969a-50f2-01dd91afd4a0	1316	Ortnek
00050000-55c9-969a-7d40-e926a1762381	1337	Osilnica
00050000-55c9-969a-411c-fb8eb9a0d233	8222	Otočec
00050000-55c9-969a-6dc6-4fa36d53317c	2361	Ožbalt
00050000-55c9-969a-230a-d57640747da8	2231	Pernica
00050000-55c9-969a-7c9d-3bfe2144a6cd	2211	Pesnica pri Mariboru
00050000-55c9-969a-d0ec-9ceda4baada2	9203	Petrovci
00050000-55c9-969a-78ff-a4b809f1244c	3301	Petrovče
00050000-55c9-969a-1a16-3610dd5307f3	6330	Piran/Pirano
00050000-55c9-969a-c410-be6930ab9728	8255	Pišece
00050000-55c9-969a-9d30-60286b900f5f	6257	Pivka
00050000-55c9-969a-4fc5-42f5fb0735ae	6232	Planina
00050000-55c9-969a-0dae-2b98e6103a78	3225	Planina pri Sevnici
00050000-55c9-969a-54f0-d8bfd87a4188	6276	Pobegi
00050000-55c9-969a-774b-fe3f0cfe380c	8312	Podbočje
00050000-55c9-969a-5bbf-b154cc81fca9	5243	Podbrdo
00050000-55c9-969a-9c54-5ae32fb6578b	3254	Podčetrtek
00050000-55c9-969a-1e8c-616fe5c87331	2273	Podgorci
00050000-55c9-969a-6489-060aa44ba097	6216	Podgorje
00050000-55c9-969a-16f6-c1d79a7cbb73	2381	Podgorje pri Slovenj Gradcu
00050000-55c9-969a-b9a0-d8c9db55b611	6244	Podgrad
00050000-55c9-969a-00a0-ab1e48e2ff3a	1414	Podkum
00050000-55c9-969a-c61c-b81754bd2161	2286	Podlehnik
00050000-55c9-969a-cd70-822d6495d97d	5272	Podnanos
00050000-55c9-969a-5747-fd80d17db0de	4244	Podnart
00050000-55c9-969a-b4ef-30a94526ad4e	3241	Podplat
00050000-55c9-969a-2ff9-6e6263912028	3257	Podsreda
00050000-55c9-969a-a8d7-fcec70e60bd6	2363	Podvelka
00050000-55c9-969a-b9a9-32bc7e82a1cc	2208	Pohorje
00050000-55c9-969a-3023-aa1053b334c1	2257	Polenšak
00050000-55c9-969a-461f-652869e61e1a	1355	Polhov Gradec
00050000-55c9-969a-7c1c-28ad836d2c65	4223	Poljane nad Škofjo Loko
00050000-55c9-969a-14c2-5f9cc6ac2ead	2319	Poljčane
00050000-55c9-969a-fc36-aeb69d31123b	1272	Polšnik
00050000-55c9-969a-053f-c8cf0b899768	3313	Polzela
00050000-55c9-969a-5deb-349608d1a90b	3232	Ponikva
00050000-55c9-969a-d325-7c35eeb12df2	6320	Portorož/Portorose
00050000-55c9-969a-c525-01b2c19d19c1	6230	Postojna
00050000-55c9-969a-e337-6174b48ffc61	2331	Pragersko
00050000-55c9-969a-3e81-52db01596a5a	3312	Prebold
00050000-55c9-969a-9885-17b0fa3a8b88	4205	Preddvor
00050000-55c9-969a-e349-432627c2919a	6255	Prem
00050000-55c9-969a-9948-7c7e470b0aad	1352	Preserje
00050000-55c9-969a-4811-aab2caa0e2e0	6258	Prestranek
00050000-55c9-969a-78a4-04516f75cfdb	2391	Prevalje
00050000-55c9-969a-67cc-96fb41ab42cb	3262	Prevorje
00050000-55c9-969a-38dc-6c54a95f7afb	1276	Primskovo 
00050000-55c9-969a-a693-1a3a47d4fc2b	3253	Pristava pri Mestinju
00050000-55c9-969a-509c-f026c56d594c	9207	Prosenjakovci/Partosfalva
00050000-55c9-969a-8681-8cea6b4afc83	5297	Prvačina
00050000-55c9-969a-46cf-f3ba2bdbc80a	2250	Ptuj
00050000-55c9-969a-e216-5c092e4e83d7	2323	Ptujska Gora
00050000-55c9-969a-2a58-3010ca92852c	9201	Puconci
00050000-55c9-969a-5ef1-24549a61172b	2327	Rače
00050000-55c9-969a-4391-bd39fc1c2869	1433	Radeče
00050000-55c9-969a-64ba-837bde6f39f3	9252	Radenci
00050000-55c9-969a-c4f2-0f52421901b7	2360	Radlje ob Dravi
00050000-55c9-969a-79a0-a4dcc106fddb	1235	Radomlje
00050000-55c9-969a-6d38-21d1562badf6	4240	Radovljica
00050000-55c9-969a-e36c-09fe94bb3e85	8274	Raka
00050000-55c9-969a-7705-f7048230d99e	1381	Rakek
00050000-55c9-969a-07fe-af76fc7a24be	4283	Rateče - Planica
00050000-55c9-969a-9497-36b2fba17e9e	2390	Ravne na Koroškem
00050000-55c9-969a-6e0c-9241629bd03b	9246	Razkrižje
00050000-55c9-969a-fd07-f326b1b485ae	3332	Rečica ob Savinji
00050000-55c9-969a-e58b-84b6f2a7ec8c	5292	Renče
00050000-55c9-969a-0dcd-436b5a2538b7	1310	Ribnica
00050000-55c9-969a-d750-734e4349b42b	2364	Ribnica na Pohorju
00050000-55c9-969a-30bc-88a7d1825629	3272	Rimske Toplice
00050000-55c9-969a-71eb-bc5ecfd80420	1314	Rob
00050000-55c9-969a-023c-55df2d5fe1b0	5215	Ročinj
00050000-55c9-969a-e311-753b7869bec4	3250	Rogaška Slatina
00050000-55c9-969a-7192-86929c9ae646	9262	Rogašovci
00050000-55c9-969a-a7b8-23da709d8029	3252	Rogatec
00050000-55c9-969a-047e-5985c3d3bdf3	1373	Rovte
00050000-55c9-969a-19b3-ca29f120d54d	2342	Ruše
00050000-55c9-969a-cfd8-4000a52c29f0	1282	Sava
00050000-55c9-969a-6aa4-1700fb4c8719	6333	Sečovlje/Sicciole
00050000-55c9-969a-65e4-bb5cbcfb4008	4227	Selca
00050000-55c9-969a-cc18-ff1ee9f9a832	2352	Selnica ob Dravi
00050000-55c9-969a-d985-a02d28d38db2	8333	Semič
00050000-55c9-969a-792f-368e74b580e5	8281	Senovo
00050000-55c9-969a-8974-f1b96f2e40e1	6224	Senožeče
00050000-55c9-969a-bcb5-c4b4d4e679f8	8290	Sevnica
00050000-55c9-969a-1756-638c306e61f7	6210	Sežana
00050000-55c9-969a-d411-0b79f7b6938d	2214	Sladki Vrh
00050000-55c9-969a-c08d-c32e669ba10b	5283	Slap ob Idrijci
00050000-55c9-969a-1af1-d30c03793aff	2380	Slovenj Gradec
00050000-55c9-969a-c419-d409e7289d3b	2310	Slovenska Bistrica
00050000-55c9-969a-8b34-9f1306dfce49	3210	Slovenske Konjice
00050000-55c9-969a-5222-519c9c18bdab	1216	Smlednik
00050000-55c9-969a-9b8c-89dff6b60990	5232	Soča
00050000-55c9-969a-2b3f-130c2f39b26e	1317	Sodražica
00050000-55c9-969a-8fea-93aca8e60096	3335	Solčava
00050000-55c9-969a-2875-7c8fa00e6289	5250	Solkan
00050000-55c9-969a-a981-5c68175c13a7	4229	Sorica
00050000-55c9-969a-758e-a841632306a1	4225	Sovodenj
00050000-55c9-969a-338f-249d25e35a6d	5281	Spodnja Idrija
00050000-55c9-969a-2e05-e5ed16a2d9af	2241	Spodnji Duplek
00050000-55c9-969a-9f0a-ad62b20a58b8	9245	Spodnji Ivanjci
00050000-55c9-969a-df9c-33b828bc938b	2277	Središče ob Dravi
00050000-55c9-969a-0a63-e287f5ddc386	4267	Srednja vas v Bohinju
00050000-55c9-969a-66d0-8b34f5190f82	8256	Sromlje 
00050000-55c9-969a-fbc0-67473d8aba7b	5224	Srpenica
00050000-55c9-969a-f59c-6ff8dd061d3d	1242	Stahovica
00050000-55c9-969a-3f31-8ee59f0752e9	1332	Stara Cerkev
00050000-55c9-969a-ee70-495b7420c696	8342	Stari trg ob Kolpi
00050000-55c9-969a-9e9d-b6d0e267210b	1386	Stari trg pri Ložu
00050000-55c9-969a-949f-537666406bcd	2205	Starše
00050000-55c9-969a-e293-994469deb572	2289	Stoperce
00050000-55c9-969a-1c76-120edfe93f8f	8322	Stopiče
00050000-55c9-969a-2322-02a438fa1152	3206	Stranice
00050000-55c9-969a-d505-c9503806f481	8351	Straža
00050000-55c9-969a-4575-6f6ce78df7cf	1313	Struge
00050000-55c9-969a-9787-87666d8cc6dc	8293	Studenec
00050000-55c9-969a-da32-745cd1013f4f	8331	Suhor
00050000-55c9-969a-0c77-88a7c4da1a44	2233	Sv. Ana v Slovenskih goricah
00050000-55c9-969a-4c3c-bca5040c4533	2235	Sv. Trojica v Slovenskih goricah
00050000-55c9-969a-c3bb-b6d11ff9a99b	2353	Sveti Duh na Ostrem Vrhu
00050000-55c9-969a-1c0e-05d222c868f5	9244	Sveti Jurij ob Ščavnici
00050000-55c9-969a-609b-eaea0de97c7c	3264	Sveti Štefan
00050000-55c9-969a-c8b7-e4b4a7be1d1a	2258	Sveti Tomaž
00050000-55c9-969a-6a06-54ec29370265	9204	Šalovci
00050000-55c9-969a-3556-f04cdcb378b1	5261	Šempas
00050000-55c9-969a-91ad-4d7f97d9bb54	5290	Šempeter pri Gorici
00050000-55c9-969a-7470-ee8427512509	3311	Šempeter v Savinjski dolini
00050000-55c9-969a-8508-d8436c519d11	4208	Šenčur
00050000-55c9-969a-2e82-398277a5d585	2212	Šentilj v Slovenskih goricah
00050000-55c9-969a-8e2c-199550e32724	8297	Šentjanž
00050000-55c9-969a-989f-f81424724c3a	2373	Šentjanž pri Dravogradu
00050000-55c9-969a-d846-6f45abc44afc	8310	Šentjernej
00050000-55c9-969a-b528-217e76f37211	3230	Šentjur
00050000-55c9-969a-dbc5-3325b2175de3	3271	Šentrupert
00050000-55c9-969a-7507-1e0b9b6cacf6	8232	Šentrupert
00050000-55c9-969a-2b1f-cded99a8db6b	1296	Šentvid pri Stični
00050000-55c9-969a-6660-a90291b3bf36	8275	Škocjan
00050000-55c9-969a-65b5-2eac814d058c	6281	Škofije
00050000-55c9-969a-c4ff-f20ad1032dff	4220	Škofja Loka
00050000-55c9-969a-914d-39a8ee02b739	3211	Škofja vas
00050000-55c9-969a-e5bd-db1acd47fb2f	1291	Škofljica
00050000-55c9-969a-f50c-00852a8bd5a8	6274	Šmarje
00050000-55c9-969a-10d5-6ff7c34c1b9c	1293	Šmarje - Sap
00050000-55c9-969a-b0df-75502bc33ae9	3240	Šmarje pri Jelšah
00050000-55c9-969a-8556-e2f1fcec0b65	8220	Šmarješke Toplice
00050000-55c9-969a-f7cc-18a19d44bb0d	2315	Šmartno na Pohorju
00050000-55c9-969a-06d8-2bb92e9277a0	3341	Šmartno ob Dreti
00050000-55c9-969a-dcc3-c0828ca9f390	3327	Šmartno ob Paki
00050000-55c9-969a-0cc2-b611c595146c	1275	Šmartno pri Litiji
00050000-55c9-969a-22c0-67019cbb1300	2383	Šmartno pri Slovenj Gradcu
00050000-55c9-969a-da4b-195c3a0b3f47	3201	Šmartno v Rožni dolini
00050000-55c9-969a-2f6a-50a6332211ec	3325	Šoštanj
00050000-55c9-969a-8520-90a0e1969653	6222	Štanjel
00050000-55c9-969a-fb7a-fa229e2b2333	3220	Štore
00050000-55c9-969a-6cf6-516b3d06f7e1	3304	Tabor
00050000-55c9-969a-51dc-b8823dc5073d	3221	Teharje
00050000-55c9-969a-331f-424aac24e052	9251	Tišina
00050000-55c9-969a-6fe2-9f41331fcbc4	5220	Tolmin
00050000-55c9-969a-f859-242758b3d365	3326	Topolšica
00050000-55c9-969a-de9e-05dc50c4bfb9	2371	Trbonje
00050000-55c9-969a-de2a-180434fb8203	1420	Trbovlje
00050000-55c9-969a-6e34-002f5e266847	8231	Trebelno 
00050000-55c9-969a-f8f9-de9a0d1ebe4d	8210	Trebnje
00050000-55c9-969a-6966-b40fc24f04dd	5252	Trnovo pri Gorici
00050000-55c9-969a-60e3-fee4e250a777	2254	Trnovska vas
00050000-55c9-969a-7129-1efbd49e16a3	1222	Trojane
00050000-55c9-969a-f54c-f85d30ae941e	1236	Trzin
00050000-55c9-969a-8c26-3377294f870c	4290	Tržič
00050000-55c9-969a-ccfd-e1bddd6fc433	8295	Tržišče
00050000-55c9-969a-0fea-ea98fa791741	1311	Turjak
00050000-55c9-969a-a062-0edb04008915	9224	Turnišče
00050000-55c9-969a-73f4-98572b50609f	8323	Uršna sela
00050000-55c9-969a-e873-4967d1303647	1252	Vače
00050000-55c9-969a-2f7e-6582a4c9d279	3320	Velenje 
00050000-55c9-969a-deb1-f2ac030e6a85	3322	Velenje - poštni predali
00050000-55c9-969a-d376-34915da0d41b	8212	Velika Loka
00050000-55c9-969a-c186-f968f1eaf365	2274	Velika Nedelja
00050000-55c9-969a-d9ea-0e762081257c	9225	Velika Polana
00050000-55c9-969a-dd35-da76b5eadb03	1315	Velike Lašče
00050000-55c9-969a-2e15-5fe72e824a5a	8213	Veliki Gaber
00050000-55c9-969a-761d-f4bf59e32dbc	9241	Veržej
00050000-55c9-969a-3e8c-f10100e90166	1312	Videm - Dobrepolje
00050000-55c9-969a-691b-ff18ea52b958	2284	Videm pri Ptuju
00050000-55c9-969a-ffe4-9b12eda02ddb	8344	Vinica
00050000-55c9-969a-851d-28210af1e22f	5271	Vipava
00050000-55c9-969a-b9e4-c6ce3fca12f0	4212	Visoko
00050000-55c9-969a-187d-89687a616259	1294	Višnja Gora
00050000-55c9-969a-3af1-3f4730942430	3205	Vitanje
00050000-55c9-969a-afec-50676e0f13a8	2255	Vitomarci
00050000-55c9-969a-7768-0e4c91d81ee5	1217	Vodice
00050000-55c9-969a-2264-9ffb7c60867c	3212	Vojnik\t
00050000-55c9-969a-215c-3d98a8231c8b	5293	Volčja Draga
00050000-55c9-969a-dcc0-8443cc72421c	2232	Voličina
00050000-55c9-969a-1b1b-27fb8374d43b	3305	Vransko
00050000-55c9-969a-ab79-6ee2a72ecbaf	6217	Vremski Britof
00050000-55c9-969a-e877-8baa505fe282	1360	Vrhnika
00050000-55c9-969a-7cd4-0e1bfffa1327	2365	Vuhred
00050000-55c9-969a-6a1e-3205ee5c248d	2367	Vuzenica
00050000-55c9-969a-4727-6190f24a1da2	8292	Zabukovje 
00050000-55c9-969a-66d0-e0cb71448e51	1410	Zagorje ob Savi
00050000-55c9-969a-0bdf-e9ceaeb1fb39	1303	Zagradec
00050000-55c9-969a-e5d1-91a5cb509424	2283	Zavrč
00050000-55c9-969a-dc87-d3d42ee76be4	8272	Zdole 
00050000-55c9-969a-98fd-453ff9a32ee2	4201	Zgornja Besnica
00050000-55c9-969a-9e68-db34ef80a441	2242	Zgornja Korena
00050000-55c9-969a-1dcc-5242d6b461c2	2201	Zgornja Kungota
00050000-55c9-969a-4a37-7234ca48dc9e	2316	Zgornja Ložnica
00050000-55c9-969a-194e-dcda75e30c28	2314	Zgornja Polskava
00050000-55c9-969a-6ab4-ede04c8d1090	2213	Zgornja Velka
00050000-55c9-969a-2a9e-237b9067f26f	4247	Zgornje Gorje
00050000-55c9-969a-80c6-3742b2cf9f50	4206	Zgornje Jezersko
00050000-55c9-969a-ebcc-fd5568fe9834	2285	Zgornji Leskovec
00050000-55c9-969a-a215-5dab4248051c	1432	Zidani Most
00050000-55c9-969a-c9f3-80ff461ee10c	3214	Zreče
00050000-55c9-969a-27cb-01a2852e697f	4209	Žabnica
00050000-55c9-969a-6051-54074ae5706a	3310	Žalec
00050000-55c9-969a-2826-15648660e184	4228	Železniki
00050000-55c9-969a-bb7e-88fe3dc5866b	2287	Žetale
00050000-55c9-969a-fd9a-537896b09365	4226	Žiri
00050000-55c9-969a-4b58-607b6528ee3b	4274	Žirovnica
00050000-55c9-969a-1a00-d6271f92d6de	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 12690062)
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
-- TOC entry 3003 (class 0 OID 12689869)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 12689947)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 12690074)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 12690405)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 12690415)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c9-969b-750b-b6fe8d0fa795	00080000-55c9-969b-e62a-b6f696797074	0900	AK
00190000-55c9-969b-7539-036a50c28555	00080000-55c9-969b-8a91-340f89ad77ba	0987	AK
00190000-55c9-969b-0336-a28772fe4f16	00080000-55c9-969b-1c60-3af0a405e24c	0989	AK
00190000-55c9-969b-12c7-ba270b9da6ac	00080000-55c9-969b-7e7c-1259c655f1d8	0986	AK
00190000-55c9-969b-d6a1-ec7afb83b067	00080000-55c9-969b-ab2f-c2e81618fdcd	0984	AK
00190000-55c9-969b-324b-6fe1f03ab00d	00080000-55c9-969b-dec1-8af47cdad67f	0983	AK
00190000-55c9-969b-7ff1-98285c26998a	00080000-55c9-969b-1ea6-f95f7ea83b1a	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 12690361)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c9-969b-ae00-233f8cf03f26	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3048 (class 0 OID 12690423)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 12690103)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c9-969b-a9b7-cdbc3dca51da	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c9-969b-1688-6d04193590c6	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c9-969b-a15c-07425d2e500e	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c9-969b-288c-43eeebc2c095	0004	Mali oder	t	24	Mali oder 
00220000-55c9-969b-94bb-388c10912a17	0005	Komorni oder	t	15	Komorni oder
00220000-55c9-969b-da0f-9fd76c90dab3	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c9-969b-d69c-4d03a8c25d38	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 12690047)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 12690037)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 12690222)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 12690171)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 12689741)
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
-- TOC entry 3028 (class 0 OID 12690113)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 12689779)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c9-969a-a71e-aef1272ed20f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c9-969a-bc39-8b120bd0c67f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c9-969a-7e6e-a8ad4b338b02	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c9-969a-110c-f5c2f052b7ae	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c9-969a-1071-70a5b3a1773f	planer	Planer dogodkov v koledarju	t
00020000-55c9-969a-a75b-06a42f082984	kadrovska	Kadrovska služba	t
00020000-55c9-969a-35a9-5d1babbff0de	arhivar	Ažuriranje arhivalij	t
00020000-55c9-969a-9b29-2b7a3721bf04	igralec	Igralec	t
00020000-55c9-969a-090f-5793e7548552	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c9-969b-8d7b-547864daac94	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 12689763)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c9-969a-52bd-713c0c131075	00020000-55c9-969a-7e6e-a8ad4b338b02
00010000-55c9-969a-90be-07a3b8c37663	00020000-55c9-969a-7e6e-a8ad4b338b02
00010000-55c9-969b-a7c8-d59f93144035	00020000-55c9-969b-8d7b-547864daac94
\.


--
-- TOC entry 3030 (class 0 OID 12690127)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 12690068)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 12690014)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 12690464)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c9-969a-bd03-f3cb3fc68ccc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c9-969a-055a-af33a30bb77f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c9-969a-ec42-bb5288f29d29	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c9-969a-68a3-29e23681e709	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c9-969a-f266-d22c06d30517	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 12690456)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c9-969a-e4b4-a7199806f862	00230000-55c9-969a-68a3-29e23681e709	popa
00240000-55c9-969a-06bb-7e7ac4d73fea	00230000-55c9-969a-68a3-29e23681e709	oseba
00240000-55c9-969a-c3ca-dd0ed87babdc	00230000-55c9-969a-68a3-29e23681e709	sezona
00240000-55c9-969a-3485-a65ed2c1db5b	00230000-55c9-969a-055a-af33a30bb77f	prostor
00240000-55c9-969a-1455-9d6b3152c3f5	00230000-55c9-969a-68a3-29e23681e709	besedilo
00240000-55c9-969a-0bf8-ab5eafd8bbb5	00230000-55c9-969a-68a3-29e23681e709	uprizoritev
00240000-55c9-969a-abef-f9d3b49ebbda	00230000-55c9-969a-68a3-29e23681e709	funkcija
00240000-55c9-969a-e949-42ad96970223	00230000-55c9-969a-68a3-29e23681e709	tipfunkcije
00240000-55c9-969a-0fd5-b010f29475aa	00230000-55c9-969a-68a3-29e23681e709	alternacija
00240000-55c9-969a-2125-682f7dfc9d38	00230000-55c9-969a-bd03-f3cb3fc68ccc	pogodba
00240000-55c9-969a-da5c-bcf5b2d4a064	00230000-55c9-969a-68a3-29e23681e709	zaposlitev
00240000-55c9-969a-3e08-f6e5b3d0e54b	00230000-55c9-969a-bd03-f3cb3fc68ccc	programdela
00240000-55c9-969a-f0b4-a6a0a42bd42b	00230000-55c9-969a-68a3-29e23681e709	zapis
\.


--
-- TOC entry 3051 (class 0 OID 12690451)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 12690181)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c9-969b-43cf-edaa40ac007a	000e0000-55c9-969b-ff6d-becc0b8f31b0	00080000-55c9-969b-26dc-ab29b3974ce2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c9-969b-867c-1c582a4cc94e	000e0000-55c9-969b-ff6d-becc0b8f31b0	00080000-55c9-969b-26dc-ab29b3974ce2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c9-969b-bf32-7759796a589d	000e0000-55c9-969b-ff6d-becc0b8f31b0	00080000-55c9-969b-a865-a85478eaf45f	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c9-969b-6d83-e8bd3515f6c0	000e0000-55c9-969b-ff6d-becc0b8f31b0	00080000-55c9-969b-a865-a85478eaf45f	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 12689841)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 12690024)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c9-969b-f604-38f7fb135fa0	00180000-55c9-969b-64b8-97b3da91c419	000c0000-55c9-969b-9478-63cec56cc220	00090000-55c9-969b-702c-f6aaf35f1de6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c9-969b-8e3f-6c98941fa73e	00180000-55c9-969b-64b8-97b3da91c419	000c0000-55c9-969b-3292-696b9793a602	00090000-55c9-969b-912a-1dfa00307480	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c9-969b-a470-c9b924e2f55f	00180000-55c9-969b-64b8-97b3da91c419	000c0000-55c9-969b-d731-28dbe59bcbfe	00090000-55c9-969b-6991-a44f1ca2dab2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c9-969b-9041-ccdfb4eb8707	00180000-55c9-969b-64b8-97b3da91c419	000c0000-55c9-969b-0893-5cef52ba9528	00090000-55c9-969b-c7aa-a357d2a7366d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c9-969b-f858-fa615eff9c48	00180000-55c9-969b-64b8-97b3da91c419	000c0000-55c9-969b-ef7c-f50ac1c610a2	00090000-55c9-969b-ac5b-6ab4a2fbddb3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c9-969b-cba1-ad6700e21ffd	00180000-55c9-969b-0f26-e4b579f31459	\N	00090000-55c9-969b-ac5b-6ab4a2fbddb3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 12690211)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c9-969a-7a5f-7408e731e141	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c9-969a-a580-90d593569c4b	Priredba	Priredba	Priredba	umetnik
000f0000-55c9-969a-7525-92f821c001ee	Prevod	Prevod	Prevod	umetnik
000f0000-55c9-969a-53ae-39c31f67de08	Režija	Režija	Režija	umetnik
000f0000-55c9-969a-4d57-d345c669b5ae	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c9-969a-f2ad-08fd057e8642	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c9-969a-82c5-6f8b3fd73552	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c9-969a-05a2-b442b6dcbdf4	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c9-969a-3ba2-dfd75ec59c02	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c9-969a-831f-ddb2c9803221	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c9-969a-091a-a23b42ba082f	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c9-969a-33e9-faf336ba9c35	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c9-969a-7325-f7dfd0c13000	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c9-969a-9e04-407804b7efaf	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c9-969a-8a5c-c98302f42e36	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c9-969a-17fa-54a85f72d69d	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c9-969a-8787-b6c06bea2e8c	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c9-969a-6e4e-b839f6bdcd13	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 12690433)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c9-969a-2fd4-de91c6324a7e	01	Velika predstava	f	1.00	1.00
002b0000-55c9-969a-4833-b49a5f272b97	02	Mala predstava	f	0.50	0.50
002b0000-55c9-969a-c1cd-e13214064340	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c9-969a-ddac-bb748a3f56b8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c9-969a-2425-5bff5596b24f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 12689904)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 12689750)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c9-969a-90be-07a3b8c37663	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRODIjCBrCJphe5OB3PwcObfw//RhvOqyu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c9-969b-4f82-ca191dc10518	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c9-969b-b2ed-ae8c4c8c6caa	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c9-969b-fd74-c9bbbf57faaf	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c9-969b-9c83-205ac74ca2fb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c9-969b-a08b-14611984add0	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c9-969b-9f5a-6e1cfbc39c2f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c9-969b-3690-98bb39569597	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c9-969b-b453-e9eab9ba4e99	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c9-969b-1bb9-64d832480091	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c9-969b-a7c8-d59f93144035	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c9-969a-52bd-713c0c131075	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 12690259)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c9-969b-489c-ea2ae942d0b6	00160000-55c9-969b-d080-19a971fc785a	00150000-55c9-969a-c8ab-71051d0a193c	00140000-55c9-9699-9de1-f34cd1ea3ffc	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c9-969b-94bb-388c10912a17
000e0000-55c9-969b-ff6d-becc0b8f31b0	00160000-55c9-969b-fbf7-dd40b2dae14d	00150000-55c9-969a-8db5-2586dfbbb0e3	00140000-55c9-9699-e19f-722115134c5d	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c9-969b-da0f-9fd76c90dab3
000e0000-55c9-969b-b948-c05f41f12450	\N	00150000-55c9-969a-8db5-2586dfbbb0e3	00140000-55c9-9699-e19f-722115134c5d	00190000-55c9-969b-7539-036a50c28555	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c9-969b-94bb-388c10912a17
000e0000-55c9-969b-e827-1c16c5e4fb26	\N	00150000-55c9-969a-8db5-2586dfbbb0e3	00140000-55c9-9699-e19f-722115134c5d	00190000-55c9-969b-7539-036a50c28555	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c9-969b-94bb-388c10912a17
000e0000-55c9-969b-41bc-bcb642ccb3c2	\N	00150000-55c9-969a-8db5-2586dfbbb0e3	00140000-55c9-9699-e19f-722115134c5d	00190000-55c9-969b-7539-036a50c28555	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c9-969b-a9b7-cdbc3dca51da
\.


--
-- TOC entry 3011 (class 0 OID 12689966)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c9-969b-70f9-c4f75ccc018f	000e0000-55c9-969b-ff6d-becc0b8f31b0	1	
00200000-55c9-969b-6872-6537c3f0930d	000e0000-55c9-969b-ff6d-becc0b8f31b0	2	
\.


--
-- TOC entry 3026 (class 0 OID 12690095)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 12690503)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 12690475)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 12690515)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 12690164)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c9-969b-9a4d-f391897e667c	00090000-55c9-969b-912a-1dfa00307480	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c9-969b-2966-974e649d7bc2	00090000-55c9-969b-6991-a44f1ca2dab2	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c9-969b-9c69-f07a3c6bdb67	00090000-55c9-969b-acde-fc04d04ade84	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c9-969b-bff7-d77d2d2e4703	00090000-55c9-969b-5da8-ce52dede5db1	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c9-969b-5224-dcf729447c80	00090000-55c9-969b-702c-f6aaf35f1de6	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c9-969b-03ee-f6c1f06db0b7	00090000-55c9-969b-98d6-4c304fb1e510	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 12689998)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 12690249)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c9-9699-9de1-f34cd1ea3ffc	01	Drama	drama (SURS 01)
00140000-55c9-9699-cdb3-82f1f32712f7	02	Opera	opera (SURS 02)
00140000-55c9-9699-c28d-d7091eb0be6a	03	Balet	balet (SURS 03)
00140000-55c9-9699-6472-5e22e2a51790	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c9-9699-1682-bea64b249aa6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c9-9699-e19f-722115134c5d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c9-9699-b66b-46f6d0794986	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 12690154)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c9-969a-4d8f-67e2d5c8097e	01	Opera	opera
00150000-55c9-969a-d9d3-e21ab9c5048e	02	Opereta	opereta
00150000-55c9-969a-4141-b9ef4c44deae	03	Balet	balet
00150000-55c9-969a-6c22-86f8ac38cb6e	04	Plesne prireditve	plesne prireditve
00150000-55c9-969a-673e-d4cbfec70895	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c9-969a-9524-51c8eeb708d7	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c9-969a-c83e-e2aa2c1538d6	07	Biografska drama	biografska drama
00150000-55c9-969a-c8ab-71051d0a193c	08	Komedija	komedija
00150000-55c9-969a-9bfe-508aacfe69d2	09	Črna komedija	črna komedija
00150000-55c9-969a-8307-72f75c62c1e8	10	E-igra	E-igra
00150000-55c9-969a-8db5-2586dfbbb0e3	11	Kriminalka	kriminalka
00150000-55c9-969a-d511-bf590012ad70	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 12689804)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 12690306)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 12690296)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 12690210)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 12690556)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 12689988)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 12690013)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 12690449)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 12689930)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 12690355)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 12690150)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 12689964)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 12690007)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 12689944)
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
-- TOC entry 2630 (class 2606 OID 12690060)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 12690532)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 12690539)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 12690564)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 12690087)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 12689902)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 12689813)
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
-- TOC entry 2544 (class 2606 OID 12689837)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 12689793)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 12689778)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 12690093)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 12690126)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 12690244)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 12689866)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 12689890)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 12690066)
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
-- TOC entry 2559 (class 2606 OID 12689880)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 12689951)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 12690078)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 12690412)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 12690420)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 12690403)
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
-- TOC entry 2736 (class 2606 OID 12690431)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 12690110)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 12690051)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 12690042)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 12690232)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 12690178)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 12689749)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 12690117)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 12689767)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 12689787)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 12690135)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 12690073)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 12690022)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 12690473)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 12690461)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 12690455)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 12690191)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 12689846)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 12690033)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 12690221)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 12690443)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 12689915)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 12689762)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 12690275)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 12689973)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 12690101)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 12690513)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 12690497)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 12690521)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 12690169)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 12690002)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 12690257)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 12690162)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 12689995)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 12690192)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 12690193)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 12690534)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 12690533)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 12689868)
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
-- TOC entry 2643 (class 1259 OID 12690094)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 12690501)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 12690500)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 12690502)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 12690499)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 12690498)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 12690080)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 12690079)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 12689974)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 12690151)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 12690153)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 12690152)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 12689946)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 12689945)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 12690432)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 12690246)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 12690247)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 12690248)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 12690522)
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
-- TOC entry 2697 (class 1259 OID 12690280)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 12690277)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 12690281)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 12690279)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 12690278)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 12689917)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 12689916)
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
-- TOC entry 2542 (class 1259 OID 12689840)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 12690118)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 12690008)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 12689794)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 12689795)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 12690138)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 12690137)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 12690136)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 12689952)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 12689954)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 12689953)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 12690463)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 12690046)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 12690044)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 12690043)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 12690045)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 12689768)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 12689769)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 12690102)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 12690557)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 12690565)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 12690566)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 12690067)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 12690179)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 12690180)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 12690360)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 12690359)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 12690356)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 12690357)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 12690358)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 12689882)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 12689881)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 12689883)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 12690413)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 12690414)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 12690310)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 12690311)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 12690308)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 12690309)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 12690170)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 12690055)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 12690054)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 12690052)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 12690053)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 12690298)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 12690297)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 12690404)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 12689965)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 12690450)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 12690540)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 12690541)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 12689815)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 12689814)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 12689847)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 12689848)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 12690036)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 12690035)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 12690034)
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
-- TOC entry 2594 (class 1259 OID 12689997)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 12689993)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 12689990)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 12689991)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 12689989)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 12689994)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 12689992)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 12689867)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 12689931)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 12689933)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 12689932)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 12689934)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 12690061)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 12690245)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 12690276)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 12689838)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 12689839)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 12690163)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 12690474)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 12689903)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 12690462)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 12690112)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 12690111)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 12690307)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 12689891)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 12690258)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 12690514)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 12690421)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 12690422)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 12690023)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 12689788)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 12689996)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2806 (class 2606 OID 12690702)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2803 (class 2606 OID 12690687)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2804 (class 2606 OID 12690692)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2808 (class 2606 OID 12690712)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2802 (class 2606 OID 12690682)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2807 (class 2606 OID 12690707)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 12690697)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2837 (class 2606 OID 12690857)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 12690862)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2872 (class 2606 OID 12691032)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2871 (class 2606 OID 12691027)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 12690617)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 12690797)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2868 (class 2606 OID 12691012)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 12691007)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2869 (class 2606 OID 12691017)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2866 (class 2606 OID 12691002)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2865 (class 2606 OID 12690997)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2824 (class 2606 OID 12690792)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2823 (class 2606 OID 12690787)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 12690677)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 12690827)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 12690837)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 12690832)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2796 (class 2606 OID 12690652)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2795 (class 2606 OID 12690647)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 12690777)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 12690982)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2839 (class 2606 OID 12690867)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 12690872)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 12690877)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 12691022)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2845 (class 2606 OID 12690897)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2842 (class 2606 OID 12690882)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2846 (class 2606 OID 12690902)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 12690892)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2843 (class 2606 OID 12690887)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2794 (class 2606 OID 12690642)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2793 (class 2606 OID 12690637)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 12690602)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2785 (class 2606 OID 12690597)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 12690807)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 12690717)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2781 (class 2606 OID 12690577)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2782 (class 2606 OID 12690582)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2830 (class 2606 OID 12690822)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 12690817)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2828 (class 2606 OID 12690812)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2797 (class 2606 OID 12690657)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2799 (class 2606 OID 12690667)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 12690662)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 12690992)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2816 (class 2606 OID 12690752)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2814 (class 2606 OID 12690742)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2813 (class 2606 OID 12690737)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2815 (class 2606 OID 12690747)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2779 (class 2606 OID 12690567)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 12690572)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 12690802)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 12691047)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 12691052)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2877 (class 2606 OID 12691057)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 12690782)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2835 (class 2606 OID 12690847)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2836 (class 2606 OID 12690852)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2857 (class 2606 OID 12690957)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2856 (class 2606 OID 12690952)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2853 (class 2606 OID 12690937)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2854 (class 2606 OID 12690942)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 12690947)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 12690627)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 12690622)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 12690632)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2859 (class 2606 OID 12690967)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2860 (class 2606 OID 12690972)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2851 (class 2606 OID 12690927)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2852 (class 2606 OID 12690932)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2849 (class 2606 OID 12690917)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2850 (class 2606 OID 12690922)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 12690842)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 12690772)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2819 (class 2606 OID 12690767)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2817 (class 2606 OID 12690757)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2818 (class 2606 OID 12690762)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2848 (class 2606 OID 12690912)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 12690907)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 12690962)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 12690672)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 12690977)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 12690987)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2873 (class 2606 OID 12691037)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2874 (class 2606 OID 12691042)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2784 (class 2606 OID 12690592)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 12690587)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2787 (class 2606 OID 12690607)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 12690612)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2812 (class 2606 OID 12690732)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 12690727)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2810 (class 2606 OID 12690722)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-11 08:30:52 CEST

--
-- PostgreSQL database dump complete
--

