--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-06-01 13:25:00 CEST

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
-- TOC entry 180 (class 1259 OID 5641830)
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
-- TOC entry 227 (class 1259 OID 5642347)
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
-- TOC entry 226 (class 1259 OID 5642330)
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
-- TOC entry 219 (class 1259 OID 5642239)
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
-- TOC entry 194 (class 1259 OID 5642009)
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
-- TOC entry 197 (class 1259 OID 5642043)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5641952)
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
-- TOC entry 228 (class 1259 OID 5642361)
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
-- TOC entry 213 (class 1259 OID 5642169)
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
-- TOC entry 192 (class 1259 OID 5641989)
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
-- TOC entry 196 (class 1259 OID 5642037)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5641969)
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
-- TOC entry 202 (class 1259 OID 5642086)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5642111)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5641926)
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
-- TOC entry 181 (class 1259 OID 5641839)
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
-- TOC entry 182 (class 1259 OID 5641850)
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
-- TOC entry 177 (class 1259 OID 5641804)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5641823)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5642118)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5642149)
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
-- TOC entry 223 (class 1259 OID 5642283)
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
-- TOC entry 184 (class 1259 OID 5641883)
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
-- TOC entry 186 (class 1259 OID 5641918)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5642092)
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
-- TOC entry 185 (class 1259 OID 5641903)
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
-- TOC entry 191 (class 1259 OID 5641981)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5642104)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5642224)
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
-- TOC entry 222 (class 1259 OID 5642275)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 5642387)
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
-- TOC entry 232 (class 1259 OID 5642415)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 5642445)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 5642396)
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
-- TOC entry 236 (class 1259 OID 5642441)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 5642133)
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
-- TOC entry 201 (class 1259 OID 5642077)
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
-- TOC entry 200 (class 1259 OID 5642067)
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
-- TOC entry 221 (class 1259 OID 5642264)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5642201)
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
-- TOC entry 174 (class 1259 OID 5641775)
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
-- TOC entry 173 (class 1259 OID 5641773)
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
-- TOC entry 210 (class 1259 OID 5642143)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5641813)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5641797)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5642157)
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
-- TOC entry 204 (class 1259 OID 5642098)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5642048)
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
-- TOC entry 235 (class 1259 OID 5642433)
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
-- TOC entry 234 (class 1259 OID 5642426)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 5642421)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5642211)
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
-- TOC entry 183 (class 1259 OID 5641875)
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
-- TOC entry 199 (class 1259 OID 5642054)
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
-- TOC entry 220 (class 1259 OID 5642253)
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
-- TOC entry 231 (class 1259 OID 5642404)
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
-- TOC entry 237 (class 1259 OID 5642443)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 5641938)
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
-- TOC entry 175 (class 1259 OID 5641784)
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
-- TOC entry 225 (class 1259 OID 5642309)
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
-- TOC entry 193 (class 1259 OID 5642000)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5642125)
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
-- TOC entry 215 (class 1259 OID 5642194)
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
-- TOC entry 195 (class 1259 OID 5642032)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5642299)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5642184)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 5641778)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2776 (class 0 OID 5641830)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 5642347)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556c-410b-07ea-5ce936e364db	000d0000-556c-410b-acb3-7b060a4c7547	\N	00090000-556c-410b-9530-5671e5443208	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556c-410b-da24-08c200763d57	000d0000-556c-410b-f39e-aa508a4da04a	\N	00090000-556c-410b-90b1-9dcc28d4885b	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556c-410b-d603-2de7ed171c0a	000d0000-556c-410b-be62-a5a6f717b924	\N	00090000-556c-410b-e25f-a917da034a34	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556c-410b-5545-472be23da353	000d0000-556c-410b-670a-a2acaca2cc39	\N	00090000-556c-410b-44cb-15fe59ce4bd9	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556c-410b-1f0d-2d954fd48122	000d0000-556c-410b-4da3-e76a21b4525e	\N	00090000-556c-410b-b2c2-838bde93065a	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2822 (class 0 OID 5642330)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 5642239)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556c-410b-181a-55272026eadf	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556c-410b-d06d-59f4d7d60800	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556c-410b-8c28-576f77dfaa57	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2790 (class 0 OID 5642009)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556c-410b-1f47-bb97608ba9e9	\N	\N	00200000-556c-410b-7742-356a788c4e49	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556c-410b-4e51-13f9e9596a09	\N	\N	00200000-556c-410b-dd09-b6cc0ffb59e9	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556c-410b-2fb1-641dede778c0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
\.


--
-- TOC entry 2793 (class 0 OID 5642043)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 5641952)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556c-410a-6931-bb323ecf7efe	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556c-410a-e8b3-fb489ed3103e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556c-410a-9ce7-715c444878b6	AL	ALB	008	Albania 	Albanija	\N
00040000-556c-410a-2ddc-9706fdd56781	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556c-410a-2cdd-cf2f00b7e7f6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556c-410a-2081-a328954884df	AD	AND	020	Andorra 	Andora	\N
00040000-556c-410a-93a6-cf3c345b268d	AO	AGO	024	Angola 	Angola	\N
00040000-556c-410a-2431-28cea0545694	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556c-410a-f573-7f8b4b37f668	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556c-410a-1048-40423251b1f4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-410a-c40d-04d0c65d5cf5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556c-410a-b987-b8b060dc99c2	AM	ARM	051	Armenia 	Armenija	\N
00040000-556c-410a-b5e9-8712bf554382	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556c-410a-a208-bb40a53b3050	AU	AUS	036	Australia 	Avstralija	\N
00040000-556c-410a-17ed-d2b0f1af9b3d	AT	AUT	040	Austria 	Avstrija	\N
00040000-556c-410a-e1fe-df4bc2347377	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556c-410a-608a-46961412ce8a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556c-410a-04dc-a84492e6bdeb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556c-410a-5a81-ebffdc77809b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556c-410a-7a89-09d0663ba76f	BB	BRB	052	Barbados 	Barbados	\N
00040000-556c-410a-bfd5-f587ecf124d4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556c-410a-e3c1-8dc0a44d8ee1	BE	BEL	056	Belgium 	Belgija	\N
00040000-556c-410a-28d5-4c7daa5916d9	BZ	BLZ	084	Belize 	Belize	\N
00040000-556c-410a-4910-903b59e1cca4	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556c-410a-126a-e42b5a766960	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556c-410a-1893-48b409f84306	BT	BTN	064	Bhutan 	Butan	\N
00040000-556c-410a-dcb4-53a1c0b8d12d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556c-410a-ee3d-e60869913922	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556c-410a-9c09-22273ed89365	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556c-410a-037a-320b1bb7b836	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556c-410a-5aa7-11233b0a64d6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556c-410a-ea9d-53fed9b2260b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556c-410a-3d0d-348694d7826d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556c-410a-3894-286c0a1854ee	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556c-410a-fef9-f5a419879b7e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556c-410a-d55c-d37fb4610f37	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556c-410a-20cc-ec889f825c2f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556c-410a-8173-ca4b0cb1eb72	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556c-410a-ef0a-e77bde7508de	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556c-410a-0825-cb9fbab841c4	CA	CAN	124	Canada 	Kanada	\N
00040000-556c-410a-4fee-9196cf0e53d8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556c-410a-5e04-0601f3105283	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556c-410a-24b3-61e457fafbf1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556c-410a-36ed-d48490ee3f4d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556c-410a-53a5-d8c9200bec9a	CL	CHL	152	Chile 	Čile	\N
00040000-556c-410a-08d6-9b4f13c9cb00	CN	CHN	156	China 	Kitajska	\N
00040000-556c-410a-0f50-c7aff0ac0431	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556c-410a-ae28-dc8771708ae3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556c-410a-dbe0-68fd9826521b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556c-410a-e598-0c4141753837	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556c-410a-b2cc-1f9d81a046ec	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556c-410a-eb92-d0fbcecc3b83	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556c-410a-241a-0735ac86de70	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556c-410a-1b58-89d206a1c44a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556c-410a-527a-438b3393d73d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556c-410a-3652-1bf722a22ebb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556c-410a-194c-60f1b1f09abc	CU	CUB	192	Cuba 	Kuba	\N
00040000-556c-410a-b0b7-aaa974a0b266	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556c-410a-0a25-6711559f7cf5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556c-410a-3b47-35b3e0e99367	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556c-410a-213c-923bb07896ed	DK	DNK	208	Denmark 	Danska	\N
00040000-556c-410a-60ac-6d6dfa20d280	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556c-410a-7755-f84bb67765c8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-410a-b143-f84b3d27026e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556c-410a-55ca-564e3c10e568	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556c-410a-3d2c-f1173d82dcad	EG	EGY	818	Egypt 	Egipt	\N
00040000-556c-410a-2530-343ef311af90	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556c-410a-ec72-20c967d19c39	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556c-410a-187a-8f4c0091de15	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556c-410a-44ce-899f1e8e6fe5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556c-410a-acea-987287a913a4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556c-410a-b6f5-a7257e29cad2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556c-410a-f927-4327114fe048	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556c-410a-b47a-1094485ac31c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556c-410a-5c7c-df897a2ae985	FI	FIN	246	Finland 	Finska	\N
00040000-556c-410a-fbe9-f09f05648ba0	FR	FRA	250	France 	Francija	\N
00040000-556c-410a-6057-a78b2c4d3c50	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556c-410a-29de-ebeafaff55fe	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556c-410a-968f-ca3fe7f5b5ca	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556c-410a-8329-31f147176d76	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556c-410a-2994-eb0d9cc6b090	GA	GAB	266	Gabon 	Gabon	\N
00040000-556c-410a-149f-cc6328a3968f	GM	GMB	270	Gambia 	Gambija	\N
00040000-556c-410a-9b82-b8c8d4fe4221	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556c-410a-685b-f36e01b51b6a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556c-410a-16a0-375203407799	GH	GHA	288	Ghana 	Gana	\N
00040000-556c-410a-0b20-523858511e7e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556c-410a-946d-de89a2a1d86c	GR	GRC	300	Greece 	Grčija	\N
00040000-556c-410a-6e81-b37b3086deb1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556c-410a-8996-48721f673a79	GD	GRD	308	Grenada 	Grenada	\N
00040000-556c-410a-8e18-1c8da07c3678	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556c-410a-f698-915ae9cb7101	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556c-410a-a4df-6b26314d8a1b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556c-410a-071a-b8f5218af2d4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556c-410a-b8d3-c05a2dc12714	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556c-410a-62a5-d428f747ce8d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556c-410a-eaf7-fbee832b95e6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556c-410a-5e77-a03766e11812	HT	HTI	332	Haiti 	Haiti	\N
00040000-556c-410a-d478-2732766f6c35	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556c-410a-b755-1a783d0da07b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556c-410a-3d78-a257d514ef1b	HN	HND	340	Honduras 	Honduras	\N
00040000-556c-410a-05f6-b6c62003e8aa	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556c-410a-794a-5fcc90933b4c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556c-410a-6d87-4279d9e5bb95	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556c-410a-60ff-c0f551356a50	IN	IND	356	India 	Indija	\N
00040000-556c-410a-2356-7ce13ce4b411	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556c-410a-6bbb-d9c8ef63ab81	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556c-410a-412b-03f8307ad201	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556c-410a-3c83-1469c2443acd	IE	IRL	372	Ireland 	Irska	\N
00040000-556c-410a-f1e2-7225e89dc162	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556c-410a-c811-a81c6cffbf54	IL	ISR	376	Israel 	Izrael	\N
00040000-556c-410a-bff6-84d72d94e19f	IT	ITA	380	Italy 	Italija	\N
00040000-556c-410a-d00f-86abc1036850	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556c-410a-b8bb-e8bcc99102c7	JP	JPN	392	Japan 	Japonska	\N
00040000-556c-410a-9672-9443f10808ba	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556c-410a-fb37-1dc31d7cc30d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556c-410a-359d-8220b25fcbfd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556c-410a-97c3-17d4d7ad65e2	KE	KEN	404	Kenya 	Kenija	\N
00040000-556c-410a-b006-b61e5d6a5c43	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556c-410a-96a4-020eb70c8b95	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556c-410a-f53e-b2717c02001b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556c-410a-ac79-4115161d7fad	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556c-410a-1a55-7019c96b2b8a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556c-410a-efce-a24e38a2519b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556c-410a-24e5-f8090f890b24	LV	LVA	428	Latvia 	Latvija	\N
00040000-556c-410a-bb13-4028f9af9a3b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556c-410a-2337-acbf07f21634	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556c-410a-b7e9-9b361c3d5d42	LR	LBR	430	Liberia 	Liberija	\N
00040000-556c-410a-0082-794ad1ab31b6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556c-410a-206e-0c2a187bbdb6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556c-410a-19f5-540187b5d5b6	LT	LTU	440	Lithuania 	Litva	\N
00040000-556c-410a-31be-fac8d8cc2571	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556c-410a-2548-068be890645f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556c-410a-07f1-590d642bc47c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556c-410a-3485-e6557fd11069	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556c-410a-f63b-236d48f0fdcf	MW	MWI	454	Malawi 	Malavi	\N
00040000-556c-410a-4394-a5d86f31d871	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556c-410a-3e72-f42de2dd135d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556c-410a-c1ee-607ae7e04691	ML	MLI	466	Mali 	Mali	\N
00040000-556c-410a-541f-174983744a39	MT	MLT	470	Malta 	Malta	\N
00040000-556c-410a-c604-957a16a645db	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556c-410a-5650-980b35139898	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556c-410a-d2c7-025a0ce92462	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556c-410a-43f7-8f6d5defafa7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556c-410a-4b61-e06b046bf593	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556c-410a-bd37-3bc6ef39e883	MX	MEX	484	Mexico 	Mehika	\N
00040000-556c-410a-d33d-e5647f79bd95	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556c-410a-3029-f5869d0c87ea	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556c-410a-2ffd-4a42c62d31fb	MC	MCO	492	Monaco 	Monako	\N
00040000-556c-410a-2d25-7ab37e765233	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556c-410a-d14b-d39d558ea533	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556c-410a-4e05-798f4561386a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556c-410a-69e5-3bf6aadc144b	MA	MAR	504	Morocco 	Maroko	\N
00040000-556c-410a-8433-aed966c7139c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556c-410a-4b73-ceed6fa17cb3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556c-410a-4428-9c5933e13c17	NA	NAM	516	Namibia 	Namibija	\N
00040000-556c-410a-4db2-efee1716456d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556c-410a-8861-e53796c3acc0	NP	NPL	524	Nepal 	Nepal	\N
00040000-556c-410a-b446-8932bf3c735b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556c-410a-a0e7-d0d44c43ea74	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556c-410a-22e0-6d5be9f24950	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556c-410a-d540-a8a1dd149aa7	NE	NER	562	Niger 	Niger 	\N
00040000-556c-410a-0493-90654677f8ac	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556c-410a-6140-1a223acd72b5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556c-410a-7fb6-6cfa49d88009	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556c-410a-d896-1d891f1afc18	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556c-410a-f271-10f52a07d0a4	NO	NOR	578	Norway 	Norveška	\N
00040000-556c-410a-7921-5853e44f4288	OM	OMN	512	Oman 	Oman	\N
00040000-556c-410a-3b83-64470f218672	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556c-410a-6d9a-910efd23e284	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556c-410a-dae8-c766b7fe4c90	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556c-410a-dd4e-456aa62ecf53	PA	PAN	591	Panama 	Panama	\N
00040000-556c-410a-1c66-d8b2b9cad004	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556c-410a-97b7-f093edff3f73	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556c-410a-c761-195d8ea80f7b	PE	PER	604	Peru 	Peru	\N
00040000-556c-410a-aeab-f4628f8eefcb	PH	PHL	608	Philippines 	Filipini	\N
00040000-556c-410a-7c56-2686aa53ab08	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556c-410a-f9bf-c9f10725f5c5	PL	POL	616	Poland 	Poljska	\N
00040000-556c-410a-ad40-b046c2d3b8e9	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556c-410a-b213-a4f505cff31b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556c-410a-1413-5996df9a9ebd	QA	QAT	634	Qatar 	Katar	\N
00040000-556c-410a-c445-90df2e188724	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556c-410a-5dee-d6f02bfc75c0	RO	ROU	642	Romania 	Romunija	\N
00040000-556c-410a-7592-3704e0f89738	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556c-410a-2b28-24daf0a3daf7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556c-410a-7a76-d96adc933af1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556c-410a-4813-489a087d8fb8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556c-410a-1e53-339ea56c5d81	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556c-410a-a16f-9972236c33a0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556c-410a-c43a-78c93fe49676	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556c-410a-ba58-f72b7231ca90	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556c-410a-a3a5-1bf9344808ec	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556c-410a-efba-a9f92a0bd7cc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556c-410a-c69b-0628ea529e7d	SM	SMR	674	San Marino 	San Marino	\N
00040000-556c-410a-d885-7775a21e1fcb	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556c-410a-8242-d1de5ed31bf8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556c-410a-a83b-5809667ef1df	SN	SEN	686	Senegal 	Senegal	\N
00040000-556c-410a-b3b0-13066a9169a3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556c-410a-fb99-c0b28ddfd565	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556c-410a-9886-9140dc75e952	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556c-410a-bd38-0f38d0af2592	SG	SGP	702	Singapore 	Singapur	\N
00040000-556c-410a-1c43-7d49ade6cb87	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556c-410a-7607-b59ec018e6aa	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556c-410a-e5ee-bb72c56f6828	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556c-410a-e35f-eff4c766b413	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556c-410a-862c-2572ccb881e3	SO	SOM	706	Somalia 	Somalija	\N
00040000-556c-410a-fd7b-7c8e376ebf1b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556c-410a-5a9f-9e214d2911e1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556c-410a-0ff4-a0db1d7c6926	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556c-410a-d4f0-a45a1111edb2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556c-410a-12fc-9cc001cf4208	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556c-410a-7a2b-a75ed0d52e4c	SD	SDN	729	Sudan 	Sudan	\N
00040000-556c-410a-ee5a-fa1c496bff0c	SR	SUR	740	Suriname 	Surinam	\N
00040000-556c-410a-9a24-d58de048129e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556c-410a-2fe8-b0267917a218	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556c-410a-ff26-98a343be6d77	SE	SWE	752	Sweden 	Švedska	\N
00040000-556c-410a-395a-b68cdec945c0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556c-410a-b19b-52d213e82cdf	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556c-410a-fe1e-b8acff3284cd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556c-410a-8a96-6b9a9152f6f6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556c-410a-4e71-d46b585f9a36	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556c-410a-50c0-057c83d17480	TH	THA	764	Thailand 	Tajska	\N
00040000-556c-410a-a346-2cadd0c0a37c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556c-410a-2143-291988bd2dd8	TG	TGO	768	Togo 	Togo	\N
00040000-556c-410a-49a4-64cd48892cae	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556c-410a-ca4c-bd11dc02b5df	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556c-410a-0c63-734785750deb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556c-410a-8a87-1990f519f7a3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556c-410a-a19d-26c85613a28e	TR	TUR	792	Turkey 	Turčija	\N
00040000-556c-410a-7640-45ce86a5c78e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556c-410a-b08a-21b6e4d12d79	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-410a-4bec-6eddb377370c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556c-410a-9e23-be0f4853a54e	UG	UGA	800	Uganda 	Uganda	\N
00040000-556c-410a-5340-f9969b3be601	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556c-410a-b0c5-e25765126074	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556c-410a-6e48-cdf770052fd6	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556c-410a-d179-717920dd853d	US	USA	840	United States 	Združene države Amerike	\N
00040000-556c-410a-962f-07744201ff88	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556c-410a-d23a-01853204e0b4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556c-410a-fe31-bd11e99da5a1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556c-410a-2535-97bd9ee9ca1b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556c-410a-2cd5-af5d2197b2f7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556c-410a-2612-a63d06feceee	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556c-410a-2f63-a8150b685e4b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-410a-25dc-8b171f44884f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556c-410a-2384-3f601adca2e6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556c-410a-b2d7-a4b51d8451f8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556c-410a-8051-26f433e77826	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556c-410a-4e51-c20d7c61f241	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556c-410a-bd04-e4f18864d799	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2824 (class 0 OID 5642361)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 5642169)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-556c-410b-17c7-4e688b78db44	000e0000-556c-410b-0b76-13d817c9a858	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556c-410a-dcb8-bd8c4a378b98
000d0000-556c-410b-acb3-7b060a4c7547	000e0000-556c-410b-0b76-13d817c9a858	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556c-410a-dcb8-bd8c4a378b98
000d0000-556c-410b-f39e-aa508a4da04a	000e0000-556c-410b-0b76-13d817c9a858	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556c-410a-18e3-2ecd6708a2c4
000d0000-556c-410b-be62-a5a6f717b924	000e0000-556c-410b-0b76-13d817c9a858	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556c-410a-206f-2dacd864f4e8
000d0000-556c-410b-670a-a2acaca2cc39	000e0000-556c-410b-0b76-13d817c9a858	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556c-410a-206f-2dacd864f4e8
000d0000-556c-410b-4da3-e76a21b4525e	000e0000-556c-410b-0b76-13d817c9a858	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556c-410a-206f-2dacd864f4e8
\.


--
-- TOC entry 2788 (class 0 OID 5641989)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 5642037)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 5641969)
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
-- TOC entry 2798 (class 0 OID 5642086)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 5642111)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 5641926)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556c-410a-4f26-8390c57eb9b8	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556c-410a-dd8c-6f9f3c896b38	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556c-410a-026a-37f4432c129f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556c-410a-c725-e7f3827e53ed	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556c-410a-24f7-23c6ed3a8548	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556c-410a-20ff-60c1fd25065f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556c-410a-438a-e430d1ce5cfd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556c-410a-3d94-3dab502f727d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556c-410a-a3fb-64d74797aab1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556c-410a-33fa-247d048aad7e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556c-410a-e97e-59e8c0fb90a7	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556c-410a-2a23-f8c3da13e7b8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556c-410a-b80c-d2402278148f	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-410a-b685-c4c8ebc0d890	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-410a-b525-a81f6cba4dea	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556c-410a-2d51-ce4013f6105f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2777 (class 0 OID 5641839)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556c-410a-b11c-6b89b7fdc86e	00000000-556c-410a-24f7-23c6ed3a8548	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556c-410a-fae3-d2f113f5f672	00000000-556c-410a-24f7-23c6ed3a8548	00010000-556c-410a-eb99-8e3ae2d9b5b2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556c-410a-a68d-d78eb1720baf	00000000-556c-410a-20ff-60c1fd25065f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2778 (class 0 OID 5641850)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556c-410b-7bbe-f82c63db8303	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556c-410b-44cb-15fe59ce4bd9	00010000-556c-410b-4cef-0a0fb8bee4b3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556c-410b-e25f-a917da034a34	00010000-556c-410b-07ee-e667fd1d9a3c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556c-410b-8a3d-e0e879bc7bb2	\N	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556c-410b-8faa-813b7faf8811	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556c-410b-e561-2cca156873d9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556c-410b-a042-4469674f954d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556c-410b-f288-d00ed68b5bd3	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556c-410b-9530-5671e5443208	00010000-556c-410b-e28f-59854827c501	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556c-410b-90b1-9dcc28d4885b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556c-410b-1f5b-dc20280487bc	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556c-410b-b2c2-838bde93065a	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556c-410b-f5e4-6a23fd279ce3	00010000-556c-410b-4689-27385fe0d84e	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2768 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 5641804)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556c-410a-59c6-882fb7f3fff6	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556c-410a-ec88-178fd48a4b61	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556c-410a-5725-9c36302100e3	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556c-410a-7f79-eda5c778ac76	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556c-410a-9b8a-d4e1f6342e95	Abonma-read	Abonma - branje	f
00030000-556c-410a-eb53-c7ef360d5589	Abonma-write	Abonma - spreminjanje	f
00030000-556c-410a-400f-2cf922d0a65f	Alternacija-read	Alternacija - branje	f
00030000-556c-410a-6576-d95189cef770	Alternacija-write	Alternacija - spreminjanje	f
00030000-556c-410a-0527-2a50b566d013	Arhivalija-read	Arhivalija - branje	f
00030000-556c-410a-be9c-fe9db4a46383	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556c-410a-bcf9-2e2b20f39e0d	Besedilo-read	Besedilo - branje	f
00030000-556c-410a-e375-91417778e680	Besedilo-write	Besedilo - spreminjanje	f
00030000-556c-410a-6d9f-50304226da71	DogodekIzven-read	DogodekIzven - branje	f
00030000-556c-410a-3b5b-334583849f78	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556c-410a-a406-39522a78bce2	Dogodek-read	Dogodek - branje	f
00030000-556c-410a-2d77-0141593b377c	Dogodek-write	Dogodek - spreminjanje	f
00030000-556c-410a-3ad0-8488c576b7e2	Drzava-read	Drzava - branje	f
00030000-556c-410a-cda8-89074b335535	Drzava-write	Drzava - spreminjanje	f
00030000-556c-410a-148d-6060aeb4022b	Funkcija-read	Funkcija - branje	f
00030000-556c-410a-c0d0-daa8c0903ec4	Funkcija-write	Funkcija - spreminjanje	f
00030000-556c-410a-cf78-58a1006440f0	Gostovanje-read	Gostovanje - branje	f
00030000-556c-410a-7ae9-e18c3932289b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556c-410a-6ebc-c048ff46b3b9	Gostujoca-read	Gostujoca - branje	f
00030000-556c-410a-6a1f-398da0c3ad0d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556c-410a-56cb-f3dc83267e12	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556c-410a-c950-c37c16d919e5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556c-410a-f5aa-27d498857fff	Kupec-read	Kupec - branje	f
00030000-556c-410a-a980-050f0b1ae8c2	Kupec-write	Kupec - spreminjanje	f
00030000-556c-410a-9430-32b720ff8ff3	NacinPlacina-read	NacinPlacina - branje	f
00030000-556c-410a-bf25-604929beba07	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556c-410a-f6e9-61b5b77e6495	Option-read	Option - branje	f
00030000-556c-410a-ec35-0c61b28857c4	Option-write	Option - spreminjanje	f
00030000-556c-410a-a077-7f57130e383f	OptionValue-read	OptionValue - branje	f
00030000-556c-410a-0564-8a12c7b1ad03	OptionValue-write	OptionValue - spreminjanje	f
00030000-556c-410a-b536-368363155650	Oseba-read	Oseba - branje	f
00030000-556c-410a-3018-5a3e507afeb3	Oseba-write	Oseba - spreminjanje	f
00030000-556c-410a-cc95-d0cfc0c0bef3	Permission-read	Permission - branje	f
00030000-556c-410a-99dc-0661f9e4edcd	Permission-write	Permission - spreminjanje	f
00030000-556c-410a-691c-d3f6e433d80b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556c-410a-dc99-0a6540dff475	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556c-410a-e26f-1f33d4cba7e8	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556c-410a-033c-2ec4ba9076d5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556c-410a-b89b-4a0a09f2f5c4	Pogodba-read	Pogodba - branje	f
00030000-556c-410a-3897-b2d0eb3d9ea8	Pogodba-write	Pogodba - spreminjanje	f
00030000-556c-410a-06dd-18daa7cad320	Popa-read	Popa - branje	f
00030000-556c-410a-b0ae-0c7f4f0d1c13	Popa-write	Popa - spreminjanje	f
00030000-556c-410a-71bb-6777bd287f3d	Posta-read	Posta - branje	f
00030000-556c-410a-45f9-c3feb41b6611	Posta-write	Posta - spreminjanje	f
00030000-556c-410a-cd7c-b9b1efcbbb1a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556c-410a-ea29-c3df97bb0939	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556c-410a-58e3-dd1df6fcb636	PostniNaslov-read	PostniNaslov - branje	f
00030000-556c-410a-f10a-af4d52d25f06	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556c-410a-c289-75c4bb2f9e61	Predstava-read	Predstava - branje	f
00030000-556c-410a-4a1a-1983cc447e13	Predstava-write	Predstava - spreminjanje	f
00030000-556c-410a-70db-7648c3700c4c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556c-410a-98d8-6ca8b8c1fff7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556c-410a-283e-c3677f472537	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556c-410a-e44d-c631c76c21ca	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556c-410a-f9b2-a4383ff769d3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556c-410a-8ee5-467f6a1ef69d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556c-410a-1d63-90703a94de46	Prostor-read	Prostor - branje	f
00030000-556c-410a-555e-c72986cd6cb9	Prostor-write	Prostor - spreminjanje	f
00030000-556c-410a-10f0-66c179f68711	Racun-read	Racun - branje	f
00030000-556c-410a-ec26-e69d82bf72fd	Racun-write	Racun - spreminjanje	f
00030000-556c-410a-77ee-f80c2cc0ff9b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556c-410a-d901-46a8d434fdab	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556c-410a-68df-51518ecdc9d9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556c-410a-3cbd-668eeefaaae9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556c-410a-f899-5b286b314537	Rekvizit-read	Rekvizit - branje	f
00030000-556c-410a-dead-e4dd03dbec5a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556c-410a-0cc9-c764e73694a9	Revizija-read	Revizija - branje	f
00030000-556c-410a-38cd-6b4bc684233f	Revizija-write	Revizija - spreminjanje	f
00030000-556c-410a-7be1-799dde4af8cb	Rezervacija-read	Rezervacija - branje	f
00030000-556c-410a-167e-5683dff07c55	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556c-410a-cde9-348be8908908	Role-read	Role - branje	f
00030000-556c-410a-8466-37bf50718214	Role-write	Role - spreminjanje	f
00030000-556c-410a-b830-a6284b0cb2c5	SedezniRed-read	SedezniRed - branje	f
00030000-556c-410a-a4bc-ff871388897c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556c-410a-ecda-ef381f716f65	Sedez-read	Sedez - branje	f
00030000-556c-410a-cf05-ca3d7834e5f9	Sedez-write	Sedez - spreminjanje	f
00030000-556c-410a-49a2-39c65071a045	Sezona-read	Sezona - branje	f
00030000-556c-410a-097f-d585fc641113	Sezona-write	Sezona - spreminjanje	f
00030000-556c-410a-a827-8494d313dcc2	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556c-410a-b761-cf7a82bfed5e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556c-410a-7190-1b5b5f00dc26	Stevilcenje-read	Stevilcenje - branje	f
00030000-556c-410a-d324-db936cb63330	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556c-410a-b5e0-af683bf46456	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556c-410a-5838-51dec15da6ab	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556c-410a-3772-f473319feed9	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556c-410a-0be9-6e25187ef179	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556c-410a-69f1-f8f916558e01	Telefonska-read	Telefonska - branje	f
00030000-556c-410a-69f7-78bd6b6f7def	Telefonska-write	Telefonska - spreminjanje	f
00030000-556c-410a-6b01-4ac71b5dc14b	TerminStoritve-read	TerminStoritve - branje	f
00030000-556c-410a-a35c-535aeb41a5d6	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556c-410a-4232-439345e7a820	TipFunkcije-read	TipFunkcije - branje	f
00030000-556c-410a-ece9-8a970af8cadc	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556c-410a-1344-aff80515c257	Trr-read	Trr - branje	f
00030000-556c-410a-af3f-689f0cba2980	Trr-write	Trr - spreminjanje	f
00030000-556c-410a-06ac-db22de5c865a	Uprizoritev-read	Uprizoritev - branje	f
00030000-556c-410a-9088-88b0635bb113	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556c-410a-fc86-28bdab45d7e1	User-read	User - branje	f
00030000-556c-410a-4389-d8a7b3151c19	User-write	User - spreminjanje	f
00030000-556c-410a-3079-e90b29184588	Vaja-read	Vaja - branje	f
00030000-556c-410a-4684-b404253a72fe	Vaja-write	Vaja - spreminjanje	f
00030000-556c-410a-5ed6-67c7d1dadb46	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556c-410a-888e-2422fafbb5fd	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556c-410a-0113-0d3154d1c6c3	Zaposlitev-read	Zaposlitev - branje	f
00030000-556c-410a-7e57-c7857d60d835	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556c-410a-dfc3-b94c2082a71b	Zasedenost-read	Zasedenost - branje	f
00030000-556c-410a-78e5-3608eb952a6b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556c-410a-a701-5414719f0621	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556c-410a-baf6-5bedf8035088	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556c-410a-f802-6f22138b5410	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556c-410a-0e01-4bef48b77d21	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2775 (class 0 OID 5641823)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556c-410a-f9d9-a9715ad8a07a	00030000-556c-410a-3ad0-8488c576b7e2
00020000-556c-410a-c7f0-4a3e86b92def	00030000-556c-410a-cda8-89074b335535
00020000-556c-410a-c7f0-4a3e86b92def	00030000-556c-410a-3ad0-8488c576b7e2
\.


--
-- TOC entry 2803 (class 0 OID 5642118)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 5642149)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 5642283)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 5641883)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556c-410b-7b83-efdc8e13711f	00040000-556c-410a-6931-bb323ecf7efe	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556c-410b-ea61-ef5f7618298e	00040000-556c-410a-6931-bb323ecf7efe	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2782 (class 0 OID 5641918)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556c-410a-f4f3-42ca7235bc71	8341	Adlešiči
00050000-556c-410a-9b9d-53b2dbc03435	5270	Ajdovščina
00050000-556c-410a-fd8c-d403eef7db10	6280	Ankaran/Ancarano
00050000-556c-410a-f934-4de621d47f54	9253	Apače
00050000-556c-410a-5bdb-4f3bb9aa7252	8253	Artiče
00050000-556c-410a-667d-404b0caeed0f	4275	Begunje na Gorenjskem
00050000-556c-410a-4c8b-4cee2ce3f9fd	1382	Begunje pri Cerknici
00050000-556c-410a-ed99-b8896cff0448	9231	Beltinci
00050000-556c-410a-9e5c-e8e29f8e4320	2234	Benedikt
00050000-556c-410a-7f33-4678a62705a6	2345	Bistrica ob Dravi
00050000-556c-410a-0b2d-cb1b085e6fa5	3256	Bistrica ob Sotli
00050000-556c-410a-3fdd-eaeef7236fe1	8259	Bizeljsko
00050000-556c-410a-a5e0-a1f67a3bd21f	1223	Blagovica
00050000-556c-410a-3098-e4c41ca3233f	8283	Blanca
00050000-556c-410a-b7b6-db14574afb06	4260	Bled
00050000-556c-410a-6a67-f8a4e0e8c422	4273	Blejska Dobrava
00050000-556c-410a-c17b-fb3e8fafaa50	9265	Bodonci
00050000-556c-410a-5cc2-7d24136e9ca5	9222	Bogojina
00050000-556c-410a-55e8-1d3be8e42e23	4263	Bohinjska Bela
00050000-556c-410a-e662-04856639a9db	4264	Bohinjska Bistrica
00050000-556c-410a-582c-0c048d9034f2	4265	Bohinjsko jezero
00050000-556c-410a-2c51-f9fcdb1229a8	1353	Borovnica
00050000-556c-410a-cd7e-66371705a60b	8294	Boštanj
00050000-556c-410a-a5ff-02f57e73fee7	5230	Bovec
00050000-556c-410a-8361-e069c73381c8	5295	Branik
00050000-556c-410a-be1b-82f483a3792b	3314	Braslovče
00050000-556c-410a-9b38-8f6c23ee8a5c	5223	Breginj
00050000-556c-410a-cf32-c11f42223202	8280	Brestanica
00050000-556c-410a-2678-69496728b905	2354	Bresternica
00050000-556c-410a-f3da-7263e54f78c0	4243	Brezje
00050000-556c-410a-e172-36952f6d3629	1351	Brezovica pri Ljubljani
00050000-556c-410a-ad0a-5a60532951ab	8250	Brežice
00050000-556c-410a-3f99-444bf3d997df	4210	Brnik - Aerodrom
00050000-556c-410a-85b9-60468a46cb11	8321	Brusnice
00050000-556c-410a-e802-b476216d9550	3255	Buče
00050000-556c-410a-5764-43a5417e8bf0	8276	Bučka 
00050000-556c-410a-c8c8-801e84f2afbf	9261	Cankova
00050000-556c-410a-0fd0-7a937105777c	3000	Celje 
00050000-556c-410a-de81-dd256b44c783	3001	Celje - poštni predali
00050000-556c-410a-4318-f1f58067512e	4207	Cerklje na Gorenjskem
00050000-556c-410a-4673-4fb258a8c2d6	8263	Cerklje ob Krki
00050000-556c-410a-62fe-027cbe7e814d	1380	Cerknica
00050000-556c-410a-1c2a-defb12c9a36e	5282	Cerkno
00050000-556c-410a-cf1e-ccfaf7797595	2236	Cerkvenjak
00050000-556c-410a-4086-aaba5cc41ab7	2215	Ceršak
00050000-556c-410a-01de-8f647f3b0f5a	2326	Cirkovce
00050000-556c-410a-9a34-7146b7b96ae7	2282	Cirkulane
00050000-556c-410a-33c1-1a803e5971d7	5273	Col
00050000-556c-410a-b3fb-f1a0622c9f81	8251	Čatež ob Savi
00050000-556c-410a-53b7-8a149f657b64	1413	Čemšenik
00050000-556c-410a-22f3-423d7f6cd359	5253	Čepovan
00050000-556c-410a-a7b8-7438c8f56096	9232	Črenšovci
00050000-556c-410a-2d04-d4aa3a5a3af1	2393	Črna na Koroškem
00050000-556c-410a-68f9-ca8baa8ca2ec	6275	Črni Kal
00050000-556c-410a-5713-84ef31f0f892	5274	Črni Vrh nad Idrijo
00050000-556c-410a-cd3d-56d339d73fa9	5262	Črniče
00050000-556c-410a-a068-ef3c602c971d	8340	Črnomelj
00050000-556c-410a-67f8-7d5e6e9dca6c	6271	Dekani
00050000-556c-410a-8131-158bea77ea9d	5210	Deskle
00050000-556c-410a-bcad-2cad59bedb9b	2253	Destrnik
00050000-556c-410a-7904-1c472fd981dd	6215	Divača
00050000-556c-410a-7b05-7701189c5ddb	1233	Dob
00050000-556c-410a-03a1-9b0b4179dcfb	3224	Dobje pri Planini
00050000-556c-410a-9d97-13154ea284a7	8257	Dobova
00050000-556c-410a-05c4-bbb6f6ee12d5	1423	Dobovec
00050000-556c-410a-7cd4-df9ef200bb0c	5263	Dobravlje
00050000-556c-410a-b12d-d8cc425e13d5	3204	Dobrna
00050000-556c-410a-d039-cc17eb6cbb7e	8211	Dobrnič
00050000-556c-410a-ea96-32ec14e7325c	1356	Dobrova
00050000-556c-410a-d04a-9e333c79b168	9223	Dobrovnik/Dobronak 
00050000-556c-410a-90ee-4193cb958aa2	5212	Dobrovo v Brdih
00050000-556c-410a-79d2-460956fb4d55	1431	Dol pri Hrastniku
00050000-556c-410a-5e50-d29a1488e874	1262	Dol pri Ljubljani
00050000-556c-410a-3a76-5bc582aa6175	1273	Dole pri Litiji
00050000-556c-410a-cfdd-0b788ea64b3d	1331	Dolenja vas
00050000-556c-410a-efd7-3adce1744a84	8350	Dolenjske Toplice
00050000-556c-410a-167d-74b4caee645c	1230	Domžale
00050000-556c-410a-735b-a889418a5fe5	2252	Dornava
00050000-556c-410a-b812-cb90f82a7309	5294	Dornberk
00050000-556c-410a-3bdf-f5cd8f15e16b	1319	Draga
00050000-556c-410a-d4ec-b46d7421fff2	8343	Dragatuš
00050000-556c-410a-0287-99c8ce05dedf	3222	Dramlje
00050000-556c-410a-e008-2fe47f88c899	2370	Dravograd
00050000-556c-410a-7b53-1312d9bcf77c	4203	Duplje
00050000-556c-410a-5349-490337efbe08	6221	Dutovlje
00050000-556c-410a-6e70-ab5edaabb3f5	8361	Dvor
00050000-556c-410a-5458-20369b2b4094	2343	Fala
00050000-556c-410a-8659-af1130afa959	9208	Fokovci
00050000-556c-410a-c478-1f9d0ad9582c	2313	Fram
00050000-556c-410a-4b2e-6d8eb68c6364	3213	Frankolovo
00050000-556c-410a-3a5a-14711d315fce	1274	Gabrovka
00050000-556c-410a-a6ff-0ac9957bcd9a	8254	Globoko
00050000-556c-410a-79d8-f8a75dbb96b2	5275	Godovič
00050000-556c-410a-b10e-76d689118892	4204	Golnik
00050000-556c-410a-35e3-0c3d2b8d1586	3303	Gomilsko
00050000-556c-410a-7857-020e197161d6	4224	Gorenja vas
00050000-556c-410a-2bef-7a754dab5e95	3263	Gorica pri Slivnici
00050000-556c-410a-299d-cf885c58bc74	2272	Gorišnica
00050000-556c-410a-4f63-3b4c398d6f5e	9250	Gornja Radgona
00050000-556c-410a-8676-9c234ec9546c	3342	Gornji Grad
00050000-556c-410a-3fe4-ff7b165b055c	4282	Gozd Martuljek
00050000-556c-410a-401c-ec2427410400	6272	Gračišče
00050000-556c-410a-4330-e0247749bd31	9264	Grad
00050000-556c-410a-adab-278b2d6e44c3	8332	Gradac
00050000-556c-410a-fe4b-cde163434900	1384	Grahovo
00050000-556c-410a-6465-5a66a8ef464f	5242	Grahovo ob Bači
00050000-556c-410a-4a73-82b02e4ed955	5251	Grgar
00050000-556c-410a-82e8-30041050a001	3302	Griže
00050000-556c-410a-afb6-d1a363fd07a9	3231	Grobelno
00050000-556c-410a-8818-bd91df6d9692	1290	Grosuplje
00050000-556c-410a-d152-8c5d586ae1ab	2288	Hajdina
00050000-556c-410a-8b71-0162c6c7cdb2	8362	Hinje
00050000-556c-410a-51ae-a89c2a9464e7	2311	Hoče
00050000-556c-410a-2456-b224e6565530	9205	Hodoš/Hodos
00050000-556c-410a-e86a-ed7d8fe9dd31	1354	Horjul
00050000-556c-410a-53dd-d9ddf003cef0	1372	Hotedršica
00050000-556c-410a-90d5-f2778ddada88	1430	Hrastnik
00050000-556c-410a-d6e3-a8d376c5cc42	6225	Hruševje
00050000-556c-410a-1092-281c4578bba0	4276	Hrušica
00050000-556c-410a-4409-7228bc2509ee	5280	Idrija
00050000-556c-410a-479f-36b9f3e71e1e	1292	Ig
00050000-556c-410a-7ab5-2a44680ac820	6250	Ilirska Bistrica
00050000-556c-410a-3572-cb2cb45796b2	6251	Ilirska Bistrica-Trnovo
00050000-556c-410a-94c0-1183ce91b1c4	1295	Ivančna Gorica
00050000-556c-410a-e8f0-0447f904ab79	2259	Ivanjkovci
00050000-556c-410a-4e75-1834ca717759	1411	Izlake
00050000-556c-410a-2b82-4b3f5dafbc8d	6310	Izola/Isola
00050000-556c-410a-cd44-ccec29c171d7	2222	Jakobski Dol
00050000-556c-410a-022c-06ea89eb51cc	2221	Jarenina
00050000-556c-410a-4aca-356364ad4359	6254	Jelšane
00050000-556c-410a-6e65-56fc3961d76f	4270	Jesenice
00050000-556c-410a-0fe8-65e2ba1e7bf7	8261	Jesenice na Dolenjskem
00050000-556c-410a-b41c-2202af85acb5	3273	Jurklošter
00050000-556c-410a-4397-fafb5144bbf0	2223	Jurovski Dol
00050000-556c-410a-c361-807c92d2a0b6	2256	Juršinci
00050000-556c-410a-5b46-7b21fd8f3773	5214	Kal nad Kanalom
00050000-556c-410a-0adb-61c6f5920b3d	3233	Kalobje
00050000-556c-410a-0498-aaf21e8c2407	4246	Kamna Gorica
00050000-556c-410a-633c-554fa4c17c59	2351	Kamnica
00050000-556c-410a-227e-e231bc221be7	1241	Kamnik
00050000-556c-410a-0b44-ef487c541b35	5213	Kanal
00050000-556c-410a-4ce5-e24c2169f98c	8258	Kapele
00050000-556c-410a-4491-aaf7036d2f8c	2362	Kapla
00050000-556c-410a-fdfd-d2cdb1dfcb2f	2325	Kidričevo
00050000-556c-410a-f92e-43b7c3c200bc	1412	Kisovec
00050000-556c-410a-0537-99c48dbd46fb	6253	Knežak
00050000-556c-410a-7fb5-8928420d111d	5222	Kobarid
00050000-556c-410a-a523-a1944c8360b2	9227	Kobilje
00050000-556c-410a-0c44-270dc71e0a38	1330	Kočevje
00050000-556c-410a-8acb-0f07e239a891	1338	Kočevska Reka
00050000-556c-410a-fc43-686b4eef68bc	2276	Kog
00050000-556c-410a-2986-c69c1cbccd37	5211	Kojsko
00050000-556c-410a-36dc-9e7fcf21a1f3	6223	Komen
00050000-556c-410a-b4cc-18d134868303	1218	Komenda
00050000-556c-410a-ee51-f5953f82b11d	6000	Koper/Capodistria 
00050000-556c-410a-795b-fbce4f7d21a7	6001	Koper/Capodistria - poštni predali
00050000-556c-410a-e471-2e863092c55e	8282	Koprivnica
00050000-556c-410a-aa97-eeac0c8d6c23	5296	Kostanjevica na Krasu
00050000-556c-410a-b98e-4d9e12f62c4b	8311	Kostanjevica na Krki
00050000-556c-410a-cb68-eb6eaebbc41f	1336	Kostel
00050000-556c-410a-b906-80f7c8a3e0d3	6256	Košana
00050000-556c-410a-e777-be1e3bbfbc58	2394	Kotlje
00050000-556c-410a-5112-46b44e820eed	6240	Kozina
00050000-556c-410a-35e5-730caf419907	3260	Kozje
00050000-556c-410a-2c52-124a19023cc6	4000	Kranj 
00050000-556c-410a-919a-82b535ee93c0	4001	Kranj - poštni predali
00050000-556c-410a-030c-c076555c7a0d	4280	Kranjska Gora
00050000-556c-410a-9f5a-e85ae2c9767b	1281	Kresnice
00050000-556c-410a-4d47-94c06d75c0fc	4294	Križe
00050000-556c-410a-a961-27fa01c208db	9206	Križevci
00050000-556c-410a-1133-fe0ad8715987	9242	Križevci pri Ljutomeru
00050000-556c-410a-1d9d-0524c271e89a	1301	Krka
00050000-556c-410a-2a95-052832e19609	8296	Krmelj
00050000-556c-410a-36ec-f70d3c8b1a28	4245	Kropa
00050000-556c-410a-bca0-0441cf3240f4	8262	Krška vas
00050000-556c-410a-1c85-fa6b9107e2fd	8270	Krško
00050000-556c-410a-6e3a-2af5eb4a51c1	9263	Kuzma
00050000-556c-410a-2931-fc28765037c7	2318	Laporje
00050000-556c-410a-c23f-cb057e9ab9cd	3270	Laško
00050000-556c-410a-6273-6903db1f01b9	1219	Laze v Tuhinju
00050000-556c-410a-cf80-59372476e809	2230	Lenart v Slovenskih goricah
00050000-556c-410a-a2b5-62acdd99600b	9220	Lendava/Lendva
00050000-556c-410a-60ae-fdb3ab931e20	4248	Lesce
00050000-556c-410a-3410-4d1dd412e06c	3261	Lesično
00050000-556c-410a-29f7-1123b5d16900	8273	Leskovec pri Krškem
00050000-556c-410a-6892-2f9a69de6011	2372	Libeliče
00050000-556c-410a-b892-7918f7088781	2341	Limbuš
00050000-556c-410a-b24e-8a3860c23c45	1270	Litija
00050000-556c-410a-a613-671104bd7fa3	3202	Ljubečna
00050000-556c-410a-4c1b-36f763248f98	1000	Ljubljana 
00050000-556c-410a-b31a-0b8dc2c31702	1001	Ljubljana - poštni predali
00050000-556c-410a-7e27-5a90b77402ea	1231	Ljubljana - Črnuče
00050000-556c-410a-69a0-3eb6436c5e81	1261	Ljubljana - Dobrunje
00050000-556c-410a-da03-8bcde0dfffed	1260	Ljubljana - Polje
00050000-556c-410a-e835-aa064593b9fd	1210	Ljubljana - Šentvid
00050000-556c-410a-b0ad-cfa41b6464e5	1211	Ljubljana - Šmartno
00050000-556c-410a-ba7d-11210c49880a	3333	Ljubno ob Savinji
00050000-556c-410a-5ae0-5f421850d42a	9240	Ljutomer
00050000-556c-410a-3fc6-9da598a28756	3215	Loče
00050000-556c-410a-4327-823bee4af7dc	5231	Log pod Mangartom
00050000-556c-410a-b9f3-8f44c1c28bcb	1358	Log pri Brezovici
00050000-556c-410a-9531-45ddc9967a6d	1370	Logatec
00050000-556c-410a-fe0e-529bd72fd74d	1371	Logatec
00050000-556c-410a-e900-e8c9bd311676	1434	Loka pri Zidanem Mostu
00050000-556c-410a-fbc7-5f9a26cccbe9	3223	Loka pri Žusmu
00050000-556c-410a-9f93-030eae2b4ec4	6219	Lokev
00050000-556c-410a-ed5a-192e75b66b6b	1318	Loški Potok
00050000-556c-410a-0434-438f5f94944f	2324	Lovrenc na Dravskem polju
00050000-556c-410a-ed26-900c21a500e2	2344	Lovrenc na Pohorju
00050000-556c-410a-8105-3a7630e46a49	3334	Luče
00050000-556c-410a-3c63-996a0a155c0d	1225	Lukovica
00050000-556c-410a-4e55-edea2d9d774b	9202	Mačkovci
00050000-556c-410a-2dd2-cc9efe1bde79	2322	Majšperk
00050000-556c-410a-0169-607d58c54a29	2321	Makole
00050000-556c-410a-7016-73c4c2568334	9243	Mala Nedelja
00050000-556c-410a-6ee8-506dc051f225	2229	Malečnik
00050000-556c-410a-a565-47e32852bab0	6273	Marezige
00050000-556c-410a-b072-f02e939aed03	2000	Maribor 
00050000-556c-410a-9905-bdc3af34fd84	2001	Maribor - poštni predali
00050000-556c-410a-2a8d-9d6eeab06f8c	2206	Marjeta na Dravskem polju
00050000-556c-410a-99c4-784790c6141f	2281	Markovci
00050000-556c-410a-7d8a-165cd900b37f	9221	Martjanci
00050000-556c-410a-6e76-870c806548d3	6242	Materija
00050000-556c-410a-b1a5-3ea0613f3c09	4211	Mavčiče
00050000-556c-410a-8753-af7e3c217b41	1215	Medvode
00050000-556c-410a-332c-2d5921f710fe	1234	Mengeš
00050000-556c-410a-8efc-a1ddaab8a56c	8330	Metlika
00050000-556c-410a-0bdf-3be8544cae8f	2392	Mežica
00050000-556c-410a-e210-5ed3eb782823	2204	Miklavž na Dravskem polju
00050000-556c-410a-57b7-bb17b67b3365	2275	Miklavž pri Ormožu
00050000-556c-410a-fb0a-d8ac77fb9c04	5291	Miren
00050000-556c-410a-898d-e6c506076148	8233	Mirna
00050000-556c-410a-7a96-33f5d60edda4	8216	Mirna Peč
00050000-556c-410a-a868-638d0da29a76	2382	Mislinja
00050000-556c-410a-5e53-8103952892f9	4281	Mojstrana
00050000-556c-410a-ba29-3c23a4652941	8230	Mokronog
00050000-556c-410a-58d7-9cdae2e11b39	1251	Moravče
00050000-556c-410a-3ce0-d8a7eea6495d	9226	Moravske Toplice
00050000-556c-410a-89e2-e6ca7e3a4175	5216	Most na Soči
00050000-556c-410a-8844-523757ffdf4e	1221	Motnik
00050000-556c-410a-de4a-cf9983ebee76	3330	Mozirje
00050000-556c-410a-53b6-43b0c1ff27e3	9000	Murska Sobota 
00050000-556c-410a-2cf6-03d3584a9bf5	9001	Murska Sobota - poštni predali
00050000-556c-410a-7836-6b65d1bb1a6c	2366	Muta
00050000-556c-410a-857c-08520fb5a140	4202	Naklo
00050000-556c-410a-73d1-3a71242b8806	3331	Nazarje
00050000-556c-410a-2f63-3b2af75f68f3	1357	Notranje Gorice
00050000-556c-410a-c49f-28aacfe7f3f1	3203	Nova Cerkev
00050000-556c-410a-08d1-7e21f115accf	5000	Nova Gorica 
00050000-556c-410a-ff70-2596d7e946b4	5001	Nova Gorica - poštni predali
00050000-556c-410a-22d4-ba1f957a34ae	1385	Nova vas
00050000-556c-410a-7c2b-01159d39e761	8000	Novo mesto
00050000-556c-410a-d8fc-99f8cad858a9	8001	Novo mesto - poštni predali
00050000-556c-410a-e17b-36a1e063e69d	6243	Obrov
00050000-556c-410a-e79f-d7f64ac34032	9233	Odranci
00050000-556c-410a-c599-3f3e021c9045	2317	Oplotnica
00050000-556c-410a-2547-2328efc2e3bf	2312	Orehova vas
00050000-556c-410a-431c-9213f4b88c4d	2270	Ormož
00050000-556c-410a-a092-d2290e1d0eaa	1316	Ortnek
00050000-556c-410a-2647-37717bddf0b3	1337	Osilnica
00050000-556c-410a-6551-15d4fcac0e0a	8222	Otočec
00050000-556c-410a-21b5-f445349ef4d6	2361	Ožbalt
00050000-556c-410a-fe39-3ce2e6bf5f23	2231	Pernica
00050000-556c-410a-b6c2-82a9d20683a9	2211	Pesnica pri Mariboru
00050000-556c-410a-58b5-9b58f1018324	9203	Petrovci
00050000-556c-410a-a558-e51c6c277923	3301	Petrovče
00050000-556c-410a-548a-6216df464d17	6330	Piran/Pirano
00050000-556c-410a-17cf-1095f6e1e283	8255	Pišece
00050000-556c-410a-430a-f87c937db15f	6257	Pivka
00050000-556c-410a-dee7-b0a8739d0a40	6232	Planina
00050000-556c-410a-d0a5-ba2c4db1034b	3225	Planina pri Sevnici
00050000-556c-410a-39a9-4ea5f60bc4bb	6276	Pobegi
00050000-556c-410a-ccd7-9e32fb6b36ed	8312	Podbočje
00050000-556c-410a-6d92-a418200114d7	5243	Podbrdo
00050000-556c-410a-15bf-6484e33acf77	3254	Podčetrtek
00050000-556c-410a-d060-e310bd6c715d	2273	Podgorci
00050000-556c-410a-f45c-6ec530ead054	6216	Podgorje
00050000-556c-410a-ab15-b62bac500024	2381	Podgorje pri Slovenj Gradcu
00050000-556c-410a-d0bc-7a463e2ae6cb	6244	Podgrad
00050000-556c-410a-8435-c30f5b8dd9d6	1414	Podkum
00050000-556c-410a-af12-83c4eca21ff1	2286	Podlehnik
00050000-556c-410a-e9a1-e2f048572e82	5272	Podnanos
00050000-556c-410a-bcfb-6aa178964402	4244	Podnart
00050000-556c-410a-bbeb-d6fc949bd71d	3241	Podplat
00050000-556c-410a-3e37-37ab0f19e932	3257	Podsreda
00050000-556c-410a-eb0b-206331789b45	2363	Podvelka
00050000-556c-410a-9b0a-3b86f653422d	2208	Pohorje
00050000-556c-410a-6e89-9fe4af2b3de5	2257	Polenšak
00050000-556c-410a-c877-0903a070c15e	1355	Polhov Gradec
00050000-556c-410a-ecfd-04346b8aa518	4223	Poljane nad Škofjo Loko
00050000-556c-410a-8e2b-ac9dc0027649	2319	Poljčane
00050000-556c-410a-c193-001b2a1b55f7	1272	Polšnik
00050000-556c-410a-5e47-90b165af4b0e	3313	Polzela
00050000-556c-410a-cb74-c5aaddb40972	3232	Ponikva
00050000-556c-410a-a783-cb9c711756d0	6320	Portorož/Portorose
00050000-556c-410a-59a9-2141c96462e5	6230	Postojna
00050000-556c-410a-549d-1a4a604983c9	2331	Pragersko
00050000-556c-410a-7ef9-38a334ec06c8	3312	Prebold
00050000-556c-410a-9fa3-67b5cb880869	4205	Preddvor
00050000-556c-410a-d931-e7b2bee9e539	6255	Prem
00050000-556c-410a-28b5-d6378b203d5e	1352	Preserje
00050000-556c-410a-fdd6-23cec9ae40fa	6258	Prestranek
00050000-556c-410a-79af-d2e5d805a4e2	2391	Prevalje
00050000-556c-410a-c9af-b6cb89942e1e	3262	Prevorje
00050000-556c-410a-8901-de888ace021a	1276	Primskovo 
00050000-556c-410a-5ff0-408daa58cc57	3253	Pristava pri Mestinju
00050000-556c-410a-1492-3da8a9131e23	9207	Prosenjakovci/Partosfalva
00050000-556c-410a-ca5d-2a44d32cdae2	5297	Prvačina
00050000-556c-410a-a5c5-d04fdf0b627f	2250	Ptuj
00050000-556c-410a-8ddd-6e76aa2e5e2b	2323	Ptujska Gora
00050000-556c-410a-0ca9-07be430ef19a	9201	Puconci
00050000-556c-410a-4952-efcc481fca86	2327	Rače
00050000-556c-410a-41c4-9fd98adc29e2	1433	Radeče
00050000-556c-410a-bf64-88368a4cda4f	9252	Radenci
00050000-556c-410a-090b-9a28c93b2338	2360	Radlje ob Dravi
00050000-556c-410a-1233-4996245c9d08	1235	Radomlje
00050000-556c-410a-f0bf-e3f68b1046f0	4240	Radovljica
00050000-556c-410a-fedf-4b5c363f568d	8274	Raka
00050000-556c-410a-e3ba-77cdc4f6937a	1381	Rakek
00050000-556c-410a-9a15-657f081f6abf	4283	Rateče - Planica
00050000-556c-410a-59cc-8b66d9f011e0	2390	Ravne na Koroškem
00050000-556c-410a-f61b-4a5c884fd42a	9246	Razkrižje
00050000-556c-410a-b0eb-9c05bea352b2	3332	Rečica ob Savinji
00050000-556c-410a-1b04-afb74121aa5e	5292	Renče
00050000-556c-410a-1458-1077e960cbbb	1310	Ribnica
00050000-556c-410a-c38f-275ccbcc1306	2364	Ribnica na Pohorju
00050000-556c-410a-2364-14dd4a85ea50	3272	Rimske Toplice
00050000-556c-410a-1601-0799c235149d	1314	Rob
00050000-556c-410a-107c-5b51867fe150	5215	Ročinj
00050000-556c-410a-9cef-6dd13368d5ca	3250	Rogaška Slatina
00050000-556c-410a-8b69-4d019a534545	9262	Rogašovci
00050000-556c-410a-2dfa-bdb4119104de	3252	Rogatec
00050000-556c-410a-e0c7-210b9e3da4a5	1373	Rovte
00050000-556c-410a-2387-b14d1730412e	2342	Ruše
00050000-556c-410a-88db-6082c4869138	1282	Sava
00050000-556c-410a-bb1c-a589cc5cd45d	6333	Sečovlje/Sicciole
00050000-556c-410a-262c-a9baf5d6243e	4227	Selca
00050000-556c-410a-4b6f-81e957b1e58d	2352	Selnica ob Dravi
00050000-556c-410a-016e-d45a18f8edf5	8333	Semič
00050000-556c-410a-355a-2b98205272e9	8281	Senovo
00050000-556c-410a-7a6f-3a8917b61bd6	6224	Senožeče
00050000-556c-410a-dc64-fab8b48fe51c	8290	Sevnica
00050000-556c-410a-54da-48780ad2e993	6210	Sežana
00050000-556c-410a-8bc8-0bf766a61479	2214	Sladki Vrh
00050000-556c-410a-85ca-fe6c4a805011	5283	Slap ob Idrijci
00050000-556c-410a-9a9d-1f5519630832	2380	Slovenj Gradec
00050000-556c-410a-3b20-8e8235dead9c	2310	Slovenska Bistrica
00050000-556c-410a-ea46-960cf0c71a59	3210	Slovenske Konjice
00050000-556c-410a-3857-274e594809fd	1216	Smlednik
00050000-556c-410a-3355-8582d084c246	5232	Soča
00050000-556c-410a-86b7-abfea3df9879	1317	Sodražica
00050000-556c-410a-41ff-f1ca4e2f2c12	3335	Solčava
00050000-556c-410a-b953-7e63c4c80592	5250	Solkan
00050000-556c-410a-404d-43f09f0f3d30	4229	Sorica
00050000-556c-410a-2fdb-5c819a83d984	4225	Sovodenj
00050000-556c-410a-5ab0-7d8c60a56bd0	5281	Spodnja Idrija
00050000-556c-410a-3134-86a2e4a2b5b4	2241	Spodnji Duplek
00050000-556c-410a-e2a1-0a2eebc1da87	9245	Spodnji Ivanjci
00050000-556c-410a-48e4-20732d339464	2277	Središče ob Dravi
00050000-556c-410a-efa8-35c91f5a77a5	4267	Srednja vas v Bohinju
00050000-556c-410a-a42a-7a335738b391	8256	Sromlje 
00050000-556c-410a-9c81-a7e29b0116d1	5224	Srpenica
00050000-556c-410a-dc9f-cc41a195be54	1242	Stahovica
00050000-556c-410a-0dd7-c816fffc4cb5	1332	Stara Cerkev
00050000-556c-410a-887f-2c02e22eb232	8342	Stari trg ob Kolpi
00050000-556c-410a-71f2-459af46b714a	1386	Stari trg pri Ložu
00050000-556c-410a-d115-132a980af52d	2205	Starše
00050000-556c-410a-36b2-e4c228168c1d	2289	Stoperce
00050000-556c-410a-fbb1-c94981662636	8322	Stopiče
00050000-556c-410a-9ff2-1f309c148ff9	3206	Stranice
00050000-556c-410a-e321-7ff0ab3217a5	8351	Straža
00050000-556c-410a-57b0-519453067dd0	1313	Struge
00050000-556c-410a-eae2-7e00a39eadd5	8293	Studenec
00050000-556c-410a-938c-682a169c6059	8331	Suhor
00050000-556c-410a-46f3-47be17d920ce	2233	Sv. Ana v Slovenskih goricah
00050000-556c-410a-b099-623ad7002223	2235	Sv. Trojica v Slovenskih goricah
00050000-556c-410a-d129-c1fe582fccdb	2353	Sveti Duh na Ostrem Vrhu
00050000-556c-410a-fdaf-85d9ce2c6cbd	9244	Sveti Jurij ob Ščavnici
00050000-556c-410a-c819-60a677165077	3264	Sveti Štefan
00050000-556c-410a-5ef9-9afe6e6ecbd0	2258	Sveti Tomaž
00050000-556c-410a-871d-c290134c6c05	9204	Šalovci
00050000-556c-410a-155c-33bb1ddc5b39	5261	Šempas
00050000-556c-410a-007a-f51e0dd8cd5f	5290	Šempeter pri Gorici
00050000-556c-410a-93da-d7532726049b	3311	Šempeter v Savinjski dolini
00050000-556c-410a-1d1a-b1fa3ab9a516	4208	Šenčur
00050000-556c-410a-88b4-c6423efed6aa	2212	Šentilj v Slovenskih goricah
00050000-556c-410a-033a-614a035348b5	8297	Šentjanž
00050000-556c-410a-3310-7a0568ef42d3	2373	Šentjanž pri Dravogradu
00050000-556c-410a-1099-35b0821b6d5b	8310	Šentjernej
00050000-556c-410a-21f1-247c1fb1ce6f	3230	Šentjur
00050000-556c-410a-1fa8-64ebc552c7f5	3271	Šentrupert
00050000-556c-410a-2169-11fcea2e8d5b	8232	Šentrupert
00050000-556c-410a-befa-d5b822f7850e	1296	Šentvid pri Stični
00050000-556c-410a-c67c-fc3f0a80c595	8275	Škocjan
00050000-556c-410a-b00c-fc1825842f4a	6281	Škofije
00050000-556c-410a-fa35-872b9c98b73d	4220	Škofja Loka
00050000-556c-410a-309f-6f6b3a1eb465	3211	Škofja vas
00050000-556c-410a-0fcd-ccb80a553825	1291	Škofljica
00050000-556c-410a-df9d-71454ec8d693	6274	Šmarje
00050000-556c-410a-a939-72aa071fd8c0	1293	Šmarje - Sap
00050000-556c-410a-a77b-d32c55bf7324	3240	Šmarje pri Jelšah
00050000-556c-410a-acb0-8f902c278536	8220	Šmarješke Toplice
00050000-556c-410a-ec83-4ae484be71b1	2315	Šmartno na Pohorju
00050000-556c-410a-eb01-d01bce762075	3341	Šmartno ob Dreti
00050000-556c-410a-8f36-a005df159e1d	3327	Šmartno ob Paki
00050000-556c-410a-16c9-1fc084473866	1275	Šmartno pri Litiji
00050000-556c-410a-5ee8-1f8bfba8c76b	2383	Šmartno pri Slovenj Gradcu
00050000-556c-410a-9c50-f094ed404199	3201	Šmartno v Rožni dolini
00050000-556c-410a-34f9-62998b588bb3	3325	Šoštanj
00050000-556c-410a-8179-3510c82186ec	6222	Štanjel
00050000-556c-410a-9499-d3f9bc5d780f	3220	Štore
00050000-556c-410a-ff75-a46ce24968d6	3304	Tabor
00050000-556c-410a-e9ab-7fa29f1f6c98	3221	Teharje
00050000-556c-410a-8dda-dacb8b5c11e1	9251	Tišina
00050000-556c-410a-f224-241174320437	5220	Tolmin
00050000-556c-410a-924c-61fcc16e610e	3326	Topolšica
00050000-556c-410a-bd35-ce383955ff9e	2371	Trbonje
00050000-556c-410a-36d2-39f8b0f2375f	1420	Trbovlje
00050000-556c-410a-fc9f-b0382c34bfac	8231	Trebelno 
00050000-556c-410a-b933-47151abc035c	8210	Trebnje
00050000-556c-410a-af6e-4dcb1ff332a2	5252	Trnovo pri Gorici
00050000-556c-410a-612f-98a586051fd9	2254	Trnovska vas
00050000-556c-410a-ca2a-e8f1e6838df2	1222	Trojane
00050000-556c-410a-7f07-98c15c48cab5	1236	Trzin
00050000-556c-410a-1960-df9a67182b97	4290	Tržič
00050000-556c-410a-2bee-32da70bde7bf	8295	Tržišče
00050000-556c-410a-78f1-343f37707e9e	1311	Turjak
00050000-556c-410a-0a90-b231ebe9e226	9224	Turnišče
00050000-556c-410a-ef18-53bb590c5f66	8323	Uršna sela
00050000-556c-410a-2364-a8ebe57c3602	1252	Vače
00050000-556c-410a-aed7-8241d4c41615	3320	Velenje 
00050000-556c-410a-4c1d-7df4fbc40deb	3322	Velenje - poštni predali
00050000-556c-410a-0ddf-f0fc4ea471e2	8212	Velika Loka
00050000-556c-410a-fe49-e3e0e3a61e86	2274	Velika Nedelja
00050000-556c-410a-8967-6994a4f772c7	9225	Velika Polana
00050000-556c-410a-73fc-4558ee88cba1	1315	Velike Lašče
00050000-556c-410a-aeb2-8b1b869e9a70	8213	Veliki Gaber
00050000-556c-410a-abf4-07b08db237b1	9241	Veržej
00050000-556c-410a-4492-2b0a0ffc4653	1312	Videm - Dobrepolje
00050000-556c-410a-4cbd-e29d6ef4673c	2284	Videm pri Ptuju
00050000-556c-410a-723c-362d7f91ca5f	8344	Vinica
00050000-556c-410a-a4c7-bd0fe3ee82a5	5271	Vipava
00050000-556c-410a-d9d6-f01abd679772	4212	Visoko
00050000-556c-410a-3d0f-e8ccbd5b1b31	1294	Višnja Gora
00050000-556c-410a-0886-ce41e5aad013	3205	Vitanje
00050000-556c-410a-c96e-71084281f72f	2255	Vitomarci
00050000-556c-410a-a160-7f820bd92314	1217	Vodice
00050000-556c-410a-a380-5ae02e76f9e0	3212	Vojnik\t
00050000-556c-410a-a476-bf4e61ecaa2c	5293	Volčja Draga
00050000-556c-410a-8e18-383d67f7104b	2232	Voličina
00050000-556c-410a-3662-04884060690c	3305	Vransko
00050000-556c-410a-b8fd-091fc74dcabf	6217	Vremski Britof
00050000-556c-410a-2e89-126168af5e00	1360	Vrhnika
00050000-556c-410a-4f1b-efa0dc48ca51	2365	Vuhred
00050000-556c-410a-f670-ebcf33656b1a	2367	Vuzenica
00050000-556c-410a-05f2-d57b64645687	8292	Zabukovje 
00050000-556c-410a-b18e-7db58c02a832	1410	Zagorje ob Savi
00050000-556c-410a-be1d-9d69b2543c2f	1303	Zagradec
00050000-556c-410a-a8a1-253f9b2da84b	2283	Zavrč
00050000-556c-410a-d553-01d9005de40f	8272	Zdole 
00050000-556c-410a-7aec-6df48191558f	4201	Zgornja Besnica
00050000-556c-410a-e1f1-ab86223f137d	2242	Zgornja Korena
00050000-556c-410a-ad8b-db08bcd825aa	2201	Zgornja Kungota
00050000-556c-410a-e18d-ff3a9cfb67ed	2316	Zgornja Ložnica
00050000-556c-410a-5f07-669d3d3aae11	2314	Zgornja Polskava
00050000-556c-410a-2c3e-ab13827887a5	2213	Zgornja Velka
00050000-556c-410a-e655-e40876d82725	4247	Zgornje Gorje
00050000-556c-410a-78af-2c24a3155f10	4206	Zgornje Jezersko
00050000-556c-410a-dd72-33b5096a8000	2285	Zgornji Leskovec
00050000-556c-410a-df15-ba20560154e0	1432	Zidani Most
00050000-556c-410a-a02a-a286f34001c3	3214	Zreče
00050000-556c-410a-f10e-6133b3c7ab68	4209	Žabnica
00050000-556c-410a-0549-e8a86e9225b4	3310	Žalec
00050000-556c-410a-2c2a-8058446eeafd	4228	Železniki
00050000-556c-410a-b2f2-7da645af55fe	2287	Žetale
00050000-556c-410a-ca76-dba134dcae0d	4226	Žiri
00050000-556c-410a-a9cb-0fa279fdb66a	4274	Žirovnica
00050000-556c-410a-0a65-c60541060373	8360	Žužemberk
\.


--
-- TOC entry 2799 (class 0 OID 5642092)
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
-- TOC entry 2781 (class 0 OID 5641903)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 5641981)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 5642104)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 5642224)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 5642275)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 5642387)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 5642415)
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
-- TOC entry 2826 (class 0 OID 5642396)
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
-- TOC entry 2805 (class 0 OID 5642133)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556c-410b-436e-42463d619fc2	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556c-410b-2e86-5bca41be1beb	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556c-410b-bba5-a4452ae099c6	0003	Kazinska	t	84	Kazinska dvorana
00220000-556c-410b-ac9b-2f7d3087a960	0004	Mali oder	t	24	Mali oder 
00220000-556c-410b-005c-c3d060247f63	0005	Komorni oder	t	15	Komorni oder
00220000-556c-410b-d6f2-a5bc6af4984a	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556c-410b-bf67-e4afafad6b03	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2797 (class 0 OID 5642077)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 5642067)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 5642264)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 5642201)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 5641775)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556c-410a-eb99-8e3ae2d9b5b2	00010000-556c-410a-7c45-39b0215de822	2015-06-01 13:25:00	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROfRJ59LdohPhIYR8apHXmmFmEMt16dv.";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2806 (class 0 OID 5642143)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 5641813)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556c-410a-bc2a-94f6d9f95e18	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556c-410a-b075-7d8ede1a2a95	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556c-410a-f9d9-a9715ad8a07a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556c-410a-00ec-381209ba3bbf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556c-410a-e8b6-a1945df955b8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556c-410a-c7f0-4a3e86b92def	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2772 (class 0 OID 5641797)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556c-410a-eb99-8e3ae2d9b5b2	00020000-556c-410a-00ec-381209ba3bbf
00010000-556c-410a-7c45-39b0215de822	00020000-556c-410a-00ec-381209ba3bbf
\.


--
-- TOC entry 2808 (class 0 OID 5642157)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 5642098)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 5642048)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 5642433)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556c-410a-413b-1ba7b5c1312c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556c-410a-b591-256a3559ce7e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556c-410a-b2cd-e13913e2c18e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556c-410a-f46a-769b632a463c	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556c-410a-43cc-ed79de4250e2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2830 (class 0 OID 5642426)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556c-410a-4559-a9d9f5356d1f	00000000-556c-410a-f46a-769b632a463c	popa
00000000-556c-410a-54fb-5711028fd3e7	00000000-556c-410a-f46a-769b632a463c	oseba
00000000-556c-410a-0a4a-9a1acb31d6a0	00000000-556c-410a-b591-256a3559ce7e	prostor
00000000-556c-410a-2a8f-bd1df2b5a3d6	00000000-556c-410a-f46a-769b632a463c	besedilo
00000000-556c-410a-30e8-9e8e38d35867	00000000-556c-410a-f46a-769b632a463c	uprizoritev
00000000-556c-410a-35e7-93f45cea0b87	00000000-556c-410a-f46a-769b632a463c	funkcija
00000000-556c-410a-377a-f1bcd7951bd9	00000000-556c-410a-f46a-769b632a463c	tipfunkcije
00000000-556c-410a-882d-9570aafb4dce	00000000-556c-410a-f46a-769b632a463c	alternacija
00000000-556c-410a-f4e4-913d55851e61	00000000-556c-410a-413b-1ba7b5c1312c	pogodba
00000000-556c-410a-72c2-e4ec97e447ef	00000000-556c-410a-f46a-769b632a463c	zaposlitev
\.


--
-- TOC entry 2829 (class 0 OID 5642421)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 5642211)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 5641875)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 5642054)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556c-410b-7910-f51af9aa5fd3	00180000-556c-410b-1f47-bb97608ba9e9	000c0000-556c-410b-07ea-5ce936e364db	00090000-556c-410b-9530-5671e5443208	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-410b-7a6f-d23c05fbfe46	00180000-556c-410b-1f47-bb97608ba9e9	000c0000-556c-410b-da24-08c200763d57	00090000-556c-410b-90b1-9dcc28d4885b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-410b-06e9-a0d1d07efc83	00180000-556c-410b-1f47-bb97608ba9e9	000c0000-556c-410b-d603-2de7ed171c0a	00090000-556c-410b-e25f-a917da034a34	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-410b-7ca1-e5d9b381dcfd	00180000-556c-410b-1f47-bb97608ba9e9	000c0000-556c-410b-5545-472be23da353	00090000-556c-410b-44cb-15fe59ce4bd9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-410b-4a86-84dda0b33670	00180000-556c-410b-1f47-bb97608ba9e9	000c0000-556c-410b-1f0d-2d954fd48122	00090000-556c-410b-b2c2-838bde93065a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-410b-e6b9-5ffe8b9970d7	00180000-556c-410b-2fb1-641dede778c0	\N	00090000-556c-410b-b2c2-838bde93065a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2816 (class 0 OID 5642253)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556c-410a-dcb8-bd8c4a378b98	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556c-410a-8b2b-6a1ba1c81a10	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556c-410a-2dff-b74fd173e332	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556c-410a-18e3-2ecd6708a2c4	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556c-410a-f4d2-353ba74fdbae	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556c-410a-37e8-1a2962a02987	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556c-410a-90b2-ad6491ac70c1	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556c-410a-7419-134790f53cf2	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556c-410a-8a6a-579bedc7caff	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556c-410a-ddc8-7bee48334b8a	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556c-410a-9010-e8aaaa870001	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556c-410a-4bf7-d7fd3a3581dc	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556c-410a-3411-a585d1061e29	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556c-410a-23f2-fc4fb9f32672	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556c-410a-55f7-b798b5e41b0a	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556c-410a-206f-2dacd864f4e8	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2827 (class 0 OID 5642404)
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
-- TOC entry 2784 (class 0 OID 5641938)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 5641784)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556c-410a-7c45-39b0215de822	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO53dfzvm9rREBhfxaQ6l5rUqZB3yPj6a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556c-410b-07ee-e667fd1d9a3c	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556c-410b-4cef-0a0fb8bee4b3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556c-410b-e28f-59854827c501	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556c-410b-4689-27385fe0d84e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556c-410a-eb99-8e3ae2d9b5b2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2821 (class 0 OID 5642309)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556c-410b-74fc-6fb43c4ec4a6	00160000-556c-410b-181a-55272026eadf	00150000-556c-410a-1f05-0f195f73c152	00140000-556c-410a-b93f-d501b4a4df21	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556c-410b-005c-c3d060247f63
000e0000-556c-410b-0b76-13d817c9a858	00160000-556c-410b-8c28-576f77dfaa57	00150000-556c-410a-ebf3-de9fa8bd3286	00140000-556c-410a-e483-e5a2b0dd2b4b	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556c-410b-d6f2-a5bc6af4984a
\.


--
-- TOC entry 2789 (class 0 OID 5642000)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556c-410b-7742-356a788c4e49	000e0000-556c-410b-0b76-13d817c9a858	1	
00200000-556c-410b-dd09-b6cc0ffb59e9	000e0000-556c-410b-0b76-13d817c9a858	2	
\.


--
-- TOC entry 2804 (class 0 OID 5642125)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 5642194)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 5642032)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 5642299)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556c-410a-b93f-d501b4a4df21	Drama	drama (SURS 01)
00140000-556c-410a-444f-79f75f49faf7	Opera	opera (SURS 02)
00140000-556c-410a-79d4-61b8f621c039	Balet	balet (SURS 03)
00140000-556c-410a-5d42-209abe36a533	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556c-410a-976e-5874caf7d816	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556c-410a-e483-e5a2b0dd2b4b	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556c-410a-5202-7c4479aa10dd	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2810 (class 0 OID 5642184)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556c-410a-8a7a-ab3e99aff48e	Opera	opera
00150000-556c-410a-fd23-f84f0c286dd6	Opereta	opereta
00150000-556c-410a-2269-e4e4ce1116db	Balet	balet
00150000-556c-410a-3c1a-ab781d1df876	Plesne prireditve	plesne prireditve
00150000-556c-410a-734e-61175449a99c	Lutkovno gledališče	lutkovno gledališče
00150000-556c-410a-0c94-b3f95c0e03e8	Raziskovalno gledališče	raziskovalno gledališče
00150000-556c-410a-dd8d-22814ef33a1e	Biografska drama	biografska drama
00150000-556c-410a-1f05-0f195f73c152	Komedija	komedija
00150000-556c-410a-9654-cc593a94be3f	Črna komedija	črna komedija
00150000-556c-410a-85f4-02eb1f50ec72	E-igra	E-igra
00150000-556c-410a-ebf3-de9fa8bd3286	Kriminalka	kriminalka
00150000-556c-410a-47f4-307c1ad3e112	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 5641838)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 5642354)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 5642344)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 5642252)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5642022)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 5642047)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 5641964)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 5642383)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5642180)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 5641998)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5642041)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 5641978)
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
-- TOC entry 2456 (class 2606 OID 5642090)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 5642117)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 5641936)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5641847)
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
-- TOC entry 2371 (class 2606 OID 5641871)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5641827)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 5641812)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 5642123)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5642156)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 5642294)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5641900)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 5641924)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5642096)
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
-- TOC entry 2386 (class 2606 OID 5641914)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5641985)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5642108)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 5642236)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 5642280)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 5642394)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 5642419)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 5642401)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 5642140)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 5642081)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 5642072)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 5642274)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 5642208)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5641783)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 5642147)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 5641801)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 5641821)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 5642165)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5642103)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 5642053)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 5642439)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 5642430)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 5642425)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 5642221)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 5641880)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 5642063)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 5642263)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 5642414)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 5641949)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 5641796)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 5642324)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5642007)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 5642131)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 5642199)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 5642036)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 5642308)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 5642193)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 5642029)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 5642222)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 5642223)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 5641902)
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
-- TOC entry 2469 (class 1259 OID 5642124)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 5642110)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 5642109)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 5642008)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 5642181)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 5642183)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 5642182)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 5641980)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 5641979)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 5642296)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 5642297)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 5642298)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2529 (class 1259 OID 5642329)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2530 (class 1259 OID 5642326)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2531 (class 1259 OID 5642328)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2532 (class 1259 OID 5642327)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 5641951)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 5641950)
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
-- TOC entry 2369 (class 1259 OID 5641874)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 5642148)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 5642042)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 5641828)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 5641829)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 5642168)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 5642167)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 5642166)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 5641986)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 5641988)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 5641987)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 5642432)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 5642076)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 5642074)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 5642073)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 5642075)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 5641802)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 5641803)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 5642132)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 5642097)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2499 (class 1259 OID 5642209)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2500 (class 1259 OID 5642210)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 5642384)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 5642386)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2552 (class 1259 OID 5642385)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2382 (class 1259 OID 5641916)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 5641915)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 5641917)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2562 (class 1259 OID 5642420)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2507 (class 1259 OID 5642237)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 5642238)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2542 (class 1259 OID 5642358)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2543 (class 1259 OID 5642357)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2544 (class 1259 OID 5642360)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2545 (class 1259 OID 5642356)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2546 (class 1259 OID 5642359)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2496 (class 1259 OID 5642200)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 5642085)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 5642084)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 5642082)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 5642083)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2538 (class 1259 OID 5642346)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2539 (class 1259 OID 5642345)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 5642395)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 5641999)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 5641849)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 5641848)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 5641881)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 5641882)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 5642066)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 5642065)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 5642064)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2556 (class 1259 OID 5642403)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2557 (class 1259 OID 5642402)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 5642031)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 5642027)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 5642024)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 5642025)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 5642023)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 5642028)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 5642026)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 5641901)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 5641965)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 5641967)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 5641966)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 5641968)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 5642091)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 5642295)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 5642325)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 5641872)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 5641873)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 5642440)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 5641937)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2570 (class 1259 OID 5642431)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 5642142)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 5642141)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 5642355)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 5641925)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 5642281)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 5642282)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 5641822)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 5642030)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2599 (class 2606 OID 5642582)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2602 (class 2606 OID 5642567)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2601 (class 2606 OID 5642572)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2597 (class 2606 OID 5642592)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 5642562)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2598 (class 2606 OID 5642587)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2600 (class 2606 OID 5642577)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2633 (class 2606 OID 5642737)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 5642742)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 5642497)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2620 (class 2606 OID 5642677)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2618 (class 2606 OID 5642672)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2619 (class 2606 OID 5642667)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2596 (class 2606 OID 5642557)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 5642707)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2626 (class 2606 OID 5642717)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2627 (class 2606 OID 5642712)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2590 (class 2606 OID 5642532)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 5642527)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2616 (class 2606 OID 5642657)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 5642762)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 5642767)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 5642772)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2640 (class 2606 OID 5642792)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2643 (class 2606 OID 5642777)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2641 (class 2606 OID 5642787)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2642 (class 2606 OID 5642782)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2588 (class 2606 OID 5642522)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 5642517)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 5642482)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2581 (class 2606 OID 5642477)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 5642687)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2604 (class 2606 OID 5642597)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2577 (class 2606 OID 5642457)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2576 (class 2606 OID 5642462)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2623 (class 2606 OID 5642702)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2624 (class 2606 OID 5642697)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2625 (class 2606 OID 5642692)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2594 (class 2606 OID 5642537)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2592 (class 2606 OID 5642547)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2593 (class 2606 OID 5642542)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 5642867)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2608 (class 2606 OID 5642632)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2610 (class 2606 OID 5642622)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2611 (class 2606 OID 5642617)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2609 (class 2606 OID 5642627)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5642447)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2574 (class 2606 OID 5642452)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2621 (class 2606 OID 5642682)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2617 (class 2606 OID 5642662)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2631 (class 2606 OID 5642727)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2630 (class 2606 OID 5642732)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 5642832)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 5642842)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2652 (class 2606 OID 5642837)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2586 (class 2606 OID 5642507)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2587 (class 2606 OID 5642502)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2585 (class 2606 OID 5642512)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 5642862)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2635 (class 2606 OID 5642747)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 5642752)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2648 (class 2606 OID 5642817)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2649 (class 2606 OID 5642812)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2646 (class 2606 OID 5642827)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2650 (class 2606 OID 5642807)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2647 (class 2606 OID 5642822)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2629 (class 2606 OID 5642722)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 5642652)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2613 (class 2606 OID 5642647)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2615 (class 2606 OID 5642637)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2614 (class 2606 OID 5642642)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2644 (class 2606 OID 5642802)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 5642797)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2654 (class 2606 OID 5642847)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2595 (class 2606 OID 5642552)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2636 (class 2606 OID 5642757)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2578 (class 2606 OID 5642472)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2579 (class 2606 OID 5642467)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2583 (class 2606 OID 5642487)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2582 (class 2606 OID 5642492)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 5642612)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2606 (class 2606 OID 5642607)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2607 (class 2606 OID 5642602)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2655 (class 2606 OID 5642857)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 5642852)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-01 13:25:00 CEST

--
-- PostgreSQL database dump complete
--

