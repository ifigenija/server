--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-05 13:38:19 CEST

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
-- TOC entry 183 (class 1259 OID 11964866)
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
-- TOC entry 228 (class 1259 OID 11965369)
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
-- TOC entry 227 (class 1259 OID 11965352)
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
-- TOC entry 221 (class 1259 OID 11965264)
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
-- TOC entry 244 (class 1259 OID 11965612)
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
-- TOC entry 197 (class 1259 OID 11965045)
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
-- TOC entry 200 (class 1259 OID 11965079)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11965514)
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
-- TOC entry 192 (class 1259 OID 11964988)
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
-- TOC entry 229 (class 1259 OID 11965382)
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
-- TOC entry 216 (class 1259 OID 11965209)
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
-- TOC entry 195 (class 1259 OID 11965025)
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
-- TOC entry 199 (class 1259 OID 11965073)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11965005)
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
-- TOC entry 205 (class 1259 OID 11965126)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11965593)
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
-- TOC entry 243 (class 1259 OID 11965605)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11965628)
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
-- TOC entry 209 (class 1259 OID 11965151)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11964962)
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
-- TOC entry 184 (class 1259 OID 11964875)
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
-- TOC entry 185 (class 1259 OID 11964886)
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
-- TOC entry 180 (class 1259 OID 11964840)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11964859)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11965158)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11965189)
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
-- TOC entry 224 (class 1259 OID 11965303)
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
-- TOC entry 187 (class 1259 OID 11964919)
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
-- TOC entry 189 (class 1259 OID 11964954)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11965132)
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
-- TOC entry 188 (class 1259 OID 11964939)
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
-- TOC entry 194 (class 1259 OID 11965017)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11965144)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11965475)
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
-- TOC entry 232 (class 1259 OID 11965485)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11965431)
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
-- TOC entry 233 (class 1259 OID 11965493)
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
-- TOC entry 212 (class 1259 OID 11965173)
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
-- TOC entry 204 (class 1259 OID 11965117)
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
-- TOC entry 203 (class 1259 OID 11965107)
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
-- TOC entry 223 (class 1259 OID 11965292)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11965241)
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
-- TOC entry 177 (class 1259 OID 11964811)
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
-- TOC entry 176 (class 1259 OID 11964809)
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
-- TOC entry 213 (class 1259 OID 11965183)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11964849)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11964833)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11965197)
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
-- TOC entry 207 (class 1259 OID 11965138)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11965084)
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
-- TOC entry 238 (class 1259 OID 11965534)
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
-- TOC entry 237 (class 1259 OID 11965526)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11965521)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11965251)
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
-- TOC entry 186 (class 1259 OID 11964911)
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
-- TOC entry 202 (class 1259 OID 11965094)
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
-- TOC entry 222 (class 1259 OID 11965281)
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
-- TOC entry 234 (class 1259 OID 11965503)
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
-- TOC entry 191 (class 1259 OID 11964974)
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
-- TOC entry 178 (class 1259 OID 11964820)
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
-- TOC entry 226 (class 1259 OID 11965329)
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
-- TOC entry 196 (class 1259 OID 11965036)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11965165)
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
-- TOC entry 240 (class 1259 OID 11965573)
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
-- TOC entry 239 (class 1259 OID 11965545)
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
-- TOC entry 241 (class 1259 OID 11965585)
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
-- TOC entry 218 (class 1259 OID 11965234)
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
-- TOC entry 198 (class 1259 OID 11965068)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11965319)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11965224)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2246 (class 2604 OID 11964814)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2998 (class 0 OID 11964866)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 11965369)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55c1-f5aa-f831-052b9aadd2d5	000d0000-55c1-f5aa-063e-4672d31e6c04	\N	00090000-55c1-f5aa-7077-0cb494033783	000b0000-55c1-f5aa-f36e-30d73e0fdd6e	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55c1-f5aa-619f-b79deda585e3	000d0000-55c1-f5aa-5347-78cc9158dbb6	00100000-55c1-f5aa-a4fe-b9cb4f5cd1e2	00090000-55c1-f5aa-4d06-f17d6f7a0f49	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55c1-f5aa-19f4-a16bb7d80c93	000d0000-55c1-f5aa-d00f-a91af0c4a3ef	00100000-55c1-f5aa-f3f6-83264073a01d	00090000-55c1-f5aa-5dc4-83685f8d23a4	\N	0003	t	\N	2015-08-05	\N	2	\N	\N	f	f
000c0000-55c1-f5aa-9c58-a7f15a14f25e	000d0000-55c1-f5aa-43f1-69a34e9559f5	\N	00090000-55c1-f5aa-0858-adac73fb6ef5	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55c1-f5aa-449a-e2280d366d74	000d0000-55c1-f5aa-8ad8-f1b59e889061	\N	00090000-55c1-f5aa-629d-04dcfe44c69f	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55c1-f5aa-cf2c-7beeedef64e8	000d0000-55c1-f5aa-5fca-fe2a85e68dec	\N	00090000-55c1-f5aa-391c-95eeab1738b4	000b0000-55c1-f5aa-5a54-680efb9e1d48	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55c1-f5aa-a6ff-4ae9d2e75ea2	000d0000-55c1-f5aa-0df7-8073fbb7e694	00100000-55c1-f5aa-46cb-67a7fa131998	00090000-55c1-f5aa-75c2-207042ab8895	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55c1-f5aa-ce94-9ff9e584d466	000d0000-55c1-f5aa-6bc0-0a10e4702b5c	\N	00090000-55c1-f5aa-1590-c60713bacab2	000b0000-55c1-f5aa-4f3b-52a07cd02aef	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55c1-f5aa-d2b9-034c3845b614	000d0000-55c1-f5aa-0df7-8073fbb7e694	00100000-55c1-f5aa-fdd3-6d782ca24425	00090000-55c1-f5aa-985f-b498314f770f	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55c1-f5aa-f505-5555e6492b53	000d0000-55c1-f5aa-0df7-8073fbb7e694	00100000-55c1-f5aa-601f-84947e786987	00090000-55c1-f5aa-e9cb-4692cf3cf50c	\N	0010	t	\N	2015-08-05	\N	16	\N	\N	f	t
000c0000-55c1-f5aa-4540-67be1137e8a0	000d0000-55c1-f5aa-0df7-8073fbb7e694	00100000-55c1-f5aa-328b-712fcf55647a	00090000-55c1-f5aa-1228-83bf245d2acc	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 3042 (class 0 OID 11965352)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 11965264)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55c1-f5aa-cf0a-5daac02c4b0f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55c1-f5aa-9cc7-1d919ea5dbd0	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55c1-f5aa-5803-fd26f315a7b2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3059 (class 0 OID 11965612)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 11965045)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55c1-f5aa-567c-e5db29db5d49	\N	\N	00200000-55c1-f5aa-af5e-1e36f2827d18	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55c1-f5aa-1040-67949f1880d1	\N	\N	00200000-55c1-f5aa-cbc3-41d7a1b8ca36	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55c1-f5aa-46dc-dbe0d82da647	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55c1-f5aa-2e34-09c6e85d964d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55c1-f5aa-b0ff-1fb432c49c07	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3015 (class 0 OID 11965079)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 11965514)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11964988)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55c1-f5a8-fc70-5aeef4c8d27c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55c1-f5a8-c1c5-df59d053709c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55c1-f5a8-94a9-316fff268524	AL	ALB	008	Albania 	Albanija	\N
00040000-55c1-f5a8-45fd-12a4047c08a1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55c1-f5a8-2258-e8992a760993	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55c1-f5a8-3043-abcaa25d41d2	AD	AND	020	Andorra 	Andora	\N
00040000-55c1-f5a8-1a5b-bb48a21f4802	AO	AGO	024	Angola 	Angola	\N
00040000-55c1-f5a8-a536-c2a6cf893090	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55c1-f5a8-217e-8f4604a4164f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55c1-f5a8-1fd9-8d3181437c06	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55c1-f5a8-f0c8-5508ab20896d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55c1-f5a8-4d78-a9808d72b83e	AM	ARM	051	Armenia 	Armenija	\N
00040000-55c1-f5a8-1a75-7b1f4de9ab7b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55c1-f5a8-dcfb-451eec3e5f3d	AU	AUS	036	Australia 	Avstralija	\N
00040000-55c1-f5a8-cfa1-bb63975b5cb1	AT	AUT	040	Austria 	Avstrija	\N
00040000-55c1-f5a8-5ff8-29354a8587a3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55c1-f5a8-bee9-874fce9ab49e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55c1-f5a8-0d9d-129762d2f242	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55c1-f5a8-cb78-f0084e5a5e34	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55c1-f5a8-4189-cd4dd3c2cfb6	BB	BRB	052	Barbados 	Barbados	\N
00040000-55c1-f5a8-6f24-0f88bfe4ade3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55c1-f5a8-2104-d0930838a58b	BE	BEL	056	Belgium 	Belgija	\N
00040000-55c1-f5a8-c7a8-56c1992f68c3	BZ	BLZ	084	Belize 	Belize	\N
00040000-55c1-f5a8-377f-0e7a029bcee3	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55c1-f5a8-726f-7dcf722dd7d7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55c1-f5a8-c77c-86792ee8e686	BT	BTN	064	Bhutan 	Butan	\N
00040000-55c1-f5a8-dfac-b57ee51dc2c9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55c1-f5a8-0d00-ee806d3f1582	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55c1-f5a8-6b32-aa44e479f535	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55c1-f5a8-4b6f-81f8e0098ccb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55c1-f5a8-13c9-77c5158e95da	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55c1-f5a8-39c5-85c02e2c1200	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55c1-f5a8-a125-2e2eac4a6b8a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55c1-f5a8-7943-efce19e30fe9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55c1-f5a8-4aa4-83e11b2c1fc8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55c1-f5a8-2f8f-c728ac205ebd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55c1-f5a8-1747-4b5775fa5af9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55c1-f5a8-8534-be4a5b8e4e2f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55c1-f5a8-a896-d96319e0520c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55c1-f5a8-6a90-56d9b712d8b1	CA	CAN	124	Canada 	Kanada	\N
00040000-55c1-f5a8-a456-6c2e684c0709	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55c1-f5a8-62fe-be83bf982b44	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55c1-f5a8-3c69-e59c3981516f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55c1-f5a8-b114-b149e9783938	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55c1-f5a8-c381-3482d8e5da01	CL	CHL	152	Chile 	Čile	\N
00040000-55c1-f5a8-0678-e6973249a0b0	CN	CHN	156	China 	Kitajska	\N
00040000-55c1-f5a8-c3d0-c148b2c342b0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55c1-f5a8-bdb2-f154c1b08e14	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55c1-f5a8-1e83-73b0ea24fa07	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55c1-f5a8-d2ec-c980f9b3eb66	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55c1-f5a8-06e6-769ecbbbc01f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55c1-f5a8-238d-15a242a0d966	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55c1-f5a8-bc27-6d5631893e65	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55c1-f5a8-16b0-09e86ad343c4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55c1-f5a8-2897-e9b7aa167b0e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55c1-f5a8-ea4a-d73bdecab219	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55c1-f5a8-a743-290d17b63594	CU	CUB	192	Cuba 	Kuba	\N
00040000-55c1-f5a8-0e57-b4dbb076679d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55c1-f5a8-a16b-f5fe06aa9cd1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55c1-f5a8-eb4f-6ca4fa0516fd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55c1-f5a8-6365-fe48b284ea72	DK	DNK	208	Denmark 	Danska	\N
00040000-55c1-f5a8-88c0-a44f2ebfea0c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55c1-f5a8-1237-530b100d2289	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55c1-f5a8-6be9-a0c5910b826c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55c1-f5a8-5a6f-223f9c86f086	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55c1-f5a8-a008-768d17aa86b1	EG	EGY	818	Egypt 	Egipt	\N
00040000-55c1-f5a8-a817-e3fa216f5acb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55c1-f5a8-f67a-c9ca4e054342	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55c1-f5a8-3f15-926eb8e71726	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55c1-f5a8-b8e7-85600bb545c8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55c1-f5a8-698a-d886ea00b3fe	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55c1-f5a8-9c8f-ff91f71fa85b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55c1-f5a8-5d3d-58606fb2e5c8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55c1-f5a8-e163-638cc51b891c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55c1-f5a8-2694-d3d0b9e7ab73	FI	FIN	246	Finland 	Finska	\N
00040000-55c1-f5a8-76e2-b77f475d1343	FR	FRA	250	France 	Francija	\N
00040000-55c1-f5a8-9ddd-ecf5c5cc9e59	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55c1-f5a8-bd2b-2b85e6a9adef	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55c1-f5a8-4597-8f0cc9379ede	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55c1-f5a8-0259-3cbef7206968	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55c1-f5a8-48b0-84ba49a4c50c	GA	GAB	266	Gabon 	Gabon	\N
00040000-55c1-f5a8-db78-4c9a5c6fea3c	GM	GMB	270	Gambia 	Gambija	\N
00040000-55c1-f5a8-db62-21349ca890a2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55c1-f5a8-69ee-e38fb995fe28	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55c1-f5a8-b271-955e8a64764c	GH	GHA	288	Ghana 	Gana	\N
00040000-55c1-f5a8-0bfe-1cd1b3344633	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55c1-f5a8-d579-25dfa5319449	GR	GRC	300	Greece 	Grčija	\N
00040000-55c1-f5a8-ce50-51c219a51ace	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55c1-f5a8-0b80-32a117e1a8b4	GD	GRD	308	Grenada 	Grenada	\N
00040000-55c1-f5a8-37b7-ed8568c12751	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55c1-f5a8-bfb7-b790caf99cea	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55c1-f5a8-942f-2025fe559fe1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55c1-f5a8-1eb1-0a3afe6b0d18	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55c1-f5a8-317e-00deb0ef4262	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55c1-f5a8-7832-e2932499f79f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55c1-f5a8-5663-f906fe32c590	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55c1-f5a8-dee1-a7d5d4c865e5	HT	HTI	332	Haiti 	Haiti	\N
00040000-55c1-f5a8-cdd3-b94006e03617	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55c1-f5a8-478a-7e075ddb8411	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55c1-f5a8-5e29-1ed5d8998df5	HN	HND	340	Honduras 	Honduras	\N
00040000-55c1-f5a8-7cfb-5827cd001a17	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55c1-f5a8-43d9-416cae7ace46	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55c1-f5a8-4d21-23438c30bd28	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55c1-f5a8-5c15-59c15435b97a	IN	IND	356	India 	Indija	\N
00040000-55c1-f5a8-0a8a-da4848a309ab	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55c1-f5a8-af6c-b0478813aa93	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55c1-f5a8-a8cb-d186cd082e18	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55c1-f5a8-d568-566dea96c583	IE	IRL	372	Ireland 	Irska	\N
00040000-55c1-f5a8-12aa-f4754fbbff8e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55c1-f5a8-fd52-c97781a0eb58	IL	ISR	376	Israel 	Izrael	\N
00040000-55c1-f5a8-64de-37c91e2aaac3	IT	ITA	380	Italy 	Italija	\N
00040000-55c1-f5a8-e944-9c9bdd2d40eb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55c1-f5a8-1e2e-9f8b023e4849	JP	JPN	392	Japan 	Japonska	\N
00040000-55c1-f5a8-ebb6-e1de888244c0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55c1-f5a8-a3e8-5df12e95a291	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55c1-f5a8-a247-d06c98759a38	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55c1-f5a8-5414-d3abad237a45	KE	KEN	404	Kenya 	Kenija	\N
00040000-55c1-f5a8-e6e4-17c4e1a534cd	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55c1-f5a8-5d3b-b952b6af60ff	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55c1-f5a8-c01c-1a28691b8e17	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55c1-f5a8-ec04-cb399a96326a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55c1-f5a8-0905-a31d257d2440	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55c1-f5a8-1bc4-deadfe62436c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55c1-f5a8-11f4-045211cc06fc	LV	LVA	428	Latvia 	Latvija	\N
00040000-55c1-f5a8-4c02-987b3db4c1aa	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55c1-f5a8-f2ac-443cfc34132b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55c1-f5a8-a05c-f1d7aea6e90c	LR	LBR	430	Liberia 	Liberija	\N
00040000-55c1-f5a8-63e3-5673806cd3cc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55c1-f5a8-05ab-d3c62ce21ec0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55c1-f5a8-a32b-e4047498d37f	LT	LTU	440	Lithuania 	Litva	\N
00040000-55c1-f5a8-1a0a-c19af0acae78	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55c1-f5a8-9e08-ad88d9a92f4e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55c1-f5a8-6f43-d70c91d85de9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55c1-f5a8-43db-9a4b6c94f645	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55c1-f5a8-c36d-9a662ebd8255	MW	MWI	454	Malawi 	Malavi	\N
00040000-55c1-f5a8-0247-b7cd73aea54f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55c1-f5a8-a7aa-4319075b38cf	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55c1-f5a8-c308-a65d9c1cf15c	ML	MLI	466	Mali 	Mali	\N
00040000-55c1-f5a8-8028-1187ee53d5cb	MT	MLT	470	Malta 	Malta	\N
00040000-55c1-f5a8-bb30-87b17a75ed62	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55c1-f5a8-209f-9a1ec771d717	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55c1-f5a8-ff51-5a41189d6621	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55c1-f5a8-6318-1718af82a6bd	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55c1-f5a8-52eb-8b4689fb6b4e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55c1-f5a8-f1b4-888b66ba831a	MX	MEX	484	Mexico 	Mehika	\N
00040000-55c1-f5a8-20ba-c872a55bd9d9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55c1-f5a8-1cef-834d81867e25	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55c1-f5a8-0f5a-1e3d5db3b988	MC	MCO	492	Monaco 	Monako	\N
00040000-55c1-f5a8-5490-e55154b9a7d9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55c1-f5a8-ec0a-06516aa341ad	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55c1-f5a8-e9a9-5b50380c1e23	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55c1-f5a8-12cf-6b510219a276	MA	MAR	504	Morocco 	Maroko	\N
00040000-55c1-f5a8-f03c-3ac5a6eb6edc	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55c1-f5a8-eee7-cc3f2346557a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55c1-f5a8-fd1e-7e1e0bbe9e5c	NA	NAM	516	Namibia 	Namibija	\N
00040000-55c1-f5a8-733b-4c2bee435499	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55c1-f5a8-2498-50983e14f170	NP	NPL	524	Nepal 	Nepal	\N
00040000-55c1-f5a8-2a83-a4e910a0e317	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55c1-f5a8-9b7c-e488c66480ea	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55c1-f5a8-f3e5-9a43af7b3f89	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55c1-f5a8-d03f-202dd9bb621b	NE	NER	562	Niger 	Niger 	\N
00040000-55c1-f5a8-9ea2-fcb3d359fe93	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55c1-f5a8-7813-ea5ec2e8e7d6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55c1-f5a8-408d-0ad336f3996c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55c1-f5a8-a71d-bd5ede063e32	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55c1-f5a8-ee1a-561cadfefe9e	NO	NOR	578	Norway 	Norveška	\N
00040000-55c1-f5a8-8cc8-9798c6c563e6	OM	OMN	512	Oman 	Oman	\N
00040000-55c1-f5a8-e40d-c474d034c656	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55c1-f5a8-f953-063526bf225f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55c1-f5a8-372f-876b9c2cea01	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55c1-f5a8-5175-04b37eced3eb	PA	PAN	591	Panama 	Panama	\N
00040000-55c1-f5a8-9ccd-49379a83a32b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55c1-f5a8-d0b9-dd2ff1d7eba9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55c1-f5a8-a3d2-ad6daeaf770e	PE	PER	604	Peru 	Peru	\N
00040000-55c1-f5a8-76bc-805c0f6fe443	PH	PHL	608	Philippines 	Filipini	\N
00040000-55c1-f5a8-897e-5d071fc57742	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55c1-f5a8-3210-10ed29869c83	PL	POL	616	Poland 	Poljska	\N
00040000-55c1-f5a8-7608-a61e4852688a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55c1-f5a8-2e69-c6cbb148d5d9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55c1-f5a8-bb9a-2bb6effc459c	QA	QAT	634	Qatar 	Katar	\N
00040000-55c1-f5a8-c7fc-1ac0099479e7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55c1-f5a8-b39b-a8630ba65655	RO	ROU	642	Romania 	Romunija	\N
00040000-55c1-f5a8-60b5-eb392d986471	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55c1-f5a8-d83d-733faf8de928	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55c1-f5a8-52c1-4b8d90680984	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55c1-f5a8-692d-824d81ff2f22	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55c1-f5a8-a87e-355411b64e29	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55c1-f5a8-d57c-a47f04e929d4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55c1-f5a8-f2e5-7e03d826c709	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55c1-f5a8-3316-f2c5a740b1e0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55c1-f5a8-32eb-3fd438791600	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55c1-f5a8-65df-9bbdcf29a9a7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55c1-f5a8-ae25-f1166a72f8b6	SM	SMR	674	San Marino 	San Marino	\N
00040000-55c1-f5a8-707d-8d13735e0e72	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55c1-f5a8-0dbe-db8b2fc779e4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55c1-f5a8-04a8-a7e69f105f81	SN	SEN	686	Senegal 	Senegal	\N
00040000-55c1-f5a8-fbdb-88c07b77f765	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55c1-f5a8-a0ff-e4dff6c32cf6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55c1-f5a8-533f-9c9e860b39f9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55c1-f5a8-0db4-652c8a03060f	SG	SGP	702	Singapore 	Singapur	\N
00040000-55c1-f5a8-27eb-8e7975e88fa8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55c1-f5a8-3e44-8717dd650d9f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55c1-f5a8-2395-f1b30a151741	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55c1-f5a8-388b-f6be86ac7e29	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55c1-f5a8-4ce7-5f53c8ce93a9	SO	SOM	706	Somalia 	Somalija	\N
00040000-55c1-f5a8-811a-7de145a4be89	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55c1-f5a8-d4c7-822dc2746d17	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55c1-f5a8-bef1-70b03d78edda	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55c1-f5a8-b0aa-bca6bb6cf2f2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55c1-f5a8-bfb1-edebe959a224	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55c1-f5a8-57fd-63359f3ef4ab	SD	SDN	729	Sudan 	Sudan	\N
00040000-55c1-f5a8-f583-f7e4f0e58ff5	SR	SUR	740	Suriname 	Surinam	\N
00040000-55c1-f5a8-034b-b396379ab501	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55c1-f5a8-a8ad-c52781701b51	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55c1-f5a8-aebd-9fe5bca7de4b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55c1-f5a8-a135-46e92f86f5d4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55c1-f5a8-f20d-740ca7a946aa	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55c1-f5a8-dd45-0d76c8c4ea2d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55c1-f5a8-8dcc-f72913bd2c8f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55c1-f5a8-26f9-b809396ace4d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55c1-f5a8-d7c2-66362ca2590d	TH	THA	764	Thailand 	Tajska	\N
00040000-55c1-f5a8-ac9d-f96214d874bb	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55c1-f5a8-2102-17442cd9c523	TG	TGO	768	Togo 	Togo	\N
00040000-55c1-f5a8-6368-5088c8043bdf	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55c1-f5a8-9af4-1f5afa5fb34f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55c1-f5a8-630b-9f93d6c5fd1c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55c1-f5a8-9ad4-3daabacf474d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55c1-f5a8-df79-7831cfdcb206	TR	TUR	792	Turkey 	Turčija	\N
00040000-55c1-f5a8-70d2-a6b54bff740e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55c1-f5a8-6bd6-3fbd86e2d518	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c1-f5a8-4553-6ffe90feda95	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55c1-f5a8-bb7d-00f4ab1404e4	UG	UGA	800	Uganda 	Uganda	\N
00040000-55c1-f5a8-85ee-c27ffecb0756	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55c1-f5a8-260b-629e27ff8f70	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55c1-f5a8-35bf-b90f57bc1fb3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55c1-f5a8-1a91-71b5f0134b2d	US	USA	840	United States 	Združene države Amerike	\N
00040000-55c1-f5a8-fce7-3551c4a203e3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55c1-f5a8-1022-8d9feaada8b4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55c1-f5a8-0ec6-3e504c67abbf	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55c1-f5a8-8945-9c24f5df4596	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55c1-f5a8-f3fa-4875d1f82467	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55c1-f5a8-edd9-fc865fd7c45e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55c1-f5a8-a18a-4dbf11b34e30	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55c1-f5a8-30a7-7ff0be74d494	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55c1-f5a8-f96b-2ce91638b762	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55c1-f5a8-4723-eed08cd35c2a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55c1-f5a8-d5d0-74d554e7d2d3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55c1-f5a8-af4a-ab578b349911	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55c1-f5a8-4c4d-e092fd9c49a0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3044 (class 0 OID 11965382)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55c1-f5aa-e4c3-d0d59b20d53c	000e0000-55c1-f5aa-540f-1d02040a5aa8	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	0.00	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55c1-f5a9-2601-904637f1919a	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c1-f5aa-13f8-ae81fbe03081	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c1-f5a9-e0ac-2b32b3c00225	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55c1-f5aa-03b2-f93e1590ebf3	000e0000-55c1-f5aa-7486-1dcd7777e0f1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	0.00	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55c1-f5a9-2601-904637f1919a	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c1-f5aa-3058-c130377041b4	\N	\N	\N	300.00	300.00	300.00	0.00	60.00	185.80	0.00	0.00	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55c1-f5aa-9759-c8db63990691	\N	\N	\N	203.00	203.00	203.00	0.00	60.90	110.90	0.00	0.00	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 11965209)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55c1-f5aa-0df7-8073fbb7e694	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55c1-f5a9-885c-a95cdeed5e69
000d0000-55c1-f5aa-063e-4672d31e6c04	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55c1-f5a9-885c-a95cdeed5e69
000d0000-55c1-f5aa-5347-78cc9158dbb6	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55c1-f5a9-2f09-1f3d50890d63
000d0000-55c1-f5aa-d00f-a91af0c4a3ef	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55c1-f5a9-cd78-a8502bd1d97d
000d0000-55c1-f5aa-43f1-69a34e9559f5	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55c1-f5a9-c1f1-c084e7daa2a7
000d0000-55c1-f5aa-8ad8-f1b59e889061	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55c1-f5a9-b166-a4ce055088d6
000d0000-55c1-f5aa-5fca-fe2a85e68dec	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55c1-f5a9-885c-a95cdeed5e69
000d0000-55c1-f5aa-6bc0-0a10e4702b5c	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55c1-f5a9-2ca0-5a036ab69d19
\.


--
-- TOC entry 3010 (class 0 OID 11965025)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 11965073)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 11965005)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55c1-f5aa-e2b2-b3e3c1f59bfb	00080000-55c1-f5aa-44ab-0f8d550a6c2b	00090000-55c1-f5aa-e9cb-4692cf3cf50c	AK		
\.


--
-- TOC entry 2985 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 11965126)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3057 (class 0 OID 11965593)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 11965605)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 11965628)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11965151)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11964962)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55c1-f5a9-2b24-b9553bd419ce	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55c1-f5a9-45a4-4f9aa85255f1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55c1-f5a9-efad-dfc8f2f61c76	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55c1-f5a9-1da3-ca9cb099bed2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55c1-f5a9-f5f8-a94bb6cb339b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55c1-f5a9-eef8-9df614f8c747	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55c1-f5a9-a3fb-26130eadc507	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55c1-f5a9-f926-a9feed3506c1	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c1-f5a9-f808-134a4d066c76	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55c1-f5a9-93c5-cf1f745e501a	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55c1-f5a9-30bb-b95cbc9333e8	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55c1-f5a9-ee21-dc19912e39a7	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55c1-f5a9-c175-70fac2bcc679	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55c1-f5a9-5f31-dedb5b823b4d	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55c1-f5aa-d07c-032253d5ff8c	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55c1-f5aa-9759-ad957384649f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55c1-f5aa-9245-d6275fc2171f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55c1-f5aa-a6cb-273cc57d142b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55c1-f5aa-ec96-ae1d9a8f681f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55c1-f5aa-9ceb-af5700f1924d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2999 (class 0 OID 11964875)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55c1-f5aa-4fc3-ea653a2efde5	00000000-55c1-f5aa-9759-ad957384649f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55c1-f5aa-49b1-081fca681bcf	00000000-55c1-f5aa-9759-ad957384649f	00010000-55c1-f5a9-7b92-51bcc85a21cf	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55c1-f5aa-df87-88c02ed1dd5e	00000000-55c1-f5aa-9245-d6275fc2171f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3000 (class 0 OID 11964886)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55c1-f5aa-7077-0cb494033783	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55c1-f5aa-0858-adac73fb6ef5	00010000-55c1-f5aa-07f4-a45a905f3263	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55c1-f5aa-5dc4-83685f8d23a4	00010000-55c1-f5aa-2781-46ebe772fc9f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55c1-f5aa-985f-b498314f770f	00010000-55c1-f5aa-a76d-52fef7ff6374	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55c1-f5aa-8227-d0ed0052922f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55c1-f5aa-391c-95eeab1738b4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55c1-f5aa-1228-83bf245d2acc	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55c1-f5aa-75c2-207042ab8895	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55c1-f5aa-e9cb-4692cf3cf50c	00010000-55c1-f5aa-81f6-953a9b9e844f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55c1-f5aa-4d06-f17d6f7a0f49	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55c1-f5aa-d791-3ce3bb86ec78	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55c1-f5aa-629d-04dcfe44c69f	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55c1-f5aa-1590-c60713bacab2	00010000-55c1-f5aa-d532-f842c801a9f8	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2987 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11964840)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55c1-f5a8-e53b-4d02bcc6c923	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55c1-f5a8-7f40-501e19b60ae4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55c1-f5a8-3607-d01c813a6340	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55c1-f5a8-c227-1de69fdaadc4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55c1-f5a8-7a84-2ad2b98c745c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55c1-f5a8-8b92-b07583b48c1d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55c1-f5a8-5bd9-fd1168dc3f85	Abonma-read	Abonma - branje	f
00030000-55c1-f5a8-b9c7-a9672c7d94c7	Abonma-write	Abonma - spreminjanje	f
00030000-55c1-f5a8-9ae9-3aec346e94da	Alternacija-read	Alternacija - branje	f
00030000-55c1-f5a8-5343-756d7fc0ebed	Alternacija-write	Alternacija - spreminjanje	f
00030000-55c1-f5a8-8eab-ebaa8e30613a	Arhivalija-read	Arhivalija - branje	f
00030000-55c1-f5a8-bac7-ecbf4810f7c8	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55c1-f5a8-f5ff-4a1fd6437427	Besedilo-read	Besedilo - branje	f
00030000-55c1-f5a8-2775-305b0123d445	Besedilo-write	Besedilo - spreminjanje	f
00030000-55c1-f5a8-faa3-ba4c00c533f2	DogodekIzven-read	DogodekIzven - branje	f
00030000-55c1-f5a8-d36c-a92dac9148a2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55c1-f5a8-46bc-187d00fcbd21	Dogodek-read	Dogodek - branje	f
00030000-55c1-f5a8-7d11-d84d379ce988	Dogodek-write	Dogodek - spreminjanje	f
00030000-55c1-f5a8-a694-702a0abe16f7	DrugiVir-read	DrugiVir - branje	f
00030000-55c1-f5a8-1995-75ce5b147199	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55c1-f5a8-15c4-c1febd8de660	Drzava-read	Drzava - branje	f
00030000-55c1-f5a8-a50a-0be757867b6c	Drzava-write	Drzava - spreminjanje	f
00030000-55c1-f5a8-a44b-ebfd49f36c55	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55c1-f5a8-dd09-4957a4e6e8c5	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55c1-f5a8-fd1a-acd4b6199c25	Funkcija-read	Funkcija - branje	f
00030000-55c1-f5a8-61f4-3d7ad789bd74	Funkcija-write	Funkcija - spreminjanje	f
00030000-55c1-f5a8-a821-c7a9986c4b14	Gostovanje-read	Gostovanje - branje	f
00030000-55c1-f5a8-2760-28a43d5ec2a5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55c1-f5a8-4f81-28b4fff7a613	Gostujoca-read	Gostujoca - branje	f
00030000-55c1-f5a8-6190-632920e66596	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55c1-f5a8-9d83-a09002f2ab11	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55c1-f5a8-4082-44622ed6c57c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55c1-f5a8-1bc6-d5d0220fcab1	Kupec-read	Kupec - branje	f
00030000-55c1-f5a8-de6d-03dda8d37636	Kupec-write	Kupec - spreminjanje	f
00030000-55c1-f5a8-a821-a328973c3c59	NacinPlacina-read	NacinPlacina - branje	f
00030000-55c1-f5a8-d96f-6f23fec714c7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55c1-f5a8-43a1-a1c03b63aaf0	Option-read	Option - branje	f
00030000-55c1-f5a8-fdc2-5bc54c5df80d	Option-write	Option - spreminjanje	f
00030000-55c1-f5a8-4557-f717f2c0ca36	OptionValue-read	OptionValue - branje	f
00030000-55c1-f5a8-c2e5-495ebbb5aeba	OptionValue-write	OptionValue - spreminjanje	f
00030000-55c1-f5a8-867d-d5113bb3d598	Oseba-read	Oseba - branje	f
00030000-55c1-f5a8-b7b3-4791f18a44f1	Oseba-write	Oseba - spreminjanje	f
00030000-55c1-f5a8-1dc6-33af367e35b4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55c1-f5a8-44c1-354dce0f41f2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55c1-f5a8-21e5-2b2d91faafd5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55c1-f5a8-29a3-17de3b881aaf	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55c1-f5a8-aa5d-2ffed00e1660	Pogodba-read	Pogodba - branje	f
00030000-55c1-f5a8-f007-e9090599543f	Pogodba-write	Pogodba - spreminjanje	f
00030000-55c1-f5a8-96c2-6db3e2fbcb71	Popa-read	Popa - branje	f
00030000-55c1-f5a8-c904-f1e570412450	Popa-write	Popa - spreminjanje	f
00030000-55c1-f5a8-bab8-2d70326de41c	Posta-read	Posta - branje	f
00030000-55c1-f5a8-d2de-dabd8e4a983a	Posta-write	Posta - spreminjanje	f
00030000-55c1-f5a8-1d8d-700accec0cf4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55c1-f5a8-513c-303322500730	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55c1-f5a8-e36c-538e95e9c71c	PostniNaslov-read	PostniNaslov - branje	f
00030000-55c1-f5a8-c5dc-811e89d30408	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55c1-f5a8-7126-a157ba6284f9	Predstava-read	Predstava - branje	f
00030000-55c1-f5a8-bc05-3c4d86d775c7	Predstava-write	Predstava - spreminjanje	f
00030000-55c1-f5a8-9893-5c16834747f6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55c1-f5a8-cf7f-1bcbf856a675	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55c1-f5a8-74cf-cc7330e7d598	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55c1-f5a8-3b79-45e8c39175a7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55c1-f5a8-216f-a23af4c6722f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55c1-f5a8-c1f5-11ee8afc4000	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55c1-f5a8-ecc5-a0984e5fe2f1	ProgramDela-read	ProgramDela - branje	f
00030000-55c1-f5a8-4ea6-31dfe771b618	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55c1-f5a8-ac6e-fbd1a6627bd2	ProgramFestival-read	ProgramFestival - branje	f
00030000-55c1-f5a8-0fa8-3f11d5ebd8b0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55c1-f5a8-59a0-eac2675e45ff	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55c1-f5a8-7ad9-f5a179709de2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55c1-f5a8-7021-1e95341e2b76	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55c1-f5a8-d8aa-ff1eb22426b3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55c1-f5a8-2201-ab66a9ac82b1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55c1-f5a8-593c-cc2b73413cbc	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55c1-f5a8-08d2-eeec67d0acd4	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55c1-f5a8-8189-2869ed70cf52	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55c1-f5a8-f410-a2ae44e15669	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55c1-f5a8-0ac0-c5eba153211f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55c1-f5a8-9354-6edb4b4a8391	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55c1-f5a8-2d81-1872d8a7f3c2	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55c1-f5a8-c99f-7972208c8032	ProgramRazno-read	ProgramRazno - branje	f
00030000-55c1-f5a8-9f70-a1a06dc85a3e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55c1-f5a8-773e-29e1312e9725	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55c1-f5a8-281d-30cc77a0396a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55c1-f5a8-282d-e6abfebf123c	Prostor-read	Prostor - branje	f
00030000-55c1-f5a8-d924-ec95b7bec9ce	Prostor-write	Prostor - spreminjanje	f
00030000-55c1-f5a8-0b6e-c5bfab815860	Racun-read	Racun - branje	f
00030000-55c1-f5a8-407b-2147cfd67bd9	Racun-write	Racun - spreminjanje	f
00030000-55c1-f5a8-f3e3-190f364b6119	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55c1-f5a8-0d48-d1ec8442a116	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55c1-f5a8-d07b-628928cf92e6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55c1-f5a8-8b35-7c0153446f95	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55c1-f5a8-47b3-028dc92720e8	Rekvizit-read	Rekvizit - branje	f
00030000-55c1-f5a8-018a-9f523758cff3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55c1-f5a8-a9c9-6073ae723d04	Revizija-read	Revizija - branje	f
00030000-55c1-f5a8-281c-309087378f5a	Revizija-write	Revizija - spreminjanje	f
00030000-55c1-f5a8-9b99-5b7bb28cdb4a	Rezervacija-read	Rezervacija - branje	f
00030000-55c1-f5a8-8556-869d8594b0f1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55c1-f5a8-428a-a2e9519a7a68	SedezniRed-read	SedezniRed - branje	f
00030000-55c1-f5a8-7e13-77c92263ffb1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55c1-f5a8-e61b-c5b1d6cb2751	Sedez-read	Sedez - branje	f
00030000-55c1-f5a8-bcfc-aff0a134a367	Sedez-write	Sedez - spreminjanje	f
00030000-55c1-f5a8-f729-3ab5b8f62593	Sezona-read	Sezona - branje	f
00030000-55c1-f5a8-f916-fbf129d2da9d	Sezona-write	Sezona - spreminjanje	f
00030000-55c1-f5a8-6d19-61c8a2414bee	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55c1-f5a8-c891-920561342568	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55c1-f5a8-a75b-30e26b1386b8	Stevilcenje-read	Stevilcenje - branje	f
00030000-55c1-f5a8-2372-660dde970fe7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55c1-f5a8-04fc-77a97135c1b1	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55c1-f5a8-bddb-5953a2993f85	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55c1-f5a8-7b7d-98869aa58d3e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55c1-f5a8-045f-032fb23dd7ca	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55c1-f5a8-adc4-11bb9b637bda	Telefonska-read	Telefonska - branje	f
00030000-55c1-f5a8-1083-dde2ea56267f	Telefonska-write	Telefonska - spreminjanje	f
00030000-55c1-f5a8-5a23-ecc7a3e8ee39	TerminStoritve-read	TerminStoritve - branje	f
00030000-55c1-f5a8-2b26-03c0e2e35253	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55c1-f5a8-aade-7d7782397765	TipFunkcije-read	TipFunkcije - branje	f
00030000-55c1-f5a8-c1b0-d42771268429	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55c1-f5a8-f841-24ca3d8581c1	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55c1-f5a8-80df-bd661cf8c11e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55c1-f5a8-8fef-1685089bf223	Trr-read	Trr - branje	f
00030000-55c1-f5a8-2b13-c54fa4e1e426	Trr-write	Trr - spreminjanje	f
00030000-55c1-f5a8-49a1-e37e61da12f6	Uprizoritev-read	Uprizoritev - branje	f
00030000-55c1-f5a8-ec35-99524f430f30	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55c1-f5a8-71f4-cd7f7791108f	Vaja-read	Vaja - branje	f
00030000-55c1-f5a8-6910-6be86f96b3de	Vaja-write	Vaja - spreminjanje	f
00030000-55c1-f5a8-25cf-4eb24476b125	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55c1-f5a8-3749-07f7e7816e3b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55c1-f5a8-2f96-52d9d31241c4	Zaposlitev-read	Zaposlitev - branje	f
00030000-55c1-f5a8-8d4e-ea4860ce618b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55c1-f5a8-e436-6fe5ac6d3bc5	Zasedenost-read	Zasedenost - branje	f
00030000-55c1-f5a8-7605-2638118fa04c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55c1-f5a8-b5c8-761d10900a9f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55c1-f5a8-5411-65eec3cd9896	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55c1-f5a8-d209-b41e6b3986bc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55c1-f5a8-b371-560a23752c41	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55c1-f5a8-fb33-2d7582858abf	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55c1-f5a8-44f0-aa9daeebe4d3	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55c1-f5a8-0e8a-9b8093343a82	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55c1-f5a8-4d51-6d9728ed22cf	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55c1-f5a8-e234-7285066b5859	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c1-f5a8-d1d1-c2743fa1ac90	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55c1-f5a8-e0e3-68c30519616a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c1-f5a8-17a6-61aa5a2a1e5a	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55c1-f5a8-4c08-f1a852916ee3	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55c1-f5a8-4fab-1d56ef7b0c23	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55c1-f5a8-f325-9f8a89cfa392	Datoteka-write	Datoteka - spreminjanje	f
00030000-55c1-f5a8-1ca6-039e8fc976df	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2997 (class 0 OID 11964859)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55c1-f5a8-7b71-d8bde6be3a05	00030000-55c1-f5a8-7f40-501e19b60ae4
00020000-55c1-f5a8-de01-d10b6c731d85	00030000-55c1-f5a8-15c4-c1febd8de660
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-5bd9-fd1168dc3f85
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-b9c7-a9672c7d94c7
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-9ae9-3aec346e94da
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-5343-756d7fc0ebed
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-8eab-ebaa8e30613a
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-46bc-187d00fcbd21
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-c227-1de69fdaadc4
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-7d11-d84d379ce988
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-15c4-c1febd8de660
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-a50a-0be757867b6c
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-fd1a-acd4b6199c25
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-61f4-3d7ad789bd74
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-a821-c7a9986c4b14
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-2760-28a43d5ec2a5
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-4f81-28b4fff7a613
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-6190-632920e66596
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-9d83-a09002f2ab11
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-4082-44622ed6c57c
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-43a1-a1c03b63aaf0
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-4557-f717f2c0ca36
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-867d-d5113bb3d598
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-b7b3-4791f18a44f1
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-96c2-6db3e2fbcb71
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-c904-f1e570412450
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-bab8-2d70326de41c
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-d2de-dabd8e4a983a
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-e36c-538e95e9c71c
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-c5dc-811e89d30408
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-7126-a157ba6284f9
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-bc05-3c4d86d775c7
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-216f-a23af4c6722f
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-c1f5-11ee8afc4000
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-282d-e6abfebf123c
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-d924-ec95b7bec9ce
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-d07b-628928cf92e6
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-8b35-7c0153446f95
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-47b3-028dc92720e8
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-018a-9f523758cff3
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-f729-3ab5b8f62593
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-f916-fbf129d2da9d
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-aade-7d7782397765
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-49a1-e37e61da12f6
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-ec35-99524f430f30
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-71f4-cd7f7791108f
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-6910-6be86f96b3de
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-e436-6fe5ac6d3bc5
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-7605-2638118fa04c
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-b5c8-761d10900a9f
00020000-55c1-f5a8-3642-7a90adfe4c89	00030000-55c1-f5a8-d209-b41e6b3986bc
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-5bd9-fd1168dc3f85
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-8eab-ebaa8e30613a
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-46bc-187d00fcbd21
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-15c4-c1febd8de660
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-a821-c7a9986c4b14
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-4f81-28b4fff7a613
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-9d83-a09002f2ab11
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-4082-44622ed6c57c
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-43a1-a1c03b63aaf0
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-4557-f717f2c0ca36
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-867d-d5113bb3d598
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-b7b3-4791f18a44f1
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-96c2-6db3e2fbcb71
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-bab8-2d70326de41c
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-e36c-538e95e9c71c
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-c5dc-811e89d30408
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-7126-a157ba6284f9
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-282d-e6abfebf123c
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-d07b-628928cf92e6
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-47b3-028dc92720e8
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-f729-3ab5b8f62593
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-adc4-11bb9b637bda
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-1083-dde2ea56267f
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-8fef-1685089bf223
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-2b13-c54fa4e1e426
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-2f96-52d9d31241c4
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-8d4e-ea4860ce618b
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-b5c8-761d10900a9f
00020000-55c1-f5a8-a5f3-9899a9c9ed88	00030000-55c1-f5a8-d209-b41e6b3986bc
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-5bd9-fd1168dc3f85
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-9ae9-3aec346e94da
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-8eab-ebaa8e30613a
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-bac7-ecbf4810f7c8
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-f5ff-4a1fd6437427
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-faa3-ba4c00c533f2
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-46bc-187d00fcbd21
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-15c4-c1febd8de660
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-fd1a-acd4b6199c25
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-a821-c7a9986c4b14
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-4f81-28b4fff7a613
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-9d83-a09002f2ab11
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-43a1-a1c03b63aaf0
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-4557-f717f2c0ca36
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-867d-d5113bb3d598
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-96c2-6db3e2fbcb71
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-bab8-2d70326de41c
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-7126-a157ba6284f9
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-216f-a23af4c6722f
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-282d-e6abfebf123c
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-d07b-628928cf92e6
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-47b3-028dc92720e8
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-f729-3ab5b8f62593
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-aade-7d7782397765
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-71f4-cd7f7791108f
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-e436-6fe5ac6d3bc5
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-b5c8-761d10900a9f
00020000-55c1-f5a8-f23d-1052c142daa9	00030000-55c1-f5a8-d209-b41e6b3986bc
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-5bd9-fd1168dc3f85
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-b9c7-a9672c7d94c7
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-5343-756d7fc0ebed
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-8eab-ebaa8e30613a
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-46bc-187d00fcbd21
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-15c4-c1febd8de660
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-a821-c7a9986c4b14
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-4f81-28b4fff7a613
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-43a1-a1c03b63aaf0
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-4557-f717f2c0ca36
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-96c2-6db3e2fbcb71
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-bab8-2d70326de41c
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-7126-a157ba6284f9
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-282d-e6abfebf123c
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-d07b-628928cf92e6
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-47b3-028dc92720e8
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-f729-3ab5b8f62593
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-aade-7d7782397765
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-b5c8-761d10900a9f
00020000-55c1-f5a9-14f5-0419628654df	00030000-55c1-f5a8-d209-b41e6b3986bc
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-5bd9-fd1168dc3f85
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-8eab-ebaa8e30613a
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-46bc-187d00fcbd21
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-15c4-c1febd8de660
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-a821-c7a9986c4b14
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-4f81-28b4fff7a613
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-43a1-a1c03b63aaf0
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-4557-f717f2c0ca36
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-96c2-6db3e2fbcb71
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-bab8-2d70326de41c
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-7126-a157ba6284f9
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-282d-e6abfebf123c
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-d07b-628928cf92e6
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-47b3-028dc92720e8
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-f729-3ab5b8f62593
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-5a23-ecc7a3e8ee39
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-3607-d01c813a6340
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-aade-7d7782397765
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-b5c8-761d10900a9f
00020000-55c1-f5a9-c8d7-9fd3be797154	00030000-55c1-f5a8-d209-b41e6b3986bc
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-e53b-4d02bcc6c923
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7f40-501e19b60ae4
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-3607-d01c813a6340
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-c227-1de69fdaadc4
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7a84-2ad2b98c745c
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-8b92-b07583b48c1d
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-5bd9-fd1168dc3f85
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-b9c7-a9672c7d94c7
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-9ae9-3aec346e94da
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-5343-756d7fc0ebed
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-8eab-ebaa8e30613a
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-bac7-ecbf4810f7c8
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-f5ff-4a1fd6437427
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-2775-305b0123d445
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-faa3-ba4c00c533f2
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-d36c-a92dac9148a2
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-46bc-187d00fcbd21
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7d11-d84d379ce988
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-15c4-c1febd8de660
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-a50a-0be757867b6c
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-a694-702a0abe16f7
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-1995-75ce5b147199
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-a44b-ebfd49f36c55
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-dd09-4957a4e6e8c5
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-fd1a-acd4b6199c25
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-61f4-3d7ad789bd74
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-a821-c7a9986c4b14
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-2760-28a43d5ec2a5
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-4f81-28b4fff7a613
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-6190-632920e66596
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-9d83-a09002f2ab11
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-4082-44622ed6c57c
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-1bc6-d5d0220fcab1
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-de6d-03dda8d37636
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-a821-a328973c3c59
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-d96f-6f23fec714c7
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-43a1-a1c03b63aaf0
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-fdc2-5bc54c5df80d
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-4557-f717f2c0ca36
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-c2e5-495ebbb5aeba
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-867d-d5113bb3d598
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-b7b3-4791f18a44f1
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-1dc6-33af367e35b4
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-44c1-354dce0f41f2
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-21e5-2b2d91faafd5
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-29a3-17de3b881aaf
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-aa5d-2ffed00e1660
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-f007-e9090599543f
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-96c2-6db3e2fbcb71
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-c904-f1e570412450
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-bab8-2d70326de41c
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-d2de-dabd8e4a983a
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-1d8d-700accec0cf4
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-513c-303322500730
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-e36c-538e95e9c71c
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-c5dc-811e89d30408
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7126-a157ba6284f9
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-bc05-3c4d86d775c7
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-9893-5c16834747f6
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-cf7f-1bcbf856a675
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-74cf-cc7330e7d598
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-3b79-45e8c39175a7
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-216f-a23af4c6722f
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-c1f5-11ee8afc4000
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-ecc5-a0984e5fe2f1
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-4ea6-31dfe771b618
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-ac6e-fbd1a6627bd2
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-0fa8-3f11d5ebd8b0
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-59a0-eac2675e45ff
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7ad9-f5a179709de2
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7021-1e95341e2b76
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-d8aa-ff1eb22426b3
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-2201-ab66a9ac82b1
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-593c-cc2b73413cbc
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-08d2-eeec67d0acd4
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-8189-2869ed70cf52
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-f410-a2ae44e15669
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-0ac0-c5eba153211f
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-9354-6edb4b4a8391
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-2d81-1872d8a7f3c2
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-c99f-7972208c8032
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-9f70-a1a06dc85a3e
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-773e-29e1312e9725
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-281d-30cc77a0396a
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-282d-e6abfebf123c
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-d924-ec95b7bec9ce
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-0b6e-c5bfab815860
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-407b-2147cfd67bd9
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-f3e3-190f364b6119
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-0d48-d1ec8442a116
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-d07b-628928cf92e6
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-8b35-7c0153446f95
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-47b3-028dc92720e8
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-018a-9f523758cff3
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-a9c9-6073ae723d04
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-281c-309087378f5a
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-9b99-5b7bb28cdb4a
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-8556-869d8594b0f1
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-428a-a2e9519a7a68
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7e13-77c92263ffb1
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-e61b-c5b1d6cb2751
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-bcfc-aff0a134a367
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-f729-3ab5b8f62593
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-f916-fbf129d2da9d
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-6d19-61c8a2414bee
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-c891-920561342568
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-a75b-30e26b1386b8
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-2372-660dde970fe7
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-04fc-77a97135c1b1
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-bddb-5953a2993f85
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7b7d-98869aa58d3e
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-045f-032fb23dd7ca
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-adc4-11bb9b637bda
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-1083-dde2ea56267f
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-5a23-ecc7a3e8ee39
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-2b26-03c0e2e35253
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-aade-7d7782397765
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-c1b0-d42771268429
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-f841-24ca3d8581c1
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-80df-bd661cf8c11e
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-8fef-1685089bf223
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-2b13-c54fa4e1e426
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-49a1-e37e61da12f6
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-ec35-99524f430f30
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-71f4-cd7f7791108f
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-6910-6be86f96b3de
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-25cf-4eb24476b125
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-3749-07f7e7816e3b
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-2f96-52d9d31241c4
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-8d4e-ea4860ce618b
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-e436-6fe5ac6d3bc5
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-7605-2638118fa04c
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-b5c8-761d10900a9f
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-5411-65eec3cd9896
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-d209-b41e6b3986bc
00020000-55c1-f5aa-d6d6-95116c12a3b0	00030000-55c1-f5a8-b371-560a23752c41
\.


--
-- TOC entry 3025 (class 0 OID 11965158)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11965189)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 11965303)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55c1-f5aa-f36e-30d73e0fdd6e	00090000-55c1-f5aa-7077-0cb494033783	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55c1-f5aa-5a54-680efb9e1d48	00090000-55c1-f5aa-391c-95eeab1738b4	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55c1-f5aa-4f3b-52a07cd02aef	00090000-55c1-f5aa-1590-c60713bacab2	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3002 (class 0 OID 11964919)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55c1-f5aa-44ab-0f8d550a6c2b	00040000-55c1-f5a8-2395-f1b30a151741	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-f5aa-b993-6b80757bb8d4	00040000-55c1-f5a8-2395-f1b30a151741	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55c1-f5aa-3aab-94856cabf432	00040000-55c1-f5a8-2395-f1b30a151741	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-f5aa-bce2-33708dd4f762	00040000-55c1-f5a8-2395-f1b30a151741	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-f5aa-98ff-329f56a705dd	00040000-55c1-f5a8-2395-f1b30a151741	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-f5aa-0867-eec7f21e49c4	00040000-55c1-f5a8-f0c8-5508ab20896d	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-f5aa-8c2b-c52514006441	00040000-55c1-f5a8-ea4a-d73bdecab219	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-f5aa-6e57-d1b4f9a40be0	00040000-55c1-f5a8-cfa1-bb63975b5cb1	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55c1-f5aa-b97d-c1753bc11d4d	00040000-55c1-f5a8-2395-f1b30a151741	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3004 (class 0 OID 11964954)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55c1-f5a9-c3a8-dfc47d34a46f	8341	Adlešiči
00050000-55c1-f5a9-acd3-817186975c49	5270	Ajdovščina
00050000-55c1-f5a9-a9e5-5cf8ae2f7570	6280	Ankaran/Ancarano
00050000-55c1-f5a9-5278-a7b80a1d2b31	9253	Apače
00050000-55c1-f5a9-1d90-6cd4e33f3a4c	8253	Artiče
00050000-55c1-f5a9-a53a-32e18724f2b8	4275	Begunje na Gorenjskem
00050000-55c1-f5a9-51e8-a20b5ea40e8c	1382	Begunje pri Cerknici
00050000-55c1-f5a9-192c-fc069c0d9cb9	9231	Beltinci
00050000-55c1-f5a9-6f04-7ebd18306592	2234	Benedikt
00050000-55c1-f5a9-a272-0a9d9d5ce495	2345	Bistrica ob Dravi
00050000-55c1-f5a9-9617-ba145d9719d2	3256	Bistrica ob Sotli
00050000-55c1-f5a9-cabc-2c32ef446c98	8259	Bizeljsko
00050000-55c1-f5a9-c7a3-935f66a4151f	1223	Blagovica
00050000-55c1-f5a9-8604-1b272eea4e85	8283	Blanca
00050000-55c1-f5a9-efef-c10033546306	4260	Bled
00050000-55c1-f5a9-5180-0b2049c87e6b	4273	Blejska Dobrava
00050000-55c1-f5a9-50e9-87420a6c4420	9265	Bodonci
00050000-55c1-f5a9-2805-538d230ac5f8	9222	Bogojina
00050000-55c1-f5a9-8837-549c153c9426	4263	Bohinjska Bela
00050000-55c1-f5a9-5523-624dbe837bc3	4264	Bohinjska Bistrica
00050000-55c1-f5a9-ee87-5848157afbf4	4265	Bohinjsko jezero
00050000-55c1-f5a9-d30b-09ae42ef9045	1353	Borovnica
00050000-55c1-f5a9-46e7-fd49894605f2	8294	Boštanj
00050000-55c1-f5a9-751b-246d46c4f15b	5230	Bovec
00050000-55c1-f5a9-b355-1dbfc16bb18e	5295	Branik
00050000-55c1-f5a9-eabb-78ddef201f0b	3314	Braslovče
00050000-55c1-f5a9-12b9-002d411cd0fe	5223	Breginj
00050000-55c1-f5a9-f56e-eac777c63b39	8280	Brestanica
00050000-55c1-f5a9-2531-3ba7b4b2cbc4	2354	Bresternica
00050000-55c1-f5a9-7b7c-2ea801c5cb15	4243	Brezje
00050000-55c1-f5a9-9cd7-31c1ec7e538f	1351	Brezovica pri Ljubljani
00050000-55c1-f5a9-9ddb-df6d98b1b8e3	8250	Brežice
00050000-55c1-f5a9-7835-b1100369ecff	4210	Brnik - Aerodrom
00050000-55c1-f5a9-b953-d2c994f5164a	8321	Brusnice
00050000-55c1-f5a9-5bd4-5d9a7b276e2d	3255	Buče
00050000-55c1-f5a9-a42b-0b3ddf927901	8276	Bučka 
00050000-55c1-f5a9-3ce7-4091960744f2	9261	Cankova
00050000-55c1-f5a9-8af2-650b76c9dbc2	3000	Celje 
00050000-55c1-f5a9-a5a1-5d0134b7a992	3001	Celje - poštni predali
00050000-55c1-f5a9-924b-efebff373eec	4207	Cerklje na Gorenjskem
00050000-55c1-f5a9-6f18-2437e263906e	8263	Cerklje ob Krki
00050000-55c1-f5a9-c0de-39913b2a4fb8	1380	Cerknica
00050000-55c1-f5a9-093e-581273ff4672	5282	Cerkno
00050000-55c1-f5a9-d3c6-4b4a817b0dba	2236	Cerkvenjak
00050000-55c1-f5a9-0fe0-13c2ca41d2c9	2215	Ceršak
00050000-55c1-f5a9-d0f1-13e935585178	2326	Cirkovce
00050000-55c1-f5a9-9bbd-015416ac767f	2282	Cirkulane
00050000-55c1-f5a9-1cf5-5cf6c612f030	5273	Col
00050000-55c1-f5a9-276c-06b05cf11b57	8251	Čatež ob Savi
00050000-55c1-f5a9-7d12-f83456235e44	1413	Čemšenik
00050000-55c1-f5a9-2d83-64e4db32da57	5253	Čepovan
00050000-55c1-f5a9-d55e-298dcaf9ffa6	9232	Črenšovci
00050000-55c1-f5a9-3716-6dc459076537	2393	Črna na Koroškem
00050000-55c1-f5a9-b7e4-46e08339a680	6275	Črni Kal
00050000-55c1-f5a9-a789-d4e259f621f0	5274	Črni Vrh nad Idrijo
00050000-55c1-f5a9-fac0-93123c4ce563	5262	Črniče
00050000-55c1-f5a9-de19-86041d8f0917	8340	Črnomelj
00050000-55c1-f5a9-121f-e44135ee65ef	6271	Dekani
00050000-55c1-f5a9-66d3-a0f8676ad5a9	5210	Deskle
00050000-55c1-f5a9-9130-d7792dc34ded	2253	Destrnik
00050000-55c1-f5a9-09c5-baab5ca94a1c	6215	Divača
00050000-55c1-f5a9-5df5-5c611c1d960f	1233	Dob
00050000-55c1-f5a9-28c2-c5704db0738f	3224	Dobje pri Planini
00050000-55c1-f5a9-c644-dad11418ed77	8257	Dobova
00050000-55c1-f5a9-3375-23db0a09d5a0	1423	Dobovec
00050000-55c1-f5a9-0e62-5d64b03511d5	5263	Dobravlje
00050000-55c1-f5a9-4758-bb67cbe95e66	3204	Dobrna
00050000-55c1-f5a9-4f06-8e8418aee779	8211	Dobrnič
00050000-55c1-f5a9-0c40-c990c1d4ddd7	1356	Dobrova
00050000-55c1-f5a9-6d3e-c649335c4e0b	9223	Dobrovnik/Dobronak 
00050000-55c1-f5a9-6d55-40914f18d3a9	5212	Dobrovo v Brdih
00050000-55c1-f5a9-c6f2-e73eef4db1ea	1431	Dol pri Hrastniku
00050000-55c1-f5a9-931d-cb8130abe442	1262	Dol pri Ljubljani
00050000-55c1-f5a9-3cdb-d33ae7509561	1273	Dole pri Litiji
00050000-55c1-f5a9-3db9-2d977b6c151a	1331	Dolenja vas
00050000-55c1-f5a9-724e-95639a93ff62	8350	Dolenjske Toplice
00050000-55c1-f5a9-4be6-705975266274	1230	Domžale
00050000-55c1-f5a9-7723-159b36a2135f	2252	Dornava
00050000-55c1-f5a9-3e4b-aacba183ccf9	5294	Dornberk
00050000-55c1-f5a9-4bdb-276b2f839bae	1319	Draga
00050000-55c1-f5a9-866f-3ad840459388	8343	Dragatuš
00050000-55c1-f5a9-806a-f25c354b0d9c	3222	Dramlje
00050000-55c1-f5a9-3ad1-51dfcf4c68a2	2370	Dravograd
00050000-55c1-f5a9-936a-3a3c7ad78086	4203	Duplje
00050000-55c1-f5a9-d344-b2d30fa6f92a	6221	Dutovlje
00050000-55c1-f5a9-ee0a-41ffc147ef7d	8361	Dvor
00050000-55c1-f5a9-ca48-23c0c49fb5ad	2343	Fala
00050000-55c1-f5a9-2c91-cf1314f53f8c	9208	Fokovci
00050000-55c1-f5a9-ce46-96e423260559	2313	Fram
00050000-55c1-f5a9-905f-52746cf1d1a6	3213	Frankolovo
00050000-55c1-f5a9-c828-dd87ac514491	1274	Gabrovka
00050000-55c1-f5a9-8122-700cb915beee	8254	Globoko
00050000-55c1-f5a9-d6a6-d647efabd19d	5275	Godovič
00050000-55c1-f5a9-1af9-8dddb4f1d787	4204	Golnik
00050000-55c1-f5a9-4357-14355274bb9c	3303	Gomilsko
00050000-55c1-f5a9-7409-92624e425a03	4224	Gorenja vas
00050000-55c1-f5a9-c286-b6e1dfc1daea	3263	Gorica pri Slivnici
00050000-55c1-f5a9-5493-a24fde0cde30	2272	Gorišnica
00050000-55c1-f5a9-984c-20b505491603	9250	Gornja Radgona
00050000-55c1-f5a9-a360-5052f3df15da	3342	Gornji Grad
00050000-55c1-f5a9-a7ae-3adb547570b7	4282	Gozd Martuljek
00050000-55c1-f5a9-029a-e43f65f6d4c2	6272	Gračišče
00050000-55c1-f5a9-2c19-7a6d20ed110f	9264	Grad
00050000-55c1-f5a9-3017-60ecec70025f	8332	Gradac
00050000-55c1-f5a9-1d47-f98776399069	1384	Grahovo
00050000-55c1-f5a9-88dc-f806aed92d38	5242	Grahovo ob Bači
00050000-55c1-f5a9-a4cb-23e3a0f751e7	5251	Grgar
00050000-55c1-f5a9-922c-8d27f5bddb0a	3302	Griže
00050000-55c1-f5a9-d3df-6494088751bb	3231	Grobelno
00050000-55c1-f5a9-6320-411602f27d45	1290	Grosuplje
00050000-55c1-f5a9-25dd-4568ecd35ceb	2288	Hajdina
00050000-55c1-f5a9-74e2-0760ca508596	8362	Hinje
00050000-55c1-f5a9-59b7-7ecd37b8442c	2311	Hoče
00050000-55c1-f5a9-a234-b645246d5941	9205	Hodoš/Hodos
00050000-55c1-f5a9-18a8-617bfc6690fa	1354	Horjul
00050000-55c1-f5a9-c4fc-16ab5c27b5fe	1372	Hotedršica
00050000-55c1-f5a9-8c56-a4ba2537b12d	1430	Hrastnik
00050000-55c1-f5a9-4d15-e2bfd31d57db	6225	Hruševje
00050000-55c1-f5a9-684c-ab5acf7c8e40	4276	Hrušica
00050000-55c1-f5a9-6626-5739d8b2c0f3	5280	Idrija
00050000-55c1-f5a9-0350-5841142af61d	1292	Ig
00050000-55c1-f5a9-306b-8f1dbc6dbd98	6250	Ilirska Bistrica
00050000-55c1-f5a9-6e43-6677d6cbdf0d	6251	Ilirska Bistrica-Trnovo
00050000-55c1-f5a9-b455-053c8bf62d47	1295	Ivančna Gorica
00050000-55c1-f5a9-ddbb-e97dd582efc7	2259	Ivanjkovci
00050000-55c1-f5a9-be19-f60da73df2e5	1411	Izlake
00050000-55c1-f5a9-4b71-1f4b7a5f649b	6310	Izola/Isola
00050000-55c1-f5a9-3461-bc9f705ceb8b	2222	Jakobski Dol
00050000-55c1-f5a9-d333-4846abb0f6d6	2221	Jarenina
00050000-55c1-f5a9-0724-cd44635aa6a0	6254	Jelšane
00050000-55c1-f5a9-e5d6-7456c85ef01d	4270	Jesenice
00050000-55c1-f5a9-0eb3-ff86c07b91ff	8261	Jesenice na Dolenjskem
00050000-55c1-f5a9-14fb-234bc4f2f82a	3273	Jurklošter
00050000-55c1-f5a9-9762-b03637eda188	2223	Jurovski Dol
00050000-55c1-f5a9-069c-a8c7326ddc36	2256	Juršinci
00050000-55c1-f5a9-ca94-c9de87a47cd7	5214	Kal nad Kanalom
00050000-55c1-f5a9-2113-7dae806e6035	3233	Kalobje
00050000-55c1-f5a9-7913-8d4a87140698	4246	Kamna Gorica
00050000-55c1-f5a9-f964-9646a7553280	2351	Kamnica
00050000-55c1-f5a9-2a30-b1d7ac90ed75	1241	Kamnik
00050000-55c1-f5a9-1eac-d433a4193f09	5213	Kanal
00050000-55c1-f5a9-fb30-8f0587ff641d	8258	Kapele
00050000-55c1-f5a9-7e0e-07ea19444d75	2362	Kapla
00050000-55c1-f5a9-de8e-825f789b8ea7	2325	Kidričevo
00050000-55c1-f5a9-c871-218fc16e21ab	1412	Kisovec
00050000-55c1-f5a9-9117-d1ea0aa15b75	6253	Knežak
00050000-55c1-f5a9-8b41-4f9f4c940a2a	5222	Kobarid
00050000-55c1-f5a9-9835-6bb5b958994d	9227	Kobilje
00050000-55c1-f5a9-5bf9-00ca818fe900	1330	Kočevje
00050000-55c1-f5a9-33ce-6e7e7b5b750f	1338	Kočevska Reka
00050000-55c1-f5a9-6b77-e62f94f0aa1d	2276	Kog
00050000-55c1-f5a9-e3ea-79f0e17c4a91	5211	Kojsko
00050000-55c1-f5a9-77b2-aed4e410c480	6223	Komen
00050000-55c1-f5a9-244e-c8769d55136a	1218	Komenda
00050000-55c1-f5a9-a1f1-4f126533a26f	6000	Koper/Capodistria 
00050000-55c1-f5a9-aea9-66905c2d9ef5	6001	Koper/Capodistria - poštni predali
00050000-55c1-f5a9-3ed2-d7e2af0a1f5e	8282	Koprivnica
00050000-55c1-f5a9-51b7-35ac4516784e	5296	Kostanjevica na Krasu
00050000-55c1-f5a9-7d47-28825e65eb11	8311	Kostanjevica na Krki
00050000-55c1-f5a9-0fbc-6408c8cd96d2	1336	Kostel
00050000-55c1-f5a9-4e1f-1601398baa61	6256	Košana
00050000-55c1-f5a9-2a64-f505e5c8635f	2394	Kotlje
00050000-55c1-f5a9-fd04-df601907288a	6240	Kozina
00050000-55c1-f5a9-5374-ee2e30a8ec44	3260	Kozje
00050000-55c1-f5a9-d2c1-a4526ff345ff	4000	Kranj 
00050000-55c1-f5a9-9d90-2de26cda4eb1	4001	Kranj - poštni predali
00050000-55c1-f5a9-eb78-ddaf1469869d	4280	Kranjska Gora
00050000-55c1-f5a9-a083-4e6c36545b20	1281	Kresnice
00050000-55c1-f5a9-6887-de1973512002	4294	Križe
00050000-55c1-f5a9-3015-f357d6e7f12c	9206	Križevci
00050000-55c1-f5a9-3144-0b35603bebb0	9242	Križevci pri Ljutomeru
00050000-55c1-f5a9-5119-c876a215b410	1301	Krka
00050000-55c1-f5a9-c77d-125615cb8a71	8296	Krmelj
00050000-55c1-f5a9-7d0e-04610e47d70b	4245	Kropa
00050000-55c1-f5a9-7cfe-250e90ea8648	8262	Krška vas
00050000-55c1-f5a9-807e-22b5778de59d	8270	Krško
00050000-55c1-f5a9-de76-13d294a9aa25	9263	Kuzma
00050000-55c1-f5a9-01e2-3efeb697abe2	2318	Laporje
00050000-55c1-f5a9-85a0-38208e0b45b9	3270	Laško
00050000-55c1-f5a9-c6ee-277e37cfa881	1219	Laze v Tuhinju
00050000-55c1-f5a9-19b8-0555b190562c	2230	Lenart v Slovenskih goricah
00050000-55c1-f5a9-a9b8-108809c46fca	9220	Lendava/Lendva
00050000-55c1-f5a9-1e4b-4cb4c1f0b038	4248	Lesce
00050000-55c1-f5a9-7151-fc76d17986b7	3261	Lesično
00050000-55c1-f5a9-67d2-e8fb7a1f67e3	8273	Leskovec pri Krškem
00050000-55c1-f5a9-54bb-89f5b5a7d10f	2372	Libeliče
00050000-55c1-f5a9-df50-f14437adf70e	2341	Limbuš
00050000-55c1-f5a9-abfa-848b9d51bdcb	1270	Litija
00050000-55c1-f5a9-4e7e-8126e2d4f804	3202	Ljubečna
00050000-55c1-f5a9-b982-21cd0756ba28	1000	Ljubljana 
00050000-55c1-f5a9-ab99-8653b72ce38e	1001	Ljubljana - poštni predali
00050000-55c1-f5a9-46aa-05fdf175e3af	1231	Ljubljana - Črnuče
00050000-55c1-f5a9-486c-34a7e4d1baf4	1261	Ljubljana - Dobrunje
00050000-55c1-f5a9-e1de-711f2d54ab7f	1260	Ljubljana - Polje
00050000-55c1-f5a9-e8dd-5cbbf17344aa	1210	Ljubljana - Šentvid
00050000-55c1-f5a9-c296-f32cb119599b	1211	Ljubljana - Šmartno
00050000-55c1-f5a9-cb47-c48f22cd830e	3333	Ljubno ob Savinji
00050000-55c1-f5a9-a449-9282b1c5fc0b	9240	Ljutomer
00050000-55c1-f5a9-98bf-7542770cae8c	3215	Loče
00050000-55c1-f5a9-70fb-906b34279180	5231	Log pod Mangartom
00050000-55c1-f5a9-c4d6-f2d69ec3465f	1358	Log pri Brezovici
00050000-55c1-f5a9-ee18-5bbd1a654b5d	1370	Logatec
00050000-55c1-f5a9-efff-a2525e3b3c78	1371	Logatec
00050000-55c1-f5a9-c18d-2de03b2dc264	1434	Loka pri Zidanem Mostu
00050000-55c1-f5a9-d715-178890934638	3223	Loka pri Žusmu
00050000-55c1-f5a9-9c60-6dbbae78fe6d	6219	Lokev
00050000-55c1-f5a9-298a-3f4a914aa454	1318	Loški Potok
00050000-55c1-f5a9-44e8-a685040d97ad	2324	Lovrenc na Dravskem polju
00050000-55c1-f5a9-c482-13a45191436a	2344	Lovrenc na Pohorju
00050000-55c1-f5a9-4cbb-4a3365c6e0b7	3334	Luče
00050000-55c1-f5a9-9e50-799c834cfc88	1225	Lukovica
00050000-55c1-f5a9-92e6-f3c847104237	9202	Mačkovci
00050000-55c1-f5a9-ea8e-169e228e9a1d	2322	Majšperk
00050000-55c1-f5a9-b7c7-3c3091e19b4a	2321	Makole
00050000-55c1-f5a9-f4e0-6dafbc983b14	9243	Mala Nedelja
00050000-55c1-f5a9-3f6e-f68b2bf6ef69	2229	Malečnik
00050000-55c1-f5a9-233c-46d1d7d98c2f	6273	Marezige
00050000-55c1-f5a9-58b9-b2fa716cdd44	2000	Maribor 
00050000-55c1-f5a9-6f89-409782cd7f19	2001	Maribor - poštni predali
00050000-55c1-f5a9-7ead-2a32f9715946	2206	Marjeta na Dravskem polju
00050000-55c1-f5a9-578e-5cd835747c14	2281	Markovci
00050000-55c1-f5a9-23e3-17348f9daeff	9221	Martjanci
00050000-55c1-f5a9-9937-1f5c0458bf9a	6242	Materija
00050000-55c1-f5a9-cc10-4946d65060fe	4211	Mavčiče
00050000-55c1-f5a9-6b8f-c091febd33ef	1215	Medvode
00050000-55c1-f5a9-57f2-09cf8f7a9607	1234	Mengeš
00050000-55c1-f5a9-b88a-de0b2bfd0d37	8330	Metlika
00050000-55c1-f5a9-ecc7-66cc4e4313fd	2392	Mežica
00050000-55c1-f5a9-513b-2832fb08777c	2204	Miklavž na Dravskem polju
00050000-55c1-f5a9-4cb8-d17d23041005	2275	Miklavž pri Ormožu
00050000-55c1-f5a9-8697-63fb4d3ca98e	5291	Miren
00050000-55c1-f5a9-961a-4d335152b8fa	8233	Mirna
00050000-55c1-f5a9-99a1-b8efab2d4bd0	8216	Mirna Peč
00050000-55c1-f5a9-41f5-c2a135cbaf97	2382	Mislinja
00050000-55c1-f5a9-ca7d-91fdf0a5cafb	4281	Mojstrana
00050000-55c1-f5a9-feb1-bc18bc66b8ca	8230	Mokronog
00050000-55c1-f5a9-1e1f-eebb50306df5	1251	Moravče
00050000-55c1-f5a9-39d9-eb3b9f416292	9226	Moravske Toplice
00050000-55c1-f5a9-e451-276d94f5c83d	5216	Most na Soči
00050000-55c1-f5a9-3d23-cded5d6468da	1221	Motnik
00050000-55c1-f5a9-a5d7-8f9cb0f7815a	3330	Mozirje
00050000-55c1-f5a9-0f1b-0681670b3688	9000	Murska Sobota 
00050000-55c1-f5a9-0031-2d62c75eb89c	9001	Murska Sobota - poštni predali
00050000-55c1-f5a9-4a94-b9fefe87faa5	2366	Muta
00050000-55c1-f5a9-0b61-dd9c01753ada	4202	Naklo
00050000-55c1-f5a9-ab74-ba404bd7ed84	3331	Nazarje
00050000-55c1-f5a9-91d9-2118be18804d	1357	Notranje Gorice
00050000-55c1-f5a9-7de3-cb7a97819ccb	3203	Nova Cerkev
00050000-55c1-f5a9-da23-abeb53f96166	5000	Nova Gorica 
00050000-55c1-f5a9-45a7-d4615ee1537a	5001	Nova Gorica - poštni predali
00050000-55c1-f5a9-3e64-896a1dad143c	1385	Nova vas
00050000-55c1-f5a9-869d-6763a1797a72	8000	Novo mesto
00050000-55c1-f5a9-d4e6-2fcc12834d56	8001	Novo mesto - poštni predali
00050000-55c1-f5a9-30f8-4f67b562af2c	6243	Obrov
00050000-55c1-f5a9-a3e4-8fc97940c260	9233	Odranci
00050000-55c1-f5a9-afa7-922c6551854f	2317	Oplotnica
00050000-55c1-f5a9-7b1d-a6843f76746e	2312	Orehova vas
00050000-55c1-f5a9-1672-711e812bc27b	2270	Ormož
00050000-55c1-f5a9-e08b-a1a8bd44d080	1316	Ortnek
00050000-55c1-f5a9-fd05-b82085282992	1337	Osilnica
00050000-55c1-f5a9-cc60-2f5bc934a9c2	8222	Otočec
00050000-55c1-f5a9-4bed-625d6273414f	2361	Ožbalt
00050000-55c1-f5a9-de70-74b5da248a1f	2231	Pernica
00050000-55c1-f5a9-2be4-98348c8381dd	2211	Pesnica pri Mariboru
00050000-55c1-f5a9-acd9-498b8acbbdf5	9203	Petrovci
00050000-55c1-f5a9-cc80-4b068b93406c	3301	Petrovče
00050000-55c1-f5a9-ad30-e450fd02ef73	6330	Piran/Pirano
00050000-55c1-f5a9-8ab3-19164803e7f3	8255	Pišece
00050000-55c1-f5a9-26ee-6fcce64f11c6	6257	Pivka
00050000-55c1-f5a9-50ae-f09c6ace4f0f	6232	Planina
00050000-55c1-f5a9-c984-7c055dba8c04	3225	Planina pri Sevnici
00050000-55c1-f5a9-b3d6-3052a173e304	6276	Pobegi
00050000-55c1-f5a9-2fc0-8f9d1a98f5b2	8312	Podbočje
00050000-55c1-f5a9-6423-a4309b669f5b	5243	Podbrdo
00050000-55c1-f5a9-0a98-b50e9a9ae3d2	3254	Podčetrtek
00050000-55c1-f5a9-bb15-a53b9152eeb9	2273	Podgorci
00050000-55c1-f5a9-1345-1244475810d4	6216	Podgorje
00050000-55c1-f5a9-ddf6-a50b8d37a2c4	2381	Podgorje pri Slovenj Gradcu
00050000-55c1-f5a9-b6fa-cdfc0ae57b57	6244	Podgrad
00050000-55c1-f5a9-29b3-472583e0cecd	1414	Podkum
00050000-55c1-f5a9-21d4-2ddbadc01cbf	2286	Podlehnik
00050000-55c1-f5a9-0656-faffc9a64d4b	5272	Podnanos
00050000-55c1-f5a9-f31a-23ab633b3223	4244	Podnart
00050000-55c1-f5a9-e327-cfe8c3ce6307	3241	Podplat
00050000-55c1-f5a9-5a94-c40dabbee5c3	3257	Podsreda
00050000-55c1-f5a9-3c29-8879d2170e8b	2363	Podvelka
00050000-55c1-f5a9-6e96-739d424d90ea	2208	Pohorje
00050000-55c1-f5a9-04cc-d378499c74c2	2257	Polenšak
00050000-55c1-f5a9-8bce-1db9781c1f0f	1355	Polhov Gradec
00050000-55c1-f5a9-5a29-d13fb73d1927	4223	Poljane nad Škofjo Loko
00050000-55c1-f5a9-920d-8232dd865190	2319	Poljčane
00050000-55c1-f5a9-6389-c017d1de1d26	1272	Polšnik
00050000-55c1-f5a9-7408-9b744551c139	3313	Polzela
00050000-55c1-f5a9-eefa-12b9ea3d2d6f	3232	Ponikva
00050000-55c1-f5a9-5463-c874af5aa8b5	6320	Portorož/Portorose
00050000-55c1-f5a9-fb97-dbb0cd7777c8	6230	Postojna
00050000-55c1-f5a9-45f2-2e1ece4fff59	2331	Pragersko
00050000-55c1-f5a9-2ab7-2f9462cf7c60	3312	Prebold
00050000-55c1-f5a9-f1bf-acf520374c9b	4205	Preddvor
00050000-55c1-f5a9-df22-47615213dd9e	6255	Prem
00050000-55c1-f5a9-7d88-ec3971425343	1352	Preserje
00050000-55c1-f5a9-a5f9-7467b6b1d90c	6258	Prestranek
00050000-55c1-f5a9-3166-49dfb91b7624	2391	Prevalje
00050000-55c1-f5a9-8a65-1b879d0cd487	3262	Prevorje
00050000-55c1-f5a9-3ad0-5e333b678469	1276	Primskovo 
00050000-55c1-f5a9-bb71-f30b54e59fde	3253	Pristava pri Mestinju
00050000-55c1-f5a9-b63c-c8075330e822	9207	Prosenjakovci/Partosfalva
00050000-55c1-f5a9-eec9-7eda3960e15e	5297	Prvačina
00050000-55c1-f5a9-ddd1-dfa78813b2ed	2250	Ptuj
00050000-55c1-f5a9-890b-e29d5dc48c07	2323	Ptujska Gora
00050000-55c1-f5a9-d242-49724df1d3aa	9201	Puconci
00050000-55c1-f5a9-1b7e-aef1a00f14a4	2327	Rače
00050000-55c1-f5a9-1317-728c75cdc122	1433	Radeče
00050000-55c1-f5a9-abd9-21e1f527ca49	9252	Radenci
00050000-55c1-f5a9-d7ef-226ce9b28d23	2360	Radlje ob Dravi
00050000-55c1-f5a9-8492-a3394d7cb524	1235	Radomlje
00050000-55c1-f5a9-af8b-16df16fc69bf	4240	Radovljica
00050000-55c1-f5a9-c7f8-b716d232f03e	8274	Raka
00050000-55c1-f5a9-0f64-17740dea09e2	1381	Rakek
00050000-55c1-f5a9-600d-3989aade20ec	4283	Rateče - Planica
00050000-55c1-f5a9-d28d-b36b32fea4aa	2390	Ravne na Koroškem
00050000-55c1-f5a9-4dbb-b4723340a617	9246	Razkrižje
00050000-55c1-f5a9-3920-9428cd111f48	3332	Rečica ob Savinji
00050000-55c1-f5a9-55d0-4fd531821504	5292	Renče
00050000-55c1-f5a9-a61b-fd8a648adb3d	1310	Ribnica
00050000-55c1-f5a9-50e3-fb442c7ab8ab	2364	Ribnica na Pohorju
00050000-55c1-f5a9-7475-2cc65db6ac57	3272	Rimske Toplice
00050000-55c1-f5a9-668c-34abc8fd25f4	1314	Rob
00050000-55c1-f5a9-7148-df5a58984a7b	5215	Ročinj
00050000-55c1-f5a9-9792-3796880cc88d	3250	Rogaška Slatina
00050000-55c1-f5a9-ad60-f37834c978db	9262	Rogašovci
00050000-55c1-f5a9-1e8e-f856c0e5d865	3252	Rogatec
00050000-55c1-f5a9-d287-29427a01450e	1373	Rovte
00050000-55c1-f5a9-0562-9770666a455b	2342	Ruše
00050000-55c1-f5a9-6e64-970c9f0cf9f0	1282	Sava
00050000-55c1-f5a9-af76-c1128cc98603	6333	Sečovlje/Sicciole
00050000-55c1-f5a9-9dcf-9733cc6643a4	4227	Selca
00050000-55c1-f5a9-f3a4-5673ea415692	2352	Selnica ob Dravi
00050000-55c1-f5a9-73ad-1f966b77cdde	8333	Semič
00050000-55c1-f5a9-c0f0-41d83a56fb16	8281	Senovo
00050000-55c1-f5a9-9f80-1ef3699a6335	6224	Senožeče
00050000-55c1-f5a9-21ff-13761a616579	8290	Sevnica
00050000-55c1-f5a9-26ad-dfc468fd443a	6210	Sežana
00050000-55c1-f5a9-c249-4fa58cb7c91a	2214	Sladki Vrh
00050000-55c1-f5a9-2185-25ca8b970ede	5283	Slap ob Idrijci
00050000-55c1-f5a9-9da6-cbdc0f4ff370	2380	Slovenj Gradec
00050000-55c1-f5a9-7448-5e478df776a3	2310	Slovenska Bistrica
00050000-55c1-f5a9-e422-85bb9b8cc3d1	3210	Slovenske Konjice
00050000-55c1-f5a9-b36b-6affa544e6dd	1216	Smlednik
00050000-55c1-f5a9-ba37-de4a26525c90	5232	Soča
00050000-55c1-f5a9-be7d-5f6413461bc6	1317	Sodražica
00050000-55c1-f5a9-7cd5-56e8744d3c61	3335	Solčava
00050000-55c1-f5a9-a78a-472df8a59f9f	5250	Solkan
00050000-55c1-f5a9-76c2-058f8a4fe128	4229	Sorica
00050000-55c1-f5a9-7efd-16bb2d54f78c	4225	Sovodenj
00050000-55c1-f5a9-f3a1-704440dff3df	5281	Spodnja Idrija
00050000-55c1-f5a9-8292-1cbd2fbd3367	2241	Spodnji Duplek
00050000-55c1-f5a9-0c17-8e6970387eb7	9245	Spodnji Ivanjci
00050000-55c1-f5a9-db20-9b4e3a91d94e	2277	Središče ob Dravi
00050000-55c1-f5a9-67cf-b44233463889	4267	Srednja vas v Bohinju
00050000-55c1-f5a9-730d-8bb3e04d455c	8256	Sromlje 
00050000-55c1-f5a9-0124-cb67a5212df8	5224	Srpenica
00050000-55c1-f5a9-115f-4685eb9ad840	1242	Stahovica
00050000-55c1-f5a9-0eaa-26807cd3220c	1332	Stara Cerkev
00050000-55c1-f5a9-5bc2-fbf95545e91d	8342	Stari trg ob Kolpi
00050000-55c1-f5a9-eee3-167880f5bb45	1386	Stari trg pri Ložu
00050000-55c1-f5a9-beb6-c824dcb7c8a2	2205	Starše
00050000-55c1-f5a9-87bf-dd9c44c5cb46	2289	Stoperce
00050000-55c1-f5a9-2fc1-c6ec7d6284d9	8322	Stopiče
00050000-55c1-f5a9-ed3c-40f2e964e2be	3206	Stranice
00050000-55c1-f5a9-5f68-5b1f60fd86da	8351	Straža
00050000-55c1-f5a9-715b-e5dda7abc1b0	1313	Struge
00050000-55c1-f5a9-6a60-09f032fb81b6	8293	Studenec
00050000-55c1-f5a9-7742-a2e05c794d3b	8331	Suhor
00050000-55c1-f5a9-210e-b20c6b809798	2233	Sv. Ana v Slovenskih goricah
00050000-55c1-f5a9-598e-94554e0141cf	2235	Sv. Trojica v Slovenskih goricah
00050000-55c1-f5a9-63ba-1fd18595ad1e	2353	Sveti Duh na Ostrem Vrhu
00050000-55c1-f5a9-81c9-9195a7c4fa9f	9244	Sveti Jurij ob Ščavnici
00050000-55c1-f5a9-161e-6a98737223fa	3264	Sveti Štefan
00050000-55c1-f5a9-25e3-15f85f7672f2	2258	Sveti Tomaž
00050000-55c1-f5a9-e0b7-c162ea464141	9204	Šalovci
00050000-55c1-f5a9-f06f-37d50d80cc22	5261	Šempas
00050000-55c1-f5a9-1324-e0e9d5c7aed9	5290	Šempeter pri Gorici
00050000-55c1-f5a9-8bd0-78941fef5d27	3311	Šempeter v Savinjski dolini
00050000-55c1-f5a9-83fa-cdb8e93af6b0	4208	Šenčur
00050000-55c1-f5a9-4788-7509abf6eb40	2212	Šentilj v Slovenskih goricah
00050000-55c1-f5a9-c848-58a5931170f5	8297	Šentjanž
00050000-55c1-f5a9-eba6-52b07f771532	2373	Šentjanž pri Dravogradu
00050000-55c1-f5a9-bbe3-75e8eb464434	8310	Šentjernej
00050000-55c1-f5a9-5ef9-2cd6d69e473e	3230	Šentjur
00050000-55c1-f5a9-21a8-1b2ed6439ba4	3271	Šentrupert
00050000-55c1-f5a9-3e8e-124aa1794820	8232	Šentrupert
00050000-55c1-f5a9-bf60-ecd5af5dd3be	1296	Šentvid pri Stični
00050000-55c1-f5a9-d5da-fb63b34db85d	8275	Škocjan
00050000-55c1-f5a9-494a-57d5d2954c01	6281	Škofije
00050000-55c1-f5a9-60ce-84d709a197fc	4220	Škofja Loka
00050000-55c1-f5a9-3117-75757d22d032	3211	Škofja vas
00050000-55c1-f5a9-2223-41d3fbd0a77e	1291	Škofljica
00050000-55c1-f5a9-40c8-15de2202ab13	6274	Šmarje
00050000-55c1-f5a9-8750-92ae7a72a2bc	1293	Šmarje - Sap
00050000-55c1-f5a9-01de-5324604fe5f7	3240	Šmarje pri Jelšah
00050000-55c1-f5a9-dda7-ba73757e23ef	8220	Šmarješke Toplice
00050000-55c1-f5a9-d888-e6bedfc3acb5	2315	Šmartno na Pohorju
00050000-55c1-f5a9-b873-7872fddee23e	3341	Šmartno ob Dreti
00050000-55c1-f5a9-b0e9-3b4922a99676	3327	Šmartno ob Paki
00050000-55c1-f5a9-bef9-a539636e8815	1275	Šmartno pri Litiji
00050000-55c1-f5a9-a45f-9269e80a773b	2383	Šmartno pri Slovenj Gradcu
00050000-55c1-f5a9-b915-619023c5cd4d	3201	Šmartno v Rožni dolini
00050000-55c1-f5a9-1977-4dbd60ea9deb	3325	Šoštanj
00050000-55c1-f5a9-ddfb-695a9731eba4	6222	Štanjel
00050000-55c1-f5a9-959d-6e3223308665	3220	Štore
00050000-55c1-f5a9-590b-3bc020681a4d	3304	Tabor
00050000-55c1-f5a9-83f6-f19e12b036d8	3221	Teharje
00050000-55c1-f5a9-10af-31028bd5b884	9251	Tišina
00050000-55c1-f5a9-ada8-c6497ebb7030	5220	Tolmin
00050000-55c1-f5a9-eb79-e6999bf89198	3326	Topolšica
00050000-55c1-f5a9-fe8c-f78b66b22cfe	2371	Trbonje
00050000-55c1-f5a9-9e37-1ea3f90d4610	1420	Trbovlje
00050000-55c1-f5a9-66a2-baf61d1def7f	8231	Trebelno 
00050000-55c1-f5a9-b393-814208804a13	8210	Trebnje
00050000-55c1-f5a9-baa2-30dc4d570931	5252	Trnovo pri Gorici
00050000-55c1-f5a9-a80c-3e5878c4653c	2254	Trnovska vas
00050000-55c1-f5a9-503c-978502e2b43b	1222	Trojane
00050000-55c1-f5a9-857b-251357c3a0d7	1236	Trzin
00050000-55c1-f5a9-0439-ebb405d4ed43	4290	Tržič
00050000-55c1-f5a9-b0b7-fa105a89a86c	8295	Tržišče
00050000-55c1-f5a9-41d9-189f28f26b32	1311	Turjak
00050000-55c1-f5a9-5022-c766d66c901a	9224	Turnišče
00050000-55c1-f5a9-c234-a629984200a6	8323	Uršna sela
00050000-55c1-f5a9-aede-df903cbd19b5	1252	Vače
00050000-55c1-f5a9-1212-59355a1aa7f1	3320	Velenje 
00050000-55c1-f5a9-e71d-44767c28569a	3322	Velenje - poštni predali
00050000-55c1-f5a9-4412-626b653740f2	8212	Velika Loka
00050000-55c1-f5a9-b138-0e69d8c2b3da	2274	Velika Nedelja
00050000-55c1-f5a9-2419-e240c43473de	9225	Velika Polana
00050000-55c1-f5a9-2c7d-6b523a8aab4b	1315	Velike Lašče
00050000-55c1-f5a9-2421-ed36a7c3f096	8213	Veliki Gaber
00050000-55c1-f5a9-8de7-8557ce00ba8a	9241	Veržej
00050000-55c1-f5a9-3f64-b238c59296ea	1312	Videm - Dobrepolje
00050000-55c1-f5a9-54b1-9d1a40353058	2284	Videm pri Ptuju
00050000-55c1-f5a9-f6d7-e92a3bfb9d9f	8344	Vinica
00050000-55c1-f5a9-e773-e4aa5c4b7298	5271	Vipava
00050000-55c1-f5a9-c36b-1beabd4931aa	4212	Visoko
00050000-55c1-f5a9-e090-377d51dfbf5e	1294	Višnja Gora
00050000-55c1-f5a9-558c-18e0c0d54173	3205	Vitanje
00050000-55c1-f5a9-7c09-02ee32a67a5a	2255	Vitomarci
00050000-55c1-f5a9-5d59-9adca8bdc31a	1217	Vodice
00050000-55c1-f5a9-0936-19bf656a2bcd	3212	Vojnik\t
00050000-55c1-f5a9-0636-4b80ea2de197	5293	Volčja Draga
00050000-55c1-f5a9-4fcc-b8b29cbc9696	2232	Voličina
00050000-55c1-f5a9-7adb-e98e603334ae	3305	Vransko
00050000-55c1-f5a9-883b-d7c803cef3c2	6217	Vremski Britof
00050000-55c1-f5a9-dfe9-b2dff10fd458	1360	Vrhnika
00050000-55c1-f5a9-1852-f6717b5ea934	2365	Vuhred
00050000-55c1-f5a9-dad9-ed2e3b682864	2367	Vuzenica
00050000-55c1-f5a9-5c1b-db8ca2a6eb14	8292	Zabukovje 
00050000-55c1-f5a9-e812-26ab76220799	1410	Zagorje ob Savi
00050000-55c1-f5a9-168f-f70173cb3e35	1303	Zagradec
00050000-55c1-f5a9-a683-8e942aef7e4b	2283	Zavrč
00050000-55c1-f5a9-f1e5-3cc4d20aaf4a	8272	Zdole 
00050000-55c1-f5a9-6620-817841d5ad10	4201	Zgornja Besnica
00050000-55c1-f5a9-026c-2d7cedeb5900	2242	Zgornja Korena
00050000-55c1-f5a9-4bf5-9364e47f1a75	2201	Zgornja Kungota
00050000-55c1-f5a9-badf-438fd940ec7f	2316	Zgornja Ložnica
00050000-55c1-f5a9-3f48-8aaaf6b785a9	2314	Zgornja Polskava
00050000-55c1-f5a9-160d-13329c2e7508	2213	Zgornja Velka
00050000-55c1-f5a9-195c-a557657ddb4d	4247	Zgornje Gorje
00050000-55c1-f5a9-4a08-934ac53f713e	4206	Zgornje Jezersko
00050000-55c1-f5a9-eec1-8f72e02719ea	2285	Zgornji Leskovec
00050000-55c1-f5a9-ace1-68379d1cc2fb	1432	Zidani Most
00050000-55c1-f5a9-8746-f3d518dd3e7e	3214	Zreče
00050000-55c1-f5a9-cccd-dc11fde19e23	4209	Žabnica
00050000-55c1-f5a9-9c8f-ccdf94b2437f	3310	Žalec
00050000-55c1-f5a9-6134-c762680026af	4228	Železniki
00050000-55c1-f5a9-31c7-372c79d95548	2287	Žetale
00050000-55c1-f5a9-c9ef-7c24fde1b9c5	4226	Žiri
00050000-55c1-f5a9-5e47-b4d6e31d69e2	4274	Žirovnica
00050000-55c1-f5a9-e230-ca74ff515425	8360	Žužemberk
\.


--
-- TOC entry 3021 (class 0 OID 11965132)
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
-- TOC entry 3003 (class 0 OID 11964939)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11965017)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 11965144)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3046 (class 0 OID 11965475)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3047 (class 0 OID 11965485)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55c1-f5aa-27cd-2daa4e9471e6	00080000-55c1-f5aa-b97d-c1753bc11d4d	0900	AK
00190000-55c1-f5aa-8ac3-b2ef3a09d444	00080000-55c1-f5aa-3aab-94856cabf432	0987	AK
00190000-55c1-f5aa-eaf8-397986cebb58	00080000-55c1-f5aa-b993-6b80757bb8d4	0989	AK
00190000-55c1-f5aa-563e-00f745562782	00080000-55c1-f5aa-bce2-33708dd4f762	0986	AK
00190000-55c1-f5aa-fe7e-7b659d481d6d	00080000-55c1-f5aa-0867-eec7f21e49c4	0984	AK
00190000-55c1-f5aa-6ec6-258c43b1dfdb	00080000-55c1-f5aa-8c2b-c52514006441	0983	AK
00190000-55c1-f5aa-651b-a5d6916f7135	00080000-55c1-f5aa-6e57-d1b4f9a40be0	0982	AK
\.


--
-- TOC entry 3045 (class 0 OID 11965431)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55c1-f5aa-500a-dd84e590a54b	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3048 (class 0 OID 11965493)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11965173)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55c1-f5aa-7014-a4477074fed7	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55c1-f5aa-c358-ac7646f7d939	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55c1-f5aa-32aa-988755b9b1fd	0003	Kazinska	t	84	Kazinska dvorana
00220000-55c1-f5aa-5784-307c5e9a307d	0004	Mali oder	t	24	Mali oder 
00220000-55c1-f5aa-d23d-4c8101943bb0	0005	Komorni oder	t	15	Komorni oder
00220000-55c1-f5aa-7b9f-878a6ec122e7	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55c1-f5aa-95d6-7e97968b6397	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3019 (class 0 OID 11965117)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11965107)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 11965292)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 11965241)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 11964811)
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
-- TOC entry 3028 (class 0 OID 11965183)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 11964849)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55c1-f5a8-7b71-d8bde6be3a05	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55c1-f5a8-de01-d10b6c731d85	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55c1-f5a8-b514-5d23a08a8d3b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55c1-f5a8-fcc6-d2cd53cf9cdc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55c1-f5a8-3642-7a90adfe4c89	planer	Planer dogodkov v koledarju	t
00020000-55c1-f5a8-a5f3-9899a9c9ed88	kadrovska	Kadrovska služba	t
00020000-55c1-f5a8-f23d-1052c142daa9	arhivar	Ažuriranje arhivalij	t
00020000-55c1-f5a9-14f5-0419628654df	igralec	Igralec	t
00020000-55c1-f5a9-c8d7-9fd3be797154	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55c1-f5aa-d6d6-95116c12a3b0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2994 (class 0 OID 11964833)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55c1-f5a9-7b92-51bcc85a21cf	00020000-55c1-f5a8-b514-5d23a08a8d3b
00010000-55c1-f5a9-0719-9d80f6f46bf0	00020000-55c1-f5a8-b514-5d23a08a8d3b
00010000-55c1-f5aa-33f4-70f8a254526c	00020000-55c1-f5aa-d6d6-95116c12a3b0
\.


--
-- TOC entry 3030 (class 0 OID 11965197)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 11965138)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 11965084)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 11965534)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55c1-f5a9-cfba-72c3a043ae6c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55c1-f5a9-e89e-6fe1b352db47	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55c1-f5a9-5c80-a46009f7d2b2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55c1-f5a9-05aa-87879877ead9	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55c1-f5a9-84ee-88da1e19fe0f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3052 (class 0 OID 11965526)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55c1-f5a9-17a4-736e85b8cf91	00230000-55c1-f5a9-05aa-87879877ead9	popa
00240000-55c1-f5a9-6cc5-59c2add227b8	00230000-55c1-f5a9-05aa-87879877ead9	oseba
00240000-55c1-f5a9-3dbc-ee4c0bd68133	00230000-55c1-f5a9-05aa-87879877ead9	sezona
00240000-55c1-f5a9-8676-598f922206d0	00230000-55c1-f5a9-e89e-6fe1b352db47	prostor
00240000-55c1-f5a9-a924-023f8a182b50	00230000-55c1-f5a9-05aa-87879877ead9	besedilo
00240000-55c1-f5a9-5131-9db4513c2d78	00230000-55c1-f5a9-05aa-87879877ead9	uprizoritev
00240000-55c1-f5a9-d788-cc8a390f609e	00230000-55c1-f5a9-05aa-87879877ead9	funkcija
00240000-55c1-f5a9-19e2-f7c985c49df6	00230000-55c1-f5a9-05aa-87879877ead9	tipfunkcije
00240000-55c1-f5a9-d84e-bda11d4ad97c	00230000-55c1-f5a9-05aa-87879877ead9	alternacija
00240000-55c1-f5a9-6b55-2191b633f795	00230000-55c1-f5a9-cfba-72c3a043ae6c	pogodba
00240000-55c1-f5a9-f7e2-fd120398b2ea	00230000-55c1-f5a9-05aa-87879877ead9	zaposlitev
00240000-55c1-f5a9-9a8a-9777119ab81a	00230000-55c1-f5a9-cfba-72c3a043ae6c	programdela
00240000-55c1-f5a9-50b1-1a6c5aac79c4	00230000-55c1-f5a9-05aa-87879877ead9	zapis
\.


--
-- TOC entry 3051 (class 0 OID 11965521)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 11965251)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55c1-f5aa-6d17-91a7754bdf99	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	00080000-55c1-f5aa-44ab-0f8d550a6c2b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55c1-f5aa-3eac-cd0fd84a66a7	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	00080000-55c1-f5aa-44ab-0f8d550a6c2b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55c1-f5aa-424f-0c7e32435c79	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	00080000-55c1-f5aa-98ff-329f56a705dd	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55c1-f5aa-55c7-2a2cd7c0cebc	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	00080000-55c1-f5aa-98ff-329f56a705dd	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 3001 (class 0 OID 11964911)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11965094)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55c1-f5aa-7ffb-6fa3fe149164	00180000-55c1-f5aa-567c-e5db29db5d49	000c0000-55c1-f5aa-f831-052b9aadd2d5	00090000-55c1-f5aa-e9cb-4692cf3cf50c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-f5aa-6443-54e9c20125f5	00180000-55c1-f5aa-567c-e5db29db5d49	000c0000-55c1-f5aa-619f-b79deda585e3	00090000-55c1-f5aa-4d06-f17d6f7a0f49	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-f5aa-0491-6b289e3753c2	00180000-55c1-f5aa-567c-e5db29db5d49	000c0000-55c1-f5aa-19f4-a16bb7d80c93	00090000-55c1-f5aa-5dc4-83685f8d23a4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-f5aa-c364-5f7846e8d542	00180000-55c1-f5aa-567c-e5db29db5d49	000c0000-55c1-f5aa-9c58-a7f15a14f25e	00090000-55c1-f5aa-0858-adac73fb6ef5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-f5aa-6ee8-147c453d8351	00180000-55c1-f5aa-567c-e5db29db5d49	000c0000-55c1-f5aa-449a-e2280d366d74	00090000-55c1-f5aa-629d-04dcfe44c69f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55c1-f5aa-b6b5-db20caaab664	00180000-55c1-f5aa-46dc-dbe0d82da647	\N	00090000-55c1-f5aa-629d-04dcfe44c69f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3037 (class 0 OID 11965281)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55c1-f5a9-e609-7e379cd17fb3	Avtor	Avtorji	Avtorka	umetnik
000f0000-55c1-f5a9-0b31-4ffb374a9abf	Priredba	Priredba	Priredba	umetnik
000f0000-55c1-f5a9-1f1c-bf59f423cd11	Prevod	Prevod	Prevod	umetnik
000f0000-55c1-f5a9-2f09-1f3d50890d63	Režija	Režija	Režija	umetnik
000f0000-55c1-f5a9-1afe-59326065d5cf	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55c1-f5a9-af63-51546a00c8f9	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55c1-f5a9-0418-d3ab2e058f4a	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55c1-f5a9-c999-20935f29b1f6	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55c1-f5a9-b166-a4ce055088d6	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55c1-f5a9-82e3-fd1fe5dc1171	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55c1-f5a9-2ca0-5a036ab69d19	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55c1-f5a9-1c93-87640ebca8f9	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55c1-f5a9-02a3-cb8bc0aa62d0	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55c1-f5a9-e52d-728884fe6132	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55c1-f5a9-885c-a95cdeed5e69	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55c1-f5a9-1801-122f5ed3dd47	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55c1-f5a9-c1f1-c084e7daa2a7	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55c1-f5a9-cd78-a8502bd1d97d	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3049 (class 0 OID 11965503)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55c1-f5a9-590a-1aed9917126a	01	Velika predstava	f	1.00	1.00
002b0000-55c1-f5a9-8280-6ece2886ce65	02	Mala predstava	f	0.50	0.50
002b0000-55c1-f5a9-f3b3-c3656fc64e35	03	Mala koprodukcija	t	0.40	1.00
002b0000-55c1-f5a9-2601-904637f1919a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55c1-f5a9-e0ac-2b32b3c00225	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3006 (class 0 OID 11964974)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11964820)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55c1-f5a9-0719-9d80f6f46bf0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO8s/mW3L.7DtsOODEcG8/c0OuXc9CTlm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-2781-46ebe772fc9f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-07f4-a45a905f3263	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-81f6-953a9b9e844f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-d532-f842c801a9f8	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-a76d-52fef7ff6374	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-714a-167685d35f8f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-6c87-7f2d8df177a1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-d47a-640e51b3fc31	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-fffb-de1f3d8c9384	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55c1-f5aa-33f4-70f8a254526c	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55c1-f5a9-7b92-51bcc85a21cf	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 11965329)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55c1-f5aa-540f-1d02040a5aa8	00160000-55c1-f5aa-cf0a-5daac02c4b0f	00150000-55c1-f5a9-6abc-dd3c29a65073	00140000-55c1-f5a8-a7dc-95c9e989d701	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55c1-f5aa-d23d-4c8101943bb0
000e0000-55c1-f5aa-37ee-bb7e64b17a1e	00160000-55c1-f5aa-5803-fd26f315a7b2	00150000-55c1-f5a9-0fa1-194046aad5ac	00140000-55c1-f5a8-dac7-ddaa40f29cea	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55c1-f5aa-7b9f-878a6ec122e7
000e0000-55c1-f5aa-7486-1dcd7777e0f1	\N	00150000-55c1-f5a9-0fa1-194046aad5ac	00140000-55c1-f5a8-dac7-ddaa40f29cea	00190000-55c1-f5aa-8ac3-b2ef3a09d444	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55c1-f5aa-d23d-4c8101943bb0
000e0000-55c1-f5aa-fdc7-a1c92739332c	\N	00150000-55c1-f5a9-0fa1-194046aad5ac	00140000-55c1-f5a8-dac7-ddaa40f29cea	00190000-55c1-f5aa-8ac3-b2ef3a09d444	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55c1-f5aa-d23d-4c8101943bb0
000e0000-55c1-f5aa-2cbd-1cc40fe62296	\N	00150000-55c1-f5a9-0fa1-194046aad5ac	00140000-55c1-f5a8-dac7-ddaa40f29cea	00190000-55c1-f5aa-8ac3-b2ef3a09d444	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55c1-f5aa-7014-a4477074fed7
\.


--
-- TOC entry 3011 (class 0 OID 11965036)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55c1-f5aa-af5e-1e36f2827d18	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	1	
00200000-55c1-f5aa-cbc3-41d7a1b8ca36	000e0000-55c1-f5aa-37ee-bb7e64b17a1e	2	
\.


--
-- TOC entry 3026 (class 0 OID 11965165)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 11965573)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 11965545)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 11965585)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 11965234)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55c1-f5aa-a4fe-b9cb4f5cd1e2	00090000-55c1-f5aa-4d06-f17d6f7a0f49	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-f5aa-f3f6-83264073a01d	00090000-55c1-f5aa-5dc4-83685f8d23a4	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-f5aa-46cb-67a7fa131998	00090000-55c1-f5aa-75c2-207042ab8895	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-f5aa-fdd3-6d782ca24425	00090000-55c1-f5aa-985f-b498314f770f	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-f5aa-601f-84947e786987	00090000-55c1-f5aa-e9cb-4692cf3cf50c	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55c1-f5aa-328b-712fcf55647a	00090000-55c1-f5aa-1228-83bf245d2acc	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3013 (class 0 OID 11965068)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 11965319)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55c1-f5a8-a7dc-95c9e989d701	01	Drama	drama (SURS 01)
00140000-55c1-f5a8-4220-91323709e9ea	02	Opera	opera (SURS 02)
00140000-55c1-f5a8-530f-4dcebaa3cecc	03	Balet	balet (SURS 03)
00140000-55c1-f5a8-5cb4-81a6fbff470e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55c1-f5a8-02d6-ec5f051b2ce1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55c1-f5a8-dac7-ddaa40f29cea	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55c1-f5a8-c31e-a60ec500661e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3032 (class 0 OID 11965224)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55c1-f5a9-4973-08126c0906a0	01	Opera	opera
00150000-55c1-f5a9-bca3-9ea6a40f22be	02	Opereta	opereta
00150000-55c1-f5a9-aa4d-d746974956bb	03	Balet	balet
00150000-55c1-f5a9-cbb1-dd7f39dc2949	04	Plesne prireditve	plesne prireditve
00150000-55c1-f5a9-c907-cce36a95fe1a	05	Lutkovno gledališče	lutkovno gledališče
00150000-55c1-f5a9-6068-7cf7f7c55240	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55c1-f5a9-a54c-4ca4893a1383	07	Biografska drama	biografska drama
00150000-55c1-f5a9-6abc-dd3c29a65073	08	Komedija	komedija
00150000-55c1-f5a9-ba64-02e91af1d1a7	09	Črna komedija	črna komedija
00150000-55c1-f5a9-2b5b-c9ca3f37b045	10	E-igra	E-igra
00150000-55c1-f5a9-0fa1-194046aad5ac	11	Kriminalka	kriminalka
00150000-55c1-f5a9-b21b-2daaa11de224	12	Musical	musical
\.


--
-- TOC entry 2537 (class 2606 OID 11964874)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 11965376)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 11965366)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 11965280)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 11965626)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 11965058)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 11965083)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 11965519)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 11965000)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 11965425)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 11965220)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 11965034)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11965077)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 11965014)
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
-- TOC entry 2630 (class 2606 OID 11965130)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 11965602)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 11965609)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2778 (class 2606 OID 11965634)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 11965157)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 11964972)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11964883)
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
-- TOC entry 2544 (class 2606 OID 11964907)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 11964863)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2528 (class 2606 OID 11964848)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 11965163)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 11965196)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 11965314)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 11964936)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 11964960)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 11965136)
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
-- TOC entry 2559 (class 2606 OID 11964950)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 11965021)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 11965148)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 11965482)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 11965490)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 11965473)
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
-- TOC entry 2736 (class 2606 OID 11965501)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 11965180)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11965121)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 11965112)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 11965302)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11965248)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 11964819)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 11965187)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 11964837)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2530 (class 2606 OID 11964857)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 11965205)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 11965143)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 11965092)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 11965543)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 11965531)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 11965525)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 11965261)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 11964916)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 11965103)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 11965291)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 11965513)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 11964985)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 11964832)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 11965345)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 11965043)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 11965171)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 11965583)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 11965567)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 11965591)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 11965239)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 11965072)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 11965327)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 11965232)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 1259 OID 11965065)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2678 (class 1259 OID 11965262)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 11965263)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2764 (class 1259 OID 11965604)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2765 (class 1259 OID 11965603)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2551 (class 1259 OID 11964938)
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
-- TOC entry 2643 (class 1259 OID 11965164)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 11965571)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2752 (class 1259 OID 11965570)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 11965572)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2754 (class 1259 OID 11965569)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2755 (class 1259 OID 11965568)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2637 (class 1259 OID 11965150)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 11965149)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2588 (class 1259 OID 11965044)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 11965221)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 11965223)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2667 (class 1259 OID 11965222)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2576 (class 1259 OID 11965016)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 11965015)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 11965502)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2688 (class 1259 OID 11965316)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 11965317)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2690 (class 1259 OID 11965318)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2761 (class 1259 OID 11965592)
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
-- TOC entry 2697 (class 1259 OID 11965350)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2698 (class 1259 OID 11965347)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2699 (class 1259 OID 11965351)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2700 (class 1259 OID 11965349)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2701 (class 1259 OID 11965348)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2566 (class 1259 OID 11964987)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 11964986)
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
-- TOC entry 2542 (class 1259 OID 11964910)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2653 (class 1259 OID 11965188)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 11965078)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 11964864)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2533 (class 1259 OID 11964865)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2658 (class 1259 OID 11965208)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2659 (class 1259 OID 11965207)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2660 (class 1259 OID 11965206)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2580 (class 1259 OID 11965022)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 11965024)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2582 (class 1259 OID 11965023)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2744 (class 1259 OID 11965533)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2617 (class 1259 OID 11965116)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2618 (class 1259 OID 11965114)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2619 (class 1259 OID 11965113)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2620 (class 1259 OID 11965115)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2523 (class 1259 OID 11964838)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2524 (class 1259 OID 11964839)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2646 (class 1259 OID 11965172)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2774 (class 1259 OID 11965627)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2775 (class 1259 OID 11965635)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2776 (class 1259 OID 11965636)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2632 (class 1259 OID 11965137)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2674 (class 1259 OID 11965249)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2675 (class 1259 OID 11965250)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2718 (class 1259 OID 11965430)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2719 (class 1259 OID 11965429)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2720 (class 1259 OID 11965426)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 11965427)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2722 (class 1259 OID 11965428)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2555 (class 1259 OID 11964952)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2556 (class 1259 OID 11964951)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2557 (class 1259 OID 11964953)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2516 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2726 (class 1259 OID 11965483)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2727 (class 1259 OID 11965484)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2711 (class 1259 OID 11965380)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 11965381)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2713 (class 1259 OID 11965378)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2714 (class 1259 OID 11965379)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2671 (class 1259 OID 11965240)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 11965125)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2624 (class 1259 OID 11965124)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2625 (class 1259 OID 11965122)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2626 (class 1259 OID 11965123)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2707 (class 1259 OID 11965368)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2708 (class 1259 OID 11965367)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2723 (class 1259 OID 11965474)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2587 (class 1259 OID 11965035)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2741 (class 1259 OID 11965520)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2768 (class 1259 OID 11965610)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2769 (class 1259 OID 11965611)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2538 (class 1259 OID 11964885)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2539 (class 1259 OID 11964884)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2547 (class 1259 OID 11964917)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2548 (class 1259 OID 11964918)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 11965106)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 11965105)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2614 (class 1259 OID 11965104)
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
-- TOC entry 2594 (class 1259 OID 11965067)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2595 (class 1259 OID 11965063)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2596 (class 1259 OID 11965060)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2597 (class 1259 OID 11965061)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2598 (class 1259 OID 11965059)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2599 (class 1259 OID 11965064)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2600 (class 1259 OID 11965062)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2554 (class 1259 OID 11964937)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 11965001)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 11965003)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2574 (class 1259 OID 11965002)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2575 (class 1259 OID 11965004)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 11965131)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2693 (class 1259 OID 11965315)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2702 (class 1259 OID 11965346)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11964908)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2546 (class 1259 OID 11964909)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2668 (class 1259 OID 11965233)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 11965544)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 11964973)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2747 (class 1259 OID 11965532)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2651 (class 1259 OID 11965182)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2652 (class 1259 OID 11965181)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2715 (class 1259 OID 11965377)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2497 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 11964961)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 11965328)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2758 (class 1259 OID 11965584)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2732 (class 1259 OID 11965491)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 11965492)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2611 (class 1259 OID 11965093)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 11964858)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2601 (class 1259 OID 11965066)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2804 (class 2606 OID 11965772)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2807 (class 2606 OID 11965757)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2806 (class 2606 OID 11965762)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2802 (class 2606 OID 11965782)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2808 (class 2606 OID 11965752)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2803 (class 2606 OID 11965777)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2805 (class 2606 OID 11965767)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2838 (class 2606 OID 11965927)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 11965932)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2871 (class 2606 OID 11966102)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2872 (class 2606 OID 11966097)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2789 (class 2606 OID 11965687)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2825 (class 2606 OID 11965867)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2866 (class 2606 OID 11966082)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 11966077)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2865 (class 2606 OID 11966087)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2868 (class 2606 OID 11966072)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2869 (class 2606 OID 11966067)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2823 (class 2606 OID 11965862)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2824 (class 2606 OID 11965857)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 11965747)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 11965897)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 11965907)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2832 (class 2606 OID 11965902)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2795 (class 2606 OID 11965722)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 11965717)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 11965847)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 11966052)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 11965937)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 11965942)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 11965947)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2870 (class 2606 OID 11966092)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2843 (class 2606 OID 11965967)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2846 (class 2606 OID 11965952)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2842 (class 2606 OID 11965972)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2844 (class 2606 OID 11965962)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2845 (class 2606 OID 11965957)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 11965712)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 11965707)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2785 (class 2606 OID 11965672)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2786 (class 2606 OID 11965667)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2827 (class 2606 OID 11965877)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2809 (class 2606 OID 11965787)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2782 (class 2606 OID 11965647)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2781 (class 2606 OID 11965652)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2828 (class 2606 OID 11965892)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2829 (class 2606 OID 11965887)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2830 (class 2606 OID 11965882)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2799 (class 2606 OID 11965727)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2797 (class 2606 OID 11965737)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2798 (class 2606 OID 11965732)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2864 (class 2606 OID 11966062)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2813 (class 2606 OID 11965822)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2815 (class 2606 OID 11965812)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2816 (class 2606 OID 11965807)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2814 (class 2606 OID 11965817)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 11965637)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 11965642)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 11965872)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2875 (class 2606 OID 11966117)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 11966122)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2876 (class 2606 OID 11966127)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2822 (class 2606 OID 11965852)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2836 (class 2606 OID 11965917)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2835 (class 2606 OID 11965922)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2853 (class 2606 OID 11966027)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 11966022)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2857 (class 2606 OID 11966007)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2856 (class 2606 OID 11966012)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2855 (class 2606 OID 11966017)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2791 (class 2606 OID 11965697)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 11965692)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 11965702)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2860 (class 2606 OID 11966037)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2859 (class 2606 OID 11966042)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2850 (class 2606 OID 11965997)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 11966002)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2852 (class 2606 OID 11965987)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2851 (class 2606 OID 11965992)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2834 (class 2606 OID 11965912)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 11965842)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2818 (class 2606 OID 11965837)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2820 (class 2606 OID 11965827)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2819 (class 2606 OID 11965832)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2847 (class 2606 OID 11965982)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 11965977)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2858 (class 2606 OID 11966032)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2800 (class 2606 OID 11965742)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2861 (class 2606 OID 11966047)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2863 (class 2606 OID 11966057)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2874 (class 2606 OID 11966107)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2873 (class 2606 OID 11966112)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2783 (class 2606 OID 11965662)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 11965657)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2788 (class 2606 OID 11965677)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 11965682)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 11965802)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 11965797)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2812 (class 2606 OID 11965792)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-05 13:38:19 CEST

--
-- PostgreSQL database dump complete
--

