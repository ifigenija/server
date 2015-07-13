--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-13 09:24:20 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 238 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 9779636)
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
-- TOC entry 228 (class 1259 OID 9780134)
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
-- TOC entry 227 (class 1259 OID 9780117)
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
-- TOC entry 221 (class 1259 OID 9780030)
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
    letoizida date,
    krajizida date,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 9779815)
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
-- TOC entry 200 (class 1259 OID 9779849)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9780247)
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
-- TOC entry 192 (class 1259 OID 9779758)
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
-- TOC entry 229 (class 1259 OID 9780147)
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
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stzaposumet integer DEFAULT 0 NOT NULL,
    stzaposdrug integer DEFAULT 0 NOT NULL,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
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
    odkup numeric(15,2) DEFAULT NULL::numeric,
    naslovpe character varying(255) DEFAULT NULL::character varying,
    avtorpe character varying(255) DEFAULT NULL::character varying,
    obsegpe character varying(255) DEFAULT NULL::character varying,
    mesecpe character varying(255) DEFAULT NULL::character varying,
    vrednostpe numeric(15,2) DEFAULT 0::numeric,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
    stpredstav integer,
    stpredavanj integer,
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
-- TOC entry 216 (class 1259 OID 9779975)
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
-- TOC entry 195 (class 1259 OID 9779795)
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
-- TOC entry 199 (class 1259 OID 9779843)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9779775)
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
-- TOC entry 205 (class 1259 OID 9779892)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9779917)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9779732)
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
-- TOC entry 184 (class 1259 OID 9779645)
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
-- TOC entry 185 (class 1259 OID 9779656)
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
-- TOC entry 180 (class 1259 OID 9779610)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9779629)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9779924)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9779955)
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
-- TOC entry 224 (class 1259 OID 9780068)
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
    opis text
);


--
-- TOC entry 187 (class 1259 OID 9779689)
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
-- TOC entry 189 (class 1259 OID 9779724)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9779898)
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
-- TOC entry 188 (class 1259 OID 9779709)
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
-- TOC entry 194 (class 1259 OID 9779787)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9779910)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9780217)
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
-- TOC entry 232 (class 1259 OID 9780228)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9780198)
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
-- TOC entry 212 (class 1259 OID 9779939)
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
-- TOC entry 204 (class 1259 OID 9779883)
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
-- TOC entry 203 (class 1259 OID 9779873)
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
-- TOC entry 223 (class 1259 OID 9780057)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9780007)
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
-- TOC entry 177 (class 1259 OID 9779581)
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
-- TOC entry 176 (class 1259 OID 9779579)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 9779949)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9779619)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9779603)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9779963)
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
-- TOC entry 207 (class 1259 OID 9779904)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9779854)
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
-- TOC entry 237 (class 1259 OID 9780267)
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
-- TOC entry 236 (class 1259 OID 9780259)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9780254)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9780017)
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
-- TOC entry 186 (class 1259 OID 9779681)
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
-- TOC entry 202 (class 1259 OID 9779860)
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
-- TOC entry 222 (class 1259 OID 9780046)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    nastopajoc boolean,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 9780236)
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
-- TOC entry 191 (class 1259 OID 9779744)
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
-- TOC entry 178 (class 1259 OID 9779590)
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
-- TOC entry 226 (class 1259 OID 9780094)
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
-- TOC entry 196 (class 1259 OID 9779806)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9779931)
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
-- TOC entry 218 (class 1259 OID 9780000)
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
-- TOC entry 198 (class 1259 OID 9779838)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9780084)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9779990)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9779584)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9779636)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9780134)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a3-67a3-4dc0-e6901f92e02e	000d0000-55a3-67a3-8639-2581fa445d0e	\N	00090000-55a3-67a3-d7c9-c5b699ac065d	\N	0001	f	\N	\N	\N	3	\N	\N	f	t
000c0000-55a3-67a3-2d4e-9ec2ef734b08	000d0000-55a3-67a3-01c3-b5295c3bed12	\N	00090000-55a3-67a3-d2fe-fd226f62e91c	\N	0002	f	\N	\N	\N	8	\N	\N	f	f
000c0000-55a3-67a3-3851-939285e1b454	000d0000-55a3-67a3-71df-f0a71ab53c27	\N	00090000-55a3-67a3-8db3-975dd95e51b9	\N	0003	f	\N	\N	\N	2	\N	\N	f	f
000c0000-55a3-67a3-ebf5-a87852404a57	000d0000-55a3-67a3-1219-795e9dfb130b	\N	00090000-55a3-67a3-9758-c336f52c2a2a	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a3-67a3-ca30-ba34c465ebe2	000d0000-55a3-67a3-61ce-43f02574e983	\N	00090000-55a3-67a3-a8d2-c9a283cdf55c	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a3-67a3-d9fb-1af7dde65678	000d0000-55a3-67a3-010e-969aae2d30bc	\N	00090000-55a3-67a3-3185-e88833bc594f	\N	0006	f	\N	\N	\N	1	\N	\N	f	t
000c0000-55a3-67a3-25ce-b4e0753d2142	000d0000-55a3-67a3-27e2-7b28362d10c9	\N	00090000-55a3-67a3-ea4f-87f2e5851c90	\N	0007	f	\N	\N	\N	14	\N	\N	f	t
000c0000-55a3-67a3-ecc5-e1964537222c	000d0000-55a3-67a3-cc09-eface56155dc	\N	00090000-55a3-67a3-8474-0e980319cceb	\N	0008	f	\N	\N	\N	12	\N	\N	f	t
\.


--
-- TOC entry 2902 (class 0 OID 9780117)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9780030)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a3-67a2-15b2-62817b2cef33	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a3-67a2-f9f4-1ff8e4c55433	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a3-67a2-513e-41b5606dc009	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9779815)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a3-67a3-7980-1884dc5a2798	\N	\N	00200000-55a3-67a3-0138-884611627750	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a3-67a3-cef7-6066dd23c34c	\N	\N	00200000-55a3-67a3-2c27-c229e3b0dfab	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a3-67a3-f402-434801079628	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a3-67a3-e05a-a0e3abcad217	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a3-67a3-8647-615bf9adcbab	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9779849)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9780247)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9779758)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a3-679f-8869-1ab87ef1890c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a3-679f-dd90-6d72557aa1a4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a3-679f-f2fb-f7960221dcc8	AL	ALB	008	Albania 	Albanija	\N
00040000-55a3-679f-5de3-97a4cb358575	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a3-679f-11e3-d13876b24dbe	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a3-679f-09a7-c54672b5967b	AD	AND	020	Andorra 	Andora	\N
00040000-55a3-679f-74f0-d55b5f0a88e1	AO	AGO	024	Angola 	Angola	\N
00040000-55a3-679f-9a9a-2e25fff4dfdd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a3-679f-bcf4-6175226af6c4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a3-679f-11a8-0315bc3c1fe7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a3-679f-e7c7-8fad12d2abd6	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a3-679f-b28c-60b189fd681e	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a3-679f-c6d8-99970a9781c3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a3-679f-838c-c2daa0b355dc	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a3-679f-2278-47bd4e37525c	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a3-679f-43f3-3c6492997962	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a3-679f-5be3-b309643f999d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a3-679f-b260-286754d5662a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a3-679f-2d1e-63b7b8dc93cc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a3-679f-452d-655cdec5b785	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a3-679f-0c3f-39724ef215d5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a3-679f-17be-9b9987537a36	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a3-679f-499f-770fed6d83ae	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a3-679f-341c-fa2ca4a2dbcc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a3-679f-ae82-90f6cac550c4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a3-679f-1058-a3b43b1d698b	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a3-679f-3a4e-2342a6582449	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a3-679f-3bc8-7809f38fb497	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a3-679f-5316-3f3b6c2d0704	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a3-679f-ef06-44ad11107545	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a3-679f-25aa-f4a78778ec25	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a3-679f-9ea9-5130b0105288	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a3-679f-8d39-61bec989013b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a3-679f-7a06-d977adefcf01	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a3-679f-d39b-3cd6a3f3ab2d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a3-679f-9924-1de3a40dffa4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a3-679f-fcf7-009af8325b48	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a3-679f-8aa9-a57a3df7ff39	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a3-679f-2ef5-b2cda18c36ee	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a3-679f-b17f-7f2ea8225f4b	CA	CAN	124	Canada 	Kanada	\N
00040000-55a3-679f-eb7b-81f79e9eb268	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a3-679f-9b90-b17ff4ca427d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a3-679f-b08b-6cd1f035698a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a3-679f-101f-60c6ba4ba04c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a3-679f-1228-cea9d8573bee	CL	CHL	152	Chile 	Čile	\N
00040000-55a3-679f-82dd-f0669e27c1b7	CN	CHN	156	China 	Kitajska	\N
00040000-55a3-679f-e339-18bc6c61c4cb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a3-679f-c989-7ef11f26f9c4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a3-679f-4f4c-7546d3069978	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a3-679f-5ab7-2560aaffc473	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a3-679f-7e17-96a14ac11d30	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a3-679f-14ef-947bc23a461f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a3-679f-329e-cc2a94097f1a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a3-679f-f1bd-0fcb3643dba6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a3-679f-779b-96a63d64294e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a3-679f-e357-eaab72b9dc87	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a3-679f-df27-eb6f70d69b97	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a3-679f-3dea-e9d153c0c25b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a3-679f-fa5c-ea37fab9dd0f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a3-679f-ca39-c54b35c61cec	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a3-679f-bb55-23a2ac0611cf	DK	DNK	208	Denmark 	Danska	\N
00040000-55a3-679f-ade2-a3b2ccc122d5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a3-679f-b20e-943fbff481a6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a3-679f-ca38-f6b0a59e6f2f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a3-679f-f2f1-64eb2acaf64a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a3-679f-e86c-faac9e15f633	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a3-679f-cad3-edf7f5f48e7b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a3-679f-109b-70f735032967	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a3-679f-20e1-ea9bfae359b3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a3-679f-4a45-2bd5bd558c8a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a3-679f-ba38-f69ff163c189	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a3-679f-ed2f-05fff445672f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a3-679f-ad70-80fe2f6ac952	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a3-679f-2995-39c9fc0fa259	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a3-679f-1066-a26c25bf135f	FI	FIN	246	Finland 	Finska	\N
00040000-55a3-679f-05f9-b383bae22c05	FR	FRA	250	France 	Francija	\N
00040000-55a3-679f-46d1-e5a490c9467f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a3-679f-bdea-8278d85a0522	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a3-679f-d329-69a44e0084ed	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a3-679f-8706-d2e89fb351fc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a3-679f-6175-ada8eb921e4a	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a3-679f-7a3e-4a07971468ea	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a3-679f-5900-3719a793ae62	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a3-679f-e877-e4567ddce82d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a3-679f-06dd-501a1c899210	GH	GHA	288	Ghana 	Gana	\N
00040000-55a3-679f-20be-8ca406c19204	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a3-679f-16e5-e9378e1979fd	GR	GRC	300	Greece 	Grčija	\N
00040000-55a3-679f-24bf-bd64c2fdf762	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a3-679f-f777-8d4c74a18e61	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a3-679f-a8a4-b3891a07529c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a3-679f-57ee-64030cced91a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a3-679f-8f7e-c9fb912651f9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a3-679f-93fb-7c68ff5b4067	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a3-679f-98a5-f5ee34ff7d66	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a3-679f-50e3-efbdb0f4abf1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a3-679f-e31e-26b091305e03	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a3-679f-bf5b-21c0e012e021	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a3-679f-669e-ce95fe863a00	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a3-679f-2fab-54c83f34f5eb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a3-679f-ffbe-f57d3ab14c57	HN	HND	340	Honduras 	Honduras	\N
00040000-55a3-679f-ce13-09799033e6a2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a3-679f-3d44-e33d891198d7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a3-679f-0eea-f6d5705dde5c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a3-679f-a4c7-a2dab28b01ca	IN	IND	356	India 	Indija	\N
00040000-55a3-679f-83e6-9fedaaf80832	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a3-679f-33c5-28bb3bdae002	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a3-679f-a40d-8fc30608f1f1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a3-679f-cd9c-fd3e1e918ce0	IE	IRL	372	Ireland 	Irska	\N
00040000-55a3-679f-4245-7fdb370fbfb1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a3-679f-e4b3-ff349c0f0fce	IL	ISR	376	Israel 	Izrael	\N
00040000-55a3-679f-a535-dd149f0a7e66	IT	ITA	380	Italy 	Italija	\N
00040000-55a3-679f-801e-2db05294b5fc	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a3-679f-c894-7194698c598c	JP	JPN	392	Japan 	Japonska	\N
00040000-55a3-679f-e3d6-bace23898cc7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a3-679f-16ce-fa3b70b1a32f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a3-679f-916c-158c18e02f64	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a3-679f-038b-0d14db3cd797	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a3-679f-b2f9-ae00db412d7d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a3-679f-72ba-f82f945f9750	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a3-679f-e119-98d1ab2c0466	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a3-679f-0cc6-b449580e628c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a3-679f-fb69-e72110bea53d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a3-679f-0f86-7a7154f044aa	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a3-679f-0845-cc47bb142a14	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a3-679f-9990-5af2024c98d3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a3-679f-7c22-1bf8dc9575c4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a3-679f-c6b0-7d4d3f915c0f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a3-679f-b5d3-74d398ef1f37	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a3-679f-1078-4539db21ed51	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a3-679f-f32d-61398beabdfb	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a3-679f-319b-c48bb0a0bb9d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a3-679f-e87c-7425f8fafc2c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a3-679f-c357-7e7c1b68ccbd	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a3-679f-190e-08aef4eb1a9d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a3-679f-f865-e61c40f07466	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a3-679f-a140-ad314b4c4336	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a3-679f-075e-c7bfd2ccc84c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a3-679f-b99a-6a42358b127a	ML	MLI	466	Mali 	Mali	\N
00040000-55a3-679f-6258-8fda1db8ba33	MT	MLT	470	Malta 	Malta	\N
00040000-55a3-679f-9557-64eafdae8565	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a3-679f-de41-d087c64561d9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a3-679f-cacc-27fbe79a0f21	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a3-679f-5257-eeafd0c2e205	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a3-679f-f8cf-6c134ecb8515	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a3-679f-72e0-abde36e2c43c	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a3-679f-9f67-3cbcd448950e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a3-679f-7c4b-9cf89ec72c11	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a3-679f-d049-c9d290026a21	MC	MCO	492	Monaco 	Monako	\N
00040000-55a3-679f-b91b-152eb06782cf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a3-679f-16eb-e2782818d7cf	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a3-679f-8d19-92e724d8ea20	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a3-679f-ded6-e9f23b4491e0	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a3-679f-6e57-5a6cf7bf8448	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a3-679f-b4b2-8c473c174d7f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a3-679f-d3a7-37b3361a1cc2	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a3-679f-4d52-5b286d4cd2bb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a3-679f-766a-5767bbe25c8c	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a3-679f-1737-81c012feb8f9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a3-679f-ed85-eabaff981350	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a3-679f-1c5b-9eb3ac24dc9b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a3-679f-1fb1-414bda096a5c	NE	NER	562	Niger 	Niger 	\N
00040000-55a3-679f-42b1-8fd9208a43fd	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a3-679f-baba-c1a271d7dadd	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a3-679f-01f3-4375c1665737	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a3-679f-ccd9-c5d4e0ae9ca0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a3-679f-1563-9785534ff2c6	NO	NOR	578	Norway 	Norveška	\N
00040000-55a3-679f-982f-100755a82a46	OM	OMN	512	Oman 	Oman	\N
00040000-55a3-679f-c645-6564c3b17249	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a3-679f-81d0-1adf4a04be0f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a3-679f-49c5-37a7657a9cd0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a3-679f-40fa-6f8b973255dd	PA	PAN	591	Panama 	Panama	\N
00040000-55a3-679f-6e09-c76c5cc07479	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a3-679f-2969-86ef651990dc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a3-679f-8b37-d163ed7cc51c	PE	PER	604	Peru 	Peru	\N
00040000-55a3-679f-5cbf-fdd6bd1d2395	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a3-679f-6fd0-a459f2bf4bd0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a3-679f-41bb-0149d7e01910	PL	POL	616	Poland 	Poljska	\N
00040000-55a3-679f-e1eb-5a51f241a04c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a3-679f-c5e1-dfbb5a52e09e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a3-679f-75c4-1cf616153f8e	QA	QAT	634	Qatar 	Katar	\N
00040000-55a3-679f-2879-9ce507f91dc3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a3-679f-c736-dc90b4ec486c	RO	ROU	642	Romania 	Romunija	\N
00040000-55a3-679f-7e60-12e59a92382e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a3-679f-15a6-74994ff4c801	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a3-679f-9c8e-0563f2b2f16c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a3-679f-b285-4817d9a096c5	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a3-679f-491e-b81daea7ab7e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a3-679f-4f32-fc97f28bcd98	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a3-67a0-1532-bf571a9d0af1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a3-67a0-b2c9-332b9aea2baa	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a3-67a0-e261-84572c171ca2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a3-67a0-b05c-d7b63c962cb9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a3-67a0-038b-d84ee609ea73	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a3-67a0-cd9f-264bdbedf451	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a3-67a0-d86b-4108d7b3675c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a3-67a0-31e2-8af76601c4ec	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a3-67a0-ccc1-485881b69097	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a3-67a0-3651-2aa729e8e074	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a3-67a0-73db-04afea1affa8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a3-67a0-c3e6-e554016f4953	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a3-67a0-6d71-fe0ea3a1282d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a3-67a0-e68e-6a093246e81c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a3-67a0-4392-d676eb6cc2dc	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a3-67a0-c16d-ce58e1b4d678	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a3-67a0-5295-56d3acfb7fd8	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a3-67a0-ca45-abe4ee2dee23	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a3-67a0-cb80-3463f8189476	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a3-67a0-ab41-6e7c68d99109	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a3-67a0-7b2b-cc06c5929ee6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a3-67a0-c8e1-1887a95d346e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a3-67a0-9e94-4756f5d3fdd7	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a3-67a0-3067-2b6b1f479d99	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a3-67a0-201a-adf924ca05a8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a3-67a0-0415-80fd30594f3e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a3-67a0-76a3-1f0df79f4774	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a3-67a0-2996-56d97540fafb	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a3-67a0-5dfe-bb5cce1fd73b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a3-67a0-4646-9c13d19471ce	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a3-67a0-6e47-919e59c40f41	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a3-67a0-3109-d2ec7f88c2ae	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a3-67a0-1ea6-d763d2dbb2e1	TH	THA	764	Thailand 	Tajska	\N
00040000-55a3-67a0-dc22-6ec0cfcab787	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a3-67a0-c0c1-ceecdf52ff70	TG	TGO	768	Togo 	Togo	\N
00040000-55a3-67a0-0858-d8f45d28ec8c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a3-67a0-cb27-24287ae9d469	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a3-67a0-6120-99ca691ef11a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a3-67a0-3812-b426f46994b9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a3-67a0-ee6a-315be15323fc	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a3-67a0-659f-9c5af44116c5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a3-67a0-8dfe-ad637a4840b8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a3-67a0-47f5-f1cc51d75314	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a3-67a0-b06a-6d59c4d1e069	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a3-67a0-0cf7-580c42ddb45b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a3-67a0-ae97-ed0c80690e45	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a3-67a0-30e3-363ed9a5ed3b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a3-67a0-000f-280380da0f3d	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a3-67a0-2e60-f7b399e8fb83	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a3-67a0-f821-cbda93cb03fa	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a3-67a0-19d7-d546dd2acadd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a3-67a0-3297-70fd97f11676	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a3-67a0-df29-9b7a044d3768	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a3-67a0-ff4e-8298bfa2569c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a3-67a0-e6a6-b8c3730f1fe5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a3-67a0-6213-38ea99630130	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a3-67a0-33ab-0ae0babb500f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a3-67a0-4366-976e7943308c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a3-67a0-26e1-a1e100c02ded	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a3-67a0-9854-51a6f4cbd0b3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a3-67a0-936a-b914338c5d87	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9780147)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a3-67a3-b102-ea7b2f581fe0	000e0000-55a3-67a3-6bca-db6249fd6d09	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-55a3-67a1-392c-af06443f5761	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a3-67a3-5bc8-0b2648b994b2	000e0000-55a3-67a3-7840-45670088eb7a	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a3-67a1-4935-4746bf48e48d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9779975)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a3-67a3-27e2-7b28362d10c9	000e0000-55a3-67a3-7840-45670088eb7a	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a3-67a1-0a4a-dad53278be58
000d0000-55a3-67a3-8639-2581fa445d0e	000e0000-55a3-67a3-7840-45670088eb7a	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a3-67a1-0a4a-dad53278be58
000d0000-55a3-67a3-01c3-b5295c3bed12	000e0000-55a3-67a3-7840-45670088eb7a	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a3-67a1-f53c-2e6ac21fa69b
000d0000-55a3-67a3-71df-f0a71ab53c27	000e0000-55a3-67a3-7840-45670088eb7a	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a3-67a1-1c50-ad4d8b925dd3
000d0000-55a3-67a3-1219-795e9dfb130b	000e0000-55a3-67a3-7840-45670088eb7a	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a3-67a1-1c50-ad4d8b925dd3
000d0000-55a3-67a3-61ce-43f02574e983	000e0000-55a3-67a3-7840-45670088eb7a	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a3-67a1-1c50-ad4d8b925dd3
000d0000-55a3-67a3-010e-969aae2d30bc	000e0000-55a3-67a3-7840-45670088eb7a	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a3-67a1-0a4a-dad53278be58
000d0000-55a3-67a3-cc09-eface56155dc	000e0000-55a3-67a3-7840-45670088eb7a	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a3-67a1-f92d-6be66fa0d3bf
\.


--
-- TOC entry 2870 (class 0 OID 9779795)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9779843)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9779775)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a3-67a3-df5c-7915d566fe44	00080000-55a3-67a2-0d07-164bcbec4820	00090000-55a3-67a3-d7c9-c5b699ac065d	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9779892)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9779917)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9779732)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a3-67a0-3ef6-4f5715447607	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a3-67a0-8d44-42ba7ccf2c40	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a3-67a0-6887-401f7fa6c681	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a3-67a0-e7e6-daab22a33d57	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a3-67a0-3609-29b1940291de	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a3-67a0-6902-92fd3a252354	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a3-67a0-7ffd-71199128d5d1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a3-67a0-10c4-5005ea09db52	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a3-67a0-6273-95616a5e2b20	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a3-67a0-7188-77edd55156c3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a3-67a0-2f7a-0f67cd3d2768	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a3-67a0-88f9-3f5b2173da86	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a3-67a0-1dde-21ca41ad0ed3	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-55a3-67a2-257a-1232178b395d	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a3-67a2-cc41-af25edbe6112	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a3-67a2-825b-e9d7f153a1fc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a3-67a2-2e95-853268d5d454	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a3-67a2-d3d9-91641a59e9ba	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a3-67a2-d6db-f467375a210e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9779645)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a3-67a2-76ef-f17bdf1418cf	00000000-55a3-67a2-cc41-af25edbe6112	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a3-67a2-a449-cff74aed7053	00000000-55a3-67a2-cc41-af25edbe6112	00010000-55a3-67a0-cb3f-fe852ab1b68f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a3-67a2-4eb5-306fb3b69f06	00000000-55a3-67a2-825b-e9d7f153a1fc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9779656)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a3-67a3-8670-669e47b2ae66	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a3-67a3-9758-c336f52c2a2a	00010000-55a3-67a3-78e7-cf2b14dca7be	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a3-67a3-8db3-975dd95e51b9	00010000-55a3-67a3-c246-e6b02e0ec1bc	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a3-67a3-6e12-8887c0b98263	00010000-55a3-67a3-8c66-7763a76620ce	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a3-67a3-b569-59404bae88f4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a3-67a3-3185-e88833bc594f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a3-67a3-5f63-7820bf333d64	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a3-67a3-ea4f-87f2e5851c90	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a3-67a3-d7c9-c5b699ac065d	00010000-55a3-67a3-c213-c644ba7e642c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a3-67a3-d2fe-fd226f62e91c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a3-67a3-2930-fc0c86e25b96	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a3-67a3-a8d2-c9a283cdf55c	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a3-67a3-8474-0e980319cceb	00010000-55a3-67a3-cb72-e0d747caa00f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9779610)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a3-67a0-6dd5-2c033aa5cdda	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a3-67a0-66f5-a2ad8b7332ab	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a3-67a0-a9d8-a067aa263137	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a3-67a0-3de7-90adb731539b	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a3-67a0-d004-09059e3a18a4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a3-67a0-a892-4fb1144bf1f8	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a3-67a0-a45a-b51e121360b9	Abonma-read	Abonma - branje	f
00030000-55a3-67a0-852c-f08f7cae6e8f	Abonma-write	Abonma - spreminjanje	f
00030000-55a3-67a0-8f81-81ebd13c816c	Alternacija-read	Alternacija - branje	f
00030000-55a3-67a0-ab83-7f9138882cf3	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a3-67a0-eb2f-e593334c8979	Arhivalija-read	Arhivalija - branje	f
00030000-55a3-67a0-0c6f-886b46a1908a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a3-67a0-5deb-7ad027acaddd	Besedilo-read	Besedilo - branje	f
00030000-55a3-67a0-132a-aa8bb6d5108e	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a3-67a0-1096-28410a4775bd	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a3-67a0-917b-1e7069c75787	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a3-67a0-5b3d-5ecd42714c38	Dogodek-read	Dogodek - branje	f
00030000-55a3-67a0-3626-6dced50caa20	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a3-67a0-6c9c-a2ecd491d50b	DrugiVir-read	DrugiVir - branje	f
00030000-55a3-67a0-ca0f-8e927d9c64d7	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a3-67a0-e24e-518a1719cf7b	Drzava-read	Drzava - branje	f
00030000-55a3-67a0-d5a7-325c01531564	Drzava-write	Drzava - spreminjanje	f
00030000-55a3-67a0-f63e-5e2baf908698	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a3-67a0-884c-e8e2e9a9225d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a3-67a0-7fe3-297936ee12d0	Funkcija-read	Funkcija - branje	f
00030000-55a3-67a0-f478-3d6caa5d7040	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a3-67a0-fdb2-c376f647e6d8	Gostovanje-read	Gostovanje - branje	f
00030000-55a3-67a0-606f-651e6aa486f1	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a3-67a0-67f3-7a87ce709313	Gostujoca-read	Gostujoca - branje	f
00030000-55a3-67a0-ee64-21cc514d32ad	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a3-67a0-1e59-eb4f0bea3089	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a3-67a0-cd04-7baf469d3fcd	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a3-67a0-8cb1-c309403f675e	Kupec-read	Kupec - branje	f
00030000-55a3-67a0-3b78-97d8569e8112	Kupec-write	Kupec - spreminjanje	f
00030000-55a3-67a0-639b-953447654241	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a3-67a0-64d8-2e6727c65a6d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a3-67a0-8392-7e0793e59a23	Option-read	Option - branje	f
00030000-55a3-67a0-989f-4504c9317e67	Option-write	Option - spreminjanje	f
00030000-55a3-67a0-b625-7621d0286147	OptionValue-read	OptionValue - branje	f
00030000-55a3-67a0-b59b-622a4e448e3f	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a3-67a0-b48d-05c6892f210b	Oseba-read	Oseba - branje	f
00030000-55a3-67a0-b037-61176d69934d	Oseba-write	Oseba - spreminjanje	f
00030000-55a3-67a0-ec12-55f9f4d45c01	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a3-67a0-5742-bebbff3e52e7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a3-67a0-b5f5-7a8b8414917b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a3-67a0-be87-7132ccb6efff	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a3-67a0-44ac-2f764ca1ce30	Pogodba-read	Pogodba - branje	f
00030000-55a3-67a0-1bc1-d51353bb982a	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a3-67a0-31e2-2734b15a821c	Popa-read	Popa - branje	f
00030000-55a3-67a0-cbbc-122884cb2aa0	Popa-write	Popa - spreminjanje	f
00030000-55a3-67a0-d61f-1f0b2f71c20f	Posta-read	Posta - branje	f
00030000-55a3-67a0-5f9e-b254c31cdf6f	Posta-write	Posta - spreminjanje	f
00030000-55a3-67a0-15e1-906f303c462b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a3-67a0-1a93-f2c7c1c4b93d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a3-67a0-23c6-1e930dfe157f	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a3-67a0-7193-1f3858c68081	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a3-67a0-9b4d-84c0d4bd8901	Predstava-read	Predstava - branje	f
00030000-55a3-67a0-6dd1-d5b2179d787e	Predstava-write	Predstava - spreminjanje	f
00030000-55a3-67a0-10fe-bc16df0d86f9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a3-67a0-6045-b3f3569a2044	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a3-67a0-22c0-598670b7e2ef	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a3-67a0-9fe4-0d1c6d1975f1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a3-67a0-0950-83c883bf897b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a3-67a0-b178-5cca2582c605	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a3-67a0-35c7-93f394346741	ProgramDela-read	ProgramDela - branje	f
00030000-55a3-67a0-de5b-19040a1d159b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a3-67a0-f8bd-8a5bbe0d2698	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a3-67a0-2a9b-825461662784	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a3-67a0-176d-c8479bbeaeeb	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a3-67a0-0a9e-e6cb6d2539b6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a3-67a0-9efb-e7519c3c2619	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a3-67a0-3f68-2eb5fac82b75	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a3-67a0-90dd-920f38955e05	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a3-67a0-00fa-dfbd81ea29de	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a3-67a0-222d-9eae736f1e2e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a3-67a0-db23-5f9efb5c1e8f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a3-67a0-8241-6cb59681eff4	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a3-67a0-7b54-d56210be489e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a3-67a0-eec2-b0f808f09b11	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a3-67a0-074b-01153a6aef16	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a3-67a0-96ec-58062096e11c	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a3-67a0-4bc7-81b23f12ce87	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a3-67a0-4f68-7a6c7f6f336d	Prostor-read	Prostor - branje	f
00030000-55a3-67a0-7987-c9ab3b1cc72b	Prostor-write	Prostor - spreminjanje	f
00030000-55a3-67a0-392c-331dcbec1f8a	Racun-read	Racun - branje	f
00030000-55a3-67a0-74cb-e78372cd1f12	Racun-write	Racun - spreminjanje	f
00030000-55a3-67a0-36cb-78b39a49682e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a3-67a0-2930-a36b7fb8a311	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a3-67a0-3d18-41e29fb78739	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a3-67a0-714b-2d08a90b572f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a3-67a0-d5db-8edc6e375909	Rekvizit-read	Rekvizit - branje	f
00030000-55a3-67a0-a2f9-7dadc7ccbce3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a3-67a0-52dc-90c888da9a26	Revizija-read	Revizija - branje	f
00030000-55a3-67a0-e5cd-8dce07e6f279	Revizija-write	Revizija - spreminjanje	f
00030000-55a3-67a0-e504-947abcc6c7b7	Rezervacija-read	Rezervacija - branje	f
00030000-55a3-67a0-71d1-fee5098b0cf7	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a3-67a0-348e-bc702edc6067	SedezniRed-read	SedezniRed - branje	f
00030000-55a3-67a0-07ca-e1e8b6658b87	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a3-67a0-f65d-55a5ccaa001f	Sedez-read	Sedez - branje	f
00030000-55a3-67a0-4f90-932dcd5f23a3	Sedez-write	Sedez - spreminjanje	f
00030000-55a3-67a0-b38d-58a809ba0a70	Sezona-read	Sezona - branje	f
00030000-55a3-67a0-2a13-f309a3abfd20	Sezona-write	Sezona - spreminjanje	f
00030000-55a3-67a0-c531-3e814dcdd815	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a3-67a0-005a-24bb10b61b9d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a3-67a0-122f-f79772c2f7d5	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a3-67a0-7b05-177f853c65e4	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a3-67a0-3f73-318fcd5e3737	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a3-67a0-3a17-9ffdc7ba52c2	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a3-67a0-3e23-dbe749272d40	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a3-67a0-f1f0-59f317cb9113	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a3-67a0-fc05-898cb2634a4a	Telefonska-read	Telefonska - branje	f
00030000-55a3-67a0-ab19-e19a4282f195	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a3-67a0-5ece-311f125b9956	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a3-67a0-bffb-665195c5e6fb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a3-67a0-851c-39b25e7981eb	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a3-67a0-c12c-8c432d0c112e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a3-67a0-4b39-87de7b72d269	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a3-67a0-8344-f022e5b3c9d1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a3-67a0-f65a-588063afa794	Trr-read	Trr - branje	f
00030000-55a3-67a0-380f-8c0554032ebe	Trr-write	Trr - spreminjanje	f
00030000-55a3-67a0-979e-0fc8cac2ee63	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a3-67a0-59db-05d69c6ce836	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a3-67a0-a0ab-ddf7e1433a2f	Vaja-read	Vaja - branje	f
00030000-55a3-67a0-6d9b-8a3b18d824a6	Vaja-write	Vaja - spreminjanje	f
00030000-55a3-67a0-04e8-49494a976778	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a3-67a0-9ce9-722ff631b7b5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a3-67a0-4332-ace492536ef0	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a3-67a0-0620-6920a788f0cf	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a3-67a0-1c6d-62a47c60c41e	Zasedenost-read	Zasedenost - branje	f
00030000-55a3-67a0-785b-420d77c8d128	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a3-67a0-d409-25f0f25d9287	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a3-67a0-43da-78ca2cd66151	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a3-67a0-58f0-33ebe2eb43fd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a3-67a0-4c41-575408c45d97	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9779629)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a3-67a0-1e75-9806e9209b01	00030000-55a3-67a0-66f5-a2ad8b7332ab
00020000-55a3-67a0-610a-bb9f154a732a	00030000-55a3-67a0-e24e-518a1719cf7b
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-a45a-b51e121360b9
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-852c-f08f7cae6e8f
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-8f81-81ebd13c816c
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-ab83-7f9138882cf3
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-eb2f-e593334c8979
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-5b3d-5ecd42714c38
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-3de7-90adb731539b
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-3626-6dced50caa20
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-e24e-518a1719cf7b
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-d5a7-325c01531564
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-7fe3-297936ee12d0
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-f478-3d6caa5d7040
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-fdb2-c376f647e6d8
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-606f-651e6aa486f1
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-67f3-7a87ce709313
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-ee64-21cc514d32ad
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-1e59-eb4f0bea3089
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-cd04-7baf469d3fcd
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-8392-7e0793e59a23
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-b625-7621d0286147
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-b48d-05c6892f210b
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-b037-61176d69934d
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-31e2-2734b15a821c
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-cbbc-122884cb2aa0
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-d61f-1f0b2f71c20f
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-5f9e-b254c31cdf6f
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-23c6-1e930dfe157f
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-7193-1f3858c68081
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-9b4d-84c0d4bd8901
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-6dd1-d5b2179d787e
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-0950-83c883bf897b
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-b178-5cca2582c605
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-4f68-7a6c7f6f336d
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-7987-c9ab3b1cc72b
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-3d18-41e29fb78739
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-714b-2d08a90b572f
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-d5db-8edc6e375909
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-a2f9-7dadc7ccbce3
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-b38d-58a809ba0a70
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-2a13-f309a3abfd20
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-851c-39b25e7981eb
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-979e-0fc8cac2ee63
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-59db-05d69c6ce836
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-a0ab-ddf7e1433a2f
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-6d9b-8a3b18d824a6
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-1c6d-62a47c60c41e
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-785b-420d77c8d128
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-d409-25f0f25d9287
00020000-55a3-67a0-9b49-5449c11a030d	00030000-55a3-67a0-58f0-33ebe2eb43fd
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-a45a-b51e121360b9
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-eb2f-e593334c8979
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-5b3d-5ecd42714c38
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-e24e-518a1719cf7b
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-fdb2-c376f647e6d8
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-67f3-7a87ce709313
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-1e59-eb4f0bea3089
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-cd04-7baf469d3fcd
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-8392-7e0793e59a23
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-b625-7621d0286147
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-b48d-05c6892f210b
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-b037-61176d69934d
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-31e2-2734b15a821c
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-d61f-1f0b2f71c20f
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-23c6-1e930dfe157f
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-7193-1f3858c68081
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-9b4d-84c0d4bd8901
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-4f68-7a6c7f6f336d
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-3d18-41e29fb78739
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-d5db-8edc6e375909
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-b38d-58a809ba0a70
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-fc05-898cb2634a4a
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-ab19-e19a4282f195
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-f65a-588063afa794
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-380f-8c0554032ebe
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-4332-ace492536ef0
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-0620-6920a788f0cf
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-d409-25f0f25d9287
00020000-55a3-67a0-57aa-c783c2c1b68a	00030000-55a3-67a0-58f0-33ebe2eb43fd
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-a45a-b51e121360b9
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-8f81-81ebd13c816c
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-eb2f-e593334c8979
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-0c6f-886b46a1908a
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-5deb-7ad027acaddd
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-1096-28410a4775bd
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-5b3d-5ecd42714c38
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-e24e-518a1719cf7b
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-7fe3-297936ee12d0
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-fdb2-c376f647e6d8
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-67f3-7a87ce709313
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-1e59-eb4f0bea3089
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-8392-7e0793e59a23
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-b625-7621d0286147
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-b48d-05c6892f210b
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-31e2-2734b15a821c
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-d61f-1f0b2f71c20f
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-9b4d-84c0d4bd8901
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-0950-83c883bf897b
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-4f68-7a6c7f6f336d
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-3d18-41e29fb78739
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-d5db-8edc6e375909
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-b38d-58a809ba0a70
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-851c-39b25e7981eb
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-a0ab-ddf7e1433a2f
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-1c6d-62a47c60c41e
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-d409-25f0f25d9287
00020000-55a3-67a0-9ed4-621b540a1ca8	00030000-55a3-67a0-58f0-33ebe2eb43fd
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-a45a-b51e121360b9
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-852c-f08f7cae6e8f
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-ab83-7f9138882cf3
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-eb2f-e593334c8979
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-5b3d-5ecd42714c38
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-e24e-518a1719cf7b
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-fdb2-c376f647e6d8
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-67f3-7a87ce709313
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-8392-7e0793e59a23
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-b625-7621d0286147
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-31e2-2734b15a821c
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-d61f-1f0b2f71c20f
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-9b4d-84c0d4bd8901
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-4f68-7a6c7f6f336d
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-3d18-41e29fb78739
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-d5db-8edc6e375909
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-b38d-58a809ba0a70
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-851c-39b25e7981eb
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-d409-25f0f25d9287
00020000-55a3-67a0-08a0-8fcba3888ff9	00030000-55a3-67a0-58f0-33ebe2eb43fd
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-a45a-b51e121360b9
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-eb2f-e593334c8979
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-5b3d-5ecd42714c38
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-e24e-518a1719cf7b
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-fdb2-c376f647e6d8
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-67f3-7a87ce709313
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-8392-7e0793e59a23
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-b625-7621d0286147
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-31e2-2734b15a821c
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-d61f-1f0b2f71c20f
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-9b4d-84c0d4bd8901
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-4f68-7a6c7f6f336d
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-3d18-41e29fb78739
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-d5db-8edc6e375909
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-b38d-58a809ba0a70
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-5ece-311f125b9956
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-a9d8-a067aa263137
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-851c-39b25e7981eb
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-d409-25f0f25d9287
00020000-55a3-67a0-78c4-1035df37926b	00030000-55a3-67a0-58f0-33ebe2eb43fd
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-6dd5-2c033aa5cdda
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-66f5-a2ad8b7332ab
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-a9d8-a067aa263137
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-3de7-90adb731539b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-d004-09059e3a18a4
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-a892-4fb1144bf1f8
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-a45a-b51e121360b9
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-852c-f08f7cae6e8f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-8f81-81ebd13c816c
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-ab83-7f9138882cf3
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-eb2f-e593334c8979
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-0c6f-886b46a1908a
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-5deb-7ad027acaddd
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-132a-aa8bb6d5108e
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-1096-28410a4775bd
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-917b-1e7069c75787
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-5b3d-5ecd42714c38
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-3626-6dced50caa20
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-e24e-518a1719cf7b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-d5a7-325c01531564
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-6c9c-a2ecd491d50b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-ca0f-8e927d9c64d7
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-f63e-5e2baf908698
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-884c-e8e2e9a9225d
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-7fe3-297936ee12d0
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-f478-3d6caa5d7040
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-fdb2-c376f647e6d8
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-606f-651e6aa486f1
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-67f3-7a87ce709313
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-ee64-21cc514d32ad
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-1e59-eb4f0bea3089
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-cd04-7baf469d3fcd
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-8cb1-c309403f675e
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-3b78-97d8569e8112
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-639b-953447654241
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-64d8-2e6727c65a6d
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-8392-7e0793e59a23
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-989f-4504c9317e67
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-b625-7621d0286147
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-b59b-622a4e448e3f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-b48d-05c6892f210b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-b037-61176d69934d
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-ec12-55f9f4d45c01
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-5742-bebbff3e52e7
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-b5f5-7a8b8414917b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-be87-7132ccb6efff
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-44ac-2f764ca1ce30
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-1bc1-d51353bb982a
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-31e2-2734b15a821c
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-cbbc-122884cb2aa0
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-d61f-1f0b2f71c20f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-5f9e-b254c31cdf6f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-15e1-906f303c462b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-1a93-f2c7c1c4b93d
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-23c6-1e930dfe157f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-7193-1f3858c68081
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-9b4d-84c0d4bd8901
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-6dd1-d5b2179d787e
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-10fe-bc16df0d86f9
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-6045-b3f3569a2044
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-22c0-598670b7e2ef
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-9fe4-0d1c6d1975f1
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-0950-83c883bf897b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-b178-5cca2582c605
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-35c7-93f394346741
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-de5b-19040a1d159b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-f8bd-8a5bbe0d2698
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-2a9b-825461662784
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-176d-c8479bbeaeeb
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-0a9e-e6cb6d2539b6
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-9efb-e7519c3c2619
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-3f68-2eb5fac82b75
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-90dd-920f38955e05
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-00fa-dfbd81ea29de
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-222d-9eae736f1e2e
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-db23-5f9efb5c1e8f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-8241-6cb59681eff4
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-7b54-d56210be489e
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-eec2-b0f808f09b11
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-074b-01153a6aef16
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-96ec-58062096e11c
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-4bc7-81b23f12ce87
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-4f68-7a6c7f6f336d
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-7987-c9ab3b1cc72b
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-392c-331dcbec1f8a
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-74cb-e78372cd1f12
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-36cb-78b39a49682e
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-2930-a36b7fb8a311
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-3d18-41e29fb78739
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-714b-2d08a90b572f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-d5db-8edc6e375909
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-a2f9-7dadc7ccbce3
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-52dc-90c888da9a26
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-e5cd-8dce07e6f279
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-e504-947abcc6c7b7
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-71d1-fee5098b0cf7
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-348e-bc702edc6067
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-07ca-e1e8b6658b87
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-f65d-55a5ccaa001f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-4f90-932dcd5f23a3
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-b38d-58a809ba0a70
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-2a13-f309a3abfd20
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-c531-3e814dcdd815
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-005a-24bb10b61b9d
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-122f-f79772c2f7d5
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-7b05-177f853c65e4
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-3f73-318fcd5e3737
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-3a17-9ffdc7ba52c2
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-3e23-dbe749272d40
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-f1f0-59f317cb9113
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-fc05-898cb2634a4a
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-ab19-e19a4282f195
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-5ece-311f125b9956
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-bffb-665195c5e6fb
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-851c-39b25e7981eb
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-c12c-8c432d0c112e
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-4b39-87de7b72d269
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-8344-f022e5b3c9d1
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-f65a-588063afa794
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-380f-8c0554032ebe
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-979e-0fc8cac2ee63
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-59db-05d69c6ce836
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-a0ab-ddf7e1433a2f
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-6d9b-8a3b18d824a6
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-04e8-49494a976778
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-9ce9-722ff631b7b5
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-4332-ace492536ef0
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-0620-6920a788f0cf
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-1c6d-62a47c60c41e
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-785b-420d77c8d128
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-d409-25f0f25d9287
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-43da-78ca2cd66151
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-58f0-33ebe2eb43fd
00020000-55a3-67a2-bba5-054bde2891ed	00030000-55a3-67a0-4c41-575408c45d97
\.


--
-- TOC entry 2885 (class 0 OID 9779924)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9779955)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9780068)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-55a3-67a3-2e4a-67d75f4e2ab4	00090000-55a3-67a3-8670-669e47b2ae66	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-55a3-67a3-0d34-2a59e9165faf	00090000-55a3-67a3-3185-e88833bc594f	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-55a3-67a3-3fa1-72dfb7b39f60	00090000-55a3-67a3-8474-0e980319cceb	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9779689)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a3-67a2-0d07-164bcbec4820	00040000-55a3-67a0-4392-d676eb6cc2dc	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-67a2-41bb-9f372583a6bd	00040000-55a3-67a0-4392-d676eb6cc2dc	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a3-67a2-a0ed-e8c7e6ef6ba4	00040000-55a3-67a0-4392-d676eb6cc2dc	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-67a2-0dff-aba51a9679cb	00040000-55a3-67a0-4392-d676eb6cc2dc	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-67a2-5442-6f8a21d3419e	00040000-55a3-67a0-4392-d676eb6cc2dc	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-67a2-2343-4fefe83432be	00040000-55a3-679f-e7c7-8fad12d2abd6	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-67a2-c174-1ec59023f72f	00040000-55a3-679f-e357-eaab72b9dc87	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-67a2-29c3-1227f9321ee6	00040000-55a3-679f-2278-47bd4e37525c	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-67a3-12c6-ebe2c61dd912	00040000-55a3-67a0-4392-d676eb6cc2dc	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9779724)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a3-67a0-2787-53e5fdd04ca2	8341	Adlešiči
00050000-55a3-67a0-f297-7e8ba2fcd8f7	5270	Ajdovščina
00050000-55a3-67a0-b52e-f59e92e1da16	6280	Ankaran/Ancarano
00050000-55a3-67a0-7fd8-aa4a942ef9a7	9253	Apače
00050000-55a3-67a0-c477-036ec71f0fcb	8253	Artiče
00050000-55a3-67a0-8685-db4133b4e148	4275	Begunje na Gorenjskem
00050000-55a3-67a0-74df-96cd9c289564	1382	Begunje pri Cerknici
00050000-55a3-67a0-1f58-fb0efbf40047	9231	Beltinci
00050000-55a3-67a0-7249-481949401097	2234	Benedikt
00050000-55a3-67a0-41d9-57d6ea2647c4	2345	Bistrica ob Dravi
00050000-55a3-67a0-412f-8e12d3f92ae7	3256	Bistrica ob Sotli
00050000-55a3-67a0-4ecb-f6223cc4b351	8259	Bizeljsko
00050000-55a3-67a0-be15-c81d3be16328	1223	Blagovica
00050000-55a3-67a0-7756-2d3b5ebc3bb5	8283	Blanca
00050000-55a3-67a0-3a86-d406dd92a87c	4260	Bled
00050000-55a3-67a0-72dd-ac81997ecd7e	4273	Blejska Dobrava
00050000-55a3-67a0-32a1-f600c408a799	9265	Bodonci
00050000-55a3-67a0-af06-3f82e6a82515	9222	Bogojina
00050000-55a3-67a0-f7a5-06d20badde23	4263	Bohinjska Bela
00050000-55a3-67a0-2ef4-8c091dfc22d9	4264	Bohinjska Bistrica
00050000-55a3-67a0-74f4-3b9076fa39d3	4265	Bohinjsko jezero
00050000-55a3-67a0-02c6-73609d480a04	1353	Borovnica
00050000-55a3-67a0-ad0d-6aa1a45f52b0	8294	Boštanj
00050000-55a3-67a0-ee0b-5edd499c5bda	5230	Bovec
00050000-55a3-67a0-768b-82cf8797e5f1	5295	Branik
00050000-55a3-67a0-df8f-ab6d904491ee	3314	Braslovče
00050000-55a3-67a0-620e-04f42f08fe30	5223	Breginj
00050000-55a3-67a0-95a9-81580b01934e	8280	Brestanica
00050000-55a3-67a0-6cf4-daa181236645	2354	Bresternica
00050000-55a3-67a0-2bbc-ca60618fa084	4243	Brezje
00050000-55a3-67a0-880a-eb2a31eb401a	1351	Brezovica pri Ljubljani
00050000-55a3-67a0-7df6-8652cdf0c5af	8250	Brežice
00050000-55a3-67a0-6938-3b2dc47f5a63	4210	Brnik - Aerodrom
00050000-55a3-67a0-54d3-40542723a2d2	8321	Brusnice
00050000-55a3-67a0-b55a-58479fade1a7	3255	Buče
00050000-55a3-67a0-9c5f-9373ec91c8f7	8276	Bučka 
00050000-55a3-67a0-66f0-58a51946cc89	9261	Cankova
00050000-55a3-67a0-015d-c0738bf012a5	3000	Celje 
00050000-55a3-67a0-0fab-b3f36adfbc95	3001	Celje - poštni predali
00050000-55a3-67a0-8bd2-18fd8e49cc68	4207	Cerklje na Gorenjskem
00050000-55a3-67a0-dfe9-1f6956b4d7d7	8263	Cerklje ob Krki
00050000-55a3-67a0-56f5-fcfefe804bdd	1380	Cerknica
00050000-55a3-67a0-e251-ed7c78f0b802	5282	Cerkno
00050000-55a3-67a0-0b0e-29667e31fdd3	2236	Cerkvenjak
00050000-55a3-67a0-b382-254ecfb7146b	2215	Ceršak
00050000-55a3-67a0-8fdf-d18dd90fdccd	2326	Cirkovce
00050000-55a3-67a0-36c5-3d96bdfdebb0	2282	Cirkulane
00050000-55a3-67a0-4345-0cc1b74d288a	5273	Col
00050000-55a3-67a0-cccc-9fa6138eced4	8251	Čatež ob Savi
00050000-55a3-67a0-2024-01be24b1a610	1413	Čemšenik
00050000-55a3-67a0-86f7-c8f291104de6	5253	Čepovan
00050000-55a3-67a0-3697-125ff6fbd367	9232	Črenšovci
00050000-55a3-67a0-14b0-758bcd1aad2e	2393	Črna na Koroškem
00050000-55a3-67a0-3194-4c2b9a686348	6275	Črni Kal
00050000-55a3-67a0-65a4-64a4152059e2	5274	Črni Vrh nad Idrijo
00050000-55a3-67a0-fe60-60875cc355f4	5262	Črniče
00050000-55a3-67a0-4e22-1f56db444a35	8340	Črnomelj
00050000-55a3-67a0-e9c3-ee0b37934223	6271	Dekani
00050000-55a3-67a0-58bf-628131d3551b	5210	Deskle
00050000-55a3-67a0-e145-095dbcc79010	2253	Destrnik
00050000-55a3-67a0-58e5-b6ba1d9e1de6	6215	Divača
00050000-55a3-67a0-c05a-f26c8e58ad7b	1233	Dob
00050000-55a3-67a0-250a-a2c4d15dae63	3224	Dobje pri Planini
00050000-55a3-67a0-fff8-d049463a49e5	8257	Dobova
00050000-55a3-67a0-0041-50fc777de024	1423	Dobovec
00050000-55a3-67a0-a46b-6dd640d9c8c1	5263	Dobravlje
00050000-55a3-67a0-384a-82322c09bc6a	3204	Dobrna
00050000-55a3-67a0-35b7-863211bda5f8	8211	Dobrnič
00050000-55a3-67a0-1928-5e94b6262b4e	1356	Dobrova
00050000-55a3-67a0-aee6-da8115d079b3	9223	Dobrovnik/Dobronak 
00050000-55a3-67a0-1d19-41d0c40f91bc	5212	Dobrovo v Brdih
00050000-55a3-67a0-fccb-1f2aac3f86ef	1431	Dol pri Hrastniku
00050000-55a3-67a0-7d18-3e294f159442	1262	Dol pri Ljubljani
00050000-55a3-67a0-4456-6092fea56b9d	1273	Dole pri Litiji
00050000-55a3-67a0-590c-23147d81c952	1331	Dolenja vas
00050000-55a3-67a0-db92-1f98afdf9233	8350	Dolenjske Toplice
00050000-55a3-67a0-4b27-f3629d4c4941	1230	Domžale
00050000-55a3-67a0-2740-912454ed928a	2252	Dornava
00050000-55a3-67a0-2848-5c8fac734059	5294	Dornberk
00050000-55a3-67a0-1393-8c496459d24d	1319	Draga
00050000-55a3-67a0-89eb-2ce464d96b31	8343	Dragatuš
00050000-55a3-67a0-245a-8e6457e97ee6	3222	Dramlje
00050000-55a3-67a0-1c15-a0bea5ac2451	2370	Dravograd
00050000-55a3-67a0-854f-b869140f0443	4203	Duplje
00050000-55a3-67a0-6ce8-b34070991cd1	6221	Dutovlje
00050000-55a3-67a0-35e7-b2ad860033b2	8361	Dvor
00050000-55a3-67a0-df3c-310b26e0e2fa	2343	Fala
00050000-55a3-67a0-9304-670202e5f11b	9208	Fokovci
00050000-55a3-67a0-b9b6-1a8152d56d4f	2313	Fram
00050000-55a3-67a0-a464-153eeea0c4f6	3213	Frankolovo
00050000-55a3-67a0-e25a-33dde36142b1	1274	Gabrovka
00050000-55a3-67a0-329e-f7bbcf48eb0e	8254	Globoko
00050000-55a3-67a0-3876-d06456039e9f	5275	Godovič
00050000-55a3-67a0-f59c-f98c19729aa0	4204	Golnik
00050000-55a3-67a0-a71c-6a0a033a09ba	3303	Gomilsko
00050000-55a3-67a0-a09c-9cb2c57e915b	4224	Gorenja vas
00050000-55a3-67a0-5c0c-fdf0b49d54bc	3263	Gorica pri Slivnici
00050000-55a3-67a0-41f6-086f8258c10a	2272	Gorišnica
00050000-55a3-67a0-2161-58aa7b537fe5	9250	Gornja Radgona
00050000-55a3-67a0-aabe-7659fbc065f6	3342	Gornji Grad
00050000-55a3-67a0-6a6e-2971499537cc	4282	Gozd Martuljek
00050000-55a3-67a0-138c-a702836303a6	6272	Gračišče
00050000-55a3-67a0-2a9a-4a53da3ccec3	9264	Grad
00050000-55a3-67a0-816f-a050c50611ad	8332	Gradac
00050000-55a3-67a0-6e76-cab22d6818ad	1384	Grahovo
00050000-55a3-67a0-f963-ff365e1ab020	5242	Grahovo ob Bači
00050000-55a3-67a0-3c77-50e1474efb4f	5251	Grgar
00050000-55a3-67a0-eb24-c650550740a5	3302	Griže
00050000-55a3-67a0-2448-84628b6588fc	3231	Grobelno
00050000-55a3-67a0-99e6-82acb48ae491	1290	Grosuplje
00050000-55a3-67a0-a3ae-9d42cdf89623	2288	Hajdina
00050000-55a3-67a0-f7b1-87e96019307e	8362	Hinje
00050000-55a3-67a0-e72e-ba01d5d98adc	2311	Hoče
00050000-55a3-67a0-ed73-2688af59abd6	9205	Hodoš/Hodos
00050000-55a3-67a0-c534-3db62d4e2d67	1354	Horjul
00050000-55a3-67a0-28d7-469d9ac6abd8	1372	Hotedršica
00050000-55a3-67a0-5162-9bdfb9e25b73	1430	Hrastnik
00050000-55a3-67a0-5e88-d559165fd5e9	6225	Hruševje
00050000-55a3-67a0-a60e-00f6ca21c531	4276	Hrušica
00050000-55a3-67a0-cddb-b14e1746758a	5280	Idrija
00050000-55a3-67a0-4545-9869c502fc77	1292	Ig
00050000-55a3-67a0-acd1-ee32e8ba1835	6250	Ilirska Bistrica
00050000-55a3-67a0-6866-e72d97af013f	6251	Ilirska Bistrica-Trnovo
00050000-55a3-67a0-0a08-7837843f4d70	1295	Ivančna Gorica
00050000-55a3-67a0-abf4-9c8a5b82f384	2259	Ivanjkovci
00050000-55a3-67a0-1655-5917b464eb2d	1411	Izlake
00050000-55a3-67a0-263d-a3b86920f60a	6310	Izola/Isola
00050000-55a3-67a0-7bf8-a33775155f13	2222	Jakobski Dol
00050000-55a3-67a0-79d2-f8a342ba4d12	2221	Jarenina
00050000-55a3-67a0-a112-63cc94f5087f	6254	Jelšane
00050000-55a3-67a0-4a2a-c9d5b683f12b	4270	Jesenice
00050000-55a3-67a0-2772-d3b053fb2a76	8261	Jesenice na Dolenjskem
00050000-55a3-67a0-21ec-62e468e65806	3273	Jurklošter
00050000-55a3-67a0-7599-7318c27dbb2e	2223	Jurovski Dol
00050000-55a3-67a0-23a0-f0eddd93eb87	2256	Juršinci
00050000-55a3-67a0-4c2d-b03af3e8ea3d	5214	Kal nad Kanalom
00050000-55a3-67a0-471a-f4ed38cb4642	3233	Kalobje
00050000-55a3-67a0-0f94-b45164d97770	4246	Kamna Gorica
00050000-55a3-67a0-7965-5092ce36e085	2351	Kamnica
00050000-55a3-67a0-47e9-f11c099b1f9e	1241	Kamnik
00050000-55a3-67a0-9e81-658d769bdf9d	5213	Kanal
00050000-55a3-67a0-abc2-3a6b9925f94c	8258	Kapele
00050000-55a3-67a0-5666-8340066e3c26	2362	Kapla
00050000-55a3-67a0-0567-c66c1b99fbbd	2325	Kidričevo
00050000-55a3-67a0-fa53-85350bd80d6a	1412	Kisovec
00050000-55a3-67a0-9363-f695e77b48ca	6253	Knežak
00050000-55a3-67a0-aa55-92f599bb8e36	5222	Kobarid
00050000-55a3-67a0-3494-561d79352e53	9227	Kobilje
00050000-55a3-67a0-2713-4afe45184038	1330	Kočevje
00050000-55a3-67a0-8a42-2835b43e3c88	1338	Kočevska Reka
00050000-55a3-67a0-5891-240259f82a77	2276	Kog
00050000-55a3-67a0-c8b9-6a235b066ba3	5211	Kojsko
00050000-55a3-67a0-7278-132fb32a1947	6223	Komen
00050000-55a3-67a0-d2eb-b59c42af89d8	1218	Komenda
00050000-55a3-67a0-658f-311541a31671	6000	Koper/Capodistria 
00050000-55a3-67a0-66d9-ab03918678c4	6001	Koper/Capodistria - poštni predali
00050000-55a3-67a0-91db-88f0668bbf65	8282	Koprivnica
00050000-55a3-67a0-2eef-bc5aaaffa6e7	5296	Kostanjevica na Krasu
00050000-55a3-67a0-a58b-d3cad7ba6d3b	8311	Kostanjevica na Krki
00050000-55a3-67a0-1925-416194513757	1336	Kostel
00050000-55a3-67a0-0f5f-7c631b33b1c3	6256	Košana
00050000-55a3-67a0-fe0b-16612ecdeac5	2394	Kotlje
00050000-55a3-67a0-f5a6-6181ef06f509	6240	Kozina
00050000-55a3-67a0-8164-ae1c264dfd29	3260	Kozje
00050000-55a3-67a0-e04e-3c4b1a865826	4000	Kranj 
00050000-55a3-67a0-7238-976ee5348674	4001	Kranj - poštni predali
00050000-55a3-67a0-f3fe-7ed8ee26200e	4280	Kranjska Gora
00050000-55a3-67a0-e50b-a0cabd93f790	1281	Kresnice
00050000-55a3-67a0-8f90-b50f1826060c	4294	Križe
00050000-55a3-67a0-0a9c-01d0dd8e3685	9206	Križevci
00050000-55a3-67a0-1570-4b1e9bb506a7	9242	Križevci pri Ljutomeru
00050000-55a3-67a0-1d21-a96d6c2f6de8	1301	Krka
00050000-55a3-67a0-6038-9f02a48ab149	8296	Krmelj
00050000-55a3-67a0-7dd0-902d5b5b89c3	4245	Kropa
00050000-55a3-67a0-6124-8f4bea63fa43	8262	Krška vas
00050000-55a3-67a0-c4ef-254a1313f4e3	8270	Krško
00050000-55a3-67a0-4f12-57d414616c00	9263	Kuzma
00050000-55a3-67a0-e58d-dbbbe65c4e3d	2318	Laporje
00050000-55a3-67a0-81ae-6a5c30dcc3ba	3270	Laško
00050000-55a3-67a0-2d74-334573ccffc9	1219	Laze v Tuhinju
00050000-55a3-67a0-60a2-d85aaade6833	2230	Lenart v Slovenskih goricah
00050000-55a3-67a0-4c16-d943cf5ddf2c	9220	Lendava/Lendva
00050000-55a3-67a0-0835-c07d4e340203	4248	Lesce
00050000-55a3-67a0-22bf-fde1d4cd26e2	3261	Lesično
00050000-55a3-67a0-578b-ec7c629ed95d	8273	Leskovec pri Krškem
00050000-55a3-67a0-ff78-001effbec9cf	2372	Libeliče
00050000-55a3-67a0-0309-86b0bd97e535	2341	Limbuš
00050000-55a3-67a0-965d-ee18e7690fe6	1270	Litija
00050000-55a3-67a0-9ea6-0f5024181374	3202	Ljubečna
00050000-55a3-67a0-6d8e-b19ecdc0c13b	1000	Ljubljana 
00050000-55a3-67a0-0652-1803fbb33b5a	1001	Ljubljana - poštni predali
00050000-55a3-67a0-9bfe-b252d084c184	1231	Ljubljana - Črnuče
00050000-55a3-67a0-55e1-2521d95f166f	1261	Ljubljana - Dobrunje
00050000-55a3-67a0-d3b7-41a5b22b8d86	1260	Ljubljana - Polje
00050000-55a3-67a0-a113-dd825201424f	1210	Ljubljana - Šentvid
00050000-55a3-67a0-2ae8-33d515336cc6	1211	Ljubljana - Šmartno
00050000-55a3-67a0-36d3-3a8ac85b1c74	3333	Ljubno ob Savinji
00050000-55a3-67a0-2211-6a1181a52965	9240	Ljutomer
00050000-55a3-67a0-fcca-126718860f68	3215	Loče
00050000-55a3-67a0-822a-f81722e1c131	5231	Log pod Mangartom
00050000-55a3-67a0-e562-15f25a9e8b1e	1358	Log pri Brezovici
00050000-55a3-67a0-3dbd-4de4b7f52168	1370	Logatec
00050000-55a3-67a0-7187-b17e20a813bc	1371	Logatec
00050000-55a3-67a0-3219-3a51e21cb2d8	1434	Loka pri Zidanem Mostu
00050000-55a3-67a0-fb89-8924017479d5	3223	Loka pri Žusmu
00050000-55a3-67a0-3ec1-7214fa762ef8	6219	Lokev
00050000-55a3-67a0-511b-604b871ab103	1318	Loški Potok
00050000-55a3-67a0-5204-2f316c5f1bcc	2324	Lovrenc na Dravskem polju
00050000-55a3-67a0-e292-6f7e79fe18b6	2344	Lovrenc na Pohorju
00050000-55a3-67a0-d5f5-39863be4c83d	3334	Luče
00050000-55a3-67a0-1e4f-5470924f177c	1225	Lukovica
00050000-55a3-67a0-1d8e-63f6eed4b503	9202	Mačkovci
00050000-55a3-67a0-95c2-80be769635ae	2322	Majšperk
00050000-55a3-67a0-cf07-ad155f7ec60f	2321	Makole
00050000-55a3-67a0-36fc-21da7709d91f	9243	Mala Nedelja
00050000-55a3-67a0-86b6-ccaefcfa4447	2229	Malečnik
00050000-55a3-67a0-92c5-a94410758fc0	6273	Marezige
00050000-55a3-67a0-c019-866da21e9686	2000	Maribor 
00050000-55a3-67a0-f864-689ba86a1086	2001	Maribor - poštni predali
00050000-55a3-67a0-d763-fdf6580caa39	2206	Marjeta na Dravskem polju
00050000-55a3-67a0-b9c6-a3cc51e1c27a	2281	Markovci
00050000-55a3-67a0-f8ca-d6d8b62c154e	9221	Martjanci
00050000-55a3-67a0-973c-4714afa0dde7	6242	Materija
00050000-55a3-67a0-bd02-2a599d502cb8	4211	Mavčiče
00050000-55a3-67a0-21cc-4945732d8a09	1215	Medvode
00050000-55a3-67a0-bfb1-7eb66bfa311e	1234	Mengeš
00050000-55a3-67a0-62c1-e76a92611b9f	8330	Metlika
00050000-55a3-67a0-64a5-cce9162a91cb	2392	Mežica
00050000-55a3-67a0-17e7-0d287cf60370	2204	Miklavž na Dravskem polju
00050000-55a3-67a0-a307-004f799ec75e	2275	Miklavž pri Ormožu
00050000-55a3-67a0-b3fa-a7306d988e21	5291	Miren
00050000-55a3-67a0-02b1-63c348e96c5e	8233	Mirna
00050000-55a3-67a0-67be-123846cbb5a5	8216	Mirna Peč
00050000-55a3-67a0-cbef-f9c86c7af84c	2382	Mislinja
00050000-55a3-67a0-fe6b-1ee0299afc7f	4281	Mojstrana
00050000-55a3-67a0-b2de-29f7ad2fff8c	8230	Mokronog
00050000-55a3-67a0-63d6-6c34cc7028b7	1251	Moravče
00050000-55a3-67a0-1d37-078a6c4c7f55	9226	Moravske Toplice
00050000-55a3-67a0-f6f4-b7c4a5233aaf	5216	Most na Soči
00050000-55a3-67a0-3d8a-511b2a3f2725	1221	Motnik
00050000-55a3-67a0-1e65-a8417846df71	3330	Mozirje
00050000-55a3-67a0-6469-f6905a8e9576	9000	Murska Sobota 
00050000-55a3-67a0-2073-3266c469a437	9001	Murska Sobota - poštni predali
00050000-55a3-67a0-4149-29fbbb86b048	2366	Muta
00050000-55a3-67a0-5dc5-b265d724b918	4202	Naklo
00050000-55a3-67a0-7370-6317852a4262	3331	Nazarje
00050000-55a3-67a0-32d1-2a4ea9985f8e	1357	Notranje Gorice
00050000-55a3-67a0-a2ba-bb5774bb358a	3203	Nova Cerkev
00050000-55a3-67a0-c7d9-f9eb81230ffc	5000	Nova Gorica 
00050000-55a3-67a0-3e9e-4f7a8afba494	5001	Nova Gorica - poštni predali
00050000-55a3-67a0-6a5f-ad84e3a54c5f	1385	Nova vas
00050000-55a3-67a0-6c9c-d3d65b3d3337	8000	Novo mesto
00050000-55a3-67a0-da5c-22c1f9fb2f2c	8001	Novo mesto - poštni predali
00050000-55a3-67a0-610a-0e8bc818c142	6243	Obrov
00050000-55a3-67a0-9f49-46216e7e51aa	9233	Odranci
00050000-55a3-67a0-a6a8-f0aad50ec253	2317	Oplotnica
00050000-55a3-67a0-248a-c98eaff22cc8	2312	Orehova vas
00050000-55a3-67a0-4cd5-5e7ea1a071ae	2270	Ormož
00050000-55a3-67a0-c4dc-9a5798879a04	1316	Ortnek
00050000-55a3-67a0-167f-4c3259aec0c9	1337	Osilnica
00050000-55a3-67a0-ca36-1bc63cfc2dab	8222	Otočec
00050000-55a3-67a0-bddc-2549ffbee46f	2361	Ožbalt
00050000-55a3-67a0-75ff-2cdd74a7216f	2231	Pernica
00050000-55a3-67a0-0275-a03a69aaca91	2211	Pesnica pri Mariboru
00050000-55a3-67a0-bb28-81c7d6524c1b	9203	Petrovci
00050000-55a3-67a0-fa00-3ad1a9ab4736	3301	Petrovče
00050000-55a3-67a0-8a96-8bafefcabf54	6330	Piran/Pirano
00050000-55a3-67a0-0bbb-1115ca5ed720	8255	Pišece
00050000-55a3-67a0-fb90-c8e294b61fc5	6257	Pivka
00050000-55a3-67a0-f279-603d2752c16b	6232	Planina
00050000-55a3-67a0-a7b4-851c788c39e5	3225	Planina pri Sevnici
00050000-55a3-67a0-c4be-5344f2fe881a	6276	Pobegi
00050000-55a3-67a0-7e74-a8eaed917af7	8312	Podbočje
00050000-55a3-67a0-e883-e3abd978741a	5243	Podbrdo
00050000-55a3-67a0-64a8-64792d00d460	3254	Podčetrtek
00050000-55a3-67a0-d823-1309eaa2b562	2273	Podgorci
00050000-55a3-67a0-4503-d17320b24240	6216	Podgorje
00050000-55a3-67a0-2e34-599759d00f8a	2381	Podgorje pri Slovenj Gradcu
00050000-55a3-67a0-6d87-a9d8035cbee6	6244	Podgrad
00050000-55a3-67a0-e120-badd4c6e3cca	1414	Podkum
00050000-55a3-67a0-cd4b-3f28abb0b2fa	2286	Podlehnik
00050000-55a3-67a0-f512-e83dbdf67c2b	5272	Podnanos
00050000-55a3-67a0-29b5-026d7bee827c	4244	Podnart
00050000-55a3-67a0-2ff8-978191d452d9	3241	Podplat
00050000-55a3-67a0-bda1-bbfbfec8f62b	3257	Podsreda
00050000-55a3-67a0-e565-ecff1860e8ff	2363	Podvelka
00050000-55a3-67a0-d51d-cf3c632e96cb	2208	Pohorje
00050000-55a3-67a0-4d11-f8e2cb306070	2257	Polenšak
00050000-55a3-67a0-f853-97db055ce4dc	1355	Polhov Gradec
00050000-55a3-67a0-e67b-b69e86635459	4223	Poljane nad Škofjo Loko
00050000-55a3-67a0-3d9a-64e1573177dc	2319	Poljčane
00050000-55a3-67a0-3bf9-dceda1610a19	1272	Polšnik
00050000-55a3-67a0-2aad-af61a76a381a	3313	Polzela
00050000-55a3-67a0-156f-71e22305b7b9	3232	Ponikva
00050000-55a3-67a0-7025-8624e4843ce8	6320	Portorož/Portorose
00050000-55a3-67a0-20bf-df4284f548e9	6230	Postojna
00050000-55a3-67a0-e9d4-0d97849288d0	2331	Pragersko
00050000-55a3-67a0-145f-ef6cd0c1a174	3312	Prebold
00050000-55a3-67a0-ba03-b619c4fe22f6	4205	Preddvor
00050000-55a3-67a0-295f-522f80236179	6255	Prem
00050000-55a3-67a0-fb2a-92c0fd51fd1d	1352	Preserje
00050000-55a3-67a0-d416-8bc3aa58b407	6258	Prestranek
00050000-55a3-67a0-256c-654c1a1afd10	2391	Prevalje
00050000-55a3-67a0-996e-2fe563ec3190	3262	Prevorje
00050000-55a3-67a0-0c82-36379caf1e1e	1276	Primskovo 
00050000-55a3-67a0-42e4-b00bd8500a53	3253	Pristava pri Mestinju
00050000-55a3-67a0-9478-700efb797c31	9207	Prosenjakovci/Partosfalva
00050000-55a3-67a0-196d-4ad15911ebd0	5297	Prvačina
00050000-55a3-67a0-4383-5f17d879c0dd	2250	Ptuj
00050000-55a3-67a0-1b2a-6c52f65744ca	2323	Ptujska Gora
00050000-55a3-67a0-8d4f-4625dc476904	9201	Puconci
00050000-55a3-67a0-5e5f-b49dad1750ae	2327	Rače
00050000-55a3-67a0-cbf5-bdac6ec05da8	1433	Radeče
00050000-55a3-67a0-58ac-b3d213d20564	9252	Radenci
00050000-55a3-67a0-2c5d-7e322d218564	2360	Radlje ob Dravi
00050000-55a3-67a0-dca2-ef8f26a20558	1235	Radomlje
00050000-55a3-67a0-0589-56fb784742eb	4240	Radovljica
00050000-55a3-67a0-9c97-ef93b0a49134	8274	Raka
00050000-55a3-67a0-0310-5f1239092e3a	1381	Rakek
00050000-55a3-67a0-8213-3c574540b26e	4283	Rateče - Planica
00050000-55a3-67a0-9cca-1fdc4a5e6cd8	2390	Ravne na Koroškem
00050000-55a3-67a0-4c20-38a56bc89241	9246	Razkrižje
00050000-55a3-67a0-d89f-49e6d3552a5f	3332	Rečica ob Savinji
00050000-55a3-67a0-f8ff-5aef6728c3b7	5292	Renče
00050000-55a3-67a0-bd02-80ab9047e87a	1310	Ribnica
00050000-55a3-67a0-8004-055cc2f8c3b8	2364	Ribnica na Pohorju
00050000-55a3-67a0-d4b7-1ac1b87493fe	3272	Rimske Toplice
00050000-55a3-67a0-306d-5af0bd373b1d	1314	Rob
00050000-55a3-67a0-5830-3752cb9a9e3b	5215	Ročinj
00050000-55a3-67a0-3d85-71bff967b31e	3250	Rogaška Slatina
00050000-55a3-67a0-caa0-3e6324629e9c	9262	Rogašovci
00050000-55a3-67a0-a091-dd09014c0f4a	3252	Rogatec
00050000-55a3-67a0-56e9-44b2fabecea1	1373	Rovte
00050000-55a3-67a0-1218-e4ea740542d0	2342	Ruše
00050000-55a3-67a0-9259-0412f9f19aa9	1282	Sava
00050000-55a3-67a0-1fd8-b26b1bf63351	6333	Sečovlje/Sicciole
00050000-55a3-67a0-b730-052d98a0a2bb	4227	Selca
00050000-55a3-67a0-1780-25a92c21ae62	2352	Selnica ob Dravi
00050000-55a3-67a0-e398-b3cffcdd8a3d	8333	Semič
00050000-55a3-67a0-3344-ab2fbfc6c462	8281	Senovo
00050000-55a3-67a0-e047-b1fff430ba82	6224	Senožeče
00050000-55a3-67a0-b4d2-8657df1c25a3	8290	Sevnica
00050000-55a3-67a0-c0f0-c676b5b97d58	6210	Sežana
00050000-55a3-67a0-b004-d3b6abb243ce	2214	Sladki Vrh
00050000-55a3-67a0-05cd-89afdda969f0	5283	Slap ob Idrijci
00050000-55a3-67a0-ab90-4f6e5d5df410	2380	Slovenj Gradec
00050000-55a3-67a0-f788-84942751b7d6	2310	Slovenska Bistrica
00050000-55a3-67a0-2daa-2a8d072baca4	3210	Slovenske Konjice
00050000-55a3-67a0-e502-92620ee9efd1	1216	Smlednik
00050000-55a3-67a0-f07a-296e690bf27c	5232	Soča
00050000-55a3-67a0-f7b6-d7dfcbf22e34	1317	Sodražica
00050000-55a3-67a0-dc88-eed4f1f17667	3335	Solčava
00050000-55a3-67a0-dadf-e41ae96d7609	5250	Solkan
00050000-55a3-67a0-19ad-764b11afeaf2	4229	Sorica
00050000-55a3-67a0-3ada-3bc75e3d8e5e	4225	Sovodenj
00050000-55a3-67a0-f164-bf501b1d0b07	5281	Spodnja Idrija
00050000-55a3-67a0-81c0-5079d8f70cbb	2241	Spodnji Duplek
00050000-55a3-67a0-91d0-991e92ab6987	9245	Spodnji Ivanjci
00050000-55a3-67a0-a23d-2b6b094f3fa3	2277	Središče ob Dravi
00050000-55a3-67a0-f572-75f3835ee216	4267	Srednja vas v Bohinju
00050000-55a3-67a0-ea12-d57961a24b50	8256	Sromlje 
00050000-55a3-67a0-c206-333b8ee178c7	5224	Srpenica
00050000-55a3-67a0-dcb9-64886da051ec	1242	Stahovica
00050000-55a3-67a0-fe2d-d65c8cb269b3	1332	Stara Cerkev
00050000-55a3-67a0-07eb-1f437f4e515e	8342	Stari trg ob Kolpi
00050000-55a3-67a0-4527-06ac2017a13e	1386	Stari trg pri Ložu
00050000-55a3-67a0-9ff8-54321849e4c0	2205	Starše
00050000-55a3-67a0-824d-f760a0719f15	2289	Stoperce
00050000-55a3-67a0-b083-efbe9f2b8fee	8322	Stopiče
00050000-55a3-67a0-bdc8-3820499e12ab	3206	Stranice
00050000-55a3-67a0-c6fe-179e35bda40d	8351	Straža
00050000-55a3-67a0-d73c-1df1c47e2deb	1313	Struge
00050000-55a3-67a0-3f83-73da321c7dab	8293	Studenec
00050000-55a3-67a0-1e2f-5fe2e719c81e	8331	Suhor
00050000-55a3-67a0-6cbc-2f5ad3b42a75	2233	Sv. Ana v Slovenskih goricah
00050000-55a3-67a0-0d9f-33e702b7b3c3	2235	Sv. Trojica v Slovenskih goricah
00050000-55a3-67a0-bca6-b17621e72935	2353	Sveti Duh na Ostrem Vrhu
00050000-55a3-67a0-a712-0a90df9dd343	9244	Sveti Jurij ob Ščavnici
00050000-55a3-67a0-5add-0927b528c74a	3264	Sveti Štefan
00050000-55a3-67a0-21b1-006005873fad	2258	Sveti Tomaž
00050000-55a3-67a0-15e2-cd406ecae030	9204	Šalovci
00050000-55a3-67a0-cb95-b8ebb3c97cc7	5261	Šempas
00050000-55a3-67a0-0b0d-a98d470a5493	5290	Šempeter pri Gorici
00050000-55a3-67a0-0465-f42883425507	3311	Šempeter v Savinjski dolini
00050000-55a3-67a0-2630-c9eb073232be	4208	Šenčur
00050000-55a3-67a0-b62f-ce202a31ebdc	2212	Šentilj v Slovenskih goricah
00050000-55a3-67a0-0612-d66b53b2dfdd	8297	Šentjanž
00050000-55a3-67a0-c1bf-6c0e2e90a91b	2373	Šentjanž pri Dravogradu
00050000-55a3-67a0-171a-e48c0a1d4b94	8310	Šentjernej
00050000-55a3-67a0-7674-9e5da458e96b	3230	Šentjur
00050000-55a3-67a0-8cbc-6ab5389d2f3c	3271	Šentrupert
00050000-55a3-67a0-2118-f3f83ac4be2b	8232	Šentrupert
00050000-55a3-67a0-1f73-2e5044f4ac1f	1296	Šentvid pri Stični
00050000-55a3-67a0-bb26-e48fe4125d73	8275	Škocjan
00050000-55a3-67a0-253d-702eedc708ea	6281	Škofije
00050000-55a3-67a0-7e1d-56b31d204397	4220	Škofja Loka
00050000-55a3-67a0-9b7c-0ce2b0b88bc4	3211	Škofja vas
00050000-55a3-67a0-f7d4-3cf2d8616d64	1291	Škofljica
00050000-55a3-67a0-15e0-003bc816a7d1	6274	Šmarje
00050000-55a3-67a0-c171-3f68600f7a5c	1293	Šmarje - Sap
00050000-55a3-67a0-1482-141853b2a694	3240	Šmarje pri Jelšah
00050000-55a3-67a0-357c-5ee9d05e9f5f	8220	Šmarješke Toplice
00050000-55a3-67a0-1ebd-ba0020c36482	2315	Šmartno na Pohorju
00050000-55a3-67a0-7508-9bfa023ed8b5	3341	Šmartno ob Dreti
00050000-55a3-67a0-635a-14946ce8caf6	3327	Šmartno ob Paki
00050000-55a3-67a0-2af8-1121d6039ef8	1275	Šmartno pri Litiji
00050000-55a3-67a0-e565-a99827fe1b7b	2383	Šmartno pri Slovenj Gradcu
00050000-55a3-67a0-6eb4-58c045c42b83	3201	Šmartno v Rožni dolini
00050000-55a3-67a0-b033-033fb1345e62	3325	Šoštanj
00050000-55a3-67a0-f174-3881c359b8b4	6222	Štanjel
00050000-55a3-67a0-27ca-d9669f59e482	3220	Štore
00050000-55a3-67a0-5d2e-2937abf83f39	3304	Tabor
00050000-55a3-67a0-c37f-74ec883b0e29	3221	Teharje
00050000-55a3-67a0-044f-7a28b441d249	9251	Tišina
00050000-55a3-67a0-f6c3-ef57f79ba93c	5220	Tolmin
00050000-55a3-67a0-b38b-33471eea7a37	3326	Topolšica
00050000-55a3-67a0-e079-218983a00abf	2371	Trbonje
00050000-55a3-67a0-f6a2-1542283a00de	1420	Trbovlje
00050000-55a3-67a0-fa84-d612fda8ce96	8231	Trebelno 
00050000-55a3-67a0-a322-c62a77a05d5d	8210	Trebnje
00050000-55a3-67a0-cf3a-1e9af5fd2af1	5252	Trnovo pri Gorici
00050000-55a3-67a0-bc65-3b888e2908fe	2254	Trnovska vas
00050000-55a3-67a0-6e51-649d22a626c1	1222	Trojane
00050000-55a3-67a0-27c3-9155d8bb998c	1236	Trzin
00050000-55a3-67a0-e392-375acacf495d	4290	Tržič
00050000-55a3-67a0-573d-71d8f3075e1a	8295	Tržišče
00050000-55a3-67a0-1408-68b212e1bacf	1311	Turjak
00050000-55a3-67a0-0211-de69f7a1554f	9224	Turnišče
00050000-55a3-67a0-8dd2-b8192a09521b	8323	Uršna sela
00050000-55a3-67a0-89b6-c7b3abecc9ad	1252	Vače
00050000-55a3-67a0-2f88-4c924742f2f6	3320	Velenje 
00050000-55a3-67a0-eb1f-1444b8a67543	3322	Velenje - poštni predali
00050000-55a3-67a0-53b5-e3f27cb045f5	8212	Velika Loka
00050000-55a3-67a0-035a-0cdf94cb96fd	2274	Velika Nedelja
00050000-55a3-67a0-078b-2f3e9196c582	9225	Velika Polana
00050000-55a3-67a0-743e-d1655867b965	1315	Velike Lašče
00050000-55a3-67a0-5fad-3a88b6c751dc	8213	Veliki Gaber
00050000-55a3-67a0-eea5-158965a8379c	9241	Veržej
00050000-55a3-67a0-d1d5-8acc643d4527	1312	Videm - Dobrepolje
00050000-55a3-67a0-bd37-c4baf5c55ade	2284	Videm pri Ptuju
00050000-55a3-67a0-c103-9c6c039db84b	8344	Vinica
00050000-55a3-67a0-3265-d424cd154da1	5271	Vipava
00050000-55a3-67a0-0a27-f1d494ac1795	4212	Visoko
00050000-55a3-67a0-6094-6bd77fb2ec7f	1294	Višnja Gora
00050000-55a3-67a0-4274-7c94defd7281	3205	Vitanje
00050000-55a3-67a0-e9be-8525a39fe10e	2255	Vitomarci
00050000-55a3-67a0-230d-512b0bc12d8d	1217	Vodice
00050000-55a3-67a0-1aa3-12c0cdcf3ab4	3212	Vojnik\t
00050000-55a3-67a0-f772-88858b3ccd2c	5293	Volčja Draga
00050000-55a3-67a0-7b63-8eb26a5d4e5a	2232	Voličina
00050000-55a3-67a0-09ac-d4c690678a83	3305	Vransko
00050000-55a3-67a0-db88-d43030fe20de	6217	Vremski Britof
00050000-55a3-67a0-24da-5b3912f1c5af	1360	Vrhnika
00050000-55a3-67a0-e1b4-790eacbc53f5	2365	Vuhred
00050000-55a3-67a0-1dcf-538a9a68c824	2367	Vuzenica
00050000-55a3-67a0-814d-8770e24ff942	8292	Zabukovje 
00050000-55a3-67a0-e77f-a54ceedbd06f	1410	Zagorje ob Savi
00050000-55a3-67a0-22bf-9850da2009e3	1303	Zagradec
00050000-55a3-67a0-7555-9669186c4b45	2283	Zavrč
00050000-55a3-67a0-b056-b18a6a67dc6a	8272	Zdole 
00050000-55a3-67a0-5ea6-4d0b8869f3c6	4201	Zgornja Besnica
00050000-55a3-67a0-4312-f30c92cc4b6a	2242	Zgornja Korena
00050000-55a3-67a0-9ecb-d4bc3653fb17	2201	Zgornja Kungota
00050000-55a3-67a0-b45c-c914bb9fb7f2	2316	Zgornja Ložnica
00050000-55a3-67a0-6a2b-816335f794d7	2314	Zgornja Polskava
00050000-55a3-67a0-4e8a-59d4c4968bf1	2213	Zgornja Velka
00050000-55a3-67a0-52d0-76646ef8f5be	4247	Zgornje Gorje
00050000-55a3-67a0-fd18-e59bbab3bc0b	4206	Zgornje Jezersko
00050000-55a3-67a0-c2ba-b7525b4f575e	2285	Zgornji Leskovec
00050000-55a3-67a0-249e-ee365bc9bb41	1432	Zidani Most
00050000-55a3-67a0-a02d-53bb01b6f000	3214	Zreče
00050000-55a3-67a0-bd3a-a9d6e98292a3	4209	Žabnica
00050000-55a3-67a0-74f1-c4c17a398c0b	3310	Žalec
00050000-55a3-67a0-8e9d-1d727f694972	4228	Železniki
00050000-55a3-67a0-9bec-021adf95fc1c	2287	Žetale
00050000-55a3-67a0-bc58-ff744d60b296	4226	Žiri
00050000-55a3-67a0-2ca1-f60c0b1135dc	4274	Žirovnica
00050000-55a3-67a0-78a1-8edaa8ca4871	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9779898)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 9779709)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9779787)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9779910)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9780217)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9780228)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a3-67a3-0533-5d4f88b64840	00080000-55a3-67a3-12c6-ebe2c61dd912	0900	AK
00190000-55a3-67a3-8c24-b25acb893cc4	00080000-55a3-67a2-a0ed-e8c7e6ef6ba4	0987	AK
00190000-55a3-67a3-b2b5-d605fbeea39a	00080000-55a3-67a2-41bb-9f372583a6bd	0989	AK
00190000-55a3-67a3-708b-7391503cd826	00080000-55a3-67a2-0dff-aba51a9679cb	0986	AK
00190000-55a3-67a3-9e88-afc743e572da	00080000-55a3-67a2-2343-4fefe83432be	0984	AK
00190000-55a3-67a3-1268-bc7305c51e00	00080000-55a3-67a2-c174-1ec59023f72f	0983	AK
00190000-55a3-67a3-c0b7-a05464403706	00080000-55a3-67a2-29c3-1227f9321ee6	0982	AK
\.


--
-- TOC entry 2905 (class 0 OID 9780198)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a3-67a3-0411-f12e1e849dd0	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2850 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 9779939)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a3-67a2-6ce3-9b122a60e3f7	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a3-67a2-30f1-ef5122393444	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a3-67a2-e5f1-db1cfd01b8a3	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a3-67a2-aa58-cfe54bb20619	0004	Mali oder	t	24	Mali oder 
00220000-55a3-67a2-4ffd-8af7d33abff9	0005	Komorni oder	t	15	Komorni oder
00220000-55a3-67a2-16b2-07e1ab82293b	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a3-67a2-b5e4-8d0ec8d84f8c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9779883)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9779873)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9780057)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9780007)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9779581)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2888 (class 0 OID 9779949)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9779619)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a3-67a0-1e75-9806e9209b01	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a3-67a0-610a-bb9f154a732a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a3-67a0-9f88-1201cb8cec7c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a3-67a0-abfa-f372a775b4b8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a3-67a0-9b49-5449c11a030d	planer	Planer dogodkov v koledarju	t
00020000-55a3-67a0-57aa-c783c2c1b68a	kadrovska	Kadrovska služba	t
00020000-55a3-67a0-9ed4-621b540a1ca8	arhivar	Ažuriranje arhivalij	t
00020000-55a3-67a0-08a0-8fcba3888ff9	igralec	Igralec	t
00020000-55a3-67a0-78c4-1035df37926b	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a3-67a2-bba5-054bde2891ed	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9779603)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a3-67a0-cb3f-fe852ab1b68f	00020000-55a3-67a0-9f88-1201cb8cec7c
00010000-55a3-67a0-5879-f5129810e74e	00020000-55a3-67a0-9f88-1201cb8cec7c
00010000-55a3-67a3-be42-f47564a2c105	00020000-55a3-67a2-bba5-054bde2891ed
\.


--
-- TOC entry 2890 (class 0 OID 9779963)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9779904)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9779854)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9780267)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a3-67a1-8d14-26040b8be736	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a3-67a1-de3f-59fbe7826dbc	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a3-67a1-0980-d303936a8c98	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a3-67a1-b633-6d48672c10e9	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a3-67a1-9b0b-b906bc8c5933	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9780259)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a3-67a1-2aab-6c697f33a7d1	00230000-55a3-67a1-b633-6d48672c10e9	popa
00240000-55a3-67a1-840a-31fe71085707	00230000-55a3-67a1-b633-6d48672c10e9	oseba
00240000-55a3-67a1-f4bf-333df0a3e35f	00230000-55a3-67a1-de3f-59fbe7826dbc	prostor
00240000-55a3-67a1-6467-4d30673e712a	00230000-55a3-67a1-b633-6d48672c10e9	besedilo
00240000-55a3-67a1-5110-36371f978c9c	00230000-55a3-67a1-b633-6d48672c10e9	uprizoritev
00240000-55a3-67a1-9c2b-765603750c5e	00230000-55a3-67a1-b633-6d48672c10e9	funkcija
00240000-55a3-67a1-5603-bc391cef93ce	00230000-55a3-67a1-b633-6d48672c10e9	tipfunkcije
00240000-55a3-67a1-4acb-dc151f7ac6de	00230000-55a3-67a1-b633-6d48672c10e9	alternacija
00240000-55a3-67a1-d3b4-ef0b001d675d	00230000-55a3-67a1-8d14-26040b8be736	pogodba
00240000-55a3-67a1-86de-e17802bbd482	00230000-55a3-67a1-b633-6d48672c10e9	zaposlitev
00240000-55a3-67a1-118f-5f8f995d2b8e	00230000-55a3-67a1-8d14-26040b8be736	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9780254)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9780017)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a3-67a3-0832-e4125d4faf5c	000e0000-55a3-67a3-7840-45670088eb7a	00080000-55a3-67a2-0d07-164bcbec4820	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a3-67a3-53f9-906c38fe5973	000e0000-55a3-67a3-7840-45670088eb7a	00080000-55a3-67a2-0d07-164bcbec4820	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a3-67a3-6e16-d1eaabba7bbb	000e0000-55a3-67a3-7840-45670088eb7a	00080000-55a3-67a2-5442-6f8a21d3419e	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9779681)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9779860)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a3-67a3-91b6-8344b9e0e090	00180000-55a3-67a3-7980-1884dc5a2798	000c0000-55a3-67a3-4dc0-e6901f92e02e	00090000-55a3-67a3-d7c9-c5b699ac065d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-67a3-a50c-e437d8d5fcad	00180000-55a3-67a3-7980-1884dc5a2798	000c0000-55a3-67a3-2d4e-9ec2ef734b08	00090000-55a3-67a3-d2fe-fd226f62e91c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-67a3-3d5a-695d91c1a960	00180000-55a3-67a3-7980-1884dc5a2798	000c0000-55a3-67a3-3851-939285e1b454	00090000-55a3-67a3-8db3-975dd95e51b9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-67a3-c1ac-91b0f2160e49	00180000-55a3-67a3-7980-1884dc5a2798	000c0000-55a3-67a3-ebf5-a87852404a57	00090000-55a3-67a3-9758-c336f52c2a2a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-67a3-f51c-307cc8a91ef9	00180000-55a3-67a3-7980-1884dc5a2798	000c0000-55a3-67a3-ca30-ba34c465ebe2	00090000-55a3-67a3-a8d2-c9a283cdf55c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-67a3-afbf-f6731f68b220	00180000-55a3-67a3-f402-434801079628	\N	00090000-55a3-67a3-a8d2-c9a283cdf55c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2897 (class 0 OID 9780046)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a3-67a1-0a4a-dad53278be58	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a3-67a1-b2ec-b7eea7a9df96	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a3-67a1-2541-502ca8c2cd37	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a3-67a1-f53c-2e6ac21fa69b	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a3-67a1-9b67-be4050043c25	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a3-67a1-c9ba-418022f45555	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a3-67a1-5ef2-b59007f33c14	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a3-67a1-a2d7-6b74e6c6115b	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a3-67a1-5b6e-d4365e34f45d	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a3-67a1-efa4-b454bb61d0ad	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a3-67a1-bf89-f62838045f49	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a3-67a1-f92d-6be66fa0d3bf	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a3-67a1-1142-a9c24e2ba884	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a3-67a1-8d9e-e7b8c9d46237	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a3-67a1-843e-b23f9291d26c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a3-67a1-1c50-ad4d8b925dd3	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9780236)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a3-67a1-392c-af06443f5761	01	Velika predstava	f	1.00	1.00
002b0000-55a3-67a1-4935-4746bf48e48d	02	Mala predstava	f	0.50	0.50
002b0000-55a3-67a1-68e2-cdadcc481165	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a3-67a1-f867-c70ee0562b20	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a3-67a1-e561-d2638164feb4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9779744)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9779590)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a3-67a0-5879-f5129810e74e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROGCqjSfXRFe0tXPy6xdhhc89BLlTbvSO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-c246-e6b02e0ec1bc	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-78e7-cf2b14dca7be	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-c213-c644ba7e642c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-cb72-e0d747caa00f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-8c66-7763a76620ce	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-48b2-f3cac28efa4b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-e70b-6c89ada64046	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-ca38-ac28fe70fd05	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-9e40-67041bc571d7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a3-67a3-be42-f47564a2c105	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a3-67a0-cb3f-fe852ab1b68f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9780094)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a3-67a3-6bca-db6249fd6d09	00160000-55a3-67a2-15b2-62817b2cef33	00150000-55a3-67a1-1d6e-5ce1e0f1ac53	00140000-55a3-679f-96ff-23a37d161bba	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a3-67a2-4ffd-8af7d33abff9
000e0000-55a3-67a3-7840-45670088eb7a	00160000-55a3-67a2-513e-41b5606dc009	00150000-55a3-67a1-110b-c6a73a1934be	00140000-55a3-679f-4e8a-8ab64710f58a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a3-67a2-16b2-07e1ab82293b
000e0000-55a3-67a3-c6e3-e342e2abc053	\N	00150000-55a3-67a1-110b-c6a73a1934be	00140000-55a3-679f-4e8a-8ab64710f58a	00190000-55a3-67a3-8c24-b25acb893cc4	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a3-67a2-4ffd-8af7d33abff9
000e0000-55a3-67a3-2441-41aafb06cd24	\N	00150000-55a3-67a1-110b-c6a73a1934be	00140000-55a3-679f-4e8a-8ab64710f58a	00190000-55a3-67a3-8c24-b25acb893cc4	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a3-67a2-4ffd-8af7d33abff9
000e0000-55a3-67a3-23e6-d5d176737a12	\N	00150000-55a3-67a1-110b-c6a73a1934be	00140000-55a3-679f-4e8a-8ab64710f58a	00190000-55a3-67a3-8c24-b25acb893cc4	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a3-67a2-6ce3-9b122a60e3f7
\.


--
-- TOC entry 2871 (class 0 OID 9779806)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a3-67a3-0138-884611627750	000e0000-55a3-67a3-7840-45670088eb7a	1	
00200000-55a3-67a3-2c27-c229e3b0dfab	000e0000-55a3-67a3-7840-45670088eb7a	2	
\.


--
-- TOC entry 2886 (class 0 OID 9779931)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9780000)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9779838)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9780084)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a3-679f-96ff-23a37d161bba	01	Drama	drama (SURS 01)
00140000-55a3-679f-bfb5-0667dd9afc1f	02	Opera	opera (SURS 02)
00140000-55a3-679f-bc55-15e4c6cc398a	03	Balet	balet (SURS 03)
00140000-55a3-679f-4aec-6f16e047dc97	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a3-679f-324c-8a35020aeb8f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a3-679f-4e8a-8ab64710f58a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a3-679f-6c58-c092b412657b	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9779990)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a3-67a1-e91a-6dc4157a8905	01	Opera	opera
00150000-55a3-67a1-f3e9-a2f4d8824f24	02	Opereta	opereta
00150000-55a3-67a1-bfb0-994b3e63ffb3	03	Balet	balet
00150000-55a3-67a1-4e8e-b07f85c6a095	04	Plesne prireditve	plesne prireditve
00150000-55a3-67a1-cbe9-bd75905731f6	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a3-67a1-1a30-6c547a1b8c35	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a3-67a1-dc68-48adadacd03f	07	Biografska drama	biografska drama
00150000-55a3-67a1-1d6e-5ce1e0f1ac53	08	Komedija	komedija
00150000-55a3-67a1-bf3d-1e84f02ac3db	09	Črna komedija	črna komedija
00150000-55a3-67a1-f697-d7bd00362554	10	E-igra	E-igra
00150000-55a3-67a1-110b-c6a73a1934be	11	Kriminalka	kriminalka
00150000-55a3-67a1-296d-1310a1ee8d0a	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9779644)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9780141)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9780131)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9780045)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9779828)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9779853)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9780252)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9779770)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9780193)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9779986)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9779804)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9779847)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9779784)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 9779896)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9779923)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9779742)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9779653)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2452 (class 2606 OID 9779677)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9779633)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9779618)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9779929)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9779962)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9780079)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9779706)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9779730)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9779902)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 9779720)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9779791)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9779914)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9780225)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9780233)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9780215)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 9779946)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9779887)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9779878)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9780067)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9780014)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9779589)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9779953)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9779607)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9779627)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9779971)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9779909)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9779859)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9780276)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9780264)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9780258)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9780027)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9779686)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9779869)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9780056)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9780246)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9779755)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9779602)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9780110)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9779813)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9779937)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9780005)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9779842)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9780092)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9779998)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9779835)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9780028)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9780029)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9779708)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2407 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2408 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2550 (class 1259 OID 9779930)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9779916)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9779915)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9779814)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9779987)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9779989)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9779988)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9779786)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9779785)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9780081)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9780082)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9780083)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2420 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2421 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2604 (class 1259 OID 9780115)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9780112)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9780116)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9780114)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9780113)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9779757)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9779756)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2411 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2412 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2450 (class 1259 OID 9779680)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9779954)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9779848)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9779634)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9779635)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9779974)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9779973)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9779972)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9779792)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9779794)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9779793)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9780266)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9779882)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9779880)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9779879)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9779881)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9779608)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9779609)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9779938)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9779903)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9780015)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9780016)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9780197)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9780194)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9780195)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9780196)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9779722)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9779721)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9779723)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9780226)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9780227)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9780145)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9780143)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2620 (class 1259 OID 9780144)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9780006)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9779891)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9779890)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9779888)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9779889)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9780133)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9780132)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9780216)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9779805)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9780253)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9779655)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9779654)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9779687)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9779688)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9779872)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9779871)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9779870)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2416 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2417 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 9779837)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9779833)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9779830)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9779831)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9779829)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9779834)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9779832)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9779707)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9779771)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9779773)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9779772)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9779774)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9779897)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9780080)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9780111)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9779678)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9779679)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9779999)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9780277)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9779743)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9780265)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9779948)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9779947)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 9780142)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9780146)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9779731)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9780093)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9780234)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9780235)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9779628)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9779836)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9780413)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9780398)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9780403)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9780423)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9780393)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9780418)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9780408)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9780568)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9780573)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9780328)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9780508)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9780503)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9780498)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9780388)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9780538)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9780548)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9780543)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9780363)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9780358)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9780488)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9780578)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9780583)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9780588)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9780608)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9780593)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9780613)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9780603)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9780598)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9780353)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9780348)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9780313)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9780308)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9780518)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9780428)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9780288)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9780293)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9780533)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9780528)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9780523)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9780368)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9780378)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9780373)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9780693)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9780463)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9780453)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9780448)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9780458)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9780278)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9780283)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9780513)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9780493)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9780558)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9780563)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9780663)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9780648)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9780653)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9780658)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9780338)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9780333)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9780343)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9780673)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9780678)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9780638)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9780643)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9780628)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9780633)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9780553)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9780483)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9780478)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9780468)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9780473)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9780623)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9780618)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9780668)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9780383)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9780683)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9780688)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9780303)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9780298)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9780318)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9780323)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9780443)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9780438)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9780433)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-13 09:24:21 CEST

--
-- PostgreSQL database dump complete
--

