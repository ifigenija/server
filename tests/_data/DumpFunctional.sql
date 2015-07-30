--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-30 08:54:15 CEST

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
-- TOC entry 183 (class 1259 OID 11065129)
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
-- TOC entry 228 (class 1259 OID 11065628)
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
-- TOC entry 227 (class 1259 OID 11065611)
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
-- TOC entry 221 (class 1259 OID 11065523)
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
-- TOC entry 244 (class 1259 OID 11065844)
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
-- TOC entry 197 (class 1259 OID 11065308)
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
-- TOC entry 200 (class 1259 OID 11065342)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 11065746)
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
-- TOC entry 192 (class 1259 OID 11065251)
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
-- TOC entry 229 (class 1259 OID 11065641)
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
-- TOC entry 216 (class 1259 OID 11065468)
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
-- TOC entry 195 (class 1259 OID 11065288)
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
-- TOC entry 199 (class 1259 OID 11065336)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 11065268)
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
-- TOC entry 205 (class 1259 OID 11065385)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 242 (class 1259 OID 11065825)
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
-- TOC entry 243 (class 1259 OID 11065837)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 11065860)
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
-- TOC entry 209 (class 1259 OID 11065410)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 11065225)
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
-- TOC entry 184 (class 1259 OID 11065138)
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
-- TOC entry 185 (class 1259 OID 11065149)
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
-- TOC entry 180 (class 1259 OID 11065103)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 11065122)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 11065417)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 11065448)
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
-- TOC entry 224 (class 1259 OID 11065562)
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
-- TOC entry 187 (class 1259 OID 11065182)
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
-- TOC entry 189 (class 1259 OID 11065217)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 11065391)
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
-- TOC entry 188 (class 1259 OID 11065202)
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
-- TOC entry 194 (class 1259 OID 11065280)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 11065403)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 11065706)
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
-- TOC entry 232 (class 1259 OID 11065717)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 11065687)
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
-- TOC entry 233 (class 1259 OID 11065725)
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
-- TOC entry 212 (class 1259 OID 11065432)
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
-- TOC entry 204 (class 1259 OID 11065376)
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
-- TOC entry 203 (class 1259 OID 11065366)
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
-- TOC entry 223 (class 1259 OID 11065551)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 11065500)
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
-- TOC entry 177 (class 1259 OID 11065074)
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
-- TOC entry 176 (class 1259 OID 11065072)
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
-- TOC entry 213 (class 1259 OID 11065442)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 11065112)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 11065096)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 11065456)
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
-- TOC entry 207 (class 1259 OID 11065397)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 11065347)
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
-- TOC entry 238 (class 1259 OID 11065766)
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
-- TOC entry 237 (class 1259 OID 11065758)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 11065753)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 11065510)
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
-- TOC entry 186 (class 1259 OID 11065174)
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
-- TOC entry 202 (class 1259 OID 11065353)
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
-- TOC entry 222 (class 1259 OID 11065540)
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
-- TOC entry 234 (class 1259 OID 11065735)
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
-- TOC entry 191 (class 1259 OID 11065237)
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
-- TOC entry 178 (class 1259 OID 11065083)
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
-- TOC entry 226 (class 1259 OID 11065588)
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
-- TOC entry 196 (class 1259 OID 11065299)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 11065424)
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
-- TOC entry 240 (class 1259 OID 11065805)
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
-- TOC entry 239 (class 1259 OID 11065777)
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
-- TOC entry 241 (class 1259 OID 11065817)
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
-- TOC entry 218 (class 1259 OID 11065493)
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
-- TOC entry 198 (class 1259 OID 11065331)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 11065578)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 11065483)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2245 (class 2604 OID 11065077)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2969 (class 0 OID 11065129)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 11065628)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55b9-ca16-84f5-cf6f7ab0b914	000d0000-55b9-ca16-6ee8-51a9b3466063	\N	00090000-55b9-ca16-9f5c-fc005a682507	000b0000-55b9-ca16-3db5-b715f9c4cf2f	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55b9-ca16-372c-3df6b3430163	000d0000-55b9-ca16-3b97-dc0434e38938	00100000-55b9-ca16-49a8-a845044a6aa9	00090000-55b9-ca16-9e65-3dda2d4be6bd	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55b9-ca16-4df1-4b7180c3d112	000d0000-55b9-ca16-31f3-6df0c09069e4	00100000-55b9-ca16-c93c-29b3834ea761	00090000-55b9-ca16-bd31-2baba0115943	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55b9-ca16-9ed6-cf697d993441	000d0000-55b9-ca16-68e1-2920fc0c9a0e	\N	00090000-55b9-ca16-22f0-183fa0dddb05	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55b9-ca16-0457-88ea8d13d776	000d0000-55b9-ca16-7228-cf47cd4d33ab	\N	00090000-55b9-ca16-bb59-4d11efa61e03	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55b9-ca16-4cb9-cf50ca8fa724	000d0000-55b9-ca16-4965-e7e6a4818efd	\N	00090000-55b9-ca16-39a3-dc35f40cb4e9	000b0000-55b9-ca16-49eb-db4c8346c470	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55b9-ca16-d4bb-04e8a00829e1	000d0000-55b9-ca16-3928-ad349fcbd800	00100000-55b9-ca16-28f0-5ac65044313f	00090000-55b9-ca16-602e-be521160712e	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55b9-ca16-4f76-cb48eaa3043f	000d0000-55b9-ca16-1649-aca2d0ca3bf3	\N	00090000-55b9-ca16-1060-f91f980c7cb6	000b0000-55b9-ca16-b314-82967d8f028b	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 3013 (class 0 OID 11065611)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 11065523)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55b9-ca16-127a-d5ff6099c734	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55b9-ca16-b2e5-c9c6aee8aef3	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55b9-ca16-4db9-84373bdc0e40	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3030 (class 0 OID 11065844)
-- Dependencies: 244
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 11065308)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55b9-ca16-f224-884bdc4c315f	\N	\N	00200000-55b9-ca16-185a-bdef2734e407	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55b9-ca16-2ed0-e991d81e7237	\N	\N	00200000-55b9-ca16-d268-36f3d0ebeb97	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55b9-ca16-7972-3042d495b004	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55b9-ca16-32e5-61d478d5e0a8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55b9-ca16-f38d-a6830e82d320	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2986 (class 0 OID 11065342)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 11065746)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 11065251)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55b9-ca14-0ccb-c3cde03eb778	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55b9-ca14-aeee-e548b91a2cc4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55b9-ca14-3e35-c0b5bb904182	AL	ALB	008	Albania 	Albanija	\N
00040000-55b9-ca14-c7a3-6180f1bbce5d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55b9-ca14-e52b-47b678999a5c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55b9-ca14-fec6-2331665c7ef0	AD	AND	020	Andorra 	Andora	\N
00040000-55b9-ca14-18b2-349d2110ed76	AO	AGO	024	Angola 	Angola	\N
00040000-55b9-ca14-97f1-178de5beb35e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55b9-ca14-0fa6-3cf6dc6a5a4c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55b9-ca14-b478-4f76e58327c9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55b9-ca14-d498-3824b20abf08	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55b9-ca14-ced6-fd31a037da26	AM	ARM	051	Armenia 	Armenija	\N
00040000-55b9-ca14-db0c-bc0bc28a721f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55b9-ca14-7e79-a64bc6e8b07a	AU	AUS	036	Australia 	Avstralija	\N
00040000-55b9-ca14-77b6-a31b315cee69	AT	AUT	040	Austria 	Avstrija	\N
00040000-55b9-ca14-a30a-2f27545d50f5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55b9-ca14-405e-3e9623a81f57	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55b9-ca14-8130-35a54d77c0c5	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55b9-ca14-2df1-dd935b219d79	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55b9-ca14-449c-3389821f26c5	BB	BRB	052	Barbados 	Barbados	\N
00040000-55b9-ca14-dfa6-a9be30889735	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55b9-ca14-5478-9ccc54185173	BE	BEL	056	Belgium 	Belgija	\N
00040000-55b9-ca14-227f-b009d1eb9877	BZ	BLZ	084	Belize 	Belize	\N
00040000-55b9-ca14-9c70-b1097e3a440b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55b9-ca14-f057-9fcef0fbc31e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55b9-ca14-be29-b968f970da8e	BT	BTN	064	Bhutan 	Butan	\N
00040000-55b9-ca14-824c-53bf7d88fd6c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55b9-ca14-d3bb-cfd88982fdca	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55b9-ca14-2ba4-ae961a0bd226	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55b9-ca14-7826-ab7909c1846d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55b9-ca14-2528-704a90110d54	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55b9-ca14-5ad3-72d2dffc2d58	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55b9-ca14-8b00-57aa5d268728	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55b9-ca14-3189-72c282b832ba	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55b9-ca14-b354-7b1d18774a95	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55b9-ca14-474c-8269ea3a7875	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55b9-ca14-1557-a830952d8a59	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55b9-ca14-2190-3fe9b92ff3da	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55b9-ca14-efc6-163459e0da20	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55b9-ca14-effe-f94caa9500bd	CA	CAN	124	Canada 	Kanada	\N
00040000-55b9-ca14-eace-56064796fdf9	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55b9-ca14-5470-270add0fd847	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55b9-ca14-60b1-49222c1fb14e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55b9-ca14-8c57-d5b75a81aaee	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55b9-ca14-270a-e3a1a3cd5ad3	CL	CHL	152	Chile 	Čile	\N
00040000-55b9-ca14-af47-4bf92a10e4c4	CN	CHN	156	China 	Kitajska	\N
00040000-55b9-ca14-1d24-078d8f211713	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55b9-ca14-d857-49d8e9c6bbc0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55b9-ca14-5ad6-dc175308720c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55b9-ca14-c2eb-309ad0dd34aa	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55b9-ca14-ef2a-f9c98113ad70	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55b9-ca14-a308-c8f7adb1f6c1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55b9-ca14-c435-95dc021ef30c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55b9-ca14-6f58-a2c582bbd4cb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55b9-ca14-70db-efb88b253e13	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55b9-ca14-53f1-a06a72e9d049	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55b9-ca14-a9b6-07ba4660ddee	CU	CUB	192	Cuba 	Kuba	\N
00040000-55b9-ca14-f3f5-5d3080705d59	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55b9-ca14-a8a3-cae67407fae1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55b9-ca14-3e61-e12d869b1b91	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55b9-ca14-70de-abc6b1c0a504	DK	DNK	208	Denmark 	Danska	\N
00040000-55b9-ca14-f933-6fcb2082bb94	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55b9-ca14-c539-f64f6dcb8440	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55b9-ca14-4291-0a734dc25990	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55b9-ca14-b5f3-db5cb7858866	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55b9-ca14-99be-7060a381f38d	EG	EGY	818	Egypt 	Egipt	\N
00040000-55b9-ca14-1a3a-2999e9d05914	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55b9-ca14-c3dc-b76be65b15bb	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55b9-ca14-eb0e-77d4d19ccd03	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55b9-ca14-b019-9ac35213c35d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55b9-ca14-4638-4c9aeffcf990	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55b9-ca14-de27-cdb70bf65025	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55b9-ca14-fedf-13cd0c35ec41	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55b9-ca14-2b68-45a5eb0fd2bb	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55b9-ca14-3687-431036d21bb8	FI	FIN	246	Finland 	Finska	\N
00040000-55b9-ca14-18fb-862bd6e0ed04	FR	FRA	250	France 	Francija	\N
00040000-55b9-ca14-da2f-fcf153baa0c8	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55b9-ca14-e418-01e81cac44d9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55b9-ca14-b43f-e372c76845c3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55b9-ca14-2ea0-b746221a5265	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55b9-ca14-ad80-06635d9cd17b	GA	GAB	266	Gabon 	Gabon	\N
00040000-55b9-ca14-1b21-bbac3a0aa702	GM	GMB	270	Gambia 	Gambija	\N
00040000-55b9-ca14-d4cc-f5de1dd4c7f1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55b9-ca14-a9aa-03601001617c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55b9-ca14-0ed0-48168c34d413	GH	GHA	288	Ghana 	Gana	\N
00040000-55b9-ca14-496f-f3e615d041ce	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55b9-ca14-69f4-afeb2ddc9b76	GR	GRC	300	Greece 	Grčija	\N
00040000-55b9-ca14-e56a-48c15de880cf	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55b9-ca14-0fa4-f0cd25265f7f	GD	GRD	308	Grenada 	Grenada	\N
00040000-55b9-ca14-83fb-9dc9ad67c2ea	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55b9-ca14-b17a-5aca69aa0b58	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55b9-ca14-0fdc-9aef5d4eb863	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55b9-ca14-11b7-9c04bc6671ca	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55b9-ca14-400f-8b75fd43ef3f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55b9-ca14-eaf8-e7e2b0d91661	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55b9-ca14-383e-512bb387eaae	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55b9-ca14-b216-c3518a388e0d	HT	HTI	332	Haiti 	Haiti	\N
00040000-55b9-ca14-3462-283414429205	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55b9-ca14-7b4d-bc0e6b099aa6	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55b9-ca14-3132-74ca9dc6b925	HN	HND	340	Honduras 	Honduras	\N
00040000-55b9-ca14-5879-2a866466609e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55b9-ca14-3114-a875a798c637	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55b9-ca14-af5f-51ab4e43da5a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55b9-ca14-6fcc-ad6ecdfaa4a2	IN	IND	356	India 	Indija	\N
00040000-55b9-ca14-054f-f5451cfd81e8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55b9-ca14-6b1a-08492025bd72	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55b9-ca14-7fb5-36bf0643876a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55b9-ca14-a1c3-a7a6adcbe906	IE	IRL	372	Ireland 	Irska	\N
00040000-55b9-ca14-6527-5438d2b4fbb7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55b9-ca14-5b32-f905c023303d	IL	ISR	376	Israel 	Izrael	\N
00040000-55b9-ca14-299a-dc39fa9c31b8	IT	ITA	380	Italy 	Italija	\N
00040000-55b9-ca14-616c-dbc84c3f9d23	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55b9-ca14-cf18-9536c6ba1175	JP	JPN	392	Japan 	Japonska	\N
00040000-55b9-ca14-6b9f-24a4d66beab1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55b9-ca14-aad3-45b08b3be3d3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55b9-ca14-570a-156aa1b964fb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55b9-ca14-18d1-53c7a9f0300e	KE	KEN	404	Kenya 	Kenija	\N
00040000-55b9-ca14-55d7-d60d96432841	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55b9-ca14-3524-62c869423660	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55b9-ca14-4534-e1aeaf877d8b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55b9-ca14-3669-2cac00a0db8e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55b9-ca14-a0d6-f7d52fdc61b3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55b9-ca14-80d6-32eabc3ecccf	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55b9-ca14-b20f-98d35328dc92	LV	LVA	428	Latvia 	Latvija	\N
00040000-55b9-ca14-0a54-d9d81480d4c8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55b9-ca14-1229-a21a8e51c971	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55b9-ca14-52b8-f2be65535238	LR	LBR	430	Liberia 	Liberija	\N
00040000-55b9-ca14-46a8-2529d241e0ce	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55b9-ca14-a353-94b66a3daa30	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55b9-ca14-113d-73c42d28ec14	LT	LTU	440	Lithuania 	Litva	\N
00040000-55b9-ca14-d1f7-ad4f818ef5bb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55b9-ca14-9a9b-670635ac6174	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55b9-ca14-e851-a4301bbdd3bc	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55b9-ca14-cd7f-a0ddb6b3b4b8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55b9-ca14-bc6d-7605a846bfa3	MW	MWI	454	Malawi 	Malavi	\N
00040000-55b9-ca14-d1cc-2f8ed6b465a3	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55b9-ca14-76bc-696c2b8c3c70	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55b9-ca14-4785-9a5ad249b5e3	ML	MLI	466	Mali 	Mali	\N
00040000-55b9-ca14-d60a-9ede59e55928	MT	MLT	470	Malta 	Malta	\N
00040000-55b9-ca14-ca11-a916798ca869	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55b9-ca14-36ee-997a41f00411	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55b9-ca14-7647-a6999e809081	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55b9-ca14-df4a-39d18d4b8c18	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55b9-ca14-fe97-e2a771392386	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55b9-ca14-0b1a-cf9607cdbed3	MX	MEX	484	Mexico 	Mehika	\N
00040000-55b9-ca14-044f-aa9583b97b71	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55b9-ca14-9305-0cfa9d340010	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55b9-ca14-e4b0-eec3a65f28b8	MC	MCO	492	Monaco 	Monako	\N
00040000-55b9-ca14-ec0f-704bf96f40a7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55b9-ca14-3ab2-7f6945a98197	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55b9-ca14-d641-9da13df222a9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55b9-ca14-74d3-b0f614f73d40	MA	MAR	504	Morocco 	Maroko	\N
00040000-55b9-ca14-e2f8-cc5b16f6440b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55b9-ca14-6ef4-2570cacd1979	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55b9-ca14-10da-812c446c0ac4	NA	NAM	516	Namibia 	Namibija	\N
00040000-55b9-ca14-a15a-fcc879ceb149	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55b9-ca14-ad3d-6c32dc3f23a6	NP	NPL	524	Nepal 	Nepal	\N
00040000-55b9-ca14-fd2e-da996f5aa0ef	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55b9-ca14-f057-de8cb0865e8e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55b9-ca14-0ee5-419cb270261b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55b9-ca14-76cf-9d2160102563	NE	NER	562	Niger 	Niger 	\N
00040000-55b9-ca14-f814-7a1e9f1b14ae	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55b9-ca14-bdeb-d7a69f07b360	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55b9-ca14-7e08-64ffa6279f18	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55b9-ca14-0bea-8c2cba985ba8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55b9-ca14-de73-6aa8f9219055	NO	NOR	578	Norway 	Norveška	\N
00040000-55b9-ca14-d439-52c6d45a4b76	OM	OMN	512	Oman 	Oman	\N
00040000-55b9-ca14-c456-0c21e85c8fb0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55b9-ca14-cd24-d1b2126aa551	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55b9-ca14-fd66-ef4270dbd658	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55b9-ca14-5ef5-85c630abe458	PA	PAN	591	Panama 	Panama	\N
00040000-55b9-ca14-8a76-6f7f7cbd4a36	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55b9-ca14-01b9-613cdf0bfd67	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55b9-ca14-f969-9e82e7127b88	PE	PER	604	Peru 	Peru	\N
00040000-55b9-ca14-21cd-8e118217729c	PH	PHL	608	Philippines 	Filipini	\N
00040000-55b9-ca14-011e-1beeabe7378a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55b9-ca14-3f08-83883cdafac1	PL	POL	616	Poland 	Poljska	\N
00040000-55b9-ca14-9787-a09fc1f2dab5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55b9-ca14-78fb-6f6503aba00f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55b9-ca14-e9fb-f5ab8f1a46a9	QA	QAT	634	Qatar 	Katar	\N
00040000-55b9-ca14-4080-242141a500cb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55b9-ca14-db77-ea9a3dded911	RO	ROU	642	Romania 	Romunija	\N
00040000-55b9-ca14-d4b5-4da030c1f101	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55b9-ca14-beb3-d828240f8317	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55b9-ca14-167d-7f2dba4b65e3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55b9-ca14-cdaa-bca581fcb3c0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55b9-ca14-1e69-e9f524973a10	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55b9-ca14-bb4c-a0a171f67c67	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55b9-ca14-4603-d58e8f9d8cda	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55b9-ca14-1126-5d45ad07c79a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55b9-ca14-4ff4-09bddfe10a5f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55b9-ca14-21bc-b0c38da6786f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55b9-ca14-89ab-2d1443c691c3	SM	SMR	674	San Marino 	San Marino	\N
00040000-55b9-ca14-fcdc-bf502b41fc09	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55b9-ca14-6093-a7c6557f0497	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55b9-ca14-463f-b3d7370acb43	SN	SEN	686	Senegal 	Senegal	\N
00040000-55b9-ca14-dad3-7946c4ea85ef	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55b9-ca14-910e-e7d3ce82c78e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55b9-ca14-dd22-5d9ae0979416	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55b9-ca14-5713-03b54a36bd47	SG	SGP	702	Singapore 	Singapur	\N
00040000-55b9-ca14-38cd-5240e78978da	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55b9-ca14-39f8-e33d5f35aa3c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55b9-ca14-f0f9-fa20bd85b98e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55b9-ca14-8a58-3e2dcc4b0f95	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55b9-ca14-fefb-d134f4e1c90c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55b9-ca14-6200-f32f3ccdfe1a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55b9-ca14-ba93-32cc4b7c8c12	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55b9-ca14-d978-037569953d3c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55b9-ca14-add4-d69c29d4a7fd	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55b9-ca14-d45b-0ac669103dd4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55b9-ca14-d8e9-89b3db708626	SD	SDN	729	Sudan 	Sudan	\N
00040000-55b9-ca14-9100-4325d7eb9cc7	SR	SUR	740	Suriname 	Surinam	\N
00040000-55b9-ca14-1eb0-60e69e106906	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55b9-ca14-00f1-25e34fd8f8cc	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55b9-ca14-3122-2329edccad7e	SE	SWE	752	Sweden 	Švedska	\N
00040000-55b9-ca14-0175-c43ab3d77fbd	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55b9-ca14-0e40-772cbadb7e24	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55b9-ca14-4339-a23af09216f7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55b9-ca14-89a6-757a64fc9924	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55b9-ca14-d9d1-fd6ad9da1324	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55b9-ca14-7059-c5e79a7f1d04	TH	THA	764	Thailand 	Tajska	\N
00040000-55b9-ca14-3b98-2229d35fa53b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55b9-ca14-be76-a52ead1ae790	TG	TGO	768	Togo 	Togo	\N
00040000-55b9-ca14-7583-728c1ce7cd3a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55b9-ca14-cd1c-163da19d1ed8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55b9-ca14-bc75-6a3018740bff	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55b9-ca14-ee8a-8b733ebcccee	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55b9-ca14-0b79-66b44f096d16	TR	TUR	792	Turkey 	Turčija	\N
00040000-55b9-ca14-6843-0fbd988b3faf	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55b9-ca14-5ce0-e110a99933f5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55b9-ca14-354b-afe524bf6c48	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55b9-ca14-decc-9b1bea1d9222	UG	UGA	800	Uganda 	Uganda	\N
00040000-55b9-ca14-aeb2-612d072846ab	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55b9-ca14-08b8-673f591bfb95	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55b9-ca14-d823-52cc5c7e501b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55b9-ca14-dbd6-c3d57239925c	US	USA	840	United States 	Združene države Amerike	\N
00040000-55b9-ca14-6b80-e9fb5d632aa4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55b9-ca14-3f58-4062f8e0e6fa	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55b9-ca14-bee5-9ff36c001f33	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55b9-ca14-2361-c4b86e85f2eb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55b9-ca14-62a2-1a5372b82522	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55b9-ca14-5640-af840f7bd13c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55b9-ca14-7524-92f96f3138e9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55b9-ca14-4f93-e507a0d4dd1f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55b9-ca14-c463-9ec0df041c17	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55b9-ca14-6609-b946b7231872	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55b9-ca14-df1e-5931bde906ee	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55b9-ca14-8b12-d686eeca45cd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55b9-ca14-08de-9debd52ff11b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3015 (class 0 OID 11065641)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55b9-ca16-a6b5-336436b5d61a	000e0000-55b9-ca16-6e81-bc596599d196	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55b9-ca15-f702-0f773b3ea40a	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55b9-ca16-75dd-f5340f799e22	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55b9-ca15-3e62-bc17ea46b02c	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55b9-ca16-aabc-932c4dedce2f	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55b9-ca16-566a-a2b399e13703	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3002 (class 0 OID 11065468)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55b9-ca16-3928-ad349fcbd800	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55b9-ca15-2b2d-88674dfe2320
000d0000-55b9-ca16-6ee8-51a9b3466063	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55b9-ca15-2b2d-88674dfe2320
000d0000-55b9-ca16-3b97-dc0434e38938	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55b9-ca15-68a7-daf0e016da8f
000d0000-55b9-ca16-31f3-6df0c09069e4	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55b9-ca15-5e60-908b5c11b981
000d0000-55b9-ca16-68e1-2920fc0c9a0e	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55b9-ca15-dc41-80e19dfd5e2b
000d0000-55b9-ca16-7228-cf47cd4d33ab	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55b9-ca15-8148-28b0584fb338
000d0000-55b9-ca16-4965-e7e6a4818efd	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55b9-ca15-2b2d-88674dfe2320
000d0000-55b9-ca16-1649-aca2d0ca3bf3	000e0000-55b9-ca16-5f05-e3ce647073f5	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55b9-ca15-b18b-80751dd880e8
\.


--
-- TOC entry 2981 (class 0 OID 11065288)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 11065336)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 11065268)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55b9-ca16-6026-d78f2dd4ae11	00080000-55b9-ca16-14ab-81d30947d127	00090000-55b9-ca16-8cc9-eb338ab4cb09	AK		
\.


--
-- TOC entry 2956 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 11065385)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 11065825)
-- Dependencies: 242
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 11065837)
-- Dependencies: 243
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 11065860)
-- Dependencies: 245
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 11065410)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 11065225)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55b9-ca14-7599-fe1867b07055	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55b9-ca14-3172-21d264beb75c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55b9-ca14-2ac2-8897cd425964	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55b9-ca14-a57e-92f5026f88f1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55b9-ca14-6850-64afaf9888f1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55b9-ca14-0474-80c013211b2f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55b9-ca14-1457-d1d0948e8624	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55b9-ca14-e926-0f861dca8e44	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55b9-ca14-42d4-ddd9b3ae83c2	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55b9-ca14-efba-bcab7aea3367	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55b9-ca14-c1db-9318a1d22286	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55b9-ca14-48e7-3f523e0935ea	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55b9-ca14-7061-5db81e9a7028	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55b9-ca14-b6ec-2294f71831bc	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55b9-ca16-3498-fa438e5518fe	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55b9-ca16-316f-90680640bf8d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55b9-ca16-bdcc-999905790131	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55b9-ca16-93c6-3bf7f0b6e49e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55b9-ca16-6c29-7b6f861da979	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55b9-ca16-d9df-7f6c93688f6c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2970 (class 0 OID 11065138)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55b9-ca16-3980-bf218f787d3d	00000000-55b9-ca16-316f-90680640bf8d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55b9-ca16-2b92-da19d680c748	00000000-55b9-ca16-316f-90680640bf8d	00010000-55b9-ca14-8422-b4d929463fd7	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55b9-ca16-e014-685320aa76f6	00000000-55b9-ca16-bdcc-999905790131	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2971 (class 0 OID 11065149)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55b9-ca16-9f5c-fc005a682507	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55b9-ca16-22f0-183fa0dddb05	00010000-55b9-ca16-35ef-48e581e46844	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55b9-ca16-bd31-2baba0115943	00010000-55b9-ca16-a6ac-cb8f01331d9e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55b9-ca16-2de5-7f97a1fc962b	00010000-55b9-ca16-3810-e89565d5d7fd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55b9-ca16-beae-b0c28bc301bf	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55b9-ca16-39a3-dc35f40cb4e9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55b9-ca16-a96d-b52fb75b0648	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55b9-ca16-602e-be521160712e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55b9-ca16-8cc9-eb338ab4cb09	00010000-55b9-ca16-5e99-c2cb00274211	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55b9-ca16-9e65-3dda2d4be6bd	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55b9-ca16-b76c-c934313e9df6	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55b9-ca16-bb59-4d11efa61e03	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55b9-ca16-1060-f91f980c7cb6	00010000-55b9-ca16-85ce-649a0a8d0526	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2958 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 11065103)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55b9-ca14-3c36-65455f980aac	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55b9-ca14-c5aa-2ebc345f1357	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55b9-ca14-5b93-7dcfd775802c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55b9-ca14-ffd4-91d7271b8194	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55b9-ca14-5eaa-f0934bce5ee4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55b9-ca14-7d13-15336202be9c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55b9-ca14-eb0f-add59172c6d9	Abonma-read	Abonma - branje	f
00030000-55b9-ca14-85cc-c356fb2c05a1	Abonma-write	Abonma - spreminjanje	f
00030000-55b9-ca14-c65b-fa61cf7fe663	Alternacija-read	Alternacija - branje	f
00030000-55b9-ca14-6a63-314625ea5930	Alternacija-write	Alternacija - spreminjanje	f
00030000-55b9-ca14-7064-818b5cdfb6a0	Arhivalija-read	Arhivalija - branje	f
00030000-55b9-ca14-77ac-635549dd017a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55b9-ca14-e8fa-b320c70b877a	Besedilo-read	Besedilo - branje	f
00030000-55b9-ca14-a322-a798b5ba091e	Besedilo-write	Besedilo - spreminjanje	f
00030000-55b9-ca14-73ab-f4370e52cadd	DogodekIzven-read	DogodekIzven - branje	f
00030000-55b9-ca14-5057-22e77a992ba7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55b9-ca14-a92d-3fb2e86d8e7a	Dogodek-read	Dogodek - branje	f
00030000-55b9-ca14-01ab-da19612fa3b8	Dogodek-write	Dogodek - spreminjanje	f
00030000-55b9-ca14-f73d-44f86ff7cdee	DrugiVir-read	DrugiVir - branje	f
00030000-55b9-ca14-10c3-b42c2d7743bd	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55b9-ca14-5a94-5e3c5950dd33	Drzava-read	Drzava - branje	f
00030000-55b9-ca14-f674-2aba2a4909d7	Drzava-write	Drzava - spreminjanje	f
00030000-55b9-ca14-26b1-a411ff4da8a1	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55b9-ca14-8ef2-a238fc0b1fc1	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55b9-ca14-3364-6ce8fccdea21	Funkcija-read	Funkcija - branje	f
00030000-55b9-ca14-d24a-c07de3ddab26	Funkcija-write	Funkcija - spreminjanje	f
00030000-55b9-ca14-37aa-5f2c8736ba93	Gostovanje-read	Gostovanje - branje	f
00030000-55b9-ca14-003b-1f963bc03ec1	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55b9-ca14-51d2-c369afe5b9a0	Gostujoca-read	Gostujoca - branje	f
00030000-55b9-ca14-0905-007880521d37	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55b9-ca14-4a4b-3ce9a9d2cafe	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55b9-ca14-b520-dfb240080b3d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55b9-ca14-e259-10b2512172de	Kupec-read	Kupec - branje	f
00030000-55b9-ca14-30ca-ba69c68823a3	Kupec-write	Kupec - spreminjanje	f
00030000-55b9-ca14-053d-5b0e0d8064ff	NacinPlacina-read	NacinPlacina - branje	f
00030000-55b9-ca14-15ab-aaf1a5178eb4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55b9-ca14-f99c-fdf91bb62677	Option-read	Option - branje	f
00030000-55b9-ca14-2d55-67066886ab50	Option-write	Option - spreminjanje	f
00030000-55b9-ca14-dfc6-0ee49033bab1	OptionValue-read	OptionValue - branje	f
00030000-55b9-ca14-a7a9-b8199567100c	OptionValue-write	OptionValue - spreminjanje	f
00030000-55b9-ca14-6af5-09e65d9144d1	Oseba-read	Oseba - branje	f
00030000-55b9-ca14-08c9-5bb9b3019c56	Oseba-write	Oseba - spreminjanje	f
00030000-55b9-ca14-77e1-75221205f1e1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55b9-ca14-d41a-71eda1bf5e5d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55b9-ca14-087b-60e7c4d1a6ea	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55b9-ca14-a6ec-357705f90c9a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55b9-ca14-bdb7-a7e8a8d54d23	Pogodba-read	Pogodba - branje	f
00030000-55b9-ca14-506f-cf54e1765752	Pogodba-write	Pogodba - spreminjanje	f
00030000-55b9-ca14-6578-6e3fded72afe	Popa-read	Popa - branje	f
00030000-55b9-ca14-32b1-0e08eea7636b	Popa-write	Popa - spreminjanje	f
00030000-55b9-ca14-4256-d959e9619a91	Posta-read	Posta - branje	f
00030000-55b9-ca14-4921-6ef73a6c2f7a	Posta-write	Posta - spreminjanje	f
00030000-55b9-ca14-500c-84fa72139c8d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55b9-ca14-5892-673b83c7b216	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55b9-ca14-00b5-90f8164ebba1	PostniNaslov-read	PostniNaslov - branje	f
00030000-55b9-ca14-9c18-cf48864a39fa	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55b9-ca14-9566-ef768a89873d	Predstava-read	Predstava - branje	f
00030000-55b9-ca14-8135-8137ac7709c9	Predstava-write	Predstava - spreminjanje	f
00030000-55b9-ca14-b334-a4c0fe63bd7f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55b9-ca14-dcb4-9b27bdd54485	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55b9-ca14-d95e-0bd6e7e0b6a0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55b9-ca14-8ba6-0bf1a76892ce	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55b9-ca14-7d33-03ec3a4393ea	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55b9-ca14-b81d-cc7ff8d1fb97	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55b9-ca14-ad0c-9d133160b5c0	ProgramDela-read	ProgramDela - branje	f
00030000-55b9-ca14-7e20-49bd1e392b1e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55b9-ca14-2f4a-c42b8d18457d	ProgramFestival-read	ProgramFestival - branje	f
00030000-55b9-ca14-8bbe-2ea43114093d	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55b9-ca14-8835-ac6bd02616ad	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55b9-ca14-af64-8d32858dee7d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55b9-ca14-1306-e31b8a9d13f5	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55b9-ca14-b7c7-20e5c3f7bda2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55b9-ca14-3010-4ce7a2aac60b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55b9-ca14-a074-f58723784283	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55b9-ca14-cead-70060f806987	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55b9-ca14-587c-18698a03f198	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55b9-ca14-0701-d1cfa11210df	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55b9-ca14-1e85-b1099d975598	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55b9-ca14-22ce-c9eb0543bb89	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55b9-ca14-31ad-7dfe1f0d0e55	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55b9-ca14-dc43-b545c08b450a	ProgramRazno-read	ProgramRazno - branje	f
00030000-55b9-ca14-e0e0-d7b73981c343	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55b9-ca14-c551-62eae6bd4f1b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55b9-ca14-8d57-e57a38b67fe8	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55b9-ca14-593c-591c5d34ec8d	Prostor-read	Prostor - branje	f
00030000-55b9-ca14-31c3-c639040f07fd	Prostor-write	Prostor - spreminjanje	f
00030000-55b9-ca14-0919-19ae1fa14d5f	Racun-read	Racun - branje	f
00030000-55b9-ca14-5256-0d20a5bc2eab	Racun-write	Racun - spreminjanje	f
00030000-55b9-ca14-7af4-e148ce58573d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55b9-ca14-1db8-f0d43d7d40ef	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55b9-ca14-18d1-c1fccb59680d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55b9-ca14-538a-480ec8e9da7a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55b9-ca14-6490-1b1b8f75cba7	Rekvizit-read	Rekvizit - branje	f
00030000-55b9-ca14-2257-bb6d403deb90	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55b9-ca14-140e-99b8481859c3	Revizija-read	Revizija - branje	f
00030000-55b9-ca14-cf03-cac590c29de8	Revizija-write	Revizija - spreminjanje	f
00030000-55b9-ca14-3285-04521b070889	Rezervacija-read	Rezervacija - branje	f
00030000-55b9-ca14-21e2-e62a8e1f9413	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55b9-ca14-6352-0076f515a1be	SedezniRed-read	SedezniRed - branje	f
00030000-55b9-ca14-6689-4018ceaad6a3	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55b9-ca14-b5a0-6b1d60299b96	Sedez-read	Sedez - branje	f
00030000-55b9-ca14-dd4b-77d2f4135fe8	Sedez-write	Sedez - spreminjanje	f
00030000-55b9-ca14-1eb8-21b560011080	Sezona-read	Sezona - branje	f
00030000-55b9-ca14-a865-1791f66af585	Sezona-write	Sezona - spreminjanje	f
00030000-55b9-ca14-60be-0028b1977241	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55b9-ca14-bc51-55975f1cd7dd	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55b9-ca14-d875-b2acf2961465	Stevilcenje-read	Stevilcenje - branje	f
00030000-55b9-ca14-cbad-625bdd89b727	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55b9-ca14-e9fc-9535495ab27a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55b9-ca14-bdc5-be98d996a0fe	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55b9-ca14-b9e3-46f37b3caeb6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55b9-ca14-9eea-20f4bb188d66	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55b9-ca14-c2d2-9dcf54daaeb9	Telefonska-read	Telefonska - branje	f
00030000-55b9-ca14-5cd3-adb441134048	Telefonska-write	Telefonska - spreminjanje	f
00030000-55b9-ca14-2456-66ceb72a7720	TerminStoritve-read	TerminStoritve - branje	f
00030000-55b9-ca14-d55c-cddcbb2461a7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55b9-ca14-ea2a-2063a1dc4ad2	TipFunkcije-read	TipFunkcije - branje	f
00030000-55b9-ca14-e037-39325d6173a1	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55b9-ca14-3e10-af4f4bc47be3	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55b9-ca14-1dd3-79fe046e2067	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55b9-ca14-3e07-ecca2d4aebab	Trr-read	Trr - branje	f
00030000-55b9-ca14-546c-51566322416d	Trr-write	Trr - spreminjanje	f
00030000-55b9-ca14-9edf-504189db243a	Uprizoritev-read	Uprizoritev - branje	f
00030000-55b9-ca14-9691-947e9ce943f6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55b9-ca14-a2ff-e09b4f970d76	Vaja-read	Vaja - branje	f
00030000-55b9-ca14-37dd-725bddb9aed2	Vaja-write	Vaja - spreminjanje	f
00030000-55b9-ca14-33a4-979c7b4ec9ee	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55b9-ca14-844e-4a528348d322	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55b9-ca14-9a4b-3a68937f38ac	Zaposlitev-read	Zaposlitev - branje	f
00030000-55b9-ca14-171c-2eab029724b9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55b9-ca14-914f-68f6e3535a0d	Zasedenost-read	Zasedenost - branje	f
00030000-55b9-ca14-2487-9984030c8513	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55b9-ca14-8bd4-b9c06810e4a3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55b9-ca14-5318-fedd1148a81e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55b9-ca14-ccf7-09d842e5a0e2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55b9-ca14-dfc8-9905d047ba45	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55b9-ca14-c269-509f50708a2d	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55b9-ca14-2afc-896987a54f00	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55b9-ca14-aac4-df90ecd17269	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55b9-ca14-3e84-0428df6ec5c2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55b9-ca14-729a-f5408d3b9be0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55b9-ca14-8f58-3217cc1f7835	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55b9-ca14-9a22-d77234982545	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55b9-ca14-d5ae-dee1e1f0b4eb	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55b9-ca14-fdf1-77e3cd235a32	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55b9-ca14-5d56-3e261e64c67f	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55b9-ca14-b04f-32d80b928283	Datoteka-write	Datoteka - spreminjanje	f
00030000-55b9-ca14-7646-7918468ca22f	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2968 (class 0 OID 11065122)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55b9-ca14-f4a7-1a02e848ca9e	00030000-55b9-ca14-c5aa-2ebc345f1357
00020000-55b9-ca14-5c04-8bf8804683fc	00030000-55b9-ca14-5a94-5e3c5950dd33
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-eb0f-add59172c6d9
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-85cc-c356fb2c05a1
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-c65b-fa61cf7fe663
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-6a63-314625ea5930
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-7064-818b5cdfb6a0
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-a92d-3fb2e86d8e7a
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-ffd4-91d7271b8194
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-01ab-da19612fa3b8
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-5a94-5e3c5950dd33
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-f674-2aba2a4909d7
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-3364-6ce8fccdea21
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-d24a-c07de3ddab26
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-37aa-5f2c8736ba93
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-003b-1f963bc03ec1
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-51d2-c369afe5b9a0
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-0905-007880521d37
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-4a4b-3ce9a9d2cafe
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-b520-dfb240080b3d
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-f99c-fdf91bb62677
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-dfc6-0ee49033bab1
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-6af5-09e65d9144d1
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-08c9-5bb9b3019c56
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-6578-6e3fded72afe
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-32b1-0e08eea7636b
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-4256-d959e9619a91
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-4921-6ef73a6c2f7a
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-00b5-90f8164ebba1
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-9c18-cf48864a39fa
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-9566-ef768a89873d
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-8135-8137ac7709c9
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-7d33-03ec3a4393ea
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-b81d-cc7ff8d1fb97
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-593c-591c5d34ec8d
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-31c3-c639040f07fd
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-18d1-c1fccb59680d
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-538a-480ec8e9da7a
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-6490-1b1b8f75cba7
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-2257-bb6d403deb90
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-1eb8-21b560011080
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-a865-1791f66af585
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-ea2a-2063a1dc4ad2
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-9edf-504189db243a
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-9691-947e9ce943f6
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-a2ff-e09b4f970d76
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-37dd-725bddb9aed2
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-914f-68f6e3535a0d
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-2487-9984030c8513
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-8bd4-b9c06810e4a3
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	00030000-55b9-ca14-ccf7-09d842e5a0e2
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-eb0f-add59172c6d9
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-7064-818b5cdfb6a0
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-a92d-3fb2e86d8e7a
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-5a94-5e3c5950dd33
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-37aa-5f2c8736ba93
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-51d2-c369afe5b9a0
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-4a4b-3ce9a9d2cafe
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-b520-dfb240080b3d
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-f99c-fdf91bb62677
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-dfc6-0ee49033bab1
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-6af5-09e65d9144d1
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-08c9-5bb9b3019c56
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-6578-6e3fded72afe
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-4256-d959e9619a91
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-00b5-90f8164ebba1
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-9c18-cf48864a39fa
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-9566-ef768a89873d
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-593c-591c5d34ec8d
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-18d1-c1fccb59680d
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-6490-1b1b8f75cba7
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-1eb8-21b560011080
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-c2d2-9dcf54daaeb9
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-5cd3-adb441134048
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-3e07-ecca2d4aebab
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-546c-51566322416d
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-9a4b-3a68937f38ac
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-171c-2eab029724b9
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-8bd4-b9c06810e4a3
00020000-55b9-ca14-d6ad-72d37a336b23	00030000-55b9-ca14-ccf7-09d842e5a0e2
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-eb0f-add59172c6d9
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-c65b-fa61cf7fe663
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-7064-818b5cdfb6a0
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-77ac-635549dd017a
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-e8fa-b320c70b877a
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-73ab-f4370e52cadd
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-a92d-3fb2e86d8e7a
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-5a94-5e3c5950dd33
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-3364-6ce8fccdea21
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-37aa-5f2c8736ba93
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-51d2-c369afe5b9a0
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-4a4b-3ce9a9d2cafe
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-f99c-fdf91bb62677
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-dfc6-0ee49033bab1
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-6af5-09e65d9144d1
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-6578-6e3fded72afe
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-4256-d959e9619a91
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-9566-ef768a89873d
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-7d33-03ec3a4393ea
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-593c-591c5d34ec8d
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-18d1-c1fccb59680d
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-6490-1b1b8f75cba7
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-1eb8-21b560011080
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-ea2a-2063a1dc4ad2
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-a2ff-e09b4f970d76
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-914f-68f6e3535a0d
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-8bd4-b9c06810e4a3
00020000-55b9-ca14-9550-9e7be733042e	00030000-55b9-ca14-ccf7-09d842e5a0e2
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-eb0f-add59172c6d9
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-85cc-c356fb2c05a1
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-6a63-314625ea5930
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-7064-818b5cdfb6a0
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-a92d-3fb2e86d8e7a
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-5a94-5e3c5950dd33
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-37aa-5f2c8736ba93
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-51d2-c369afe5b9a0
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-f99c-fdf91bb62677
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-dfc6-0ee49033bab1
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-6578-6e3fded72afe
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-4256-d959e9619a91
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-9566-ef768a89873d
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-593c-591c5d34ec8d
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-18d1-c1fccb59680d
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-6490-1b1b8f75cba7
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-1eb8-21b560011080
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-ea2a-2063a1dc4ad2
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-8bd4-b9c06810e4a3
00020000-55b9-ca14-051b-84b85ac99860	00030000-55b9-ca14-ccf7-09d842e5a0e2
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-eb0f-add59172c6d9
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-7064-818b5cdfb6a0
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-a92d-3fb2e86d8e7a
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-5a94-5e3c5950dd33
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-37aa-5f2c8736ba93
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-51d2-c369afe5b9a0
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-f99c-fdf91bb62677
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-dfc6-0ee49033bab1
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-6578-6e3fded72afe
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-4256-d959e9619a91
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-9566-ef768a89873d
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-593c-591c5d34ec8d
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-18d1-c1fccb59680d
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-6490-1b1b8f75cba7
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-1eb8-21b560011080
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-2456-66ceb72a7720
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-5b93-7dcfd775802c
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-ea2a-2063a1dc4ad2
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-8bd4-b9c06810e4a3
00020000-55b9-ca14-e9e6-6c10afb67e9d	00030000-55b9-ca14-ccf7-09d842e5a0e2
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-3c36-65455f980aac
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-c5aa-2ebc345f1357
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-5b93-7dcfd775802c
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-ffd4-91d7271b8194
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-5eaa-f0934bce5ee4
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-7d13-15336202be9c
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-eb0f-add59172c6d9
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-85cc-c356fb2c05a1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-c65b-fa61cf7fe663
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-6a63-314625ea5930
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-7064-818b5cdfb6a0
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-77ac-635549dd017a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-e8fa-b320c70b877a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-a322-a798b5ba091e
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-73ab-f4370e52cadd
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-5057-22e77a992ba7
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-a92d-3fb2e86d8e7a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-01ab-da19612fa3b8
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-5a94-5e3c5950dd33
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-f674-2aba2a4909d7
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-f73d-44f86ff7cdee
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-10c3-b42c2d7743bd
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-26b1-a411ff4da8a1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-8ef2-a238fc0b1fc1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-3364-6ce8fccdea21
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-d24a-c07de3ddab26
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-37aa-5f2c8736ba93
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-003b-1f963bc03ec1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-51d2-c369afe5b9a0
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-0905-007880521d37
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-4a4b-3ce9a9d2cafe
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-b520-dfb240080b3d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-e259-10b2512172de
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-30ca-ba69c68823a3
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-053d-5b0e0d8064ff
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-15ab-aaf1a5178eb4
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-f99c-fdf91bb62677
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-2d55-67066886ab50
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-dfc6-0ee49033bab1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-a7a9-b8199567100c
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-6af5-09e65d9144d1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-08c9-5bb9b3019c56
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-77e1-75221205f1e1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-d41a-71eda1bf5e5d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-087b-60e7c4d1a6ea
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-a6ec-357705f90c9a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-bdb7-a7e8a8d54d23
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-506f-cf54e1765752
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-6578-6e3fded72afe
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-32b1-0e08eea7636b
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-4256-d959e9619a91
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-4921-6ef73a6c2f7a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-500c-84fa72139c8d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-5892-673b83c7b216
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-00b5-90f8164ebba1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-9c18-cf48864a39fa
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-9566-ef768a89873d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-8135-8137ac7709c9
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-b334-a4c0fe63bd7f
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-dcb4-9b27bdd54485
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-d95e-0bd6e7e0b6a0
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-8ba6-0bf1a76892ce
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-7d33-03ec3a4393ea
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-b81d-cc7ff8d1fb97
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-ad0c-9d133160b5c0
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-7e20-49bd1e392b1e
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-2f4a-c42b8d18457d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-8bbe-2ea43114093d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-8835-ac6bd02616ad
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-af64-8d32858dee7d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-1306-e31b8a9d13f5
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-b7c7-20e5c3f7bda2
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-3010-4ce7a2aac60b
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-a074-f58723784283
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-cead-70060f806987
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-587c-18698a03f198
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-0701-d1cfa11210df
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-1e85-b1099d975598
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-22ce-c9eb0543bb89
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-31ad-7dfe1f0d0e55
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-dc43-b545c08b450a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-e0e0-d7b73981c343
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-c551-62eae6bd4f1b
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-8d57-e57a38b67fe8
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-593c-591c5d34ec8d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-31c3-c639040f07fd
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-0919-19ae1fa14d5f
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-5256-0d20a5bc2eab
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-7af4-e148ce58573d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-1db8-f0d43d7d40ef
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-18d1-c1fccb59680d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-538a-480ec8e9da7a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-6490-1b1b8f75cba7
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-2257-bb6d403deb90
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-140e-99b8481859c3
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-cf03-cac590c29de8
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-3285-04521b070889
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-21e2-e62a8e1f9413
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-6352-0076f515a1be
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-6689-4018ceaad6a3
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-b5a0-6b1d60299b96
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-dd4b-77d2f4135fe8
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-1eb8-21b560011080
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-a865-1791f66af585
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-60be-0028b1977241
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-bc51-55975f1cd7dd
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-d875-b2acf2961465
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-cbad-625bdd89b727
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-e9fc-9535495ab27a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-bdc5-be98d996a0fe
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-b9e3-46f37b3caeb6
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-9eea-20f4bb188d66
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-c2d2-9dcf54daaeb9
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-5cd3-adb441134048
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-2456-66ceb72a7720
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-d55c-cddcbb2461a7
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-ea2a-2063a1dc4ad2
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-e037-39325d6173a1
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-3e10-af4f4bc47be3
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-1dd3-79fe046e2067
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-3e07-ecca2d4aebab
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-546c-51566322416d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-9edf-504189db243a
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-9691-947e9ce943f6
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-a2ff-e09b4f970d76
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-37dd-725bddb9aed2
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-33a4-979c7b4ec9ee
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-844e-4a528348d322
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-9a4b-3a68937f38ac
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-171c-2eab029724b9
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-914f-68f6e3535a0d
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-2487-9984030c8513
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-8bd4-b9c06810e4a3
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-5318-fedd1148a81e
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-ccf7-09d842e5a0e2
00020000-55b9-ca16-a9bd-06f3cc634db2	00030000-55b9-ca14-dfc8-9905d047ba45
\.


--
-- TOC entry 2996 (class 0 OID 11065417)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 11065448)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 11065562)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55b9-ca16-3db5-b715f9c4cf2f	00090000-55b9-ca16-9f5c-fc005a682507	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55b9-ca16-49eb-db4c8346c470	00090000-55b9-ca16-39a3-dc35f40cb4e9	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55b9-ca16-b314-82967d8f028b	00090000-55b9-ca16-1060-f91f980c7cb6	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2973 (class 0 OID 11065182)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55b9-ca16-14ab-81d30947d127	00040000-55b9-ca14-f0f9-fa20bd85b98e	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b9-ca16-e8a8-af430d2ed96e	00040000-55b9-ca14-f0f9-fa20bd85b98e	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55b9-ca16-9ca9-b6a01f5d8184	00040000-55b9-ca14-f0f9-fa20bd85b98e	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b9-ca16-6774-e62a83d4d1ad	00040000-55b9-ca14-f0f9-fa20bd85b98e	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b9-ca16-cdfe-d67ef57330c3	00040000-55b9-ca14-f0f9-fa20bd85b98e	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b9-ca16-9b35-0a6911f57cb4	00040000-55b9-ca14-d498-3824b20abf08	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b9-ca16-dfad-ede6f3df3135	00040000-55b9-ca14-53f1-a06a72e9d049	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b9-ca16-ede5-4fb9e98b74fb	00040000-55b9-ca14-77b6-a31b315cee69	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55b9-ca16-4f63-cbf28bbccc3e	00040000-55b9-ca14-f0f9-fa20bd85b98e	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2975 (class 0 OID 11065217)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55b9-ca14-a525-c722d9d78fb4	8341	Adlešiči
00050000-55b9-ca14-b160-06aa37422942	5270	Ajdovščina
00050000-55b9-ca14-b608-9a43e8eaa28a	6280	Ankaran/Ancarano
00050000-55b9-ca14-0ca1-e6b8ac7e9ff8	9253	Apače
00050000-55b9-ca14-e922-58e7747d836d	8253	Artiče
00050000-55b9-ca14-ee42-c0176a6dc322	4275	Begunje na Gorenjskem
00050000-55b9-ca14-2e53-c6bb22cd27bd	1382	Begunje pri Cerknici
00050000-55b9-ca14-d7ba-142512eb8957	9231	Beltinci
00050000-55b9-ca14-b935-d772e2beb8d9	2234	Benedikt
00050000-55b9-ca14-5e33-03e19566d03a	2345	Bistrica ob Dravi
00050000-55b9-ca14-70f5-192c452cddf0	3256	Bistrica ob Sotli
00050000-55b9-ca14-951c-a1bd586207cc	8259	Bizeljsko
00050000-55b9-ca14-2153-fecb38eecec2	1223	Blagovica
00050000-55b9-ca14-4d53-368778ae5311	8283	Blanca
00050000-55b9-ca14-5f8c-7adb9379463a	4260	Bled
00050000-55b9-ca14-bdbb-2e68ae3f220e	4273	Blejska Dobrava
00050000-55b9-ca14-b9e7-29d8fb2acf72	9265	Bodonci
00050000-55b9-ca14-7837-51cb2cca0aa9	9222	Bogojina
00050000-55b9-ca14-ef60-5e796541bd70	4263	Bohinjska Bela
00050000-55b9-ca14-d281-699733c94b4e	4264	Bohinjska Bistrica
00050000-55b9-ca14-c2a1-bae8160a66bb	4265	Bohinjsko jezero
00050000-55b9-ca14-3525-b839a341a285	1353	Borovnica
00050000-55b9-ca14-2d16-1a2166c83f63	8294	Boštanj
00050000-55b9-ca14-8937-bec0dc520e33	5230	Bovec
00050000-55b9-ca14-a9b5-4d18b0fc2794	5295	Branik
00050000-55b9-ca14-596e-fe9e2fd038e0	3314	Braslovče
00050000-55b9-ca14-4e1f-aed938d7e7bf	5223	Breginj
00050000-55b9-ca14-847c-45c754d8ba58	8280	Brestanica
00050000-55b9-ca14-c526-69f03738cfbd	2354	Bresternica
00050000-55b9-ca14-d083-9baeae83018d	4243	Brezje
00050000-55b9-ca14-cc35-3fb6f20e4dd2	1351	Brezovica pri Ljubljani
00050000-55b9-ca14-64e6-41f5f59209f7	8250	Brežice
00050000-55b9-ca14-43e9-6671f80f8d1a	4210	Brnik - Aerodrom
00050000-55b9-ca14-118e-b629f4f23c53	8321	Brusnice
00050000-55b9-ca14-17b7-313008956c9c	3255	Buče
00050000-55b9-ca14-c441-72f10fb9ded8	8276	Bučka 
00050000-55b9-ca14-ec67-7b9dc43b2e58	9261	Cankova
00050000-55b9-ca14-fcbe-94b5bfa88f60	3000	Celje 
00050000-55b9-ca14-3644-959283f8ee68	3001	Celje - poštni predali
00050000-55b9-ca14-1c19-0485ddc18e19	4207	Cerklje na Gorenjskem
00050000-55b9-ca14-f47a-77945a6d4f9e	8263	Cerklje ob Krki
00050000-55b9-ca14-2ad2-1620b56f6cf4	1380	Cerknica
00050000-55b9-ca14-5929-2275ed7ec636	5282	Cerkno
00050000-55b9-ca14-a54e-a10c8b9196e3	2236	Cerkvenjak
00050000-55b9-ca14-7e69-7550a123cba4	2215	Ceršak
00050000-55b9-ca14-aa27-fd6e9f0ee6f5	2326	Cirkovce
00050000-55b9-ca14-ea74-d5dd86fd4db8	2282	Cirkulane
00050000-55b9-ca14-3b13-9f8a95ca729f	5273	Col
00050000-55b9-ca14-bfb8-9d91d72a6de1	8251	Čatež ob Savi
00050000-55b9-ca14-a53c-f850678d7e3a	1413	Čemšenik
00050000-55b9-ca14-15db-28166b3b61eb	5253	Čepovan
00050000-55b9-ca14-aa77-2d934bdd723c	9232	Črenšovci
00050000-55b9-ca14-4839-ecf9ef338a51	2393	Črna na Koroškem
00050000-55b9-ca14-8db7-52a9660e4dbf	6275	Črni Kal
00050000-55b9-ca14-0b5a-f58e7a277e87	5274	Črni Vrh nad Idrijo
00050000-55b9-ca14-4ccd-0e5e88e6064d	5262	Črniče
00050000-55b9-ca14-3517-9368698a18d3	8340	Črnomelj
00050000-55b9-ca14-2021-091b17d77cfc	6271	Dekani
00050000-55b9-ca14-1557-7393e11fd9df	5210	Deskle
00050000-55b9-ca14-1243-9433eab5b0c9	2253	Destrnik
00050000-55b9-ca14-7b8c-53583926f185	6215	Divača
00050000-55b9-ca14-9956-0a8a67a02fb7	1233	Dob
00050000-55b9-ca14-05a2-e51ec6d8b785	3224	Dobje pri Planini
00050000-55b9-ca14-dba1-b36d80e94d45	8257	Dobova
00050000-55b9-ca14-e86d-62ee25725e63	1423	Dobovec
00050000-55b9-ca14-6618-9fc2c7613fe9	5263	Dobravlje
00050000-55b9-ca14-18a0-e33a0406d816	3204	Dobrna
00050000-55b9-ca14-8aa6-aeae5a891da7	8211	Dobrnič
00050000-55b9-ca14-8fb1-99e89f34f44c	1356	Dobrova
00050000-55b9-ca14-682b-039fe69714e1	9223	Dobrovnik/Dobronak 
00050000-55b9-ca14-6e43-cf08e3cb8ccf	5212	Dobrovo v Brdih
00050000-55b9-ca14-0b98-fd0e2c97645d	1431	Dol pri Hrastniku
00050000-55b9-ca14-0ae0-df9fdbae1454	1262	Dol pri Ljubljani
00050000-55b9-ca14-473b-366f319aed86	1273	Dole pri Litiji
00050000-55b9-ca14-59ef-7a43366b069c	1331	Dolenja vas
00050000-55b9-ca14-9229-62d95f82caf9	8350	Dolenjske Toplice
00050000-55b9-ca14-4536-d875cee9beb3	1230	Domžale
00050000-55b9-ca14-4f1d-fb1260232077	2252	Dornava
00050000-55b9-ca14-fa7c-afc586f29b57	5294	Dornberk
00050000-55b9-ca14-3272-806de07fc85d	1319	Draga
00050000-55b9-ca14-f47a-fd7113e1f737	8343	Dragatuš
00050000-55b9-ca14-5b32-2e1b43499185	3222	Dramlje
00050000-55b9-ca14-9918-6681bcf429ff	2370	Dravograd
00050000-55b9-ca14-08f4-6ce22659ea36	4203	Duplje
00050000-55b9-ca14-b552-f3ab98dd54d8	6221	Dutovlje
00050000-55b9-ca14-344c-0086640fc70b	8361	Dvor
00050000-55b9-ca14-b553-fecaa52f4585	2343	Fala
00050000-55b9-ca14-a72a-c93c7df7be5b	9208	Fokovci
00050000-55b9-ca14-0aa9-a783b0c6b39f	2313	Fram
00050000-55b9-ca14-a23f-9aa7954dcc5d	3213	Frankolovo
00050000-55b9-ca14-403f-8cf19838f420	1274	Gabrovka
00050000-55b9-ca14-f5c0-34d322d6e7f0	8254	Globoko
00050000-55b9-ca14-9495-c934d3ad47b0	5275	Godovič
00050000-55b9-ca14-f9d0-4a9010fa8034	4204	Golnik
00050000-55b9-ca14-0fa6-780b6ef3c1b1	3303	Gomilsko
00050000-55b9-ca14-926c-02326af6c87f	4224	Gorenja vas
00050000-55b9-ca14-b4d9-44f98fc52006	3263	Gorica pri Slivnici
00050000-55b9-ca14-9b8c-163588454772	2272	Gorišnica
00050000-55b9-ca14-8c5d-0bcccd0ccf1a	9250	Gornja Radgona
00050000-55b9-ca14-a4c7-6431d1bc202d	3342	Gornji Grad
00050000-55b9-ca14-45d4-e33e48c39d66	4282	Gozd Martuljek
00050000-55b9-ca14-ff82-cacd917173d3	6272	Gračišče
00050000-55b9-ca14-2f0c-f81da179d50a	9264	Grad
00050000-55b9-ca14-c6e9-beaaddc7e88a	8332	Gradac
00050000-55b9-ca14-f863-e034dd65c2e0	1384	Grahovo
00050000-55b9-ca14-dd6e-ce36a3d7abbe	5242	Grahovo ob Bači
00050000-55b9-ca14-f218-e09378e18852	5251	Grgar
00050000-55b9-ca14-4404-a9cd94f99436	3302	Griže
00050000-55b9-ca14-acca-b00c2ad7af72	3231	Grobelno
00050000-55b9-ca14-9577-4f7eaed4490a	1290	Grosuplje
00050000-55b9-ca14-653b-6c9094e2794b	2288	Hajdina
00050000-55b9-ca14-dea3-647856f5a9a0	8362	Hinje
00050000-55b9-ca14-7413-a8e8984ce7a8	2311	Hoče
00050000-55b9-ca14-c39a-d7f5c95b295c	9205	Hodoš/Hodos
00050000-55b9-ca14-751b-87684b84b1d2	1354	Horjul
00050000-55b9-ca14-f1a3-ae045430efe9	1372	Hotedršica
00050000-55b9-ca14-9f1c-09d9a7bd6c97	1430	Hrastnik
00050000-55b9-ca14-7973-9b4538b216f4	6225	Hruševje
00050000-55b9-ca14-92f4-5c087b45db18	4276	Hrušica
00050000-55b9-ca14-532a-62bb57bfad33	5280	Idrija
00050000-55b9-ca14-14d6-544c0903d7aa	1292	Ig
00050000-55b9-ca14-7798-47ea30bc4120	6250	Ilirska Bistrica
00050000-55b9-ca14-151c-51a75e5213b3	6251	Ilirska Bistrica-Trnovo
00050000-55b9-ca14-ed3e-3a3257fba92f	1295	Ivančna Gorica
00050000-55b9-ca14-8974-964c0059fd82	2259	Ivanjkovci
00050000-55b9-ca14-3c33-412a22271fbb	1411	Izlake
00050000-55b9-ca14-7da2-678d7c6e46cf	6310	Izola/Isola
00050000-55b9-ca14-7df3-7db94522822c	2222	Jakobski Dol
00050000-55b9-ca14-4768-fd075491aa24	2221	Jarenina
00050000-55b9-ca14-14d6-beed55619345	6254	Jelšane
00050000-55b9-ca14-1445-225f0e7f6ec0	4270	Jesenice
00050000-55b9-ca14-6c66-bbe94126b6a8	8261	Jesenice na Dolenjskem
00050000-55b9-ca14-155e-a0396b9ad65c	3273	Jurklošter
00050000-55b9-ca14-62b2-084180e2aec4	2223	Jurovski Dol
00050000-55b9-ca14-7a15-89c7a8e89e80	2256	Juršinci
00050000-55b9-ca14-d3d8-e0c685afaba3	5214	Kal nad Kanalom
00050000-55b9-ca14-cd23-b7fa03a25fed	3233	Kalobje
00050000-55b9-ca14-e5df-56eb693bf28f	4246	Kamna Gorica
00050000-55b9-ca14-1bc5-adbbca95eeed	2351	Kamnica
00050000-55b9-ca14-c1a2-fa2c2b924b81	1241	Kamnik
00050000-55b9-ca14-02f1-41fd8fa1737f	5213	Kanal
00050000-55b9-ca14-d5f3-8449caa4c83b	8258	Kapele
00050000-55b9-ca14-278a-516f8685b974	2362	Kapla
00050000-55b9-ca14-2150-3adb79654873	2325	Kidričevo
00050000-55b9-ca14-a297-619a68c17e50	1412	Kisovec
00050000-55b9-ca14-c98d-9d5bb2876117	6253	Knežak
00050000-55b9-ca14-f72d-3dbf408c6759	5222	Kobarid
00050000-55b9-ca14-8c6c-527ea9509165	9227	Kobilje
00050000-55b9-ca14-deed-cb5dfe089aaf	1330	Kočevje
00050000-55b9-ca14-d780-d8c9efdcd69e	1338	Kočevska Reka
00050000-55b9-ca14-d035-ef12c132af75	2276	Kog
00050000-55b9-ca14-e536-8e028be146e8	5211	Kojsko
00050000-55b9-ca14-ed98-85f06c020d6c	6223	Komen
00050000-55b9-ca14-e4bd-934643ff824f	1218	Komenda
00050000-55b9-ca14-5bff-c778b6950967	6000	Koper/Capodistria 
00050000-55b9-ca14-f860-23a23fe0c67d	6001	Koper/Capodistria - poštni predali
00050000-55b9-ca14-9716-9602bb6a8b92	8282	Koprivnica
00050000-55b9-ca14-982f-206478e4f817	5296	Kostanjevica na Krasu
00050000-55b9-ca14-279a-6c0796ddb030	8311	Kostanjevica na Krki
00050000-55b9-ca14-c84f-657c282bfafa	1336	Kostel
00050000-55b9-ca14-1abf-8cf66254050b	6256	Košana
00050000-55b9-ca14-f67f-e2af7f565ca9	2394	Kotlje
00050000-55b9-ca14-59ae-4f68a0c1afc0	6240	Kozina
00050000-55b9-ca14-7635-d5fa30597489	3260	Kozje
00050000-55b9-ca14-5d06-b197b110795e	4000	Kranj 
00050000-55b9-ca14-ac9c-a91938b563ee	4001	Kranj - poštni predali
00050000-55b9-ca14-59e1-27587afb1afe	4280	Kranjska Gora
00050000-55b9-ca14-782b-a5d210676442	1281	Kresnice
00050000-55b9-ca14-8315-437dd6d94671	4294	Križe
00050000-55b9-ca14-f8be-3c16f1c6de18	9206	Križevci
00050000-55b9-ca14-9aad-1eb5065b16ca	9242	Križevci pri Ljutomeru
00050000-55b9-ca14-5a23-3253dc5e316a	1301	Krka
00050000-55b9-ca14-bb0b-b7df2e374bc9	8296	Krmelj
00050000-55b9-ca14-bb9c-cd644e405f76	4245	Kropa
00050000-55b9-ca14-4749-e4e682bfc9f4	8262	Krška vas
00050000-55b9-ca14-ef79-7d05719001e7	8270	Krško
00050000-55b9-ca14-e8fa-9c862ba91166	9263	Kuzma
00050000-55b9-ca14-2b76-43ab84671675	2318	Laporje
00050000-55b9-ca14-b2b4-7b2eff796a60	3270	Laško
00050000-55b9-ca14-8db5-845ba7dd9d88	1219	Laze v Tuhinju
00050000-55b9-ca14-b635-98bafef13db0	2230	Lenart v Slovenskih goricah
00050000-55b9-ca14-7848-94001d313bd3	9220	Lendava/Lendva
00050000-55b9-ca14-e6b5-7c5b51789efd	4248	Lesce
00050000-55b9-ca14-4ac2-c43fd6a66509	3261	Lesično
00050000-55b9-ca14-03ee-da4a96193a98	8273	Leskovec pri Krškem
00050000-55b9-ca14-a093-50bd9d465d19	2372	Libeliče
00050000-55b9-ca14-f4e2-b4d100eecde2	2341	Limbuš
00050000-55b9-ca14-407f-e5644b533c04	1270	Litija
00050000-55b9-ca14-ad0b-6d3d83872612	3202	Ljubečna
00050000-55b9-ca14-c421-d54014f91099	1000	Ljubljana 
00050000-55b9-ca14-442d-8fea2a104200	1001	Ljubljana - poštni predali
00050000-55b9-ca14-1c4b-233a114bd501	1231	Ljubljana - Črnuče
00050000-55b9-ca14-3f00-4032f394f89c	1261	Ljubljana - Dobrunje
00050000-55b9-ca14-1759-92d0f86aaaf7	1260	Ljubljana - Polje
00050000-55b9-ca14-8f98-81ce84846735	1210	Ljubljana - Šentvid
00050000-55b9-ca14-2956-39bc80804c7d	1211	Ljubljana - Šmartno
00050000-55b9-ca14-57d8-2000b33e0912	3333	Ljubno ob Savinji
00050000-55b9-ca14-a064-26573d816786	9240	Ljutomer
00050000-55b9-ca14-e9ec-009fe2c549f8	3215	Loče
00050000-55b9-ca14-2ac5-c7925947c2dc	5231	Log pod Mangartom
00050000-55b9-ca14-e2f2-cff08dca1ef0	1358	Log pri Brezovici
00050000-55b9-ca14-62f7-dbb8d3cb7566	1370	Logatec
00050000-55b9-ca14-f677-eef4ee5bc0d0	1371	Logatec
00050000-55b9-ca14-833f-13f0216817a4	1434	Loka pri Zidanem Mostu
00050000-55b9-ca14-6008-c03d9034af62	3223	Loka pri Žusmu
00050000-55b9-ca14-69a3-1d4f5aec8f4d	6219	Lokev
00050000-55b9-ca14-5058-513f86001f0e	1318	Loški Potok
00050000-55b9-ca14-ed81-eb649dfcdde4	2324	Lovrenc na Dravskem polju
00050000-55b9-ca14-726a-b0a2022f522b	2344	Lovrenc na Pohorju
00050000-55b9-ca14-a10b-3cb50d1bc8d1	3334	Luče
00050000-55b9-ca14-3279-543570035e40	1225	Lukovica
00050000-55b9-ca14-4c74-6ec1b0b3dc73	9202	Mačkovci
00050000-55b9-ca14-6cff-06a2dbd096e8	2322	Majšperk
00050000-55b9-ca14-4550-a80a517cfdc8	2321	Makole
00050000-55b9-ca14-303d-35e0911d3d2e	9243	Mala Nedelja
00050000-55b9-ca14-39d7-590abaa08a6a	2229	Malečnik
00050000-55b9-ca14-b397-f2ea0a0c2b85	6273	Marezige
00050000-55b9-ca14-8bcd-8020726da1aa	2000	Maribor 
00050000-55b9-ca14-19cf-454823756b44	2001	Maribor - poštni predali
00050000-55b9-ca14-24fd-60e833c7a7d4	2206	Marjeta na Dravskem polju
00050000-55b9-ca14-9fd0-ad7fa4e3e4e8	2281	Markovci
00050000-55b9-ca14-b1e8-7a407590fc2a	9221	Martjanci
00050000-55b9-ca14-8fcc-5030d674289e	6242	Materija
00050000-55b9-ca14-8789-03eb81ae27a5	4211	Mavčiče
00050000-55b9-ca14-6a56-2593b693759c	1215	Medvode
00050000-55b9-ca14-d150-209ea0b4d035	1234	Mengeš
00050000-55b9-ca14-4582-5113d957dc72	8330	Metlika
00050000-55b9-ca14-aa11-ea75aae3e3de	2392	Mežica
00050000-55b9-ca14-bf53-184b95c35b25	2204	Miklavž na Dravskem polju
00050000-55b9-ca14-18a5-d2450e950977	2275	Miklavž pri Ormožu
00050000-55b9-ca14-a0da-a10695561caf	5291	Miren
00050000-55b9-ca14-dfd9-103ad8d8318e	8233	Mirna
00050000-55b9-ca14-337c-ca00cb9dee2a	8216	Mirna Peč
00050000-55b9-ca14-9ca9-1344cf88d9bc	2382	Mislinja
00050000-55b9-ca14-b823-f6a2fff7468a	4281	Mojstrana
00050000-55b9-ca14-f921-c93c19718f89	8230	Mokronog
00050000-55b9-ca14-4892-709857d8dcb5	1251	Moravče
00050000-55b9-ca14-8bf4-89b1cb0db2c1	9226	Moravske Toplice
00050000-55b9-ca14-869a-7f23a775a118	5216	Most na Soči
00050000-55b9-ca14-2673-b6ca935ec33c	1221	Motnik
00050000-55b9-ca14-e306-a7692a5f6cef	3330	Mozirje
00050000-55b9-ca14-8297-662699ce95bd	9000	Murska Sobota 
00050000-55b9-ca14-ce78-316979dc5473	9001	Murska Sobota - poštni predali
00050000-55b9-ca14-cd8d-de24baa39635	2366	Muta
00050000-55b9-ca14-98d8-8ec853510340	4202	Naklo
00050000-55b9-ca14-df01-a8d11ce5168b	3331	Nazarje
00050000-55b9-ca14-6101-8548f40e833f	1357	Notranje Gorice
00050000-55b9-ca14-1422-8d5ee1b86a55	3203	Nova Cerkev
00050000-55b9-ca14-8f68-46e3f0ea5eb6	5000	Nova Gorica 
00050000-55b9-ca14-c29f-8a3e953fd585	5001	Nova Gorica - poštni predali
00050000-55b9-ca14-1823-6654d235832c	1385	Nova vas
00050000-55b9-ca14-8324-0196777af1fc	8000	Novo mesto
00050000-55b9-ca14-0448-a0de492ac081	8001	Novo mesto - poštni predali
00050000-55b9-ca14-a156-22a99826d27b	6243	Obrov
00050000-55b9-ca14-7b95-5bb32482f8ef	9233	Odranci
00050000-55b9-ca14-c207-bc35e9c2190e	2317	Oplotnica
00050000-55b9-ca14-8423-851e852ca43f	2312	Orehova vas
00050000-55b9-ca14-f498-61def65deedf	2270	Ormož
00050000-55b9-ca14-763e-f174cf980050	1316	Ortnek
00050000-55b9-ca14-113d-2bba414251a6	1337	Osilnica
00050000-55b9-ca14-3dcd-863a98cfa920	8222	Otočec
00050000-55b9-ca14-870a-407bfbe6195c	2361	Ožbalt
00050000-55b9-ca14-ef8a-26b636d7df58	2231	Pernica
00050000-55b9-ca14-3f34-c57eaa1554db	2211	Pesnica pri Mariboru
00050000-55b9-ca14-79a3-2415212d0fcf	9203	Petrovci
00050000-55b9-ca14-0b73-b4c5be51b1f2	3301	Petrovče
00050000-55b9-ca14-2a46-ecc0f96c21b0	6330	Piran/Pirano
00050000-55b9-ca14-ffc7-e354904cc008	8255	Pišece
00050000-55b9-ca14-03be-132318c35336	6257	Pivka
00050000-55b9-ca14-5443-0f6bc95ba2c8	6232	Planina
00050000-55b9-ca14-d174-72c0613abe07	3225	Planina pri Sevnici
00050000-55b9-ca14-120c-2c6c00dabd73	6276	Pobegi
00050000-55b9-ca14-9a2b-5cba17bc2674	8312	Podbočje
00050000-55b9-ca14-00fc-23963e70cd90	5243	Podbrdo
00050000-55b9-ca14-a6fb-5538557a84a4	3254	Podčetrtek
00050000-55b9-ca14-e182-9da71eb3686b	2273	Podgorci
00050000-55b9-ca14-60ce-2132516a99a5	6216	Podgorje
00050000-55b9-ca14-d544-dc6bd8194299	2381	Podgorje pri Slovenj Gradcu
00050000-55b9-ca14-fee0-9af7e554e960	6244	Podgrad
00050000-55b9-ca14-e5e1-2040cbc243c9	1414	Podkum
00050000-55b9-ca14-412e-17f6305a1ec5	2286	Podlehnik
00050000-55b9-ca14-53df-4b641572c92c	5272	Podnanos
00050000-55b9-ca14-0602-1104ae67c98a	4244	Podnart
00050000-55b9-ca14-7891-2bf0fcc82696	3241	Podplat
00050000-55b9-ca14-0f4b-bf7a20a49322	3257	Podsreda
00050000-55b9-ca14-185e-dcbb0d364e10	2363	Podvelka
00050000-55b9-ca14-e979-2488b15388ad	2208	Pohorje
00050000-55b9-ca14-b16c-e4ef800e1a73	2257	Polenšak
00050000-55b9-ca14-384b-2afd294dff81	1355	Polhov Gradec
00050000-55b9-ca14-bf18-08f2350a98d3	4223	Poljane nad Škofjo Loko
00050000-55b9-ca14-7f62-dbb0d1903fae	2319	Poljčane
00050000-55b9-ca14-3461-8a15f25fca90	1272	Polšnik
00050000-55b9-ca14-0828-67eca788b5f4	3313	Polzela
00050000-55b9-ca14-2893-9491e33c112b	3232	Ponikva
00050000-55b9-ca14-bd7f-6323f561fbce	6320	Portorož/Portorose
00050000-55b9-ca14-884d-7039c0fecaa7	6230	Postojna
00050000-55b9-ca14-881d-e4558a545697	2331	Pragersko
00050000-55b9-ca14-b76a-dad82aeef955	3312	Prebold
00050000-55b9-ca14-5f75-5d84a707244c	4205	Preddvor
00050000-55b9-ca14-9044-31f9f4b65e2d	6255	Prem
00050000-55b9-ca14-d2cc-53182240dc54	1352	Preserje
00050000-55b9-ca14-410c-949d91ac4136	6258	Prestranek
00050000-55b9-ca14-e1d7-bcc8c487ceb6	2391	Prevalje
00050000-55b9-ca14-a79c-bdeec0ecd29a	3262	Prevorje
00050000-55b9-ca14-364f-db9fc2a9155a	1276	Primskovo 
00050000-55b9-ca14-b421-732200364395	3253	Pristava pri Mestinju
00050000-55b9-ca14-664f-6b7331603106	9207	Prosenjakovci/Partosfalva
00050000-55b9-ca14-e70b-fc0fb1e95ab4	5297	Prvačina
00050000-55b9-ca14-abc3-74e65c10c75c	2250	Ptuj
00050000-55b9-ca14-4676-3e6a6b98ec53	2323	Ptujska Gora
00050000-55b9-ca14-a058-f7d154567747	9201	Puconci
00050000-55b9-ca14-08df-02d958341e00	2327	Rače
00050000-55b9-ca14-a930-934af30615d0	1433	Radeče
00050000-55b9-ca14-276e-4e33a5ac0e3e	9252	Radenci
00050000-55b9-ca14-3d79-fae99c668b84	2360	Radlje ob Dravi
00050000-55b9-ca14-0e84-f1e148f781a9	1235	Radomlje
00050000-55b9-ca14-aa0b-e03b7a3b9d2f	4240	Radovljica
00050000-55b9-ca14-b0d8-7af5aee12c02	8274	Raka
00050000-55b9-ca14-9e53-08739374a379	1381	Rakek
00050000-55b9-ca14-ad0a-4552cfd312b5	4283	Rateče - Planica
00050000-55b9-ca14-d035-5f33711fbdae	2390	Ravne na Koroškem
00050000-55b9-ca14-11a0-7f871031f0a3	9246	Razkrižje
00050000-55b9-ca14-27c0-d9158c3911ba	3332	Rečica ob Savinji
00050000-55b9-ca14-9f97-291a6af5197f	5292	Renče
00050000-55b9-ca14-8fa6-bda5f30fa4c0	1310	Ribnica
00050000-55b9-ca14-8d91-593abab18f07	2364	Ribnica na Pohorju
00050000-55b9-ca14-b5a6-0f3607679e58	3272	Rimske Toplice
00050000-55b9-ca14-2836-5978da30c35b	1314	Rob
00050000-55b9-ca14-499d-afce2883639f	5215	Ročinj
00050000-55b9-ca14-0e73-64941997e97e	3250	Rogaška Slatina
00050000-55b9-ca14-4cd8-9602477360b3	9262	Rogašovci
00050000-55b9-ca14-fb2b-e2e47a2efe2f	3252	Rogatec
00050000-55b9-ca14-67b0-15e5c381ab60	1373	Rovte
00050000-55b9-ca14-13b4-8894e5f9e26b	2342	Ruše
00050000-55b9-ca14-ee65-396eb42361e7	1282	Sava
00050000-55b9-ca14-5e62-f63f6a3ca597	6333	Sečovlje/Sicciole
00050000-55b9-ca14-1704-12fe25c0fac3	4227	Selca
00050000-55b9-ca14-f617-8960404d78f6	2352	Selnica ob Dravi
00050000-55b9-ca14-5788-39bbfe25a61e	8333	Semič
00050000-55b9-ca14-8451-8970a2ea3227	8281	Senovo
00050000-55b9-ca14-7111-2bd39c1bb20f	6224	Senožeče
00050000-55b9-ca14-166e-3aa0758280ea	8290	Sevnica
00050000-55b9-ca14-66d4-8a21d2610a9d	6210	Sežana
00050000-55b9-ca14-7f2b-e14f8fad7296	2214	Sladki Vrh
00050000-55b9-ca14-02af-3980a1893021	5283	Slap ob Idrijci
00050000-55b9-ca14-d770-b77d8256a7ce	2380	Slovenj Gradec
00050000-55b9-ca14-1f12-9dba0cc7a0fd	2310	Slovenska Bistrica
00050000-55b9-ca14-3fcc-db7a8f734ec0	3210	Slovenske Konjice
00050000-55b9-ca14-1838-d9ce3c5e96c7	1216	Smlednik
00050000-55b9-ca14-6716-25bd49020bab	5232	Soča
00050000-55b9-ca14-99c1-5cef3ff75b7d	1317	Sodražica
00050000-55b9-ca14-0e02-978c2f7645c5	3335	Solčava
00050000-55b9-ca14-56f9-3ca60e1df721	5250	Solkan
00050000-55b9-ca14-6a18-9fbd93a65a2f	4229	Sorica
00050000-55b9-ca14-32fb-34f1b263f351	4225	Sovodenj
00050000-55b9-ca14-dccf-6acc3dc9fcc5	5281	Spodnja Idrija
00050000-55b9-ca14-68cb-0c6468d69f12	2241	Spodnji Duplek
00050000-55b9-ca14-a694-c97eda8f8f83	9245	Spodnji Ivanjci
00050000-55b9-ca14-b315-1e9c04095a9d	2277	Središče ob Dravi
00050000-55b9-ca14-879f-49ed39e1df3a	4267	Srednja vas v Bohinju
00050000-55b9-ca15-0b1b-aa167592ce4e	8256	Sromlje 
00050000-55b9-ca15-9e36-eaa34ee01038	5224	Srpenica
00050000-55b9-ca15-8940-96576af86530	1242	Stahovica
00050000-55b9-ca15-c1f1-0454bf0540c1	1332	Stara Cerkev
00050000-55b9-ca15-b709-ac5bba105ec1	8342	Stari trg ob Kolpi
00050000-55b9-ca15-2c16-6ec19c3d836a	1386	Stari trg pri Ložu
00050000-55b9-ca15-e324-380616388db7	2205	Starše
00050000-55b9-ca15-3980-2be0580f8b3c	2289	Stoperce
00050000-55b9-ca15-296c-5fa9a9a8c14e	8322	Stopiče
00050000-55b9-ca15-ce06-5e106cbe2327	3206	Stranice
00050000-55b9-ca15-abe9-bd6a7dafc675	8351	Straža
00050000-55b9-ca15-a726-9fc00eb7184c	1313	Struge
00050000-55b9-ca15-7714-c1889158064a	8293	Studenec
00050000-55b9-ca15-53b1-09c627f6d0e7	8331	Suhor
00050000-55b9-ca15-c5fd-fb53d74204e1	2233	Sv. Ana v Slovenskih goricah
00050000-55b9-ca15-f82d-cfdf82c9df34	2235	Sv. Trojica v Slovenskih goricah
00050000-55b9-ca15-c894-fcd63aacb946	2353	Sveti Duh na Ostrem Vrhu
00050000-55b9-ca15-c54f-1708b499f080	9244	Sveti Jurij ob Ščavnici
00050000-55b9-ca15-d7c4-7d4dcc3ec415	3264	Sveti Štefan
00050000-55b9-ca15-e346-023b788920b8	2258	Sveti Tomaž
00050000-55b9-ca15-e196-ddd5f8b5c7d4	9204	Šalovci
00050000-55b9-ca15-4e8c-c879ded2c266	5261	Šempas
00050000-55b9-ca15-f8d7-747af8fc56ab	5290	Šempeter pri Gorici
00050000-55b9-ca15-25f0-4a25f03ee0ad	3311	Šempeter v Savinjski dolini
00050000-55b9-ca15-1733-55744dfb2875	4208	Šenčur
00050000-55b9-ca15-5f16-27b0d9a40f82	2212	Šentilj v Slovenskih goricah
00050000-55b9-ca15-dc32-9aca24d3c34f	8297	Šentjanž
00050000-55b9-ca15-f870-8d34e05283f9	2373	Šentjanž pri Dravogradu
00050000-55b9-ca15-bd60-45305b584402	8310	Šentjernej
00050000-55b9-ca15-cfcb-4bd12bc74ede	3230	Šentjur
00050000-55b9-ca15-69b4-7b67ec634099	3271	Šentrupert
00050000-55b9-ca15-9672-b1f5b34ab7f5	8232	Šentrupert
00050000-55b9-ca15-5a4c-e0a6fdbb9fee	1296	Šentvid pri Stični
00050000-55b9-ca15-923d-eaf7c6af58d5	8275	Škocjan
00050000-55b9-ca15-1f5d-fc9fa0ba9465	6281	Škofije
00050000-55b9-ca15-0df8-13cf4ec7d211	4220	Škofja Loka
00050000-55b9-ca15-bc84-f800c2f3a003	3211	Škofja vas
00050000-55b9-ca15-812b-53fe850c22b8	1291	Škofljica
00050000-55b9-ca15-b3b9-0db3b2f3bc7b	6274	Šmarje
00050000-55b9-ca15-c4d7-66d99efa886f	1293	Šmarje - Sap
00050000-55b9-ca15-efb9-e20b7aa25d5e	3240	Šmarje pri Jelšah
00050000-55b9-ca15-3fd5-550d6bc94f97	8220	Šmarješke Toplice
00050000-55b9-ca15-8a06-d7424a448de8	2315	Šmartno na Pohorju
00050000-55b9-ca15-cc8e-473765d6e369	3341	Šmartno ob Dreti
00050000-55b9-ca15-f2f5-e880b514bdd4	3327	Šmartno ob Paki
00050000-55b9-ca15-c3d9-da7f90dff826	1275	Šmartno pri Litiji
00050000-55b9-ca15-79a7-5330ce18a095	2383	Šmartno pri Slovenj Gradcu
00050000-55b9-ca15-eb35-c76d1d675e36	3201	Šmartno v Rožni dolini
00050000-55b9-ca15-7d1c-c6860fe68a0f	3325	Šoštanj
00050000-55b9-ca15-4d09-e6d2bb5e6b21	6222	Štanjel
00050000-55b9-ca15-4202-8b6f4238fb4e	3220	Štore
00050000-55b9-ca15-133f-b65adad768b8	3304	Tabor
00050000-55b9-ca15-b97a-c788e4df3ce4	3221	Teharje
00050000-55b9-ca15-6fef-5525e21565a7	9251	Tišina
00050000-55b9-ca15-d251-3706d0cd20c6	5220	Tolmin
00050000-55b9-ca15-da1e-78bccd1a4f92	3326	Topolšica
00050000-55b9-ca15-c3eb-2c77cfe4e193	2371	Trbonje
00050000-55b9-ca15-ff61-fef6ea00d0d5	1420	Trbovlje
00050000-55b9-ca15-b6b2-fbecef17ee02	8231	Trebelno 
00050000-55b9-ca15-df27-9ceba451353b	8210	Trebnje
00050000-55b9-ca15-4f0b-fc28af1e9a09	5252	Trnovo pri Gorici
00050000-55b9-ca15-22f6-256cbb5b8bac	2254	Trnovska vas
00050000-55b9-ca15-6543-df7b37112066	1222	Trojane
00050000-55b9-ca15-bf7b-1daf7643cd94	1236	Trzin
00050000-55b9-ca15-8d63-3b005f7cb9ec	4290	Tržič
00050000-55b9-ca15-21a5-418cfd474229	8295	Tržišče
00050000-55b9-ca15-3cf8-af31ad0bcc86	1311	Turjak
00050000-55b9-ca15-e0e8-29e0f6a9177b	9224	Turnišče
00050000-55b9-ca15-bc15-293c7a9c162f	8323	Uršna sela
00050000-55b9-ca15-e275-2dd57feff869	1252	Vače
00050000-55b9-ca15-1317-12f52373f578	3320	Velenje 
00050000-55b9-ca15-feaa-6a934cf91dd1	3322	Velenje - poštni predali
00050000-55b9-ca15-2ec0-9c0e74850f66	8212	Velika Loka
00050000-55b9-ca15-365d-c82644168f52	2274	Velika Nedelja
00050000-55b9-ca15-07d1-c2fe28e9bdf0	9225	Velika Polana
00050000-55b9-ca15-037c-a8efab9daada	1315	Velike Lašče
00050000-55b9-ca15-cb13-57aee0d69954	8213	Veliki Gaber
00050000-55b9-ca15-413a-de1265e02cf0	9241	Veržej
00050000-55b9-ca15-9f03-ead73270d571	1312	Videm - Dobrepolje
00050000-55b9-ca15-a8bf-3c247686c3d6	2284	Videm pri Ptuju
00050000-55b9-ca15-fc95-645acb759ca8	8344	Vinica
00050000-55b9-ca15-63ea-3576136737c2	5271	Vipava
00050000-55b9-ca15-6b40-19b4d0bc5dd7	4212	Visoko
00050000-55b9-ca15-d384-ed08d405dbc5	1294	Višnja Gora
00050000-55b9-ca15-0344-0a4516e98af6	3205	Vitanje
00050000-55b9-ca15-f5d7-6f14df31be15	2255	Vitomarci
00050000-55b9-ca15-74bd-8943f922b6d1	1217	Vodice
00050000-55b9-ca15-1f00-23d803567a98	3212	Vojnik\t
00050000-55b9-ca15-793d-2d727fbed456	5293	Volčja Draga
00050000-55b9-ca15-c3bb-8ad23e146996	2232	Voličina
00050000-55b9-ca15-4859-a6e975753b7e	3305	Vransko
00050000-55b9-ca15-8338-912140a07dba	6217	Vremski Britof
00050000-55b9-ca15-739f-1b5d4bcf7709	1360	Vrhnika
00050000-55b9-ca15-0b91-e1e389581ef6	2365	Vuhred
00050000-55b9-ca15-d70f-3ee53119c8de	2367	Vuzenica
00050000-55b9-ca15-4693-318e6856f7e3	8292	Zabukovje 
00050000-55b9-ca15-e439-06d633dcf4af	1410	Zagorje ob Savi
00050000-55b9-ca15-4a37-1f52133fe4c7	1303	Zagradec
00050000-55b9-ca15-51e9-ede6c410657a	2283	Zavrč
00050000-55b9-ca15-c400-3976093efa96	8272	Zdole 
00050000-55b9-ca15-6589-4c434c8ff262	4201	Zgornja Besnica
00050000-55b9-ca15-6faf-5cc558b2ca5a	2242	Zgornja Korena
00050000-55b9-ca15-2b10-a45bad9957fe	2201	Zgornja Kungota
00050000-55b9-ca15-5173-1ecfc10e2ee6	2316	Zgornja Ložnica
00050000-55b9-ca15-2bc9-6482a9bb3ffa	2314	Zgornja Polskava
00050000-55b9-ca15-f4a0-8006da49ce8b	2213	Zgornja Velka
00050000-55b9-ca15-7c6c-9a90d4b5d65b	4247	Zgornje Gorje
00050000-55b9-ca15-aaad-58c91474dc26	4206	Zgornje Jezersko
00050000-55b9-ca15-6111-971ab7b6a065	2285	Zgornji Leskovec
00050000-55b9-ca15-1815-f6031998aabe	1432	Zidani Most
00050000-55b9-ca15-bd53-3d61d9addba7	3214	Zreče
00050000-55b9-ca15-6747-7dd1a71ca5e4	4209	Žabnica
00050000-55b9-ca15-284a-c58ed12cc872	3310	Žalec
00050000-55b9-ca15-1024-19d654e8cefd	4228	Železniki
00050000-55b9-ca15-36eb-6bb509e47fe4	2287	Žetale
00050000-55b9-ca15-7c3a-de508aceeedd	4226	Žiri
00050000-55b9-ca15-331b-29fc7c9fc8d5	4274	Žirovnica
00050000-55b9-ca15-3b9e-4215e9da4bce	8360	Žužemberk
\.


--
-- TOC entry 2992 (class 0 OID 11065391)
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
-- TOC entry 2974 (class 0 OID 11065202)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 11065280)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 11065403)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 11065706)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 11065717)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55b9-ca16-5bfa-ea3dfe25471b	00080000-55b9-ca16-4f63-cbf28bbccc3e	0900	AK
00190000-55b9-ca16-cc49-c4368e4e3746	00080000-55b9-ca16-9ca9-b6a01f5d8184	0987	AK
00190000-55b9-ca16-b0db-02084d035c28	00080000-55b9-ca16-e8a8-af430d2ed96e	0989	AK
00190000-55b9-ca16-7912-ba1962e81e19	00080000-55b9-ca16-6774-e62a83d4d1ad	0986	AK
00190000-55b9-ca16-47f8-772f7f5e4b3b	00080000-55b9-ca16-9b35-0a6911f57cb4	0984	AK
00190000-55b9-ca16-3e2b-ee7f46606880	00080000-55b9-ca16-dfad-ede6f3df3135	0983	AK
00190000-55b9-ca16-df18-65ddf307cc93	00080000-55b9-ca16-ede5-4fb9e98b74fb	0982	AK
\.


--
-- TOC entry 3016 (class 0 OID 11065687)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55b9-ca16-8fee-99005b31675c	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 3019 (class 0 OID 11065725)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 11065432)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55b9-ca16-c20a-a9d47874f440	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55b9-ca16-4944-c03c414ccad7	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55b9-ca16-1b8b-67dbab1ca4ad	0003	Kazinska	t	84	Kazinska dvorana
00220000-55b9-ca16-3a77-2f0c9278e898	0004	Mali oder	t	24	Mali oder 
00220000-55b9-ca16-136e-52b5fbaa163c	0005	Komorni oder	t	15	Komorni oder
00220000-55b9-ca16-b56e-effb6381851c	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55b9-ca16-87e8-7da30d55a8ca	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2990 (class 0 OID 11065376)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 11065366)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 11065551)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 11065500)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 11065074)
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
-- TOC entry 2999 (class 0 OID 11065442)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 11065112)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55b9-ca14-f4a7-1a02e848ca9e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55b9-ca14-5c04-8bf8804683fc	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55b9-ca14-fcef-15b0f0659f73	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55b9-ca14-004c-6a3f0d904c86	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55b9-ca14-6b9c-bb1fc0c9e54c	planer	Planer dogodkov v koledarju	t
00020000-55b9-ca14-d6ad-72d37a336b23	kadrovska	Kadrovska služba	t
00020000-55b9-ca14-9550-9e7be733042e	arhivar	Ažuriranje arhivalij	t
00020000-55b9-ca14-051b-84b85ac99860	igralec	Igralec	t
00020000-55b9-ca14-e9e6-6c10afb67e9d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55b9-ca16-a9bd-06f3cc634db2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2965 (class 0 OID 11065096)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55b9-ca14-8422-b4d929463fd7	00020000-55b9-ca14-fcef-15b0f0659f73
00010000-55b9-ca14-b5f1-024045be19b3	00020000-55b9-ca14-fcef-15b0f0659f73
00010000-55b9-ca16-79f2-490bea35bf57	00020000-55b9-ca16-a9bd-06f3cc634db2
\.


--
-- TOC entry 3001 (class 0 OID 11065456)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 11065397)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 11065347)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 11065766)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55b9-ca15-9c04-3d0606bdfe57	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55b9-ca15-e303-2796dbf81feb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55b9-ca15-2a6c-07c7ef3928ff	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55b9-ca15-208f-2e775beac946	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55b9-ca15-5457-4810371efb28	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3023 (class 0 OID 11065758)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55b9-ca15-0aba-979779d9f3cd	00230000-55b9-ca15-208f-2e775beac946	popa
00240000-55b9-ca15-57a9-398d3fe2d8e8	00230000-55b9-ca15-208f-2e775beac946	oseba
00240000-55b9-ca15-9127-ed45e5f9bb23	00230000-55b9-ca15-e303-2796dbf81feb	prostor
00240000-55b9-ca15-caec-bad8097aba7b	00230000-55b9-ca15-208f-2e775beac946	besedilo
00240000-55b9-ca15-7089-600cd12a5305	00230000-55b9-ca15-208f-2e775beac946	uprizoritev
00240000-55b9-ca15-9d05-8a1053ed1b19	00230000-55b9-ca15-208f-2e775beac946	funkcija
00240000-55b9-ca15-d2ee-afb8afce3c8e	00230000-55b9-ca15-208f-2e775beac946	tipfunkcije
00240000-55b9-ca15-df93-9d53a3ccf2e1	00230000-55b9-ca15-208f-2e775beac946	alternacija
00240000-55b9-ca15-d28c-6dff8d63af40	00230000-55b9-ca15-9c04-3d0606bdfe57	pogodba
00240000-55b9-ca15-249c-e38f3f0b4d42	00230000-55b9-ca15-208f-2e775beac946	zaposlitev
00240000-55b9-ca15-d35c-68f238d5dcc7	00230000-55b9-ca15-9c04-3d0606bdfe57	programdela
00240000-55b9-ca15-2bb9-c5bfa33b0128	00230000-55b9-ca15-208f-2e775beac946	zapis
\.


--
-- TOC entry 3022 (class 0 OID 11065753)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 11065510)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55b9-ca16-a193-b14efe7398b3	000e0000-55b9-ca16-5f05-e3ce647073f5	00080000-55b9-ca16-14ab-81d30947d127	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55b9-ca16-58b8-65c225a5bf48	000e0000-55b9-ca16-5f05-e3ce647073f5	00080000-55b9-ca16-14ab-81d30947d127	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55b9-ca16-75a5-7612b25e9d04	000e0000-55b9-ca16-5f05-e3ce647073f5	00080000-55b9-ca16-cdfe-d67ef57330c3	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55b9-ca16-4595-4d88aae4e0ad	000e0000-55b9-ca16-5f05-e3ce647073f5	00080000-55b9-ca16-cdfe-d67ef57330c3	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2972 (class 0 OID 11065174)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 11065353)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55b9-ca16-783c-4c8afa8ed162	00180000-55b9-ca16-f224-884bdc4c315f	000c0000-55b9-ca16-84f5-cf6f7ab0b914	00090000-55b9-ca16-8cc9-eb338ab4cb09	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b9-ca16-b594-7069f83102c9	00180000-55b9-ca16-f224-884bdc4c315f	000c0000-55b9-ca16-372c-3df6b3430163	00090000-55b9-ca16-9e65-3dda2d4be6bd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b9-ca16-301b-1a5c57c9f9be	00180000-55b9-ca16-f224-884bdc4c315f	000c0000-55b9-ca16-4df1-4b7180c3d112	00090000-55b9-ca16-bd31-2baba0115943	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b9-ca16-ac80-01fa96b38583	00180000-55b9-ca16-f224-884bdc4c315f	000c0000-55b9-ca16-9ed6-cf697d993441	00090000-55b9-ca16-22f0-183fa0dddb05	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b9-ca16-854f-f40a8435c1b3	00180000-55b9-ca16-f224-884bdc4c315f	000c0000-55b9-ca16-0457-88ea8d13d776	00090000-55b9-ca16-bb59-4d11efa61e03	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55b9-ca16-599a-695ef77900d6	00180000-55b9-ca16-7972-3042d495b004	\N	00090000-55b9-ca16-bb59-4d11efa61e03	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3008 (class 0 OID 11065540)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55b9-ca15-2b2d-88674dfe2320	Igralec ali animator	Igralci in animatorji	Igralka ali animatorka	igralec
000f0000-55b9-ca15-fa4e-ed8d2a642bc5	Baletnik ali plesalec	Baletniki in plesalci	Baletnica ali plesalka	igralec
000f0000-55b9-ca15-41f3-ffb808aa1b2b	Avtor	Avtorji	Avtorka	umetnik
000f0000-55b9-ca15-68a7-daf0e016da8f	Režiser	Režiserji	Režiserka	umetnik
000f0000-55b9-ca15-1c5e-3eb9db4c9f45	Scenograf	Scenografi	Scenografka	tehnik
000f0000-55b9-ca15-fbaa-34c7801acfd8	Kostumograf	Kostumografi	Kostumografinja	tehnik
000f0000-55b9-ca15-6a7c-e18f32cb1b6b	Oblikovalec maske	Oblikovalci maske	Oblikovalka maske	tehnik
000f0000-55b9-ca15-3d77-1cd6ed9774bc	Avtor glasbe	Avtorji glasbe	Avtorica glasbe	umetnik
000f0000-55b9-ca15-8148-28b0584fb338	Oblikovalec svetlobe	Oblikovalci svetlobe	Oblikovalka svetlobe	tehnik
000f0000-55b9-ca15-e148-3f93c22c43fd	Koreograf	Koreografi	Koreografinja	umetnik
000f0000-55b9-ca15-b99b-d6ca9c8184fc	Dramaturg	Dramaturgi	Dramaturginja	umetnik
000f0000-55b9-ca15-b18b-80751dd880e8	Lektor	Lektorji	Lektorica	umetnik
000f0000-55b9-ca15-e03c-e7281ff3b8a6	Prevajalec	Prevajalci	Prevajalka	umetnik
000f0000-55b9-ca15-742f-6dd6417cffa6	Oblikovalec videa	Oblikovalci videa	Oblikovalka videa	umetnik
000f0000-55b9-ca15-162b-1c90148b4085	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijska ustvarjalka	umetnik
000f0000-55b9-ca15-a689-9911b00c1bb6	Nerazvrščeno	Nerazvrščeno	Nerazvrščeno	\N
000f0000-55b9-ca15-5e60-908b5c11b981	Inšpicient	Inšpicienti	Inšpicientka	inspicient
000f0000-55b9-ca15-dce0-ed1925b5eb6a	Šepetalec	Šepetalci	Šepetalka	sepetalec
000f0000-55b9-ca15-dc41-80e19dfd5e2b	Tehnični vodja	Tehnične vodje	Tehnični vodja	tehnik
\.


--
-- TOC entry 3020 (class 0 OID 11065735)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55b9-ca15-ceb3-fc0976a2c311	01	Velika predstava	f	1.00	1.00
002b0000-55b9-ca15-c40f-2ee9bcdbce27	02	Mala predstava	f	0.50	0.50
002b0000-55b9-ca15-b0fd-3e5aa72d4d17	03	Mala koprodukcija	t	0.40	1.00
002b0000-55b9-ca15-f702-0f773b3ea40a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55b9-ca15-3e62-bc17ea46b02c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2977 (class 0 OID 11065237)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 11065083)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55b9-ca14-b5f1-024045be19b3	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROT9P1zdu6pQxCjsqmCbTgJSHrYjvnPg2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-a6ac-cb8f01331d9e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-35ef-48e581e46844	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-5e99-c2cb00274211	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-85ce-649a0a8d0526	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-3810-e89565d5d7fd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-e772-19272c6a4232	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-01b8-427b8dfbaa59	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-db3b-e63679884553	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-186f-f4b476194e6c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55b9-ca16-79f2-490bea35bf57	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55b9-ca14-8422-b4d929463fd7	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3012 (class 0 OID 11065588)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55b9-ca16-6e81-bc596599d196	00160000-55b9-ca16-127a-d5ff6099c734	00150000-55b9-ca15-3cac-724cc083dd96	00140000-55b9-ca14-2513-1e493b13259b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55b9-ca16-136e-52b5fbaa163c
000e0000-55b9-ca16-5f05-e3ce647073f5	00160000-55b9-ca16-4db9-84373bdc0e40	00150000-55b9-ca15-d1f9-b41217c0b4a7	00140000-55b9-ca14-590f-ada87adcdcdd	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55b9-ca16-b56e-effb6381851c
000e0000-55b9-ca16-2b36-b38d197c97e2	\N	00150000-55b9-ca15-d1f9-b41217c0b4a7	00140000-55b9-ca14-590f-ada87adcdcdd	00190000-55b9-ca16-cc49-c4368e4e3746	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55b9-ca16-136e-52b5fbaa163c
000e0000-55b9-ca16-edb6-02d54814c4e6	\N	00150000-55b9-ca15-d1f9-b41217c0b4a7	00140000-55b9-ca14-590f-ada87adcdcdd	00190000-55b9-ca16-cc49-c4368e4e3746	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55b9-ca16-136e-52b5fbaa163c
000e0000-55b9-ca16-55a0-d2b91b5ce14f	\N	00150000-55b9-ca15-d1f9-b41217c0b4a7	00140000-55b9-ca14-590f-ada87adcdcdd	00190000-55b9-ca16-cc49-c4368e4e3746	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55b9-ca16-c20a-a9d47874f440
\.


--
-- TOC entry 2982 (class 0 OID 11065299)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55b9-ca16-185a-bdef2734e407	000e0000-55b9-ca16-5f05-e3ce647073f5	1	
00200000-55b9-ca16-d268-36f3d0ebeb97	000e0000-55b9-ca16-5f05-e3ce647073f5	2	
\.


--
-- TOC entry 2997 (class 0 OID 11065424)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 11065805)
-- Dependencies: 240
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 11065777)
-- Dependencies: 239
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 11065817)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 11065493)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55b9-ca16-49a8-a845044a6aa9	00090000-55b9-ca16-9e65-3dda2d4be6bd	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55b9-ca16-c93c-29b3834ea761	00090000-55b9-ca16-bd31-2baba0115943	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55b9-ca16-28f0-5ac65044313f	00090000-55b9-ca16-602e-be521160712e	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2984 (class 0 OID 11065331)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 11065578)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55b9-ca14-2513-1e493b13259b	01	Drama	drama (SURS 01)
00140000-55b9-ca14-4532-6bb73e413545	02	Opera	opera (SURS 02)
00140000-55b9-ca14-ca68-a977cbac253b	03	Balet	balet (SURS 03)
00140000-55b9-ca14-d81f-994c236d44a1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55b9-ca14-281c-e1c3c9ac6967	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55b9-ca14-590f-ada87adcdcdd	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55b9-ca14-4a14-29b5eac017af	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3003 (class 0 OID 11065483)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55b9-ca15-7796-b92062227a1a	01	Opera	opera
00150000-55b9-ca15-0728-1cac88e39ce5	02	Opereta	opereta
00150000-55b9-ca15-057e-7ed98d233e1a	03	Balet	balet
00150000-55b9-ca15-02e5-b759dfc01f3c	04	Plesne prireditve	plesne prireditve
00150000-55b9-ca15-a071-ac0a28e4fba7	05	Lutkovno gledališče	lutkovno gledališče
00150000-55b9-ca15-2baa-19408373b641	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55b9-ca15-0083-e555549d0844	07	Biografska drama	biografska drama
00150000-55b9-ca15-3cac-724cc083dd96	08	Komedija	komedija
00150000-55b9-ca15-ffb1-46e6381f3f41	09	Črna komedija	črna komedija
00150000-55b9-ca15-ba99-76d7d3a9808e	10	E-igra	E-igra
00150000-55b9-ca15-d1f9-b41217c0b4a7	11	Kriminalka	kriminalka
00150000-55b9-ca15-b580-cb5081e02e42	12	Musical	musical
\.


--
-- TOC entry 2509 (class 2606 OID 11065137)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 11065635)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 11065625)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 11065539)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 11065858)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 11065321)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 11065346)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 11065751)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 11065263)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 11065681)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 11065479)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 11065297)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 11065340)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 11065277)
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
-- TOC entry 2601 (class 2606 OID 11065389)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 11065834)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 11065841)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 11065866)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 11065416)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 11065235)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 11065146)
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
-- TOC entry 2516 (class 2606 OID 11065170)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 11065126)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2500 (class 2606 OID 11065111)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 11065422)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 11065455)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 11065573)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 11065199)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 11065223)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 11065395)
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
-- TOC entry 2531 (class 2606 OID 11065213)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 11065284)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 11065407)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 11065714)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 11065722)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 11065704)
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
-- TOC entry 2707 (class 2606 OID 11065733)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 11065439)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 11065380)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 11065371)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 11065561)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 11065507)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 11065082)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 11065446)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 11065100)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2502 (class 2606 OID 11065120)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 11065464)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 11065402)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 11065352)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 11065775)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 11065763)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 11065757)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 11065520)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 11065179)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 11065362)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 11065550)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 11065745)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 11065248)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 11065095)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 11065604)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 11065306)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 11065430)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 11065815)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 11065799)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 11065823)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 11065498)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 11065335)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 11065586)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 11065491)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 11065328)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2649 (class 1259 OID 11065521)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 11065522)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 11065836)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 11065835)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2523 (class 1259 OID 11065201)
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
-- TOC entry 2614 (class 1259 OID 11065423)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 11065803)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 11065802)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 11065804)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 11065801)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 11065800)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 11065409)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 11065408)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 11065307)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 11065480)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 11065482)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 11065481)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2548 (class 1259 OID 11065279)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 11065278)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 11065734)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2659 (class 1259 OID 11065575)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2660 (class 1259 OID 11065576)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2661 (class 1259 OID 11065577)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 11065824)
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
-- TOC entry 2668 (class 1259 OID 11065609)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2669 (class 1259 OID 11065606)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2670 (class 1259 OID 11065610)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2671 (class 1259 OID 11065608)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2672 (class 1259 OID 11065607)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2538 (class 1259 OID 11065250)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 11065249)
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
-- TOC entry 2514 (class 1259 OID 11065173)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 11065447)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2578 (class 1259 OID 11065341)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 11065127)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2505 (class 1259 OID 11065128)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 11065467)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 11065466)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 11065465)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2552 (class 1259 OID 11065285)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 11065287)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2554 (class 1259 OID 11065286)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2715 (class 1259 OID 11065765)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 11065375)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 11065373)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 11065372)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 11065374)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2495 (class 1259 OID 11065101)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 11065102)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 11065431)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 11065859)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2746 (class 1259 OID 11065867)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 11065868)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 11065396)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 11065508)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 11065509)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 11065686)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2690 (class 1259 OID 11065685)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2691 (class 1259 OID 11065682)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 11065683)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2693 (class 1259 OID 11065684)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 11065215)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2528 (class 1259 OID 11065214)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2529 (class 1259 OID 11065216)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2488 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2697 (class 1259 OID 11065715)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2698 (class 1259 OID 11065716)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2682 (class 1259 OID 11065639)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2683 (class 1259 OID 11065637)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2684 (class 1259 OID 11065638)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 11065499)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 11065384)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 11065383)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 11065381)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 11065382)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2466 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2678 (class 1259 OID 11065627)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2679 (class 1259 OID 11065626)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2694 (class 1259 OID 11065705)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2559 (class 1259 OID 11065298)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2712 (class 1259 OID 11065752)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 11065842)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 11065843)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2510 (class 1259 OID 11065148)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2511 (class 1259 OID 11065147)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2519 (class 1259 OID 11065180)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 11065181)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2583 (class 1259 OID 11065365)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 11065364)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 11065363)
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
-- TOC entry 2566 (class 1259 OID 11065330)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 11065326)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2568 (class 1259 OID 11065323)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 11065324)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 11065322)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 11065327)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2572 (class 1259 OID 11065325)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2526 (class 1259 OID 11065200)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2544 (class 1259 OID 11065264)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2545 (class 1259 OID 11065266)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2546 (class 1259 OID 11065265)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2547 (class 1259 OID 11065267)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 11065390)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 11065574)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 11065605)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2517 (class 1259 OID 11065171)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2518 (class 1259 OID 11065172)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 11065492)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 11065776)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 11065236)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2718 (class 1259 OID 11065764)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2622 (class 1259 OID 11065441)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 11065440)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2685 (class 1259 OID 11065636)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 11065640)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2469 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 11065224)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 11065587)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 11065816)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2703 (class 1259 OID 11065723)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 11065724)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 11065121)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2573 (class 1259 OID 11065329)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2775 (class 2606 OID 11066004)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2778 (class 2606 OID 11065989)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 11065994)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2773 (class 2606 OID 11066014)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2779 (class 2606 OID 11065984)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2774 (class 2606 OID 11066009)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2776 (class 2606 OID 11065999)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 11066159)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 11066164)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 11066334)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2843 (class 2606 OID 11066329)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 11065919)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2796 (class 2606 OID 11066099)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2837 (class 2606 OID 11066314)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2838 (class 2606 OID 11066309)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2836 (class 2606 OID 11066319)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2839 (class 2606 OID 11066304)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2840 (class 2606 OID 11066299)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2794 (class 2606 OID 11066094)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2795 (class 2606 OID 11066089)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2772 (class 2606 OID 11065979)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2804 (class 2606 OID 11066129)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2802 (class 2606 OID 11066139)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2803 (class 2606 OID 11066134)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2766 (class 2606 OID 11065954)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 11065949)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2792 (class 2606 OID 11066079)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2833 (class 2606 OID 11066284)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2812 (class 2606 OID 11066169)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2811 (class 2606 OID 11066174)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 11066179)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2841 (class 2606 OID 11066324)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2814 (class 2606 OID 11066199)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2817 (class 2606 OID 11066184)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2813 (class 2606 OID 11066204)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2815 (class 2606 OID 11066194)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2816 (class 2606 OID 11066189)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2764 (class 2606 OID 11065944)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 11065939)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 11065904)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 11065899)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2798 (class 2606 OID 11066109)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2780 (class 2606 OID 11066019)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 11065879)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2752 (class 2606 OID 11065884)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 11066124)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2800 (class 2606 OID 11066119)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2801 (class 2606 OID 11066114)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2770 (class 2606 OID 11065959)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 11065969)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2769 (class 2606 OID 11065964)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2835 (class 2606 OID 11066294)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2784 (class 2606 OID 11066054)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2786 (class 2606 OID 11066044)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2787 (class 2606 OID 11066039)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2785 (class 2606 OID 11066049)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 11065869)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2750 (class 2606 OID 11065874)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2797 (class 2606 OID 11066104)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2846 (class 2606 OID 11066349)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 11066354)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2847 (class 2606 OID 11066359)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2793 (class 2606 OID 11066084)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2807 (class 2606 OID 11066149)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2806 (class 2606 OID 11066154)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2824 (class 2606 OID 11066259)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2825 (class 2606 OID 11066254)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2828 (class 2606 OID 11066239)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2827 (class 2606 OID 11066244)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2826 (class 2606 OID 11066249)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2762 (class 2606 OID 11065929)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 11065924)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 11065934)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 11066269)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2830 (class 2606 OID 11066274)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2821 (class 2606 OID 11066229)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 11066234)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2823 (class 2606 OID 11066219)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2822 (class 2606 OID 11066224)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2805 (class 2606 OID 11066144)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 11066074)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2789 (class 2606 OID 11066069)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2791 (class 2606 OID 11066059)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2790 (class 2606 OID 11066064)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2818 (class 2606 OID 11066214)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2819 (class 2606 OID 11066209)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2829 (class 2606 OID 11066264)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2771 (class 2606 OID 11065974)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2832 (class 2606 OID 11066279)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 11066289)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2845 (class 2606 OID 11066339)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2844 (class 2606 OID 11066344)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2754 (class 2606 OID 11065894)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 11065889)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 11065909)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2758 (class 2606 OID 11065914)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 11066034)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2782 (class 2606 OID 11066029)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 11066024)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-30 08:54:15 CEST

--
-- PostgreSQL database dump complete
--

