--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-08 16:56:33 CEST

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
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 9446902)
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
-- TOC entry 228 (class 1259 OID 9447400)
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
-- TOC entry 227 (class 1259 OID 9447383)
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
-- TOC entry 221 (class 1259 OID 9447296)
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
-- TOC entry 197 (class 1259 OID 9447081)
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
-- TOC entry 200 (class 1259 OID 9447115)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9447512)
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
-- TOC entry 192 (class 1259 OID 9447024)
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
-- TOC entry 229 (class 1259 OID 9447413)
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
-- TOC entry 216 (class 1259 OID 9447241)
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
-- TOC entry 195 (class 1259 OID 9447061)
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
-- TOC entry 199 (class 1259 OID 9447109)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9447041)
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
-- TOC entry 205 (class 1259 OID 9447158)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9447183)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9446998)
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
-- TOC entry 184 (class 1259 OID 9446911)
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
-- TOC entry 185 (class 1259 OID 9446922)
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
-- TOC entry 180 (class 1259 OID 9446876)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9446895)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9447190)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9447221)
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
-- TOC entry 224 (class 1259 OID 9447334)
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
-- TOC entry 187 (class 1259 OID 9446955)
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
-- TOC entry 189 (class 1259 OID 9446990)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9447164)
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
-- TOC entry 188 (class 1259 OID 9446975)
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
-- TOC entry 194 (class 1259 OID 9447053)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9447176)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9447482)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(10,0) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 232 (class 1259 OID 9447493)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9447463)
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
-- TOC entry 212 (class 1259 OID 9447205)
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
-- TOC entry 204 (class 1259 OID 9447149)
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
-- TOC entry 203 (class 1259 OID 9447139)
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
-- TOC entry 223 (class 1259 OID 9447323)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9447273)
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
-- TOC entry 177 (class 1259 OID 9446847)
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
-- TOC entry 176 (class 1259 OID 9446845)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 9447215)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9446885)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9446869)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9447229)
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
-- TOC entry 207 (class 1259 OID 9447170)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9447120)
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
-- TOC entry 237 (class 1259 OID 9447532)
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
-- TOC entry 236 (class 1259 OID 9447524)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9447519)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9447283)
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
-- TOC entry 186 (class 1259 OID 9446947)
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
-- TOC entry 202 (class 1259 OID 9447126)
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
    planiranotraja numeric(10,0) DEFAULT NULL::numeric
);


--
-- TOC entry 222 (class 1259 OID 9447312)
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
-- TOC entry 233 (class 1259 OID 9447501)
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
-- TOC entry 191 (class 1259 OID 9447010)
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
-- TOC entry 178 (class 1259 OID 9446856)
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
-- TOC entry 226 (class 1259 OID 9447360)
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
-- TOC entry 196 (class 1259 OID 9447072)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9447197)
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
-- TOC entry 218 (class 1259 OID 9447266)
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
-- TOC entry 198 (class 1259 OID 9447104)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9447350)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9447256)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9446850)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2857 (class 0 OID 9446902)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 9447400)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559d-3a20-e06f-1db33024949e	000d0000-559d-3a20-997c-a815cd9d98f4	\N	00090000-559d-3a20-2620-712084086c30	\N	0001	f	\N	\N	\N	3	\N	\N	f	t
000c0000-559d-3a20-c3bc-8f845a8ae347	000d0000-559d-3a20-0e70-bef3ddb6f7d6	\N	00090000-559d-3a20-a39a-2c90a5822a7f	\N	0002	f	\N	\N	\N	8	\N	\N	f	f
000c0000-559d-3a20-5f46-f4499a3a79c4	000d0000-559d-3a20-08a9-ae1a4f027863	\N	00090000-559d-3a20-53dd-66c124a4d20c	\N	0003	f	\N	\N	\N	2	\N	\N	f	f
000c0000-559d-3a20-7c06-65de8c4a417c	000d0000-559d-3a20-22f2-c3d64df82a2e	\N	00090000-559d-3a20-76a3-b75bd8814031	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-559d-3a20-9a35-8ac4035c93ae	000d0000-559d-3a20-6e99-4bc64eb8da1f	\N	00090000-559d-3a20-b5c4-ebd36de4b445	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-559d-3a20-542e-6a538e45ead9	000d0000-559d-3a20-2118-64a5bb3f0974	\N	00090000-559d-3a20-cd63-65e9c5cdc6b3	\N	0006	f	\N	\N	\N	1	\N	\N	f	t
000c0000-559d-3a20-0bbf-850e870b72ee	000d0000-559d-3a20-af8f-53a88834ff0d	\N	00090000-559d-3a20-66ee-d9dc8fa23845	\N	0007	f	\N	\N	\N	14	\N	\N	f	t
000c0000-559d-3a20-2700-0b50a6f17eef	000d0000-559d-3a20-5c25-2433ba43385a	\N	00090000-559d-3a20-ae70-1314f006ac66	\N	0008	f	\N	\N	\N	12	\N	\N	f	t
\.


--
-- TOC entry 2901 (class 0 OID 9447383)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9447296)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559d-3a1f-79fc-18d0297bd040	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559d-3a1f-9617-81bc522e4405	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559d-3a1f-6cde-067b824da16f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2871 (class 0 OID 9447081)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559d-3a20-8406-07c745c90814	\N	\N	00200000-559d-3a20-6c1b-4c5aa05abfdc	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559d-3a20-ba61-c708d5e25c81	\N	\N	00200000-559d-3a20-8dea-93e44a744e31	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559d-3a20-47e9-a3c87e0448e8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559d-3a20-3d47-426dfc4c76b7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559d-3a20-ab17-c29e059db87a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2874 (class 0 OID 9447115)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 9447512)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 9447024)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559d-3a1e-f648-11dd90293947	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559d-3a1e-37f0-f51606e198d8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559d-3a1e-da64-5fa6d6b4a239	AL	ALB	008	Albania 	Albanija	\N
00040000-559d-3a1e-a55a-4a065c828e10	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559d-3a1e-82fe-d4763aa3d618	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559d-3a1e-daa5-616c0d576144	AD	AND	020	Andorra 	Andora	\N
00040000-559d-3a1e-1af6-599ea6d6914e	AO	AGO	024	Angola 	Angola	\N
00040000-559d-3a1e-18d9-c8beb1b355ac	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559d-3a1e-95d7-20264cb09ca7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559d-3a1e-cdf7-f521c0ae189e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559d-3a1e-c61a-a403a4e4004e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559d-3a1e-bda0-67ac3f846f3e	AM	ARM	051	Armenia 	Armenija	\N
00040000-559d-3a1e-fdca-37fe55df1398	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559d-3a1e-5dbd-5882f82cd696	AU	AUS	036	Australia 	Avstralija	\N
00040000-559d-3a1e-aa21-db75e734d822	AT	AUT	040	Austria 	Avstrija	\N
00040000-559d-3a1e-ce33-8094ebbb3df1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559d-3a1e-0138-3e18515f0ee2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559d-3a1e-036d-5a08f25189e1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559d-3a1e-e5ea-d26c31e707dd	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559d-3a1e-19d1-f8843cb908f8	BB	BRB	052	Barbados 	Barbados	\N
00040000-559d-3a1e-cd23-68c346080335	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559d-3a1e-0409-f5f38fc010c3	BE	BEL	056	Belgium 	Belgija	\N
00040000-559d-3a1e-1ee9-b1d9fee801b1	BZ	BLZ	084	Belize 	Belize	\N
00040000-559d-3a1e-30fc-a9fb6c8386c3	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559d-3a1e-3fe6-75438a36137e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559d-3a1e-3bff-ef1b3c3e2604	BT	BTN	064	Bhutan 	Butan	\N
00040000-559d-3a1e-0094-135bee5aade6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559d-3a1e-887c-770941bc19f3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559d-3a1e-8f59-2f9d3bb48060	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559d-3a1e-81aa-27eb42ca833d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559d-3a1e-fcd2-0c0191cce71a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559d-3a1e-71e4-59d637785a60	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559d-3a1e-fa33-2b6853e14007	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559d-3a1e-fd9a-a1906bfd3c7f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559d-3a1e-3599-1145ba8f4450	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559d-3a1e-35e5-24da537123f8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559d-3a1e-4d50-f6227a236cef	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559d-3a1e-30c2-551214638d29	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559d-3a1e-9812-7bbd1d0efe59	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559d-3a1e-4811-10bfc2a2ebbe	CA	CAN	124	Canada 	Kanada	\N
00040000-559d-3a1e-49da-1f280e4b5c2e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559d-3a1e-8028-3c973fcbf0ec	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559d-3a1e-fb8d-83ae5f75650b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559d-3a1e-a9c5-d69202670729	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559d-3a1e-bc53-41af97c5bb23	CL	CHL	152	Chile 	Čile	\N
00040000-559d-3a1e-64ba-49d5328c26a8	CN	CHN	156	China 	Kitajska	\N
00040000-559d-3a1e-f39a-b11eccf6c636	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559d-3a1e-28a8-6702a3a6ceb2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559d-3a1e-4f71-d2c4bb452ba8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559d-3a1e-2d7f-627af02fa79b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559d-3a1e-5e78-8d61611e4dad	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559d-3a1e-44df-2007a1f5c28f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559d-3a1e-a945-a536a1154dd0	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559d-3a1e-3226-5f4669e3e9fb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559d-3a1e-3702-60cee26a91ef	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559d-3a1e-e230-da5b315db9e2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559d-3a1e-f1cb-c80b54fd34ae	CU	CUB	192	Cuba 	Kuba	\N
00040000-559d-3a1e-8d44-82bdd12e9b18	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559d-3a1e-c8f1-b8c1ba94143b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559d-3a1e-cf0b-28f369ac9365	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559d-3a1e-e690-fbc3b54087cd	DK	DNK	208	Denmark 	Danska	\N
00040000-559d-3a1e-47ab-77afa68d9d17	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559d-3a1e-46b4-7bc20f56df88	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559d-3a1e-cb91-0660953370bf	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559d-3a1e-3ae6-a1b9c4e2cbf0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559d-3a1e-fcc7-56f9e3f6b340	EG	EGY	818	Egypt 	Egipt	\N
00040000-559d-3a1e-3666-303f494f7e4c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559d-3a1e-c9fd-a32c93d5e9af	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559d-3a1e-12b4-da45f3b4ab4a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559d-3a1e-7b41-b26ed70d65a6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559d-3a1e-5881-0c90c129e880	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559d-3a1e-a3bf-89fffd92d78d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559d-3a1e-5afa-c791915d8bc8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559d-3a1e-1a85-7931011609b8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559d-3a1e-3167-7bfe27522506	FI	FIN	246	Finland 	Finska	\N
00040000-559d-3a1e-8c4a-ecf4447fc000	FR	FRA	250	France 	Francija	\N
00040000-559d-3a1e-ecac-097c8d7628d7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559d-3a1e-9e59-90427f4fe5d7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559d-3a1e-d407-fc2d8b71c49d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559d-3a1e-6c5d-3aef55ab6ba5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559d-3a1e-c1aa-2381d4bf5ff6	GA	GAB	266	Gabon 	Gabon	\N
00040000-559d-3a1e-8125-7ea2fe6d4da3	GM	GMB	270	Gambia 	Gambija	\N
00040000-559d-3a1e-ba3d-0acc17e369d8	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559d-3a1e-0539-4a07bbfd42c8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559d-3a1e-6eba-8542ee3f32e0	GH	GHA	288	Ghana 	Gana	\N
00040000-559d-3a1e-49b2-6d07e041225c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559d-3a1e-5ee8-7b8fcddd7cfa	GR	GRC	300	Greece 	Grčija	\N
00040000-559d-3a1e-f9b4-b39cf5da2c1c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559d-3a1e-5d93-ef417bb68d97	GD	GRD	308	Grenada 	Grenada	\N
00040000-559d-3a1e-c53b-9dc207c5ef64	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559d-3a1e-7f52-a7412f83cc90	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559d-3a1e-abfb-3b2fc1b59a5a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559d-3a1e-da03-e86ea9adee1c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559d-3a1e-57ce-c4234e500826	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559d-3a1e-c5a6-9214a79a752b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559d-3a1e-767a-3d676ca3b700	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559d-3a1e-d257-d0d1628ce9a8	HT	HTI	332	Haiti 	Haiti	\N
00040000-559d-3a1e-a368-997448672d58	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559d-3a1e-a009-ae8b6e89c216	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559d-3a1e-28d8-4b7659858400	HN	HND	340	Honduras 	Honduras	\N
00040000-559d-3a1e-0864-feff9c082283	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559d-3a1e-355a-bf808ab92c8e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559d-3a1e-af5a-57eabdb7747e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559d-3a1e-11ed-fab1aa58a716	IN	IND	356	India 	Indija	\N
00040000-559d-3a1e-b788-4f6bd3f8c270	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559d-3a1e-7be3-10996901ae27	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559d-3a1e-c585-000e13778f6f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559d-3a1e-1615-84522d3ecf1e	IE	IRL	372	Ireland 	Irska	\N
00040000-559d-3a1e-8576-468d744bd2f3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559d-3a1e-501c-30ddd5e4af23	IL	ISR	376	Israel 	Izrael	\N
00040000-559d-3a1e-fee2-a38c3d6edee7	IT	ITA	380	Italy 	Italija	\N
00040000-559d-3a1e-c00e-e4faf25efa0a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559d-3a1e-09cd-303f67753a67	JP	JPN	392	Japan 	Japonska	\N
00040000-559d-3a1e-ae5d-8395478d9175	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559d-3a1e-9ce2-5bc1fbe9741b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559d-3a1e-43d4-08d5bffc02d2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559d-3a1e-ea94-3eb542d62389	KE	KEN	404	Kenya 	Kenija	\N
00040000-559d-3a1e-b6c8-802f70ccd4c7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559d-3a1e-0f61-225255438bf0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559d-3a1e-e325-85db43f3ce9e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559d-3a1e-406b-d8ef45948685	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559d-3a1e-b61e-f83ea852fbbb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559d-3a1e-3902-730ac44333ca	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559d-3a1e-ee00-3f7cafe29d10	LV	LVA	428	Latvia 	Latvija	\N
00040000-559d-3a1e-097e-26da48676c90	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559d-3a1e-e19c-89d00d2832df	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559d-3a1e-723a-034adbcae0e2	LR	LBR	430	Liberia 	Liberija	\N
00040000-559d-3a1e-2a8c-83cf479ed768	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559d-3a1e-a6f1-3912a30cca43	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559d-3a1e-4798-4daf629c5ef9	LT	LTU	440	Lithuania 	Litva	\N
00040000-559d-3a1e-f66f-b8275355a7b6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559d-3a1e-74a0-0da49735eba3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559d-3a1e-5cf6-9845dbe09bc1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559d-3a1e-c85e-458098809177	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559d-3a1e-45d6-82d8a1951638	MW	MWI	454	Malawi 	Malavi	\N
00040000-559d-3a1e-7729-66f0fce76df4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559d-3a1e-c8dd-46ab8325ec7a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559d-3a1e-d1e2-daa09fc911c9	ML	MLI	466	Mali 	Mali	\N
00040000-559d-3a1e-6418-8165409f4543	MT	MLT	470	Malta 	Malta	\N
00040000-559d-3a1e-fcab-336a7c1e3ed3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559d-3a1e-4ad6-90d4e4dadad1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559d-3a1e-a53a-5ee59bce7013	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559d-3a1e-0441-1e7bb2fa52b5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559d-3a1e-37bd-3b7d7a30157c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559d-3a1e-650f-87e9eb18645a	MX	MEX	484	Mexico 	Mehika	\N
00040000-559d-3a1e-5234-310f2c5966dc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559d-3a1e-70ac-cdabca671dc4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559d-3a1e-6c3e-6a94c7982ad0	MC	MCO	492	Monaco 	Monako	\N
00040000-559d-3a1e-48ae-625e9b9f6de9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559d-3a1e-89e6-7d28b7996a63	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559d-3a1e-8f2c-c005a296b3d5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559d-3a1e-bb58-bb1c57f97460	MA	MAR	504	Morocco 	Maroko	\N
00040000-559d-3a1e-28f1-2aefb524ab88	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559d-3a1e-932f-149f62f2e99d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559d-3a1e-4317-7508d1a6d6e8	NA	NAM	516	Namibia 	Namibija	\N
00040000-559d-3a1e-7933-ac0c802d6cda	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559d-3a1e-3424-4367ac7821fd	NP	NPL	524	Nepal 	Nepal	\N
00040000-559d-3a1e-9e66-416d0d9de8d1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559d-3a1e-d8c2-09c3b6a2ed9a	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559d-3a1e-c337-12486360963f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559d-3a1e-da5c-935e062a14ff	NE	NER	562	Niger 	Niger 	\N
00040000-559d-3a1e-d264-cdf57306efd1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559d-3a1e-0f58-6e5b4bdd0630	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559d-3a1e-39bb-7b2448d53be2	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559d-3a1e-178d-07f8af6c9433	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559d-3a1e-25da-6663d2e1470b	NO	NOR	578	Norway 	Norveška	\N
00040000-559d-3a1e-f9d3-0be4eeb5891c	OM	OMN	512	Oman 	Oman	\N
00040000-559d-3a1e-aa7f-92f4b0e79794	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559d-3a1e-6e42-445f5fef8b95	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559d-3a1e-9ff3-69fc0e953287	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559d-3a1e-abf3-a697d94cbbcf	PA	PAN	591	Panama 	Panama	\N
00040000-559d-3a1e-f0df-4edfaf030fdb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559d-3a1e-ebfd-7aff03e053d9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559d-3a1e-c472-24bf2a7d508f	PE	PER	604	Peru 	Peru	\N
00040000-559d-3a1e-9e4d-c5f1a2586bfe	PH	PHL	608	Philippines 	Filipini	\N
00040000-559d-3a1e-1a7b-d3da3f1c409c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559d-3a1e-7eed-b577a92c2ca1	PL	POL	616	Poland 	Poljska	\N
00040000-559d-3a1e-d47c-1024da70ee95	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559d-3a1e-887e-a3e038fe312d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559d-3a1e-d2dc-d12fc1e05afb	QA	QAT	634	Qatar 	Katar	\N
00040000-559d-3a1e-0b6f-7a4a975857a5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559d-3a1e-5fae-7164a7816ce0	RO	ROU	642	Romania 	Romunija	\N
00040000-559d-3a1e-adeb-8e8a03ea69ee	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559d-3a1e-5ada-bdceaee2436b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559d-3a1e-7a35-ae79f2c0c64b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559d-3a1e-dde5-5e9882694538	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559d-3a1e-948f-02e5b2ee8a93	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559d-3a1e-dcd2-323c8773a5e7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559d-3a1e-edfe-84558d5e5bf3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559d-3a1e-044d-fa696b5a7278	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559d-3a1e-a927-952d038aaf71	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559d-3a1e-7e3f-e171d0790100	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559d-3a1e-cf22-73e87c4b3a02	SM	SMR	674	San Marino 	San Marino	\N
00040000-559d-3a1e-ccda-bd9b502cbdde	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559d-3a1e-be9e-6a2c736e75be	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559d-3a1e-f90d-e312705082fd	SN	SEN	686	Senegal 	Senegal	\N
00040000-559d-3a1e-3fbd-3e35966cdaa5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559d-3a1e-a97c-b19ad640d4bb	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559d-3a1e-082a-7b998a8a7536	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559d-3a1e-9e0a-98481190c800	SG	SGP	702	Singapore 	Singapur	\N
00040000-559d-3a1e-76e5-392b233d0306	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559d-3a1e-3e10-e0445b82bb62	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559d-3a1e-1fe1-bb906e974032	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559d-3a1e-835b-826cdaec6ebc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559d-3a1e-916c-0a66a2eee3e2	SO	SOM	706	Somalia 	Somalija	\N
00040000-559d-3a1e-f79e-c9c800601287	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559d-3a1e-193c-b30819afa80d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559d-3a1e-df5c-9bce3d1fcbb0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559d-3a1e-a212-c1dad40f72a7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559d-3a1e-15ef-6faf2ac6181a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559d-3a1e-f077-208eeafff0e9	SD	SDN	729	Sudan 	Sudan	\N
00040000-559d-3a1e-bea8-d0567e16b4b7	SR	SUR	740	Suriname 	Surinam	\N
00040000-559d-3a1e-718d-eb08c0080781	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559d-3a1e-f3b7-11164f79bf00	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559d-3a1e-10ed-dd2d6ea80662	SE	SWE	752	Sweden 	Švedska	\N
00040000-559d-3a1e-133a-ee924cab0658	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559d-3a1e-5c55-49199588be0a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559d-3a1e-f33a-89d1d759fa78	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559d-3a1e-669d-2ed021d8637f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559d-3a1e-7e01-cb71dce45d51	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559d-3a1e-85dd-36e825e31297	TH	THA	764	Thailand 	Tajska	\N
00040000-559d-3a1e-1563-d1b4754e29b9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559d-3a1e-a71f-ec6969799a23	TG	TGO	768	Togo 	Togo	\N
00040000-559d-3a1e-55f4-f774a3240bb2	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559d-3a1e-1129-baf8f38c925a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559d-3a1e-a5b7-9ef8074d9745	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559d-3a1e-3ac1-0fbb29b3228d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559d-3a1e-1080-d35fe2cdfaa9	TR	TUR	792	Turkey 	Turčija	\N
00040000-559d-3a1e-55cb-b475221ec890	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559d-3a1e-222f-9de0ee3ea0e5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559d-3a1e-92af-d4a9bea235dd	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559d-3a1e-5ee4-1948e3ec05e9	UG	UGA	800	Uganda 	Uganda	\N
00040000-559d-3a1e-bc5c-dacc1cea3d24	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559d-3a1e-2634-7f8a46dfd036	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559d-3a1e-f85b-86e0780b0a6f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559d-3a1e-3b80-0a7e0afdb717	US	USA	840	United States 	Združene države Amerike	\N
00040000-559d-3a1e-7593-87b027871274	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559d-3a1e-9f82-364ab5c87c35	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559d-3a1e-e4df-79c1a2f9a771	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559d-3a1e-ffde-34684b569922	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559d-3a1e-2010-0069a33f1b9a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559d-3a1e-059f-8e3263e6419c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559d-3a1e-68ce-0e64e3ecb81d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559d-3a1e-02fb-b520a641e05a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559d-3a1e-70a0-649d67ee98d2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559d-3a1e-1927-52fafe27a2f7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559d-3a1e-39cd-b3b66b63c38b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559d-3a1e-60ea-f2ade05cb769	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559d-3a1e-ec1a-01044542c03d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2903 (class 0 OID 9447413)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559d-3a20-798a-4a4c4a2ea475	000e0000-559d-3a20-b76a-7dfa124e81e4	\N	\N	10000.80	9000.30	0.00	0.00	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559d-3a1f-ec3d-adc597f240a2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559d-3a20-de67-c541faa7c67a	000e0000-559d-3a20-4d13-390360c42eb2	\N	\N	5000.00	4900.20	0.00	0.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559d-3a1f-0505-a7677c85377a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2890 (class 0 OID 9447241)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559d-3a20-af8f-53a88834ff0d	000e0000-559d-3a20-4d13-390360c42eb2	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559d-3a1f-1d63-ec2a4ab17d8d
000d0000-559d-3a20-997c-a815cd9d98f4	000e0000-559d-3a20-4d13-390360c42eb2	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559d-3a1f-1d63-ec2a4ab17d8d
000d0000-559d-3a20-0e70-bef3ddb6f7d6	000e0000-559d-3a20-4d13-390360c42eb2	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559d-3a1f-a5ff-4d8d3b5a379c
000d0000-559d-3a20-08a9-ae1a4f027863	000e0000-559d-3a20-4d13-390360c42eb2	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559d-3a1f-157e-7b06f9c1264d
000d0000-559d-3a20-22f2-c3d64df82a2e	000e0000-559d-3a20-4d13-390360c42eb2	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559d-3a1f-157e-7b06f9c1264d
000d0000-559d-3a20-6e99-4bc64eb8da1f	000e0000-559d-3a20-4d13-390360c42eb2	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559d-3a1f-157e-7b06f9c1264d
000d0000-559d-3a20-2118-64a5bb3f0974	000e0000-559d-3a20-4d13-390360c42eb2	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559d-3a1f-1d63-ec2a4ab17d8d
000d0000-559d-3a20-5c25-2433ba43385a	000e0000-559d-3a20-4d13-390360c42eb2	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559d-3a1f-c0a9-3691cc229e53
\.


--
-- TOC entry 2869 (class 0 OID 9447061)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9447109)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9447041)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559d-3a20-b728-6df5691dd714	00080000-559d-3a1f-1ad1-49e3a41dbb33	00090000-559d-3a20-2620-712084086c30	AK		
\.


--
-- TOC entry 2844 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 9447158)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9447183)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 9446998)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559d-3a1e-2b16-da8f11cc49b7	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559d-3a1e-bcf5-d50c98d4f60d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559d-3a1e-54b6-590d346faf81	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559d-3a1e-60b5-2ea8d123998a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559d-3a1e-de99-f892557b5682	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559d-3a1e-7c5f-d66c5627266e	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559d-3a1e-ca00-4b90818f1e75	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559d-3a1e-3439-f7c299a5bbb6	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559d-3a1e-0003-6ab7bf58340f	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559d-3a1e-250c-f184c487e21d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559d-3a1e-b995-b23ddc9104c4	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559d-3a1e-063a-87ec9b6dae7a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559d-3a1e-8ec5-29cab43d681a	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559d-3a20-7543-a97ae0f4ca26	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559d-3a20-eace-417373ccc545	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559d-3a20-7fac-ce88c6549392	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559d-3a20-26d8-1af69ec20742	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559d-3a20-3bb0-739e645a53c6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559d-3a20-e4b6-2b6fb0aa296b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2858 (class 0 OID 9446911)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559d-3a20-4efe-eba04addf562	00000000-559d-3a20-eace-417373ccc545	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559d-3a20-b9bd-72c384584c9a	00000000-559d-3a20-eace-417373ccc545	00010000-559d-3a1e-6aca-411659e9115b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559d-3a20-84ef-0c409adad1bc	00000000-559d-3a20-7fac-ce88c6549392	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2859 (class 0 OID 9446922)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559d-3a20-d72a-6e8b0de58967	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559d-3a20-76a3-b75bd8814031	00010000-559d-3a20-f4b1-0d48ccd56d24	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559d-3a20-53dd-66c124a4d20c	00010000-559d-3a20-9d72-752818b0212a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559d-3a20-9c8a-bbe5a384820d	00010000-559d-3a20-cd98-8f339eb3fb3f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559d-3a20-e5f1-1c2ebe0fa390	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559d-3a20-cd63-65e9c5cdc6b3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559d-3a20-357c-3cd57f931457	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559d-3a20-66ee-d9dc8fa23845	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559d-3a20-2620-712084086c30	00010000-559d-3a20-a8ff-996ded2336a3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559d-3a20-a39a-2c90a5822a7f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559d-3a20-ab44-4ae65257eb01	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559d-3a20-b5c4-ebd36de4b445	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559d-3a20-ae70-1314f006ac66	00010000-559d-3a20-5fe2-31b351df11f3	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2846 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 9446876)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559d-3a1e-b96b-cf34aef67d9b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559d-3a1e-b473-638c909d3be1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559d-3a1e-a52f-63e42d2055b3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559d-3a1e-21ec-4bad7526d11e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559d-3a1e-6bc6-1bf64e66600f	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559d-3a1e-8c5f-fc2a140eaa50	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-559d-3a1e-9740-916494aa5dc3	Abonma-read	Abonma - branje	f
00030000-559d-3a1e-868c-6c37790961f9	Abonma-write	Abonma - spreminjanje	f
00030000-559d-3a1e-718e-f893d07250f1	Alternacija-read	Alternacija - branje	f
00030000-559d-3a1e-44c7-ab0c381f30c2	Alternacija-write	Alternacija - spreminjanje	f
00030000-559d-3a1e-01c8-0a0e5a1f23c8	Arhivalija-read	Arhivalija - branje	f
00030000-559d-3a1e-4583-79f3bbb071b6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559d-3a1e-74fd-52c30954848a	Besedilo-read	Besedilo - branje	f
00030000-559d-3a1e-b297-7469ea9ca4ea	Besedilo-write	Besedilo - spreminjanje	f
00030000-559d-3a1e-5499-d4806e718679	DogodekIzven-read	DogodekIzven - branje	f
00030000-559d-3a1e-2371-9eb5cbd513a3	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559d-3a1e-8e77-e7c316e37dce	Dogodek-read	Dogodek - branje	f
00030000-559d-3a1e-07a0-d264a60be35e	Dogodek-write	Dogodek - spreminjanje	f
00030000-559d-3a1e-0827-3778015c15b5	DrugiVir-read	DrugiVir - branje	f
00030000-559d-3a1e-f74d-e767d81d03c9	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559d-3a1e-b572-21caed9c31e1	Drzava-read	Drzava - branje	f
00030000-559d-3a1e-2460-0d3ddd1a5dd1	Drzava-write	Drzava - spreminjanje	f
00030000-559d-3a1e-d5be-7b5c63ad337e	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559d-3a1e-26b8-64d810e4d3e6	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559d-3a1e-7f70-86e074cd73c8	Funkcija-read	Funkcija - branje	f
00030000-559d-3a1e-0f49-6bd9d939392b	Funkcija-write	Funkcija - spreminjanje	f
00030000-559d-3a1e-f8d3-341a4c2ba447	Gostovanje-read	Gostovanje - branje	f
00030000-559d-3a1e-2f8b-07c297a5c733	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559d-3a1e-6e74-8f795e9e2c67	Gostujoca-read	Gostujoca - branje	f
00030000-559d-3a1e-4569-24065cd36bcd	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559d-3a1e-7602-3acee00150c9	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559d-3a1e-8d22-1821dccf6fc0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559d-3a1e-0d41-9fd3a0ddf902	Kupec-read	Kupec - branje	f
00030000-559d-3a1e-cc12-4ac0585dc1a7	Kupec-write	Kupec - spreminjanje	f
00030000-559d-3a1e-1187-65ca56f8f743	NacinPlacina-read	NacinPlacina - branje	f
00030000-559d-3a1e-153a-e344d9873734	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559d-3a1e-7e23-56dfef8fbf93	Option-read	Option - branje	f
00030000-559d-3a1e-4ed7-a68444fb563f	Option-write	Option - spreminjanje	f
00030000-559d-3a1e-93d2-ab026af445ef	OptionValue-read	OptionValue - branje	f
00030000-559d-3a1e-36c4-d5516363fd71	OptionValue-write	OptionValue - spreminjanje	f
00030000-559d-3a1e-5c77-f656ef24cc68	Oseba-read	Oseba - branje	f
00030000-559d-3a1e-edd1-9b47f7ec80b0	Oseba-write	Oseba - spreminjanje	f
00030000-559d-3a1e-8a17-6e12dfb15034	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559d-3a1e-11ae-dd88f140c0ed	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559d-3a1e-d1f7-1cf61d8834ea	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559d-3a1e-cdc2-dc011e280196	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559d-3a1e-ad93-62745848cbc9	Pogodba-read	Pogodba - branje	f
00030000-559d-3a1e-b1af-f6d7444ff87d	Pogodba-write	Pogodba - spreminjanje	f
00030000-559d-3a1e-c59f-85dfc149dab4	Popa-read	Popa - branje	f
00030000-559d-3a1e-3a51-054137796366	Popa-write	Popa - spreminjanje	f
00030000-559d-3a1e-55ac-6480b0e53a24	Posta-read	Posta - branje	f
00030000-559d-3a1e-115f-15d2d9b5febd	Posta-write	Posta - spreminjanje	f
00030000-559d-3a1e-caa7-7d8d3da4eec0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559d-3a1e-a2e2-fd195e80c833	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559d-3a1e-8348-4ae0bb46c650	PostniNaslov-read	PostniNaslov - branje	f
00030000-559d-3a1e-f23c-fcadb276b1a0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559d-3a1e-ebb9-afbab3e29b50	Predstava-read	Predstava - branje	f
00030000-559d-3a1e-046d-ef06ad22e617	Predstava-write	Predstava - spreminjanje	f
00030000-559d-3a1e-f25d-fd036e1b9b54	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559d-3a1e-1751-43abad021d49	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559d-3a1e-a162-fb179f92c7d4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559d-3a1e-4676-bd699ba65e3d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559d-3a1e-dfd5-f48980e5cff2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559d-3a1e-b332-0851bc3dba1e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559d-3a1e-8f86-6d4d62097eef	ProgramDela-read	ProgramDela - branje	f
00030000-559d-3a1e-5391-c7bb573d7744	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559d-3a1e-8a26-917a933ac5ee	ProgramFestival-read	ProgramFestival - branje	f
00030000-559d-3a1e-4791-3c02e256da46	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559d-3a1e-d6bb-661026ed5e2d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559d-3a1e-a869-c0a8d7d6fea2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559d-3a1e-d82d-1c19ab5dcf8c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559d-3a1e-80df-b67ad975a143	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559d-3a1e-e3ef-d6a544d01d3b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559d-3a1e-2d8a-55896299342d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559d-3a1e-b501-d13614e8efa7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559d-3a1e-64aa-5729fce0dbc7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559d-3a1e-2bc3-933782d65fe4	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559d-3a1e-2a6b-9cd5ee41b519	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559d-3a1e-e8e6-6abfb042eb34	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559d-3a1e-298c-e12cd03caa7c	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559d-3a1e-d0e9-10b6e1191b5f	ProgramRazno-read	ProgramRazno - branje	f
00030000-559d-3a1e-53d6-c8e407bac9c0	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559d-3a1e-7b1f-91e7a699484f	Prostor-read	Prostor - branje	f
00030000-559d-3a1e-7795-79e91fe4c230	Prostor-write	Prostor - spreminjanje	f
00030000-559d-3a1e-4636-612cda80a295	Racun-read	Racun - branje	f
00030000-559d-3a1e-8f86-dd459f80d85c	Racun-write	Racun - spreminjanje	f
00030000-559d-3a1e-a195-a8be71a63640	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559d-3a1e-400b-9b43964056a1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559d-3a1e-e888-e7bc491d35e2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559d-3a1e-0f27-870cf63fdf6b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559d-3a1e-2eb9-fb35b41ceaaa	Rekvizit-read	Rekvizit - branje	f
00030000-559d-3a1e-ea81-86684b33f50f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559d-3a1e-6ef9-fb4f31bfdb6a	Revizija-read	Revizija - branje	f
00030000-559d-3a1e-c7f3-62721417263a	Revizija-write	Revizija - spreminjanje	f
00030000-559d-3a1e-c212-5ef578c9db89	Rezervacija-read	Rezervacija - branje	f
00030000-559d-3a1e-019f-b698c5e73af1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559d-3a1e-a6f3-78a45f253bcb	SedezniRed-read	SedezniRed - branje	f
00030000-559d-3a1e-9fdf-c491f763e460	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559d-3a1e-a710-9ebabcfccf0e	Sedez-read	Sedez - branje	f
00030000-559d-3a1e-0362-4c10670fe309	Sedez-write	Sedez - spreminjanje	f
00030000-559d-3a1e-3760-1ca40a01e2ae	Sezona-read	Sezona - branje	f
00030000-559d-3a1e-7126-dd9e24d0dc95	Sezona-write	Sezona - spreminjanje	f
00030000-559d-3a1e-2edc-1730f947d1fb	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559d-3a1e-2d04-701bfd374716	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559d-3a1e-86b0-0a5b33e14d52	Stevilcenje-read	Stevilcenje - branje	f
00030000-559d-3a1e-fe20-7c83199e32c6	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559d-3a1e-7563-6a6c5a1b9432	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559d-3a1e-6cfb-033f5a722c1e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559d-3a1e-78ab-93c762f70f53	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559d-3a1e-0f95-a108b5a41ef9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559d-3a1e-7d51-fec1e43d5b8c	Telefonska-read	Telefonska - branje	f
00030000-559d-3a1e-6b50-573339ae6802	Telefonska-write	Telefonska - spreminjanje	f
00030000-559d-3a1e-f7a4-a1d456e682a2	TerminStoritve-read	TerminStoritve - branje	f
00030000-559d-3a1e-59a9-a2f8c014ddaa	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559d-3a1e-3577-8b75dc7e8f0c	TipFunkcije-read	TipFunkcije - branje	f
00030000-559d-3a1e-9dd6-b947df003681	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559d-3a1e-a81e-ee1b8fef756a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559d-3a1e-6e24-e9aac9ff57e9	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559d-3a1e-5f50-d5fb6771e513	Trr-read	Trr - branje	f
00030000-559d-3a1e-32a7-f39fac97f78b	Trr-write	Trr - spreminjanje	f
00030000-559d-3a1e-1dbc-e534cd16fea3	Uprizoritev-read	Uprizoritev - branje	f
00030000-559d-3a1e-0521-679869558e42	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559d-3a1e-f32b-02f7b01e742f	Vaja-read	Vaja - branje	f
00030000-559d-3a1e-1fa9-91cee680e9d2	Vaja-write	Vaja - spreminjanje	f
00030000-559d-3a1e-fcc9-05236523fb01	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559d-3a1e-37e7-2d2d2fe2edd3	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559d-3a1e-af3f-c6bc340e3753	Zaposlitev-read	Zaposlitev - branje	f
00030000-559d-3a1e-7462-666f83a3ce70	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559d-3a1e-6e80-27c46c34d011	Zasedenost-read	Zasedenost - branje	f
00030000-559d-3a1e-08be-3fad7d3fda8d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559d-3a1e-66ec-24038afaa728	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559d-3a1e-2d89-66a444c062cc	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559d-3a1e-4c4b-066166675f9a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559d-3a1e-3ad2-d05279b9e164	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2856 (class 0 OID 9446895)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559d-3a1e-4e8b-5301f4e64fd0	00030000-559d-3a1e-b473-638c909d3be1
00020000-559d-3a1e-9b74-99dac4df5310	00030000-559d-3a1e-b572-21caed9c31e1
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-9740-916494aa5dc3
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-868c-6c37790961f9
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-718e-f893d07250f1
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-44c7-ab0c381f30c2
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-01c8-0a0e5a1f23c8
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-8e77-e7c316e37dce
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-21ec-4bad7526d11e
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-07a0-d264a60be35e
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-b572-21caed9c31e1
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-2460-0d3ddd1a5dd1
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-7f70-86e074cd73c8
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-0f49-6bd9d939392b
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-f8d3-341a4c2ba447
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-2f8b-07c297a5c733
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-6e74-8f795e9e2c67
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-4569-24065cd36bcd
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-7602-3acee00150c9
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-8d22-1821dccf6fc0
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-7e23-56dfef8fbf93
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-93d2-ab026af445ef
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-5c77-f656ef24cc68
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-edd1-9b47f7ec80b0
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-c59f-85dfc149dab4
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-3a51-054137796366
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-55ac-6480b0e53a24
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-115f-15d2d9b5febd
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-8348-4ae0bb46c650
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-f23c-fcadb276b1a0
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-ebb9-afbab3e29b50
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-046d-ef06ad22e617
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-dfd5-f48980e5cff2
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-b332-0851bc3dba1e
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-7b1f-91e7a699484f
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-7795-79e91fe4c230
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-e888-e7bc491d35e2
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-0f27-870cf63fdf6b
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-2eb9-fb35b41ceaaa
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-ea81-86684b33f50f
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-3760-1ca40a01e2ae
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-7126-dd9e24d0dc95
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-3577-8b75dc7e8f0c
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-1dbc-e534cd16fea3
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-0521-679869558e42
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-f32b-02f7b01e742f
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-1fa9-91cee680e9d2
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-6e80-27c46c34d011
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-08be-3fad7d3fda8d
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-66ec-24038afaa728
00020000-559d-3a1e-5261-ab7443c2d939	00030000-559d-3a1e-4c4b-066166675f9a
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-9740-916494aa5dc3
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-01c8-0a0e5a1f23c8
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-8e77-e7c316e37dce
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-b572-21caed9c31e1
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-f8d3-341a4c2ba447
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-6e74-8f795e9e2c67
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-7602-3acee00150c9
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-8d22-1821dccf6fc0
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-7e23-56dfef8fbf93
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-93d2-ab026af445ef
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-5c77-f656ef24cc68
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-edd1-9b47f7ec80b0
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-c59f-85dfc149dab4
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-55ac-6480b0e53a24
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-8348-4ae0bb46c650
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-f23c-fcadb276b1a0
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-ebb9-afbab3e29b50
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-7b1f-91e7a699484f
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-e888-e7bc491d35e2
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-2eb9-fb35b41ceaaa
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-3760-1ca40a01e2ae
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-7d51-fec1e43d5b8c
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-6b50-573339ae6802
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-5f50-d5fb6771e513
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-32a7-f39fac97f78b
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-af3f-c6bc340e3753
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-7462-666f83a3ce70
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-66ec-24038afaa728
00020000-559d-3a1e-2644-0225410ae643	00030000-559d-3a1e-4c4b-066166675f9a
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-9740-916494aa5dc3
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-718e-f893d07250f1
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-01c8-0a0e5a1f23c8
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-4583-79f3bbb071b6
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-74fd-52c30954848a
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-5499-d4806e718679
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-8e77-e7c316e37dce
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-b572-21caed9c31e1
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-7f70-86e074cd73c8
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-f8d3-341a4c2ba447
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-6e74-8f795e9e2c67
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-7602-3acee00150c9
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-7e23-56dfef8fbf93
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-93d2-ab026af445ef
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-5c77-f656ef24cc68
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-c59f-85dfc149dab4
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-55ac-6480b0e53a24
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-ebb9-afbab3e29b50
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-dfd5-f48980e5cff2
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-7b1f-91e7a699484f
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-e888-e7bc491d35e2
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-2eb9-fb35b41ceaaa
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-3760-1ca40a01e2ae
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-3577-8b75dc7e8f0c
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-f32b-02f7b01e742f
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-6e80-27c46c34d011
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-66ec-24038afaa728
00020000-559d-3a1e-59c0-2bd7bf1d13b9	00030000-559d-3a1e-4c4b-066166675f9a
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-9740-916494aa5dc3
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-868c-6c37790961f9
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-44c7-ab0c381f30c2
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-01c8-0a0e5a1f23c8
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-8e77-e7c316e37dce
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-b572-21caed9c31e1
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-f8d3-341a4c2ba447
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-6e74-8f795e9e2c67
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-7e23-56dfef8fbf93
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-93d2-ab026af445ef
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-c59f-85dfc149dab4
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-55ac-6480b0e53a24
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-ebb9-afbab3e29b50
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-7b1f-91e7a699484f
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-e888-e7bc491d35e2
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-2eb9-fb35b41ceaaa
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-3760-1ca40a01e2ae
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-3577-8b75dc7e8f0c
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-66ec-24038afaa728
00020000-559d-3a1e-a951-18d0f9f90b29	00030000-559d-3a1e-4c4b-066166675f9a
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-9740-916494aa5dc3
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-01c8-0a0e5a1f23c8
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-8e77-e7c316e37dce
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-b572-21caed9c31e1
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-f8d3-341a4c2ba447
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-6e74-8f795e9e2c67
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-7e23-56dfef8fbf93
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-93d2-ab026af445ef
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-c59f-85dfc149dab4
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-55ac-6480b0e53a24
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-ebb9-afbab3e29b50
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-7b1f-91e7a699484f
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-e888-e7bc491d35e2
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-2eb9-fb35b41ceaaa
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-3760-1ca40a01e2ae
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-f7a4-a1d456e682a2
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-a52f-63e42d2055b3
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-3577-8b75dc7e8f0c
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-66ec-24038afaa728
00020000-559d-3a1e-6609-198a33ef0639	00030000-559d-3a1e-4c4b-066166675f9a
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-b96b-cf34aef67d9b
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-b473-638c909d3be1
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-a52f-63e42d2055b3
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-21ec-4bad7526d11e
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-6bc6-1bf64e66600f
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-8c5f-fc2a140eaa50
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-9740-916494aa5dc3
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-868c-6c37790961f9
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-718e-f893d07250f1
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-44c7-ab0c381f30c2
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-01c8-0a0e5a1f23c8
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-4583-79f3bbb071b6
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-74fd-52c30954848a
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-b297-7469ea9ca4ea
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-5499-d4806e718679
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2371-9eb5cbd513a3
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-8e77-e7c316e37dce
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-07a0-d264a60be35e
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-b572-21caed9c31e1
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2460-0d3ddd1a5dd1
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-d5be-7b5c63ad337e
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-26b8-64d810e4d3e6
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7f70-86e074cd73c8
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-0f49-6bd9d939392b
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-f8d3-341a4c2ba447
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2f8b-07c297a5c733
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-6e74-8f795e9e2c67
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-4569-24065cd36bcd
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7602-3acee00150c9
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-8d22-1821dccf6fc0
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-0d41-9fd3a0ddf902
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-cc12-4ac0585dc1a7
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-1187-65ca56f8f743
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-153a-e344d9873734
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7e23-56dfef8fbf93
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-4ed7-a68444fb563f
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-93d2-ab026af445ef
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-36c4-d5516363fd71
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-5c77-f656ef24cc68
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-edd1-9b47f7ec80b0
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-8a17-6e12dfb15034
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-11ae-dd88f140c0ed
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-d1f7-1cf61d8834ea
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-cdc2-dc011e280196
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-ad93-62745848cbc9
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-b1af-f6d7444ff87d
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-c59f-85dfc149dab4
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-3a51-054137796366
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-55ac-6480b0e53a24
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-115f-15d2d9b5febd
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-caa7-7d8d3da4eec0
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-a2e2-fd195e80c833
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-8348-4ae0bb46c650
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-f23c-fcadb276b1a0
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-ebb9-afbab3e29b50
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-046d-ef06ad22e617
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-f25d-fd036e1b9b54
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-1751-43abad021d49
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-a162-fb179f92c7d4
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-4676-bd699ba65e3d
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-dfd5-f48980e5cff2
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-b332-0851bc3dba1e
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-8f86-6d4d62097eef
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-5391-c7bb573d7744
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-8a26-917a933ac5ee
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-4791-3c02e256da46
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-d6bb-661026ed5e2d
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-a869-c0a8d7d6fea2
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-d82d-1c19ab5dcf8c
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-80df-b67ad975a143
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-e3ef-d6a544d01d3b
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2d8a-55896299342d
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-b501-d13614e8efa7
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-64aa-5729fce0dbc7
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2bc3-933782d65fe4
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2a6b-9cd5ee41b519
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-e8e6-6abfb042eb34
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-298c-e12cd03caa7c
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-d0e9-10b6e1191b5f
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-53d6-c8e407bac9c0
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7b1f-91e7a699484f
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7795-79e91fe4c230
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-4636-612cda80a295
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-8f86-dd459f80d85c
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-a195-a8be71a63640
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-400b-9b43964056a1
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-e888-e7bc491d35e2
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-0f27-870cf63fdf6b
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2eb9-fb35b41ceaaa
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-ea81-86684b33f50f
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-6ef9-fb4f31bfdb6a
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-c7f3-62721417263a
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-c212-5ef578c9db89
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-019f-b698c5e73af1
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-a6f3-78a45f253bcb
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-9fdf-c491f763e460
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-a710-9ebabcfccf0e
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-0362-4c10670fe309
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-3760-1ca40a01e2ae
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7126-dd9e24d0dc95
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2edc-1730f947d1fb
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2d04-701bfd374716
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-86b0-0a5b33e14d52
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-fe20-7c83199e32c6
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7563-6a6c5a1b9432
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-6cfb-033f5a722c1e
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-78ab-93c762f70f53
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-0f95-a108b5a41ef9
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7d51-fec1e43d5b8c
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-6b50-573339ae6802
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-f7a4-a1d456e682a2
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-59a9-a2f8c014ddaa
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-3577-8b75dc7e8f0c
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-9dd6-b947df003681
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-a81e-ee1b8fef756a
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-6e24-e9aac9ff57e9
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-5f50-d5fb6771e513
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-32a7-f39fac97f78b
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-1dbc-e534cd16fea3
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-0521-679869558e42
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-f32b-02f7b01e742f
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-1fa9-91cee680e9d2
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-fcc9-05236523fb01
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-37e7-2d2d2fe2edd3
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-af3f-c6bc340e3753
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-7462-666f83a3ce70
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-6e80-27c46c34d011
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-08be-3fad7d3fda8d
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-66ec-24038afaa728
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-2d89-66a444c062cc
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-4c4b-066166675f9a
00020000-559d-3a20-d0f9-6fa7dcde655e	00030000-559d-3a1e-3ad2-d05279b9e164
\.


--
-- TOC entry 2884 (class 0 OID 9447190)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 9447221)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9447334)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559d-3a20-7b4c-2019282051a6	00090000-559d-3a20-d72a-6e8b0de58967	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-559d-3a20-0a8a-c4a215aeec87	00090000-559d-3a20-cd63-65e9c5cdc6b3	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-559d-3a20-2c01-bdcf9769fea0	00090000-559d-3a20-ae70-1314f006ac66	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2861 (class 0 OID 9446955)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559d-3a1f-1ad1-49e3a41dbb33	00040000-559d-3a1e-1fe1-bb906e974032	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-3a1f-f5d8-81bab18910e8	00040000-559d-3a1e-1fe1-bb906e974032	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559d-3a1f-74a9-dd927470449d	00040000-559d-3a1e-1fe1-bb906e974032	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-3a1f-b0b7-b7451ba064ec	00040000-559d-3a1e-1fe1-bb906e974032	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-3a1f-8ce5-ca9fa7eb94a3	00040000-559d-3a1e-1fe1-bb906e974032	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-3a1f-55ef-b2ebebf05baa	00040000-559d-3a1e-c61a-a403a4e4004e	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-3a1f-f987-1f1e11d12070	00040000-559d-3a1e-e230-da5b315db9e2	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-3a1f-f75f-a6321ffffbd6	00040000-559d-3a1e-aa21-db75e734d822	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-3a20-7e71-ac1bebfcc66b	00040000-559d-3a1e-1fe1-bb906e974032	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2863 (class 0 OID 9446990)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559d-3a1e-0818-2ca9fd3fd1db	8341	Adlešiči
00050000-559d-3a1e-9f44-87246844742e	5270	Ajdovščina
00050000-559d-3a1e-566b-753064da69c9	6280	Ankaran/Ancarano
00050000-559d-3a1e-a280-5c321f2d9303	9253	Apače
00050000-559d-3a1e-5e59-2b08fcc11dab	8253	Artiče
00050000-559d-3a1e-cb04-fdaca0706b1d	4275	Begunje na Gorenjskem
00050000-559d-3a1e-8a22-33075eee8b99	1382	Begunje pri Cerknici
00050000-559d-3a1e-ad09-64351eb6517b	9231	Beltinci
00050000-559d-3a1e-b80e-1daf3ee95343	2234	Benedikt
00050000-559d-3a1e-b72d-ae84fe921b06	2345	Bistrica ob Dravi
00050000-559d-3a1e-405f-d19c24b482d9	3256	Bistrica ob Sotli
00050000-559d-3a1e-50c7-d93333443b73	8259	Bizeljsko
00050000-559d-3a1e-86bc-b6e12e90b9f7	1223	Blagovica
00050000-559d-3a1e-dc43-b83c6f305726	8283	Blanca
00050000-559d-3a1e-fde7-8bd1e49be05c	4260	Bled
00050000-559d-3a1e-e28b-ee1b487f12d0	4273	Blejska Dobrava
00050000-559d-3a1e-8f0b-728b03a2775e	9265	Bodonci
00050000-559d-3a1e-af09-fa7a0b5fc0e0	9222	Bogojina
00050000-559d-3a1e-0922-fa00927f7d7c	4263	Bohinjska Bela
00050000-559d-3a1e-cbc2-6890c60ea487	4264	Bohinjska Bistrica
00050000-559d-3a1e-ff12-6c583c116616	4265	Bohinjsko jezero
00050000-559d-3a1e-f2c1-09f3e11eeb1c	1353	Borovnica
00050000-559d-3a1e-3860-885105cb1e47	8294	Boštanj
00050000-559d-3a1e-0c02-6eabf82ffb6c	5230	Bovec
00050000-559d-3a1e-e9b6-3c0a716e2d28	5295	Branik
00050000-559d-3a1e-0047-bed417e21ae2	3314	Braslovče
00050000-559d-3a1e-e2e1-b2a93a59ff71	5223	Breginj
00050000-559d-3a1e-241c-b421f0a92ace	8280	Brestanica
00050000-559d-3a1e-2904-fe084b1aa046	2354	Bresternica
00050000-559d-3a1e-4539-0ee2e0d58491	4243	Brezje
00050000-559d-3a1e-0e51-264d1aca7c70	1351	Brezovica pri Ljubljani
00050000-559d-3a1e-637f-71b5376470e6	8250	Brežice
00050000-559d-3a1e-73c6-b61fb4531d7e	4210	Brnik - Aerodrom
00050000-559d-3a1e-4307-269a63885110	8321	Brusnice
00050000-559d-3a1e-60e8-5baf1506a99b	3255	Buče
00050000-559d-3a1e-fd4c-df22bb7062d1	8276	Bučka 
00050000-559d-3a1e-c3d5-374b043b1419	9261	Cankova
00050000-559d-3a1e-9a6e-cd80e5803892	3000	Celje 
00050000-559d-3a1e-bb74-2cc17af9e62c	3001	Celje - poštni predali
00050000-559d-3a1e-044b-d74941749e58	4207	Cerklje na Gorenjskem
00050000-559d-3a1e-32ba-2d31167c27d6	8263	Cerklje ob Krki
00050000-559d-3a1e-ea8a-dcd32c1d3b96	1380	Cerknica
00050000-559d-3a1e-b4ef-f68c70181423	5282	Cerkno
00050000-559d-3a1e-369b-96d160757797	2236	Cerkvenjak
00050000-559d-3a1e-c8c8-27a30e1e9bf0	2215	Ceršak
00050000-559d-3a1e-dda2-36244040b488	2326	Cirkovce
00050000-559d-3a1e-f580-4ec31207bbec	2282	Cirkulane
00050000-559d-3a1e-72f1-ee3f84be7118	5273	Col
00050000-559d-3a1e-63cf-01407eac52ee	8251	Čatež ob Savi
00050000-559d-3a1e-9ad4-f3c204c332aa	1413	Čemšenik
00050000-559d-3a1e-0617-5f4030cea6a9	5253	Čepovan
00050000-559d-3a1e-ceb6-bb28d259ca31	9232	Črenšovci
00050000-559d-3a1e-b614-d24ae38752a3	2393	Črna na Koroškem
00050000-559d-3a1e-9960-bf2d75568d5e	6275	Črni Kal
00050000-559d-3a1e-5ee7-42ab7ac0d59f	5274	Črni Vrh nad Idrijo
00050000-559d-3a1e-81ed-54f55a6299ff	5262	Črniče
00050000-559d-3a1e-f4ed-135d522eec7b	8340	Črnomelj
00050000-559d-3a1e-14a8-6716c5e8f02f	6271	Dekani
00050000-559d-3a1e-9d49-cce3cdf0ca9d	5210	Deskle
00050000-559d-3a1e-17e3-59703f3cb9f7	2253	Destrnik
00050000-559d-3a1e-5881-89e7a0157faf	6215	Divača
00050000-559d-3a1e-3310-861f585713d7	1233	Dob
00050000-559d-3a1e-01cb-2e1b80a21fc3	3224	Dobje pri Planini
00050000-559d-3a1e-a79e-c75d3c0b1468	8257	Dobova
00050000-559d-3a1e-65ed-d5c79b30d70d	1423	Dobovec
00050000-559d-3a1e-7247-c9faacbe3311	5263	Dobravlje
00050000-559d-3a1e-ee57-8c369b3d7f92	3204	Dobrna
00050000-559d-3a1e-a55a-a80d9ba8e81f	8211	Dobrnič
00050000-559d-3a1e-dfb9-2591603463d9	1356	Dobrova
00050000-559d-3a1e-0001-cd8d3d1c3e4a	9223	Dobrovnik/Dobronak 
00050000-559d-3a1e-98de-631c04315f69	5212	Dobrovo v Brdih
00050000-559d-3a1e-0e34-7a97525be342	1431	Dol pri Hrastniku
00050000-559d-3a1e-de11-ddb1f1a057bb	1262	Dol pri Ljubljani
00050000-559d-3a1e-2ad2-d8dbf42119bf	1273	Dole pri Litiji
00050000-559d-3a1e-fe61-2856b5d23ad4	1331	Dolenja vas
00050000-559d-3a1e-5307-d6d778c3596a	8350	Dolenjske Toplice
00050000-559d-3a1e-9397-ee8cece2a020	1230	Domžale
00050000-559d-3a1e-dbfd-ff86291d4898	2252	Dornava
00050000-559d-3a1e-f9bb-5e7a26fddd37	5294	Dornberk
00050000-559d-3a1e-0b6a-36b8db25d970	1319	Draga
00050000-559d-3a1e-6a6f-b6904ce5b309	8343	Dragatuš
00050000-559d-3a1e-8e14-26bb7bfee1bf	3222	Dramlje
00050000-559d-3a1e-0c5c-d4af59364d45	2370	Dravograd
00050000-559d-3a1e-5acc-9e6f945452cc	4203	Duplje
00050000-559d-3a1e-0b96-f9e795c89b79	6221	Dutovlje
00050000-559d-3a1e-01cd-77bce2665294	8361	Dvor
00050000-559d-3a1e-e7db-994d032a9d9f	2343	Fala
00050000-559d-3a1e-cfd8-32d8c71bdee8	9208	Fokovci
00050000-559d-3a1e-0f6d-6abb9734042a	2313	Fram
00050000-559d-3a1e-2b2a-77cd4c887ede	3213	Frankolovo
00050000-559d-3a1e-f363-0ff7910102cd	1274	Gabrovka
00050000-559d-3a1e-ceb4-56b66b1acddf	8254	Globoko
00050000-559d-3a1e-7343-dbc12206b98f	5275	Godovič
00050000-559d-3a1e-008b-76547d900c4f	4204	Golnik
00050000-559d-3a1e-996a-bb2edb0d5421	3303	Gomilsko
00050000-559d-3a1e-bd99-31d5a7857c6e	4224	Gorenja vas
00050000-559d-3a1e-f528-b6dc4874892d	3263	Gorica pri Slivnici
00050000-559d-3a1e-bda3-97cd77e5f76c	2272	Gorišnica
00050000-559d-3a1e-636f-4340d6033287	9250	Gornja Radgona
00050000-559d-3a1e-4b9b-8785db67d567	3342	Gornji Grad
00050000-559d-3a1e-4d9e-9909ff6079b8	4282	Gozd Martuljek
00050000-559d-3a1e-9bb0-30aecf44379c	6272	Gračišče
00050000-559d-3a1e-e662-e1a02aee250f	9264	Grad
00050000-559d-3a1e-e9f8-94e8fde12d08	8332	Gradac
00050000-559d-3a1e-5404-78c04ea219a5	1384	Grahovo
00050000-559d-3a1e-90a2-85e0ff2e443a	5242	Grahovo ob Bači
00050000-559d-3a1e-0a73-ea24925d8d45	5251	Grgar
00050000-559d-3a1e-49a4-7b58a7b4b448	3302	Griže
00050000-559d-3a1e-984f-e88aa04fd00b	3231	Grobelno
00050000-559d-3a1e-1197-3bef94522e12	1290	Grosuplje
00050000-559d-3a1e-0081-49a598b17914	2288	Hajdina
00050000-559d-3a1e-b7c4-9277b98be0cb	8362	Hinje
00050000-559d-3a1e-5afd-34c79c3c3fe3	2311	Hoče
00050000-559d-3a1e-79a1-5ba9026df9bb	9205	Hodoš/Hodos
00050000-559d-3a1e-3157-67d619595ccb	1354	Horjul
00050000-559d-3a1e-3d56-3f4b81107f6b	1372	Hotedršica
00050000-559d-3a1e-ba35-71e8765e1053	1430	Hrastnik
00050000-559d-3a1e-80b5-f3a69aea5613	6225	Hruševje
00050000-559d-3a1e-7452-ca5219666ec3	4276	Hrušica
00050000-559d-3a1e-f424-1a1dc13b1cab	5280	Idrija
00050000-559d-3a1e-2a42-cb1a3aeea5b3	1292	Ig
00050000-559d-3a1e-4145-764a610ef13b	6250	Ilirska Bistrica
00050000-559d-3a1e-2fcb-e791c3bd4878	6251	Ilirska Bistrica-Trnovo
00050000-559d-3a1e-c7fa-512fab5040be	1295	Ivančna Gorica
00050000-559d-3a1e-9faf-6c0a4bb38777	2259	Ivanjkovci
00050000-559d-3a1e-e098-b220fc8e2eb6	1411	Izlake
00050000-559d-3a1e-ce85-a5f7230ad07b	6310	Izola/Isola
00050000-559d-3a1e-f119-d6a577d3ebc3	2222	Jakobski Dol
00050000-559d-3a1e-ac58-6f41c7a8384c	2221	Jarenina
00050000-559d-3a1e-a801-e238c1cbd2a7	6254	Jelšane
00050000-559d-3a1e-b120-301b7d7c83c5	4270	Jesenice
00050000-559d-3a1e-421c-509b6451e0d3	8261	Jesenice na Dolenjskem
00050000-559d-3a1e-a3eb-6196e4184559	3273	Jurklošter
00050000-559d-3a1e-6331-9e761f05f871	2223	Jurovski Dol
00050000-559d-3a1e-f63c-099fc5639d94	2256	Juršinci
00050000-559d-3a1e-a30c-bde0607f90c0	5214	Kal nad Kanalom
00050000-559d-3a1e-8922-be8addba35d8	3233	Kalobje
00050000-559d-3a1e-55ba-e361f132dcb6	4246	Kamna Gorica
00050000-559d-3a1e-f12b-407bd299dabb	2351	Kamnica
00050000-559d-3a1e-d676-bac68fcf7481	1241	Kamnik
00050000-559d-3a1e-f7ce-dee7085798d2	5213	Kanal
00050000-559d-3a1e-bdc7-1c2d42faf70c	8258	Kapele
00050000-559d-3a1e-4575-698b0d39e00e	2362	Kapla
00050000-559d-3a1e-b14d-a4c0b88e603e	2325	Kidričevo
00050000-559d-3a1e-82d4-f9fdb0628a60	1412	Kisovec
00050000-559d-3a1e-14f0-ce57638aa4f1	6253	Knežak
00050000-559d-3a1e-32ed-c70736fadca9	5222	Kobarid
00050000-559d-3a1e-c71d-d87e4db68d39	9227	Kobilje
00050000-559d-3a1e-4a6c-2159faff1851	1330	Kočevje
00050000-559d-3a1e-2bc4-05f59da78818	1338	Kočevska Reka
00050000-559d-3a1e-5a53-2939b0e2fa14	2276	Kog
00050000-559d-3a1e-2be5-852a9454d408	5211	Kojsko
00050000-559d-3a1e-3695-d3bbe1bd98f0	6223	Komen
00050000-559d-3a1e-16de-b00a264b4cd1	1218	Komenda
00050000-559d-3a1e-4d38-d8172f33235e	6000	Koper/Capodistria 
00050000-559d-3a1e-79f0-5b866f8757d0	6001	Koper/Capodistria - poštni predali
00050000-559d-3a1e-2303-5761f40e3a22	8282	Koprivnica
00050000-559d-3a1e-1766-67104003756b	5296	Kostanjevica na Krasu
00050000-559d-3a1e-9a73-85d857f10ce2	8311	Kostanjevica na Krki
00050000-559d-3a1e-ac35-e94fc6248235	1336	Kostel
00050000-559d-3a1e-e918-755cdee3490a	6256	Košana
00050000-559d-3a1e-0a91-72c5f90608ac	2394	Kotlje
00050000-559d-3a1e-557c-94e9dbdc8d29	6240	Kozina
00050000-559d-3a1e-1175-635f22f5afc2	3260	Kozje
00050000-559d-3a1e-cbb1-dbe56dfda6c4	4000	Kranj 
00050000-559d-3a1e-18f9-23df43091d7a	4001	Kranj - poštni predali
00050000-559d-3a1e-af7a-718aea91e5cd	4280	Kranjska Gora
00050000-559d-3a1e-c302-f459f4726006	1281	Kresnice
00050000-559d-3a1e-7c3f-0f8fed0350f9	4294	Križe
00050000-559d-3a1e-1435-320d5dd468bc	9206	Križevci
00050000-559d-3a1e-c76d-caafefd52b22	9242	Križevci pri Ljutomeru
00050000-559d-3a1e-76f5-16bb64d2d859	1301	Krka
00050000-559d-3a1e-8581-cd1efe0d2494	8296	Krmelj
00050000-559d-3a1e-e0e6-7306c2258767	4245	Kropa
00050000-559d-3a1e-fb1e-5a52e0ac8158	8262	Krška vas
00050000-559d-3a1e-8786-bbcd86a147f2	8270	Krško
00050000-559d-3a1e-9298-987036e758ff	9263	Kuzma
00050000-559d-3a1e-c1d7-766ff371e9dc	2318	Laporje
00050000-559d-3a1e-d9ea-14b6999e084f	3270	Laško
00050000-559d-3a1e-8bfa-956e0ea70473	1219	Laze v Tuhinju
00050000-559d-3a1e-d323-3be05adba73a	2230	Lenart v Slovenskih goricah
00050000-559d-3a1e-0cee-e1a6d43e6076	9220	Lendava/Lendva
00050000-559d-3a1e-cc03-260d1086ba9b	4248	Lesce
00050000-559d-3a1e-23e8-238499ce96e0	3261	Lesično
00050000-559d-3a1e-a7e1-e59a75e53c96	8273	Leskovec pri Krškem
00050000-559d-3a1e-8aeb-edcaa344f99b	2372	Libeliče
00050000-559d-3a1f-cfcb-d2e005824164	2341	Limbuš
00050000-559d-3a1f-a7a4-3afd033f0da6	1270	Litija
00050000-559d-3a1f-1c44-02dad208af3f	3202	Ljubečna
00050000-559d-3a1f-bbad-76048700f614	1000	Ljubljana 
00050000-559d-3a1f-d899-bce52c58700b	1001	Ljubljana - poštni predali
00050000-559d-3a1f-6f1d-b645ee7d3c24	1231	Ljubljana - Črnuče
00050000-559d-3a1f-0dfc-0383fa57f359	1261	Ljubljana - Dobrunje
00050000-559d-3a1f-e975-72d9ac6083c0	1260	Ljubljana - Polje
00050000-559d-3a1f-4ff3-95a276dd9d68	1210	Ljubljana - Šentvid
00050000-559d-3a1f-c41f-384bd2041537	1211	Ljubljana - Šmartno
00050000-559d-3a1f-76c6-682f64735497	3333	Ljubno ob Savinji
00050000-559d-3a1f-6d9e-1ada806f72bf	9240	Ljutomer
00050000-559d-3a1f-28df-c5b8ad9188c8	3215	Loče
00050000-559d-3a1f-7629-4792f2c0ec39	5231	Log pod Mangartom
00050000-559d-3a1f-59fc-18ba3b67c2e8	1358	Log pri Brezovici
00050000-559d-3a1f-81b8-6005c23c818c	1370	Logatec
00050000-559d-3a1f-95d9-891361433efe	1371	Logatec
00050000-559d-3a1f-a74d-233a97cecb22	1434	Loka pri Zidanem Mostu
00050000-559d-3a1f-1f4e-117405a739cd	3223	Loka pri Žusmu
00050000-559d-3a1f-3c18-20935f5518f6	6219	Lokev
00050000-559d-3a1f-a63d-6a7b5ca82d35	1318	Loški Potok
00050000-559d-3a1f-297f-6fa980bc6f69	2324	Lovrenc na Dravskem polju
00050000-559d-3a1f-7bf6-1913c55ddad6	2344	Lovrenc na Pohorju
00050000-559d-3a1f-8b24-ac5044b9e891	3334	Luče
00050000-559d-3a1f-4210-d2d8fac4de63	1225	Lukovica
00050000-559d-3a1f-8aae-a052c2f6bd43	9202	Mačkovci
00050000-559d-3a1f-2825-997a9a965817	2322	Majšperk
00050000-559d-3a1f-3c77-8fd41b2a1a9d	2321	Makole
00050000-559d-3a1f-3be2-59515388ca26	9243	Mala Nedelja
00050000-559d-3a1f-ed0d-684b14cc3fcc	2229	Malečnik
00050000-559d-3a1f-ca69-e16f34122e57	6273	Marezige
00050000-559d-3a1f-487c-2f1793a2476f	2000	Maribor 
00050000-559d-3a1f-8dfa-387e2895c3ca	2001	Maribor - poštni predali
00050000-559d-3a1f-7538-c56ac08a99e4	2206	Marjeta na Dravskem polju
00050000-559d-3a1f-5b48-e1d93ea530f1	2281	Markovci
00050000-559d-3a1f-55e3-f105f1f631e7	9221	Martjanci
00050000-559d-3a1f-93fc-fadc7f5df35a	6242	Materija
00050000-559d-3a1f-bf4c-11d59933439f	4211	Mavčiče
00050000-559d-3a1f-349e-789677af9ed1	1215	Medvode
00050000-559d-3a1f-d821-4866957d6fde	1234	Mengeš
00050000-559d-3a1f-4226-3c4d80e3fa06	8330	Metlika
00050000-559d-3a1f-184e-c2f4c4e46d0e	2392	Mežica
00050000-559d-3a1f-2463-f99c73db4f41	2204	Miklavž na Dravskem polju
00050000-559d-3a1f-4856-205d95d735ce	2275	Miklavž pri Ormožu
00050000-559d-3a1f-0099-4f20102493c1	5291	Miren
00050000-559d-3a1f-d36f-712c5e5c121d	8233	Mirna
00050000-559d-3a1f-c1ce-456cf5dd701d	8216	Mirna Peč
00050000-559d-3a1f-8f41-d76a898f6503	2382	Mislinja
00050000-559d-3a1f-4400-46991cfa0811	4281	Mojstrana
00050000-559d-3a1f-af16-fb6ff283fecc	8230	Mokronog
00050000-559d-3a1f-7c71-b914d7c857f4	1251	Moravče
00050000-559d-3a1f-3df4-4b00443df540	9226	Moravske Toplice
00050000-559d-3a1f-def6-30e0e0d2a00b	5216	Most na Soči
00050000-559d-3a1f-d8c7-50eac0e3072b	1221	Motnik
00050000-559d-3a1f-c4d0-aad8217e0bbd	3330	Mozirje
00050000-559d-3a1f-a37d-707108098765	9000	Murska Sobota 
00050000-559d-3a1f-e8d2-dd74c6704b86	9001	Murska Sobota - poštni predali
00050000-559d-3a1f-11f6-b60492d816eb	2366	Muta
00050000-559d-3a1f-a63e-aa60518ba7de	4202	Naklo
00050000-559d-3a1f-ed0e-cb1e033c6a1b	3331	Nazarje
00050000-559d-3a1f-c2ac-e0f757bba698	1357	Notranje Gorice
00050000-559d-3a1f-323f-323c9ce958d4	3203	Nova Cerkev
00050000-559d-3a1f-2e26-8f39626945e2	5000	Nova Gorica 
00050000-559d-3a1f-74ff-f0396cf5e00b	5001	Nova Gorica - poštni predali
00050000-559d-3a1f-176b-53ebb2918a55	1385	Nova vas
00050000-559d-3a1f-3769-294ccf0106b8	8000	Novo mesto
00050000-559d-3a1f-9e1d-cf510f49a9ee	8001	Novo mesto - poštni predali
00050000-559d-3a1f-bf54-c519551b1eec	6243	Obrov
00050000-559d-3a1f-278d-743a432a1b89	9233	Odranci
00050000-559d-3a1f-802e-83a5b267251d	2317	Oplotnica
00050000-559d-3a1f-e2d0-36a7143475be	2312	Orehova vas
00050000-559d-3a1f-ddfb-86500ac6cd5d	2270	Ormož
00050000-559d-3a1f-f496-1e801089a39c	1316	Ortnek
00050000-559d-3a1f-d725-4b1c1b6d68c0	1337	Osilnica
00050000-559d-3a1f-d8c9-239cad13e58c	8222	Otočec
00050000-559d-3a1f-d2a6-8b05a241f9e8	2361	Ožbalt
00050000-559d-3a1f-bfaf-2a54ca8d0328	2231	Pernica
00050000-559d-3a1f-e749-1f51caa7f379	2211	Pesnica pri Mariboru
00050000-559d-3a1f-de0f-7a7ddcfc8fbb	9203	Petrovci
00050000-559d-3a1f-25a3-c8ed797f72e7	3301	Petrovče
00050000-559d-3a1f-eac5-e18c79c56e46	6330	Piran/Pirano
00050000-559d-3a1f-0b1d-f520477392ee	8255	Pišece
00050000-559d-3a1f-e8f0-3bcfcd912242	6257	Pivka
00050000-559d-3a1f-75b9-a5e24a6329aa	6232	Planina
00050000-559d-3a1f-9fff-136df2daedb4	3225	Planina pri Sevnici
00050000-559d-3a1f-a707-1a5c132418c6	6276	Pobegi
00050000-559d-3a1f-c5a8-bdf5963788bc	8312	Podbočje
00050000-559d-3a1f-9371-efb37f91e34d	5243	Podbrdo
00050000-559d-3a1f-5acb-0667edde0fce	3254	Podčetrtek
00050000-559d-3a1f-c48c-f92e5f515b90	2273	Podgorci
00050000-559d-3a1f-e822-6c9dd43c6431	6216	Podgorje
00050000-559d-3a1f-e7cb-e7642293e47e	2381	Podgorje pri Slovenj Gradcu
00050000-559d-3a1f-d777-89a102d3b022	6244	Podgrad
00050000-559d-3a1f-d8e4-b09db03a0bbb	1414	Podkum
00050000-559d-3a1f-3ea8-398fafa4b482	2286	Podlehnik
00050000-559d-3a1f-1921-a06ad05c80e1	5272	Podnanos
00050000-559d-3a1f-e0e4-50f3cc4d0796	4244	Podnart
00050000-559d-3a1f-c216-1720d21eb8d4	3241	Podplat
00050000-559d-3a1f-dad8-39525347199b	3257	Podsreda
00050000-559d-3a1f-ffc9-4fc51065a2ca	2363	Podvelka
00050000-559d-3a1f-cd18-943e396a5181	2208	Pohorje
00050000-559d-3a1f-e3b5-ecc6be1debb7	2257	Polenšak
00050000-559d-3a1f-96fd-782746418dee	1355	Polhov Gradec
00050000-559d-3a1f-072a-f6f2cb588580	4223	Poljane nad Škofjo Loko
00050000-559d-3a1f-68ad-1f6889ab9833	2319	Poljčane
00050000-559d-3a1f-3d5e-bb5a7b6ec8d0	1272	Polšnik
00050000-559d-3a1f-e0af-8b08dbab8ffb	3313	Polzela
00050000-559d-3a1f-0e65-95ab4f7a3727	3232	Ponikva
00050000-559d-3a1f-9dc4-855557c7e742	6320	Portorož/Portorose
00050000-559d-3a1f-09f9-63994bf14589	6230	Postojna
00050000-559d-3a1f-7797-52eccd63e9f8	2331	Pragersko
00050000-559d-3a1f-99e4-a3439ef0fbce	3312	Prebold
00050000-559d-3a1f-ab78-05ee6b78c055	4205	Preddvor
00050000-559d-3a1f-6a1b-67815bf3e93c	6255	Prem
00050000-559d-3a1f-600d-b5d80562fbd1	1352	Preserje
00050000-559d-3a1f-174d-d24e8cb90efb	6258	Prestranek
00050000-559d-3a1f-6181-0fd0d53f641f	2391	Prevalje
00050000-559d-3a1f-c81f-9f4155548c4b	3262	Prevorje
00050000-559d-3a1f-fb1b-8caadb9025e2	1276	Primskovo 
00050000-559d-3a1f-91c4-a7b04f034dab	3253	Pristava pri Mestinju
00050000-559d-3a1f-1c5f-1e51806fea3c	9207	Prosenjakovci/Partosfalva
00050000-559d-3a1f-41e0-d4380dcf1960	5297	Prvačina
00050000-559d-3a1f-6cc1-2621b0e627c6	2250	Ptuj
00050000-559d-3a1f-0001-7ba5826a0b89	2323	Ptujska Gora
00050000-559d-3a1f-473d-ebde9042cb0a	9201	Puconci
00050000-559d-3a1f-a79d-1303cb948484	2327	Rače
00050000-559d-3a1f-3ec4-19ca124aa71a	1433	Radeče
00050000-559d-3a1f-34fc-8476d782a435	9252	Radenci
00050000-559d-3a1f-8063-88e9d9b260e2	2360	Radlje ob Dravi
00050000-559d-3a1f-ca07-c58e503c42ff	1235	Radomlje
00050000-559d-3a1f-a730-de5d4830b91b	4240	Radovljica
00050000-559d-3a1f-5aad-7c1490d22a9b	8274	Raka
00050000-559d-3a1f-5854-019bdcef45e5	1381	Rakek
00050000-559d-3a1f-90c9-d7049a156c5c	4283	Rateče - Planica
00050000-559d-3a1f-8c58-1627adee56ed	2390	Ravne na Koroškem
00050000-559d-3a1f-e7af-2bac53253580	9246	Razkrižje
00050000-559d-3a1f-fad7-87895aac35c7	3332	Rečica ob Savinji
00050000-559d-3a1f-ce57-cded7c29597e	5292	Renče
00050000-559d-3a1f-6ed5-f2ab1a2445e3	1310	Ribnica
00050000-559d-3a1f-fbf2-3dc22c1956a8	2364	Ribnica na Pohorju
00050000-559d-3a1f-8434-1c227c01a39b	3272	Rimske Toplice
00050000-559d-3a1f-ce2d-3a5f0e679651	1314	Rob
00050000-559d-3a1f-e265-0bd72f3cf466	5215	Ročinj
00050000-559d-3a1f-4930-60d140373357	3250	Rogaška Slatina
00050000-559d-3a1f-19a0-ffcf348b3a83	9262	Rogašovci
00050000-559d-3a1f-d1ec-56d89f241d01	3252	Rogatec
00050000-559d-3a1f-fb6d-e9cafc76c06d	1373	Rovte
00050000-559d-3a1f-3920-b688cbb653d4	2342	Ruše
00050000-559d-3a1f-5a4f-92be25c13bcb	1282	Sava
00050000-559d-3a1f-de30-b9cb47661dc1	6333	Sečovlje/Sicciole
00050000-559d-3a1f-c8af-a2ccb610b9d7	4227	Selca
00050000-559d-3a1f-1932-b960d52e83f2	2352	Selnica ob Dravi
00050000-559d-3a1f-0a49-19269f9b620d	8333	Semič
00050000-559d-3a1f-e747-c1324a06d958	8281	Senovo
00050000-559d-3a1f-9b53-0d12e7986dea	6224	Senožeče
00050000-559d-3a1f-7a66-5e8b9140a754	8290	Sevnica
00050000-559d-3a1f-3a23-09336a2bcf76	6210	Sežana
00050000-559d-3a1f-22c8-055298dec4cb	2214	Sladki Vrh
00050000-559d-3a1f-9577-0dff06279557	5283	Slap ob Idrijci
00050000-559d-3a1f-0a02-5ea18f880fd6	2380	Slovenj Gradec
00050000-559d-3a1f-0035-e1057cf034ae	2310	Slovenska Bistrica
00050000-559d-3a1f-68f8-294b36ebbfd2	3210	Slovenske Konjice
00050000-559d-3a1f-fdf4-914704e407f5	1216	Smlednik
00050000-559d-3a1f-f920-e8f268ab42bf	5232	Soča
00050000-559d-3a1f-b6d8-c32587a450d9	1317	Sodražica
00050000-559d-3a1f-b6ff-ac92d5156d83	3335	Solčava
00050000-559d-3a1f-f4f0-7be5e72c4936	5250	Solkan
00050000-559d-3a1f-1f0d-60907ed318e1	4229	Sorica
00050000-559d-3a1f-6e51-8d562a387f64	4225	Sovodenj
00050000-559d-3a1f-bade-7199ccd8831d	5281	Spodnja Idrija
00050000-559d-3a1f-29c1-09a2f7b494f8	2241	Spodnji Duplek
00050000-559d-3a1f-db28-c94a646b4058	9245	Spodnji Ivanjci
00050000-559d-3a1f-85c8-28b6b7e30133	2277	Središče ob Dravi
00050000-559d-3a1f-d19b-bc296e01c035	4267	Srednja vas v Bohinju
00050000-559d-3a1f-e3aa-ac8a52fc2eb4	8256	Sromlje 
00050000-559d-3a1f-8cec-b077c53bba72	5224	Srpenica
00050000-559d-3a1f-347d-59ecee498efd	1242	Stahovica
00050000-559d-3a1f-ebbb-0ab62fe61ff0	1332	Stara Cerkev
00050000-559d-3a1f-9126-893f4b5bbeff	8342	Stari trg ob Kolpi
00050000-559d-3a1f-25a3-22b674c59ad7	1386	Stari trg pri Ložu
00050000-559d-3a1f-cf36-aae6a0cdce68	2205	Starše
00050000-559d-3a1f-096b-198f5ded7734	2289	Stoperce
00050000-559d-3a1f-bb71-e000d9bf9de5	8322	Stopiče
00050000-559d-3a1f-6c99-762648eb9109	3206	Stranice
00050000-559d-3a1f-d3fd-32f7e9fcb5df	8351	Straža
00050000-559d-3a1f-02ae-a21664f31770	1313	Struge
00050000-559d-3a1f-8c4d-2686d6b5ff10	8293	Studenec
00050000-559d-3a1f-c2d4-e6926e023ad1	8331	Suhor
00050000-559d-3a1f-41a7-9420c9425b2c	2233	Sv. Ana v Slovenskih goricah
00050000-559d-3a1f-a1f5-e731650aead2	2235	Sv. Trojica v Slovenskih goricah
00050000-559d-3a1f-d752-3e33b3f27783	2353	Sveti Duh na Ostrem Vrhu
00050000-559d-3a1f-181a-fd1ed0a3738e	9244	Sveti Jurij ob Ščavnici
00050000-559d-3a1f-4878-29896572b0c9	3264	Sveti Štefan
00050000-559d-3a1f-4d3b-025f1bea5d8d	2258	Sveti Tomaž
00050000-559d-3a1f-887b-bf7bba9a9249	9204	Šalovci
00050000-559d-3a1f-26c5-f96401a79adc	5261	Šempas
00050000-559d-3a1f-4a53-39f08e48b312	5290	Šempeter pri Gorici
00050000-559d-3a1f-5f05-dcf16421d22d	3311	Šempeter v Savinjski dolini
00050000-559d-3a1f-a105-f972e33c1ffc	4208	Šenčur
00050000-559d-3a1f-de24-7defda226092	2212	Šentilj v Slovenskih goricah
00050000-559d-3a1f-1207-74daeec5d95c	8297	Šentjanž
00050000-559d-3a1f-63bb-3f35fe4da88a	2373	Šentjanž pri Dravogradu
00050000-559d-3a1f-0f03-1cb7e20496ae	8310	Šentjernej
00050000-559d-3a1f-fd43-6201ec7bf95d	3230	Šentjur
00050000-559d-3a1f-9a9b-e6d59cd27372	3271	Šentrupert
00050000-559d-3a1f-6237-f13413cd797c	8232	Šentrupert
00050000-559d-3a1f-a718-11186ea1191e	1296	Šentvid pri Stični
00050000-559d-3a1f-e3ac-39a8af8e9798	8275	Škocjan
00050000-559d-3a1f-ace6-c2cc40970ef3	6281	Škofije
00050000-559d-3a1f-e65a-774108741f34	4220	Škofja Loka
00050000-559d-3a1f-bf8e-73d4ace0e236	3211	Škofja vas
00050000-559d-3a1f-0121-cb34d3303429	1291	Škofljica
00050000-559d-3a1f-b224-c1af7ac32dfb	6274	Šmarje
00050000-559d-3a1f-3700-abd8ca1b35cf	1293	Šmarje - Sap
00050000-559d-3a1f-db45-54c20cd6850a	3240	Šmarje pri Jelšah
00050000-559d-3a1f-891e-6dc6252b2555	8220	Šmarješke Toplice
00050000-559d-3a1f-5f5e-ed8b9a5fc17b	2315	Šmartno na Pohorju
00050000-559d-3a1f-eb2f-1d53fc1215d0	3341	Šmartno ob Dreti
00050000-559d-3a1f-fc16-7cae7f588f45	3327	Šmartno ob Paki
00050000-559d-3a1f-dfbb-f9fe34613465	1275	Šmartno pri Litiji
00050000-559d-3a1f-0e06-989323225f09	2383	Šmartno pri Slovenj Gradcu
00050000-559d-3a1f-f079-f94eb870b6c0	3201	Šmartno v Rožni dolini
00050000-559d-3a1f-6cb9-9f3abcaf0f88	3325	Šoštanj
00050000-559d-3a1f-d825-886fa46e33ed	6222	Štanjel
00050000-559d-3a1f-d519-3e87a1b6f186	3220	Štore
00050000-559d-3a1f-858f-af63b0269aba	3304	Tabor
00050000-559d-3a1f-e1de-c464e44cf275	3221	Teharje
00050000-559d-3a1f-0f7f-36d2407e5140	9251	Tišina
00050000-559d-3a1f-d5d8-4ce5d3726979	5220	Tolmin
00050000-559d-3a1f-a8a3-b0d02975b9ae	3326	Topolšica
00050000-559d-3a1f-a299-4638908de8af	2371	Trbonje
00050000-559d-3a1f-393b-1579d7a3d583	1420	Trbovlje
00050000-559d-3a1f-72c7-04c0c0e72c5a	8231	Trebelno 
00050000-559d-3a1f-8224-bb180c77586c	8210	Trebnje
00050000-559d-3a1f-83be-644c1ed0bdd3	5252	Trnovo pri Gorici
00050000-559d-3a1f-24d7-2a13fe26ad17	2254	Trnovska vas
00050000-559d-3a1f-2788-9e2682586455	1222	Trojane
00050000-559d-3a1f-a4bc-84a6488be258	1236	Trzin
00050000-559d-3a1f-922e-f0e4e2a99486	4290	Tržič
00050000-559d-3a1f-2d9d-10fee1609645	8295	Tržišče
00050000-559d-3a1f-c6ef-0cc1a2a727a3	1311	Turjak
00050000-559d-3a1f-12c0-8e7fc82e0dd8	9224	Turnišče
00050000-559d-3a1f-41f6-bc382d48d6fe	8323	Uršna sela
00050000-559d-3a1f-2bc6-a27edcf40bd1	1252	Vače
00050000-559d-3a1f-87ac-ba42da916d90	3320	Velenje 
00050000-559d-3a1f-2fc2-c6ce88e48c4b	3322	Velenje - poštni predali
00050000-559d-3a1f-dcb4-963704638ba8	8212	Velika Loka
00050000-559d-3a1f-dd2a-af8a2d681f6c	2274	Velika Nedelja
00050000-559d-3a1f-e5f9-2a7eccd6f6da	9225	Velika Polana
00050000-559d-3a1f-1d64-020e9bf29845	1315	Velike Lašče
00050000-559d-3a1f-07f8-74c3ec438c94	8213	Veliki Gaber
00050000-559d-3a1f-fff0-df8497646fcb	9241	Veržej
00050000-559d-3a1f-fe7d-88131ea0a29c	1312	Videm - Dobrepolje
00050000-559d-3a1f-a5bb-bce188975268	2284	Videm pri Ptuju
00050000-559d-3a1f-73f4-60ed8e3a2c2c	8344	Vinica
00050000-559d-3a1f-b2b7-fd6d41943b84	5271	Vipava
00050000-559d-3a1f-4d0c-8bb4ac13fc02	4212	Visoko
00050000-559d-3a1f-3913-58da3cd86565	1294	Višnja Gora
00050000-559d-3a1f-be47-ef431fa87ccf	3205	Vitanje
00050000-559d-3a1f-851d-46614382e1f4	2255	Vitomarci
00050000-559d-3a1f-64e3-cbb054a4a49d	1217	Vodice
00050000-559d-3a1f-1a8e-e0106131d002	3212	Vojnik\t
00050000-559d-3a1f-136c-d6429440016c	5293	Volčja Draga
00050000-559d-3a1f-45d0-6fccd3a7a64d	2232	Voličina
00050000-559d-3a1f-35b0-5d1c3fbc63a5	3305	Vransko
00050000-559d-3a1f-19b1-d0618994dbef	6217	Vremski Britof
00050000-559d-3a1f-aa74-862680b85aab	1360	Vrhnika
00050000-559d-3a1f-205c-9e64a8d1f6b5	2365	Vuhred
00050000-559d-3a1f-aea7-7b3cb87d22ca	2367	Vuzenica
00050000-559d-3a1f-9416-752d16389800	8292	Zabukovje 
00050000-559d-3a1f-3a99-41a54e39d33a	1410	Zagorje ob Savi
00050000-559d-3a1f-1451-e6ba1b1bad57	1303	Zagradec
00050000-559d-3a1f-2f87-5c490e245ba9	2283	Zavrč
00050000-559d-3a1f-78c0-a48058ad4da2	8272	Zdole 
00050000-559d-3a1f-b393-cd15119d35d4	4201	Zgornja Besnica
00050000-559d-3a1f-4d71-ba9d24496982	2242	Zgornja Korena
00050000-559d-3a1f-a371-48772609b6e1	2201	Zgornja Kungota
00050000-559d-3a1f-3bca-d014db36430f	2316	Zgornja Ložnica
00050000-559d-3a1f-6864-a94f50b9d797	2314	Zgornja Polskava
00050000-559d-3a1f-3c1e-f9033f611c61	2213	Zgornja Velka
00050000-559d-3a1f-adab-e17f0eb9c904	4247	Zgornje Gorje
00050000-559d-3a1f-8b6f-66f3d82abcf5	4206	Zgornje Jezersko
00050000-559d-3a1f-9be1-5288cb9df225	2285	Zgornji Leskovec
00050000-559d-3a1f-0441-6a7dfe4a1d80	1432	Zidani Most
00050000-559d-3a1f-c514-921a19954d58	3214	Zreče
00050000-559d-3a1f-d81d-ac4450b5abe5	4209	Žabnica
00050000-559d-3a1f-fc54-ce6ac33118f5	3310	Žalec
00050000-559d-3a1f-0124-623cea361c4b	4228	Železniki
00050000-559d-3a1f-b119-49beacacd8da	2287	Žetale
00050000-559d-3a1f-4bfe-08c871d6b9cc	4226	Žiri
00050000-559d-3a1f-962b-661d58bd1b6c	4274	Žirovnica
00050000-559d-3a1f-909e-ce3331b1d25a	8360	Žužemberk
\.


--
-- TOC entry 2880 (class 0 OID 9447164)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 9446975)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9447053)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9447176)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 9447482)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9447493)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559d-3a20-e6a0-f9b91abab1ae	00080000-559d-3a20-7e71-ac1bebfcc66b	0900	AK
00190000-559d-3a20-9a41-c78272ce57c2	00080000-559d-3a1f-74a9-dd927470449d	0987	A
00190000-559d-3a20-c3fd-838a82ec9bf2	00080000-559d-3a1f-f5d8-81bab18910e8	0989	A
00190000-559d-3a20-e0be-edca507ed4f9	00080000-559d-3a1f-b0b7-b7451ba064ec	0986	A
00190000-559d-3a20-a903-a87f80f79764	00080000-559d-3a1f-55ef-b2ebebf05baa	0984	A
00190000-559d-3a20-f4ee-5ac164ac93a8	00080000-559d-3a1f-f987-1f1e11d12070	0983	A
00190000-559d-3a20-977b-3660b7628e07	00080000-559d-3a1f-f75f-a6321ffffbd6	0982	A
\.


--
-- TOC entry 2904 (class 0 OID 9447463)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-559d-3a20-1474-bb85ff50da49	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2849 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 9447205)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559d-3a1f-2787-1e3071b98ffe	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559d-3a1f-592f-1b849515b5b7	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559d-3a1f-aa93-2c96ec57ef6a	0003	Kazinska	t	84	Kazinska dvorana
00220000-559d-3a1f-224a-725f88489a6b	0004	Mali oder	t	24	Mali oder 
00220000-559d-3a1f-0059-85dde58240c1	0005	Komorni oder	t	15	Komorni oder
00220000-559d-3a20-8a4e-502f9b83a881	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559d-3a20-47af-319d6fb2bf22	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2878 (class 0 OID 9447149)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9447139)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 9447323)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9447273)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 9446847)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2887 (class 0 OID 9447215)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9446885)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559d-3a1e-4e8b-5301f4e64fd0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559d-3a1e-9b74-99dac4df5310	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559d-3a1e-65eb-9de429b231ab	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559d-3a1e-5c07-815dedd51caa	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559d-3a1e-5261-ab7443c2d939	planer	Planer dogodkov v koledarju	t
00020000-559d-3a1e-2644-0225410ae643	kadrovska	Kadrovska služba	t
00020000-559d-3a1e-59c0-2bd7bf1d13b9	arhivar	Ažuriranje arhivalij	t
00020000-559d-3a1e-a951-18d0f9f90b29	igralec	Igralec	t
00020000-559d-3a1e-6609-198a33ef0639	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559d-3a20-d0f9-6fa7dcde655e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2853 (class 0 OID 9446869)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559d-3a1e-6aca-411659e9115b	00020000-559d-3a1e-65eb-9de429b231ab
00010000-559d-3a1e-1d77-84fa5da088e2	00020000-559d-3a1e-65eb-9de429b231ab
00010000-559d-3a20-b318-eac60dae20dd	00020000-559d-3a20-d0f9-6fa7dcde655e
\.


--
-- TOC entry 2889 (class 0 OID 9447229)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 9447170)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 9447120)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 9447532)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559d-3a1f-bc4e-e4f77dd968d6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559d-3a1f-d155-4dabdfe3a57f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559d-3a1f-5337-a9cdba2841ea	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559d-3a1f-d2d9-6af2b95fbe14	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559d-3a1f-309f-2bf0b29e322a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2910 (class 0 OID 9447524)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559d-3a1f-eab1-32e8239732f9	00230000-559d-3a1f-d2d9-6af2b95fbe14	popa
00240000-559d-3a1f-45bd-2040539b5302	00230000-559d-3a1f-d2d9-6af2b95fbe14	oseba
00240000-559d-3a1f-9151-64519e1720c7	00230000-559d-3a1f-d155-4dabdfe3a57f	prostor
00240000-559d-3a1f-6cb2-9fd025107f17	00230000-559d-3a1f-d2d9-6af2b95fbe14	besedilo
00240000-559d-3a1f-30bd-0d1f9dd97265	00230000-559d-3a1f-d2d9-6af2b95fbe14	uprizoritev
00240000-559d-3a1f-b8bb-95b080f21efb	00230000-559d-3a1f-d2d9-6af2b95fbe14	funkcija
00240000-559d-3a1f-10f6-a6f111fa1bfe	00230000-559d-3a1f-d2d9-6af2b95fbe14	tipfunkcije
00240000-559d-3a1f-03fa-99f25ed5d58e	00230000-559d-3a1f-d2d9-6af2b95fbe14	alternacija
00240000-559d-3a1f-8702-4b9d076b3b55	00230000-559d-3a1f-bc4e-e4f77dd968d6	pogodba
00240000-559d-3a1f-675a-cae6664b176a	00230000-559d-3a1f-d2d9-6af2b95fbe14	zaposlitev
00240000-559d-3a1f-9e4d-08972d3853be	00230000-559d-3a1f-bc4e-e4f77dd968d6	programdela
\.


--
-- TOC entry 2909 (class 0 OID 9447519)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9447283)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559d-3a20-cf22-dc8635d5e175	000e0000-559d-3a20-4d13-390360c42eb2	00080000-559d-3a1f-1ad1-49e3a41dbb33	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559d-3a20-4b69-a8243adc5405	000e0000-559d-3a20-4d13-390360c42eb2	00080000-559d-3a1f-1ad1-49e3a41dbb33	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559d-3a20-aac8-5583b70365eb	000e0000-559d-3a20-4d13-390360c42eb2	00080000-559d-3a1f-8ce5-ca9fa7eb94a3	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2860 (class 0 OID 9446947)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9447126)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559d-3a20-ae37-8e2ecb51902a	00180000-559d-3a20-8406-07c745c90814	000c0000-559d-3a20-e06f-1db33024949e	00090000-559d-3a20-2620-712084086c30	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-3a20-36f6-014277b8ab14	00180000-559d-3a20-8406-07c745c90814	000c0000-559d-3a20-c3bc-8f845a8ae347	00090000-559d-3a20-a39a-2c90a5822a7f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-3a20-8844-4c5ba169e31c	00180000-559d-3a20-8406-07c745c90814	000c0000-559d-3a20-5f46-f4499a3a79c4	00090000-559d-3a20-53dd-66c124a4d20c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-3a20-3e35-93739d1a4b6a	00180000-559d-3a20-8406-07c745c90814	000c0000-559d-3a20-7c06-65de8c4a417c	00090000-559d-3a20-76a3-b75bd8814031	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-3a20-3235-036a17e1319e	00180000-559d-3a20-8406-07c745c90814	000c0000-559d-3a20-9a35-8ac4035c93ae	00090000-559d-3a20-b5c4-ebd36de4b445	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-3a20-fc45-8272ce4b2aaf	00180000-559d-3a20-47e9-a3c87e0448e8	\N	00090000-559d-3a20-b5c4-ebd36de4b445	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2896 (class 0 OID 9447312)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559d-3a1f-1d63-ec2a4ab17d8d	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559d-3a1f-a555-a98b2cf9b1f7	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559d-3a1f-8989-122bf9a5e4d1	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559d-3a1f-a5ff-4d8d3b5a379c	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559d-3a1f-ceca-8a68cbff1594	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559d-3a1f-1cac-5bbd1241322b	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559d-3a1f-92b3-cdbb2079629a	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559d-3a1f-8d56-73a4a87aa834	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559d-3a1f-425c-1f83e3c7e90e	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559d-3a1f-7023-b8bbd4e8cab9	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559d-3a1f-93aa-784b8f566b05	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559d-3a1f-c0a9-3691cc229e53	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559d-3a1f-9362-f7fdb8d35a1f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559d-3a1f-ccf0-88f525044d6c	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559d-3a1f-193e-722f7e42c32b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559d-3a1f-157e-7b06f9c1264d	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2907 (class 0 OID 9447501)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559d-3a1f-ec3d-adc597f240a2	01	Velika predstava	f	1.00	1.00
002b0000-559d-3a1f-0505-a7677c85377a	02	Mala predstava	f	0.50	0.50
002b0000-559d-3a1f-6427-c3aabc268f28	03	Mala koprodukcija	t	0.40	1.00
002b0000-559d-3a1f-69e1-839c3e3f7ed4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559d-3a1f-0b43-114366c8154d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2865 (class 0 OID 9447010)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9446856)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559d-3a1e-1d77-84fa5da088e2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO..N2z0vDzpEOtQs3GeA1VVgAsx/B5k6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559d-3a20-9d72-752818b0212a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559d-3a20-f4b1-0d48ccd56d24	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559d-3a20-a8ff-996ded2336a3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559d-3a20-5fe2-31b351df11f3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559d-3a20-cd98-8f339eb3fb3f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559d-3a20-be63-4b894867b387	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559d-3a20-9c9b-f11c158fdeb9	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559d-3a20-8641-0cf600fdb62e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559d-3a20-f0a3-593de994f86f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559d-3a20-b318-eac60dae20dd	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559d-3a1e-6aca-411659e9115b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 9447360)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559d-3a20-b76a-7dfa124e81e4	00160000-559d-3a1f-79fc-18d0297bd040	00150000-559d-3a1f-7f97-97ba5ec4bf11	00140000-559d-3a1e-3c80-6a6d204646ce	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559d-3a1f-0059-85dde58240c1
000e0000-559d-3a20-4d13-390360c42eb2	00160000-559d-3a1f-6cde-067b824da16f	00150000-559d-3a1f-88d4-a5caa8d89afc	00140000-559d-3a1e-c992-ad7529781ce1	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559d-3a20-8a4e-502f9b83a881
000e0000-559d-3a20-8af1-cd50e11d57cc	\N	00150000-559d-3a1f-88d4-a5caa8d89afc	00140000-559d-3a1e-c992-ad7529781ce1	00190000-559d-3a20-9a41-c78272ce57c2	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559d-3a1f-0059-85dde58240c1
000e0000-559d-3a20-d9a4-bab229b7db00	\N	00150000-559d-3a1f-88d4-a5caa8d89afc	00140000-559d-3a1e-c992-ad7529781ce1	00190000-559d-3a20-9a41-c78272ce57c2	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559d-3a1f-0059-85dde58240c1
000e0000-559d-3a20-87d4-3d8c38928260	\N	00150000-559d-3a1f-88d4-a5caa8d89afc	00140000-559d-3a1e-c992-ad7529781ce1	00190000-559d-3a20-9a41-c78272ce57c2	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559d-3a1f-2787-1e3071b98ffe
\.


--
-- TOC entry 2870 (class 0 OID 9447072)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559d-3a20-6c1b-4c5aa05abfdc	000e0000-559d-3a20-4d13-390360c42eb2	1	
00200000-559d-3a20-8dea-93e44a744e31	000e0000-559d-3a20-4d13-390360c42eb2	2	
\.


--
-- TOC entry 2885 (class 0 OID 9447197)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 9447266)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 9447104)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9447350)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559d-3a1e-3c80-6a6d204646ce	01	Drama	drama (SURS 01)
00140000-559d-3a1e-be5b-9a1cba8e40dd	02	Opera	opera (SURS 02)
00140000-559d-3a1e-fd93-a4ef6fc3f3fc	03	Balet	balet (SURS 03)
00140000-559d-3a1e-85b6-e54af51bf459	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559d-3a1e-11af-c48cadddbf1a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559d-3a1e-c992-ad7529781ce1	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559d-3a1e-253a-b6c15647fe5b	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2891 (class 0 OID 9447256)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559d-3a1f-246d-e4398f1e75b4	01	Opera	opera
00150000-559d-3a1f-aa31-73e1be7d6ece	02	Opereta	opereta
00150000-559d-3a1f-e42a-cd8c671fc87c	03	Balet	balet
00150000-559d-3a1f-2c91-2483ca40413b	04	Plesne prireditve	plesne prireditve
00150000-559d-3a1f-f30e-62374cde39f2	05	Lutkovno gledališče	lutkovno gledališče
00150000-559d-3a1f-eff7-ed480fab0046	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559d-3a1f-d644-6ea3630f28d2	07	Biografska drama	biografska drama
00150000-559d-3a1f-7f97-97ba5ec4bf11	08	Komedija	komedija
00150000-559d-3a1f-0935-07db63685b63	09	Črna komedija	črna komedija
00150000-559d-3a1f-1c24-cf55c6d864ff	10	E-igra	E-igra
00150000-559d-3a1f-88d4-a5caa8d89afc	11	Kriminalka	kriminalka
00150000-559d-3a1f-a4e9-70913c8c5401	12	Musical	musical
\.


--
-- TOC entry 2444 (class 2606 OID 9446910)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 9447407)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 9447397)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 9447311)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 9447094)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 9447119)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 9447517)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 9447036)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 9447458)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 9447252)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 9447070)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 9447113)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 9447050)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 9447162)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 9447189)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 9447008)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 9446919)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2451 (class 2606 OID 9446943)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 9446899)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2435 (class 2606 OID 9446884)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 9447195)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 9447228)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 9447345)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 9446972)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 9446996)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 9447168)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 9446986)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 9447057)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 9447180)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 9447490)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 9447498)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 9447480)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 9447212)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 9447153)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 9447144)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 9447333)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 9447280)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 9446855)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 9447219)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 9446873)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2437 (class 2606 OID 9446893)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 9447237)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 9447175)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 9447125)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 9447541)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 9447529)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 9447523)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 9447293)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 9446952)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 9447135)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 9447322)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 9447511)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 9447021)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 9446868)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 9447376)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 9447079)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 9447203)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 9447271)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 9447108)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 9447358)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 9447264)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 1259 OID 9447101)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 9447294)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 9447295)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2458 (class 1259 OID 9446974)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2405 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2406 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2407 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2549 (class 1259 OID 9447196)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2543 (class 1259 OID 9447182)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 9447181)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2495 (class 1259 OID 9447080)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2571 (class 1259 OID 9447253)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9447255)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2573 (class 1259 OID 9447254)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 9447052)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 9447051)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2594 (class 1259 OID 9447347)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 9447348)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 9447349)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2419 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2420 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2603 (class 1259 OID 9447381)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2604 (class 1259 OID 9447378)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2605 (class 1259 OID 9447382)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2606 (class 1259 OID 9447380)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2607 (class 1259 OID 9447379)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2473 (class 1259 OID 9447023)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2474 (class 1259 OID 9447022)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2410 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2411 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 9446946)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2559 (class 1259 OID 9447220)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2513 (class 1259 OID 9447114)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 9446900)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2440 (class 1259 OID 9446901)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2564 (class 1259 OID 9447240)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2565 (class 1259 OID 9447239)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2566 (class 1259 OID 9447238)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2487 (class 1259 OID 9447058)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 9447060)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2489 (class 1259 OID 9447059)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2646 (class 1259 OID 9447531)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2523 (class 1259 OID 9447148)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2524 (class 1259 OID 9447146)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2525 (class 1259 OID 9447145)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2526 (class 1259 OID 9447147)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2430 (class 1259 OID 9446874)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2431 (class 1259 OID 9446875)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2552 (class 1259 OID 9447204)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2538 (class 1259 OID 9447169)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2580 (class 1259 OID 9447281)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2581 (class 1259 OID 9447282)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 9447462)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2625 (class 1259 OID 9447459)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 9447460)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2627 (class 1259 OID 9447461)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2462 (class 1259 OID 9446988)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2463 (class 1259 OID 9446987)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2464 (class 1259 OID 9446989)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2423 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2631 (class 1259 OID 9447491)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2632 (class 1259 OID 9447492)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2617 (class 1259 OID 9447411)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 9447409)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 9447410)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2577 (class 1259 OID 9447272)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 9447157)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2530 (class 1259 OID 9447156)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2531 (class 1259 OID 9447154)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2532 (class 1259 OID 9447155)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2401 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2613 (class 1259 OID 9447399)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2614 (class 1259 OID 9447398)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2628 (class 1259 OID 9447481)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2494 (class 1259 OID 9447071)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2643 (class 1259 OID 9447518)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2445 (class 1259 OID 9446921)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2446 (class 1259 OID 9446920)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2454 (class 1259 OID 9446953)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 9446954)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2518 (class 1259 OID 9447138)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2519 (class 1259 OID 9447137)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2520 (class 1259 OID 9447136)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2415 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2416 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2501 (class 1259 OID 9447103)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2502 (class 1259 OID 9447099)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2503 (class 1259 OID 9447096)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2504 (class 1259 OID 9447097)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2505 (class 1259 OID 9447095)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2506 (class 1259 OID 9447100)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2507 (class 1259 OID 9447098)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2461 (class 1259 OID 9446973)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 9447037)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9447039)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2481 (class 1259 OID 9447038)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2482 (class 1259 OID 9447040)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2537 (class 1259 OID 9447163)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 9447346)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 9447377)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2452 (class 1259 OID 9446944)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9446945)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2574 (class 1259 OID 9447265)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 9447542)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 9447009)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 9447530)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2557 (class 1259 OID 9447214)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2558 (class 1259 OID 9447213)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 9447408)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 9447412)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2404 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2469 (class 1259 OID 9446997)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 9447359)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 9447499)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9447500)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 9446894)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2508 (class 1259 OID 9447102)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2678 (class 2606 OID 9447678)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2681 (class 2606 OID 9447663)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2680 (class 2606 OID 9447668)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2676 (class 2606 OID 9447688)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2682 (class 2606 OID 9447658)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2677 (class 2606 OID 9447683)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2679 (class 2606 OID 9447673)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2712 (class 2606 OID 9447833)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 9447838)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 9447593)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2699 (class 2606 OID 9447773)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2697 (class 2606 OID 9447768)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2698 (class 2606 OID 9447763)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2675 (class 2606 OID 9447653)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 9447803)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 9447813)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2706 (class 2606 OID 9447808)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2669 (class 2606 OID 9447628)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2670 (class 2606 OID 9447623)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2695 (class 2606 OID 9447753)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 9447843)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 9447848)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 9447853)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 9447873)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 9447858)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 9447878)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 9447868)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 9447863)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2667 (class 2606 OID 9447618)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2668 (class 2606 OID 9447613)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 9447578)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2660 (class 2606 OID 9447573)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2701 (class 2606 OID 9447783)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2683 (class 2606 OID 9447693)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2656 (class 2606 OID 9447553)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2655 (class 2606 OID 9447558)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2702 (class 2606 OID 9447798)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2703 (class 2606 OID 9447793)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2704 (class 2606 OID 9447788)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2673 (class 2606 OID 9447633)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2671 (class 2606 OID 9447643)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2672 (class 2606 OID 9447638)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2736 (class 2606 OID 9447958)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2687 (class 2606 OID 9447728)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2689 (class 2606 OID 9447718)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2690 (class 2606 OID 9447713)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2688 (class 2606 OID 9447723)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2654 (class 2606 OID 9447543)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2653 (class 2606 OID 9447548)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2700 (class 2606 OID 9447778)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2696 (class 2606 OID 9447758)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2710 (class 2606 OID 9447823)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2709 (class 2606 OID 9447828)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 9447928)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 9447913)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 9447918)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 9447923)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2665 (class 2606 OID 9447603)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 9447598)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9447608)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2733 (class 2606 OID 9447938)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2732 (class 2606 OID 9447943)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 9447903)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 9447908)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 9447893)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 9447898)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2708 (class 2606 OID 9447818)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 9447748)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2692 (class 2606 OID 9447743)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 9447733)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2693 (class 2606 OID 9447738)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 9447888)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 9447883)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 9447933)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2674 (class 2606 OID 9447648)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9447948)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 9447953)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2657 (class 2606 OID 9447568)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2658 (class 2606 OID 9447563)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2662 (class 2606 OID 9447583)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 9447588)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 9447708)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 9447703)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2686 (class 2606 OID 9447698)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-08 16:56:33 CEST

--
-- PostgreSQL database dump complete
--

