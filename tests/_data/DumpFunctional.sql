--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-13 09:57:57 CEST

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
-- TOC entry 183 (class 1259 OID 9790671)
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
-- TOC entry 228 (class 1259 OID 9791169)
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
-- TOC entry 227 (class 1259 OID 9791152)
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
-- TOC entry 221 (class 1259 OID 9791065)
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
-- TOC entry 197 (class 1259 OID 9790850)
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
-- TOC entry 200 (class 1259 OID 9790884)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9791282)
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
-- TOC entry 192 (class 1259 OID 9790793)
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
-- TOC entry 229 (class 1259 OID 9791182)
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
-- TOC entry 216 (class 1259 OID 9791010)
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
-- TOC entry 195 (class 1259 OID 9790830)
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
-- TOC entry 199 (class 1259 OID 9790878)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9790810)
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
-- TOC entry 205 (class 1259 OID 9790927)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9790952)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9790767)
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
-- TOC entry 184 (class 1259 OID 9790680)
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
-- TOC entry 185 (class 1259 OID 9790691)
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
-- TOC entry 180 (class 1259 OID 9790645)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9790664)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9790959)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9790990)
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
-- TOC entry 224 (class 1259 OID 9791103)
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
-- TOC entry 187 (class 1259 OID 9790724)
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
-- TOC entry 189 (class 1259 OID 9790759)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9790933)
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
-- TOC entry 188 (class 1259 OID 9790744)
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
-- TOC entry 194 (class 1259 OID 9790822)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9790945)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9791252)
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
-- TOC entry 232 (class 1259 OID 9791263)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9791233)
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
-- TOC entry 212 (class 1259 OID 9790974)
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
-- TOC entry 204 (class 1259 OID 9790918)
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
-- TOC entry 203 (class 1259 OID 9790908)
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
-- TOC entry 223 (class 1259 OID 9791092)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9791042)
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
-- TOC entry 177 (class 1259 OID 9790616)
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
-- TOC entry 176 (class 1259 OID 9790614)
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
-- TOC entry 213 (class 1259 OID 9790984)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9790654)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9790638)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9790998)
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
-- TOC entry 207 (class 1259 OID 9790939)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9790889)
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
-- TOC entry 237 (class 1259 OID 9791302)
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
-- TOC entry 236 (class 1259 OID 9791294)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9791289)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9791052)
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
-- TOC entry 186 (class 1259 OID 9790716)
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
-- TOC entry 202 (class 1259 OID 9790895)
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
-- TOC entry 222 (class 1259 OID 9791081)
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
-- TOC entry 233 (class 1259 OID 9791271)
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
-- TOC entry 191 (class 1259 OID 9790779)
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
-- TOC entry 178 (class 1259 OID 9790625)
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
-- TOC entry 226 (class 1259 OID 9791129)
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
-- TOC entry 196 (class 1259 OID 9790841)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9790966)
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
-- TOC entry 218 (class 1259 OID 9791035)
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
-- TOC entry 198 (class 1259 OID 9790873)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9791119)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9791025)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9790619)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9790671)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9791169)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a3-6f84-c781-d3d5a970769a	000d0000-55a3-6f84-fb47-6557f113d406	\N	00090000-55a3-6f84-fb53-d66d3891a934	\N	0001	f	\N	\N	\N	3	\N	\N	f	t
000c0000-55a3-6f84-0b3d-87d8ba034b38	000d0000-55a3-6f84-264a-f6e3075aad1b	\N	00090000-55a3-6f84-b9c1-16d5a942200f	\N	0002	f	\N	\N	\N	8	\N	\N	f	f
000c0000-55a3-6f84-d6fe-735f6f8b7eee	000d0000-55a3-6f84-9a60-e21e2016ed1c	\N	00090000-55a3-6f84-5c66-692d0ddc824f	\N	0003	f	\N	\N	\N	2	\N	\N	f	f
000c0000-55a3-6f84-64de-f534ca525f15	000d0000-55a3-6f84-7d0d-f89be795d936	\N	00090000-55a3-6f84-d173-ed882ba296d3	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a3-6f84-2f86-697b60f1546e	000d0000-55a3-6f84-335d-c2ef8e6176e2	\N	00090000-55a3-6f84-3c0e-88f1c44cb45e	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a3-6f84-afe2-199c5fa58de6	000d0000-55a3-6f84-1b68-6332d01a7df1	\N	00090000-55a3-6f84-fe5f-34c38aa56e99	\N	0006	f	\N	\N	\N	1	\N	\N	f	t
000c0000-55a3-6f84-2617-19c5bc2979b2	000d0000-55a3-6f84-4cd3-f7c5627df148	\N	00090000-55a3-6f84-ec67-8bde437ab95c	\N	0007	f	\N	\N	\N	14	\N	\N	f	t
000c0000-55a3-6f84-6eb7-42d2451fbd28	000d0000-55a3-6f84-a16a-73555b4ed476	\N	00090000-55a3-6f84-3707-a4dc14950d65	\N	0008	f	\N	\N	\N	12	\N	\N	f	t
\.


--
-- TOC entry 2902 (class 0 OID 9791152)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9791065)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a3-6f84-9164-a325c6efbc31	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a3-6f84-203a-ee655dfc00d3	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a3-6f84-9eba-8c54118ab280	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9790850)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a3-6f84-d8b5-798b69fcb2c1	\N	\N	00200000-55a3-6f84-376b-721f94881ffa	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a3-6f84-0baa-818216e8e736	\N	\N	00200000-55a3-6f84-1f9b-56bbfb1a3865	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a3-6f84-221d-1f387b817124	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a3-6f84-bc32-fd4acc536928	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a3-6f84-d578-d4af6598ad67	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9790884)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9791282)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9790793)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a3-6f81-88b4-e6514d8ee352	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a3-6f81-b5c3-f710fc5068cf	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a3-6f81-8048-06f0c3393615	AL	ALB	008	Albania 	Albanija	\N
00040000-55a3-6f81-ab1b-02d66febec48	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a3-6f81-8a9b-3b4422e9cee4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a3-6f81-e1a5-ea15479f7520	AD	AND	020	Andorra 	Andora	\N
00040000-55a3-6f81-d494-2e0c0f790a4d	AO	AGO	024	Angola 	Angola	\N
00040000-55a3-6f81-f0e1-82b605cfc5db	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a3-6f81-5872-4206001db98e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a3-6f81-b645-2b4907415316	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a3-6f81-1968-2d4370fa9bd5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a3-6f81-a30c-7ea7d48bc79b	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a3-6f81-7015-9e1a4eaa55e5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a3-6f81-1294-63ec9a049c02	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a3-6f81-bc03-aba40ad664b9	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a3-6f81-339a-3915cf7da6d5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a3-6f81-56a6-91146e21a9e8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a3-6f81-6465-da9616010a9e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a3-6f81-f40f-d1fc7ca697d8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a3-6f81-178a-c57b66dc634d	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a3-6f81-7e4e-4016f85c161f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a3-6f81-aeb0-853b8df2233a	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a3-6f81-0818-cc7da27f0949	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a3-6f81-6ffa-4f2a3ae015e9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a3-6f81-4876-3b686a3590e8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a3-6f81-2bf5-abd82a928827	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a3-6f81-61ed-3f7c2574074e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a3-6f81-2c24-a886fca1bf47	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a3-6f81-8b4c-9f6d937f2236	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a3-6f81-cfc7-41f6ee96a0bc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a3-6f81-afc7-c24c82f73ea9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a3-6f81-1924-2e50a043d9b3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a3-6f81-05c2-abef4186034c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a3-6f81-39b3-b518f44bae20	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a3-6f81-f297-0773a417cd9e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a3-6f81-c252-1bff256d61f0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a3-6f81-9384-3cd467a8940d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a3-6f81-6578-8064640c143d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a3-6f81-bff4-0c9bb2300529	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a3-6f81-b789-6ed67436c168	CA	CAN	124	Canada 	Kanada	\N
00040000-55a3-6f81-fdd6-a025aa50f4e1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a3-6f81-e8c5-b6094333fffd	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a3-6f81-c8b7-bb58348b2ca1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a3-6f81-2f07-4bd71a2b0138	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a3-6f81-793f-c6844c19324f	CL	CHL	152	Chile 	Čile	\N
00040000-55a3-6f81-0ae7-82647763462e	CN	CHN	156	China 	Kitajska	\N
00040000-55a3-6f81-07a3-dc9030af651d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a3-6f81-a163-b452b019f39b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a3-6f81-cb3d-df8cc64f88ac	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a3-6f81-7216-805f0e81dc96	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a3-6f81-d4d7-6103318e6ed6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a3-6f81-c092-5c4e800d6779	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a3-6f81-faa9-2edfba7663ac	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a3-6f81-7440-99c2099b4ea8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a3-6f81-1125-db4a77358c30	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a3-6f81-951a-67db2823aaca	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a3-6f81-c6fd-2a36410bd9bb	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a3-6f81-24b0-725ebc92aade	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a3-6f81-ebac-6b80e18d726c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a3-6f81-2b4f-e7f3c0654d54	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a3-6f81-5d39-08a0a90c1f2c	DK	DNK	208	Denmark 	Danska	\N
00040000-55a3-6f81-1297-1afdac3abf3d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a3-6f81-dd48-d684e4d718d4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a3-6f81-9f9c-4129d4e4da5e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a3-6f81-d8bf-131cab1485f1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a3-6f81-028d-a48ecf906d1d	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a3-6f81-4da4-411a4e6b405e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a3-6f81-4883-050c070c27f7	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a3-6f81-59e0-af24d254987c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a3-6f81-7eb0-0cf227973dc7	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a3-6f81-d73c-b6c35920ac0b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a3-6f81-2423-dc28d2e66727	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a3-6f81-1d54-a46c13bb0e62	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a3-6f81-93d4-300096530b6b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a3-6f81-46cd-ddd24bb0297b	FI	FIN	246	Finland 	Finska	\N
00040000-55a3-6f81-61db-d0bf45a43cea	FR	FRA	250	France 	Francija	\N
00040000-55a3-6f81-e39c-53b6d6ce7ac4	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a3-6f81-ceab-5e35728f8c08	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a3-6f81-8b35-74e6d2d4b2eb	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a3-6f81-6b18-f0543f4c5716	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a3-6f81-f9a2-2da67f0f3e7e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a3-6f81-13dd-eee8f2c8ea3d	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a3-6f81-6265-be77f36eb14a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a3-6f81-b1d3-883663ae56c6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a3-6f81-9b70-801cd9988edb	GH	GHA	288	Ghana 	Gana	\N
00040000-55a3-6f81-5ab1-0371d3a4cd24	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a3-6f81-00cc-277ae9fba5b1	GR	GRC	300	Greece 	Grčija	\N
00040000-55a3-6f81-9ef2-cbd69d64a925	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a3-6f81-1fee-a8ff5714d704	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a3-6f81-7730-8a2356a9ea8f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a3-6f81-cc47-36dec5921b93	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a3-6f81-10f0-3cef017f3b43	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a3-6f81-45ca-8ee75643aefc	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a3-6f81-dd18-a1a1669ef04d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a3-6f81-85ad-a175cc3ce90c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a3-6f81-4c5f-d0e9ba80c659	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a3-6f81-e8d2-986e1840b75a	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a3-6f81-ebde-1709d64527b5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a3-6f81-1f3f-246a9a165e7a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a3-6f81-921e-584e19e032a7	HN	HND	340	Honduras 	Honduras	\N
00040000-55a3-6f81-84b2-b0a467c0381a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a3-6f81-a347-5db09b8ec5e6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a3-6f81-fc62-2723d2d182e4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a3-6f81-dae6-9b1fab753d06	IN	IND	356	India 	Indija	\N
00040000-55a3-6f81-06a8-22cf9627ad51	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a3-6f81-374a-96235f0a3597	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a3-6f81-0c99-3356c09aaeba	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a3-6f81-aa94-7930601e6120	IE	IRL	372	Ireland 	Irska	\N
00040000-55a3-6f81-5bc2-639ff42dd60b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a3-6f81-e6fe-3de45f9baf52	IL	ISR	376	Israel 	Izrael	\N
00040000-55a3-6f81-c833-d7e198d848e2	IT	ITA	380	Italy 	Italija	\N
00040000-55a3-6f81-b78c-b99bc56b5ebd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a3-6f81-29d6-9e8aa66cdcf0	JP	JPN	392	Japan 	Japonska	\N
00040000-55a3-6f81-17fd-8a361c174382	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a3-6f81-ba8b-2deeda591a1a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a3-6f81-4358-baf94cab4a07	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a3-6f81-090c-fb9ea246cabb	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a3-6f81-6720-e97445fe0832	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a3-6f81-0f8b-e69933bbd645	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a3-6f81-d3d4-3e7e3b5fea5a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a3-6f81-166e-9aa66c0a037c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a3-6f81-ba57-eaf3c8ecd9e4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a3-6f81-912c-e2dee5732cf6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a3-6f81-3137-1f0be4ac8fd4	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a3-6f81-107f-c459d35f2523	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a3-6f81-8dd1-fe4bc07cf903	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a3-6f81-d39b-c70305300704	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a3-6f81-0a4e-47870e688a53	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a3-6f81-f986-5212f9bc3df4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a3-6f81-26b4-0eb22f9baab6	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a3-6f81-48d0-df246dee610d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a3-6f81-2bc7-d7f075c2931d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a3-6f81-6665-e9eb8ef895d0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a3-6f81-55a3-34a175cce78c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a3-6f81-94d3-06fcb4bec5e4	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a3-6f81-3abe-9ac61195c9b6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a3-6f81-7417-35af3c20acfa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a3-6f81-7ea0-24bf1a437b57	ML	MLI	466	Mali 	Mali	\N
00040000-55a3-6f81-9e63-37b7ee402c25	MT	MLT	470	Malta 	Malta	\N
00040000-55a3-6f81-9967-d3d7e9635332	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a3-6f81-ded9-781ed338ece6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a3-6f81-0b3e-5e85bcbb3bca	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a3-6f81-2ffd-f3315d7a74ce	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a3-6f81-b559-d404dea203bc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a3-6f81-fe2a-83e5263bb8ce	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a3-6f81-625c-ea569d03d01d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a3-6f81-6ee2-ad78cfad5904	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a3-6f81-8ead-20aff6931794	MC	MCO	492	Monaco 	Monako	\N
00040000-55a3-6f81-5ebf-51f86917543e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a3-6f81-9530-f3be89f9c220	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a3-6f81-9c1d-056a5447de3b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a3-6f81-c1c2-e953502fcfd3	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a3-6f81-5d49-8b8aa59bd03e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a3-6f81-e5b3-c0cc22220b4b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a3-6f81-2184-27bdc08cd75d	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a3-6f81-8777-9191d9690d13	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a3-6f81-79bc-89073095c4d9	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a3-6f81-ecca-ba57b1aec49a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a3-6f81-ab31-69e290eab62a	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a3-6f81-8b8b-ff996bc690a8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a3-6f81-ae8a-0d3c74237271	NE	NER	562	Niger 	Niger 	\N
00040000-55a3-6f81-5e04-2bd3920d8855	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a3-6f81-7179-ae3fd9a3e75d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a3-6f81-2a89-679f6ffd16ea	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a3-6f81-ec79-5368b30ec0d7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a3-6f81-eb9d-a44f4098e47a	NO	NOR	578	Norway 	Norveška	\N
00040000-55a3-6f81-a9d1-015a48b10171	OM	OMN	512	Oman 	Oman	\N
00040000-55a3-6f81-b997-72f91a5ae803	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a3-6f81-f66b-e59262599a5d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a3-6f81-eaf9-0a0c59bba9c0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a3-6f81-f1b5-9c010f2c49a8	PA	PAN	591	Panama 	Panama	\N
00040000-55a3-6f81-020a-cad56d4d98cc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a3-6f81-ba23-de50ce573d58	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a3-6f81-03fa-3b223b3b08d5	PE	PER	604	Peru 	Peru	\N
00040000-55a3-6f81-55b8-dcaa98e0f63f	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a3-6f81-20ee-11a64235e78c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a3-6f81-d1f7-88be5a30d024	PL	POL	616	Poland 	Poljska	\N
00040000-55a3-6f81-38da-37876a14e8ba	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a3-6f81-1752-c347535842a9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a3-6f81-fe29-efb17fb1df78	QA	QAT	634	Qatar 	Katar	\N
00040000-55a3-6f81-f496-420ffa4b3365	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a3-6f81-4f1f-2d4ac071daf2	RO	ROU	642	Romania 	Romunija	\N
00040000-55a3-6f81-a10d-0285551fed80	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a3-6f81-8eb3-1ea2e21c4090	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a3-6f81-78a1-77fc4f7b7780	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a3-6f81-e2ca-84e77b45218d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a3-6f81-2606-97bbb3bf8afd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a3-6f81-5c3b-249dd87632a8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a3-6f81-132e-5d5a0cf8640c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a3-6f81-a2dd-2dcaad3e2eae	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a3-6f81-e59a-0d28753769ba	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a3-6f81-4aa9-f9d22bf6d93f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a3-6f81-e2c8-085d8ef085c2	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a3-6f81-b6ee-11e9c6f17e28	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a3-6f81-336c-93d5b9ae4b80	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a3-6f81-6800-d55d0ee2be29	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a3-6f81-cfe0-1ed9ea48e9a0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a3-6f81-f2b8-840fe44e8f33	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a3-6f81-5a58-5e03ea6290a8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a3-6f81-4c0c-334e79781475	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a3-6f81-143c-8fa658aa31bf	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a3-6f82-4224-e5e11e035550	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a3-6f82-8fa4-a1896f16436f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a3-6f82-eca7-6bb380376754	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a3-6f82-ca95-e9110a940d40	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a3-6f82-e3e5-70a3a4d0abc2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a3-6f82-ee0e-93fc95766e4c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a3-6f82-8db9-8f3f6048fd75	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a3-6f82-a7e6-4b55cfc0b8a5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a3-6f82-b59c-d5cd82d87e45	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a3-6f82-9aeb-69a038aa5e11	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a3-6f82-db15-57b837b3e514	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a3-6f82-ba4f-3030b216d005	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a3-6f82-c71d-a535aa842273	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a3-6f82-bc22-c08c5dd8337a	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a3-6f82-04d7-26855a10cace	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a3-6f82-9e95-f1d99252808a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a3-6f82-72cb-ce89fecd03b6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a3-6f82-b74a-bc6eacefbcba	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a3-6f82-c29a-eeebb708701c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a3-6f82-0e41-15cf0045d77b	TH	THA	764	Thailand 	Tajska	\N
00040000-55a3-6f82-5b2e-60ba71b49630	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a3-6f82-9b7d-903bf2b55785	TG	TGO	768	Togo 	Togo	\N
00040000-55a3-6f82-8512-98ed6a8c663f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a3-6f82-1302-3787ff177c65	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a3-6f82-a860-eb16cb015458	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a3-6f82-8970-3b0b3eeff7bf	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a3-6f82-87a0-56bfe1af9ac9	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a3-6f82-0aed-2fc5ccd32a5f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a3-6f82-f062-03da7e979c68	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a3-6f82-adb3-053be4f942ac	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a3-6f82-36e4-3696541b702a	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a3-6f82-d195-51fa6c7963f0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a3-6f82-e78a-aa9b8c07efda	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a3-6f82-21ad-54dd0981fe3e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a3-6f82-284e-e88516b57793	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a3-6f82-c32d-1980ea422d64	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a3-6f82-9fec-6ce9a3fe7080	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a3-6f82-64ac-b051323e0f60	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a3-6f82-3968-02dc0903d522	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a3-6f82-1631-113eb113f0cc	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a3-6f82-a614-7cd4c74d1ca3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a3-6f82-06b6-f9adece7efa0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a3-6f82-0402-99c9d94f03c2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a3-6f82-133f-580407c6ba31	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a3-6f82-4388-da1bf9d069b7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a3-6f82-c53c-0f624f789b7d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a3-6f82-d865-5956ef731a6e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a3-6f82-a64d-d1018e74f34a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9791182)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a3-6f84-c054-6dc4b1908215	000e0000-55a3-6f84-bd3a-fb51a1167191	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-55a3-6f83-c688-29dae6f7fa3d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a3-6f84-65d7-92ae75422f89	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a3-6f83-2a57-35e3d36f1b9b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9791010)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a3-6f84-4cd3-f7c5627df148	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a3-6f83-e5cd-7545a980090f
000d0000-55a3-6f84-fb47-6557f113d406	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a3-6f83-e5cd-7545a980090f
000d0000-55a3-6f84-264a-f6e3075aad1b	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a3-6f83-b24b-0993186a7940
000d0000-55a3-6f84-9a60-e21e2016ed1c	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a3-6f83-cc40-451d83da8123
000d0000-55a3-6f84-7d0d-f89be795d936	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a3-6f83-cc40-451d83da8123
000d0000-55a3-6f84-335d-c2ef8e6176e2	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a3-6f83-cc40-451d83da8123
000d0000-55a3-6f84-1b68-6332d01a7df1	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a3-6f83-e5cd-7545a980090f
000d0000-55a3-6f84-a16a-73555b4ed476	000e0000-55a3-6f84-c52a-ad6dce25ed24	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a3-6f83-4c95-eb3131ea660b
\.


--
-- TOC entry 2870 (class 0 OID 9790830)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9790878)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9790810)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a3-6f84-926e-8ae9b4aaf36c	00080000-55a3-6f84-d67e-af2fc347744a	00090000-55a3-6f84-fb53-d66d3891a934	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9790927)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9790952)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9790767)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a3-6f82-f215-5c175c188e82	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a3-6f82-2493-10a1fcd21dd5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a3-6f82-2532-694c3a9c6a8e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a3-6f82-2c53-cae68e30aad2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a3-6f82-e332-7d1241b31021	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a3-6f82-0570-7af023ac7cc8	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a3-6f82-05a9-3a5dc5d668ac	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a3-6f82-aad2-ff8a594b225a	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a3-6f82-453d-9b718715e6e3	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a3-6f82-abf1-b41b5162e193	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a3-6f82-c941-e8dafeec1096	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a3-6f82-3903-37a769d8e9ac	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a3-6f82-eff2-ee36a736afe1	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-55a3-6f84-bde2-3316ef017216	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a3-6f84-4f4b-55e743571c4f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a3-6f84-917f-2037d99352cf	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a3-6f84-a742-8f2e94c9e17d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a3-6f84-d195-f652902eca85	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a3-6f84-d7fe-7bc46e32da6d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9790680)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a3-6f84-18ad-ed6ce1060f39	00000000-55a3-6f84-4f4b-55e743571c4f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a3-6f84-00ab-b721d84b1c8d	00000000-55a3-6f84-4f4b-55e743571c4f	00010000-55a3-6f82-3692-2f1dab3db474	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a3-6f84-3a7d-fc196759222a	00000000-55a3-6f84-917f-2037d99352cf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9790691)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a3-6f84-dae0-3b0b8c14db72	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a3-6f84-d173-ed882ba296d3	00010000-55a3-6f84-f0d1-810f2da1a2c8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a3-6f84-5c66-692d0ddc824f	00010000-55a3-6f84-4201-60fe094bb948	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a3-6f84-3a47-eab5de791af3	00010000-55a3-6f84-3318-2ce03c271193	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a3-6f84-7df2-996a4b6e8c7e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a3-6f84-fe5f-34c38aa56e99	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a3-6f84-436c-ebe45fefb9fa	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a3-6f84-ec67-8bde437ab95c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a3-6f84-fb53-d66d3891a934	00010000-55a3-6f84-ff2d-1a5527bd245e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a3-6f84-b9c1-16d5a942200f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a3-6f84-f0a2-aa8e5784c020	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a3-6f84-3c0e-88f1c44cb45e	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a3-6f84-3707-a4dc14950d65	00010000-55a3-6f84-6c2c-b4944af5dc54	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9790645)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a3-6f82-9cc5-cbb7297a2b2f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a3-6f82-3b73-c978f95191dd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a3-6f82-f5ae-8e755117c0d7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a3-6f82-4a74-8b4f29d15a74	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a3-6f82-ae61-fb0f57b75c2c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a3-6f82-2e20-88c7a302f1e4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a3-6f82-766e-c03e74e46b7c	Abonma-read	Abonma - branje	f
00030000-55a3-6f82-2572-83198aef5212	Abonma-write	Abonma - spreminjanje	f
00030000-55a3-6f82-71bd-d15686a3f1e0	Alternacija-read	Alternacija - branje	f
00030000-55a3-6f82-df3f-d8f4b4fd586f	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a3-6f82-6754-4ac681852563	Arhivalija-read	Arhivalija - branje	f
00030000-55a3-6f82-3ce6-b1309e3962eb	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a3-6f82-a642-0e2a7bb5a02d	Besedilo-read	Besedilo - branje	f
00030000-55a3-6f82-35e1-310be00313ed	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a3-6f82-b72a-e7586adb7290	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a3-6f82-4a58-025c3bdf985a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a3-6f82-f5da-fe9abc30ed77	Dogodek-read	Dogodek - branje	f
00030000-55a3-6f82-bf16-9e80ea5b5f81	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a3-6f82-8643-5c1f41d25b4e	DrugiVir-read	DrugiVir - branje	f
00030000-55a3-6f82-52f9-bb7063e84ae3	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a3-6f82-89f6-b5e24de88c38	Drzava-read	Drzava - branje	f
00030000-55a3-6f82-e5af-dc4c043a8e34	Drzava-write	Drzava - spreminjanje	f
00030000-55a3-6f82-e4b7-55d2d3abe7b3	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a3-6f82-6088-900e7ba727aa	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a3-6f82-19e4-d850f7aab8bd	Funkcija-read	Funkcija - branje	f
00030000-55a3-6f82-ac02-c454ff2f0905	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a3-6f82-e231-2042c19a3fd4	Gostovanje-read	Gostovanje - branje	f
00030000-55a3-6f82-3994-d0cf4ee1472c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a3-6f82-4195-97ac58799308	Gostujoca-read	Gostujoca - branje	f
00030000-55a3-6f82-0f5b-10b797ed60b6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a3-6f82-8734-950212d08af0	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a3-6f82-7a18-1de56b7ce420	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a3-6f82-77a5-2078159c16c1	Kupec-read	Kupec - branje	f
00030000-55a3-6f82-3c39-03609d4924d8	Kupec-write	Kupec - spreminjanje	f
00030000-55a3-6f82-187f-e045a45160c4	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a3-6f82-cb78-02cd2ae929e9	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a3-6f82-d053-05f24923ab98	Option-read	Option - branje	f
00030000-55a3-6f82-2293-66d2a506cacb	Option-write	Option - spreminjanje	f
00030000-55a3-6f82-dfa8-8e1123c40257	OptionValue-read	OptionValue - branje	f
00030000-55a3-6f82-a778-39f04f63b034	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a3-6f82-403f-c024d818806b	Oseba-read	Oseba - branje	f
00030000-55a3-6f82-0e5f-808c8ab43d8d	Oseba-write	Oseba - spreminjanje	f
00030000-55a3-6f82-1030-6469e07c04f7	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a3-6f82-a91f-82b4bf8e026d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a3-6f82-7b50-3e89145a999f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a3-6f82-59bf-fe62f6347821	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a3-6f82-0fa1-5b1b783ef99b	Pogodba-read	Pogodba - branje	f
00030000-55a3-6f82-a7a8-b1ee1c21c840	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a3-6f82-e517-4d418f5cce41	Popa-read	Popa - branje	f
00030000-55a3-6f82-e39e-4c96a44b26a9	Popa-write	Popa - spreminjanje	f
00030000-55a3-6f82-13ae-ccc7b007fab1	Posta-read	Posta - branje	f
00030000-55a3-6f82-5025-8a8f907ac557	Posta-write	Posta - spreminjanje	f
00030000-55a3-6f82-f0a0-484eb32b62ce	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a3-6f82-743f-f4f6ecb95893	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a3-6f82-83c6-f9f304bafbb9	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a3-6f82-d7c9-f6abacd994b0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a3-6f82-d3ec-7b7dc2003357	Predstava-read	Predstava - branje	f
00030000-55a3-6f82-4f74-304d89003786	Predstava-write	Predstava - spreminjanje	f
00030000-55a3-6f82-ebff-68b99f8cfef0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a3-6f82-cf9a-baafa4b38ac8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a3-6f82-4a4d-0fd7ba4d184f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a3-6f82-85f9-f57bee47fd32	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a3-6f82-2aeb-326506a4e661	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a3-6f82-6b43-f1159eb2529a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a3-6f82-c8a6-6f7c3f86c411	ProgramDela-read	ProgramDela - branje	f
00030000-55a3-6f82-4d06-1d9530f7d44b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a3-6f82-5bfa-336d72bee412	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a3-6f82-f650-86e6ea1888ed	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a3-6f82-7635-a601ec92cecc	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a3-6f82-910a-e6920b094a51	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a3-6f82-1ac7-0cefe8293c41	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a3-6f82-5ba1-00cd64f8a29e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a3-6f82-1480-a1a13cd3841d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a3-6f82-8a5e-9ea2db305be7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a3-6f82-3c42-11f705279358	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a3-6f82-f925-c99e49b4c309	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a3-6f82-6960-fcc23d334407	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a3-6f82-8caf-9b22bafcadbd	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a3-6f82-8f48-17c835bccd9a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a3-6f82-21f4-25063ddfbb36	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a3-6f82-da14-a592e79d2cec	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a3-6f82-eb35-87a7f04f665b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a3-6f82-2a36-799d79404a88	Prostor-read	Prostor - branje	f
00030000-55a3-6f82-8a71-a996a1ccb8c3	Prostor-write	Prostor - spreminjanje	f
00030000-55a3-6f82-5e15-4bf78cea5469	Racun-read	Racun - branje	f
00030000-55a3-6f82-da47-cba380c0fc6f	Racun-write	Racun - spreminjanje	f
00030000-55a3-6f82-e8dd-cf0b320b6c19	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a3-6f82-98be-ee3ea0695ebf	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a3-6f82-e506-a82faaa25e67	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a3-6f82-f986-62732648d239	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a3-6f82-c221-a8508b11a19e	Rekvizit-read	Rekvizit - branje	f
00030000-55a3-6f82-fb07-30447fd52250	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a3-6f82-ab89-b9bdfad496d5	Revizija-read	Revizija - branje	f
00030000-55a3-6f82-83ad-68cf0606f810	Revizija-write	Revizija - spreminjanje	f
00030000-55a3-6f82-3d6c-245bb307799a	Rezervacija-read	Rezervacija - branje	f
00030000-55a3-6f82-8ca3-1f719bc4e5cb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a3-6f82-a990-613dc2cf5139	SedezniRed-read	SedezniRed - branje	f
00030000-55a3-6f82-8ced-4dc0ac35f089	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a3-6f82-d99c-29a9e5602623	Sedez-read	Sedez - branje	f
00030000-55a3-6f82-fcbf-4831e8951654	Sedez-write	Sedez - spreminjanje	f
00030000-55a3-6f82-a681-5e068038efcd	Sezona-read	Sezona - branje	f
00030000-55a3-6f82-3dbf-b153b4ea3c99	Sezona-write	Sezona - spreminjanje	f
00030000-55a3-6f82-0561-0971cdcf4957	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a3-6f82-1af3-295642e79383	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a3-6f82-e0f8-4a4197b9e89f	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a3-6f82-0ddb-4c4ae308ea3e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a3-6f82-2742-705afe185eeb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a3-6f82-551d-b3a844c31d64	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a3-6f82-f8b5-7266725eceae	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a3-6f82-53f1-125b1bec4397	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a3-6f82-44fe-b690580c8674	Telefonska-read	Telefonska - branje	f
00030000-55a3-6f82-7c71-324d6cdacebf	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a3-6f82-eeda-f5d9a28f58e2	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a3-6f82-a9c5-a110196d5525	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a3-6f82-34c9-3780a57e3ac9	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a3-6f82-1ce2-19936199d623	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a3-6f82-9135-e290f2c3251f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a3-6f82-0f2a-4e143fad12ec	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a3-6f82-c5c1-c72bb80ac064	Trr-read	Trr - branje	f
00030000-55a3-6f82-7d9c-d977565c4d10	Trr-write	Trr - spreminjanje	f
00030000-55a3-6f82-675a-df6f8cfa781f	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a3-6f82-fbb7-bf360208f54b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a3-6f82-c74d-1ab0942a9b75	Vaja-read	Vaja - branje	f
00030000-55a3-6f82-4e7e-b6be17f5f2b5	Vaja-write	Vaja - spreminjanje	f
00030000-55a3-6f82-6921-c69bb295ec62	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a3-6f82-31f4-c4e5e8fb7616	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a3-6f82-3c9b-16cafb14ddfc	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a3-6f82-2672-956d489feeff	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a3-6f82-e894-32a6c4eb1d0b	Zasedenost-read	Zasedenost - branje	f
00030000-55a3-6f82-3787-46acc6dd4c56	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a3-6f82-f16e-9d413f56d1aa	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a3-6f82-570d-a312a6de7934	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a3-6f82-a7c0-270aee6387f5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a3-6f82-bdba-630432d00f12	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9790664)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a3-6f82-a33f-0e00a02de042	00030000-55a3-6f82-3b73-c978f95191dd
00020000-55a3-6f82-41f3-fe750bcb056c	00030000-55a3-6f82-89f6-b5e24de88c38
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-766e-c03e74e46b7c
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-2572-83198aef5212
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-71bd-d15686a3f1e0
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-df3f-d8f4b4fd586f
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-6754-4ac681852563
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-f5da-fe9abc30ed77
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-4a74-8b4f29d15a74
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-bf16-9e80ea5b5f81
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-89f6-b5e24de88c38
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-e5af-dc4c043a8e34
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-19e4-d850f7aab8bd
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-ac02-c454ff2f0905
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-e231-2042c19a3fd4
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-3994-d0cf4ee1472c
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-4195-97ac58799308
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-0f5b-10b797ed60b6
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-8734-950212d08af0
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-7a18-1de56b7ce420
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-d053-05f24923ab98
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-dfa8-8e1123c40257
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-403f-c024d818806b
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-0e5f-808c8ab43d8d
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-e517-4d418f5cce41
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-e39e-4c96a44b26a9
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-13ae-ccc7b007fab1
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-5025-8a8f907ac557
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-83c6-f9f304bafbb9
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-d7c9-f6abacd994b0
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-d3ec-7b7dc2003357
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-4f74-304d89003786
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-2aeb-326506a4e661
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-6b43-f1159eb2529a
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-2a36-799d79404a88
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-8a71-a996a1ccb8c3
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-e506-a82faaa25e67
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-f986-62732648d239
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-c221-a8508b11a19e
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-fb07-30447fd52250
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-a681-5e068038efcd
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-3dbf-b153b4ea3c99
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-34c9-3780a57e3ac9
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-675a-df6f8cfa781f
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-fbb7-bf360208f54b
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-c74d-1ab0942a9b75
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-4e7e-b6be17f5f2b5
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-e894-32a6c4eb1d0b
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-3787-46acc6dd4c56
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-f16e-9d413f56d1aa
00020000-55a3-6f82-6ddc-53bcee5bdc4e	00030000-55a3-6f82-a7c0-270aee6387f5
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-766e-c03e74e46b7c
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-6754-4ac681852563
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-f5da-fe9abc30ed77
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-89f6-b5e24de88c38
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-e231-2042c19a3fd4
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-4195-97ac58799308
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-8734-950212d08af0
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-7a18-1de56b7ce420
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-d053-05f24923ab98
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-dfa8-8e1123c40257
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-403f-c024d818806b
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-0e5f-808c8ab43d8d
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-e517-4d418f5cce41
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-13ae-ccc7b007fab1
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-83c6-f9f304bafbb9
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-d7c9-f6abacd994b0
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-d3ec-7b7dc2003357
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-2a36-799d79404a88
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-e506-a82faaa25e67
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-c221-a8508b11a19e
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-a681-5e068038efcd
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-44fe-b690580c8674
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-7c71-324d6cdacebf
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-c5c1-c72bb80ac064
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-7d9c-d977565c4d10
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-3c9b-16cafb14ddfc
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-2672-956d489feeff
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-f16e-9d413f56d1aa
00020000-55a3-6f82-ece8-0c5563b3ae65	00030000-55a3-6f82-a7c0-270aee6387f5
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-766e-c03e74e46b7c
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-71bd-d15686a3f1e0
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-6754-4ac681852563
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-3ce6-b1309e3962eb
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-a642-0e2a7bb5a02d
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-b72a-e7586adb7290
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-f5da-fe9abc30ed77
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-89f6-b5e24de88c38
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-19e4-d850f7aab8bd
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-e231-2042c19a3fd4
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-4195-97ac58799308
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-8734-950212d08af0
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-d053-05f24923ab98
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-dfa8-8e1123c40257
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-403f-c024d818806b
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-e517-4d418f5cce41
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-13ae-ccc7b007fab1
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-d3ec-7b7dc2003357
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-2aeb-326506a4e661
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-2a36-799d79404a88
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-e506-a82faaa25e67
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-c221-a8508b11a19e
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-a681-5e068038efcd
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-34c9-3780a57e3ac9
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-c74d-1ab0942a9b75
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-e894-32a6c4eb1d0b
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-f16e-9d413f56d1aa
00020000-55a3-6f82-b9e1-9a00586b3275	00030000-55a3-6f82-a7c0-270aee6387f5
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-766e-c03e74e46b7c
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-2572-83198aef5212
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-df3f-d8f4b4fd586f
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-6754-4ac681852563
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-f5da-fe9abc30ed77
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-89f6-b5e24de88c38
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-e231-2042c19a3fd4
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-4195-97ac58799308
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-d053-05f24923ab98
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-dfa8-8e1123c40257
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-e517-4d418f5cce41
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-13ae-ccc7b007fab1
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-d3ec-7b7dc2003357
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-2a36-799d79404a88
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-e506-a82faaa25e67
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-c221-a8508b11a19e
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-a681-5e068038efcd
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-34c9-3780a57e3ac9
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-f16e-9d413f56d1aa
00020000-55a3-6f82-10c0-183a84eb7c21	00030000-55a3-6f82-a7c0-270aee6387f5
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-766e-c03e74e46b7c
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-6754-4ac681852563
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-f5da-fe9abc30ed77
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-89f6-b5e24de88c38
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-e231-2042c19a3fd4
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-4195-97ac58799308
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-d053-05f24923ab98
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-dfa8-8e1123c40257
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-e517-4d418f5cce41
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-13ae-ccc7b007fab1
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-d3ec-7b7dc2003357
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-2a36-799d79404a88
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-e506-a82faaa25e67
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-c221-a8508b11a19e
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-a681-5e068038efcd
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-eeda-f5d9a28f58e2
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-f5ae-8e755117c0d7
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-34c9-3780a57e3ac9
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-f16e-9d413f56d1aa
00020000-55a3-6f82-ed4b-d61ef407b78d	00030000-55a3-6f82-a7c0-270aee6387f5
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-9cc5-cbb7297a2b2f
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3b73-c978f95191dd
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-f5ae-8e755117c0d7
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-4a74-8b4f29d15a74
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-ae61-fb0f57b75c2c
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-2e20-88c7a302f1e4
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-766e-c03e74e46b7c
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-2572-83198aef5212
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-71bd-d15686a3f1e0
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-df3f-d8f4b4fd586f
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-6754-4ac681852563
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3ce6-b1309e3962eb
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-a642-0e2a7bb5a02d
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-35e1-310be00313ed
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-b72a-e7586adb7290
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-4a58-025c3bdf985a
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-f5da-fe9abc30ed77
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-bf16-9e80ea5b5f81
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-89f6-b5e24de88c38
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e5af-dc4c043a8e34
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-8643-5c1f41d25b4e
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-52f9-bb7063e84ae3
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e4b7-55d2d3abe7b3
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-6088-900e7ba727aa
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-19e4-d850f7aab8bd
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-ac02-c454ff2f0905
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e231-2042c19a3fd4
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3994-d0cf4ee1472c
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-4195-97ac58799308
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-0f5b-10b797ed60b6
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-8734-950212d08af0
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-7a18-1de56b7ce420
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-77a5-2078159c16c1
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3c39-03609d4924d8
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-187f-e045a45160c4
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-cb78-02cd2ae929e9
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-d053-05f24923ab98
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-2293-66d2a506cacb
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-dfa8-8e1123c40257
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-a778-39f04f63b034
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-403f-c024d818806b
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-0e5f-808c8ab43d8d
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-1030-6469e07c04f7
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-a91f-82b4bf8e026d
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-7b50-3e89145a999f
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-59bf-fe62f6347821
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-0fa1-5b1b783ef99b
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-a7a8-b1ee1c21c840
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e517-4d418f5cce41
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e39e-4c96a44b26a9
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-13ae-ccc7b007fab1
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-5025-8a8f907ac557
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-f0a0-484eb32b62ce
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-743f-f4f6ecb95893
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-83c6-f9f304bafbb9
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-d7c9-f6abacd994b0
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-d3ec-7b7dc2003357
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-4f74-304d89003786
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-ebff-68b99f8cfef0
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-cf9a-baafa4b38ac8
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-4a4d-0fd7ba4d184f
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-85f9-f57bee47fd32
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-2aeb-326506a4e661
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-6b43-f1159eb2529a
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-c8a6-6f7c3f86c411
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-4d06-1d9530f7d44b
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-5bfa-336d72bee412
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-f650-86e6ea1888ed
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-7635-a601ec92cecc
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-910a-e6920b094a51
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-1ac7-0cefe8293c41
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-5ba1-00cd64f8a29e
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-1480-a1a13cd3841d
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-8a5e-9ea2db305be7
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3c42-11f705279358
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-f925-c99e49b4c309
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-6960-fcc23d334407
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-8caf-9b22bafcadbd
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-8f48-17c835bccd9a
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-21f4-25063ddfbb36
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-da14-a592e79d2cec
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-eb35-87a7f04f665b
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-2a36-799d79404a88
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-8a71-a996a1ccb8c3
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-5e15-4bf78cea5469
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-da47-cba380c0fc6f
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e8dd-cf0b320b6c19
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-98be-ee3ea0695ebf
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e506-a82faaa25e67
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-f986-62732648d239
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-c221-a8508b11a19e
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-fb07-30447fd52250
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-ab89-b9bdfad496d5
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-83ad-68cf0606f810
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3d6c-245bb307799a
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-8ca3-1f719bc4e5cb
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-a990-613dc2cf5139
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-8ced-4dc0ac35f089
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-d99c-29a9e5602623
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-fcbf-4831e8951654
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-a681-5e068038efcd
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3dbf-b153b4ea3c99
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-0561-0971cdcf4957
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-1af3-295642e79383
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e0f8-4a4197b9e89f
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-0ddb-4c4ae308ea3e
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-2742-705afe185eeb
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-551d-b3a844c31d64
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-f8b5-7266725eceae
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-53f1-125b1bec4397
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-44fe-b690580c8674
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-7c71-324d6cdacebf
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-eeda-f5d9a28f58e2
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-a9c5-a110196d5525
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-34c9-3780a57e3ac9
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-1ce2-19936199d623
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-9135-e290f2c3251f
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-0f2a-4e143fad12ec
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-c5c1-c72bb80ac064
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-7d9c-d977565c4d10
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-675a-df6f8cfa781f
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-fbb7-bf360208f54b
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-c74d-1ab0942a9b75
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-4e7e-b6be17f5f2b5
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-6921-c69bb295ec62
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-31f4-c4e5e8fb7616
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3c9b-16cafb14ddfc
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-2672-956d489feeff
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-e894-32a6c4eb1d0b
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-3787-46acc6dd4c56
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-f16e-9d413f56d1aa
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-570d-a312a6de7934
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-a7c0-270aee6387f5
00020000-55a3-6f84-0f74-2a21f49b6d05	00030000-55a3-6f82-bdba-630432d00f12
\.


--
-- TOC entry 2885 (class 0 OID 9790959)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9790990)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9791103)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-55a3-6f84-2d82-042e34774e87	00090000-55a3-6f84-dae0-3b0b8c14db72	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-55a3-6f84-8506-505912adf38d	00090000-55a3-6f84-fe5f-34c38aa56e99	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-55a3-6f84-8899-cec9847d567d	00090000-55a3-6f84-3707-a4dc14950d65	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9790724)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a3-6f84-d67e-af2fc347744a	00040000-55a3-6f82-8fa4-a1896f16436f	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-6f84-bd2a-4673b2c23219	00040000-55a3-6f82-8fa4-a1896f16436f	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a3-6f84-cbe5-ab74acfb0bc6	00040000-55a3-6f82-8fa4-a1896f16436f	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-6f84-4647-f1bf32dfb8cb	00040000-55a3-6f82-8fa4-a1896f16436f	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-6f84-9242-caa474f208d3	00040000-55a3-6f82-8fa4-a1896f16436f	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-6f84-4c14-1fb3b7a9757a	00040000-55a3-6f81-1968-2d4370fa9bd5	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-6f84-2172-539cdeb21886	00040000-55a3-6f81-951a-67db2823aaca	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-6f84-199c-7f4bd0400671	00040000-55a3-6f81-bc03-aba40ad664b9	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-6f84-dae7-002130e39933	00040000-55a3-6f82-8fa4-a1896f16436f	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9790759)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a3-6f82-6ca7-c0942394c2df	8341	Adlešiči
00050000-55a3-6f82-eeef-cd7278c99739	5270	Ajdovščina
00050000-55a3-6f82-b16f-785bb304bdbe	6280	Ankaran/Ancarano
00050000-55a3-6f82-0631-42afcd051009	9253	Apače
00050000-55a3-6f82-f1bf-826c69d78648	8253	Artiče
00050000-55a3-6f82-8f54-59f73b885546	4275	Begunje na Gorenjskem
00050000-55a3-6f82-e121-fdb4310c48ce	1382	Begunje pri Cerknici
00050000-55a3-6f82-11c9-e1668e522a96	9231	Beltinci
00050000-55a3-6f82-e426-85b9b36b3e84	2234	Benedikt
00050000-55a3-6f82-7fb7-ba2012640fe1	2345	Bistrica ob Dravi
00050000-55a3-6f82-a23e-9ae401f98acf	3256	Bistrica ob Sotli
00050000-55a3-6f82-bfa4-c00ff34e4732	8259	Bizeljsko
00050000-55a3-6f82-13b0-b413631e0a6b	1223	Blagovica
00050000-55a3-6f82-32da-44d536480c34	8283	Blanca
00050000-55a3-6f82-c41a-31ac9f2d4708	4260	Bled
00050000-55a3-6f82-ba66-f9e03cbf0304	4273	Blejska Dobrava
00050000-55a3-6f82-ff33-67989b6f7dae	9265	Bodonci
00050000-55a3-6f82-2d2a-4c70c8d68d2b	9222	Bogojina
00050000-55a3-6f82-fa3b-d6adb1f0c202	4263	Bohinjska Bela
00050000-55a3-6f82-e4a6-767b12599452	4264	Bohinjska Bistrica
00050000-55a3-6f82-9f12-dd448b5cbca2	4265	Bohinjsko jezero
00050000-55a3-6f82-19a4-3cb7f4c436bd	1353	Borovnica
00050000-55a3-6f82-7165-3f2159821a03	8294	Boštanj
00050000-55a3-6f82-7d8d-8db02bcddf74	5230	Bovec
00050000-55a3-6f82-296b-23b6be84a162	5295	Branik
00050000-55a3-6f82-257f-23e0a4d84363	3314	Braslovče
00050000-55a3-6f82-e3a9-7161b855b0cf	5223	Breginj
00050000-55a3-6f82-6c9f-14bb214cbc77	8280	Brestanica
00050000-55a3-6f82-f2e4-b4aed58c1344	2354	Bresternica
00050000-55a3-6f82-b8fb-11e28f04dea3	4243	Brezje
00050000-55a3-6f82-432f-16f27cc1b1aa	1351	Brezovica pri Ljubljani
00050000-55a3-6f82-03eb-97e807888b4d	8250	Brežice
00050000-55a3-6f82-9272-e86e2e3709cf	4210	Brnik - Aerodrom
00050000-55a3-6f82-e41b-9da18c641990	8321	Brusnice
00050000-55a3-6f82-19b4-6968052c0ab1	3255	Buče
00050000-55a3-6f82-a5d5-ad77492794aa	8276	Bučka 
00050000-55a3-6f82-0399-f73694219926	9261	Cankova
00050000-55a3-6f82-2ae3-9efa674ebe72	3000	Celje 
00050000-55a3-6f82-2084-bf69b138f404	3001	Celje - poštni predali
00050000-55a3-6f82-29db-adaac902eae4	4207	Cerklje na Gorenjskem
00050000-55a3-6f82-89db-7a4b8fb64b33	8263	Cerklje ob Krki
00050000-55a3-6f82-9023-4972ff76346b	1380	Cerknica
00050000-55a3-6f82-35f5-d88d88934d7a	5282	Cerkno
00050000-55a3-6f82-87b1-bdd9a2eb2323	2236	Cerkvenjak
00050000-55a3-6f82-e03f-62c0c412ce6e	2215	Ceršak
00050000-55a3-6f82-9da5-8d1dbe2dcce3	2326	Cirkovce
00050000-55a3-6f82-c7c3-8d3b94044d7d	2282	Cirkulane
00050000-55a3-6f82-348d-b519e047891f	5273	Col
00050000-55a3-6f82-bcc6-b8ba607bcbf0	8251	Čatež ob Savi
00050000-55a3-6f82-f365-7d1d5e7c752d	1413	Čemšenik
00050000-55a3-6f82-e768-356931162f4a	5253	Čepovan
00050000-55a3-6f82-1f7c-e123acf2a5f6	9232	Črenšovci
00050000-55a3-6f82-127c-88cbd883ddd9	2393	Črna na Koroškem
00050000-55a3-6f82-1f73-5bd0d4c5563f	6275	Črni Kal
00050000-55a3-6f82-fc9a-a48734c1163b	5274	Črni Vrh nad Idrijo
00050000-55a3-6f82-6cd5-22dd37049090	5262	Črniče
00050000-55a3-6f82-2461-78ae81599f80	8340	Črnomelj
00050000-55a3-6f82-9ecf-82ccd69265bd	6271	Dekani
00050000-55a3-6f82-ebe2-9f753eb186a4	5210	Deskle
00050000-55a3-6f82-d08d-108075a6b11b	2253	Destrnik
00050000-55a3-6f82-066b-560a90a62a2d	6215	Divača
00050000-55a3-6f82-aae8-f108c1fbd3af	1233	Dob
00050000-55a3-6f82-a714-7bc3e0c58de4	3224	Dobje pri Planini
00050000-55a3-6f82-ecf9-b8373a7fa590	8257	Dobova
00050000-55a3-6f82-3c91-ffe9de5b63b9	1423	Dobovec
00050000-55a3-6f82-0833-41c571be3181	5263	Dobravlje
00050000-55a3-6f82-e119-3491da8d7c63	3204	Dobrna
00050000-55a3-6f82-ebff-ed4e63f6b200	8211	Dobrnič
00050000-55a3-6f82-fbcc-1bed0b1fe41d	1356	Dobrova
00050000-55a3-6f82-e70d-b9953e8706b4	9223	Dobrovnik/Dobronak 
00050000-55a3-6f82-bfe8-f8933740e165	5212	Dobrovo v Brdih
00050000-55a3-6f82-d79d-af33010c8102	1431	Dol pri Hrastniku
00050000-55a3-6f82-366d-400eb1e20d6b	1262	Dol pri Ljubljani
00050000-55a3-6f82-772b-51cd18649834	1273	Dole pri Litiji
00050000-55a3-6f82-5be2-eea3eda2b3a4	1331	Dolenja vas
00050000-55a3-6f82-d495-09fd305912d5	8350	Dolenjske Toplice
00050000-55a3-6f82-d038-778d586667a9	1230	Domžale
00050000-55a3-6f82-426d-be89b52af077	2252	Dornava
00050000-55a3-6f82-3296-62a5860753d9	5294	Dornberk
00050000-55a3-6f82-8ca1-e83e5ed93259	1319	Draga
00050000-55a3-6f82-4a88-e95c4966dd36	8343	Dragatuš
00050000-55a3-6f82-85ee-94bf70ff4316	3222	Dramlje
00050000-55a3-6f82-e8af-41f3b8a56ff3	2370	Dravograd
00050000-55a3-6f82-b3e1-0dd3c1b3f9eb	4203	Duplje
00050000-55a3-6f82-0c08-743645736cb7	6221	Dutovlje
00050000-55a3-6f82-e87c-905d24c89bfa	8361	Dvor
00050000-55a3-6f82-4786-a7a64e4c3613	2343	Fala
00050000-55a3-6f82-91f6-4e0a706ffa7e	9208	Fokovci
00050000-55a3-6f82-edbf-f1170b6eebc6	2313	Fram
00050000-55a3-6f82-abc3-20109401c2b6	3213	Frankolovo
00050000-55a3-6f82-67f2-40d8b56ed36f	1274	Gabrovka
00050000-55a3-6f82-bd32-8fdab18d700f	8254	Globoko
00050000-55a3-6f82-ad55-7192ca26319c	5275	Godovič
00050000-55a3-6f82-e0c3-52b5f2167b55	4204	Golnik
00050000-55a3-6f82-6ba3-f814efbf30c8	3303	Gomilsko
00050000-55a3-6f82-7c7d-a002337fbc5e	4224	Gorenja vas
00050000-55a3-6f82-4b72-0cebc3b8f20c	3263	Gorica pri Slivnici
00050000-55a3-6f82-84ac-d5f76f95ca2b	2272	Gorišnica
00050000-55a3-6f82-bf90-5a6fb81cdadd	9250	Gornja Radgona
00050000-55a3-6f82-20bc-a946682393da	3342	Gornji Grad
00050000-55a3-6f82-4be7-97e7acc43607	4282	Gozd Martuljek
00050000-55a3-6f82-a7b0-3d785df1a583	6272	Gračišče
00050000-55a3-6f82-14ff-a0642e08e840	9264	Grad
00050000-55a3-6f82-a1b7-95dc92e58209	8332	Gradac
00050000-55a3-6f82-0f01-d322027280ee	1384	Grahovo
00050000-55a3-6f82-c3f4-f558231b7739	5242	Grahovo ob Bači
00050000-55a3-6f82-ddb0-5f44cf799656	5251	Grgar
00050000-55a3-6f82-5000-d5d0355f77c3	3302	Griže
00050000-55a3-6f82-3f24-f262ab8b35bf	3231	Grobelno
00050000-55a3-6f82-bc44-7dfb90134efd	1290	Grosuplje
00050000-55a3-6f82-96dd-4487a8f3b3ad	2288	Hajdina
00050000-55a3-6f82-9796-6080651a9c52	8362	Hinje
00050000-55a3-6f82-24d3-4e7b47981686	2311	Hoče
00050000-55a3-6f82-5b29-25228604be46	9205	Hodoš/Hodos
00050000-55a3-6f82-6077-c3afbb4398e5	1354	Horjul
00050000-55a3-6f82-7d17-da04da77502f	1372	Hotedršica
00050000-55a3-6f82-ef69-b65800ead6f2	1430	Hrastnik
00050000-55a3-6f82-5b5b-5569d1987a4e	6225	Hruševje
00050000-55a3-6f82-7e2e-d07ebc229836	4276	Hrušica
00050000-55a3-6f82-fbc2-a65951c108a8	5280	Idrija
00050000-55a3-6f82-da54-411d3107427a	1292	Ig
00050000-55a3-6f82-7c5e-bedd1053347f	6250	Ilirska Bistrica
00050000-55a3-6f82-91b5-165474b17df9	6251	Ilirska Bistrica-Trnovo
00050000-55a3-6f82-7d8b-262048852c94	1295	Ivančna Gorica
00050000-55a3-6f82-ef70-c81ee8c0912e	2259	Ivanjkovci
00050000-55a3-6f82-02c7-ba4fbb63576a	1411	Izlake
00050000-55a3-6f82-ca5a-ac0e3571467e	6310	Izola/Isola
00050000-55a3-6f82-8d8f-7bd67f4a8306	2222	Jakobski Dol
00050000-55a3-6f82-ac72-4fe07010bc3c	2221	Jarenina
00050000-55a3-6f82-ca05-ebadf573fa5b	6254	Jelšane
00050000-55a3-6f82-621f-dfa944141513	4270	Jesenice
00050000-55a3-6f82-519d-7028e28f5f70	8261	Jesenice na Dolenjskem
00050000-55a3-6f82-41a5-399f9b9435ef	3273	Jurklošter
00050000-55a3-6f82-23b4-d520c3120ee5	2223	Jurovski Dol
00050000-55a3-6f82-290d-9da2887a0063	2256	Juršinci
00050000-55a3-6f82-7072-b6debe029262	5214	Kal nad Kanalom
00050000-55a3-6f82-67fb-59b9e5510b35	3233	Kalobje
00050000-55a3-6f82-2cb5-1159dc144362	4246	Kamna Gorica
00050000-55a3-6f82-d019-5397928d189d	2351	Kamnica
00050000-55a3-6f82-9698-b55b7d0a3f6e	1241	Kamnik
00050000-55a3-6f82-7ad1-7ba01bd354b5	5213	Kanal
00050000-55a3-6f82-f8ea-caa34ab4d196	8258	Kapele
00050000-55a3-6f82-39c5-2c21882a1350	2362	Kapla
00050000-55a3-6f82-9bfc-62bc29c9bb4f	2325	Kidričevo
00050000-55a3-6f82-d2de-7ab89fd9d8bd	1412	Kisovec
00050000-55a3-6f82-8619-124a4db59223	6253	Knežak
00050000-55a3-6f82-1893-a86b01fb3f17	5222	Kobarid
00050000-55a3-6f82-ccde-655a1fbee1de	9227	Kobilje
00050000-55a3-6f82-0fdd-674e6330a5ec	1330	Kočevje
00050000-55a3-6f82-c2da-8da3adae30dd	1338	Kočevska Reka
00050000-55a3-6f82-91d0-5973f4962995	2276	Kog
00050000-55a3-6f82-d624-f89b7322e77b	5211	Kojsko
00050000-55a3-6f82-cb70-cdffe8086f4d	6223	Komen
00050000-55a3-6f82-2a8a-30cbc0227213	1218	Komenda
00050000-55a3-6f82-8aed-877b6f02f1ab	6000	Koper/Capodistria 
00050000-55a3-6f82-5691-b7e74eba26b1	6001	Koper/Capodistria - poštni predali
00050000-55a3-6f82-adfc-168c0011b915	8282	Koprivnica
00050000-55a3-6f82-f174-7cbdd99fe1dd	5296	Kostanjevica na Krasu
00050000-55a3-6f82-18c9-333acbb7e18f	8311	Kostanjevica na Krki
00050000-55a3-6f82-09f2-ba1d73fd1165	1336	Kostel
00050000-55a3-6f82-2cab-4a40ed61af4e	6256	Košana
00050000-55a3-6f82-b0a2-634ef1e09281	2394	Kotlje
00050000-55a3-6f82-4018-87950955a467	6240	Kozina
00050000-55a3-6f82-10fd-df35ffe8e894	3260	Kozje
00050000-55a3-6f82-769e-358ae8e96e27	4000	Kranj 
00050000-55a3-6f82-3364-a8da29539496	4001	Kranj - poštni predali
00050000-55a3-6f82-0d55-8dea21db3969	4280	Kranjska Gora
00050000-55a3-6f82-8e64-bc42e7b59059	1281	Kresnice
00050000-55a3-6f82-84d0-b0c4a3c02756	4294	Križe
00050000-55a3-6f82-38a2-cf4b8fa6e060	9206	Križevci
00050000-55a3-6f82-5d13-8bdf2049d2e9	9242	Križevci pri Ljutomeru
00050000-55a3-6f82-854a-22576f440e1b	1301	Krka
00050000-55a3-6f82-bdb9-518500cb40ba	8296	Krmelj
00050000-55a3-6f82-a056-153d0565a2df	4245	Kropa
00050000-55a3-6f82-8c3f-5c81a4ac93cc	8262	Krška vas
00050000-55a3-6f82-0d0c-a5811f5ef1b1	8270	Krško
00050000-55a3-6f82-502f-e369e218b22a	9263	Kuzma
00050000-55a3-6f82-a57b-7382c486379f	2318	Laporje
00050000-55a3-6f82-d9aa-854d6d84714f	3270	Laško
00050000-55a3-6f82-c485-0425d7232b3f	1219	Laze v Tuhinju
00050000-55a3-6f82-a80a-f9905dc9df0a	2230	Lenart v Slovenskih goricah
00050000-55a3-6f82-55d8-7bd3d154feac	9220	Lendava/Lendva
00050000-55a3-6f82-c5a0-95d2e52dcfda	4248	Lesce
00050000-55a3-6f82-1846-9951f4380b72	3261	Lesično
00050000-55a3-6f82-0304-bfdf6081dedf	8273	Leskovec pri Krškem
00050000-55a3-6f82-ad47-11bbda0bece5	2372	Libeliče
00050000-55a3-6f82-32a5-5f23751c4f77	2341	Limbuš
00050000-55a3-6f82-d277-ef4661bbfb96	1270	Litija
00050000-55a3-6f82-6307-c8cab75dd40a	3202	Ljubečna
00050000-55a3-6f82-0af4-fc306ae14009	1000	Ljubljana 
00050000-55a3-6f82-4ec5-d056c354c4eb	1001	Ljubljana - poštni predali
00050000-55a3-6f82-7f24-ab808c4c3022	1231	Ljubljana - Črnuče
00050000-55a3-6f82-cd8c-d88180c1cfa1	1261	Ljubljana - Dobrunje
00050000-55a3-6f82-1368-326d4d023501	1260	Ljubljana - Polje
00050000-55a3-6f82-de48-d5c0f687bb6e	1210	Ljubljana - Šentvid
00050000-55a3-6f82-02b9-683e6d0ef7aa	1211	Ljubljana - Šmartno
00050000-55a3-6f82-bd31-170102b7ac3b	3333	Ljubno ob Savinji
00050000-55a3-6f82-0225-9807cab42cb1	9240	Ljutomer
00050000-55a3-6f82-7949-f285cbbd8262	3215	Loče
00050000-55a3-6f82-d332-9e6c29d5dadf	5231	Log pod Mangartom
00050000-55a3-6f82-d746-0760b4e7b064	1358	Log pri Brezovici
00050000-55a3-6f82-54a6-88f0c61167bf	1370	Logatec
00050000-55a3-6f82-0ccd-4c66f1ab2776	1371	Logatec
00050000-55a3-6f82-ce4a-3165296608ec	1434	Loka pri Zidanem Mostu
00050000-55a3-6f82-d9aa-617d4fbe1916	3223	Loka pri Žusmu
00050000-55a3-6f82-2040-20edb2f78ded	6219	Lokev
00050000-55a3-6f82-f6a6-d890b0dfc81f	1318	Loški Potok
00050000-55a3-6f82-ac9b-e367bb27fda1	2324	Lovrenc na Dravskem polju
00050000-55a3-6f82-5c96-85929c35ec83	2344	Lovrenc na Pohorju
00050000-55a3-6f82-2d71-664dff39d5ab	3334	Luče
00050000-55a3-6f82-7357-571e77e614cc	1225	Lukovica
00050000-55a3-6f82-bc17-1747c6d22285	9202	Mačkovci
00050000-55a3-6f82-2af8-efe50980b81f	2322	Majšperk
00050000-55a3-6f82-b781-fb2474f5c000	2321	Makole
00050000-55a3-6f82-34c8-3f19271ab293	9243	Mala Nedelja
00050000-55a3-6f82-65da-527a87c04550	2229	Malečnik
00050000-55a3-6f82-267c-de19016beeb0	6273	Marezige
00050000-55a3-6f82-9c9d-9fd851dd3fab	2000	Maribor 
00050000-55a3-6f82-0342-e78c237cab41	2001	Maribor - poštni predali
00050000-55a3-6f82-7fdc-6f41989de1eb	2206	Marjeta na Dravskem polju
00050000-55a3-6f82-3015-54046ce69ce2	2281	Markovci
00050000-55a3-6f82-734e-8cd4432e1796	9221	Martjanci
00050000-55a3-6f82-d3ef-8a296052401f	6242	Materija
00050000-55a3-6f82-480d-2a19b15d587d	4211	Mavčiče
00050000-55a3-6f82-f71e-2dc3e4187487	1215	Medvode
00050000-55a3-6f82-afd3-24dcf6d2bfc5	1234	Mengeš
00050000-55a3-6f82-a4c7-4f90d1dbfcf5	8330	Metlika
00050000-55a3-6f82-8543-37b6385026ae	2392	Mežica
00050000-55a3-6f82-1254-7a0a6f68739d	2204	Miklavž na Dravskem polju
00050000-55a3-6f82-f832-614b82a2afd2	2275	Miklavž pri Ormožu
00050000-55a3-6f82-8a61-c51372876722	5291	Miren
00050000-55a3-6f82-6742-06e74c86f8e6	8233	Mirna
00050000-55a3-6f82-d3e5-a56443cd854f	8216	Mirna Peč
00050000-55a3-6f82-3473-cc79fe1d14a6	2382	Mislinja
00050000-55a3-6f82-5333-88fd0d29ab34	4281	Mojstrana
00050000-55a3-6f82-9e7d-446fdab8d521	8230	Mokronog
00050000-55a3-6f82-e28b-766a0cc6d4f5	1251	Moravče
00050000-55a3-6f82-df95-335dcc927fb3	9226	Moravske Toplice
00050000-55a3-6f82-129e-740ef04bc43d	5216	Most na Soči
00050000-55a3-6f82-567b-10dc78608c0f	1221	Motnik
00050000-55a3-6f82-6448-5d52cc602b65	3330	Mozirje
00050000-55a3-6f82-e025-2001977079db	9000	Murska Sobota 
00050000-55a3-6f82-ec16-28704df416a5	9001	Murska Sobota - poštni predali
00050000-55a3-6f82-030c-d48e396da4c4	2366	Muta
00050000-55a3-6f82-0d83-20204a789b65	4202	Naklo
00050000-55a3-6f82-7a27-186d5b8abaa7	3331	Nazarje
00050000-55a3-6f82-9c0b-4f518e274695	1357	Notranje Gorice
00050000-55a3-6f82-2f8b-9f722746ab15	3203	Nova Cerkev
00050000-55a3-6f82-cfe1-c828a490827e	5000	Nova Gorica 
00050000-55a3-6f82-9575-16b7f28e7096	5001	Nova Gorica - poštni predali
00050000-55a3-6f82-5ae9-7323593c711a	1385	Nova vas
00050000-55a3-6f82-0533-cc867e0f40ed	8000	Novo mesto
00050000-55a3-6f82-95b5-4a81a7c944b0	8001	Novo mesto - poštni predali
00050000-55a3-6f82-9ff7-f75fd94f6035	6243	Obrov
00050000-55a3-6f82-8ebd-7184b81f5e34	9233	Odranci
00050000-55a3-6f82-5dec-a16506f9d9e2	2317	Oplotnica
00050000-55a3-6f82-3176-ea42f3eedcf2	2312	Orehova vas
00050000-55a3-6f82-cf43-e0d3287e1e3e	2270	Ormož
00050000-55a3-6f82-05cd-3be0ca2d87c3	1316	Ortnek
00050000-55a3-6f82-e455-1b8d88e3ff74	1337	Osilnica
00050000-55a3-6f82-4ab0-ccfa4026c78e	8222	Otočec
00050000-55a3-6f82-0ed0-c67ce8624c80	2361	Ožbalt
00050000-55a3-6f82-b206-8c5bb98bc0f9	2231	Pernica
00050000-55a3-6f82-4f6f-817904b90792	2211	Pesnica pri Mariboru
00050000-55a3-6f82-9d26-07c41f48b6d4	9203	Petrovci
00050000-55a3-6f82-3b8c-0f49b4f5d8ca	3301	Petrovče
00050000-55a3-6f82-6707-f6fc170b2275	6330	Piran/Pirano
00050000-55a3-6f82-f307-253013020d10	8255	Pišece
00050000-55a3-6f82-02a6-f23d46da0042	6257	Pivka
00050000-55a3-6f82-bba4-18a4b9731ae9	6232	Planina
00050000-55a3-6f82-476f-76f8fe405d3c	3225	Planina pri Sevnici
00050000-55a3-6f82-4033-66b63ba45f87	6276	Pobegi
00050000-55a3-6f82-eb2b-6fd4cf6fe680	8312	Podbočje
00050000-55a3-6f82-009e-8dfce1ce6393	5243	Podbrdo
00050000-55a3-6f82-209e-77ad34fcf4d6	3254	Podčetrtek
00050000-55a3-6f82-1b71-8f8b7ead2f46	2273	Podgorci
00050000-55a3-6f82-c7ea-a1c632b3f2da	6216	Podgorje
00050000-55a3-6f82-1f80-841ca1eb67a4	2381	Podgorje pri Slovenj Gradcu
00050000-55a3-6f82-c045-4706c510fb72	6244	Podgrad
00050000-55a3-6f82-711f-7c928f82a2d1	1414	Podkum
00050000-55a3-6f82-b382-a9251dd9a438	2286	Podlehnik
00050000-55a3-6f82-d4be-97ebe7afc19a	5272	Podnanos
00050000-55a3-6f82-d3a8-a2551e5ae86e	4244	Podnart
00050000-55a3-6f82-2804-1e1af8a67ef0	3241	Podplat
00050000-55a3-6f82-b292-0f9ce95e94c8	3257	Podsreda
00050000-55a3-6f82-c223-da4af842a1fc	2363	Podvelka
00050000-55a3-6f82-2e0b-8d635ef08af5	2208	Pohorje
00050000-55a3-6f82-d758-0bc138034519	2257	Polenšak
00050000-55a3-6f82-3884-0f20a218b8c2	1355	Polhov Gradec
00050000-55a3-6f82-a91a-0d0b615fe898	4223	Poljane nad Škofjo Loko
00050000-55a3-6f82-9990-b9996ce727b7	2319	Poljčane
00050000-55a3-6f82-ff17-e460f932efd3	1272	Polšnik
00050000-55a3-6f82-6101-3ff7a5d0c34c	3313	Polzela
00050000-55a3-6f82-6492-2c054dd34604	3232	Ponikva
00050000-55a3-6f82-70fc-c56bb944c40a	6320	Portorož/Portorose
00050000-55a3-6f82-ac43-cb76663b355c	6230	Postojna
00050000-55a3-6f82-50d4-83b2d4aea826	2331	Pragersko
00050000-55a3-6f82-a341-d49ad9ec0a98	3312	Prebold
00050000-55a3-6f82-cd2d-76feaad3aa83	4205	Preddvor
00050000-55a3-6f82-2a00-83dd0b4224bd	6255	Prem
00050000-55a3-6f82-e9d0-d9d32b9fc104	1352	Preserje
00050000-55a3-6f82-8913-f6f7b69ceca0	6258	Prestranek
00050000-55a3-6f82-96f2-637adf474e4d	2391	Prevalje
00050000-55a3-6f82-371a-0c707a04d308	3262	Prevorje
00050000-55a3-6f82-06ef-33be9b2af481	1276	Primskovo 
00050000-55a3-6f82-0c4b-e7b29ebb958a	3253	Pristava pri Mestinju
00050000-55a3-6f82-04e5-fa7490a17e3b	9207	Prosenjakovci/Partosfalva
00050000-55a3-6f82-97fb-9aa26f17b7d8	5297	Prvačina
00050000-55a3-6f82-36c4-2605979b87d6	2250	Ptuj
00050000-55a3-6f82-576a-36aee03910d2	2323	Ptujska Gora
00050000-55a3-6f82-ba57-639393b45a3b	9201	Puconci
00050000-55a3-6f82-1dad-54b011ab8408	2327	Rače
00050000-55a3-6f82-8aa1-0b97b7281d66	1433	Radeče
00050000-55a3-6f82-a6bd-cc1775ff8806	9252	Radenci
00050000-55a3-6f82-f454-53bf6f3c6a7b	2360	Radlje ob Dravi
00050000-55a3-6f82-7291-9dc2eb18aa85	1235	Radomlje
00050000-55a3-6f82-4a0d-47de96fcd9b3	4240	Radovljica
00050000-55a3-6f83-8528-44b39026fe18	8274	Raka
00050000-55a3-6f83-3356-3f35e6ee0ec0	1381	Rakek
00050000-55a3-6f83-fee9-aa76eeac4bf8	4283	Rateče - Planica
00050000-55a3-6f83-ee7c-0733c9a1f07f	2390	Ravne na Koroškem
00050000-55a3-6f83-257e-e7fabda8821a	9246	Razkrižje
00050000-55a3-6f83-a3a4-b43709260b9b	3332	Rečica ob Savinji
00050000-55a3-6f83-ec8e-d04bb869868e	5292	Renče
00050000-55a3-6f83-f318-214d7ae14402	1310	Ribnica
00050000-55a3-6f83-9c9f-57062abb1c73	2364	Ribnica na Pohorju
00050000-55a3-6f83-6921-71af54366ebd	3272	Rimske Toplice
00050000-55a3-6f83-797b-c0aa3434063a	1314	Rob
00050000-55a3-6f83-e6f6-4dd457ea96de	5215	Ročinj
00050000-55a3-6f83-f685-74fb9c5f31a0	3250	Rogaška Slatina
00050000-55a3-6f83-d7d7-3a1fe33591d7	9262	Rogašovci
00050000-55a3-6f83-9433-582350480fde	3252	Rogatec
00050000-55a3-6f83-5a03-104906825975	1373	Rovte
00050000-55a3-6f83-28c0-22ffa482688a	2342	Ruše
00050000-55a3-6f83-5d2c-7692131f65ec	1282	Sava
00050000-55a3-6f83-8fcc-265b8313c4ca	6333	Sečovlje/Sicciole
00050000-55a3-6f83-d407-db350040f5f2	4227	Selca
00050000-55a3-6f83-d72c-70a40686fe77	2352	Selnica ob Dravi
00050000-55a3-6f83-62c8-c86c6b6cb6f7	8333	Semič
00050000-55a3-6f83-4938-29d767168712	8281	Senovo
00050000-55a3-6f83-fa4e-4b54bfae28aa	6224	Senožeče
00050000-55a3-6f83-ddfd-5c76b9a13dad	8290	Sevnica
00050000-55a3-6f83-66e7-4d31b749cc35	6210	Sežana
00050000-55a3-6f83-f064-489baa0ceb71	2214	Sladki Vrh
00050000-55a3-6f83-a450-2f991805234c	5283	Slap ob Idrijci
00050000-55a3-6f83-2232-a598de721d48	2380	Slovenj Gradec
00050000-55a3-6f83-ea11-a99e5208dca4	2310	Slovenska Bistrica
00050000-55a3-6f83-887f-8141307f913a	3210	Slovenske Konjice
00050000-55a3-6f83-9677-d3243e4ac81a	1216	Smlednik
00050000-55a3-6f83-1dcb-a1f9c1b0ae4c	5232	Soča
00050000-55a3-6f83-e603-0c339d292022	1317	Sodražica
00050000-55a3-6f83-a601-bf41e3f30519	3335	Solčava
00050000-55a3-6f83-f1ce-7a03fc4e6940	5250	Solkan
00050000-55a3-6f83-4602-6efd73dba24c	4229	Sorica
00050000-55a3-6f83-d419-6556c89a4431	4225	Sovodenj
00050000-55a3-6f83-bd75-365e19c53ace	5281	Spodnja Idrija
00050000-55a3-6f83-342b-981976638fdc	2241	Spodnji Duplek
00050000-55a3-6f83-8789-a2e809c02d91	9245	Spodnji Ivanjci
00050000-55a3-6f83-21a5-ef848bd3f8f3	2277	Središče ob Dravi
00050000-55a3-6f83-7cb1-951683ac6cc6	4267	Srednja vas v Bohinju
00050000-55a3-6f83-55cd-5aeb3b1860b1	8256	Sromlje 
00050000-55a3-6f83-36a3-e9860043f9bc	5224	Srpenica
00050000-55a3-6f83-d3ed-34ad0ee870c8	1242	Stahovica
00050000-55a3-6f83-21fc-29fc601a9fdd	1332	Stara Cerkev
00050000-55a3-6f83-b722-26dd2c222d6f	8342	Stari trg ob Kolpi
00050000-55a3-6f83-48e8-9d7401492e18	1386	Stari trg pri Ložu
00050000-55a3-6f83-d1df-c9c92c002f7a	2205	Starše
00050000-55a3-6f83-3569-52fecc20415f	2289	Stoperce
00050000-55a3-6f83-8203-232e05355db1	8322	Stopiče
00050000-55a3-6f83-5c0c-d58250092a68	3206	Stranice
00050000-55a3-6f83-6dc9-5c168ec948e4	8351	Straža
00050000-55a3-6f83-98e8-24b491668511	1313	Struge
00050000-55a3-6f83-c13b-efed7d392d38	8293	Studenec
00050000-55a3-6f83-ebe8-a87197bea7b7	8331	Suhor
00050000-55a3-6f83-3797-0915da0df4a6	2233	Sv. Ana v Slovenskih goricah
00050000-55a3-6f83-2060-6dddf8a27c01	2235	Sv. Trojica v Slovenskih goricah
00050000-55a3-6f83-5c27-5b15067c5013	2353	Sveti Duh na Ostrem Vrhu
00050000-55a3-6f83-e685-25a514491fa6	9244	Sveti Jurij ob Ščavnici
00050000-55a3-6f83-105e-08fe7c77c06b	3264	Sveti Štefan
00050000-55a3-6f83-5ab6-4744ee86ac2f	2258	Sveti Tomaž
00050000-55a3-6f83-a163-868006b54eb9	9204	Šalovci
00050000-55a3-6f83-e59b-8d3425973bb6	5261	Šempas
00050000-55a3-6f83-d608-907794f25e5b	5290	Šempeter pri Gorici
00050000-55a3-6f83-6fff-084d3aee09a6	3311	Šempeter v Savinjski dolini
00050000-55a3-6f83-1b31-9f3387edaea3	4208	Šenčur
00050000-55a3-6f83-e79f-c1123677e7f6	2212	Šentilj v Slovenskih goricah
00050000-55a3-6f83-632a-eee8f8c08e54	8297	Šentjanž
00050000-55a3-6f83-fc8b-1316ab867862	2373	Šentjanž pri Dravogradu
00050000-55a3-6f83-e67f-7b114ef5358f	8310	Šentjernej
00050000-55a3-6f83-2e95-d89bf4363319	3230	Šentjur
00050000-55a3-6f83-b35d-1c01a92df1aa	3271	Šentrupert
00050000-55a3-6f83-a1a4-5def96ccafcc	8232	Šentrupert
00050000-55a3-6f83-b79d-cc79ae0f73e3	1296	Šentvid pri Stični
00050000-55a3-6f83-c580-8c26a0558aa4	8275	Škocjan
00050000-55a3-6f83-93f0-c480afbd20e8	6281	Škofije
00050000-55a3-6f83-793b-485faf71e99f	4220	Škofja Loka
00050000-55a3-6f83-a7aa-e146c3c37bbf	3211	Škofja vas
00050000-55a3-6f83-3489-2852945be598	1291	Škofljica
00050000-55a3-6f83-b104-198824677f2b	6274	Šmarje
00050000-55a3-6f83-43e0-1062f8190648	1293	Šmarje - Sap
00050000-55a3-6f83-0f76-459c95a148b2	3240	Šmarje pri Jelšah
00050000-55a3-6f83-659a-ad00532b5cc4	8220	Šmarješke Toplice
00050000-55a3-6f83-3af6-cc017ec3c09e	2315	Šmartno na Pohorju
00050000-55a3-6f83-fb15-86f454b77d26	3341	Šmartno ob Dreti
00050000-55a3-6f83-094c-2edc4b24114e	3327	Šmartno ob Paki
00050000-55a3-6f83-f41b-6aee70d5907d	1275	Šmartno pri Litiji
00050000-55a3-6f83-6346-831cfcbb0a52	2383	Šmartno pri Slovenj Gradcu
00050000-55a3-6f83-cc4b-aac68d8f2304	3201	Šmartno v Rožni dolini
00050000-55a3-6f83-df6a-85ff449d3d91	3325	Šoštanj
00050000-55a3-6f83-bff1-1be53188aea6	6222	Štanjel
00050000-55a3-6f83-e519-04963d82222d	3220	Štore
00050000-55a3-6f83-bd55-d128375b490d	3304	Tabor
00050000-55a3-6f83-a634-eddb60e031c5	3221	Teharje
00050000-55a3-6f83-19a2-07e0a14b241a	9251	Tišina
00050000-55a3-6f83-33fb-498f6e440864	5220	Tolmin
00050000-55a3-6f83-5f2f-eae4023a986e	3326	Topolšica
00050000-55a3-6f83-ce60-c3f1c6d7c57a	2371	Trbonje
00050000-55a3-6f83-bff2-4a68810e641b	1420	Trbovlje
00050000-55a3-6f83-9a47-24a081914734	8231	Trebelno 
00050000-55a3-6f83-c77e-abe7e9c30ca1	8210	Trebnje
00050000-55a3-6f83-0319-f41a6c57ab7a	5252	Trnovo pri Gorici
00050000-55a3-6f83-0e32-b4fcecb7fb3b	2254	Trnovska vas
00050000-55a3-6f83-4cdd-b689b68b9c49	1222	Trojane
00050000-55a3-6f83-e7cc-b658782511d2	1236	Trzin
00050000-55a3-6f83-0690-f06e625edf3d	4290	Tržič
00050000-55a3-6f83-1d3d-b29b3686d481	8295	Tržišče
00050000-55a3-6f83-a29c-235cc0c8e89a	1311	Turjak
00050000-55a3-6f83-9ee0-6c4aff70f545	9224	Turnišče
00050000-55a3-6f83-9db2-78bb8ec942d1	8323	Uršna sela
00050000-55a3-6f83-0588-3cb29918e75b	1252	Vače
00050000-55a3-6f83-ab5e-68f52454e3ed	3320	Velenje 
00050000-55a3-6f83-85ae-68b0e7fe660e	3322	Velenje - poštni predali
00050000-55a3-6f83-1aef-017fb1865964	8212	Velika Loka
00050000-55a3-6f83-f2b7-813290a88ee2	2274	Velika Nedelja
00050000-55a3-6f83-5810-c993426d0fde	9225	Velika Polana
00050000-55a3-6f83-3f8d-aaf6a576f556	1315	Velike Lašče
00050000-55a3-6f83-c1a1-0b5767165696	8213	Veliki Gaber
00050000-55a3-6f83-40e9-2cfdd4dde6f1	9241	Veržej
00050000-55a3-6f83-b2c0-1348d688747e	1312	Videm - Dobrepolje
00050000-55a3-6f83-2806-84ea42cb3df7	2284	Videm pri Ptuju
00050000-55a3-6f83-452b-fcaef4e6892d	8344	Vinica
00050000-55a3-6f83-4343-90ebf0e6adbe	5271	Vipava
00050000-55a3-6f83-e006-f59160e18101	4212	Visoko
00050000-55a3-6f83-5ec9-8c15a5d727b5	1294	Višnja Gora
00050000-55a3-6f83-04d4-340a9b30de47	3205	Vitanje
00050000-55a3-6f83-23a2-48fdbdb72160	2255	Vitomarci
00050000-55a3-6f83-5e11-3938d7c4e66c	1217	Vodice
00050000-55a3-6f83-f775-e39fae7b32d6	3212	Vojnik\t
00050000-55a3-6f83-b935-a36eefb25535	5293	Volčja Draga
00050000-55a3-6f83-dec4-89ba83c70f19	2232	Voličina
00050000-55a3-6f83-118d-a3be5683bd0d	3305	Vransko
00050000-55a3-6f83-ab80-071dbb8e4624	6217	Vremski Britof
00050000-55a3-6f83-c190-e313b3bd4186	1360	Vrhnika
00050000-55a3-6f83-7111-ad29bbf39f48	2365	Vuhred
00050000-55a3-6f83-6b04-a27d934d6f69	2367	Vuzenica
00050000-55a3-6f83-1c31-e917e919279a	8292	Zabukovje 
00050000-55a3-6f83-9ebe-dfdd610179f6	1410	Zagorje ob Savi
00050000-55a3-6f83-f01d-abb955924573	1303	Zagradec
00050000-55a3-6f83-bb6c-da8721386185	2283	Zavrč
00050000-55a3-6f83-b3cb-466df6ae5039	8272	Zdole 
00050000-55a3-6f83-6eea-893f095302c7	4201	Zgornja Besnica
00050000-55a3-6f83-a606-436ba9cfeffe	2242	Zgornja Korena
00050000-55a3-6f83-f34f-db2cc05d70e5	2201	Zgornja Kungota
00050000-55a3-6f83-9a58-5bde268814eb	2316	Zgornja Ložnica
00050000-55a3-6f83-4c1e-75f0677c0a18	2314	Zgornja Polskava
00050000-55a3-6f83-dc08-59f7af10e4fd	2213	Zgornja Velka
00050000-55a3-6f83-948d-c8d6422b894d	4247	Zgornje Gorje
00050000-55a3-6f83-1a24-701163698e44	4206	Zgornje Jezersko
00050000-55a3-6f83-dd30-fcf3d1bb13a9	2285	Zgornji Leskovec
00050000-55a3-6f83-205f-2446fc733c06	1432	Zidani Most
00050000-55a3-6f83-9c73-fa859ad77983	3214	Zreče
00050000-55a3-6f83-197d-45091bad27b6	4209	Žabnica
00050000-55a3-6f83-dbc0-ae08d0d3b6ec	3310	Žalec
00050000-55a3-6f83-26bc-e0555047fb03	4228	Železniki
00050000-55a3-6f83-b622-deb79e954ae4	2287	Žetale
00050000-55a3-6f83-d3db-f259f2b9a3bb	4226	Žiri
00050000-55a3-6f83-05c2-631873cec862	4274	Žirovnica
00050000-55a3-6f83-e4cb-2bf2c76d9b45	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9790933)
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
-- TOC entry 2863 (class 0 OID 9790744)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9790822)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9790945)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9791252)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9791263)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a3-6f84-d693-45bf855e49a6	00080000-55a3-6f84-dae7-002130e39933	0900	AK
00190000-55a3-6f84-179f-1271f6d921d9	00080000-55a3-6f84-cbe5-ab74acfb0bc6	0987	AK
00190000-55a3-6f84-0100-5a7d07ca5d2c	00080000-55a3-6f84-bd2a-4673b2c23219	0989	AK
00190000-55a3-6f84-299f-e68d86e6308f	00080000-55a3-6f84-4647-f1bf32dfb8cb	0986	AK
00190000-55a3-6f84-e28f-bc69dac75c89	00080000-55a3-6f84-4c14-1fb3b7a9757a	0984	AK
00190000-55a3-6f84-4888-682fed696648	00080000-55a3-6f84-2172-539cdeb21886	0983	AK
00190000-55a3-6f84-c1d5-8b9fe8a8fb49	00080000-55a3-6f84-199c-7f4bd0400671	0982	AK
\.


--
-- TOC entry 2905 (class 0 OID 9791233)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a3-6f84-64fd-33e395e74b31	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 2887 (class 0 OID 9790974)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a3-6f84-efd3-25fe856c824f	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a3-6f84-4c87-1b75f7bdec1d	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a3-6f84-a7a3-fbd0fdb843fe	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a3-6f84-ebd3-19abb012a85e	0004	Mali oder	t	24	Mali oder 
00220000-55a3-6f84-00ad-02237d96ed01	0005	Komorni oder	t	15	Komorni oder
00220000-55a3-6f84-aacf-eb50c5ff3f5a	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a3-6f84-c7be-4654113a76a1	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9790918)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9790908)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9791092)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9791042)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9790616)
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
-- TOC entry 2888 (class 0 OID 9790984)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9790654)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a3-6f82-a33f-0e00a02de042	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a3-6f82-41f3-fe750bcb056c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a3-6f82-314d-8d88e622d384	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a3-6f82-c942-a96d1f13a85c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a3-6f82-6ddc-53bcee5bdc4e	planer	Planer dogodkov v koledarju	t
00020000-55a3-6f82-ece8-0c5563b3ae65	kadrovska	Kadrovska služba	t
00020000-55a3-6f82-b9e1-9a00586b3275	arhivar	Ažuriranje arhivalij	t
00020000-55a3-6f82-10c0-183a84eb7c21	igralec	Igralec	t
00020000-55a3-6f82-ed4b-d61ef407b78d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a3-6f84-0f74-2a21f49b6d05	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9790638)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a3-6f82-3692-2f1dab3db474	00020000-55a3-6f82-314d-8d88e622d384
00010000-55a3-6f82-bf3a-8b6d6532aa67	00020000-55a3-6f82-314d-8d88e622d384
00010000-55a3-6f84-9808-d0a8bd4db2a5	00020000-55a3-6f84-0f74-2a21f49b6d05
\.


--
-- TOC entry 2890 (class 0 OID 9790998)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9790939)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9790889)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9791302)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a3-6f83-67ef-3509cac6307a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a3-6f83-b43f-e8321e0dbdf3	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a3-6f83-ab11-10d7465b601a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a3-6f83-aec7-238fa22b8b97	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a3-6f83-450c-f957b862a57f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9791294)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a3-6f83-a55f-747841cc806f	00230000-55a3-6f83-aec7-238fa22b8b97	popa
00240000-55a3-6f83-f3f2-8032c9961499	00230000-55a3-6f83-aec7-238fa22b8b97	oseba
00240000-55a3-6f83-d9b3-d7e650350e82	00230000-55a3-6f83-b43f-e8321e0dbdf3	prostor
00240000-55a3-6f83-eb42-3742cfcd1e8b	00230000-55a3-6f83-aec7-238fa22b8b97	besedilo
00240000-55a3-6f83-6e08-ec779dcc9ccd	00230000-55a3-6f83-aec7-238fa22b8b97	uprizoritev
00240000-55a3-6f83-1a98-4a81bd4af616	00230000-55a3-6f83-aec7-238fa22b8b97	funkcija
00240000-55a3-6f83-c0b5-024c81df0160	00230000-55a3-6f83-aec7-238fa22b8b97	tipfunkcije
00240000-55a3-6f83-6767-e9bafb5fae95	00230000-55a3-6f83-aec7-238fa22b8b97	alternacija
00240000-55a3-6f83-216d-2c3cd2af3f4d	00230000-55a3-6f83-67ef-3509cac6307a	pogodba
00240000-55a3-6f83-5956-e4e834ef4f4b	00230000-55a3-6f83-aec7-238fa22b8b97	zaposlitev
00240000-55a3-6f83-fb81-e78fe2c41300	00230000-55a3-6f83-67ef-3509cac6307a	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9791289)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9791052)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a3-6f84-4c62-d3f23196bc96	000e0000-55a3-6f84-c52a-ad6dce25ed24	00080000-55a3-6f84-d67e-af2fc347744a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a3-6f84-f387-935bbcfdb8e0	000e0000-55a3-6f84-c52a-ad6dce25ed24	00080000-55a3-6f84-d67e-af2fc347744a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a3-6f84-6039-21ae94777992	000e0000-55a3-6f84-c52a-ad6dce25ed24	00080000-55a3-6f84-9242-caa474f208d3	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9790716)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9790895)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a3-6f84-6097-5936eb5feaf5	00180000-55a3-6f84-d8b5-798b69fcb2c1	000c0000-55a3-6f84-c781-d3d5a970769a	00090000-55a3-6f84-fb53-d66d3891a934	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-6f84-a39a-e41adc25d6a9	00180000-55a3-6f84-d8b5-798b69fcb2c1	000c0000-55a3-6f84-0b3d-87d8ba034b38	00090000-55a3-6f84-b9c1-16d5a942200f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-6f84-cb3c-46c1a6c6a694	00180000-55a3-6f84-d8b5-798b69fcb2c1	000c0000-55a3-6f84-d6fe-735f6f8b7eee	00090000-55a3-6f84-5c66-692d0ddc824f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-6f84-671b-83c53fefc5d8	00180000-55a3-6f84-d8b5-798b69fcb2c1	000c0000-55a3-6f84-64de-f534ca525f15	00090000-55a3-6f84-d173-ed882ba296d3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-6f84-e03e-28cc8d2816e5	00180000-55a3-6f84-d8b5-798b69fcb2c1	000c0000-55a3-6f84-2f86-697b60f1546e	00090000-55a3-6f84-3c0e-88f1c44cb45e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-6f84-6f8f-6fbdcc27a3b9	00180000-55a3-6f84-221d-1f387b817124	\N	00090000-55a3-6f84-3c0e-88f1c44cb45e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2897 (class 0 OID 9791081)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a3-6f83-e5cd-7545a980090f	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a3-6f83-3423-3bf67aaf7605	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a3-6f83-e3aa-2d49fb674103	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a3-6f83-b24b-0993186a7940	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a3-6f83-b987-a10df47c7d4c	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a3-6f83-349b-7c93d89d536b	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a3-6f83-1b79-abbc1c29ea33	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a3-6f83-43a1-f7fee30c6930	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a3-6f83-9369-de1d1835634e	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a3-6f83-4722-dcceda391af6	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a3-6f83-ef9a-155719266dae	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a3-6f83-4c95-eb3131ea660b	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a3-6f83-9543-af08076dfdec	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a3-6f83-8ba8-e42f75468243	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a3-6f83-964b-3532c1c92aa8	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a3-6f83-cc40-451d83da8123	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9791271)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a3-6f83-c688-29dae6f7fa3d	01	Velika predstava	f	1.00	1.00
002b0000-55a3-6f83-2a57-35e3d36f1b9b	02	Mala predstava	f	0.50	0.50
002b0000-55a3-6f83-38f0-076428835357	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a3-6f83-8d4b-2a713e0a5382	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a3-6f83-85f3-92b3343d6708	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9790779)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9790625)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a3-6f82-bf3a-8b6d6532aa67	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROQuiSYYbggUmvyLzElQprwEvnWI.oExu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-4201-60fe094bb948	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-f0d1-810f2da1a2c8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-ff2d-1a5527bd245e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-6c2c-b4944af5dc54	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-3318-2ce03c271193	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-fbe7-cbbb97ee525f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-801b-d3d30615b73c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-f0f0-b3402f0038d6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-e5e9-b2629d1a038f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a3-6f84-9808-d0a8bd4db2a5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a3-6f82-3692-2f1dab3db474	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9791129)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a3-6f84-bd3a-fb51a1167191	00160000-55a3-6f84-9164-a325c6efbc31	00150000-55a3-6f83-2ff5-d10ef598621d	00140000-55a3-6f81-2953-711506b09165	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a3-6f84-00ad-02237d96ed01
000e0000-55a3-6f84-c52a-ad6dce25ed24	00160000-55a3-6f84-9eba-8c54118ab280	00150000-55a3-6f83-b8d2-f86415c0ea06	00140000-55a3-6f81-40cb-b9e843e184bf	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a3-6f84-aacf-eb50c5ff3f5a
000e0000-55a3-6f84-6162-7936e662f3e5	\N	00150000-55a3-6f83-b8d2-f86415c0ea06	00140000-55a3-6f81-40cb-b9e843e184bf	00190000-55a3-6f84-179f-1271f6d921d9	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a3-6f84-00ad-02237d96ed01
000e0000-55a3-6f84-27e8-9de2f77f6051	\N	00150000-55a3-6f83-b8d2-f86415c0ea06	00140000-55a3-6f81-40cb-b9e843e184bf	00190000-55a3-6f84-179f-1271f6d921d9	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a3-6f84-00ad-02237d96ed01
000e0000-55a3-6f84-d3a1-bd5cfc9a5b02	\N	00150000-55a3-6f83-b8d2-f86415c0ea06	00140000-55a3-6f81-40cb-b9e843e184bf	00190000-55a3-6f84-179f-1271f6d921d9	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a3-6f84-efd3-25fe856c824f
\.


--
-- TOC entry 2871 (class 0 OID 9790841)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a3-6f84-376b-721f94881ffa	000e0000-55a3-6f84-c52a-ad6dce25ed24	1	
00200000-55a3-6f84-1f9b-56bbfb1a3865	000e0000-55a3-6f84-c52a-ad6dce25ed24	2	
\.


--
-- TOC entry 2886 (class 0 OID 9790966)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9791035)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9790873)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9791119)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a3-6f81-2953-711506b09165	01	Drama	drama (SURS 01)
00140000-55a3-6f81-c949-71664d6a53fb	02	Opera	opera (SURS 02)
00140000-55a3-6f81-6136-03c47c32b061	03	Balet	balet (SURS 03)
00140000-55a3-6f81-e5f6-2d2aa86b00ba	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a3-6f81-4bee-5322c6cc20cb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a3-6f81-40cb-b9e843e184bf	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a3-6f81-1a9e-804e611a07b7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9791025)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a3-6f83-3d21-9738a2a7ce90	01	Opera	opera
00150000-55a3-6f83-bf6d-ea659820e629	02	Opereta	opereta
00150000-55a3-6f83-ad1f-3d4f0fb1b5af	03	Balet	balet
00150000-55a3-6f83-c993-12c707e7ecba	04	Plesne prireditve	plesne prireditve
00150000-55a3-6f83-6b51-8dd3695a8e41	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a3-6f83-0d9d-c17b356277a2	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a3-6f83-300a-bc3eb506a1fc	07	Biografska drama	biografska drama
00150000-55a3-6f83-2ff5-d10ef598621d	08	Komedija	komedija
00150000-55a3-6f83-3400-6cfe9e32edb0	09	Črna komedija	črna komedija
00150000-55a3-6f83-a013-ac4a8a0b471e	10	E-igra	E-igra
00150000-55a3-6f83-b8d2-f86415c0ea06	11	Kriminalka	kriminalka
00150000-55a3-6f83-ba43-cc894d52f304	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9790679)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9791176)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9791166)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9791080)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9790863)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9790888)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9791287)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9790805)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9791228)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9791021)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9790839)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9790882)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9790819)
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
-- TOC entry 2537 (class 2606 OID 9790931)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9790958)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9790777)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9790688)
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
-- TOC entry 2452 (class 2606 OID 9790712)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9790668)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9790653)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9790964)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9790997)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9791114)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9790741)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9790765)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9790937)
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
-- TOC entry 2467 (class 2606 OID 9790755)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9790826)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9790949)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9791260)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9791268)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9791250)
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
-- TOC entry 2557 (class 2606 OID 9790981)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9790922)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9790913)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9791102)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9791049)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9790624)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9790988)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9790642)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9790662)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9791006)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9790944)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9790894)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9791311)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9791299)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9791293)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9791062)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9790721)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9790904)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9791091)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9791281)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9790790)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9790637)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9791145)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9790848)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9790972)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9791040)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9790877)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9791127)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9791033)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9790870)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9791063)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9791064)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9790743)
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
-- TOC entry 2550 (class 1259 OID 9790965)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9790951)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9790950)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9790849)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9791022)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9791024)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9791023)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9790821)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9790820)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9791116)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9791117)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9791118)
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
-- TOC entry 2604 (class 1259 OID 9791150)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9791147)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9791151)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9791149)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9791148)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9790792)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9790791)
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
-- TOC entry 2450 (class 1259 OID 9790715)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9790989)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9790883)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9790669)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9790670)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9791009)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9791008)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9791007)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9790827)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9790829)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9790828)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9791301)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9790917)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9790915)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9790914)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9790916)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9790643)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9790644)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9790973)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9790938)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9791050)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9791051)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9791232)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9791229)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9791230)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9791231)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9790757)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9790756)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9790758)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9791261)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9791262)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9791180)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9791178)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2620 (class 1259 OID 9791179)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9791041)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9790926)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9790925)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9790923)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9790924)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9791168)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9791167)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9791251)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9790840)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9791288)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9790690)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9790689)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9790722)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9790723)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9790907)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9790906)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9790905)
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
-- TOC entry 2502 (class 1259 OID 9790872)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9790868)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9790865)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9790866)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9790864)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9790869)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9790867)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9790742)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9790806)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9790808)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9790807)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9790809)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9790932)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9791115)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9791146)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9790713)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9790714)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9791034)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9791312)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9790778)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9791300)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9790983)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9790982)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 9791177)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9791181)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9790766)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9791128)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9791269)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9791270)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9790663)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9790871)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9791448)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9791433)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9791438)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9791458)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9791428)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9791453)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9791443)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9791603)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9791608)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9791363)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9791543)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9791538)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9791533)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9791423)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9791573)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9791583)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9791578)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9791398)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9791393)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9791523)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9791613)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9791618)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9791623)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9791643)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9791628)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9791648)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9791638)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9791633)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9791388)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9791383)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9791348)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9791343)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9791553)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9791463)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9791323)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9791328)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9791568)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9791563)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9791558)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9791403)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9791413)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9791408)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9791728)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9791498)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9791488)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9791483)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9791493)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9791313)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9791318)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9791548)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9791528)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9791593)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9791598)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9791698)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9791683)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9791688)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9791693)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9791373)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9791368)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9791378)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9791708)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9791713)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9791673)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9791678)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9791663)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9791668)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9791588)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9791518)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9791513)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9791503)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9791508)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9791658)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9791653)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9791703)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9791418)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9791718)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9791723)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9791338)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9791333)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9791353)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9791358)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9791478)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9791473)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9791468)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-13 09:57:58 CEST

--
-- PostgreSQL database dump complete
--

