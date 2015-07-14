--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-14 12:13:48 CEST

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
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 10318268)
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
-- TOC entry 228 (class 1259 OID 10318767)
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
-- TOC entry 227 (class 1259 OID 10318750)
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
-- TOC entry 221 (class 1259 OID 10318662)
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
-- TOC entry 197 (class 1259 OID 10318447)
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
-- TOC entry 200 (class 1259 OID 10318481)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 10318880)
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
-- TOC entry 192 (class 1259 OID 10318390)
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
-- TOC entry 229 (class 1259 OID 10318780)
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
-- TOC entry 216 (class 1259 OID 10318607)
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
-- TOC entry 195 (class 1259 OID 10318427)
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
-- TOC entry 199 (class 1259 OID 10318475)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10318407)
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
-- TOC entry 205 (class 1259 OID 10318524)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 10318549)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10318364)
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
-- TOC entry 184 (class 1259 OID 10318277)
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
-- TOC entry 185 (class 1259 OID 10318288)
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
-- TOC entry 180 (class 1259 OID 10318242)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10318261)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10318556)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10318587)
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
-- TOC entry 224 (class 1259 OID 10318701)
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
-- TOC entry 187 (class 1259 OID 10318321)
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
-- TOC entry 189 (class 1259 OID 10318356)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10318530)
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
-- TOC entry 188 (class 1259 OID 10318341)
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
-- TOC entry 194 (class 1259 OID 10318419)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10318542)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10318850)
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
-- TOC entry 232 (class 1259 OID 10318861)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10318831)
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
-- TOC entry 212 (class 1259 OID 10318571)
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
-- TOC entry 204 (class 1259 OID 10318515)
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
-- TOC entry 203 (class 1259 OID 10318505)
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
-- TOC entry 223 (class 1259 OID 10318690)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10318639)
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
-- TOC entry 177 (class 1259 OID 10318213)
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
-- TOC entry 176 (class 1259 OID 10318211)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 10318581)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10318251)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10318235)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10318595)
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
-- TOC entry 207 (class 1259 OID 10318536)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10318486)
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
-- TOC entry 237 (class 1259 OID 10318900)
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
-- TOC entry 236 (class 1259 OID 10318892)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 10318887)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10318649)
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
-- TOC entry 186 (class 1259 OID 10318313)
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
-- TOC entry 202 (class 1259 OID 10318492)
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
-- TOC entry 222 (class 1259 OID 10318679)
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
-- TOC entry 233 (class 1259 OID 10318869)
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
-- TOC entry 191 (class 1259 OID 10318376)
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
-- TOC entry 178 (class 1259 OID 10318222)
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
-- TOC entry 226 (class 1259 OID 10318727)
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
-- TOC entry 196 (class 1259 OID 10318438)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10318563)
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
-- TOC entry 218 (class 1259 OID 10318632)
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
-- TOC entry 198 (class 1259 OID 10318470)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10318717)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10318622)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 10318216)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2859 (class 0 OID 10318268)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 10318767)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a4-e0db-fdc9-1182bff9d41c	000d0000-55a4-e0db-1293-fe316226091d	\N	00090000-55a4-e0db-8132-c5e9ecd57d41	000b0000-55a4-e0db-ed52-74fd8c448c1f	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55a4-e0db-f714-fac5b17028c5	000d0000-55a4-e0db-a4d0-eef563c6abe7	00100000-55a4-e0db-fbbc-ea5bd2d48847	00090000-55a4-e0db-f916-3686017e439c	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55a4-e0db-e778-1d272923fddc	000d0000-55a4-e0db-e5a6-96447389d53a	00100000-55a4-e0db-3a6e-b566f0bf43a3	00090000-55a4-e0db-49e4-eba77c854c5d	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55a4-e0db-f0e2-746ba07b2290	000d0000-55a4-e0db-33b9-97c7fc51134a	\N	00090000-55a4-e0db-c625-92d2764614b9	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a4-e0db-a2a6-fe48e162f700	000d0000-55a4-e0db-7a68-82cf4ab214c7	\N	00090000-55a4-e0db-54c0-50055f631146	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a4-e0db-283e-824dfc4280d2	000d0000-55a4-e0db-c724-f3b66d194cd9	\N	00090000-55a4-e0db-4c4a-3aac5f1a0f73	000b0000-55a4-e0db-e9e5-482794aa879b	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55a4-e0db-c369-4e960d185a98	000d0000-55a4-e0db-9551-b2e0aabe5233	00100000-55a4-e0db-f78b-4ff75e5b540e	00090000-55a4-e0db-b9cd-54b4aee18179	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55a4-e0db-ab7f-ccdae14fde70	000d0000-55a4-e0db-dc17-dcf85c31cfe5	\N	00090000-55a4-e0db-1f58-ba6cda198aa8	000b0000-55a4-e0db-e046-528b4a88043a	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2903 (class 0 OID 10318750)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 10318662)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a4-e0db-3df7-2c91334dcb5f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a4-e0db-723c-afc6d7c46013	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a4-e0db-cbde-c90182919c75	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 10318447)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a4-e0db-b510-aa2c5c969c51	\N	\N	00200000-55a4-e0db-dd73-2f8a19c2b687	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a4-e0db-ddb0-ac3fe72fdc37	\N	\N	00200000-55a4-e0db-fb09-ac23a0f28d2f	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a4-e0db-8155-7d5a37d2a800	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a4-e0db-66a7-0735fefb5e39	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a4-e0db-e9fa-e01b75b24598	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2876 (class 0 OID 10318481)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 10318880)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 10318390)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a4-e0da-174b-650bbfcc0ad4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a4-e0da-7f34-5c512cc54cd8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a4-e0da-0a44-dac5f1690783	AL	ALB	008	Albania 	Albanija	\N
00040000-55a4-e0da-6f9a-f2a94544a1de	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a4-e0da-ad9e-488e30c53776	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a4-e0da-4d67-8b9de7a71df1	AD	AND	020	Andorra 	Andora	\N
00040000-55a4-e0da-f09b-fff68a19b474	AO	AGO	024	Angola 	Angola	\N
00040000-55a4-e0da-f861-0fe55f7d3758	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a4-e0da-1a4d-22bfb55beb2f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a4-e0da-0311-eb823bcbb9a2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a4-e0da-bfbe-edadffec4ff0	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a4-e0da-b6e2-b49a83e1da5a	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a4-e0da-0b7c-0c6ccf10ede3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a4-e0da-fbb6-36f531b94d7e	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a4-e0da-8622-bd7702d60fbf	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a4-e0da-344e-aa367e7cf079	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a4-e0da-7898-60365acde609	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a4-e0da-3ec5-93de222dfd60	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a4-e0da-b3a6-f757265f192c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a4-e0da-44fb-47a5f510c0e0	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a4-e0da-3bd5-86cb4b660218	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a4-e0da-abc8-007cd7f13a3d	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a4-e0da-85ea-c8ace18872a0	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a4-e0da-2c48-f5cec6873502	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a4-e0da-175f-82e00317aadf	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a4-e0da-9f82-682f36f5cc74	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a4-e0da-2075-e84b9be3d369	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a4-e0da-8b82-c65213914abf	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a4-e0da-930c-e1b0956781f5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a4-e0da-d81f-548a6d60cba4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a4-e0da-d7e0-48b18791043a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a4-e0da-d3a9-c1f27ecbb0d7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a4-e0da-277c-2b04f49a3968	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a4-e0da-6f45-386a77a083e3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a4-e0da-fc5c-046cc7fa65b5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a4-e0da-e6ec-6deeeaefe3fd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a4-e0da-94ec-4913b0a7bf70	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a4-e0da-6f29-065f07ab126c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a4-e0da-ef8a-5bead793d4d8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a4-e0da-e927-583f9339d884	CA	CAN	124	Canada 	Kanada	\N
00040000-55a4-e0da-ee04-03d2f95cc824	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a4-e0da-8dd2-d67a2e471555	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a4-e0da-95fc-196d1c204a59	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a4-e0da-a818-874577b966c1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a4-e0da-8cc0-e976124500de	CL	CHL	152	Chile 	Čile	\N
00040000-55a4-e0da-38a9-294f503e2fa8	CN	CHN	156	China 	Kitajska	\N
00040000-55a4-e0da-8ab2-1311d23d8318	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a4-e0da-901d-fe74f96d647f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a4-e0da-746a-255e66c9595d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a4-e0da-ca6b-865fe694c7e2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a4-e0da-9884-194b13feba94	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a4-e0da-80f9-710fe67f989f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a4-e0da-3d0e-25490a4999e7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a4-e0da-21fd-d3665eb9acc3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a4-e0da-c278-6ce2f74d5b6a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a4-e0da-53dc-27e7ec2d5e41	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a4-e0da-e501-edd1fbfce892	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a4-e0da-9dc6-4061da091657	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a4-e0da-87d5-57055767f2f4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a4-e0da-0160-551b094595f5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a4-e0da-1ebb-ae54fa3d3b2e	DK	DNK	208	Denmark 	Danska	\N
00040000-55a4-e0da-b500-813faba8b997	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a4-e0da-a425-68222a4134dc	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a4-e0da-9787-628905379438	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a4-e0da-b143-2b61e755afec	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a4-e0da-371e-13b73829ee1e	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a4-e0da-e33e-5d155852f638	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a4-e0da-916b-ff14ea75c46d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a4-e0da-97cb-79f628482628	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a4-e0da-29db-d0b91909b8c2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a4-e0da-80fc-3e0cf0a7ca28	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a4-e0da-16a4-056cd51c7fbd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a4-e0da-1147-06f1c4750e19	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a4-e0da-4b5c-d7e383fc562e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a4-e0da-9ccf-89ef0b6018a8	FI	FIN	246	Finland 	Finska	\N
00040000-55a4-e0da-0e31-a444ee0be62b	FR	FRA	250	France 	Francija	\N
00040000-55a4-e0da-d008-c6e8f3a68e8f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a4-e0da-1e64-7ae287a9a2a0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a4-e0da-36f0-c78a9ab37640	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a4-e0da-cbc3-356419a202c1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a4-e0da-7ab3-e3f7761d1d49	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a4-e0da-fa77-a9884ca29553	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a4-e0da-8dac-d2d412829dd4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a4-e0da-9300-6b27504eb522	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a4-e0da-bc9c-bacb92e0e155	GH	GHA	288	Ghana 	Gana	\N
00040000-55a4-e0da-fdd2-7d2d0a707f54	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a4-e0da-a693-818c62605b28	GR	GRC	300	Greece 	Grčija	\N
00040000-55a4-e0da-ba8e-545fd86e7004	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a4-e0da-4f8a-7bd99063c4bb	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a4-e0da-e25f-06ce4266bd4a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a4-e0da-0111-dd3fd904ba27	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a4-e0da-caaa-a2e93fb6c000	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a4-e0da-8e31-a9c422a9b7ee	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a4-e0da-1e10-d6beaa375808	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a4-e0da-8e52-f167b0fa67f8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a4-e0da-a6ed-bb507acdc20c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a4-e0da-a00f-c6a6b9ed1c43	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a4-e0da-6f3f-07444e34dc26	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a4-e0da-87ab-093f64a5c9f5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a4-e0da-0abc-2eeb869ac92e	HN	HND	340	Honduras 	Honduras	\N
00040000-55a4-e0da-443a-aade155eefc2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a4-e0da-eefa-ef273abd10e3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a4-e0da-6498-618a25e888dc	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a4-e0da-9a09-762d07836515	IN	IND	356	India 	Indija	\N
00040000-55a4-e0da-b831-021e47ed340e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a4-e0da-07e7-05a1edc73e11	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a4-e0da-6574-47354075a57d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a4-e0da-99bb-860ffa33ea31	IE	IRL	372	Ireland 	Irska	\N
00040000-55a4-e0da-d590-3a6d30fbc6fe	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a4-e0da-ce3e-993c8101cb2f	IL	ISR	376	Israel 	Izrael	\N
00040000-55a4-e0da-4247-7e3eff4bb479	IT	ITA	380	Italy 	Italija	\N
00040000-55a4-e0da-90a7-859753669581	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a4-e0da-9b42-f8f46cae9ce8	JP	JPN	392	Japan 	Japonska	\N
00040000-55a4-e0da-5360-d7a8ca12d21e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a4-e0da-6c1b-3dd4f14f6a4c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a4-e0da-1429-2fa75ff47ed1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a4-e0da-d6a5-665e7475c118	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a4-e0da-0206-37d1ec4d3d72	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a4-e0da-3b6c-c9ecdf1bc1a1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a4-e0da-a9e4-27c625b5c415	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a4-e0da-4aa0-c031067ecc94	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a4-e0da-ec39-8e90c82032ae	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a4-e0da-9d75-6312c9f5ab51	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a4-e0da-0641-20f1cba9d09a	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a4-e0da-0887-b0ce6d28fccb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a4-e0da-c366-b9137ab29ca2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a4-e0da-67c2-e73da6561ff4	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a4-e0da-fe08-b234efffffee	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a4-e0da-a784-97b322087651	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a4-e0da-4364-dbbca5f509f3	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a4-e0da-70dc-0a9f4d6df7fb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a4-e0da-8da5-21a9ddbe8f52	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a4-e0da-fc72-b01d20599467	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a4-e0da-18fd-222becdf5652	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a4-e0da-7ecd-71f9f165730c	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a4-e0da-0112-76e5a38a4f7c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a4-e0da-d2cb-1dae473ac0d6	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a4-e0da-3122-c564827eb16f	ML	MLI	466	Mali 	Mali	\N
00040000-55a4-e0da-85a3-f8c19d987628	MT	MLT	470	Malta 	Malta	\N
00040000-55a4-e0da-27f2-0a33fe5ecc22	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a4-e0da-42e8-fe1fb12c4a5f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a4-e0da-2f33-0c76c31de1b4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a4-e0da-2bf2-65e14527faff	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a4-e0da-dbf6-fb578e606fd4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a4-e0da-39e7-3a15d8f0cbc5	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a4-e0da-2b35-1467191265ff	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a4-e0da-0542-c337f6e69938	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a4-e0da-8123-b4a18d6af3f1	MC	MCO	492	Monaco 	Monako	\N
00040000-55a4-e0da-95f4-882777735a24	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a4-e0da-da67-647c76d8922b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a4-e0da-9368-6934103ddcd8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a4-e0da-7d08-ad621bb73501	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a4-e0da-4d52-486f1720ca9e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a4-e0da-79e3-227efd41e48d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a4-e0da-4683-f0450b246b63	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a4-e0da-6078-a8a5d2d6ab28	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a4-e0da-8014-573ab4eaabbb	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a4-e0da-058f-46a05885dd52	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a4-e0da-9fe8-2fa650fe96b7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a4-e0da-916f-d3fc89cbff4c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a4-e0da-9858-803387edcc4d	NE	NER	562	Niger 	Niger 	\N
00040000-55a4-e0da-5619-680f7a42e822	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a4-e0da-98fb-e79d64e2aed3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a4-e0da-f452-e38d0cc50a42	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a4-e0da-1e73-7af22b80b68e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a4-e0da-ad41-edcc8080da7c	NO	NOR	578	Norway 	Norveška	\N
00040000-55a4-e0da-208e-3ad1d5792dbd	OM	OMN	512	Oman 	Oman	\N
00040000-55a4-e0da-79d1-abf4ab0ec335	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a4-e0da-d563-fe43295711e2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a4-e0da-b013-4779ccbc5cd7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a4-e0da-4c32-6ebe3044acfa	PA	PAN	591	Panama 	Panama	\N
00040000-55a4-e0da-87ce-5380e0361e40	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a4-e0da-54f3-c1c2aed97cda	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a4-e0da-bb83-f6d2531230b2	PE	PER	604	Peru 	Peru	\N
00040000-55a4-e0da-914c-9f09ab7f2197	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a4-e0da-9df0-dca63e36f06c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a4-e0da-32e6-ed0fc2331eb3	PL	POL	616	Poland 	Poljska	\N
00040000-55a4-e0da-367b-034d3ddeff56	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a4-e0da-eb30-0dee2a45b485	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a4-e0da-2cf7-d2563decdfc4	QA	QAT	634	Qatar 	Katar	\N
00040000-55a4-e0da-6b3f-4780e13a4a2a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a4-e0da-afef-64dd302be150	RO	ROU	642	Romania 	Romunija	\N
00040000-55a4-e0da-e593-01ca215297ea	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a4-e0da-9540-4f724957717d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a4-e0da-f414-7515d6fe764c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a4-e0da-0f26-cdd52029acad	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a4-e0da-4ef5-bb91d65b6056	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a4-e0da-fb29-95b4fc57fb82	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a4-e0da-d50f-73cdbb984b63	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a4-e0da-956c-09383ebc2684	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a4-e0da-0d9c-a0bec04f5252	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a4-e0da-22b3-ebf69e0e4c2d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a4-e0da-0418-ee7eeced2387	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a4-e0da-9236-c69f8c4867e1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a4-e0da-79e6-2a6c5e23c3d2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a4-e0da-1603-1be7dc972130	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a4-e0da-50b2-4238d3e0d09d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a4-e0da-4640-f2a7de43d8d0	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a4-e0da-a6fa-c6602fa1ab9a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a4-e0da-c1aa-7c53800e89c7	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a4-e0da-50e1-cbd8c2f1c6b2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a4-e0da-8b9f-11f5eb75cddf	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a4-e0da-9ec5-06376f84029a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a4-e0da-af84-7c62186fbfb2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a4-e0da-06b1-3d710eae6125	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a4-e0da-89d9-6f591764d196	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a4-e0da-2db8-244cf4faee59	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a4-e0da-15de-be854b817aaa	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a4-e0da-7563-b447fd6f3a5b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a4-e0da-280b-d278a392c17a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a4-e0da-b807-b68d0219b516	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a4-e0da-c4b5-e1ba43a7edd9	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a4-e0da-bfa0-07f8a82c95ec	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a4-e0da-0284-641f66b23a5b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a4-e0da-c77e-0424fd99a6f3	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a4-e0da-a75b-30546a3a82f9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a4-e0da-4db5-a4babc0bb3a7	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a4-e0da-8059-955da52ca9da	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a4-e0da-3202-ce1f4e4a761d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a4-e0da-a00f-38a8694e9a8f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a4-e0da-2383-3313a8143616	TH	THA	764	Thailand 	Tajska	\N
00040000-55a4-e0da-6116-a11fad3e9354	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a4-e0da-e286-4ce60fb63ca4	TG	TGO	768	Togo 	Togo	\N
00040000-55a4-e0da-48ca-097cc40faffd	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a4-e0da-a3bd-b17c0d4ff06a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a4-e0da-8e81-57bdf98801d9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a4-e0da-2c92-a7c6b36a05e5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a4-e0da-0d5d-3209683aa628	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a4-e0da-3f96-0bb11c08857c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a4-e0da-12cc-3deb1ed58564	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a4-e0da-5de1-596f450d0645	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a4-e0da-ed18-d22b58b590b6	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a4-e0da-6bcd-ebd2b2c23f18	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a4-e0da-4c7b-a81c1133877f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a4-e0da-917d-c35b058857f2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a4-e0da-d064-31ce246f8df3	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a4-e0da-af1f-961326df33b1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a4-e0da-7812-3520fd0ef728	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a4-e0da-7244-f2ca0cb7b312	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a4-e0da-627e-eaaf1c37d3af	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a4-e0da-9335-ae31e6320fd2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a4-e0da-0d29-805595c72adc	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a4-e0da-7bb4-e14830e17a40	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a4-e0da-3d6a-7a3c8c210bdb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a4-e0da-a76c-d5c8abd49a1e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a4-e0da-28ab-f94ef144e485	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a4-e0da-8ea9-7ce565db1479	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a4-e0da-2b7e-d43ae78f97fa	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a4-e0da-7066-e3d6915a1ce2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2905 (class 0 OID 10318780)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a4-e0db-d08c-7314fbfc33d3	000e0000-55a4-e0db-561d-e67b1d9f9b05	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-55a4-e0da-fc65-5d5b0212f5df	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a4-e0db-69ca-f6f2cc72f8ff	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a4-e0da-63be-333f2590c479	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 10318607)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a4-e0db-9551-b2e0aabe5233	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a4-e0da-ed52-4bfdbbff7f85
000d0000-55a4-e0db-1293-fe316226091d	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a4-e0da-ed52-4bfdbbff7f85
000d0000-55a4-e0db-a4d0-eef563c6abe7	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a4-e0da-2b2c-1a4ed1b6e14f
000d0000-55a4-e0db-e5a6-96447389d53a	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a4-e0da-acf0-399c448af72b
000d0000-55a4-e0db-33b9-97c7fc51134a	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a4-e0da-acf0-399c448af72b
000d0000-55a4-e0db-7a68-82cf4ab214c7	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a4-e0da-acf0-399c448af72b
000d0000-55a4-e0db-c724-f3b66d194cd9	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a4-e0da-ed52-4bfdbbff7f85
000d0000-55a4-e0db-dc17-dcf85c31cfe5	000e0000-55a4-e0db-c272-fc1af11cdcc2	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a4-e0da-5ce5-19d78fc24762
\.


--
-- TOC entry 2871 (class 0 OID 10318427)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 10318475)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 10318407)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a4-e0db-f496-06e5bc518e1b	00080000-55a4-e0db-38a4-10b922cae7c3	00090000-55a4-e0db-86b5-9af87a97fb84	AK		
\.


--
-- TOC entry 2846 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 10318524)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 10318549)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 10318364)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a4-e0da-50b7-bf24950a48f9	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a4-e0da-d95d-31610c19434e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a4-e0da-1bd8-6742ccb40ae5	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a4-e0da-4ce8-8dbe9a50bc5f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a4-e0da-6594-8a9b06046fae	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a4-e0da-445e-2f9ca6a342b4	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a4-e0da-6894-e20a6c7c73e3	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a4-e0da-2c28-92b151f33a08	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a4-e0da-fdbe-d480de0347cf	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a4-e0da-4083-97ee42dd63f0	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a4-e0da-3537-9c3ac164511d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a4-e0da-f02d-b0ff7509de74	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a4-e0da-c184-c1f531c99728	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-55a4-e0db-98c2-2201b96ba09d	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a4-e0db-b3d9-d3b634026ca7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a4-e0db-5637-fbdd267836c7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a4-e0db-1ae8-8b8962b56178	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a4-e0db-0af8-4a4f9b54ff68	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a4-e0db-5fe7-90d32777170c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2860 (class 0 OID 10318277)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a4-e0db-f8a6-5ff9b54db9a1	00000000-55a4-e0db-b3d9-d3b634026ca7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a4-e0db-9551-c4ea1b1a7693	00000000-55a4-e0db-b3d9-d3b634026ca7	00010000-55a4-e0da-8703-df0a265df739	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a4-e0db-99df-a2e92662395e	00000000-55a4-e0db-5637-fbdd267836c7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2861 (class 0 OID 10318288)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a4-e0db-8132-c5e9ecd57d41	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a4-e0db-c625-92d2764614b9	00010000-55a4-e0db-f046-c19c1845165d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a4-e0db-49e4-eba77c854c5d	00010000-55a4-e0db-4a7e-e191fc1c9891	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a4-e0db-ad46-bc06776b7b81	00010000-55a4-e0db-d1d4-7c13d2149c03	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a4-e0db-2fd9-90c15cd99fb6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a4-e0db-4c4a-3aac5f1a0f73	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a4-e0db-db32-21464092e8f1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a4-e0db-b9cd-54b4aee18179	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a4-e0db-86b5-9af87a97fb84	00010000-55a4-e0db-2109-50a7799c5ccc	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a4-e0db-f916-3686017e439c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a4-e0db-db3d-a08504ac2523	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a4-e0db-54c0-50055f631146	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a4-e0db-1f58-ba6cda198aa8	00010000-55a4-e0db-5810-9de7c0347048	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2848 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 10318242)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a4-e0da-1a96-5822afbd2ecc	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a4-e0da-14fa-c5e849d2e4ff	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a4-e0da-f6c0-87d8cd50d888	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a4-e0da-11be-934100488193	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a4-e0da-029e-6e1008b2c6f4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a4-e0da-2801-ee7921d17337	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a4-e0da-e15b-061461814030	Abonma-read	Abonma - branje	f
00030000-55a4-e0da-53d9-36ddf08ec888	Abonma-write	Abonma - spreminjanje	f
00030000-55a4-e0da-ed6a-0ce1d43d9444	Alternacija-read	Alternacija - branje	f
00030000-55a4-e0da-b6df-7aa72b878185	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a4-e0da-cd3a-3f6cc906907c	Arhivalija-read	Arhivalija - branje	f
00030000-55a4-e0da-b2b4-f8665f9fbb61	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a4-e0da-2dc6-56f74d51e0f1	Besedilo-read	Besedilo - branje	f
00030000-55a4-e0da-9a85-333f22a0ea3a	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a4-e0da-6761-5947940c0f77	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a4-e0da-c385-aaeed0b72095	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a4-e0da-d057-16bc98a88ba1	Dogodek-read	Dogodek - branje	f
00030000-55a4-e0da-8190-0d8b75293e27	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a4-e0da-5eae-574c3561c60d	DrugiVir-read	DrugiVir - branje	f
00030000-55a4-e0da-ac95-37d029d2aafd	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a4-e0da-8f70-cb3932bc02e4	Drzava-read	Drzava - branje	f
00030000-55a4-e0da-f195-bb4bb10184a8	Drzava-write	Drzava - spreminjanje	f
00030000-55a4-e0da-8a01-fe035d5a3847	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a4-e0da-00c3-b26d02e21410	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a4-e0da-0317-9f3aa51b0cb1	Funkcija-read	Funkcija - branje	f
00030000-55a4-e0da-8578-fee61535e2c7	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a4-e0da-4758-0caf718feaaf	Gostovanje-read	Gostovanje - branje	f
00030000-55a4-e0da-f64f-1bc8e40ce53d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a4-e0da-d02b-eb81e2b506b1	Gostujoca-read	Gostujoca - branje	f
00030000-55a4-e0da-cb86-b282ad728c09	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a4-e0da-29a7-790e1bad7edc	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a4-e0da-48c0-1e90ddc9a589	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a4-e0da-3967-92577225fc6d	Kupec-read	Kupec - branje	f
00030000-55a4-e0da-cc8c-865edafa3f67	Kupec-write	Kupec - spreminjanje	f
00030000-55a4-e0da-f80b-6823e00a1eb8	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a4-e0da-e7d3-562e18e3e3b7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a4-e0da-23a5-7a15d31476cc	Option-read	Option - branje	f
00030000-55a4-e0da-139d-9826a1ccb35b	Option-write	Option - spreminjanje	f
00030000-55a4-e0da-c04d-dc35f15d697f	OptionValue-read	OptionValue - branje	f
00030000-55a4-e0da-0090-91409a087364	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a4-e0da-22f8-5ba390de5275	Oseba-read	Oseba - branje	f
00030000-55a4-e0da-4b23-0fef6f38f64f	Oseba-write	Oseba - spreminjanje	f
00030000-55a4-e0da-1264-cd74a07ec8b2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a4-e0da-05bf-91fd40be9aad	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a4-e0da-2eae-6b3f820c8497	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a4-e0da-06cf-b0ea33fc454a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a4-e0da-0b1e-62ad318ace56	Pogodba-read	Pogodba - branje	f
00030000-55a4-e0da-a9a0-38ed5ea69253	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a4-e0da-24f1-e50b57715ac5	Popa-read	Popa - branje	f
00030000-55a4-e0da-53ec-7e624298d660	Popa-write	Popa - spreminjanje	f
00030000-55a4-e0da-d579-a4615462e7c0	Posta-read	Posta - branje	f
00030000-55a4-e0da-b37d-7416b0649b73	Posta-write	Posta - spreminjanje	f
00030000-55a4-e0da-bdff-e22e67f977de	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a4-e0da-59f6-0b02855032f1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a4-e0da-0df0-c8e68d8c90b3	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a4-e0da-b997-d21e6e72b8d7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a4-e0da-9520-58e1779c63e0	Predstava-read	Predstava - branje	f
00030000-55a4-e0da-e675-faaabc3292c9	Predstava-write	Predstava - spreminjanje	f
00030000-55a4-e0da-4e95-dba4b61bb7a1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a4-e0da-d8bf-7f66d96bfcde	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a4-e0da-59bf-551e79209ed8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a4-e0da-5bf4-c68befaaf677	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a4-e0da-cc9f-a3d5de6f5c0c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a4-e0da-8efa-5f5f405477ed	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a4-e0da-b674-eac66ad0a143	ProgramDela-read	ProgramDela - branje	f
00030000-55a4-e0da-c22a-bf6d48ce0664	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a4-e0da-17c2-9716cdffbca4	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a4-e0da-ba9a-6328d0d4473f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a4-e0da-7703-c0a65089aba7	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a4-e0da-85b2-99e4ff6e1975	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a4-e0da-98b1-0464f81cdae8	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a4-e0da-ded6-d825b39f1b33	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a4-e0da-b5a5-bb1b5dc0fcac	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a4-e0da-a5a2-2bb42f9f0df3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a4-e0da-ff63-eb2a788b15ef	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a4-e0da-68a7-a58b8c734edb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a4-e0da-3a20-77af2d0403a6	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a4-e0da-8ac2-9db5c272e6e0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a4-e0da-3b91-4880db374de5	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a4-e0da-87c8-6c9d23e0a13e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a4-e0da-c847-65a8c6513563	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a4-e0da-c6a5-87c6f6b6971e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a4-e0da-68a1-63afc5f22bfa	Prostor-read	Prostor - branje	f
00030000-55a4-e0da-ea43-b0dff3d4f351	Prostor-write	Prostor - spreminjanje	f
00030000-55a4-e0da-63ff-b9baef1f6e08	Racun-read	Racun - branje	f
00030000-55a4-e0da-1b06-3505ce330242	Racun-write	Racun - spreminjanje	f
00030000-55a4-e0da-97cf-2327b8b2429e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a4-e0da-fdf8-097820bbd1f5	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a4-e0da-12d6-72a2bb9d3165	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a4-e0da-e437-f20e10d41d24	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a4-e0da-daa5-70969b16c4f9	Rekvizit-read	Rekvizit - branje	f
00030000-55a4-e0da-efd7-14caa4e96287	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a4-e0da-5371-02cf0c1b3182	Revizija-read	Revizija - branje	f
00030000-55a4-e0da-8e69-455047c05927	Revizija-write	Revizija - spreminjanje	f
00030000-55a4-e0da-e86b-a69e59b2b189	Rezervacija-read	Rezervacija - branje	f
00030000-55a4-e0da-d807-f47aff4c3c45	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a4-e0da-6093-cbc9bd30e83f	SedezniRed-read	SedezniRed - branje	f
00030000-55a4-e0da-c8d9-de8f567cb3d6	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a4-e0da-170f-ba9d5cc81a03	Sedez-read	Sedez - branje	f
00030000-55a4-e0da-e038-b0c7ef611fff	Sedez-write	Sedez - spreminjanje	f
00030000-55a4-e0da-eafe-b183a1feae88	Sezona-read	Sezona - branje	f
00030000-55a4-e0da-1c0e-115f2ced0c3d	Sezona-write	Sezona - spreminjanje	f
00030000-55a4-e0da-bc0d-42ea25ddb747	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a4-e0da-02fe-ac621e26111f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a4-e0da-773d-15aed3fac384	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a4-e0da-1ae0-abd2db9e22d7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a4-e0da-19cc-4fc5ea3d7807	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a4-e0da-9ad8-aa63e58d31d6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a4-e0da-a2d1-f7b5d201bd3f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a4-e0da-ae3f-1ef6a9ce9f39	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a4-e0da-5eac-a7b45db38328	Telefonska-read	Telefonska - branje	f
00030000-55a4-e0da-dff5-573a4ed26be0	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a4-e0da-d2db-a7f87fd56f2c	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a4-e0da-e0d8-98732fdec043	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a4-e0da-9319-29652a1e0822	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a4-e0da-8d1f-02517f802860	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a4-e0da-818c-96c8f4dabe41	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a4-e0da-f275-4058d25ce1f4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a4-e0da-bf0b-380628baa538	Trr-read	Trr - branje	f
00030000-55a4-e0da-e229-b0eb803c7fa0	Trr-write	Trr - spreminjanje	f
00030000-55a4-e0da-57a2-af8a6fa2680c	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a4-e0da-b584-6a780fc9f17d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a4-e0da-aee5-08fd5d404971	Vaja-read	Vaja - branje	f
00030000-55a4-e0da-bcf8-9518479c4e03	Vaja-write	Vaja - spreminjanje	f
00030000-55a4-e0da-bcfe-2a5ae7e8e705	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a4-e0da-9e41-fff28926414f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a4-e0da-12a3-b339510dd0cb	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a4-e0da-9e4b-cde68ecdd298	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a4-e0da-6c6c-d7dbc31d9fae	Zasedenost-read	Zasedenost - branje	f
00030000-55a4-e0da-b51a-983167345b38	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a4-e0da-15ed-9f8b1a4e2f14	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a4-e0da-d2bb-22aef18cbe52	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a4-e0da-3428-8e0be78115a9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a4-e0da-59c4-183e3303899f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2858 (class 0 OID 10318261)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a4-e0da-4199-00101a46bb6f	00030000-55a4-e0da-14fa-c5e849d2e4ff
00020000-55a4-e0da-b1ea-be1630b2727b	00030000-55a4-e0da-8f70-cb3932bc02e4
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-e15b-061461814030
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-53d9-36ddf08ec888
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-ed6a-0ce1d43d9444
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-b6df-7aa72b878185
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-cd3a-3f6cc906907c
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-d057-16bc98a88ba1
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-11be-934100488193
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-8190-0d8b75293e27
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-8f70-cb3932bc02e4
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-f195-bb4bb10184a8
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-0317-9f3aa51b0cb1
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-8578-fee61535e2c7
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-4758-0caf718feaaf
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-f64f-1bc8e40ce53d
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-d02b-eb81e2b506b1
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-cb86-b282ad728c09
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-29a7-790e1bad7edc
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-48c0-1e90ddc9a589
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-23a5-7a15d31476cc
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-c04d-dc35f15d697f
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-22f8-5ba390de5275
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-4b23-0fef6f38f64f
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-24f1-e50b57715ac5
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-53ec-7e624298d660
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-d579-a4615462e7c0
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-b37d-7416b0649b73
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-0df0-c8e68d8c90b3
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-b997-d21e6e72b8d7
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-9520-58e1779c63e0
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-e675-faaabc3292c9
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-cc9f-a3d5de6f5c0c
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-8efa-5f5f405477ed
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-68a1-63afc5f22bfa
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-ea43-b0dff3d4f351
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-12d6-72a2bb9d3165
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-e437-f20e10d41d24
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-daa5-70969b16c4f9
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-efd7-14caa4e96287
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-eafe-b183a1feae88
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-1c0e-115f2ced0c3d
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-9319-29652a1e0822
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-57a2-af8a6fa2680c
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-b584-6a780fc9f17d
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-aee5-08fd5d404971
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-bcf8-9518479c4e03
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-6c6c-d7dbc31d9fae
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-b51a-983167345b38
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-15ed-9f8b1a4e2f14
00020000-55a4-e0da-483f-921503d2ec09	00030000-55a4-e0da-3428-8e0be78115a9
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-e15b-061461814030
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-cd3a-3f6cc906907c
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-d057-16bc98a88ba1
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-8f70-cb3932bc02e4
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-4758-0caf718feaaf
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-d02b-eb81e2b506b1
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-29a7-790e1bad7edc
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-48c0-1e90ddc9a589
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-23a5-7a15d31476cc
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-c04d-dc35f15d697f
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-22f8-5ba390de5275
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-4b23-0fef6f38f64f
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-24f1-e50b57715ac5
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-d579-a4615462e7c0
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-0df0-c8e68d8c90b3
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-b997-d21e6e72b8d7
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-9520-58e1779c63e0
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-68a1-63afc5f22bfa
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-12d6-72a2bb9d3165
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-daa5-70969b16c4f9
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-eafe-b183a1feae88
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-5eac-a7b45db38328
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-dff5-573a4ed26be0
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-bf0b-380628baa538
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-e229-b0eb803c7fa0
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-12a3-b339510dd0cb
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-9e4b-cde68ecdd298
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-15ed-9f8b1a4e2f14
00020000-55a4-e0da-ce7b-63cd83e4a3d6	00030000-55a4-e0da-3428-8e0be78115a9
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-e15b-061461814030
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-ed6a-0ce1d43d9444
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-cd3a-3f6cc906907c
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-b2b4-f8665f9fbb61
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-2dc6-56f74d51e0f1
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-6761-5947940c0f77
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-d057-16bc98a88ba1
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-8f70-cb3932bc02e4
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-0317-9f3aa51b0cb1
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-4758-0caf718feaaf
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-d02b-eb81e2b506b1
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-29a7-790e1bad7edc
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-23a5-7a15d31476cc
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-c04d-dc35f15d697f
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-22f8-5ba390de5275
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-24f1-e50b57715ac5
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-d579-a4615462e7c0
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-9520-58e1779c63e0
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-cc9f-a3d5de6f5c0c
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-68a1-63afc5f22bfa
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-12d6-72a2bb9d3165
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-daa5-70969b16c4f9
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-eafe-b183a1feae88
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-9319-29652a1e0822
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-aee5-08fd5d404971
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-6c6c-d7dbc31d9fae
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-15ed-9f8b1a4e2f14
00020000-55a4-e0da-caf6-d581f704ec16	00030000-55a4-e0da-3428-8e0be78115a9
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-e15b-061461814030
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-53d9-36ddf08ec888
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-b6df-7aa72b878185
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-cd3a-3f6cc906907c
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-d057-16bc98a88ba1
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-8f70-cb3932bc02e4
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-4758-0caf718feaaf
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-d02b-eb81e2b506b1
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-23a5-7a15d31476cc
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-c04d-dc35f15d697f
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-24f1-e50b57715ac5
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-d579-a4615462e7c0
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-9520-58e1779c63e0
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-68a1-63afc5f22bfa
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-12d6-72a2bb9d3165
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-daa5-70969b16c4f9
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-eafe-b183a1feae88
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-9319-29652a1e0822
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-15ed-9f8b1a4e2f14
00020000-55a4-e0da-d30f-5210a4ba1b7f	00030000-55a4-e0da-3428-8e0be78115a9
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-e15b-061461814030
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-cd3a-3f6cc906907c
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-d057-16bc98a88ba1
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-8f70-cb3932bc02e4
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-4758-0caf718feaaf
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-d02b-eb81e2b506b1
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-23a5-7a15d31476cc
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-c04d-dc35f15d697f
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-24f1-e50b57715ac5
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-d579-a4615462e7c0
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-9520-58e1779c63e0
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-68a1-63afc5f22bfa
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-12d6-72a2bb9d3165
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-daa5-70969b16c4f9
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-eafe-b183a1feae88
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-d2db-a7f87fd56f2c
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-f6c0-87d8cd50d888
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-9319-29652a1e0822
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-15ed-9f8b1a4e2f14
00020000-55a4-e0da-3a7f-aac8c22f4f8d	00030000-55a4-e0da-3428-8e0be78115a9
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-1a96-5822afbd2ecc
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-14fa-c5e849d2e4ff
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-f6c0-87d8cd50d888
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-11be-934100488193
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-029e-6e1008b2c6f4
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-2801-ee7921d17337
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-e15b-061461814030
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-53d9-36ddf08ec888
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-ed6a-0ce1d43d9444
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-b6df-7aa72b878185
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-cd3a-3f6cc906907c
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-b2b4-f8665f9fbb61
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-2dc6-56f74d51e0f1
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-9a85-333f22a0ea3a
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-6761-5947940c0f77
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-c385-aaeed0b72095
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-d057-16bc98a88ba1
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-8190-0d8b75293e27
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-8f70-cb3932bc02e4
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-f195-bb4bb10184a8
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-5eae-574c3561c60d
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-ac95-37d029d2aafd
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-8a01-fe035d5a3847
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-00c3-b26d02e21410
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-0317-9f3aa51b0cb1
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-8578-fee61535e2c7
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-4758-0caf718feaaf
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-f64f-1bc8e40ce53d
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-d02b-eb81e2b506b1
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-cb86-b282ad728c09
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-29a7-790e1bad7edc
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-48c0-1e90ddc9a589
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-3967-92577225fc6d
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-cc8c-865edafa3f67
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-f80b-6823e00a1eb8
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-e7d3-562e18e3e3b7
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-23a5-7a15d31476cc
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-139d-9826a1ccb35b
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-c04d-dc35f15d697f
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-0090-91409a087364
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-22f8-5ba390de5275
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-4b23-0fef6f38f64f
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-1264-cd74a07ec8b2
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-05bf-91fd40be9aad
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-2eae-6b3f820c8497
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-06cf-b0ea33fc454a
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-0b1e-62ad318ace56
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-a9a0-38ed5ea69253
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-24f1-e50b57715ac5
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-53ec-7e624298d660
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-d579-a4615462e7c0
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-b37d-7416b0649b73
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-bdff-e22e67f977de
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-59f6-0b02855032f1
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-0df0-c8e68d8c90b3
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-b997-d21e6e72b8d7
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-9520-58e1779c63e0
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-e675-faaabc3292c9
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-4e95-dba4b61bb7a1
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-d8bf-7f66d96bfcde
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-59bf-551e79209ed8
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-5bf4-c68befaaf677
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-cc9f-a3d5de6f5c0c
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-8efa-5f5f405477ed
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-b674-eac66ad0a143
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-c22a-bf6d48ce0664
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-17c2-9716cdffbca4
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-ba9a-6328d0d4473f
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-7703-c0a65089aba7
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-85b2-99e4ff6e1975
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-98b1-0464f81cdae8
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-ded6-d825b39f1b33
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-b5a5-bb1b5dc0fcac
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-a5a2-2bb42f9f0df3
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-ff63-eb2a788b15ef
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-68a7-a58b8c734edb
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-3a20-77af2d0403a6
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-8ac2-9db5c272e6e0
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-3b91-4880db374de5
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-87c8-6c9d23e0a13e
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-c847-65a8c6513563
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-c6a5-87c6f6b6971e
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-68a1-63afc5f22bfa
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-ea43-b0dff3d4f351
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-63ff-b9baef1f6e08
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-1b06-3505ce330242
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-97cf-2327b8b2429e
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-fdf8-097820bbd1f5
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-12d6-72a2bb9d3165
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-e437-f20e10d41d24
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-daa5-70969b16c4f9
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-efd7-14caa4e96287
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-5371-02cf0c1b3182
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-8e69-455047c05927
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-e86b-a69e59b2b189
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-d807-f47aff4c3c45
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-6093-cbc9bd30e83f
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-c8d9-de8f567cb3d6
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-170f-ba9d5cc81a03
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-e038-b0c7ef611fff
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-eafe-b183a1feae88
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-1c0e-115f2ced0c3d
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-bc0d-42ea25ddb747
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-02fe-ac621e26111f
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-773d-15aed3fac384
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-1ae0-abd2db9e22d7
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-19cc-4fc5ea3d7807
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-9ad8-aa63e58d31d6
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-a2d1-f7b5d201bd3f
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-ae3f-1ef6a9ce9f39
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-5eac-a7b45db38328
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-dff5-573a4ed26be0
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-d2db-a7f87fd56f2c
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-e0d8-98732fdec043
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-9319-29652a1e0822
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-8d1f-02517f802860
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-818c-96c8f4dabe41
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-f275-4058d25ce1f4
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-bf0b-380628baa538
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-e229-b0eb803c7fa0
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-57a2-af8a6fa2680c
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-b584-6a780fc9f17d
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-aee5-08fd5d404971
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-bcf8-9518479c4e03
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-bcfe-2a5ae7e8e705
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-9e41-fff28926414f
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-12a3-b339510dd0cb
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-9e4b-cde68ecdd298
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-6c6c-d7dbc31d9fae
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-b51a-983167345b38
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-15ed-9f8b1a4e2f14
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-d2bb-22aef18cbe52
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-3428-8e0be78115a9
00020000-55a4-e0db-f165-e6bc1675d541	00030000-55a4-e0da-59c4-183e3303899f
\.


--
-- TOC entry 2886 (class 0 OID 10318556)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 10318587)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 10318701)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-55a4-e0db-ed52-74fd8c448c1f	00090000-55a4-e0db-8132-c5e9ecd57d41	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-55a4-e0db-e9e5-482794aa879b	00090000-55a4-e0db-4c4a-3aac5f1a0f73	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-55a4-e0db-e046-528b4a88043a	00090000-55a4-e0db-1f58-ba6cda198aa8	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2863 (class 0 OID 10318321)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a4-e0db-38a4-10b922cae7c3	00040000-55a4-e0da-9ec5-06376f84029a	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a4-e0db-86f9-0fb8b812b30f	00040000-55a4-e0da-9ec5-06376f84029a	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a4-e0db-f687-860147615a3f	00040000-55a4-e0da-9ec5-06376f84029a	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a4-e0db-9265-933e530a0ebf	00040000-55a4-e0da-9ec5-06376f84029a	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a4-e0db-d0ee-252dc3b75929	00040000-55a4-e0da-9ec5-06376f84029a	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a4-e0db-4759-d864d53c0a7e	00040000-55a4-e0da-bfbe-edadffec4ff0	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a4-e0db-b462-edbd16f3a9af	00040000-55a4-e0da-53dc-27e7ec2d5e41	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a4-e0db-99ec-404616b1276f	00040000-55a4-e0da-8622-bd7702d60fbf	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a4-e0db-2de8-aeb1f727c0bc	00040000-55a4-e0da-9ec5-06376f84029a	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2865 (class 0 OID 10318356)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a4-e0da-0b86-45b0de47c361	8341	Adlešiči
00050000-55a4-e0da-b94a-c85f9388a4c7	5270	Ajdovščina
00050000-55a4-e0da-be8b-43e3dd840dfb	6280	Ankaran/Ancarano
00050000-55a4-e0da-22b3-3dc6df0ab458	9253	Apače
00050000-55a4-e0da-40df-3bdfb571d10b	8253	Artiče
00050000-55a4-e0da-fb7a-b8136723ef01	4275	Begunje na Gorenjskem
00050000-55a4-e0da-e290-672b20120422	1382	Begunje pri Cerknici
00050000-55a4-e0da-0d37-f41e0bcf90ed	9231	Beltinci
00050000-55a4-e0da-a39a-04c8a28ce7d6	2234	Benedikt
00050000-55a4-e0da-7242-9835e8ac8279	2345	Bistrica ob Dravi
00050000-55a4-e0da-b157-0ff8d066b90b	3256	Bistrica ob Sotli
00050000-55a4-e0da-3a8a-93723a71d898	8259	Bizeljsko
00050000-55a4-e0da-b561-b48cf214b9c5	1223	Blagovica
00050000-55a4-e0da-d3ad-e269ff91a939	8283	Blanca
00050000-55a4-e0da-c6a1-d3f78c98f0b2	4260	Bled
00050000-55a4-e0da-abef-d7eae977f761	4273	Blejska Dobrava
00050000-55a4-e0da-12ee-3d3e950c1784	9265	Bodonci
00050000-55a4-e0da-98e1-e59b8fc242af	9222	Bogojina
00050000-55a4-e0da-dc5b-e38a3ed47410	4263	Bohinjska Bela
00050000-55a4-e0da-0755-8c4a9259832d	4264	Bohinjska Bistrica
00050000-55a4-e0da-0dc4-d85b893a2dd2	4265	Bohinjsko jezero
00050000-55a4-e0da-dd9f-f7fa2bcd833a	1353	Borovnica
00050000-55a4-e0da-b54b-85daca61559c	8294	Boštanj
00050000-55a4-e0da-eb99-535fb2c09d70	5230	Bovec
00050000-55a4-e0da-5957-96b337204f8f	5295	Branik
00050000-55a4-e0da-3ce9-8ca6b0495431	3314	Braslovče
00050000-55a4-e0da-5324-44ca0e975e56	5223	Breginj
00050000-55a4-e0da-7179-db138e5bbc48	8280	Brestanica
00050000-55a4-e0da-0b90-3e7c6c711e40	2354	Bresternica
00050000-55a4-e0da-cccf-f56d332e8db4	4243	Brezje
00050000-55a4-e0da-3f16-914f0fbbbf4d	1351	Brezovica pri Ljubljani
00050000-55a4-e0da-cfa9-40db30030932	8250	Brežice
00050000-55a4-e0da-3cda-79c5e5f32cfd	4210	Brnik - Aerodrom
00050000-55a4-e0da-5c1b-ce57f65ea633	8321	Brusnice
00050000-55a4-e0da-c402-650730a3247a	3255	Buče
00050000-55a4-e0da-1765-545499d35e89	8276	Bučka 
00050000-55a4-e0da-c5e4-b4ef18f6e239	9261	Cankova
00050000-55a4-e0da-45c6-a1bb96c398cf	3000	Celje 
00050000-55a4-e0da-1fd5-35339716d487	3001	Celje - poštni predali
00050000-55a4-e0da-1d31-88405c63e40a	4207	Cerklje na Gorenjskem
00050000-55a4-e0da-5061-29a31edb8402	8263	Cerklje ob Krki
00050000-55a4-e0da-1d17-8c6cb6a5b07e	1380	Cerknica
00050000-55a4-e0da-1ade-3f51dbee4abd	5282	Cerkno
00050000-55a4-e0da-a109-77db16fcf314	2236	Cerkvenjak
00050000-55a4-e0da-68e1-4c7e516c3e56	2215	Ceršak
00050000-55a4-e0da-b9aa-8d3b4952d1ee	2326	Cirkovce
00050000-55a4-e0da-728f-6b93808f0051	2282	Cirkulane
00050000-55a4-e0da-9208-82fd5206e801	5273	Col
00050000-55a4-e0da-ee95-89db2819ce29	8251	Čatež ob Savi
00050000-55a4-e0da-6668-122f06561ba4	1413	Čemšenik
00050000-55a4-e0da-ae2b-3323d73f07c2	5253	Čepovan
00050000-55a4-e0da-acac-354eefccaa8e	9232	Črenšovci
00050000-55a4-e0da-2f82-b7c69db85fd2	2393	Črna na Koroškem
00050000-55a4-e0da-f483-bcc1a4818f47	6275	Črni Kal
00050000-55a4-e0da-fd27-cf2ec76af0f0	5274	Črni Vrh nad Idrijo
00050000-55a4-e0da-fcea-7d88bf5e8dde	5262	Črniče
00050000-55a4-e0da-d92a-4a83d2a3ff14	8340	Črnomelj
00050000-55a4-e0da-1083-f2d027111375	6271	Dekani
00050000-55a4-e0da-ee8c-95f3c85af959	5210	Deskle
00050000-55a4-e0da-4eeb-c36ae23478f5	2253	Destrnik
00050000-55a4-e0da-1adf-ece3cc8a245f	6215	Divača
00050000-55a4-e0da-84e4-d16d90ba6418	1233	Dob
00050000-55a4-e0da-9813-2bc036655f54	3224	Dobje pri Planini
00050000-55a4-e0da-74ac-fa45adcf9793	8257	Dobova
00050000-55a4-e0da-7d3c-15520c90e9d7	1423	Dobovec
00050000-55a4-e0da-8822-fd3678c7d3e9	5263	Dobravlje
00050000-55a4-e0da-eb48-f5bfaabe5c97	3204	Dobrna
00050000-55a4-e0da-0413-71270bf90fba	8211	Dobrnič
00050000-55a4-e0da-c9f4-f631ed0a78a9	1356	Dobrova
00050000-55a4-e0da-d1fe-0458536cdb71	9223	Dobrovnik/Dobronak 
00050000-55a4-e0da-f780-7e6154dbab77	5212	Dobrovo v Brdih
00050000-55a4-e0da-86ff-a304e7b2769f	1431	Dol pri Hrastniku
00050000-55a4-e0da-e1ce-539d4d6f3728	1262	Dol pri Ljubljani
00050000-55a4-e0da-002a-c295d60fd2d0	1273	Dole pri Litiji
00050000-55a4-e0da-b761-825efa9764b5	1331	Dolenja vas
00050000-55a4-e0da-9a5c-de1a3606bb4b	8350	Dolenjske Toplice
00050000-55a4-e0da-0d7f-a25db5a6f8df	1230	Domžale
00050000-55a4-e0da-5025-4420454001d6	2252	Dornava
00050000-55a4-e0da-2b0e-9f0ad0871232	5294	Dornberk
00050000-55a4-e0da-af92-79bdd280308f	1319	Draga
00050000-55a4-e0da-44de-c94922cc3e04	8343	Dragatuš
00050000-55a4-e0da-ffa7-f008d5903ba1	3222	Dramlje
00050000-55a4-e0da-9473-9132985618e6	2370	Dravograd
00050000-55a4-e0da-26e5-618456686e89	4203	Duplje
00050000-55a4-e0da-cc3c-10118227fa75	6221	Dutovlje
00050000-55a4-e0da-bd1f-d9daba6bbc39	8361	Dvor
00050000-55a4-e0da-5f14-92f8d7c617ec	2343	Fala
00050000-55a4-e0da-d59f-fa58ddf31532	9208	Fokovci
00050000-55a4-e0da-e068-ac03d8d87ee3	2313	Fram
00050000-55a4-e0da-6bbf-cdcebdc482b1	3213	Frankolovo
00050000-55a4-e0da-c260-14c7310f8f62	1274	Gabrovka
00050000-55a4-e0da-bd29-5f70d775890f	8254	Globoko
00050000-55a4-e0da-28a0-adef9c126bb8	5275	Godovič
00050000-55a4-e0da-fc59-b25aa1055b2c	4204	Golnik
00050000-55a4-e0da-772d-a83423cff8e7	3303	Gomilsko
00050000-55a4-e0da-0ebf-cb293314175e	4224	Gorenja vas
00050000-55a4-e0da-58da-2fff9a560108	3263	Gorica pri Slivnici
00050000-55a4-e0da-604a-a3500afeb885	2272	Gorišnica
00050000-55a4-e0da-45c0-d0078e4428f4	9250	Gornja Radgona
00050000-55a4-e0da-4904-bdc0caa0b70f	3342	Gornji Grad
00050000-55a4-e0da-b947-c72e26daee66	4282	Gozd Martuljek
00050000-55a4-e0da-7345-4fdd318b55d3	6272	Gračišče
00050000-55a4-e0da-5d1f-15056e8eb080	9264	Grad
00050000-55a4-e0da-0d80-4fd16356859f	8332	Gradac
00050000-55a4-e0da-2813-9f732e0e43ac	1384	Grahovo
00050000-55a4-e0da-bad8-6f651757fe9d	5242	Grahovo ob Bači
00050000-55a4-e0da-0cae-80549505ed7c	5251	Grgar
00050000-55a4-e0da-28c4-acdd5002308e	3302	Griže
00050000-55a4-e0da-917a-3744feb2ab27	3231	Grobelno
00050000-55a4-e0da-b9a6-d153b68fc076	1290	Grosuplje
00050000-55a4-e0da-6393-93348c7aa840	2288	Hajdina
00050000-55a4-e0da-3a09-689aa16afb98	8362	Hinje
00050000-55a4-e0da-5224-2e0229097819	2311	Hoče
00050000-55a4-e0da-9337-c25ca95e8ca9	9205	Hodoš/Hodos
00050000-55a4-e0da-fc7c-5f961649a82f	1354	Horjul
00050000-55a4-e0da-2c18-a290f98f401b	1372	Hotedršica
00050000-55a4-e0da-2867-52549a3ac4bb	1430	Hrastnik
00050000-55a4-e0da-13a2-3ea8fe44d889	6225	Hruševje
00050000-55a4-e0da-234d-91fb950bb91e	4276	Hrušica
00050000-55a4-e0da-0dc6-64a86307a338	5280	Idrija
00050000-55a4-e0da-91e2-0027f08f8994	1292	Ig
00050000-55a4-e0da-32ae-729064db8126	6250	Ilirska Bistrica
00050000-55a4-e0da-3f60-1b57515d536f	6251	Ilirska Bistrica-Trnovo
00050000-55a4-e0da-dc6e-6a92312fed83	1295	Ivančna Gorica
00050000-55a4-e0da-6451-e88cb0c43242	2259	Ivanjkovci
00050000-55a4-e0da-be45-76d2469d290b	1411	Izlake
00050000-55a4-e0da-6b7a-9a012dc007af	6310	Izola/Isola
00050000-55a4-e0da-acb5-669d3d1ff05f	2222	Jakobski Dol
00050000-55a4-e0da-9324-e526b7e0484b	2221	Jarenina
00050000-55a4-e0da-44c4-703b4225830c	6254	Jelšane
00050000-55a4-e0da-aa4f-1e7bad3c668d	4270	Jesenice
00050000-55a4-e0da-82ae-f006d36827b3	8261	Jesenice na Dolenjskem
00050000-55a4-e0da-75f8-d321a12c96b8	3273	Jurklošter
00050000-55a4-e0da-aca6-4407949dc59d	2223	Jurovski Dol
00050000-55a4-e0da-b383-4c10b855f882	2256	Juršinci
00050000-55a4-e0da-d19a-6438de461693	5214	Kal nad Kanalom
00050000-55a4-e0da-503f-3aa844fc083d	3233	Kalobje
00050000-55a4-e0da-bf0e-2e0d3a139956	4246	Kamna Gorica
00050000-55a4-e0da-642e-28a095d5fa80	2351	Kamnica
00050000-55a4-e0da-a543-657219d7d5b9	1241	Kamnik
00050000-55a4-e0da-e25d-40cbbb19d101	5213	Kanal
00050000-55a4-e0da-8e64-3062fbe64d05	8258	Kapele
00050000-55a4-e0da-c457-8890b24ba90b	2362	Kapla
00050000-55a4-e0da-aa7c-9c827b08ee00	2325	Kidričevo
00050000-55a4-e0da-b36c-a176bd810644	1412	Kisovec
00050000-55a4-e0da-d88e-c78a54072f69	6253	Knežak
00050000-55a4-e0da-bdc4-f03dcbefc759	5222	Kobarid
00050000-55a4-e0da-0249-b7afd7302d27	9227	Kobilje
00050000-55a4-e0da-babd-8c89e8473216	1330	Kočevje
00050000-55a4-e0da-079a-9659ff4b1b0b	1338	Kočevska Reka
00050000-55a4-e0da-c967-ca3b7f12bb7b	2276	Kog
00050000-55a4-e0da-9805-815caf8ba21e	5211	Kojsko
00050000-55a4-e0da-6369-f681f4f91603	6223	Komen
00050000-55a4-e0da-23be-0cf96db8fb07	1218	Komenda
00050000-55a4-e0da-9f87-7115991261d7	6000	Koper/Capodistria 
00050000-55a4-e0da-0e19-fe96eac6ed74	6001	Koper/Capodistria - poštni predali
00050000-55a4-e0da-59eb-4bb0f541eb09	8282	Koprivnica
00050000-55a4-e0da-97dc-063ab1385902	5296	Kostanjevica na Krasu
00050000-55a4-e0da-5c99-e18c762130df	8311	Kostanjevica na Krki
00050000-55a4-e0da-a0b6-6cad29e403e8	1336	Kostel
00050000-55a4-e0da-e09a-99e04226b38c	6256	Košana
00050000-55a4-e0da-680a-701d429c3a1c	2394	Kotlje
00050000-55a4-e0da-f388-3ea73a0600b4	6240	Kozina
00050000-55a4-e0da-3766-f555f4711653	3260	Kozje
00050000-55a4-e0da-9c62-afb9f2ac2a67	4000	Kranj 
00050000-55a4-e0da-2c28-0fdf7bf38d92	4001	Kranj - poštni predali
00050000-55a4-e0da-dcf2-18c09e38a126	4280	Kranjska Gora
00050000-55a4-e0da-8bce-93a6d2c23943	1281	Kresnice
00050000-55a4-e0da-476f-daea073a8c14	4294	Križe
00050000-55a4-e0da-9224-453716936236	9206	Križevci
00050000-55a4-e0da-5c77-abfab7c7d9ef	9242	Križevci pri Ljutomeru
00050000-55a4-e0da-597e-7950f39c1a8d	1301	Krka
00050000-55a4-e0da-7512-3563f204bf62	8296	Krmelj
00050000-55a4-e0da-1281-c94b2cbf0f0d	4245	Kropa
00050000-55a4-e0da-6281-9f68a2b35d6e	8262	Krška vas
00050000-55a4-e0da-1ef6-5fc310c67d7c	8270	Krško
00050000-55a4-e0da-fc92-361ebf750361	9263	Kuzma
00050000-55a4-e0da-ffc7-99a2bf774772	2318	Laporje
00050000-55a4-e0da-f9e3-50493a4800f7	3270	Laško
00050000-55a4-e0da-58ca-488e6b6a005c	1219	Laze v Tuhinju
00050000-55a4-e0da-4218-b0d20b1fe44a	2230	Lenart v Slovenskih goricah
00050000-55a4-e0da-7f8f-e94cb6e8ea59	9220	Lendava/Lendva
00050000-55a4-e0da-ec76-4ce5e71d6648	4248	Lesce
00050000-55a4-e0da-7ba6-0487d752d744	3261	Lesično
00050000-55a4-e0da-171a-e118afae093f	8273	Leskovec pri Krškem
00050000-55a4-e0da-85b2-3640b47add2d	2372	Libeliče
00050000-55a4-e0da-a587-77599bf3aa00	2341	Limbuš
00050000-55a4-e0da-99b7-8d9349e9d7e1	1270	Litija
00050000-55a4-e0da-f235-cdae3c8a7467	3202	Ljubečna
00050000-55a4-e0da-2857-35ebb3769f7e	1000	Ljubljana 
00050000-55a4-e0da-c206-d4dbd7abde71	1001	Ljubljana - poštni predali
00050000-55a4-e0da-461e-a301bc4e35d2	1231	Ljubljana - Črnuče
00050000-55a4-e0da-1c67-6a55500c6729	1261	Ljubljana - Dobrunje
00050000-55a4-e0da-15e7-cac35af4171c	1260	Ljubljana - Polje
00050000-55a4-e0da-e00a-00381733b8d1	1210	Ljubljana - Šentvid
00050000-55a4-e0da-dad2-22cfc7162a8c	1211	Ljubljana - Šmartno
00050000-55a4-e0da-2396-657375cde52c	3333	Ljubno ob Savinji
00050000-55a4-e0da-31a3-c3ba45720a57	9240	Ljutomer
00050000-55a4-e0da-b838-c204406a703c	3215	Loče
00050000-55a4-e0da-060b-3cf9f4a0860b	5231	Log pod Mangartom
00050000-55a4-e0da-233b-4b1aed124989	1358	Log pri Brezovici
00050000-55a4-e0da-6c73-de082ae8af12	1370	Logatec
00050000-55a4-e0da-4afd-decf5025b165	1371	Logatec
00050000-55a4-e0da-6f84-afe0c36cd6da	1434	Loka pri Zidanem Mostu
00050000-55a4-e0da-8bf5-85e5cb935f4c	3223	Loka pri Žusmu
00050000-55a4-e0da-e648-c9efb2c2a604	6219	Lokev
00050000-55a4-e0da-4da0-ce417ebc0571	1318	Loški Potok
00050000-55a4-e0da-85a0-0a3606c9da12	2324	Lovrenc na Dravskem polju
00050000-55a4-e0da-dad7-333870b785fa	2344	Lovrenc na Pohorju
00050000-55a4-e0da-1d97-7507adbb0c3a	3334	Luče
00050000-55a4-e0da-d215-188ec6182914	1225	Lukovica
00050000-55a4-e0da-07b8-773632e0591d	9202	Mačkovci
00050000-55a4-e0da-dad6-ade60a0fc6ee	2322	Majšperk
00050000-55a4-e0da-2c0d-39a331d59dbf	2321	Makole
00050000-55a4-e0da-d2ea-9daf5d9411e9	9243	Mala Nedelja
00050000-55a4-e0da-f65f-9520e4aac929	2229	Malečnik
00050000-55a4-e0da-d47a-f4804d8313e5	6273	Marezige
00050000-55a4-e0da-4c42-0fb2af0b47d0	2000	Maribor 
00050000-55a4-e0da-36c2-26558e509c5d	2001	Maribor - poštni predali
00050000-55a4-e0da-3717-f66ee0d61199	2206	Marjeta na Dravskem polju
00050000-55a4-e0da-0abb-c31a9a35abab	2281	Markovci
00050000-55a4-e0da-4200-8e1eb6cef425	9221	Martjanci
00050000-55a4-e0da-b54c-2e18b4f329e7	6242	Materija
00050000-55a4-e0da-ec05-60b809a9592a	4211	Mavčiče
00050000-55a4-e0da-07d5-9f6dcf833024	1215	Medvode
00050000-55a4-e0da-d59a-af9632762524	1234	Mengeš
00050000-55a4-e0da-2c41-b0b06f752ebd	8330	Metlika
00050000-55a4-e0da-d0b3-e17cdba6b75e	2392	Mežica
00050000-55a4-e0da-b5db-31d307113763	2204	Miklavž na Dravskem polju
00050000-55a4-e0da-46f5-147d7628083f	2275	Miklavž pri Ormožu
00050000-55a4-e0da-68e5-d0f662a4fc44	5291	Miren
00050000-55a4-e0da-75d9-c40486bdaa22	8233	Mirna
00050000-55a4-e0da-3c76-840165d51516	8216	Mirna Peč
00050000-55a4-e0da-d77a-74c9fd3c5175	2382	Mislinja
00050000-55a4-e0da-2a79-fba3c1ed2942	4281	Mojstrana
00050000-55a4-e0da-f267-a6e6dad82c6b	8230	Mokronog
00050000-55a4-e0da-5ae9-87bc2c96103a	1251	Moravče
00050000-55a4-e0da-73f0-d20d5d346622	9226	Moravske Toplice
00050000-55a4-e0da-1cee-55b50c02524b	5216	Most na Soči
00050000-55a4-e0da-5fe8-f49759307db4	1221	Motnik
00050000-55a4-e0da-216b-2141d795fd00	3330	Mozirje
00050000-55a4-e0da-be6a-7451e4ad73db	9000	Murska Sobota 
00050000-55a4-e0da-e39c-1a331372d91a	9001	Murska Sobota - poštni predali
00050000-55a4-e0da-bc71-fdfceca52093	2366	Muta
00050000-55a4-e0da-b169-e8b3ed04a620	4202	Naklo
00050000-55a4-e0da-288d-3dd561bc3bf1	3331	Nazarje
00050000-55a4-e0da-73e3-f9dc861abc77	1357	Notranje Gorice
00050000-55a4-e0da-7332-f031180ccd8c	3203	Nova Cerkev
00050000-55a4-e0da-3529-df93903a7919	5000	Nova Gorica 
00050000-55a4-e0da-b380-d6a1b81e56dc	5001	Nova Gorica - poštni predali
00050000-55a4-e0da-72c3-e3100c86d31a	1385	Nova vas
00050000-55a4-e0da-2f7b-b9c669933930	8000	Novo mesto
00050000-55a4-e0da-fe6d-fb0da6b211a3	8001	Novo mesto - poštni predali
00050000-55a4-e0da-1c6a-a6761769451f	6243	Obrov
00050000-55a4-e0da-2e4d-97986652d8fb	9233	Odranci
00050000-55a4-e0da-585e-947f6bf77e18	2317	Oplotnica
00050000-55a4-e0da-4e8b-35685a187ffe	2312	Orehova vas
00050000-55a4-e0da-2ece-1ca2efcd7804	2270	Ormož
00050000-55a4-e0da-cf0c-e020d77d2b09	1316	Ortnek
00050000-55a4-e0da-e041-6c1a4d6c7ae8	1337	Osilnica
00050000-55a4-e0da-0b33-660955023f67	8222	Otočec
00050000-55a4-e0da-0edc-a4c9f9ed13ac	2361	Ožbalt
00050000-55a4-e0da-9653-e62fbaffb23d	2231	Pernica
00050000-55a4-e0da-5409-a17c0d6f4471	2211	Pesnica pri Mariboru
00050000-55a4-e0da-e4e6-5f3bdea5d1b2	9203	Petrovci
00050000-55a4-e0da-f258-9f30d12044fc	3301	Petrovče
00050000-55a4-e0da-b6e6-9f2911e32322	6330	Piran/Pirano
00050000-55a4-e0da-9961-a31ade6702c2	8255	Pišece
00050000-55a4-e0da-e314-6a2394895d37	6257	Pivka
00050000-55a4-e0da-9ede-e3fad41e3e9c	6232	Planina
00050000-55a4-e0da-843c-51afe506ad66	3225	Planina pri Sevnici
00050000-55a4-e0da-ac25-9ad20c6a14f1	6276	Pobegi
00050000-55a4-e0da-61b7-136f422aa957	8312	Podbočje
00050000-55a4-e0da-88c5-cc601a0e07a1	5243	Podbrdo
00050000-55a4-e0da-c33b-165e8c9c5609	3254	Podčetrtek
00050000-55a4-e0da-2d8d-cda1e39afc46	2273	Podgorci
00050000-55a4-e0da-075a-9d4ac775b6bc	6216	Podgorje
00050000-55a4-e0da-3c86-c0dc0b536b27	2381	Podgorje pri Slovenj Gradcu
00050000-55a4-e0da-40db-2a36caef90f3	6244	Podgrad
00050000-55a4-e0da-10a3-c2e5a442502a	1414	Podkum
00050000-55a4-e0da-0a92-83af12518dfc	2286	Podlehnik
00050000-55a4-e0da-6c57-a9eb8434ee25	5272	Podnanos
00050000-55a4-e0da-f9af-6c93c71d929b	4244	Podnart
00050000-55a4-e0da-1ad0-bf4076805f1e	3241	Podplat
00050000-55a4-e0da-11c0-0dfca1297238	3257	Podsreda
00050000-55a4-e0da-8f70-92664a946163	2363	Podvelka
00050000-55a4-e0da-28e1-ee8773c306d0	2208	Pohorje
00050000-55a4-e0da-8e0e-61344c98355a	2257	Polenšak
00050000-55a4-e0da-cb4d-7fd9284b9c9d	1355	Polhov Gradec
00050000-55a4-e0da-1498-0c477392b512	4223	Poljane nad Škofjo Loko
00050000-55a4-e0da-0baf-e8c8d718d117	2319	Poljčane
00050000-55a4-e0da-4998-2ed740130a50	1272	Polšnik
00050000-55a4-e0da-2e86-9482a805ea9f	3313	Polzela
00050000-55a4-e0da-99c8-bd7a54f0a431	3232	Ponikva
00050000-55a4-e0da-0847-dac0ea217711	6320	Portorož/Portorose
00050000-55a4-e0da-e3f1-197ac0f9670a	6230	Postojna
00050000-55a4-e0da-56de-68beab0057a2	2331	Pragersko
00050000-55a4-e0da-f684-63d9a4c824c9	3312	Prebold
00050000-55a4-e0da-4385-e9299271c823	4205	Preddvor
00050000-55a4-e0da-773c-c130b5ac5ab5	6255	Prem
00050000-55a4-e0da-7c3b-651fe1ed7b0a	1352	Preserje
00050000-55a4-e0da-38e8-ccdb09a61578	6258	Prestranek
00050000-55a4-e0da-7c4f-4bcee94ef974	2391	Prevalje
00050000-55a4-e0da-3276-d9a91722a3c6	3262	Prevorje
00050000-55a4-e0da-ff23-44cdbd1a7dcc	1276	Primskovo 
00050000-55a4-e0da-4e39-556e664205ab	3253	Pristava pri Mestinju
00050000-55a4-e0da-b9d4-519810399ba5	9207	Prosenjakovci/Partosfalva
00050000-55a4-e0da-5782-2ee84add8077	5297	Prvačina
00050000-55a4-e0da-2f45-1be385ff6c1b	2250	Ptuj
00050000-55a4-e0da-cea4-d37bcb59138b	2323	Ptujska Gora
00050000-55a4-e0da-c77b-e3e0bc1a46de	9201	Puconci
00050000-55a4-e0da-d20d-0e9bf66121ab	2327	Rače
00050000-55a4-e0da-5162-21fe4cc54ffa	1433	Radeče
00050000-55a4-e0da-ddf5-2e0b84c7c46b	9252	Radenci
00050000-55a4-e0da-3381-ef6e3ac32d1a	2360	Radlje ob Dravi
00050000-55a4-e0da-0055-ea063b590d72	1235	Radomlje
00050000-55a4-e0da-186e-48f357a36db9	4240	Radovljica
00050000-55a4-e0da-b07e-078adcedf274	8274	Raka
00050000-55a4-e0da-053e-a2960121897c	1381	Rakek
00050000-55a4-e0da-49bb-ced94db59519	4283	Rateče - Planica
00050000-55a4-e0da-8d60-76a80ae46385	2390	Ravne na Koroškem
00050000-55a4-e0da-9ea7-742e898feb86	9246	Razkrižje
00050000-55a4-e0da-f3fb-299795776fdb	3332	Rečica ob Savinji
00050000-55a4-e0da-129f-0706d5e673c5	5292	Renče
00050000-55a4-e0da-5600-a96ff4551b93	1310	Ribnica
00050000-55a4-e0da-64b1-9ccb9f1835da	2364	Ribnica na Pohorju
00050000-55a4-e0da-bf2e-575f49bb0f64	3272	Rimske Toplice
00050000-55a4-e0da-9562-3e20c832df70	1314	Rob
00050000-55a4-e0da-88de-07ee459ce217	5215	Ročinj
00050000-55a4-e0da-4306-1fa2a3336716	3250	Rogaška Slatina
00050000-55a4-e0da-b786-fae63bc2fafd	9262	Rogašovci
00050000-55a4-e0da-a2b6-0e0425041fc4	3252	Rogatec
00050000-55a4-e0da-6956-447bb131421c	1373	Rovte
00050000-55a4-e0da-acfc-3a2b25f6e133	2342	Ruše
00050000-55a4-e0da-7a1a-c8c3521ac08d	1282	Sava
00050000-55a4-e0da-f824-aa952307f324	6333	Sečovlje/Sicciole
00050000-55a4-e0da-6879-58200c50dd43	4227	Selca
00050000-55a4-e0da-4815-9aadeaa16275	2352	Selnica ob Dravi
00050000-55a4-e0da-7e87-3a1f06ce583c	8333	Semič
00050000-55a4-e0da-4daa-367f5e4c1f5c	8281	Senovo
00050000-55a4-e0da-9920-0fff2cc9e28d	6224	Senožeče
00050000-55a4-e0da-ea7f-125d24444d2f	8290	Sevnica
00050000-55a4-e0da-b470-d0d4c3d87ac6	6210	Sežana
00050000-55a4-e0da-3be8-8dd405878cda	2214	Sladki Vrh
00050000-55a4-e0da-ac41-0e12088a0ab6	5283	Slap ob Idrijci
00050000-55a4-e0da-3546-8c3c0df72b82	2380	Slovenj Gradec
00050000-55a4-e0da-aedf-428750bbb0ee	2310	Slovenska Bistrica
00050000-55a4-e0da-4cfb-08c4c70afe50	3210	Slovenske Konjice
00050000-55a4-e0da-f528-5507f489965e	1216	Smlednik
00050000-55a4-e0da-8a1c-45b6f31b1108	5232	Soča
00050000-55a4-e0da-b5a4-3acc99c53228	1317	Sodražica
00050000-55a4-e0da-008b-233d71b436e6	3335	Solčava
00050000-55a4-e0da-3baa-3cfbca41b4bb	5250	Solkan
00050000-55a4-e0da-5259-ea65ce147cab	4229	Sorica
00050000-55a4-e0da-34f4-23f705685af9	4225	Sovodenj
00050000-55a4-e0da-cc9a-69f37ad75efa	5281	Spodnja Idrija
00050000-55a4-e0da-b6bf-180716725c5f	2241	Spodnji Duplek
00050000-55a4-e0da-9037-1e650770bd83	9245	Spodnji Ivanjci
00050000-55a4-e0da-ba81-09b769c99202	2277	Središče ob Dravi
00050000-55a4-e0da-86f3-623e9e058420	4267	Srednja vas v Bohinju
00050000-55a4-e0da-4269-11c00976c172	8256	Sromlje 
00050000-55a4-e0da-453d-46f5b233f1bf	5224	Srpenica
00050000-55a4-e0da-5e48-e38916b116b5	1242	Stahovica
00050000-55a4-e0da-6fe1-b5c0f2f5f4a6	1332	Stara Cerkev
00050000-55a4-e0da-1034-6099c0308ff3	8342	Stari trg ob Kolpi
00050000-55a4-e0da-cd81-b46a720ec2fe	1386	Stari trg pri Ložu
00050000-55a4-e0da-8177-feca08115d52	2205	Starše
00050000-55a4-e0da-588f-382aca25ff0f	2289	Stoperce
00050000-55a4-e0da-7472-41f21f13bf90	8322	Stopiče
00050000-55a4-e0da-1018-41677edd2a37	3206	Stranice
00050000-55a4-e0da-f6c4-11b984715716	8351	Straža
00050000-55a4-e0da-178c-cffb71ff96fa	1313	Struge
00050000-55a4-e0da-8678-1df48a97bbd4	8293	Studenec
00050000-55a4-e0da-3946-5b9c25abff29	8331	Suhor
00050000-55a4-e0da-e2db-1dae69ab5650	2233	Sv. Ana v Slovenskih goricah
00050000-55a4-e0da-7524-385f8548f04b	2235	Sv. Trojica v Slovenskih goricah
00050000-55a4-e0da-f521-3bd9e4613a71	2353	Sveti Duh na Ostrem Vrhu
00050000-55a4-e0da-ad74-215cdc455daa	9244	Sveti Jurij ob Ščavnici
00050000-55a4-e0da-77c5-6ae3d0925492	3264	Sveti Štefan
00050000-55a4-e0da-1447-0d628937c0e2	2258	Sveti Tomaž
00050000-55a4-e0da-a452-86b20656359f	9204	Šalovci
00050000-55a4-e0da-00bd-48bf06e92005	5261	Šempas
00050000-55a4-e0da-b4cb-4903e2e4b749	5290	Šempeter pri Gorici
00050000-55a4-e0da-8d1d-d6774546d899	3311	Šempeter v Savinjski dolini
00050000-55a4-e0da-dc19-622be96ee9dd	4208	Šenčur
00050000-55a4-e0da-0016-186a5d5ecbd8	2212	Šentilj v Slovenskih goricah
00050000-55a4-e0da-067a-4016c21caeaa	8297	Šentjanž
00050000-55a4-e0da-eefb-c4963e682c91	2373	Šentjanž pri Dravogradu
00050000-55a4-e0da-daa8-b9e64ea66fa5	8310	Šentjernej
00050000-55a4-e0da-a9e8-27549cbc1f63	3230	Šentjur
00050000-55a4-e0da-9659-2fe0c1a4f288	3271	Šentrupert
00050000-55a4-e0da-fedf-cffc56b18e32	8232	Šentrupert
00050000-55a4-e0da-2a73-85cab9c53d45	1296	Šentvid pri Stični
00050000-55a4-e0da-bf14-1b4bc2e6a9d7	8275	Škocjan
00050000-55a4-e0da-f538-1f3b92b1dc79	6281	Škofije
00050000-55a4-e0da-b692-762a3b80a184	4220	Škofja Loka
00050000-55a4-e0da-015c-aedb461c4490	3211	Škofja vas
00050000-55a4-e0da-ee69-2d83a0c889de	1291	Škofljica
00050000-55a4-e0da-1c10-d1173c7fcfc8	6274	Šmarje
00050000-55a4-e0da-ae18-ddfd1ef3bb92	1293	Šmarje - Sap
00050000-55a4-e0da-1461-220eee331317	3240	Šmarje pri Jelšah
00050000-55a4-e0da-c43d-498cd0fde443	8220	Šmarješke Toplice
00050000-55a4-e0da-41a4-b0c8881689c7	2315	Šmartno na Pohorju
00050000-55a4-e0da-2679-ff206702e40b	3341	Šmartno ob Dreti
00050000-55a4-e0da-3fed-966cbe2c9a80	3327	Šmartno ob Paki
00050000-55a4-e0da-a125-d06bd8148a21	1275	Šmartno pri Litiji
00050000-55a4-e0da-e263-6e2f2d61dcda	2383	Šmartno pri Slovenj Gradcu
00050000-55a4-e0da-47cb-26732170c60e	3201	Šmartno v Rožni dolini
00050000-55a4-e0da-8c4e-694b852d2bc7	3325	Šoštanj
00050000-55a4-e0da-3f08-4aefdea82ddb	6222	Štanjel
00050000-55a4-e0da-b090-a0759c1096ab	3220	Štore
00050000-55a4-e0da-491a-44f8a39aaf67	3304	Tabor
00050000-55a4-e0da-ea54-13cdde31be61	3221	Teharje
00050000-55a4-e0da-46df-fa7e11adeded	9251	Tišina
00050000-55a4-e0da-9be4-1adeeca8d00a	5220	Tolmin
00050000-55a4-e0da-bcb0-91dd55ef4a4c	3326	Topolšica
00050000-55a4-e0da-9422-2cb649710cbb	2371	Trbonje
00050000-55a4-e0da-22ed-f796aca47f5b	1420	Trbovlje
00050000-55a4-e0da-a930-5bf5cb6857f1	8231	Trebelno 
00050000-55a4-e0da-bc72-f79954c35662	8210	Trebnje
00050000-55a4-e0da-bd33-0e9e9aa27aae	5252	Trnovo pri Gorici
00050000-55a4-e0da-bbad-a6dbd9756d6d	2254	Trnovska vas
00050000-55a4-e0da-3557-5058ba7f9f3e	1222	Trojane
00050000-55a4-e0da-b0b7-3c2baf4fec62	1236	Trzin
00050000-55a4-e0da-4925-04c9ecbef105	4290	Tržič
00050000-55a4-e0da-7456-952913947356	8295	Tržišče
00050000-55a4-e0da-905a-fe250ec6f406	1311	Turjak
00050000-55a4-e0da-3c2f-072ae29c763d	9224	Turnišče
00050000-55a4-e0da-6ca2-57626b42254d	8323	Uršna sela
00050000-55a4-e0da-703e-44891950b7ee	1252	Vače
00050000-55a4-e0da-e628-fd6e257a298d	3320	Velenje 
00050000-55a4-e0da-d062-16c571952f0e	3322	Velenje - poštni predali
00050000-55a4-e0da-69ac-ee9d77f09576	8212	Velika Loka
00050000-55a4-e0da-47dd-3960b7438501	2274	Velika Nedelja
00050000-55a4-e0da-bb2f-e26b01f08cc9	9225	Velika Polana
00050000-55a4-e0da-f3c6-4bb303862a21	1315	Velike Lašče
00050000-55a4-e0da-4e52-3b8c89f22827	8213	Veliki Gaber
00050000-55a4-e0da-bffb-1612cc8cbb04	9241	Veržej
00050000-55a4-e0da-5cf6-4fbe1f9be2c6	1312	Videm - Dobrepolje
00050000-55a4-e0da-84bd-df9f32bc7304	2284	Videm pri Ptuju
00050000-55a4-e0da-845f-d73ca42e91c6	8344	Vinica
00050000-55a4-e0da-fff9-61c3f45b6872	5271	Vipava
00050000-55a4-e0da-c685-cb92e340991b	4212	Visoko
00050000-55a4-e0da-584e-4168b5103279	1294	Višnja Gora
00050000-55a4-e0da-81a1-be1f27ef15d5	3205	Vitanje
00050000-55a4-e0da-3326-449893b282f9	2255	Vitomarci
00050000-55a4-e0da-2481-5d577a970e70	1217	Vodice
00050000-55a4-e0da-92f3-cecc966c5975	3212	Vojnik\t
00050000-55a4-e0da-a615-ec356bd731b4	5293	Volčja Draga
00050000-55a4-e0da-a2b3-e3e1ba0b468a	2232	Voličina
00050000-55a4-e0da-3281-9f96f6961a7a	3305	Vransko
00050000-55a4-e0da-ee64-221ea7a4d1c7	6217	Vremski Britof
00050000-55a4-e0da-e292-556a6841bbbc	1360	Vrhnika
00050000-55a4-e0da-13a6-1c9ba8675cfe	2365	Vuhred
00050000-55a4-e0da-7c75-a35e8c8b6290	2367	Vuzenica
00050000-55a4-e0da-b929-69327407afd8	8292	Zabukovje 
00050000-55a4-e0da-9483-2c43aea8dbdc	1410	Zagorje ob Savi
00050000-55a4-e0da-9367-6d0156c6311a	1303	Zagradec
00050000-55a4-e0da-3dce-c123d9b4e86d	2283	Zavrč
00050000-55a4-e0da-1ad3-97886840108a	8272	Zdole 
00050000-55a4-e0da-beff-af4b9bdd9478	4201	Zgornja Besnica
00050000-55a4-e0da-6e43-256613865b7b	2242	Zgornja Korena
00050000-55a4-e0da-6251-9e7c178610d1	2201	Zgornja Kungota
00050000-55a4-e0da-9669-b9cf015b9324	2316	Zgornja Ložnica
00050000-55a4-e0da-2546-18781670b944	2314	Zgornja Polskava
00050000-55a4-e0da-5d13-2034caa44dc0	2213	Zgornja Velka
00050000-55a4-e0da-14ff-fdb1701ceebf	4247	Zgornje Gorje
00050000-55a4-e0da-42f6-27e4d678a272	4206	Zgornje Jezersko
00050000-55a4-e0da-8071-be4560aae280	2285	Zgornji Leskovec
00050000-55a4-e0da-ebed-bef6896957ae	1432	Zidani Most
00050000-55a4-e0da-e123-fa85712f43a0	3214	Zreče
00050000-55a4-e0da-0fff-fce3d76ed2e2	4209	Žabnica
00050000-55a4-e0da-0a2a-4b075979466f	3310	Žalec
00050000-55a4-e0da-9d07-e90b1f00cbaa	4228	Železniki
00050000-55a4-e0da-df25-62157d398683	2287	Žetale
00050000-55a4-e0da-7e1a-5e2f2f45d86c	4226	Žiri
00050000-55a4-e0da-5041-df5111acf684	4274	Žirovnica
00050000-55a4-e0da-5667-8a1f843fb258	8360	Žužemberk
\.


--
-- TOC entry 2882 (class 0 OID 10318530)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 10318341)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 10318419)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 10318542)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 10318850)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 10318861)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a4-e0db-88d4-38662a9af32a	00080000-55a4-e0db-2de8-aeb1f727c0bc	0900	AK
00190000-55a4-e0db-6fa4-601f0ab02819	00080000-55a4-e0db-f687-860147615a3f	0987	AK
00190000-55a4-e0db-e1d1-488a45583999	00080000-55a4-e0db-86f9-0fb8b812b30f	0989	AK
00190000-55a4-e0db-46e8-b740a79ad339	00080000-55a4-e0db-9265-933e530a0ebf	0986	AK
00190000-55a4-e0db-ec36-b9784e3d81d8	00080000-55a4-e0db-4759-d864d53c0a7e	0984	AK
00190000-55a4-e0db-b1ac-87e4bf88ac13	00080000-55a4-e0db-b462-edbd16f3a9af	0983	AK
00190000-55a4-e0db-48e7-35972f04ddc4	00080000-55a4-e0db-99ec-404616b1276f	0982	AK
\.


--
-- TOC entry 2906 (class 0 OID 10318831)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a4-e0db-419d-56a8b4268124	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2851 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 10318571)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a4-e0db-9446-9015bdc40aa4	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a4-e0db-f5da-2c4a2077dbe8	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a4-e0db-1aa9-121d419476ad	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a4-e0db-d955-8e0f2b911e68	0004	Mali oder	t	24	Mali oder 
00220000-55a4-e0db-3a2e-45b7ae8a53b4	0005	Komorni oder	t	15	Komorni oder
00220000-55a4-e0db-2999-78e53470ff40	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a4-e0db-b8ac-db11846b8cca	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2880 (class 0 OID 10318515)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 10318505)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 10318690)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 10318639)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 10318213)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2889 (class 0 OID 10318581)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 10318251)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a4-e0da-4199-00101a46bb6f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a4-e0da-b1ea-be1630b2727b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a4-e0da-6e31-c7146dbcbfd5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a4-e0da-d9f8-d0d386f3e65a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a4-e0da-483f-921503d2ec09	planer	Planer dogodkov v koledarju	t
00020000-55a4-e0da-ce7b-63cd83e4a3d6	kadrovska	Kadrovska služba	t
00020000-55a4-e0da-caf6-d581f704ec16	arhivar	Ažuriranje arhivalij	t
00020000-55a4-e0da-d30f-5210a4ba1b7f	igralec	Igralec	t
00020000-55a4-e0da-3a7f-aac8c22f4f8d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a4-e0db-f165-e6bc1675d541	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2855 (class 0 OID 10318235)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a4-e0da-8703-df0a265df739	00020000-55a4-e0da-6e31-c7146dbcbfd5
00010000-55a4-e0da-bd82-3a10f55de49e	00020000-55a4-e0da-6e31-c7146dbcbfd5
00010000-55a4-e0db-73a7-9b96fcddd6c4	00020000-55a4-e0db-f165-e6bc1675d541
\.


--
-- TOC entry 2891 (class 0 OID 10318595)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 10318536)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 10318486)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 10318900)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a4-e0da-f5d2-ed607739c380	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a4-e0da-31c2-d5a968077378	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a4-e0da-62e5-c720796bebeb	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a4-e0da-4b2c-50edf6557305	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a4-e0da-1a8f-2f1c31f76ec0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2912 (class 0 OID 10318892)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a4-e0da-021d-320ccac201c5	00230000-55a4-e0da-4b2c-50edf6557305	popa
00240000-55a4-e0da-df51-2b17658c8264	00230000-55a4-e0da-4b2c-50edf6557305	oseba
00240000-55a4-e0da-d160-f7199a337a94	00230000-55a4-e0da-31c2-d5a968077378	prostor
00240000-55a4-e0da-ee2d-654e9948c0ce	00230000-55a4-e0da-4b2c-50edf6557305	besedilo
00240000-55a4-e0da-5185-d026b93568d2	00230000-55a4-e0da-4b2c-50edf6557305	uprizoritev
00240000-55a4-e0da-3833-0b6db35aa303	00230000-55a4-e0da-4b2c-50edf6557305	funkcija
00240000-55a4-e0da-651e-cf33b6996366	00230000-55a4-e0da-4b2c-50edf6557305	tipfunkcije
00240000-55a4-e0da-596d-5f1273e98454	00230000-55a4-e0da-4b2c-50edf6557305	alternacija
00240000-55a4-e0da-1784-119f758a39fd	00230000-55a4-e0da-f5d2-ed607739c380	pogodba
00240000-55a4-e0da-2bc4-6421786dd609	00230000-55a4-e0da-4b2c-50edf6557305	zaposlitev
00240000-55a4-e0da-0c09-a69ff36c2290	00230000-55a4-e0da-f5d2-ed607739c380	programdela
\.


--
-- TOC entry 2911 (class 0 OID 10318887)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 10318649)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a4-e0db-466d-a7468741f18b	000e0000-55a4-e0db-c272-fc1af11cdcc2	00080000-55a4-e0db-38a4-10b922cae7c3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a4-e0db-9817-65a7040d3f1a	000e0000-55a4-e0db-c272-fc1af11cdcc2	00080000-55a4-e0db-38a4-10b922cae7c3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a4-e0db-2fb9-172d4ff25a0b	000e0000-55a4-e0db-c272-fc1af11cdcc2	00080000-55a4-e0db-d0ee-252dc3b75929	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2862 (class 0 OID 10318313)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 10318492)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a4-e0db-18e5-5f1a45e1c514	00180000-55a4-e0db-b510-aa2c5c969c51	000c0000-55a4-e0db-fdc9-1182bff9d41c	00090000-55a4-e0db-86b5-9af87a97fb84	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a4-e0db-9b32-a9f8a9e5057f	00180000-55a4-e0db-b510-aa2c5c969c51	000c0000-55a4-e0db-f714-fac5b17028c5	00090000-55a4-e0db-f916-3686017e439c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a4-e0db-4b65-7526dbe46746	00180000-55a4-e0db-b510-aa2c5c969c51	000c0000-55a4-e0db-e778-1d272923fddc	00090000-55a4-e0db-49e4-eba77c854c5d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a4-e0db-6769-c030a8caa059	00180000-55a4-e0db-b510-aa2c5c969c51	000c0000-55a4-e0db-f0e2-746ba07b2290	00090000-55a4-e0db-c625-92d2764614b9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a4-e0db-32c0-c78fd6d8c0ff	00180000-55a4-e0db-b510-aa2c5c969c51	000c0000-55a4-e0db-a2a6-fe48e162f700	00090000-55a4-e0db-54c0-50055f631146	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a4-e0db-c7e8-1394a98569d5	00180000-55a4-e0db-8155-7d5a37d2a800	\N	00090000-55a4-e0db-54c0-50055f631146	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2898 (class 0 OID 10318679)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a4-e0da-ed52-4bfdbbff7f85	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a4-e0da-78bc-b701329e578c	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a4-e0da-ef5a-424846bf057d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a4-e0da-2b2c-1a4ed1b6e14f	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a4-e0da-91b2-6547c3535ab3	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a4-e0da-9919-16b1b5275ed0	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a4-e0da-e84b-69f887573347	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a4-e0da-6394-30e5587d4c16	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a4-e0da-bc18-95364a104ac5	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a4-e0da-8cfd-16fc93a49084	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a4-e0da-d7b4-28b4bf154329	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a4-e0da-5ce5-19d78fc24762	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a4-e0da-65f8-f0c374da0f8f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a4-e0da-3d61-87f7c8a0e1e0	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a4-e0da-c3fb-d67d338ab08e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a4-e0da-acf0-399c448af72b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2909 (class 0 OID 10318869)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a4-e0da-2265-914126885541	01	Velika predstava	f	1.00	1.00
002b0000-55a4-e0da-f9b3-7cb2a30c1248	02	Mala predstava	f	0.50	0.50
002b0000-55a4-e0da-c1f6-f343178c5995	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a4-e0da-fc65-5d5b0212f5df	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a4-e0da-63be-333f2590c479	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2867 (class 0 OID 10318376)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 10318222)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a4-e0da-bd82-3a10f55de49e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROBjqOd3OAOecc0xSXQYRpB4kreDccZZi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-4a7e-e191fc1c9891	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-f046-c19c1845165d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-2109-50a7799c5ccc	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-5810-9de7c0347048	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-d1d4-7c13d2149c03	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-32df-333e91b6dfd5	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-ef6e-9f90a4e5e084	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-6bd8-1ec07507976d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-905f-2be5d35b1314	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a4-e0db-73a7-9b96fcddd6c4	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a4-e0da-8703-df0a265df739	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2902 (class 0 OID 10318727)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a4-e0db-561d-e67b1d9f9b05	00160000-55a4-e0db-3df7-2c91334dcb5f	00150000-55a4-e0da-8362-9d1f0fa358fb	00140000-55a4-e0da-b816-8a21b31f84f3	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a4-e0db-3a2e-45b7ae8a53b4
000e0000-55a4-e0db-c272-fc1af11cdcc2	00160000-55a4-e0db-cbde-c90182919c75	00150000-55a4-e0da-b340-5e4889fd7042	00140000-55a4-e0da-40b9-34349a126ba2	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a4-e0db-2999-78e53470ff40
000e0000-55a4-e0db-0a8e-e9bb8600bdef	\N	00150000-55a4-e0da-b340-5e4889fd7042	00140000-55a4-e0da-40b9-34349a126ba2	00190000-55a4-e0db-6fa4-601f0ab02819	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a4-e0db-3a2e-45b7ae8a53b4
000e0000-55a4-e0db-7f47-16a1a2a223f9	\N	00150000-55a4-e0da-b340-5e4889fd7042	00140000-55a4-e0da-40b9-34349a126ba2	00190000-55a4-e0db-6fa4-601f0ab02819	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a4-e0db-3a2e-45b7ae8a53b4
000e0000-55a4-e0db-0dda-346f7d77b02a	\N	00150000-55a4-e0da-b340-5e4889fd7042	00140000-55a4-e0da-40b9-34349a126ba2	00190000-55a4-e0db-6fa4-601f0ab02819	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a4-e0db-9446-9015bdc40aa4
\.


--
-- TOC entry 2872 (class 0 OID 10318438)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a4-e0db-dd73-2f8a19c2b687	000e0000-55a4-e0db-c272-fc1af11cdcc2	1	
00200000-55a4-e0db-fb09-ac23a0f28d2f	000e0000-55a4-e0db-c272-fc1af11cdcc2	2	
\.


--
-- TOC entry 2887 (class 0 OID 10318563)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 10318632)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55a4-e0db-fbbc-ea5bd2d48847	00090000-55a4-e0db-f916-3686017e439c	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a4-e0db-3a6e-b566f0bf43a3	00090000-55a4-e0db-49e4-eba77c854c5d	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a4-e0db-f78b-4ff75e5b540e	00090000-55a4-e0db-b9cd-54b4aee18179	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2874 (class 0 OID 10318470)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 10318717)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a4-e0da-b816-8a21b31f84f3	01	Drama	drama (SURS 01)
00140000-55a4-e0da-0674-c54b5865f7d8	02	Opera	opera (SURS 02)
00140000-55a4-e0da-30af-7558251b65b0	03	Balet	balet (SURS 03)
00140000-55a4-e0da-8add-240d33629e6a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a4-e0da-3fc4-33770fd51857	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a4-e0da-40b9-34349a126ba2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a4-e0da-752b-f4a763b0264f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2893 (class 0 OID 10318622)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a4-e0da-311e-1c3d52c1591d	01	Opera	opera
00150000-55a4-e0da-c267-0d0dc62c8e4b	02	Opereta	opereta
00150000-55a4-e0da-c658-905e6598c2ef	03	Balet	balet
00150000-55a4-e0da-5663-af63bcb5400d	04	Plesne prireditve	plesne prireditve
00150000-55a4-e0da-a66c-282fc16f0c5c	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a4-e0da-b26a-b5eb39bf1938	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a4-e0da-f8de-89dcb4546f68	07	Biografska drama	biografska drama
00150000-55a4-e0da-8362-9d1f0fa358fb	08	Komedija	komedija
00150000-55a4-e0da-7681-d85f9ca1af74	09	Črna komedija	črna komedija
00150000-55a4-e0da-8f5e-a686779bb38c	10	E-igra	E-igra
00150000-55a4-e0da-b340-5e4889fd7042	11	Kriminalka	kriminalka
00150000-55a4-e0da-50ec-e7b4e5245b90	12	Musical	musical
\.


--
-- TOC entry 2446 (class 2606 OID 10318276)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 10318774)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 10318764)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 10318678)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 10318460)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 10318485)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 10318885)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 10318402)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 10318826)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 10318618)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 10318436)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 10318479)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 10318416)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 10318528)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 10318555)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 10318374)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 10318285)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2453 (class 2606 OID 10318309)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 10318265)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 10318250)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 10318561)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 10318594)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 10318712)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 10318338)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 10318362)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 10318534)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 10318352)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 10318423)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 10318546)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 10318858)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 10318866)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 10318848)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 10318578)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 10318519)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 10318510)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 10318700)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 10318646)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 10318221)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 10318585)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 10318239)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 10318259)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 10318603)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 10318541)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 10318491)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 10318909)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 10318897)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 10318891)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 10318659)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 10318318)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 10318501)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 10318689)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 10318879)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 10318387)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 10318234)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 10318743)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 10318445)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 10318569)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 10318637)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 10318474)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 10318725)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 10318630)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 10318467)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2586 (class 1259 OID 10318660)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2587 (class 1259 OID 10318661)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2460 (class 1259 OID 10318340)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2407 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2408 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2409 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2551 (class 1259 OID 10318562)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2545 (class 1259 OID 10318548)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2546 (class 1259 OID 10318547)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 10318446)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 10318619)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2574 (class 1259 OID 10318621)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2575 (class 1259 OID 10318620)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 10318418)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 10318417)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 10318714)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2597 (class 1259 OID 10318715)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 10318716)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2421 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2422 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2605 (class 1259 OID 10318748)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2606 (class 1259 OID 10318745)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2607 (class 1259 OID 10318749)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2608 (class 1259 OID 10318747)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2609 (class 1259 OID 10318746)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 10318389)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 10318388)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2412 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2413 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 10318312)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 10318586)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 10318480)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 10318266)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 10318267)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2566 (class 1259 OID 10318606)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2567 (class 1259 OID 10318605)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2568 (class 1259 OID 10318604)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 10318424)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 10318426)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 10318425)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2648 (class 1259 OID 10318899)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2525 (class 1259 OID 10318514)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2526 (class 1259 OID 10318512)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2527 (class 1259 OID 10318511)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2528 (class 1259 OID 10318513)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 10318240)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 10318241)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2554 (class 1259 OID 10318570)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2540 (class 1259 OID 10318535)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2582 (class 1259 OID 10318647)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2583 (class 1259 OID 10318648)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 10318830)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2627 (class 1259 OID 10318827)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 10318828)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2629 (class 1259 OID 10318829)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 10318354)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 10318353)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 10318355)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2425 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2633 (class 1259 OID 10318859)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2634 (class 1259 OID 10318860)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2619 (class 1259 OID 10318778)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 10318776)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 10318777)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2579 (class 1259 OID 10318638)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 10318523)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2532 (class 1259 OID 10318522)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2533 (class 1259 OID 10318520)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2534 (class 1259 OID 10318521)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2403 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 10318766)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 10318765)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2630 (class 1259 OID 10318849)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 10318437)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2645 (class 1259 OID 10318886)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2447 (class 1259 OID 10318287)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 10318286)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 10318319)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 10318320)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 10318504)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 10318503)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2522 (class 1259 OID 10318502)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2416 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2417 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2418 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2503 (class 1259 OID 10318469)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 10318465)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 10318462)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 10318463)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 10318461)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 10318466)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 10318464)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 10318339)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 10318403)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 10318405)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 10318404)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 10318406)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2539 (class 1259 OID 10318529)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 10318713)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 10318744)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 10318310)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 10318311)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2576 (class 1259 OID 10318631)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 10318910)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 10318375)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2651 (class 1259 OID 10318898)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2559 (class 1259 OID 10318580)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2560 (class 1259 OID 10318579)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 10318775)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 10318779)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 10318363)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 10318726)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 10318867)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 10318868)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 10318260)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 10318468)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2680 (class 2606 OID 10319046)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2683 (class 2606 OID 10319031)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2682 (class 2606 OID 10319036)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2678 (class 2606 OID 10319056)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2684 (class 2606 OID 10319026)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2679 (class 2606 OID 10319051)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2681 (class 2606 OID 10319041)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2714 (class 2606 OID 10319201)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 10319206)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 10318961)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2701 (class 2606 OID 10319141)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2699 (class 2606 OID 10319136)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2700 (class 2606 OID 10319131)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2677 (class 2606 OID 10319021)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 10319171)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 10319181)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2708 (class 2606 OID 10319176)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2671 (class 2606 OID 10318996)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2672 (class 2606 OID 10318991)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2697 (class 2606 OID 10319121)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2717 (class 2606 OID 10319211)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2716 (class 2606 OID 10319216)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 10319221)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2719 (class 2606 OID 10319241)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2722 (class 2606 OID 10319226)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2718 (class 2606 OID 10319246)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2720 (class 2606 OID 10319236)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2721 (class 2606 OID 10319231)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2669 (class 2606 OID 10318986)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2670 (class 2606 OID 10318981)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 10318946)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2662 (class 2606 OID 10318941)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 10319151)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2685 (class 2606 OID 10319061)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2658 (class 2606 OID 10318921)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2657 (class 2606 OID 10318926)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2704 (class 2606 OID 10319166)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2705 (class 2606 OID 10319161)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2706 (class 2606 OID 10319156)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2675 (class 2606 OID 10319001)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 10319011)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2674 (class 2606 OID 10319006)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2738 (class 2606 OID 10319326)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2689 (class 2606 OID 10319096)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2691 (class 2606 OID 10319086)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2692 (class 2606 OID 10319081)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2690 (class 2606 OID 10319091)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2656 (class 2606 OID 10318911)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 10318916)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2702 (class 2606 OID 10319146)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2698 (class 2606 OID 10319126)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2712 (class 2606 OID 10319191)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2711 (class 2606 OID 10319196)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 10319296)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 10319281)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2731 (class 2606 OID 10319286)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2730 (class 2606 OID 10319291)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2667 (class 2606 OID 10318971)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2668 (class 2606 OID 10318966)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 10318976)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 10319306)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2734 (class 2606 OID 10319311)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2726 (class 2606 OID 10319271)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 10319276)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2728 (class 2606 OID 10319261)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2727 (class 2606 OID 10319266)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2710 (class 2606 OID 10319186)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 10319116)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2694 (class 2606 OID 10319111)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2696 (class 2606 OID 10319101)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2695 (class 2606 OID 10319106)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2723 (class 2606 OID 10319256)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2724 (class 2606 OID 10319251)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2733 (class 2606 OID 10319301)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2676 (class 2606 OID 10319016)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2736 (class 2606 OID 10319316)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 10319321)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2659 (class 2606 OID 10318936)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2660 (class 2606 OID 10318931)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2664 (class 2606 OID 10318951)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 10318956)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 10319076)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2687 (class 2606 OID 10319071)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2688 (class 2606 OID 10319066)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-14 12:13:48 CEST

--
-- PostgreSQL database dump complete
--

