--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-06-01 18:34:16 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 239 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 5803773)
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
-- TOC entry 227 (class 1259 OID 5804290)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_id uuid,
    pogodba_id uuid,
    sifra character varying(255) NOT NULL,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean
);


--
-- TOC entry 226 (class 1259 OID 5804273)
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
-- TOC entry 219 (class 1259 OID 5804182)
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
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text
);


--
-- TOC entry 194 (class 1259 OID 5803952)
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
-- TOC entry 197 (class 1259 OID 5803986)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5803895)
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
-- TOC entry 228 (class 1259 OID 5804304)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    tip_programske_enote_id integer,
    program_dela_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(10,0) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(10,0) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(10,0) DEFAULT 0::numeric NOT NULL,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    utemeljitev text NOT NULL,
    tip character varying(15) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 5804112)
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
    maxprekirvanj integer,
    tipfunkcije_id uuid
);


--
-- TOC entry 192 (class 1259 OID 5803932)
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
-- TOC entry 196 (class 1259 OID 5803980)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5803912)
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
-- TOC entry 202 (class 1259 OID 5804029)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5804054)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5803869)
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
-- TOC entry 181 (class 1259 OID 5803782)
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
-- TOC entry 182 (class 1259 OID 5803793)
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
-- TOC entry 177 (class 1259 OID 5803747)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5803766)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5804061)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5804092)
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
-- TOC entry 223 (class 1259 OID 5804226)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostdo numeric(10,0) DEFAULT NULL::numeric,
    zacetek date,
    konec date,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 184 (class 1259 OID 5803826)
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
    zamejstvo boolean
);


--
-- TOC entry 186 (class 1259 OID 5803861)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5804035)
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
-- TOC entry 185 (class 1259 OID 5803846)
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
-- TOC entry 191 (class 1259 OID 5803924)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5804047)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5804167)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(10,0) DEFAULT NULL::numeric,
    nasstrosek boolean,
    lastnasredstva numeric(15,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    drugijavni numeric(15,2) DEFAULT NULL::numeric,
    avtorskih numeric(15,2) DEFAULT NULL::numeric,
    tantiemi numeric(15,2) DEFAULT NULL::numeric,
    skupnistrosek numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric
);


--
-- TOC entry 222 (class 1259 OID 5804218)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 5804330)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    potrjenprogram boolean NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 5804358)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 5804388)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 5804339)
-- Name: programgostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programgostovanje (
    id integer NOT NULL,
    program_dela_id uuid,
    gostitelj_id uuid,
    transportnistroski numeric(15,2) NOT NULL,
    odkup numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 236 (class 1259 OID 5804384)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 5804076)
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
-- TOC entry 201 (class 1259 OID 5804020)
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
-- TOC entry 200 (class 1259 OID 5804010)
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
-- TOC entry 221 (class 1259 OID 5804207)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5804144)
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
-- TOC entry 174 (class 1259 OID 5803718)
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
-- TOC entry 173 (class 1259 OID 5803716)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 5804086)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5803756)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5803740)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5804100)
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
-- TOC entry 204 (class 1259 OID 5804041)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5803991)
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
-- TOC entry 235 (class 1259 OID 5804376)
-- Name: stevilcenje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenje (
    id uuid NOT NULL,
    sifra character varying(8) NOT NULL,
    naziv character varying(100) NOT NULL,
    prefix character varying(5) DEFAULT NULL::character varying,
    suffix character varying(5) DEFAULT NULL::character varying,
    zacetek integer NOT NULL,
    dolzina integer NOT NULL,
    format character varying(20) NOT NULL,
    globalno boolean,
    poletih boolean
);


--
-- TOC entry 234 (class 1259 OID 5804369)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 5804364)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5804154)
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
    sort integer
);


--
-- TOC entry 183 (class 1259 OID 5803818)
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
-- TOC entry 199 (class 1259 OID 5803997)
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
-- TOC entry 220 (class 1259 OID 5804196)
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
-- TOC entry 231 (class 1259 OID 5804347)
-- Name: tipprogramskeenote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipprogramskeenote (
    id integer NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    koprodukcija boolean DEFAULT false NOT NULL,
    maxfaktor numeric(10,0) DEFAULT 1::numeric NOT NULL,
    maxvsi numeric(10,0) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 5804386)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 5803881)
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
-- TOC entry 175 (class 1259 OID 5803727)
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
-- TOC entry 225 (class 1259 OID 5804252)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    sifra character varying(255) NOT NULL,
    faza character varying(35) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    delovninaslov character varying(255) DEFAULT NULL::character varying,
    datumzacstudija date,
    stevilovaj integer,
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
-- TOC entry 193 (class 1259 OID 5803943)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5804068)
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
-- TOC entry 215 (class 1259 OID 5804137)
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
-- TOC entry 195 (class 1259 OID 5803975)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5804242)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5804127)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 5803721)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2776 (class 0 OID 5803773)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 5804290)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556c-8987-8615-4db8ea468497	000d0000-556c-8987-d3fb-418d261b9b47	\N	00090000-556c-8987-326b-b66f8cd127ab	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556c-8987-d466-28e6e80584bb	000d0000-556c-8987-15ce-75e8920a5425	\N	00090000-556c-8987-9fae-d437febadeaf	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556c-8987-4057-0b0491e612ad	000d0000-556c-8987-4024-199c292ef871	\N	00090000-556c-8987-7eff-db61dae294e5	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556c-8987-542f-428c8f5cf1d4	000d0000-556c-8987-179e-24690abf42bc	\N	00090000-556c-8987-f4da-66716a38cb26	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556c-8987-cc3f-fe3ad3acdd48	000d0000-556c-8987-ade5-1d02e0b5abcf	\N	00090000-556c-8987-96dd-3018c301c6e9	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2822 (class 0 OID 5804273)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 5804182)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556c-8987-7ebe-c83e328f7ca3	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556c-8987-18e6-f44a64a052bd	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556c-8987-e0c7-1e5dbbd6cf19	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2790 (class 0 OID 5803952)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556c-8987-9200-5c278fc5be27	\N	\N	00200000-556c-8987-9a33-f2cf6c2a45e3	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556c-8987-c7db-2cab77d58420	\N	\N	00200000-556c-8987-b2a5-db3cc7c07557	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556c-8987-7539-944efd63e3fb	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
\.


--
-- TOC entry 2793 (class 0 OID 5803986)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 5803895)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556c-8986-7ee0-cd12ec22ad2a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556c-8986-0cba-78ee0e335a05	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556c-8986-a803-5fbf3f52922c	AL	ALB	008	Albania 	Albanija	\N
00040000-556c-8986-0b4d-fbd7b94f8658	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556c-8986-435f-1245a8b7ebd1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556c-8986-0c3b-035ca84b96ae	AD	AND	020	Andorra 	Andora	\N
00040000-556c-8986-b157-7562ec24bebc	AO	AGO	024	Angola 	Angola	\N
00040000-556c-8986-6eaa-1b93e0c1edd4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556c-8986-9575-5b797839cca2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556c-8986-2248-b67eda21ea8e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-8986-5b83-490081467048	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556c-8986-724e-4c06e0000921	AM	ARM	051	Armenia 	Armenija	\N
00040000-556c-8986-53f9-2caf0e4eb5d6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556c-8986-53c6-125793a44d40	AU	AUS	036	Australia 	Avstralija	\N
00040000-556c-8986-d011-9b8cc30e9758	AT	AUT	040	Austria 	Avstrija	\N
00040000-556c-8986-0e4b-e83ec746522b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556c-8986-66f0-a3274d387936	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556c-8986-b9d5-501ac7e9e385	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556c-8986-f551-1a494efd40e9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556c-8986-79e9-d5533294c6af	BB	BRB	052	Barbados 	Barbados	\N
00040000-556c-8986-2937-4c7b8a2ac4ef	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556c-8986-d70c-f1dbe972167b	BE	BEL	056	Belgium 	Belgija	\N
00040000-556c-8986-42ef-e224042510e4	BZ	BLZ	084	Belize 	Belize	\N
00040000-556c-8986-6154-f7f126c60dbb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556c-8986-030f-cd6a002ef0d9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556c-8986-ef20-362cef605a55	BT	BTN	064	Bhutan 	Butan	\N
00040000-556c-8986-cfd2-24950b0e796d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556c-8986-9020-3990a3579191	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556c-8986-babf-a9120ce0827a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556c-8986-24aa-abba6d497c43	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556c-8986-2c04-f505f2852cb4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556c-8986-9e97-a835baf540f1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556c-8986-a4f4-361af950a85b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556c-8986-7540-19b0c97494f2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556c-8986-d732-1993a9a8bd75	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556c-8986-5db4-2a483c97cfdf	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556c-8986-9c28-ef6df643e600	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556c-8986-76d7-ab32fa35d102	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556c-8986-a5d8-a4406ad76901	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556c-8986-5565-c43959cb1e89	CA	CAN	124	Canada 	Kanada	\N
00040000-556c-8986-495a-d8a6847a92bb	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556c-8986-1b7a-85f3f5d75a31	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556c-8986-2725-303391b9902a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556c-8986-f920-84e03663f13b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556c-8986-b4a7-29e26e0f70f7	CL	CHL	152	Chile 	Čile	\N
00040000-556c-8986-ee8b-d486d223966c	CN	CHN	156	China 	Kitajska	\N
00040000-556c-8986-d0db-5d85d892bc32	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556c-8986-ff59-fd9bd22e13c6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556c-8986-0dbd-00699b4d4d7f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556c-8986-c189-4694962803d5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556c-8986-78d0-5021343bbab2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556c-8986-7fa2-53921bedbe7a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556c-8986-88a5-7b61f87176f1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556c-8986-edf4-766a20d19d5b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556c-8986-4726-330717cbe03c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556c-8986-a560-1e06631dd117	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556c-8986-89de-512c36f3840d	CU	CUB	192	Cuba 	Kuba	\N
00040000-556c-8986-0e45-9d5532aa6265	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556c-8986-2854-1b8beb5ee39d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556c-8986-5c91-512ff93c96a5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556c-8986-91c0-60ee0823b6fa	DK	DNK	208	Denmark 	Danska	\N
00040000-556c-8986-f73c-afd501d55028	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556c-8986-1be0-d97efcc45e66	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-8986-1be4-ac7bc8519bf6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556c-8986-d795-5923393bd242	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556c-8986-15d3-b62bf449a391	EG	EGY	818	Egypt 	Egipt	\N
00040000-556c-8986-6f87-b5a9a5ba987c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556c-8986-f915-86d829c57a63	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556c-8986-4b2f-b41c916182da	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556c-8986-4f51-7035e74df3ba	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556c-8986-da4b-c9556c59ed31	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556c-8986-da50-99bcb043d7ee	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556c-8986-b63b-17df5160b826	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556c-8986-1192-01e1c48f1c2d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556c-8986-0648-1646bba2bee3	FI	FIN	246	Finland 	Finska	\N
00040000-556c-8986-6222-6396553b9ff1	FR	FRA	250	France 	Francija	\N
00040000-556c-8986-35b7-2a44a3838a5b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556c-8986-485b-16ec1e9aecc5	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556c-8986-b5a9-6156cf8b1fba	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556c-8986-5cef-1a35b40ab6c6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556c-8986-f541-4c570627078a	GA	GAB	266	Gabon 	Gabon	\N
00040000-556c-8986-8f82-d64f69192423	GM	GMB	270	Gambia 	Gambija	\N
00040000-556c-8986-9b92-67f11a120fca	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556c-8986-6576-5d872cb26169	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556c-8986-cade-42a9434f76a5	GH	GHA	288	Ghana 	Gana	\N
00040000-556c-8986-ffb1-7d35c8a26287	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556c-8986-6f8b-094e7c70fd55	GR	GRC	300	Greece 	Grčija	\N
00040000-556c-8986-be36-c14645e06554	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556c-8986-e39e-d38f32b0049a	GD	GRD	308	Grenada 	Grenada	\N
00040000-556c-8986-0dbe-bcbd761e146b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556c-8986-8222-dedad6ce1fe2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556c-8986-63e5-f3a0dfdd70ec	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556c-8986-f598-c3dabbc68f0c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556c-8986-a475-42267357a7f6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556c-8986-3b28-e9fd4e5dd2e1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556c-8986-13eb-75fce65c811d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556c-8986-9ad6-cb369fe3d8ff	HT	HTI	332	Haiti 	Haiti	\N
00040000-556c-8986-c866-5c5a95cf7c03	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556c-8986-c49d-62fa7ec470d2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556c-8986-13e8-feff0f7eeaf0	HN	HND	340	Honduras 	Honduras	\N
00040000-556c-8986-5613-dc3fa2c5e55d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556c-8986-c30d-46250004752d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556c-8986-719e-e8bc36c33f47	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556c-8986-2a1b-2c94ae80217a	IN	IND	356	India 	Indija	\N
00040000-556c-8986-a3b3-0ee3b6174bc8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556c-8986-999a-3a2a034f76b6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556c-8986-dd9b-0c8b1c59579f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556c-8986-3077-049157032e71	IE	IRL	372	Ireland 	Irska	\N
00040000-556c-8986-61f5-6ed2ab1950b4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556c-8986-9eb5-d85ad6fb125a	IL	ISR	376	Israel 	Izrael	\N
00040000-556c-8986-ddc6-01332e9a90eb	IT	ITA	380	Italy 	Italija	\N
00040000-556c-8986-7d0c-6609d94e4bfb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556c-8986-8a64-99fd64409cc1	JP	JPN	392	Japan 	Japonska	\N
00040000-556c-8986-26dc-c1c6cfe9119a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556c-8986-33be-9039d7d7dd2f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556c-8986-2a53-655341ba559e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556c-8986-93a9-2d1c079d2a35	KE	KEN	404	Kenya 	Kenija	\N
00040000-556c-8986-7699-00cfa9f7f003	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556c-8986-5ac7-f43d6b370ab8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556c-8986-afa2-4b4b17a833e9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556c-8986-1ccf-3fe1c4e55895	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556c-8986-6391-9a466a660e2a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556c-8986-11aa-51780b0ecf40	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556c-8986-fe8e-e1244477503c	LV	LVA	428	Latvia 	Latvija	\N
00040000-556c-8986-33c6-5a0116131525	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556c-8986-6c15-acf6ce903a6d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556c-8986-3eb6-6b5372b58fdc	LR	LBR	430	Liberia 	Liberija	\N
00040000-556c-8986-47c4-84659410531c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556c-8986-50d8-f1667131edb1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556c-8986-aed1-623399e75513	LT	LTU	440	Lithuania 	Litva	\N
00040000-556c-8986-e655-909d88dca056	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556c-8986-b660-10b68f65f3d3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556c-8986-a9fc-3093eb08334f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556c-8986-feb3-4f3d7912a9df	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556c-8986-b5b6-ada47d86539b	MW	MWI	454	Malawi 	Malavi	\N
00040000-556c-8986-f545-c6f5c28c737a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556c-8986-635c-f86b73a92445	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556c-8986-43d9-e5172df9e548	ML	MLI	466	Mali 	Mali	\N
00040000-556c-8986-873a-4e8e2add652a	MT	MLT	470	Malta 	Malta	\N
00040000-556c-8986-aca3-9bddda56ad13	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556c-8986-5bf1-8f11748f88f0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556c-8986-1850-41cc961deb03	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556c-8986-851f-32cda239a61c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556c-8986-063f-e839526727ae	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556c-8986-c5bf-95c0766e7f88	MX	MEX	484	Mexico 	Mehika	\N
00040000-556c-8986-c079-c383f6e94d8c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556c-8986-3ec6-5d3a820dde4b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556c-8986-5ae4-eb9a06bf3a97	MC	MCO	492	Monaco 	Monako	\N
00040000-556c-8986-dc34-089d6d2ffe40	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556c-8986-1ce9-be8c0b71dc5a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556c-8986-f58c-0c79fce500d3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556c-8986-8344-f7aa053e1fac	MA	MAR	504	Morocco 	Maroko	\N
00040000-556c-8986-de61-00fa3d00e41c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556c-8986-0393-8ae22d0b2388	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556c-8986-1752-a6e48c41208e	NA	NAM	516	Namibia 	Namibija	\N
00040000-556c-8986-75f6-9a8ef4e450f8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556c-8986-06bd-d97cb926e7c6	NP	NPL	524	Nepal 	Nepal	\N
00040000-556c-8986-a422-9d40c898486d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556c-8986-1233-74eee53c07ab	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556c-8986-8d5a-baa748f662da	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556c-8986-4c06-504aeb542179	NE	NER	562	Niger 	Niger 	\N
00040000-556c-8986-f14e-5f6834301909	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556c-8986-35d8-459093f0b5ce	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556c-8986-57b4-297c7d557179	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556c-8986-25d3-dd86aba02b11	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556c-8986-ec84-bed3b6337e3f	NO	NOR	578	Norway 	Norveška	\N
00040000-556c-8986-d438-b4203c31063d	OM	OMN	512	Oman 	Oman	\N
00040000-556c-8986-2dea-edee70d2b713	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556c-8986-e53e-50f7e1b81c0a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556c-8986-9c2d-0888ffcdcafb	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556c-8986-2dc4-19e8e4eca595	PA	PAN	591	Panama 	Panama	\N
00040000-556c-8986-2593-c660bbe048c2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556c-8986-e14e-11c0ecd0a5aa	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556c-8986-f254-9f371b784e34	PE	PER	604	Peru 	Peru	\N
00040000-556c-8986-cebf-d1ea08262890	PH	PHL	608	Philippines 	Filipini	\N
00040000-556c-8986-9aa8-61d3f1549b2d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556c-8986-723c-d8ce754de85c	PL	POL	616	Poland 	Poljska	\N
00040000-556c-8986-2360-703b9e0aa258	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556c-8986-0a6e-efb7a51131b8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556c-8986-e70f-dd9a39e6aeef	QA	QAT	634	Qatar 	Katar	\N
00040000-556c-8986-07af-24f60674495c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556c-8986-2214-5811d062b082	RO	ROU	642	Romania 	Romunija	\N
00040000-556c-8986-054b-c36114cf4960	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556c-8986-991e-e5c043f17b0b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556c-8986-a8eb-d7159f348262	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556c-8986-7c41-87e365b449c8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556c-8986-13d7-9de8c3b42fa4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556c-8986-606d-aa236077493e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556c-8986-ed2e-5676966f6213	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556c-8986-bb04-e490ce71dbb3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556c-8986-f2f7-d0ce2e01f759	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556c-8986-90bc-88cfe39732e4	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556c-8986-6a97-66d4c6f5430d	SM	SMR	674	San Marino 	San Marino	\N
00040000-556c-8986-954a-07a6eaf37bbf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556c-8986-f283-4fa6b6488cd4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556c-8986-d30e-95086b96afee	SN	SEN	686	Senegal 	Senegal	\N
00040000-556c-8986-7c9f-6d5457c247fe	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556c-8986-0e85-a8adc31c913a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556c-8986-2c34-a19a543dce00	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556c-8986-ad62-e5b53953b324	SG	SGP	702	Singapore 	Singapur	\N
00040000-556c-8986-3bb4-0869a805600f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556c-8986-a9f7-61de7100b0c3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556c-8986-e6b3-c4da21b6af22	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556c-8986-1ac5-a1b29d19603b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556c-8986-90e6-8b39d407634c	SO	SOM	706	Somalia 	Somalija	\N
00040000-556c-8986-9120-58760e7b05e5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556c-8986-386f-e7995df0d347	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556c-8986-689a-cdb73d81b7c8	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556c-8986-364b-43fb37ce609f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556c-8986-22ac-536dd4cb3841	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556c-8986-d3c0-8d8e95fbe5c7	SD	SDN	729	Sudan 	Sudan	\N
00040000-556c-8986-da00-38dc362248c9	SR	SUR	740	Suriname 	Surinam	\N
00040000-556c-8986-c71f-9f4807889936	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556c-8986-3f3a-f5a44901ba32	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556c-8986-d066-fea9811b9a72	SE	SWE	752	Sweden 	Švedska	\N
00040000-556c-8986-b8a4-dce2fc1eceba	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556c-8986-96c3-600c34967e6d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556c-8986-1415-1814c981fd71	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556c-8986-5b9e-39af9c058aa9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556c-8986-712a-790e377efe1f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556c-8986-4486-1c78a383118c	TH	THA	764	Thailand 	Tajska	\N
00040000-556c-8986-f37b-35daca003fd3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556c-8986-c4ec-eff962f641ed	TG	TGO	768	Togo 	Togo	\N
00040000-556c-8986-ac8b-65ed791b7815	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556c-8986-c704-d17ae15e7327	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556c-8986-f122-047c3d5f60c7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556c-8986-69b8-abe13953536f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556c-8986-e611-c7e24d8a6fd8	TR	TUR	792	Turkey 	Turčija	\N
00040000-556c-8986-0a46-57f707a4c98a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556c-8986-a9b2-b285cc0e72b5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-8986-14f1-3c48ea951f87	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556c-8986-70f5-2bc3d43155a4	UG	UGA	800	Uganda 	Uganda	\N
00040000-556c-8986-a6df-c41d57a78b0b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556c-8986-699f-4f474ef4f3b8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556c-8986-b43e-71b1757dcb30	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556c-8986-f248-38488146fd1d	US	USA	840	United States 	Združene države Amerike	\N
00040000-556c-8986-836a-968a165a6bda	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556c-8986-6405-e0b20133077b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556c-8986-c561-5064351cf06a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556c-8986-bd9d-882bce0d0cfe	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556c-8986-25a0-e5c72ad99d00	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556c-8986-b246-e07da3d09d2b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556c-8986-d167-c9f09a36f0d6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-8986-6751-159974040f66	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556c-8986-9f5e-841e4665e7a4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556c-8986-2e06-1a2d9a09d150	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556c-8986-4f2a-9fa2657ad83a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556c-8986-88e5-03887e5493d0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556c-8986-fdd5-07684d7f45d7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2824 (class 0 OID 5804304)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 5804112)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-556c-8987-731b-a0b258dc7c94	000e0000-556c-8987-fff4-0360fbfc8109	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556c-8986-591c-76f5891335f1
000d0000-556c-8987-d3fb-418d261b9b47	000e0000-556c-8987-fff4-0360fbfc8109	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556c-8986-591c-76f5891335f1
000d0000-556c-8987-15ce-75e8920a5425	000e0000-556c-8987-fff4-0360fbfc8109	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556c-8986-8f9c-190f08f79a70
000d0000-556c-8987-4024-199c292ef871	000e0000-556c-8987-fff4-0360fbfc8109	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556c-8986-0491-be30c546da11
000d0000-556c-8987-179e-24690abf42bc	000e0000-556c-8987-fff4-0360fbfc8109	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556c-8986-0491-be30c546da11
000d0000-556c-8987-ade5-1d02e0b5abcf	000e0000-556c-8987-fff4-0360fbfc8109	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556c-8986-0491-be30c546da11
\.


--
-- TOC entry 2788 (class 0 OID 5803932)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 5803980)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 5803912)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2766 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 5804029)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 5804054)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 5803869)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556c-8986-cb64-8e29f0022c29	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556c-8986-964d-6bff24b33abe	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556c-8986-bdb0-142b04a72013	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556c-8986-4a4a-c70e36334288	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556c-8986-eb52-d5c72ca12e6d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556c-8986-8b7b-8b4a0e01dfdc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556c-8986-22f2-31e499953c76	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556c-8986-bd3c-69d94872dab1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556c-8986-35e0-5252032f75ec	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556c-8986-6f7e-7a8410579f35	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556c-8986-7731-b38f6b909e56	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556c-8986-40f7-61f6bf721d53	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556c-8986-345f-460fc567aeca	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-8986-6b63-7115447a0ba9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-8986-c683-2945ea80bfc7	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556c-8986-ed7f-17a0e85b50ab	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2777 (class 0 OID 5803782)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556c-8986-96a8-62645a4ca08b	00000000-556c-8986-eb52-d5c72ca12e6d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556c-8986-3d44-888edb6fb4b3	00000000-556c-8986-eb52-d5c72ca12e6d	00010000-556c-8986-efc6-c841a89f2c48	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556c-8986-c037-0be259b89eda	00000000-556c-8986-8b7b-8b4a0e01dfdc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2778 (class 0 OID 5803793)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556c-8987-3b27-aeae933d15b1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556c-8987-f4da-66716a38cb26	00010000-556c-8987-6be5-806d892cc88a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556c-8987-7eff-db61dae294e5	00010000-556c-8987-d6c2-bd4080f75d6b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556c-8987-c989-7e48f83347d0	00010000-556c-8987-11f5-2776f10a0e07	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556c-8987-1c22-543933bd7986	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556c-8987-fec8-f4a7cb707560	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556c-8987-d4ab-72e8cf495ef4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556c-8987-b3ce-60f8adaa1901	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556c-8987-326b-b66f8cd127ab	00010000-556c-8987-ca50-05d3185cc53b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556c-8987-9fae-d437febadeaf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556c-8987-5cb6-f0dda83d7d50	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556c-8987-96dd-3018c301c6e9	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556c-8987-fd1f-e8e30ef0b0f7	00010000-556c-8987-b673-e5b11e343ca8	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2768 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 5803747)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556c-8986-cef2-39aa8dcbc44f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556c-8986-5362-2afd49e81952	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556c-8986-e096-542417ff81fa	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556c-8986-f02e-9eee581595f3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556c-8986-625b-60c368169b29	Abonma-read	Abonma - branje	f
00030000-556c-8986-ecfd-42e599b11c2d	Abonma-write	Abonma - spreminjanje	f
00030000-556c-8986-531c-fef4c7cd6367	Alternacija-read	Alternacija - branje	f
00030000-556c-8986-f885-4c8f57cbf0e5	Alternacija-write	Alternacija - spreminjanje	f
00030000-556c-8986-9797-46706b3972d4	Arhivalija-read	Arhivalija - branje	f
00030000-556c-8986-b0e9-9c1050c940d7	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556c-8986-a623-d0b38ddd1bb9	Besedilo-read	Besedilo - branje	f
00030000-556c-8986-4d90-a2718287572a	Besedilo-write	Besedilo - spreminjanje	f
00030000-556c-8986-ea23-e88942e5c722	DogodekIzven-read	DogodekIzven - branje	f
00030000-556c-8986-d928-e696c4baf2c3	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556c-8986-e279-f1d27b53ea3f	Dogodek-read	Dogodek - branje	f
00030000-556c-8986-1fd0-3f99411da21b	Dogodek-write	Dogodek - spreminjanje	f
00030000-556c-8986-650f-f7ade16dacdd	Drzava-read	Drzava - branje	f
00030000-556c-8986-43a9-1ae4da238d15	Drzava-write	Drzava - spreminjanje	f
00030000-556c-8986-4a1a-551578c2e5f6	Funkcija-read	Funkcija - branje	f
00030000-556c-8986-efd3-14c270fea52c	Funkcija-write	Funkcija - spreminjanje	f
00030000-556c-8986-d3e9-a6e8bcef21b4	Gostovanje-read	Gostovanje - branje	f
00030000-556c-8986-6abb-a66d12b8a21a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556c-8986-664e-b8305d8ecce3	Gostujoca-read	Gostujoca - branje	f
00030000-556c-8986-61af-654bb681bd60	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556c-8986-f1de-c761c658fc26	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556c-8986-66a7-62a88e2794f4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556c-8986-83aa-67cd2d39b7ec	Kupec-read	Kupec - branje	f
00030000-556c-8986-78fe-4b51b4196249	Kupec-write	Kupec - spreminjanje	f
00030000-556c-8986-55a4-aced560be016	NacinPlacina-read	NacinPlacina - branje	f
00030000-556c-8986-35d8-f807793bdc3c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556c-8986-f6d0-20d68be26b3c	Option-read	Option - branje	f
00030000-556c-8986-c68d-9c61b7455324	Option-write	Option - spreminjanje	f
00030000-556c-8986-fb8a-36d10eb175a2	OptionValue-read	OptionValue - branje	f
00030000-556c-8986-7b58-de3f5ba59510	OptionValue-write	OptionValue - spreminjanje	f
00030000-556c-8986-76f9-a402be118a21	Oseba-read	Oseba - branje	f
00030000-556c-8986-34a5-899767ea944c	Oseba-write	Oseba - spreminjanje	f
00030000-556c-8986-b4c0-a44241d7a300	Permission-read	Permission - branje	f
00030000-556c-8986-9ecf-7b45d3aec608	Permission-write	Permission - spreminjanje	f
00030000-556c-8986-46be-137518821505	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556c-8986-fc67-2b97673d6cda	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556c-8986-1f6b-daca47630bee	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556c-8986-9c58-43cee51ab007	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556c-8986-80c6-01224fb6ab30	Pogodba-read	Pogodba - branje	f
00030000-556c-8986-b161-802f5e929bcb	Pogodba-write	Pogodba - spreminjanje	f
00030000-556c-8986-3b08-d07f991b8825	Popa-read	Popa - branje	f
00030000-556c-8986-15c9-a749822954a8	Popa-write	Popa - spreminjanje	f
00030000-556c-8986-5bca-554989d73dc3	Posta-read	Posta - branje	f
00030000-556c-8986-c67c-9a1c680add04	Posta-write	Posta - spreminjanje	f
00030000-556c-8986-a7c7-6da04ccc228e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556c-8986-fc0c-d50177d3fd63	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556c-8986-3c2d-b0b0156b69df	PostniNaslov-read	PostniNaslov - branje	f
00030000-556c-8986-917e-1833a9b6f2d7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556c-8986-b02e-ad075c09278a	Predstava-read	Predstava - branje	f
00030000-556c-8986-07a1-5f04212a1de8	Predstava-write	Predstava - spreminjanje	f
00030000-556c-8986-6218-095a9ff69166	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556c-8986-4b47-dab7d0affded	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556c-8986-4444-6ee8753bf73e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556c-8986-c7d7-e15e0d9ea883	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556c-8986-05c5-6c9ba135fbfd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556c-8986-745d-48adb558514f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556c-8986-1315-c2a9c26016a3	Prostor-read	Prostor - branje	f
00030000-556c-8986-8de3-4981a279552d	Prostor-write	Prostor - spreminjanje	f
00030000-556c-8986-0a1a-c7e5284c8b63	Racun-read	Racun - branje	f
00030000-556c-8986-3762-87a7b770034e	Racun-write	Racun - spreminjanje	f
00030000-556c-8986-c9f4-7a5ad37e45f5	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556c-8986-ce9b-7747ae331e18	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556c-8986-6fac-6df733bc81bc	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556c-8986-5a52-fa7ba4985de6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556c-8986-f573-cf0d70948a2a	Rekvizit-read	Rekvizit - branje	f
00030000-556c-8986-97fd-1038996901e0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556c-8986-f3b9-dba662199612	Revizija-read	Revizija - branje	f
00030000-556c-8986-6907-39f3eea00e04	Revizija-write	Revizija - spreminjanje	f
00030000-556c-8986-bbac-5cac564355d7	Rezervacija-read	Rezervacija - branje	f
00030000-556c-8986-3182-f78141f08287	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556c-8986-c8ce-0ac775c13b7c	Role-read	Role - branje	f
00030000-556c-8986-b49b-64d39575ec33	Role-write	Role - spreminjanje	f
00030000-556c-8986-9c1e-ee44e8e671d8	SedezniRed-read	SedezniRed - branje	f
00030000-556c-8986-b1a8-0997e28df888	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556c-8986-fc64-4e941da17240	Sedez-read	Sedez - branje	f
00030000-556c-8986-b2b1-d5d6bcbe89ab	Sedez-write	Sedez - spreminjanje	f
00030000-556c-8986-82c4-e43e2d498109	Sezona-read	Sezona - branje	f
00030000-556c-8986-b9c2-3eceadf03f1a	Sezona-write	Sezona - spreminjanje	f
00030000-556c-8986-11c9-c68b4fe0b86c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556c-8986-5bcd-6e2e0c9a99dc	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556c-8986-a0c3-f835cf132d42	Stevilcenje-read	Stevilcenje - branje	f
00030000-556c-8986-885b-2ddaba9e48f9	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556c-8986-206d-512a17c7d083	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556c-8986-8417-a21e1d979179	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556c-8986-88ad-4b716345fe5e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556c-8986-a13c-0aa688313c54	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556c-8986-2905-fbdb04d234e2	Telefonska-read	Telefonska - branje	f
00030000-556c-8986-b5c0-39106048ea09	Telefonska-write	Telefonska - spreminjanje	f
00030000-556c-8986-d2cb-5d2678b22ebb	TerminStoritve-read	TerminStoritve - branje	f
00030000-556c-8986-521c-f896e52c3ccf	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556c-8986-052a-039cb5e5f915	TipFunkcije-read	TipFunkcije - branje	f
00030000-556c-8986-4bc1-5e1bf70c4fca	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556c-8986-d6d3-a52a68c6ce8d	Trr-read	Trr - branje	f
00030000-556c-8986-747b-7648cdd2c408	Trr-write	Trr - spreminjanje	f
00030000-556c-8986-9b21-2011f6bc6873	Uprizoritev-read	Uprizoritev - branje	f
00030000-556c-8986-432d-8a280c634161	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556c-8986-823a-fbbcb470b07b	User-read	User - branje	f
00030000-556c-8986-989c-4713162108e6	User-write	User - spreminjanje	f
00030000-556c-8986-0dcf-582faf7a09dc	Vaja-read	Vaja - branje	f
00030000-556c-8986-d357-47651b59a7ba	Vaja-write	Vaja - spreminjanje	f
00030000-556c-8986-3fdf-b91b0f095fa5	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556c-8986-55c6-36f881f7d11e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556c-8986-a2c8-6b345c871039	Zaposlitev-read	Zaposlitev - branje	f
00030000-556c-8986-cdc6-35a28a542b23	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556c-8986-d143-b0d3c3a6dd00	Zasedenost-read	Zasedenost - branje	f
00030000-556c-8986-97a7-0f4d49f3b5ad	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556c-8986-2451-b80bb80a70d1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556c-8986-853b-930dfc66812d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556c-8986-a183-9b41033ad047	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556c-8986-9c40-e5a6f171bb6c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2775 (class 0 OID 5803766)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556c-8986-32c6-e9eb2122932a	00030000-556c-8986-650f-f7ade16dacdd
00020000-556c-8986-1592-933439ea2c30	00030000-556c-8986-43a9-1ae4da238d15
00020000-556c-8986-1592-933439ea2c30	00030000-556c-8986-650f-f7ade16dacdd
\.


--
-- TOC entry 2803 (class 0 OID 5804061)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 5804092)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 5804226)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 5803826)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556c-8987-9dbb-c638b2cef658	00040000-556c-8986-7ee0-cd12ec22ad2a	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556c-8987-a374-885a456726ed	00040000-556c-8986-7ee0-cd12ec22ad2a	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556c-8987-0092-13678c4cfed2	00040000-556c-8986-7ee0-cd12ec22ad2a	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2782 (class 0 OID 5803861)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556c-8986-38d5-2eb69529e024	8341	Adlešiči
00050000-556c-8986-0194-c8f91ec616a4	5270	Ajdovščina
00050000-556c-8986-f5f1-c97ad0864062	6280	Ankaran/Ancarano
00050000-556c-8986-313d-78deca051e3a	9253	Apače
00050000-556c-8986-17a6-16f5c440dbce	8253	Artiče
00050000-556c-8986-f4a2-ed6d32700e3e	4275	Begunje na Gorenjskem
00050000-556c-8986-b304-b8a1b2cc1ae7	1382	Begunje pri Cerknici
00050000-556c-8986-e9db-525a907b1a17	9231	Beltinci
00050000-556c-8986-0d9c-8c10723b24f3	2234	Benedikt
00050000-556c-8986-1a0c-3161482c5967	2345	Bistrica ob Dravi
00050000-556c-8986-9e52-798cd2eaa1a2	3256	Bistrica ob Sotli
00050000-556c-8986-abb5-75a67e287763	8259	Bizeljsko
00050000-556c-8986-3494-af151b151e6f	1223	Blagovica
00050000-556c-8986-4c0c-5dbdbc0bda62	8283	Blanca
00050000-556c-8986-0b68-7d01d99d8744	4260	Bled
00050000-556c-8986-9172-397cbff5ea16	4273	Blejska Dobrava
00050000-556c-8986-9a61-0fb2448f18e9	9265	Bodonci
00050000-556c-8986-17ab-d072eb790d27	9222	Bogojina
00050000-556c-8986-ea12-27f7171350ae	4263	Bohinjska Bela
00050000-556c-8986-4b62-1d79e04bf355	4264	Bohinjska Bistrica
00050000-556c-8986-a63d-c5a7b0e05265	4265	Bohinjsko jezero
00050000-556c-8986-5b79-db81d8a7427b	1353	Borovnica
00050000-556c-8986-4b88-57759eb6b26a	8294	Boštanj
00050000-556c-8986-73a9-f30fe93e25aa	5230	Bovec
00050000-556c-8986-5ed2-4e544f1b9cd4	5295	Branik
00050000-556c-8986-f6d8-f90a065cadf0	3314	Braslovče
00050000-556c-8986-7a51-7a8e1bed1e00	5223	Breginj
00050000-556c-8986-181d-a7efb5ffa2be	8280	Brestanica
00050000-556c-8986-0444-10ef1fe5acdd	2354	Bresternica
00050000-556c-8986-1eac-7d185cdf9470	4243	Brezje
00050000-556c-8986-a85d-e91e104b64c4	1351	Brezovica pri Ljubljani
00050000-556c-8986-9d70-a50504db492a	8250	Brežice
00050000-556c-8986-7b1a-1a59fb1a811e	4210	Brnik - Aerodrom
00050000-556c-8986-1288-a0f201a9e898	8321	Brusnice
00050000-556c-8986-ec1e-6f1831cb1b42	3255	Buče
00050000-556c-8986-1d3a-554e8b93795b	8276	Bučka 
00050000-556c-8986-e027-10753763fb68	9261	Cankova
00050000-556c-8986-510c-d3fd1ee185c6	3000	Celje 
00050000-556c-8986-74f0-84f01a64c351	3001	Celje - poštni predali
00050000-556c-8986-37c6-bd44d08cc5ed	4207	Cerklje na Gorenjskem
00050000-556c-8986-30d6-809f55e8dcc6	8263	Cerklje ob Krki
00050000-556c-8986-56f7-bc9951e6820a	1380	Cerknica
00050000-556c-8986-e6dc-cb1ef13ac0fe	5282	Cerkno
00050000-556c-8986-573d-c6bfc9552aa5	2236	Cerkvenjak
00050000-556c-8986-6556-645217249dee	2215	Ceršak
00050000-556c-8986-c798-d5c9b1b2e186	2326	Cirkovce
00050000-556c-8986-cb60-c62299c26be5	2282	Cirkulane
00050000-556c-8986-94f6-bf418afadddb	5273	Col
00050000-556c-8986-925a-2ce7659659cd	8251	Čatež ob Savi
00050000-556c-8986-771e-e02dd7ea3128	1413	Čemšenik
00050000-556c-8986-df1f-d6a83f69a4ac	5253	Čepovan
00050000-556c-8986-21ca-195fb08cd962	9232	Črenšovci
00050000-556c-8986-3e9a-26644f4eef2b	2393	Črna na Koroškem
00050000-556c-8986-7881-0b03d3c79a87	6275	Črni Kal
00050000-556c-8986-629a-01302c05c208	5274	Črni Vrh nad Idrijo
00050000-556c-8986-43fa-cdb9135e8a07	5262	Črniče
00050000-556c-8986-ca9b-caf4d6bcdc9a	8340	Črnomelj
00050000-556c-8986-b501-4f950033c17f	6271	Dekani
00050000-556c-8986-7a5f-da846d315d52	5210	Deskle
00050000-556c-8986-b033-d5e7bf6fc0ac	2253	Destrnik
00050000-556c-8986-2665-19dacd7cf491	6215	Divača
00050000-556c-8986-425e-eebe34af7080	1233	Dob
00050000-556c-8986-6c7d-04e5ed80354f	3224	Dobje pri Planini
00050000-556c-8986-da87-4214e130b285	8257	Dobova
00050000-556c-8986-da43-76691471f609	1423	Dobovec
00050000-556c-8986-da08-22285cc8ad85	5263	Dobravlje
00050000-556c-8986-b087-9c26b67d7916	3204	Dobrna
00050000-556c-8986-12aa-c795da19cee2	8211	Dobrnič
00050000-556c-8986-2b7a-291036e5c9ca	1356	Dobrova
00050000-556c-8986-1f43-c829133049eb	9223	Dobrovnik/Dobronak 
00050000-556c-8986-a613-7e7f38c405c4	5212	Dobrovo v Brdih
00050000-556c-8986-1b93-7e1c27e60c8e	1431	Dol pri Hrastniku
00050000-556c-8986-fb18-2ed44ffc63b8	1262	Dol pri Ljubljani
00050000-556c-8986-20d1-1db0a7755413	1273	Dole pri Litiji
00050000-556c-8986-f118-682a577f0b26	1331	Dolenja vas
00050000-556c-8986-1e83-c84a5fd7c731	8350	Dolenjske Toplice
00050000-556c-8986-7e77-21351d0b0da3	1230	Domžale
00050000-556c-8986-2713-fc266044e9b7	2252	Dornava
00050000-556c-8986-4466-998e8aa1c964	5294	Dornberk
00050000-556c-8986-45ad-65f0b1b4a4ef	1319	Draga
00050000-556c-8986-ae6c-30c1a6355be4	8343	Dragatuš
00050000-556c-8986-ea9f-e4eb801090d3	3222	Dramlje
00050000-556c-8986-fccc-aa97002ef1f3	2370	Dravograd
00050000-556c-8986-d08a-c70216d922f5	4203	Duplje
00050000-556c-8986-eded-85dfde7f1c4c	6221	Dutovlje
00050000-556c-8986-b1a1-1506c0c8324d	8361	Dvor
00050000-556c-8986-842e-282be72fb547	2343	Fala
00050000-556c-8986-e3d9-1f76abeca1b1	9208	Fokovci
00050000-556c-8986-7bd2-b3965156f10c	2313	Fram
00050000-556c-8986-7fb3-7af719d41122	3213	Frankolovo
00050000-556c-8986-eab2-5f13201308ba	1274	Gabrovka
00050000-556c-8986-2e3e-4df260f41660	8254	Globoko
00050000-556c-8986-93dc-0928d9052e97	5275	Godovič
00050000-556c-8986-3ec0-99c03749ab7a	4204	Golnik
00050000-556c-8986-368c-9eef4b14d650	3303	Gomilsko
00050000-556c-8986-6001-fcf7c82d57a2	4224	Gorenja vas
00050000-556c-8986-8ee9-d424367ee13f	3263	Gorica pri Slivnici
00050000-556c-8986-9ad3-e77f0f6da20d	2272	Gorišnica
00050000-556c-8986-ba4c-75a871f2668e	9250	Gornja Radgona
00050000-556c-8986-8566-caad0a6616d6	3342	Gornji Grad
00050000-556c-8986-302f-0de485673705	4282	Gozd Martuljek
00050000-556c-8986-96c9-c31af22e00ce	6272	Gračišče
00050000-556c-8986-80cb-8b0e0b587a16	9264	Grad
00050000-556c-8986-564b-327a4c31b59c	8332	Gradac
00050000-556c-8986-d5c5-61f27d19df09	1384	Grahovo
00050000-556c-8986-0d79-35ff132336ea	5242	Grahovo ob Bači
00050000-556c-8986-1098-a31ded052154	5251	Grgar
00050000-556c-8986-c4f4-d8ecebc5633f	3302	Griže
00050000-556c-8986-0614-50ee02e2f839	3231	Grobelno
00050000-556c-8986-af9c-be04375f4aa9	1290	Grosuplje
00050000-556c-8986-5d43-e86c2d645a35	2288	Hajdina
00050000-556c-8986-f371-1affd6108350	8362	Hinje
00050000-556c-8986-6a9d-17daa29f9461	2311	Hoče
00050000-556c-8986-befa-1ea082b76183	9205	Hodoš/Hodos
00050000-556c-8986-57a2-f4cf2fa3676b	1354	Horjul
00050000-556c-8986-c981-dfe4276077ee	1372	Hotedršica
00050000-556c-8986-05f6-c6b9adad2613	1430	Hrastnik
00050000-556c-8986-72a1-935cae1d7695	6225	Hruševje
00050000-556c-8986-8d50-85915b8fbc82	4276	Hrušica
00050000-556c-8986-008d-bd3aea3dff5e	5280	Idrija
00050000-556c-8986-4623-cf98d3f371f6	1292	Ig
00050000-556c-8986-0fa3-6be2d0f9f8e7	6250	Ilirska Bistrica
00050000-556c-8986-266f-2e0010af685a	6251	Ilirska Bistrica-Trnovo
00050000-556c-8986-165c-8fc181cc518b	1295	Ivančna Gorica
00050000-556c-8986-7a51-1aeaa73d2f6c	2259	Ivanjkovci
00050000-556c-8986-8c9e-9fe663dbb90a	1411	Izlake
00050000-556c-8986-a768-a28a1351eb63	6310	Izola/Isola
00050000-556c-8986-3e77-00af63ca3e43	2222	Jakobski Dol
00050000-556c-8986-f8b4-bc4733a21ef0	2221	Jarenina
00050000-556c-8986-00b7-3d4f5f147ec0	6254	Jelšane
00050000-556c-8986-de7b-877db4d5cdb7	4270	Jesenice
00050000-556c-8986-3e6d-f9db57fe6575	8261	Jesenice na Dolenjskem
00050000-556c-8986-4700-c49ffdb36cad	3273	Jurklošter
00050000-556c-8986-7440-0a26ed857611	2223	Jurovski Dol
00050000-556c-8986-423d-eb690e077bfa	2256	Juršinci
00050000-556c-8986-469c-8a3a6e40644e	5214	Kal nad Kanalom
00050000-556c-8986-bf1e-c786e44d84fe	3233	Kalobje
00050000-556c-8986-8525-bc6ab297a464	4246	Kamna Gorica
00050000-556c-8986-b22a-effbf3251c98	2351	Kamnica
00050000-556c-8986-e119-bf098c10b255	1241	Kamnik
00050000-556c-8986-1b89-9175f3514d76	5213	Kanal
00050000-556c-8986-5a53-7bd8c6471605	8258	Kapele
00050000-556c-8986-1937-4cc23bede1c6	2362	Kapla
00050000-556c-8986-d97d-643745bf588e	2325	Kidričevo
00050000-556c-8986-5595-474c9ad27b90	1412	Kisovec
00050000-556c-8986-0231-4f423c5f9b32	6253	Knežak
00050000-556c-8986-9663-5f91e885b582	5222	Kobarid
00050000-556c-8986-6552-e0b11356143d	9227	Kobilje
00050000-556c-8986-9e30-84ef2999bb80	1330	Kočevje
00050000-556c-8986-652c-9eddaef7d2c5	1338	Kočevska Reka
00050000-556c-8986-41c7-820e1bd4091e	2276	Kog
00050000-556c-8986-09e3-fa7412ab7af4	5211	Kojsko
00050000-556c-8986-3946-4a0523a833b1	6223	Komen
00050000-556c-8986-2dfc-07693970466b	1218	Komenda
00050000-556c-8986-f226-46a733ccda42	6000	Koper/Capodistria 
00050000-556c-8986-edfa-d4aba1373646	6001	Koper/Capodistria - poštni predali
00050000-556c-8986-160e-9d7cabbc2756	8282	Koprivnica
00050000-556c-8986-5e0c-cdb194fddcb8	5296	Kostanjevica na Krasu
00050000-556c-8986-e2c6-0b4b449801da	8311	Kostanjevica na Krki
00050000-556c-8986-5f60-5b0401bedd45	1336	Kostel
00050000-556c-8986-58ef-1d82109620e2	6256	Košana
00050000-556c-8986-0485-c493731525f2	2394	Kotlje
00050000-556c-8986-5ba7-7caae2959dfb	6240	Kozina
00050000-556c-8986-3d74-a55148445727	3260	Kozje
00050000-556c-8986-6089-0bea7d4c00d4	4000	Kranj 
00050000-556c-8986-725a-9e771265a123	4001	Kranj - poštni predali
00050000-556c-8986-4030-dc139f69be88	4280	Kranjska Gora
00050000-556c-8986-3acf-039f85148fa1	1281	Kresnice
00050000-556c-8986-9b1d-f1c469b79c7f	4294	Križe
00050000-556c-8986-3061-49894c617c30	9206	Križevci
00050000-556c-8986-c15e-339c42b59d63	9242	Križevci pri Ljutomeru
00050000-556c-8986-b3de-6cf1e1bae2e3	1301	Krka
00050000-556c-8986-d6bc-2436131d6714	8296	Krmelj
00050000-556c-8986-abc4-ae668831649a	4245	Kropa
00050000-556c-8986-fd91-790be10f0850	8262	Krška vas
00050000-556c-8986-b0ac-4c3d19aa7d61	8270	Krško
00050000-556c-8986-392b-c3bc8788b551	9263	Kuzma
00050000-556c-8986-a5b6-896847633b57	2318	Laporje
00050000-556c-8986-4a18-9680684b9935	3270	Laško
00050000-556c-8986-193f-d3e1662d3c84	1219	Laze v Tuhinju
00050000-556c-8986-7075-14cadb92d334	2230	Lenart v Slovenskih goricah
00050000-556c-8986-bb46-4c394bcb68f9	9220	Lendava/Lendva
00050000-556c-8986-8260-9a4e8cb0c5ac	4248	Lesce
00050000-556c-8986-3d5c-026821b3f915	3261	Lesično
00050000-556c-8986-cca8-a54f93cf05ba	8273	Leskovec pri Krškem
00050000-556c-8986-a4c4-758060fe076f	2372	Libeliče
00050000-556c-8986-04bf-e4e9f960a6d3	2341	Limbuš
00050000-556c-8986-e159-216ef4e990bb	1270	Litija
00050000-556c-8986-9fa7-11373608a487	3202	Ljubečna
00050000-556c-8986-b6d0-3b121188a323	1000	Ljubljana 
00050000-556c-8986-752b-7bc801742404	1001	Ljubljana - poštni predali
00050000-556c-8986-410e-db718910dc3f	1231	Ljubljana - Črnuče
00050000-556c-8986-54c4-58d86500393b	1261	Ljubljana - Dobrunje
00050000-556c-8986-a0ac-c0dfd1089a88	1260	Ljubljana - Polje
00050000-556c-8986-ab39-a7515f183e5b	1210	Ljubljana - Šentvid
00050000-556c-8986-0078-6434046aedf3	1211	Ljubljana - Šmartno
00050000-556c-8986-6d6c-28ff1a815ac9	3333	Ljubno ob Savinji
00050000-556c-8986-2a0c-81b9bcb7219a	9240	Ljutomer
00050000-556c-8986-1f2f-e772092d2205	3215	Loče
00050000-556c-8986-7a0d-2bf41210d7e0	5231	Log pod Mangartom
00050000-556c-8986-b4de-02bcb4d19aaa	1358	Log pri Brezovici
00050000-556c-8986-6db9-865a87446d2e	1370	Logatec
00050000-556c-8986-526b-30be6cefc1cb	1371	Logatec
00050000-556c-8986-cacd-27dd8f952c03	1434	Loka pri Zidanem Mostu
00050000-556c-8986-ef2b-49544540431a	3223	Loka pri Žusmu
00050000-556c-8986-b259-9ca793503709	6219	Lokev
00050000-556c-8986-8e19-ef6ca2d74a7a	1318	Loški Potok
00050000-556c-8986-fe0d-66dd23210506	2324	Lovrenc na Dravskem polju
00050000-556c-8986-8744-22f9eed44770	2344	Lovrenc na Pohorju
00050000-556c-8986-80a8-4a48b863ad88	3334	Luče
00050000-556c-8986-67d4-27090449f740	1225	Lukovica
00050000-556c-8986-8bfc-bbf3dcbc8789	9202	Mačkovci
00050000-556c-8986-5ddb-aba36d59a429	2322	Majšperk
00050000-556c-8986-87f5-eb0cd54be0e2	2321	Makole
00050000-556c-8986-3077-5a2db6fe7b5e	9243	Mala Nedelja
00050000-556c-8986-d8cc-68dc6be11338	2229	Malečnik
00050000-556c-8986-e8b5-9500f269340a	6273	Marezige
00050000-556c-8986-b243-e352fbdd6b5b	2000	Maribor 
00050000-556c-8986-2e86-9d9c32e8abca	2001	Maribor - poštni predali
00050000-556c-8986-cc41-6a0dc1828299	2206	Marjeta na Dravskem polju
00050000-556c-8986-907e-4344790c76de	2281	Markovci
00050000-556c-8986-1027-ca081251f80a	9221	Martjanci
00050000-556c-8986-203d-f5a629798220	6242	Materija
00050000-556c-8986-8900-7fecb12385e1	4211	Mavčiče
00050000-556c-8986-a3ae-c2cf1718f428	1215	Medvode
00050000-556c-8986-d6a2-e977985d735c	1234	Mengeš
00050000-556c-8986-b7c0-bf23c4dbcaea	8330	Metlika
00050000-556c-8986-13ce-2df9fe897370	2392	Mežica
00050000-556c-8986-8999-8acf07196c9f	2204	Miklavž na Dravskem polju
00050000-556c-8986-c078-f4547e3a1d99	2275	Miklavž pri Ormožu
00050000-556c-8986-9fe0-8bfb5958cf9e	5291	Miren
00050000-556c-8986-67f9-278299650b69	8233	Mirna
00050000-556c-8986-dcd0-3d30c9c31ce9	8216	Mirna Peč
00050000-556c-8986-210c-819f611119bb	2382	Mislinja
00050000-556c-8986-ca01-42fe59e60274	4281	Mojstrana
00050000-556c-8986-80ea-096c9b89f345	8230	Mokronog
00050000-556c-8986-52c5-b4164896c2fd	1251	Moravče
00050000-556c-8986-b2d8-c99727c4e8d1	9226	Moravske Toplice
00050000-556c-8986-5eea-4a25896c8aa5	5216	Most na Soči
00050000-556c-8986-ae2f-d07c838dded2	1221	Motnik
00050000-556c-8986-d0cc-35edc82eaea8	3330	Mozirje
00050000-556c-8986-f16e-0a00130e3d24	9000	Murska Sobota 
00050000-556c-8986-2cde-9100a0b7fb01	9001	Murska Sobota - poštni predali
00050000-556c-8986-8312-f88338dd954f	2366	Muta
00050000-556c-8986-fdbf-eabc71c4d593	4202	Naklo
00050000-556c-8986-8019-6d90d79f5fa5	3331	Nazarje
00050000-556c-8986-5042-374269c7e7c2	1357	Notranje Gorice
00050000-556c-8986-3cfc-76343c820a0b	3203	Nova Cerkev
00050000-556c-8986-7ebc-eef9ae7a549f	5000	Nova Gorica 
00050000-556c-8986-c61b-3f3c4a23d825	5001	Nova Gorica - poštni predali
00050000-556c-8986-cf06-318c68e2a6f8	1385	Nova vas
00050000-556c-8986-7172-b05bfb90de6c	8000	Novo mesto
00050000-556c-8986-72d8-994002fae0df	8001	Novo mesto - poštni predali
00050000-556c-8986-79e0-01168fc88544	6243	Obrov
00050000-556c-8986-b85e-f58d183621e7	9233	Odranci
00050000-556c-8986-8ded-1fa2747c701b	2317	Oplotnica
00050000-556c-8986-45c6-398ab67c6c5a	2312	Orehova vas
00050000-556c-8986-8247-a69ce4658ff8	2270	Ormož
00050000-556c-8986-0c7b-732fddde3c12	1316	Ortnek
00050000-556c-8986-8a91-05afc1190de7	1337	Osilnica
00050000-556c-8986-0731-a6f19e80119f	8222	Otočec
00050000-556c-8986-cf5e-4017f2d4686a	2361	Ožbalt
00050000-556c-8986-fadf-56a22ded421f	2231	Pernica
00050000-556c-8986-6a81-e12c0224d741	2211	Pesnica pri Mariboru
00050000-556c-8986-d257-785d79002346	9203	Petrovci
00050000-556c-8986-1f51-93d5e0970c07	3301	Petrovče
00050000-556c-8986-e865-6113bf834d13	6330	Piran/Pirano
00050000-556c-8986-8d05-e8c5ba0a0dea	8255	Pišece
00050000-556c-8986-627e-0f29d8de7ab9	6257	Pivka
00050000-556c-8986-db9e-ca575b9df43f	6232	Planina
00050000-556c-8986-c74b-92648c194348	3225	Planina pri Sevnici
00050000-556c-8986-fc33-51a14acf09f4	6276	Pobegi
00050000-556c-8986-1d5f-9a8533e5b3c5	8312	Podbočje
00050000-556c-8986-ea12-58b7ea21de4a	5243	Podbrdo
00050000-556c-8986-3f40-161cfba4175a	3254	Podčetrtek
00050000-556c-8986-38cc-ea6056cbaa35	2273	Podgorci
00050000-556c-8986-92d5-c9750f51f4a6	6216	Podgorje
00050000-556c-8986-345b-63ac60175a26	2381	Podgorje pri Slovenj Gradcu
00050000-556c-8986-99d7-5b87cf96ed80	6244	Podgrad
00050000-556c-8986-befb-3e3f11240d48	1414	Podkum
00050000-556c-8986-dee2-9d23c35cc86c	2286	Podlehnik
00050000-556c-8986-d645-61176db3d238	5272	Podnanos
00050000-556c-8986-d162-539474874f10	4244	Podnart
00050000-556c-8986-f7b9-2973c21955ed	3241	Podplat
00050000-556c-8986-b9f9-c1d2276b3a7e	3257	Podsreda
00050000-556c-8986-164d-b28accea491f	2363	Podvelka
00050000-556c-8986-ed30-aa77eec2eeea	2208	Pohorje
00050000-556c-8986-6145-e1d66da98d38	2257	Polenšak
00050000-556c-8986-a12e-7e2997163224	1355	Polhov Gradec
00050000-556c-8986-810c-6bbb4dfb927d	4223	Poljane nad Škofjo Loko
00050000-556c-8986-11a4-b8c1ab0edf08	2319	Poljčane
00050000-556c-8986-28da-676f281ae611	1272	Polšnik
00050000-556c-8986-2ee5-2defbf83969c	3313	Polzela
00050000-556c-8986-ba04-acfc62c147b0	3232	Ponikva
00050000-556c-8986-35c4-fb63f200ebbe	6320	Portorož/Portorose
00050000-556c-8986-9a7e-27310e758860	6230	Postojna
00050000-556c-8986-e596-f679fda92aa2	2331	Pragersko
00050000-556c-8986-a9bb-7e63e50c0f3a	3312	Prebold
00050000-556c-8986-de5c-1dd0b8f97343	4205	Preddvor
00050000-556c-8986-502e-a22046d441fc	6255	Prem
00050000-556c-8986-9492-e48ab621f69c	1352	Preserje
00050000-556c-8986-e7a4-ccfaec3c34b8	6258	Prestranek
00050000-556c-8986-65b7-203d9348d159	2391	Prevalje
00050000-556c-8986-d32c-db5a6cb19d5c	3262	Prevorje
00050000-556c-8986-eae4-0ceb285a676d	1276	Primskovo 
00050000-556c-8986-cc71-5be31210811a	3253	Pristava pri Mestinju
00050000-556c-8986-dddb-e44a2200cd36	9207	Prosenjakovci/Partosfalva
00050000-556c-8986-a8eb-54f3fd7be592	5297	Prvačina
00050000-556c-8986-108b-ab23612300a8	2250	Ptuj
00050000-556c-8986-f248-de69fc51affd	2323	Ptujska Gora
00050000-556c-8986-dc23-f0c9b4376a77	9201	Puconci
00050000-556c-8986-65e0-21f6c3802e9d	2327	Rače
00050000-556c-8986-ffc6-ee006e2cde52	1433	Radeče
00050000-556c-8986-8638-30ee2bfbda6c	9252	Radenci
00050000-556c-8986-353d-ef0b2c8afed3	2360	Radlje ob Dravi
00050000-556c-8986-a6ce-93159894b841	1235	Radomlje
00050000-556c-8986-5191-26a722a3b8fb	4240	Radovljica
00050000-556c-8986-a333-93b295011ded	8274	Raka
00050000-556c-8986-7e04-6cca1b707bc1	1381	Rakek
00050000-556c-8986-23f2-ef94c0a3d199	4283	Rateče - Planica
00050000-556c-8986-e02b-ab285394178f	2390	Ravne na Koroškem
00050000-556c-8986-33cf-d2642d16f209	9246	Razkrižje
00050000-556c-8986-3a77-5507ea0d5546	3332	Rečica ob Savinji
00050000-556c-8986-6420-d28b3e5498e0	5292	Renče
00050000-556c-8986-918f-889d43eaed71	1310	Ribnica
00050000-556c-8986-6fa8-71adfc9b89f6	2364	Ribnica na Pohorju
00050000-556c-8986-eade-d44031f2ea9e	3272	Rimske Toplice
00050000-556c-8986-da89-aa0ad4faad40	1314	Rob
00050000-556c-8986-abce-862cbc2c5f1c	5215	Ročinj
00050000-556c-8986-e6e3-6e67dec0b730	3250	Rogaška Slatina
00050000-556c-8986-d282-6386a8bbd45b	9262	Rogašovci
00050000-556c-8986-7c41-c9aac91128ba	3252	Rogatec
00050000-556c-8986-d634-14f9213209c7	1373	Rovte
00050000-556c-8986-6b74-d0f2061b402e	2342	Ruše
00050000-556c-8986-ac64-4c5c73fb7e32	1282	Sava
00050000-556c-8986-1e3e-b1a61d0ca3a0	6333	Sečovlje/Sicciole
00050000-556c-8986-32a0-11c7cef63bbf	4227	Selca
00050000-556c-8986-1c1c-fd6f8cc8fccf	2352	Selnica ob Dravi
00050000-556c-8986-d5b0-7f1baebd2032	8333	Semič
00050000-556c-8986-32da-92e0a6c51969	8281	Senovo
00050000-556c-8986-084d-29db8e5b9fcc	6224	Senožeče
00050000-556c-8986-ce2c-4353943f6b17	8290	Sevnica
00050000-556c-8986-dd41-f51f7f8d7405	6210	Sežana
00050000-556c-8986-fc75-c95333222d73	2214	Sladki Vrh
00050000-556c-8986-807e-a382d53946d6	5283	Slap ob Idrijci
00050000-556c-8986-8077-350bee23acad	2380	Slovenj Gradec
00050000-556c-8986-b34e-a5dc4124a298	2310	Slovenska Bistrica
00050000-556c-8986-6055-9c4c56c36155	3210	Slovenske Konjice
00050000-556c-8986-d621-2286464690b8	1216	Smlednik
00050000-556c-8986-36b8-bb3b0a822377	5232	Soča
00050000-556c-8986-391c-b1126164b2b2	1317	Sodražica
00050000-556c-8986-9080-4c3fb2c9dee1	3335	Solčava
00050000-556c-8986-da49-5610f317b206	5250	Solkan
00050000-556c-8986-bff2-6f3e2a2d7bf6	4229	Sorica
00050000-556c-8986-42ab-67b5a30f31d5	4225	Sovodenj
00050000-556c-8986-e70f-9c90aae38a6a	5281	Spodnja Idrija
00050000-556c-8986-8f2d-f883ec03719b	2241	Spodnji Duplek
00050000-556c-8986-2aa4-e8265ab8eb5b	9245	Spodnji Ivanjci
00050000-556c-8986-67ed-a486c533f773	2277	Središče ob Dravi
00050000-556c-8986-48af-463d4104b2d0	4267	Srednja vas v Bohinju
00050000-556c-8986-ee17-73e12415d68f	8256	Sromlje 
00050000-556c-8986-d1f0-af73b3ad77e3	5224	Srpenica
00050000-556c-8986-bc4c-1a92bebd8eb0	1242	Stahovica
00050000-556c-8986-6161-c5381a7162b1	1332	Stara Cerkev
00050000-556c-8986-4631-a0a7d2e4777d	8342	Stari trg ob Kolpi
00050000-556c-8986-034d-f2f5d4ccc0f3	1386	Stari trg pri Ložu
00050000-556c-8986-5d9e-13ffdba81baf	2205	Starše
00050000-556c-8986-c7d6-ec743f1f291d	2289	Stoperce
00050000-556c-8986-872e-b8bb31648e8f	8322	Stopiče
00050000-556c-8986-bcc3-3e214d657038	3206	Stranice
00050000-556c-8986-6328-fc9e14fa42b0	8351	Straža
00050000-556c-8986-9f26-de12dbc396a9	1313	Struge
00050000-556c-8986-ac3c-64143647d157	8293	Studenec
00050000-556c-8986-b623-a227cc9a0695	8331	Suhor
00050000-556c-8986-49b4-81ee0c1af2db	2233	Sv. Ana v Slovenskih goricah
00050000-556c-8986-5a37-dab847ae794f	2235	Sv. Trojica v Slovenskih goricah
00050000-556c-8986-2e44-0efaa86619e3	2353	Sveti Duh na Ostrem Vrhu
00050000-556c-8986-9b1e-29411cd3bffc	9244	Sveti Jurij ob Ščavnici
00050000-556c-8986-7345-73be9e7b6e69	3264	Sveti Štefan
00050000-556c-8986-78eb-e9c43a98e3a5	2258	Sveti Tomaž
00050000-556c-8986-cc51-248d551e6eea	9204	Šalovci
00050000-556c-8986-dac0-f095d608d9de	5261	Šempas
00050000-556c-8986-5052-e9b834cab2dc	5290	Šempeter pri Gorici
00050000-556c-8986-d755-bca9dbaa2fe6	3311	Šempeter v Savinjski dolini
00050000-556c-8986-2b33-3c286052416e	4208	Šenčur
00050000-556c-8986-614e-cffa4dc30207	2212	Šentilj v Slovenskih goricah
00050000-556c-8986-ff3f-d1a4c4eeb309	8297	Šentjanž
00050000-556c-8986-7492-78c965235124	2373	Šentjanž pri Dravogradu
00050000-556c-8986-f967-c8adcf937bf7	8310	Šentjernej
00050000-556c-8986-073d-d4deee8acada	3230	Šentjur
00050000-556c-8986-d48c-14277fa7207d	3271	Šentrupert
00050000-556c-8986-5307-0b32c9e97202	8232	Šentrupert
00050000-556c-8986-52fc-6778d7f45821	1296	Šentvid pri Stični
00050000-556c-8986-2a7e-1f6c8db6b9f8	8275	Škocjan
00050000-556c-8986-5355-8ff4389a5a83	6281	Škofije
00050000-556c-8986-d6a1-a6e804b8a652	4220	Škofja Loka
00050000-556c-8986-4382-6d7f73c6a06d	3211	Škofja vas
00050000-556c-8986-64da-6350497ee7ee	1291	Škofljica
00050000-556c-8986-7a0c-3135480767a3	6274	Šmarje
00050000-556c-8986-43ce-005304dd26d0	1293	Šmarje - Sap
00050000-556c-8986-8f6b-2efaad2060ef	3240	Šmarje pri Jelšah
00050000-556c-8986-9d42-47446cc797d1	8220	Šmarješke Toplice
00050000-556c-8986-5303-548923d609f5	2315	Šmartno na Pohorju
00050000-556c-8986-c354-22f70f1b1274	3341	Šmartno ob Dreti
00050000-556c-8986-b33a-876cc9a615c9	3327	Šmartno ob Paki
00050000-556c-8986-196a-4160d2a3bb2b	1275	Šmartno pri Litiji
00050000-556c-8986-ec41-eb8aa0470d0d	2383	Šmartno pri Slovenj Gradcu
00050000-556c-8986-2b35-9eaf8046bdc9	3201	Šmartno v Rožni dolini
00050000-556c-8986-da84-169e98bd702b	3325	Šoštanj
00050000-556c-8986-37ca-0703462051c1	6222	Štanjel
00050000-556c-8986-3167-4d978cd670b1	3220	Štore
00050000-556c-8986-46cb-f85ec07ce205	3304	Tabor
00050000-556c-8986-272e-d51e0bbf0588	3221	Teharje
00050000-556c-8986-c2a6-f926e1f12d12	9251	Tišina
00050000-556c-8986-b916-a685e957ac8b	5220	Tolmin
00050000-556c-8986-db1c-924e6cc32ddf	3326	Topolšica
00050000-556c-8986-4aa6-19675260dd82	2371	Trbonje
00050000-556c-8986-1589-08462906cd3e	1420	Trbovlje
00050000-556c-8986-0986-02bc9c78f3b8	8231	Trebelno 
00050000-556c-8986-7ebd-ed5029fa45e2	8210	Trebnje
00050000-556c-8986-0fbb-f31552aa8f5c	5252	Trnovo pri Gorici
00050000-556c-8986-fbe5-a7ddf08767e6	2254	Trnovska vas
00050000-556c-8986-76fd-006b95f78cc0	1222	Trojane
00050000-556c-8986-60c8-45a4460b51ed	1236	Trzin
00050000-556c-8986-aefd-2a1ef5fd13b1	4290	Tržič
00050000-556c-8986-122c-21d4b2b7114c	8295	Tržišče
00050000-556c-8986-3ebb-e47b9d26da1a	1311	Turjak
00050000-556c-8986-415d-244c8c4d7fc7	9224	Turnišče
00050000-556c-8986-85ef-e498327476f1	8323	Uršna sela
00050000-556c-8986-ed08-552fd231fd7c	1252	Vače
00050000-556c-8986-ebbd-5096490435c2	3320	Velenje 
00050000-556c-8986-ca8a-c7e028ab14b5	3322	Velenje - poštni predali
00050000-556c-8986-ccd8-cf92e880a631	8212	Velika Loka
00050000-556c-8986-d788-cfff42d42975	2274	Velika Nedelja
00050000-556c-8986-a395-3718c81cd0e9	9225	Velika Polana
00050000-556c-8986-716c-446550f5db1e	1315	Velike Lašče
00050000-556c-8986-044b-f65306a25565	8213	Veliki Gaber
00050000-556c-8986-725c-5ff07d488a4a	9241	Veržej
00050000-556c-8986-e144-937aec3822a6	1312	Videm - Dobrepolje
00050000-556c-8986-4d6a-b2193e005377	2284	Videm pri Ptuju
00050000-556c-8986-ff73-59f6ef6134ed	8344	Vinica
00050000-556c-8986-1f67-0db08c025ddb	5271	Vipava
00050000-556c-8986-78f1-d892be6a42a0	4212	Visoko
00050000-556c-8986-3136-b181191ca225	1294	Višnja Gora
00050000-556c-8986-2072-a7a15c541e8e	3205	Vitanje
00050000-556c-8986-825c-3d232dcac365	2255	Vitomarci
00050000-556c-8986-1c0f-65e965aef8cc	1217	Vodice
00050000-556c-8986-ebd4-9da330c87df1	3212	Vojnik\t
00050000-556c-8986-8647-718c2d967333	5293	Volčja Draga
00050000-556c-8986-f3a4-cb86559ab944	2232	Voličina
00050000-556c-8986-b77f-5fda14775fd5	3305	Vransko
00050000-556c-8986-b8a4-3878b989814e	6217	Vremski Britof
00050000-556c-8986-2559-453fe1fb3caf	1360	Vrhnika
00050000-556c-8986-642a-fdc03b88abdc	2365	Vuhred
00050000-556c-8986-e88c-b0cb9438b3ca	2367	Vuzenica
00050000-556c-8986-f11d-51eee3b5f39a	8292	Zabukovje 
00050000-556c-8986-20f2-857a34842832	1410	Zagorje ob Savi
00050000-556c-8986-aa24-e2c1253d6f34	1303	Zagradec
00050000-556c-8986-61a4-046e71cf2a87	2283	Zavrč
00050000-556c-8986-b111-dc4b7c72d5de	8272	Zdole 
00050000-556c-8986-8c05-848632614eef	4201	Zgornja Besnica
00050000-556c-8986-19a6-a4b7981d7a75	2242	Zgornja Korena
00050000-556c-8986-ba54-6e017675a4d0	2201	Zgornja Kungota
00050000-556c-8986-996d-75a7d75535b9	2316	Zgornja Ložnica
00050000-556c-8986-1656-4d9d5cc534ee	2314	Zgornja Polskava
00050000-556c-8986-e0de-c77e41a4b860	2213	Zgornja Velka
00050000-556c-8986-900f-385f5171c0c2	4247	Zgornje Gorje
00050000-556c-8986-40e9-e71e68958ec2	4206	Zgornje Jezersko
00050000-556c-8986-5b6d-69db0e3971c5	2285	Zgornji Leskovec
00050000-556c-8986-907a-26bef16219af	1432	Zidani Most
00050000-556c-8986-cd89-a45bef6a2292	3214	Zreče
00050000-556c-8986-3d13-21a1d8f3be70	4209	Žabnica
00050000-556c-8986-7230-8c7a3d873116	3310	Žalec
00050000-556c-8986-b1d6-1ab0e4a5c904	4228	Železniki
00050000-556c-8986-e7aa-287513297ca9	2287	Žetale
00050000-556c-8986-7b54-ad3849d7122d	4226	Žiri
00050000-556c-8986-73fc-8dd9b6dd7800	4274	Žirovnica
00050000-556c-8986-87eb-d2cfd4b84707	8360	Žužemberk
\.


--
-- TOC entry 2799 (class 0 OID 5804035)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2767 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 5803846)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 5803924)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 5804047)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 5804167)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 5804218)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-556c-8987-564c-4ee81b3a82ab	00080000-556c-8987-0092-13678c4cfed2	0987	A
\.


--
-- TOC entry 2825 (class 0 OID 5804330)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 5804358)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 238
-- Name: programfestival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programfestival_id_seq', 1, false);


--
-- TOC entry 2826 (class 0 OID 5804339)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 236
-- Name: programgostovanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programgostovanje_id_seq', 1, false);


--
-- TOC entry 2805 (class 0 OID 5804076)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556c-8987-b1b5-a2fcf4c254ec	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556c-8987-1bc4-4dba4d7f621a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556c-8987-c107-79ca01d0a94e	0003	Kazinska	t	84	Kazinska dvorana
00220000-556c-8987-ddc9-c86839f9d3a6	0004	Mali oder	t	24	Mali oder 
00220000-556c-8987-4b3c-f93c47e92297	0005	Komorni oder	t	15	Komorni oder
00220000-556c-8987-7458-9330e68cf3e1	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556c-8987-0456-da7edc551893	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2797 (class 0 OID 5804020)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 5804010)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 5804207)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 5804144)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 5803718)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556c-8986-efc6-c841a89f2c48	00010000-556c-8986-e05b-0807586a213f	2015-06-01 18:34:16	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROGyfnnZTtJrw2o6hEstVjhppRxYTdKfe";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2806 (class 0 OID 5804086)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 5803756)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556c-8986-5ac6-81336996fe49	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556c-8986-cb94-72739876fb25	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556c-8986-32c6-e9eb2122932a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556c-8986-8106-65a52b54e0cf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556c-8986-db42-87518c97fddd	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556c-8986-1592-933439ea2c30	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2772 (class 0 OID 5803740)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556c-8986-efc6-c841a89f2c48	00020000-556c-8986-8106-65a52b54e0cf
00010000-556c-8986-e05b-0807586a213f	00020000-556c-8986-8106-65a52b54e0cf
\.


--
-- TOC entry 2808 (class 0 OID 5804100)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 5804041)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 5803991)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 5804376)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556c-8986-2fc0-5d345af69ab3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556c-8986-66c0-35db24ebe4df	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556c-8986-23c7-14d5aba1eb7e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556c-8986-4464-ae701e30de21	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556c-8986-d8f4-97bfb7290c50	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2830 (class 0 OID 5804369)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556c-8986-ab1b-c620693993f1	00000000-556c-8986-4464-ae701e30de21	popa
00000000-556c-8986-9ef7-6f7ce1d73948	00000000-556c-8986-4464-ae701e30de21	oseba
00000000-556c-8986-76d2-2b11e7b28e27	00000000-556c-8986-66c0-35db24ebe4df	prostor
00000000-556c-8986-8501-a9fb7b6809ab	00000000-556c-8986-4464-ae701e30de21	besedilo
00000000-556c-8986-0454-ef3dce631786	00000000-556c-8986-4464-ae701e30de21	uprizoritev
00000000-556c-8986-723a-a26dca12f9ad	00000000-556c-8986-4464-ae701e30de21	funkcija
00000000-556c-8986-5707-9c9c333feaef	00000000-556c-8986-4464-ae701e30de21	tipfunkcije
00000000-556c-8986-8db4-7183472e9312	00000000-556c-8986-4464-ae701e30de21	alternacija
00000000-556c-8986-6e6c-1b22f981468b	00000000-556c-8986-2fc0-5d345af69ab3	pogodba
00000000-556c-8986-f0d8-c358cf37f822	00000000-556c-8986-4464-ae701e30de21	zaposlitev
\.


--
-- TOC entry 2829 (class 0 OID 5804364)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 5804154)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 5803818)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 5803997)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556c-8987-fb01-9d73b9a45146	00180000-556c-8987-9200-5c278fc5be27	000c0000-556c-8987-8615-4db8ea468497	00090000-556c-8987-326b-b66f8cd127ab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-8987-874b-b76cbf7a90d2	00180000-556c-8987-9200-5c278fc5be27	000c0000-556c-8987-d466-28e6e80584bb	00090000-556c-8987-9fae-d437febadeaf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-8987-46aa-2cb2b48283c3	00180000-556c-8987-9200-5c278fc5be27	000c0000-556c-8987-4057-0b0491e612ad	00090000-556c-8987-7eff-db61dae294e5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-8987-d842-b83ff9ebf361	00180000-556c-8987-9200-5c278fc5be27	000c0000-556c-8987-542f-428c8f5cf1d4	00090000-556c-8987-f4da-66716a38cb26	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-8987-3409-9ffc5567c59d	00180000-556c-8987-9200-5c278fc5be27	000c0000-556c-8987-cc3f-fe3ad3acdd48	00090000-556c-8987-96dd-3018c301c6e9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-8987-ff37-88b653961b42	00180000-556c-8987-7539-944efd63e3fb	\N	00090000-556c-8987-96dd-3018c301c6e9	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2816 (class 0 OID 5804196)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556c-8986-591c-76f5891335f1	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556c-8986-ea69-81ff3b87a658	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556c-8986-eefb-3d0ffdd85e08	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556c-8986-8f9c-190f08f79a70	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556c-8986-fc23-cfc85626e232	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556c-8986-ef21-007b5e6bfe60	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556c-8986-c32e-873f958e94e8	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556c-8986-2a14-3be3010dc6ef	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556c-8986-a954-eacf6d49be28	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556c-8986-578c-51861b77df7c	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556c-8986-3ea0-465a458c3936	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556c-8986-b124-1a06674ea023	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556c-8986-fabd-d63e657de987	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556c-8986-72fc-100a6a59b289	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556c-8986-77c7-dcf5c1da4d54	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556c-8986-0491-be30c546da11	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2827 (class 0 OID 5804347)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipprogramskeenote_id_seq', 1, false);


--
-- TOC entry 2784 (class 0 OID 5803881)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 5803727)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556c-8986-e05b-0807586a213f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROohziXYSwJlsh4kihda7HEllwbDfjEJu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556c-8987-d6c2-bd4080f75d6b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556c-8987-6be5-806d892cc88a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556c-8987-ca50-05d3185cc53b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556c-8987-b673-e5b11e343ca8	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556c-8987-11f5-2776f10a0e07	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-556c-8986-efc6-c841a89f2c48	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2821 (class 0 OID 5804252)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556c-8987-b303-86f8374a6eeb	00160000-556c-8987-7ebe-c83e328f7ca3	00150000-556c-8986-97f3-1157f152c20e	00140000-556c-8986-b37d-40293fba6fbe	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556c-8987-4b3c-f93c47e92297
000e0000-556c-8987-fff4-0360fbfc8109	00160000-556c-8987-e0c7-1e5dbbd6cf19	00150000-556c-8986-58f6-ecf7e3d59993	00140000-556c-8986-0c4e-4176aedf414a	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556c-8987-7458-9330e68cf3e1
\.


--
-- TOC entry 2789 (class 0 OID 5803943)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556c-8987-9a33-f2cf6c2a45e3	000e0000-556c-8987-fff4-0360fbfc8109	1	
00200000-556c-8987-b2a5-db3cc7c07557	000e0000-556c-8987-fff4-0360fbfc8109	2	
\.


--
-- TOC entry 2804 (class 0 OID 5804068)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 5804137)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 5803975)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 5804242)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556c-8986-b37d-40293fba6fbe	Drama	drama (SURS 01)
00140000-556c-8986-29bd-443585abea2d	Opera	opera (SURS 02)
00140000-556c-8986-5069-238104480be1	Balet	balet (SURS 03)
00140000-556c-8986-7279-fc5137efad62	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556c-8986-63f9-45dcafaa2319	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556c-8986-0c4e-4176aedf414a	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556c-8986-1529-687cfe45ef31	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2810 (class 0 OID 5804127)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556c-8986-bab9-61ec36bbab6a	Opera	opera
00150000-556c-8986-eb3e-56d20bb5938f	Opereta	opereta
00150000-556c-8986-18b8-cf8aeeb12b74	Balet	balet
00150000-556c-8986-5874-0ca1f6cbb139	Plesne prireditve	plesne prireditve
00150000-556c-8986-3008-b82dfcdd78d5	Lutkovno gledališče	lutkovno gledališče
00150000-556c-8986-c2c7-8681a56678e0	Raziskovalno gledališče	raziskovalno gledališče
00150000-556c-8986-ddc0-1ff5d584a4b0	Biografska drama	biografska drama
00150000-556c-8986-97f3-1157f152c20e	Komedija	komedija
00150000-556c-8986-38c4-653cd9e7eb5f	Črna komedija	črna komedija
00150000-556c-8986-ea54-838b9350b382	E-igra	E-igra
00150000-556c-8986-58f6-ecf7e3d59993	Kriminalka	kriminalka
00150000-556c-8986-42af-9ed66c8eaf5f	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 5803781)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 5804297)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 5804287)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 5804195)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5803965)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 5803990)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 5803907)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 5804326)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5804123)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 5803941)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5803984)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 5803921)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 5804033)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 5804060)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 5803879)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5803790)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2371 (class 2606 OID 5803814)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5803770)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 5803755)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 5804066)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5804099)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 5804237)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5803843)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 5803867)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5804039)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5803857)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5803928)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5804051)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 5804179)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 5804223)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 5804337)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 5804362)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 5804344)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 5804083)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 5804024)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 5804015)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 5804217)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 5804151)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5803726)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 5804090)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 5803744)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 5803764)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 5804108)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5804046)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 5803996)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 5804382)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 5804373)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 5804368)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 5804164)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 5803823)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 5804006)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 5804206)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 5804357)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 5803892)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 5803739)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 5804267)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5803950)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 5804074)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 5804142)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 5803979)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 5804251)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 5804136)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 5803972)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 5804165)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 5804166)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 5803845)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2337 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2338 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2339 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2469 (class 1259 OID 5804067)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 5804053)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 5804052)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 5803951)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 5804124)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 5804126)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 5804125)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 5803923)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 5803922)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 5804239)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 5804240)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 5804241)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2529 (class 1259 OID 5804272)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2530 (class 1259 OID 5804269)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2531 (class 1259 OID 5804271)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2532 (class 1259 OID 5804270)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 5803894)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 5803893)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2369 (class 1259 OID 5803817)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 5804091)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 5803985)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 5803771)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 5803772)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 5804111)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 5804110)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 5804109)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 5803929)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 5803931)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 5803930)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 5804375)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 5804019)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 5804017)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 5804016)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 5804018)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 5803745)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 5803746)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 5804075)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 5804040)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2499 (class 1259 OID 5804152)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2500 (class 1259 OID 5804153)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 5804327)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 5804329)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2552 (class 1259 OID 5804328)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2382 (class 1259 OID 5803859)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 5803858)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 5803860)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2562 (class 1259 OID 5804363)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2507 (class 1259 OID 5804180)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 5804181)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2542 (class 1259 OID 5804301)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2543 (class 1259 OID 5804300)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2544 (class 1259 OID 5804303)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2545 (class 1259 OID 5804299)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2546 (class 1259 OID 5804302)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2496 (class 1259 OID 5804143)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 5804028)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 5804027)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 5804025)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 5804026)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2538 (class 1259 OID 5804289)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2539 (class 1259 OID 5804288)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 5804338)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 5803942)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 5803792)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 5803791)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 5803824)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 5803825)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 5804009)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 5804008)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 5804007)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2556 (class 1259 OID 5804346)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2557 (class 1259 OID 5804345)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 5803974)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 5803970)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 5803967)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 5803968)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 5803966)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 5803971)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 5803969)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 5803844)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 5803908)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 5803910)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 5803909)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 5803911)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 5804034)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 5804238)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 5804268)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 5803815)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 5803816)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 5804383)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 5803880)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2570 (class 1259 OID 5804374)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 5804085)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 5804084)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 5804298)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 5803868)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 5804224)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 5804225)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 5803765)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 5803973)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2601 (class 2606 OID 5804525)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2598 (class 2606 OID 5804510)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2599 (class 2606 OID 5804515)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2603 (class 2606 OID 5804535)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2597 (class 2606 OID 5804505)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2602 (class 2606 OID 5804530)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2600 (class 2606 OID 5804520)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2632 (class 2606 OID 5804680)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2633 (class 2606 OID 5804685)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 5804440)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2620 (class 2606 OID 5804620)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2619 (class 2606 OID 5804615)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2618 (class 2606 OID 5804610)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2596 (class 2606 OID 5804500)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2626 (class 2606 OID 5804650)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 5804660)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2627 (class 2606 OID 5804655)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2591 (class 2606 OID 5804475)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2590 (class 2606 OID 5804470)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2616 (class 2606 OID 5804600)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 5804705)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 5804710)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 5804715)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2643 (class 2606 OID 5804735)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2640 (class 2606 OID 5804720)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2642 (class 2606 OID 5804730)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2641 (class 2606 OID 5804725)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2589 (class 2606 OID 5804465)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2588 (class 2606 OID 5804460)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2581 (class 2606 OID 5804425)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2580 (class 2606 OID 5804420)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 5804630)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2604 (class 2606 OID 5804540)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5804400)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2577 (class 2606 OID 5804405)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2625 (class 2606 OID 5804645)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2624 (class 2606 OID 5804640)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2623 (class 2606 OID 5804635)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2592 (class 2606 OID 5804480)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2594 (class 2606 OID 5804490)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2593 (class 2606 OID 5804485)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 5804810)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2611 (class 2606 OID 5804575)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2609 (class 2606 OID 5804565)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2608 (class 2606 OID 5804560)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2610 (class 2606 OID 5804570)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2574 (class 2606 OID 5804390)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2575 (class 2606 OID 5804395)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2621 (class 2606 OID 5804625)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2617 (class 2606 OID 5804605)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2630 (class 2606 OID 5804670)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2631 (class 2606 OID 5804675)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 5804775)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 5804785)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2652 (class 2606 OID 5804780)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2586 (class 2606 OID 5804450)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2585 (class 2606 OID 5804445)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2587 (class 2606 OID 5804455)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 5804805)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2634 (class 2606 OID 5804690)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2635 (class 2606 OID 5804695)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2648 (class 2606 OID 5804760)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2647 (class 2606 OID 5804755)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2650 (class 2606 OID 5804770)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2646 (class 2606 OID 5804750)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2649 (class 2606 OID 5804765)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2629 (class 2606 OID 5804665)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2615 (class 2606 OID 5804595)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2614 (class 2606 OID 5804590)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2612 (class 2606 OID 5804580)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2613 (class 2606 OID 5804585)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2645 (class 2606 OID 5804745)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2644 (class 2606 OID 5804740)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2654 (class 2606 OID 5804790)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2595 (class 2606 OID 5804495)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2636 (class 2606 OID 5804700)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2579 (class 2606 OID 5804415)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2578 (class 2606 OID 5804410)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2582 (class 2606 OID 5804430)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2583 (class 2606 OID 5804435)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2607 (class 2606 OID 5804555)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2606 (class 2606 OID 5804550)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2605 (class 2606 OID 5804545)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2656 (class 2606 OID 5804800)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 5804795)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-01 18:34:16 CEST

--
-- PostgreSQL database dump complete
--

