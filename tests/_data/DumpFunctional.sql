--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-03 13:14:27 CEST

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
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6195784)
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
-- TOC entry 227 (class 1259 OID 6196301)
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
-- TOC entry 226 (class 1259 OID 6196284)
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
-- TOC entry 219 (class 1259 OID 6196193)
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
-- TOC entry 194 (class 1259 OID 6195963)
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
-- TOC entry 197 (class 1259 OID 6195997)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6195906)
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
-- TOC entry 228 (class 1259 OID 6196315)
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
-- TOC entry 213 (class 1259 OID 6196123)
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
-- TOC entry 192 (class 1259 OID 6195943)
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
-- TOC entry 196 (class 1259 OID 6195991)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6195923)
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
-- TOC entry 202 (class 1259 OID 6196040)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6196065)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6195880)
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
-- TOC entry 181 (class 1259 OID 6195793)
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
-- TOC entry 182 (class 1259 OID 6195804)
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
-- TOC entry 177 (class 1259 OID 6195758)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6195777)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6196072)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6196103)
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
-- TOC entry 223 (class 1259 OID 6196237)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostdo numeric(12,2) DEFAULT NULL::numeric,
    zacetek date,
    konec date,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 184 (class 1259 OID 6195837)
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
-- TOC entry 186 (class 1259 OID 6195872)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6196046)
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
-- TOC entry 185 (class 1259 OID 6195857)
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
-- TOC entry 191 (class 1259 OID 6195935)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6196058)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6196178)
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
-- TOC entry 222 (class 1259 OID 6196229)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6196341)
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
-- TOC entry 232 (class 1259 OID 6196369)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6196403)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6196350)
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
-- TOC entry 236 (class 1259 OID 6196399)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6196087)
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
-- TOC entry 201 (class 1259 OID 6196031)
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
-- TOC entry 200 (class 1259 OID 6196021)
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
-- TOC entry 221 (class 1259 OID 6196218)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6196155)
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
-- TOC entry 174 (class 1259 OID 6195729)
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
-- TOC entry 173 (class 1259 OID 6195727)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6196097)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6195767)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6195751)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6196111)
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
-- TOC entry 204 (class 1259 OID 6196052)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6196002)
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
-- TOC entry 235 (class 1259 OID 6196388)
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
-- TOC entry 234 (class 1259 OID 6196380)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6196375)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6196165)
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
-- TOC entry 183 (class 1259 OID 6195829)
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
-- TOC entry 199 (class 1259 OID 6196008)
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
-- TOC entry 220 (class 1259 OID 6196207)
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
-- TOC entry 231 (class 1259 OID 6196358)
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
-- TOC entry 237 (class 1259 OID 6196401)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6195892)
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
-- TOC entry 175 (class 1259 OID 6195738)
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
-- TOC entry 225 (class 1259 OID 6196263)
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
-- TOC entry 193 (class 1259 OID 6195954)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6196079)
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
-- TOC entry 215 (class 1259 OID 6196148)
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
-- TOC entry 195 (class 1259 OID 6195986)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6196253)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 6196138)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 6195732)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2780 (class 0 OID 6195784)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6196301)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556e-e192-09a7-fffba62452aa	000d0000-556e-e192-2eb0-00db5c54df98	\N	00090000-556e-e192-b468-9e2e9eea2859	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556e-e192-af9f-5b2e5dd89690	000d0000-556e-e192-b4a3-200724ee3cca	\N	00090000-556e-e192-2e5a-e240e37c2032	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556e-e192-54c9-55fb0056407d	000d0000-556e-e192-2912-f3ca8e19a098	\N	00090000-556e-e192-a6eb-ac3121a58886	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556e-e192-b1ce-9f67789ccbc9	000d0000-556e-e192-93b9-a28696ceced9	\N	00090000-556e-e192-6178-75b7299abca0	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556e-e192-9658-dc1634c78e62	000d0000-556e-e192-6acc-b0f0a72e2b1b	\N	00090000-556e-e192-e654-0d5d73642700	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2826 (class 0 OID 6196284)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6196193)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556e-e192-fd01-e27f9109b162	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556e-e192-d995-95352308a0ee	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556e-e192-db99-9dd440963f2b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2794 (class 0 OID 6195963)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556e-e192-d675-cacace9187fc	\N	\N	00200000-556e-e192-c959-152ba5980147	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-556e-e192-22c9-91e9e38c46ab	\N	\N	00200000-556e-e192-57c0-e7e06f365da9	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556e-e192-9aa9-ddd480c244ad	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-556e-e192-b145-ddee9479ec48	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-556e-e192-f9f6-61772890a331	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2797 (class 0 OID 6195997)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6195906)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556e-e191-7649-8f59349cfad1	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556e-e191-4f33-4a8992bc0568	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556e-e191-3879-39a543d18086	AL	ALB	008	Albania 	Albanija	\N
00040000-556e-e191-7e63-ffb9f992f330	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556e-e191-c5f3-b680dfb37f34	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556e-e191-f9ce-b372ea66d590	AD	AND	020	Andorra 	Andora	\N
00040000-556e-e191-d64e-cb3b6c473427	AO	AGO	024	Angola 	Angola	\N
00040000-556e-e191-6453-f15f46db29bd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556e-e191-0932-a067429feef7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556e-e191-7c28-f2daa464aaa2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556e-e191-8eed-8c1c4f5c04e1	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556e-e191-3c39-1b5299ae6ea5	AM	ARM	051	Armenia 	Armenija	\N
00040000-556e-e191-0d5f-966b80d36c92	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556e-e191-609a-b49f614360d0	AU	AUS	036	Australia 	Avstralija	\N
00040000-556e-e191-48f8-4d34185c4b28	AT	AUT	040	Austria 	Avstrija	\N
00040000-556e-e191-f92d-89dcd1773d3e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556e-e191-8713-7f40758f6296	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556e-e191-480c-26ba7713706e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556e-e191-209a-66cd346633e5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556e-e191-465a-d168ac4867d4	BB	BRB	052	Barbados 	Barbados	\N
00040000-556e-e191-382c-11b893c8a7ef	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556e-e191-3b7d-0df972a0abb9	BE	BEL	056	Belgium 	Belgija	\N
00040000-556e-e191-f050-aef7e19040e3	BZ	BLZ	084	Belize 	Belize	\N
00040000-556e-e191-1660-f05e5fd4a30c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556e-e191-0783-7e852df4d9c0	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556e-e191-49c4-fda716ee7cc3	BT	BTN	064	Bhutan 	Butan	\N
00040000-556e-e191-dd23-3638c9de7ee5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556e-e191-4cd3-5223a722898a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556e-e191-66ac-0b7564a7385c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556e-e191-48da-49cea26b7d41	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556e-e191-cb0a-cb18f849fa8d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556e-e191-e95a-1a51540e3b28	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556e-e191-dfe9-71d159f548ea	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556e-e191-40f5-b9509828d6a7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556e-e191-0d36-e7ff9d959b3c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556e-e191-6179-93fd9685cb59	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556e-e191-d166-1506bbd082c6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556e-e191-e8dc-e8b5893dbbd3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556e-e191-0c53-0f48be076bb3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556e-e191-d2fb-ade616602fb9	CA	CAN	124	Canada 	Kanada	\N
00040000-556e-e191-3c66-1e023ac3faf3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556e-e191-1004-ddd455037a4f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556e-e191-b222-90cb72cfd66f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556e-e191-6f3a-58db25c2601e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556e-e191-1fd2-05481db9a526	CL	CHL	152	Chile 	Čile	\N
00040000-556e-e191-06f5-c4d05de5b5c5	CN	CHN	156	China 	Kitajska	\N
00040000-556e-e191-15df-43199fb82708	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556e-e191-1e57-1abb5ae785f1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556e-e191-c830-7ea2eee900eb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556e-e191-9eb3-258f0dab265c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556e-e191-6a5c-9df597f22532	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556e-e191-42a8-5a9ec2315893	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556e-e191-768f-6d1c6fd1c8e7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556e-e191-9c2e-2d47854739f4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556e-e191-7438-4d45dca87e40	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556e-e191-9239-8eb5ff9bfbdb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556e-e191-4c16-3e3992aaadf7	CU	CUB	192	Cuba 	Kuba	\N
00040000-556e-e191-0a72-498ea357ee67	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556e-e191-c5d1-8e547747429c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556e-e191-caf2-65378a2f9363	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556e-e191-4e43-65dc068aa43f	DK	DNK	208	Denmark 	Danska	\N
00040000-556e-e191-280d-c44d4dff99e6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556e-e191-59b2-a4d28e20e2aa	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556e-e191-2f9b-85b5c5670dd3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556e-e191-6c7e-92360a8c5363	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556e-e191-4ed9-6914ef626a26	EG	EGY	818	Egypt 	Egipt	\N
00040000-556e-e191-a4b8-6dfefc391c43	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556e-e191-a86d-e3151d6abc33	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556e-e191-9cac-f2ad1e29ad59	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556e-e191-522f-33656fc4aa5a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556e-e191-0cf9-67d9663755bc	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556e-e191-3cc3-5c9fdd32e70a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556e-e191-8e12-2c883d6cb4b3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556e-e191-fb4b-2adbf428e2ea	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556e-e191-6398-21fbe7a08c89	FI	FIN	246	Finland 	Finska	\N
00040000-556e-e191-dff4-4ac191c78166	FR	FRA	250	France 	Francija	\N
00040000-556e-e191-13d4-1cf09bb2a84c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556e-e191-a119-63b343532577	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556e-e191-d2a4-ebb2a2c6e7f4	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556e-e191-4844-4dea0e270d65	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556e-e191-b8f5-ce2db7a6596e	GA	GAB	266	Gabon 	Gabon	\N
00040000-556e-e191-cf4f-5e3529de9784	GM	GMB	270	Gambia 	Gambija	\N
00040000-556e-e191-409b-7d216d78f1a6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556e-e191-d968-627f68c7b15c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556e-e191-b327-1965eae5e661	GH	GHA	288	Ghana 	Gana	\N
00040000-556e-e191-5fe2-c458a728b3d9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556e-e191-bc59-96d45c9e55d6	GR	GRC	300	Greece 	Grčija	\N
00040000-556e-e191-eb11-3d730b7be1bb	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556e-e191-b161-a0dd86bf1ac0	GD	GRD	308	Grenada 	Grenada	\N
00040000-556e-e191-8939-78fe0db4d8a4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556e-e191-8012-5901c592fea3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556e-e191-2b91-fda7c734d5b2	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556e-e191-0866-55af6362e777	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556e-e191-3e7f-487da65373e1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556e-e191-7b86-4d7500a46c26	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556e-e191-1ff8-d7ea54b497f0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556e-e191-a4fc-012c27081299	HT	HTI	332	Haiti 	Haiti	\N
00040000-556e-e191-fc43-c26982e8e2f4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556e-e191-c06e-8069d7a8a4ce	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556e-e191-f36e-085146e6dc8c	HN	HND	340	Honduras 	Honduras	\N
00040000-556e-e191-a72b-716e59d41735	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556e-e191-6d61-5a4dd99c24ec	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556e-e191-e9a8-4646e3d7c19a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556e-e191-264e-030fd8bc3ac3	IN	IND	356	India 	Indija	\N
00040000-556e-e191-46ce-0e793171d062	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556e-e191-6b59-3f643a43900c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556e-e191-b289-43367866b146	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556e-e191-e697-be16a1b14025	IE	IRL	372	Ireland 	Irska	\N
00040000-556e-e191-ffa6-b25740c2398f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556e-e191-d5de-90d4ce96bdf4	IL	ISR	376	Israel 	Izrael	\N
00040000-556e-e191-18c5-a0bf97b1681d	IT	ITA	380	Italy 	Italija	\N
00040000-556e-e191-8e95-97f017418c62	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556e-e191-1422-8f9aeaec75c2	JP	JPN	392	Japan 	Japonska	\N
00040000-556e-e191-9907-102253f5020b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556e-e191-7c4e-8b23d658d168	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556e-e191-6868-b7a1bbfc8f05	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556e-e191-b2ac-2680776c29bb	KE	KEN	404	Kenya 	Kenija	\N
00040000-556e-e191-82b0-77d74e3601b2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556e-e191-3c6c-17b2ab589268	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556e-e191-b45e-791867ab7721	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556e-e191-1f39-f7444581076c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556e-e191-32db-0b320232bf0b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556e-e191-f488-5336339de070	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556e-e191-7f1c-0a25e196d515	LV	LVA	428	Latvia 	Latvija	\N
00040000-556e-e191-057e-decbf5949323	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556e-e191-c855-291c247dc1ed	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556e-e191-9d4e-f1e6755211d6	LR	LBR	430	Liberia 	Liberija	\N
00040000-556e-e191-fa25-a65441b5aadb	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556e-e191-dfce-543ebbdd0f84	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556e-e191-a231-ac2526c40e25	LT	LTU	440	Lithuania 	Litva	\N
00040000-556e-e191-06ae-7e24f24b0a9e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556e-e191-6849-a201c837186d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556e-e191-8b36-a67b42195f15	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556e-e191-ede7-aa85b21b4fa1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556e-e191-662b-b318a2bba6d6	MW	MWI	454	Malawi 	Malavi	\N
00040000-556e-e191-0c71-8d32c10c70cc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556e-e191-2abf-4888cbbd5e7d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556e-e191-a6e5-6ab0951fff69	ML	MLI	466	Mali 	Mali	\N
00040000-556e-e191-9078-81c57fc929e2	MT	MLT	470	Malta 	Malta	\N
00040000-556e-e191-e0a8-b7d134549b2a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556e-e191-f28d-3463e506a2ae	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556e-e191-81b2-4b5ed361b9b3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556e-e191-ae60-2a662d1f2500	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556e-e191-fc8f-e886832e2231	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556e-e191-6b16-75d40aa2ab3f	MX	MEX	484	Mexico 	Mehika	\N
00040000-556e-e191-c735-26a2d26120b0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556e-e191-26b8-928409fa4324	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556e-e191-aa1f-bd3785b4ed5b	MC	MCO	492	Monaco 	Monako	\N
00040000-556e-e191-6672-7657c207e149	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556e-e191-fb8d-9b9a5ee43dfa	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556e-e191-7183-059bcaf075af	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556e-e191-9c73-37562727e0fe	MA	MAR	504	Morocco 	Maroko	\N
00040000-556e-e191-1695-e1f12db0363e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556e-e191-a91b-c14c087e3042	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556e-e191-64c6-90d13f6ebff9	NA	NAM	516	Namibia 	Namibija	\N
00040000-556e-e191-89e4-7b23c38c4078	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556e-e191-7fe7-e2d2d7e137da	NP	NPL	524	Nepal 	Nepal	\N
00040000-556e-e191-8f44-e9a124243c0c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556e-e191-a189-0d8f5c884739	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556e-e191-01ce-610745984ba9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556e-e191-90e6-4734114af466	NE	NER	562	Niger 	Niger 	\N
00040000-556e-e191-ae9b-a7b103a9a72f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556e-e191-7ef4-54ba07096c69	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556e-e191-8bac-7607f80d841b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556e-e191-82c8-f058d6ebce51	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556e-e191-e3b3-2da07ce1c5ed	NO	NOR	578	Norway 	Norveška	\N
00040000-556e-e191-f04e-8c6039e73d00	OM	OMN	512	Oman 	Oman	\N
00040000-556e-e191-1620-b23b3beed774	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556e-e191-c984-36e921b9d2d8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556e-e191-be99-5c4f68c27f79	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556e-e191-b5bc-e492bbadc3a7	PA	PAN	591	Panama 	Panama	\N
00040000-556e-e191-d60c-8151479b086b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556e-e191-14f9-5d22543f89f3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556e-e191-dc4e-3fe9bb194604	PE	PER	604	Peru 	Peru	\N
00040000-556e-e191-ff0a-cd8042648575	PH	PHL	608	Philippines 	Filipini	\N
00040000-556e-e191-fd53-36e89739da8c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556e-e191-6c5d-8a0592d94980	PL	POL	616	Poland 	Poljska	\N
00040000-556e-e191-67d6-4959c58cad93	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556e-e191-8a72-05639d96f906	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556e-e191-7f4a-092fd301e8cd	QA	QAT	634	Qatar 	Katar	\N
00040000-556e-e191-8527-22dbe3e500db	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556e-e191-c85f-66ed86e8e288	RO	ROU	642	Romania 	Romunija	\N
00040000-556e-e191-0399-280972ca1968	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556e-e191-946f-5b028ecdab7d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556e-e191-8ce2-51391ff263a0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556e-e191-0f24-de65845bc0dc	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556e-e191-ac1b-30e59387a573	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556e-e191-c991-0302b43eadbf	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556e-e191-df9f-86d6a304a908	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556e-e191-1825-886450d19949	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556e-e191-bede-df0943974f4f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556e-e191-bd8b-6f7083e8dc72	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556e-e191-0ac7-a02acc5b1847	SM	SMR	674	San Marino 	San Marino	\N
00040000-556e-e191-f123-41d6855807aa	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556e-e191-1ac0-be5b32b41c24	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556e-e191-29aa-afb19ea5e268	SN	SEN	686	Senegal 	Senegal	\N
00040000-556e-e191-e7dc-6e2380f10019	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556e-e191-e7fc-45223098e432	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556e-e191-7b92-d9d3998ad9ca	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556e-e191-f513-1ac99ef4b878	SG	SGP	702	Singapore 	Singapur	\N
00040000-556e-e191-2115-2c52a99aa029	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556e-e191-f34f-7f9aa0d338ec	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556e-e191-95b7-277643eeae42	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556e-e191-8590-3d4b666827bc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556e-e191-a879-d0aa52768e63	SO	SOM	706	Somalia 	Somalija	\N
00040000-556e-e191-1e9c-419cebeb2635	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556e-e191-d128-ed3b22bdd48c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556e-e191-41f9-7296ac0e1b24	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556e-e191-b20b-3af05929fea5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556e-e191-ab66-88aada6567b4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556e-e191-4a81-2d5a7b655717	SD	SDN	729	Sudan 	Sudan	\N
00040000-556e-e191-cedf-4cae7ba7f186	SR	SUR	740	Suriname 	Surinam	\N
00040000-556e-e191-8895-7cf6cf972bdd	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556e-e191-193d-5f4a213a7b6b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556e-e191-3e21-0839dea7198e	SE	SWE	752	Sweden 	Švedska	\N
00040000-556e-e191-3c96-210f0c3ef4f7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556e-e191-2fee-88c1924c525e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556e-e191-9947-97e169b91bbc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556e-e191-76da-9f9629ef5c42	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556e-e191-c109-1fa28d2f63e7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556e-e191-3a08-361c8e530a28	TH	THA	764	Thailand 	Tajska	\N
00040000-556e-e191-84b0-1e122214701d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556e-e191-08c5-acdfeb515968	TG	TGO	768	Togo 	Togo	\N
00040000-556e-e191-0df1-5821dc78d2a9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556e-e191-8535-061b31e59b51	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556e-e191-3125-1a5839d7e8ec	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556e-e191-e6f5-1fe4dfaf6800	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556e-e191-0748-30be26398c25	TR	TUR	792	Turkey 	Turčija	\N
00040000-556e-e191-fcd4-a8f3f37b2c13	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556e-e191-801f-da1e33559364	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556e-e191-d9d3-b97c00410386	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556e-e191-54e2-edd141cbe9b3	UG	UGA	800	Uganda 	Uganda	\N
00040000-556e-e191-ac14-50ad03d0bc79	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556e-e191-c580-002ebff331ff	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556e-e191-7d56-f9ea72705fa9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556e-e191-119f-7957e75d1f61	US	USA	840	United States 	Združene države Amerike	\N
00040000-556e-e191-2b0a-ca4b36033231	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556e-e191-565c-4c7dfc5050cc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556e-e191-c97a-c875c281e689	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556e-e191-d02c-1a661e244231	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556e-e191-ed71-303c827861a8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556e-e191-f69a-010db84ed029	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556e-e191-d887-6d2330a0b44b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556e-e191-7a11-1eaf33e7e5be	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556e-e191-81d2-3238f07ca375	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556e-e191-9d14-d6aec1aa5d0e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556e-e191-0a8b-54c67bc3c40f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556e-e191-f538-1b5b1468fa2e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556e-e191-55fa-a23a6a0a3f5f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2828 (class 0 OID 6196315)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6196123)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-556e-e192-cf1f-9337881d5677	000e0000-556e-e192-ea56-e5e5c136778c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556e-e191-600d-e5d1b879d268
000d0000-556e-e192-2eb0-00db5c54df98	000e0000-556e-e192-ea56-e5e5c136778c	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556e-e191-600d-e5d1b879d268
000d0000-556e-e192-b4a3-200724ee3cca	000e0000-556e-e192-ea56-e5e5c136778c	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556e-e191-ee79-7fcec56a3a1b
000d0000-556e-e192-2912-f3ca8e19a098	000e0000-556e-e192-ea56-e5e5c136778c	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556e-e191-b3e5-bb1ddd13a568
000d0000-556e-e192-93b9-a28696ceced9	000e0000-556e-e192-ea56-e5e5c136778c	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556e-e191-b3e5-bb1ddd13a568
000d0000-556e-e192-6acc-b0f0a72e2b1b	000e0000-556e-e192-ea56-e5e5c136778c	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556e-e191-b3e5-bb1ddd13a568
\.


--
-- TOC entry 2792 (class 0 OID 6195943)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6195991)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6195923)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6196040)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6196065)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6195880)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556e-e191-99cf-12d2b57df9f3	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556e-e191-1685-22319d1bca9b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556e-e191-ecb9-a9dea0102651	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556e-e191-d8b9-0e7dfc91814b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556e-e191-92eb-085ca3fd2955	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556e-e191-c2b9-2a15269e2ae3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556e-e191-ba27-04c153e0ab94	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556e-e191-2d4b-000eb2fcabfc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556e-e191-a9fe-386a2b5a2535	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556e-e191-112d-8db7fda83b54	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556e-e191-b562-ada4afb45553	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556e-e191-6b3c-f731a5fe36a7	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556e-e191-a536-4562cbe2f00c	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556e-e191-ca5f-bff1d1b7cdd6	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556e-e191-5d95-1e4188545bc9	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556e-e191-a269-8845c8334d13	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2781 (class 0 OID 6195793)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556e-e191-4035-f36d17540c5d	00000000-556e-e191-92eb-085ca3fd2955	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556e-e191-9ec6-303b1fd758f4	00000000-556e-e191-92eb-085ca3fd2955	00010000-556e-e191-3d3d-17746badf7b8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556e-e191-61fb-21b89dec254d	00000000-556e-e191-c2b9-2a15269e2ae3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2782 (class 0 OID 6195804)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556e-e192-e8a0-ce08be72b8a9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556e-e192-6178-75b7299abca0	00010000-556e-e192-65e6-02556ee10df0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556e-e192-a6eb-ac3121a58886	00010000-556e-e192-a3d2-f98f5c2b0b88	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556e-e192-e107-3fe287c9c562	00010000-556e-e192-96d2-515188023faa	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556e-e192-894c-62c23b601eb1	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556e-e192-024b-f20269caa836	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556e-e192-e60f-461cc43857ed	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556e-e192-9e9d-558cac7bb7e5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556e-e192-b468-9e2e9eea2859	00010000-556e-e192-f544-f536638794e7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556e-e192-2e5a-e240e37c2032	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556e-e192-4f29-8cbd92f89660	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556e-e192-e654-0d5d73642700	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556e-e192-2f66-734dadbeaa40	00010000-556e-e192-25c2-139edae90801	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2772 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2777 (class 0 OID 6195758)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556e-e191-815e-c08d17acfb28	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556e-e191-3eca-0c3cbcb892f1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556e-e191-6d00-cad8561fbbe6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556e-e191-366b-b3c39881c5d5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-556e-e191-37f2-d59ca550d1b6	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556e-e191-7fc7-2bf9f34488bf	Abonma-read	Abonma - branje	f
00030000-556e-e191-8267-b7e3977e9690	Abonma-write	Abonma - spreminjanje	f
00030000-556e-e191-353e-42ae9d02f092	Alternacija-read	Alternacija - branje	f
00030000-556e-e191-1cca-2a9cf5abfb67	Alternacija-write	Alternacija - spreminjanje	f
00030000-556e-e191-2409-58b77d283525	Arhivalija-read	Arhivalija - branje	f
00030000-556e-e191-e0c9-33a86228c792	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556e-e191-083a-777e5e7e28c1	Besedilo-read	Besedilo - branje	f
00030000-556e-e191-f763-815243a5d602	Besedilo-write	Besedilo - spreminjanje	f
00030000-556e-e191-0c4e-b68b7b17ca90	DogodekIzven-read	DogodekIzven - branje	f
00030000-556e-e191-6d4c-1f8a518c9eaa	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556e-e191-d460-eb69e1cfeca8	Dogodek-read	Dogodek - branje	f
00030000-556e-e191-adca-b2700750cf87	Dogodek-write	Dogodek - spreminjanje	f
00030000-556e-e191-c27e-1c72363421a0	Drzava-read	Drzava - branje	f
00030000-556e-e191-a334-a8a32704b231	Drzava-write	Drzava - spreminjanje	f
00030000-556e-e191-0833-91513766997b	Funkcija-read	Funkcija - branje	f
00030000-556e-e191-66ec-17edb64473aa	Funkcija-write	Funkcija - spreminjanje	f
00030000-556e-e191-3606-bafbb55ef617	Gostovanje-read	Gostovanje - branje	f
00030000-556e-e191-d8d7-c51e7391cb98	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556e-e191-0ce3-aeb58f249aea	Gostujoca-read	Gostujoca - branje	f
00030000-556e-e191-2191-9087d8845a30	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556e-e191-771c-3eb293accd68	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556e-e191-50ba-b84936f98b7a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556e-e191-58b9-847788f79b60	Kupec-read	Kupec - branje	f
00030000-556e-e191-e6f8-d086a2164957	Kupec-write	Kupec - spreminjanje	f
00030000-556e-e191-0c8b-df615c0f3e88	NacinPlacina-read	NacinPlacina - branje	f
00030000-556e-e191-09c8-bf88da80acc7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556e-e191-dddc-41b344e067f1	Option-read	Option - branje	f
00030000-556e-e191-7d45-1d5ef73a3a12	Option-write	Option - spreminjanje	f
00030000-556e-e191-f461-35d420f213f1	OptionValue-read	OptionValue - branje	f
00030000-556e-e191-a611-efb17621f12c	OptionValue-write	OptionValue - spreminjanje	f
00030000-556e-e191-dc67-9f6d499a7030	Oseba-read	Oseba - branje	f
00030000-556e-e191-59eb-ba81c9a61e03	Oseba-write	Oseba - spreminjanje	f
00030000-556e-e191-1ef0-4008a1d452f5	Permission-read	Permission - branje	f
00030000-556e-e191-0d8c-bcc765cf1b56	Permission-write	Permission - spreminjanje	f
00030000-556e-e191-e227-8b85a6d0af63	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556e-e191-dc49-058f71ab17f1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556e-e191-9a97-82444e39b3f2	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556e-e191-69f0-6be6952fc04d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556e-e191-b7e2-9da86d163ce5	Pogodba-read	Pogodba - branje	f
00030000-556e-e191-b13a-0f6964289d7c	Pogodba-write	Pogodba - spreminjanje	f
00030000-556e-e191-376b-05bf90840ed4	Popa-read	Popa - branje	f
00030000-556e-e191-d356-0aa8809acfb5	Popa-write	Popa - spreminjanje	f
00030000-556e-e191-de52-4148d75f037a	Posta-read	Posta - branje	f
00030000-556e-e191-5c02-143403199fb1	Posta-write	Posta - spreminjanje	f
00030000-556e-e191-c1f0-d53064468d93	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556e-e191-f022-2955c46e2b8a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556e-e191-f9c3-7b02b9e7ebd8	PostniNaslov-read	PostniNaslov - branje	f
00030000-556e-e191-ca4a-1b9c886e0aa9	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556e-e191-d1b7-9214c78870da	Predstava-read	Predstava - branje	f
00030000-556e-e191-2a7e-259d6a2b5e1f	Predstava-write	Predstava - spreminjanje	f
00030000-556e-e191-6fbd-cb4e59e6a36d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556e-e191-5b3a-24f0889a797b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556e-e191-1d84-9cd547845ca3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556e-e191-5554-51ba88c31c0c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556e-e191-f670-862fdc519fa6	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556e-e191-601b-1deac342d8c1	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556e-e191-69a8-87664d0f05c3	Prostor-read	Prostor - branje	f
00030000-556e-e191-9d6f-c39ba94f1afa	Prostor-write	Prostor - spreminjanje	f
00030000-556e-e191-f8d5-8efc975b2baa	Racun-read	Racun - branje	f
00030000-556e-e191-162e-202295ad41f6	Racun-write	Racun - spreminjanje	f
00030000-556e-e191-9bdc-6401c92c0538	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556e-e191-e8f3-16ef37907386	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556e-e191-0168-03ad978b90c1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556e-e191-2058-fd2da54f2f54	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556e-e191-eadb-3c3d2293987f	Rekvizit-read	Rekvizit - branje	f
00030000-556e-e191-90d7-0f589e1d9278	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556e-e191-1928-5801fa9940ed	Revizija-read	Revizija - branje	f
00030000-556e-e191-82ac-d0cd360aa024	Revizija-write	Revizija - spreminjanje	f
00030000-556e-e191-c591-d7bb82a2e077	Rezervacija-read	Rezervacija - branje	f
00030000-556e-e191-4ba7-e12dc96fbcf6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556e-e191-22bf-285f96172e5a	Role-read	Role - branje	f
00030000-556e-e191-0976-77fd08d2d6e9	Role-write	Role - spreminjanje	f
00030000-556e-e191-2cb7-fb5dbd81cd48	SedezniRed-read	SedezniRed - branje	f
00030000-556e-e191-d611-3abc38a9d1b2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556e-e191-f5ec-0a3e01669150	Sedez-read	Sedez - branje	f
00030000-556e-e191-809e-3fb6de7ea64c	Sedez-write	Sedez - spreminjanje	f
00030000-556e-e191-11fb-e306498b7cd3	Sezona-read	Sezona - branje	f
00030000-556e-e191-fbe2-20dea68dc2a3	Sezona-write	Sezona - spreminjanje	f
00030000-556e-e191-2392-81cdcc0ab453	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556e-e191-f975-75dbaafae004	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556e-e191-af2e-45b21d29e452	Stevilcenje-read	Stevilcenje - branje	f
00030000-556e-e191-133f-0ed88dee4e66	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556e-e191-85f2-02948625932a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556e-e191-f041-3c4de75195ee	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556e-e191-8263-35dd03628abe	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556e-e191-cfc0-e8a3b60f1c02	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556e-e191-7fb7-548056898d8e	Telefonska-read	Telefonska - branje	f
00030000-556e-e191-89f7-e46349bcaad6	Telefonska-write	Telefonska - spreminjanje	f
00030000-556e-e191-6363-ed6cdffd800e	TerminStoritve-read	TerminStoritve - branje	f
00030000-556e-e191-b6bd-20d07bd29aad	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556e-e191-edfd-2a78ff13c738	TipFunkcije-read	TipFunkcije - branje	f
00030000-556e-e191-3b31-c00ed1617fc6	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556e-e191-ceab-d9d02bc2758c	Trr-read	Trr - branje	f
00030000-556e-e191-6955-7f8fe44503f1	Trr-write	Trr - spreminjanje	f
00030000-556e-e191-a366-30984424b7b2	Uprizoritev-read	Uprizoritev - branje	f
00030000-556e-e191-fa69-bdd5963bfb49	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556e-e191-a7be-6ddcc8457942	User-read	User - branje	f
00030000-556e-e191-460a-d1de8b20e0a6	User-write	User - spreminjanje	f
00030000-556e-e191-43d5-c35b96e77398	Vaja-read	Vaja - branje	f
00030000-556e-e191-9923-a974d370e8a5	Vaja-write	Vaja - spreminjanje	f
00030000-556e-e191-8e7d-4d1771830f7b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556e-e191-5c7c-a8e644f78d25	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556e-e191-18d8-78425a36507d	Zaposlitev-read	Zaposlitev - branje	f
00030000-556e-e191-a0e4-842dea8acd2b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556e-e191-a929-17a24d7204cc	Zasedenost-read	Zasedenost - branje	f
00030000-556e-e191-8e77-8a02ffafd4d1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556e-e191-40a7-646d679d9a0c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556e-e191-8ab5-6ef8c1cd653b	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556e-e191-e390-d01ef1920ef5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556e-e191-5561-5d834a3c9059	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2779 (class 0 OID 6195777)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556e-e191-7b85-e3e3ca838d2b	00030000-556e-e191-c27e-1c72363421a0
00020000-556e-e191-9d53-6cde0fa51727	00030000-556e-e191-a334-a8a32704b231
00020000-556e-e191-9d53-6cde0fa51727	00030000-556e-e191-c27e-1c72363421a0
\.


--
-- TOC entry 2807 (class 0 OID 6196072)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6196103)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6196237)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2784 (class 0 OID 6195837)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556e-e192-573a-92703da4300b	00040000-556e-e191-7649-8f59349cfad1	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556e-e192-1459-6b34ca26ef43	00040000-556e-e191-7649-8f59349cfad1	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556e-e192-af1b-6e4a463e8699	00040000-556e-e191-7649-8f59349cfad1	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556e-e192-706d-3fce4b197976	00040000-556e-e191-7649-8f59349cfad1	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2786 (class 0 OID 6195872)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556e-e191-a429-16ab1d989b30	8341	Adlešiči
00050000-556e-e191-1ed9-e61481ab406d	5270	Ajdovščina
00050000-556e-e191-55f2-56a30d42ba8d	6280	Ankaran/Ancarano
00050000-556e-e191-c0f9-2c96b685c7e4	9253	Apače
00050000-556e-e191-3ff3-caf945772cf3	8253	Artiče
00050000-556e-e191-780f-03b48a87d35a	4275	Begunje na Gorenjskem
00050000-556e-e191-f51f-4cc4fb13bf90	1382	Begunje pri Cerknici
00050000-556e-e191-a9b0-e071b576d725	9231	Beltinci
00050000-556e-e191-bd40-dad28b1e2247	2234	Benedikt
00050000-556e-e191-bfcd-cc1b3c553db0	2345	Bistrica ob Dravi
00050000-556e-e191-621e-afa6dbcd4e25	3256	Bistrica ob Sotli
00050000-556e-e191-eeea-596d6cd51ac2	8259	Bizeljsko
00050000-556e-e191-6a34-bc98fe51d982	1223	Blagovica
00050000-556e-e191-401d-eba34e1c39a8	8283	Blanca
00050000-556e-e191-4086-bb9562b075f9	4260	Bled
00050000-556e-e191-4daa-ed8550efc4ba	4273	Blejska Dobrava
00050000-556e-e191-7fdd-09cce1ff055c	9265	Bodonci
00050000-556e-e191-f49a-d9f7c9582eac	9222	Bogojina
00050000-556e-e191-0a23-1f4a11de5f8b	4263	Bohinjska Bela
00050000-556e-e191-5d2a-3e87db3b9b3d	4264	Bohinjska Bistrica
00050000-556e-e191-e4a2-6c0bcc515437	4265	Bohinjsko jezero
00050000-556e-e191-2364-274412bb20b9	1353	Borovnica
00050000-556e-e191-c76f-a4f71547be16	8294	Boštanj
00050000-556e-e191-3ee0-ac0975251755	5230	Bovec
00050000-556e-e191-f94f-f2fddd0ba5ef	5295	Branik
00050000-556e-e191-b285-589acb031897	3314	Braslovče
00050000-556e-e191-0f5e-4b508ed51775	5223	Breginj
00050000-556e-e191-4d16-54dce806564f	8280	Brestanica
00050000-556e-e191-58b3-8c7b6c976293	2354	Bresternica
00050000-556e-e191-c39d-a48efb00534b	4243	Brezje
00050000-556e-e191-dabb-d89756e86d6d	1351	Brezovica pri Ljubljani
00050000-556e-e191-01c5-180cf8762d5a	8250	Brežice
00050000-556e-e191-26b0-4ab875adeadc	4210	Brnik - Aerodrom
00050000-556e-e191-d060-b2040e11c37c	8321	Brusnice
00050000-556e-e191-7a19-d92d05e60964	3255	Buče
00050000-556e-e191-1842-78b9e3dabd59	8276	Bučka 
00050000-556e-e191-dbe3-a167cf7089c6	9261	Cankova
00050000-556e-e191-f3c1-a482748aee1e	3000	Celje 
00050000-556e-e191-a323-74145c64ead6	3001	Celje - poštni predali
00050000-556e-e191-b0ae-b0889ad5c2eb	4207	Cerklje na Gorenjskem
00050000-556e-e191-add2-403411e2625d	8263	Cerklje ob Krki
00050000-556e-e191-bca7-dd83b9db1a14	1380	Cerknica
00050000-556e-e191-63a4-5d51e32e2ce6	5282	Cerkno
00050000-556e-e191-7c73-2c91bef80380	2236	Cerkvenjak
00050000-556e-e191-f752-29b788867741	2215	Ceršak
00050000-556e-e191-14f1-94e32d311286	2326	Cirkovce
00050000-556e-e191-9fff-303c203e6a0f	2282	Cirkulane
00050000-556e-e191-f7a4-ae1d34acc4d3	5273	Col
00050000-556e-e191-a45d-cbf4c4b09728	8251	Čatež ob Savi
00050000-556e-e191-280e-e59f901da308	1413	Čemšenik
00050000-556e-e191-93cf-9a7783fff1ef	5253	Čepovan
00050000-556e-e191-4255-2c6591b082d4	9232	Črenšovci
00050000-556e-e191-8ce1-0d0cb0d9aec8	2393	Črna na Koroškem
00050000-556e-e191-bc7a-c73a6a151fef	6275	Črni Kal
00050000-556e-e191-fbf8-534e88c5ad47	5274	Črni Vrh nad Idrijo
00050000-556e-e191-2896-3564e6847994	5262	Črniče
00050000-556e-e191-e1cd-9e97ea6e3412	8340	Črnomelj
00050000-556e-e191-e485-ddfaab860f6c	6271	Dekani
00050000-556e-e191-d6df-4425b6c6fb87	5210	Deskle
00050000-556e-e191-4d65-e7568bbf7fcf	2253	Destrnik
00050000-556e-e191-5fd0-6b26e908ae19	6215	Divača
00050000-556e-e191-9a08-64d0691d6a38	1233	Dob
00050000-556e-e191-f7b5-b4f929696255	3224	Dobje pri Planini
00050000-556e-e191-31d4-fce368d7f495	8257	Dobova
00050000-556e-e191-0021-d6b96e1277b3	1423	Dobovec
00050000-556e-e191-3314-e4ca22d766a7	5263	Dobravlje
00050000-556e-e191-1f36-3041572de69c	3204	Dobrna
00050000-556e-e191-4c99-577ce81a7644	8211	Dobrnič
00050000-556e-e191-4847-c0e68dac0cc6	1356	Dobrova
00050000-556e-e191-5688-665632a0134f	9223	Dobrovnik/Dobronak 
00050000-556e-e191-bac0-24e229a66d8f	5212	Dobrovo v Brdih
00050000-556e-e191-af42-89fd98d437a9	1431	Dol pri Hrastniku
00050000-556e-e191-7f86-c97b57bc4f9c	1262	Dol pri Ljubljani
00050000-556e-e191-e422-0cf84dbb71d9	1273	Dole pri Litiji
00050000-556e-e191-cca5-f58decc46d12	1331	Dolenja vas
00050000-556e-e191-b850-c02b5bd29268	8350	Dolenjske Toplice
00050000-556e-e191-8285-95628d068398	1230	Domžale
00050000-556e-e191-bc30-da4efc3a54f7	2252	Dornava
00050000-556e-e191-480b-877ac1a1fad9	5294	Dornberk
00050000-556e-e191-961a-ecfb83619f52	1319	Draga
00050000-556e-e191-908d-5af77cc7cfc1	8343	Dragatuš
00050000-556e-e191-7080-456f1d46c779	3222	Dramlje
00050000-556e-e191-ff79-584f08b8f5a8	2370	Dravograd
00050000-556e-e191-b763-345d32d51260	4203	Duplje
00050000-556e-e191-ea41-83f5b565db42	6221	Dutovlje
00050000-556e-e191-933f-09895777f17a	8361	Dvor
00050000-556e-e191-96ef-cf2f20d4f05d	2343	Fala
00050000-556e-e191-0f6f-038de6a80099	9208	Fokovci
00050000-556e-e191-6c28-ae4b3b908baa	2313	Fram
00050000-556e-e191-7a9c-1e644a72a197	3213	Frankolovo
00050000-556e-e191-4b91-e08b97be5486	1274	Gabrovka
00050000-556e-e191-bb1f-f14b635ade65	8254	Globoko
00050000-556e-e191-91de-1e1027ed9cb0	5275	Godovič
00050000-556e-e191-03ad-8de29737bb6f	4204	Golnik
00050000-556e-e191-10fe-ffde4af9dd6b	3303	Gomilsko
00050000-556e-e191-fc9d-42d293122705	4224	Gorenja vas
00050000-556e-e191-2959-99f0c7c1ed39	3263	Gorica pri Slivnici
00050000-556e-e191-a841-837d931fb318	2272	Gorišnica
00050000-556e-e191-f981-f90a5bf59972	9250	Gornja Radgona
00050000-556e-e191-d15e-132de4113a31	3342	Gornji Grad
00050000-556e-e191-721f-adcbb2270059	4282	Gozd Martuljek
00050000-556e-e191-8fe4-a47917957998	6272	Gračišče
00050000-556e-e191-88fb-fbbc32f0a4e9	9264	Grad
00050000-556e-e191-5033-640add129f72	8332	Gradac
00050000-556e-e191-22c8-5c87d75b9bca	1384	Grahovo
00050000-556e-e191-7e9c-06b44717fad4	5242	Grahovo ob Bači
00050000-556e-e191-4bf9-54220be16a3f	5251	Grgar
00050000-556e-e191-b3b5-86c9955b0354	3302	Griže
00050000-556e-e191-d133-23981426f6a2	3231	Grobelno
00050000-556e-e191-7e49-8619dc1ed9c9	1290	Grosuplje
00050000-556e-e191-545c-bd47e7309a09	2288	Hajdina
00050000-556e-e191-8ae7-37d9855ea851	8362	Hinje
00050000-556e-e191-46ce-6f24b12f7851	2311	Hoče
00050000-556e-e191-e5ec-35c4ebe0f280	9205	Hodoš/Hodos
00050000-556e-e191-f14a-49d6a6e54e86	1354	Horjul
00050000-556e-e191-aa55-defddeb31000	1372	Hotedršica
00050000-556e-e191-7873-1b77cb8d5e7b	1430	Hrastnik
00050000-556e-e191-7ab8-5d8497024daa	6225	Hruševje
00050000-556e-e191-9451-48db7729f5fb	4276	Hrušica
00050000-556e-e191-bc5b-fdd80b985197	5280	Idrija
00050000-556e-e191-c607-731b96aa1b10	1292	Ig
00050000-556e-e191-e26c-2ba721ec2451	6250	Ilirska Bistrica
00050000-556e-e191-4a9c-44ea01390fde	6251	Ilirska Bistrica-Trnovo
00050000-556e-e191-4a18-d44548fcfe46	1295	Ivančna Gorica
00050000-556e-e191-36eb-0db649b80786	2259	Ivanjkovci
00050000-556e-e191-6eeb-b65f5cf7336f	1411	Izlake
00050000-556e-e191-ceec-aae60468a73a	6310	Izola/Isola
00050000-556e-e191-2045-c7b7a64083f8	2222	Jakobski Dol
00050000-556e-e191-908a-2ca3a8129b94	2221	Jarenina
00050000-556e-e191-e5fa-a719865f86e9	6254	Jelšane
00050000-556e-e191-dcf3-d0ad7d0fcfcd	4270	Jesenice
00050000-556e-e191-028d-5e03555c023f	8261	Jesenice na Dolenjskem
00050000-556e-e191-4592-a055e94f962d	3273	Jurklošter
00050000-556e-e191-423e-dd881737e8bd	2223	Jurovski Dol
00050000-556e-e191-6815-b62a79833985	2256	Juršinci
00050000-556e-e191-28f9-3aa6751d8737	5214	Kal nad Kanalom
00050000-556e-e191-951e-b92e19c4c760	3233	Kalobje
00050000-556e-e191-d08f-dcb33f6f0c02	4246	Kamna Gorica
00050000-556e-e191-e7eb-588a1d588e18	2351	Kamnica
00050000-556e-e191-c47f-f2b48e93268a	1241	Kamnik
00050000-556e-e191-1c8e-fd05ac7bb8e8	5213	Kanal
00050000-556e-e191-e2ba-c28c47b330db	8258	Kapele
00050000-556e-e191-f0af-e9e5ae069aba	2362	Kapla
00050000-556e-e191-3f87-838b8b4ef7e9	2325	Kidričevo
00050000-556e-e191-73f7-b1c9657a6c93	1412	Kisovec
00050000-556e-e191-7f10-f3b8aba3d567	6253	Knežak
00050000-556e-e191-fdfa-acdc21633041	5222	Kobarid
00050000-556e-e191-f418-a82174159876	9227	Kobilje
00050000-556e-e191-966c-3cf90581cfc2	1330	Kočevje
00050000-556e-e191-b0db-78db6205abc8	1338	Kočevska Reka
00050000-556e-e191-4fe8-5e59da538403	2276	Kog
00050000-556e-e191-205a-7f3cd5bf93c8	5211	Kojsko
00050000-556e-e191-dbd0-53e17756faad	6223	Komen
00050000-556e-e191-5fc6-e03a034abe10	1218	Komenda
00050000-556e-e191-e3ae-1280c2f85510	6000	Koper/Capodistria 
00050000-556e-e191-bee1-152897a09797	6001	Koper/Capodistria - poštni predali
00050000-556e-e191-0c57-94d46b43f0cb	8282	Koprivnica
00050000-556e-e191-845c-63a0ef9ce62e	5296	Kostanjevica na Krasu
00050000-556e-e191-c0fe-65e0a6cee873	8311	Kostanjevica na Krki
00050000-556e-e191-e987-d13d7dd670b8	1336	Kostel
00050000-556e-e191-0d01-c0594ec1e702	6256	Košana
00050000-556e-e191-b991-26f146f6b3e8	2394	Kotlje
00050000-556e-e191-7020-d85809800d35	6240	Kozina
00050000-556e-e191-3a7c-2abe1ea02a7c	3260	Kozje
00050000-556e-e191-7da0-aa4654cf1762	4000	Kranj 
00050000-556e-e191-e585-ffcd3744eb18	4001	Kranj - poštni predali
00050000-556e-e191-206b-b2c1971dd30a	4280	Kranjska Gora
00050000-556e-e191-5ec8-21214a3868c7	1281	Kresnice
00050000-556e-e191-a0a1-c17d96e69a03	4294	Križe
00050000-556e-e191-1936-5f4b3f8ce9bb	9206	Križevci
00050000-556e-e191-014a-91441d1f6156	9242	Križevci pri Ljutomeru
00050000-556e-e191-4555-a3a48b7fa9a5	1301	Krka
00050000-556e-e191-f554-274104821725	8296	Krmelj
00050000-556e-e191-674d-9fab851f57b3	4245	Kropa
00050000-556e-e191-0db7-9f6eaa29de29	8262	Krška vas
00050000-556e-e191-0404-2bce9777eb43	8270	Krško
00050000-556e-e191-4685-ea745604576e	9263	Kuzma
00050000-556e-e191-51fd-50bd81d63c5f	2318	Laporje
00050000-556e-e191-9057-407637ebfc76	3270	Laško
00050000-556e-e191-4a9b-796bcb21657a	1219	Laze v Tuhinju
00050000-556e-e191-e8cb-402fc00512c1	2230	Lenart v Slovenskih goricah
00050000-556e-e191-016e-7e8fdb183b32	9220	Lendava/Lendva
00050000-556e-e191-23ee-1a65f3486297	4248	Lesce
00050000-556e-e191-c7ca-9621547a30c2	3261	Lesično
00050000-556e-e191-3746-6997007149de	8273	Leskovec pri Krškem
00050000-556e-e191-65f4-cc5454876407	2372	Libeliče
00050000-556e-e191-fce4-e6a8c2416dae	2341	Limbuš
00050000-556e-e191-adff-304a54e091ba	1270	Litija
00050000-556e-e191-f0a2-a07c90fa72f0	3202	Ljubečna
00050000-556e-e191-1df1-07c4692fb103	1000	Ljubljana 
00050000-556e-e191-6984-65feead2cef8	1001	Ljubljana - poštni predali
00050000-556e-e191-f048-7d80adfecc47	1231	Ljubljana - Črnuče
00050000-556e-e191-b71c-98fdb57253ef	1261	Ljubljana - Dobrunje
00050000-556e-e191-0c38-b7989029f033	1260	Ljubljana - Polje
00050000-556e-e191-f94c-848cef64c1b5	1210	Ljubljana - Šentvid
00050000-556e-e191-c734-43c7b2577b89	1211	Ljubljana - Šmartno
00050000-556e-e191-24c0-3a017528f411	3333	Ljubno ob Savinji
00050000-556e-e191-1890-6b3311c76145	9240	Ljutomer
00050000-556e-e191-c73b-7ef7c3de16fe	3215	Loče
00050000-556e-e191-073b-306de6c8d1f0	5231	Log pod Mangartom
00050000-556e-e191-84b6-f6d431404afc	1358	Log pri Brezovici
00050000-556e-e191-361f-1792f3e1d681	1370	Logatec
00050000-556e-e191-38de-c0a09c4782b2	1371	Logatec
00050000-556e-e191-0e86-c124271a38ce	1434	Loka pri Zidanem Mostu
00050000-556e-e191-fb79-ed5aa3bc0d40	3223	Loka pri Žusmu
00050000-556e-e191-a0f3-3f8e2892aff7	6219	Lokev
00050000-556e-e191-9d32-77718c37660f	1318	Loški Potok
00050000-556e-e191-78aa-a0b59dd6383e	2324	Lovrenc na Dravskem polju
00050000-556e-e191-3db0-0e283a40d0b2	2344	Lovrenc na Pohorju
00050000-556e-e191-bf93-078cd5cd7943	3334	Luče
00050000-556e-e191-8db1-e80d98c647e8	1225	Lukovica
00050000-556e-e191-61bd-4c107d92bf57	9202	Mačkovci
00050000-556e-e191-d081-8b1a6fbabc19	2322	Majšperk
00050000-556e-e191-e7c3-6ecaa26c9bd6	2321	Makole
00050000-556e-e191-2a61-9c2a04f5624f	9243	Mala Nedelja
00050000-556e-e191-294b-899856725352	2229	Malečnik
00050000-556e-e191-dca4-55f77fa09356	6273	Marezige
00050000-556e-e191-741a-c7b5bb6cbce2	2000	Maribor 
00050000-556e-e191-075b-3b07b3b53c14	2001	Maribor - poštni predali
00050000-556e-e191-3e77-c9629732fb0a	2206	Marjeta na Dravskem polju
00050000-556e-e191-854a-e6c39a2ae988	2281	Markovci
00050000-556e-e191-390b-6ed25e0f6c04	9221	Martjanci
00050000-556e-e191-0ce7-cfe66308047f	6242	Materija
00050000-556e-e191-1652-a59599a96ae2	4211	Mavčiče
00050000-556e-e191-0aac-30bd3b55232e	1215	Medvode
00050000-556e-e191-c61e-24020012589c	1234	Mengeš
00050000-556e-e191-caf9-0ecda4401b0b	8330	Metlika
00050000-556e-e191-7108-afebd50e7631	2392	Mežica
00050000-556e-e191-2516-8e5efedbf8f7	2204	Miklavž na Dravskem polju
00050000-556e-e191-49d0-a1835594c0b7	2275	Miklavž pri Ormožu
00050000-556e-e191-62ce-ab38da8205bc	5291	Miren
00050000-556e-e191-7b22-643608c0de24	8233	Mirna
00050000-556e-e191-407b-66fa2fb4a162	8216	Mirna Peč
00050000-556e-e191-683d-e8597b2e1909	2382	Mislinja
00050000-556e-e191-a317-55aea885b38c	4281	Mojstrana
00050000-556e-e191-1992-43de725bb731	8230	Mokronog
00050000-556e-e191-3d57-8c68059c52fa	1251	Moravče
00050000-556e-e191-bbe2-24dd5aacfc0b	9226	Moravske Toplice
00050000-556e-e191-fa04-dca92f2d5683	5216	Most na Soči
00050000-556e-e191-1185-fbf0c0d757bf	1221	Motnik
00050000-556e-e191-eb51-58b5f4748f49	3330	Mozirje
00050000-556e-e191-39cd-594941007e45	9000	Murska Sobota 
00050000-556e-e191-6dde-3880d1d040bb	9001	Murska Sobota - poštni predali
00050000-556e-e191-ce09-991e905a1ec7	2366	Muta
00050000-556e-e191-e72a-e90bf771143d	4202	Naklo
00050000-556e-e191-3ff6-b27860553e9b	3331	Nazarje
00050000-556e-e191-1600-24bc908d64f2	1357	Notranje Gorice
00050000-556e-e191-798b-c19f10bd31f7	3203	Nova Cerkev
00050000-556e-e191-1075-1ec4e4c04b68	5000	Nova Gorica 
00050000-556e-e191-3fb3-c256cb99e52f	5001	Nova Gorica - poštni predali
00050000-556e-e191-6518-ad7c8eb78fb5	1385	Nova vas
00050000-556e-e191-240a-144942893f87	8000	Novo mesto
00050000-556e-e191-5828-690062e5c29f	8001	Novo mesto - poštni predali
00050000-556e-e191-3d54-cb46c52824fe	6243	Obrov
00050000-556e-e191-c907-20a7ac2ee80a	9233	Odranci
00050000-556e-e191-3924-025d2f4cd2dc	2317	Oplotnica
00050000-556e-e191-e3b0-515cf8f6d295	2312	Orehova vas
00050000-556e-e191-9af1-fb0623ed9562	2270	Ormož
00050000-556e-e191-ab62-8d192084a293	1316	Ortnek
00050000-556e-e191-c99b-cf21638577e3	1337	Osilnica
00050000-556e-e191-43e4-d305093c8a07	8222	Otočec
00050000-556e-e191-feca-b7ab776ed8c1	2361	Ožbalt
00050000-556e-e191-e510-65411ff1830a	2231	Pernica
00050000-556e-e191-9a1c-06323928085b	2211	Pesnica pri Mariboru
00050000-556e-e191-8bc8-3741f7d11181	9203	Petrovci
00050000-556e-e191-959d-1dfa261c8051	3301	Petrovče
00050000-556e-e191-1ad6-daba3ac3d936	6330	Piran/Pirano
00050000-556e-e191-bad4-6e9958b83197	8255	Pišece
00050000-556e-e191-94ca-dbcaf9cf6a07	6257	Pivka
00050000-556e-e191-e118-ea903b9fa013	6232	Planina
00050000-556e-e191-3527-2e18c7b03c24	3225	Planina pri Sevnici
00050000-556e-e191-7c9f-471786d43b0a	6276	Pobegi
00050000-556e-e191-4e95-3e3d7f90249c	8312	Podbočje
00050000-556e-e191-635f-eb689e7d6fe5	5243	Podbrdo
00050000-556e-e191-0021-038c9ea3796f	3254	Podčetrtek
00050000-556e-e191-be0f-37aef7031dde	2273	Podgorci
00050000-556e-e191-6614-da92b2bc06f3	6216	Podgorje
00050000-556e-e191-2715-e92ecefc69bf	2381	Podgorje pri Slovenj Gradcu
00050000-556e-e191-0cf4-bd0db56e19b3	6244	Podgrad
00050000-556e-e191-3c9b-e86295383a97	1414	Podkum
00050000-556e-e191-6aa7-cb14ee3b6f61	2286	Podlehnik
00050000-556e-e191-a80e-07eef7851a7b	5272	Podnanos
00050000-556e-e191-4c07-2e189c4b50fd	4244	Podnart
00050000-556e-e191-ff48-0c4a20b7f8d4	3241	Podplat
00050000-556e-e191-e297-8de0bbf28989	3257	Podsreda
00050000-556e-e191-d925-849413bfba06	2363	Podvelka
00050000-556e-e191-694f-133136c64ed2	2208	Pohorje
00050000-556e-e191-554f-8bef1d6014f6	2257	Polenšak
00050000-556e-e191-271c-0a14e892f3b5	1355	Polhov Gradec
00050000-556e-e191-0415-767f8672200d	4223	Poljane nad Škofjo Loko
00050000-556e-e191-508c-e6ba071e2701	2319	Poljčane
00050000-556e-e191-7606-10d5e6791f43	1272	Polšnik
00050000-556e-e191-1771-f8bbf43c40ef	3313	Polzela
00050000-556e-e191-a7f7-b17f9b42eee7	3232	Ponikva
00050000-556e-e191-60e3-aca1f12a5e31	6320	Portorož/Portorose
00050000-556e-e191-74e8-1eb8560a7a00	6230	Postojna
00050000-556e-e191-ebf7-2604d237a0f9	2331	Pragersko
00050000-556e-e191-fa4e-62b556991859	3312	Prebold
00050000-556e-e191-8fe9-4b389282e2cf	4205	Preddvor
00050000-556e-e191-dfc1-4f0008556b1c	6255	Prem
00050000-556e-e191-d56a-cb1a6d929eb8	1352	Preserje
00050000-556e-e191-93fc-d2d6c4c85ffc	6258	Prestranek
00050000-556e-e191-d647-a3c60ae3b3d1	2391	Prevalje
00050000-556e-e191-ffbb-895d40c278ef	3262	Prevorje
00050000-556e-e191-409d-20ffc3673454	1276	Primskovo 
00050000-556e-e191-9ab1-7a417c2ff8e5	3253	Pristava pri Mestinju
00050000-556e-e191-7ee4-35f105d886cc	9207	Prosenjakovci/Partosfalva
00050000-556e-e191-3bba-36e0ace51d02	5297	Prvačina
00050000-556e-e191-8c4f-5ca0b6699a65	2250	Ptuj
00050000-556e-e191-5a41-f72f0430ad3c	2323	Ptujska Gora
00050000-556e-e191-21bf-ae96bee1bcde	9201	Puconci
00050000-556e-e191-6b0d-0ca261c54871	2327	Rače
00050000-556e-e191-3c43-96b798a09a22	1433	Radeče
00050000-556e-e191-dadc-979129437217	9252	Radenci
00050000-556e-e191-4f70-2e6d7b81b26f	2360	Radlje ob Dravi
00050000-556e-e191-6b0c-b815c7ffd9f4	1235	Radomlje
00050000-556e-e191-6358-116adb146e7d	4240	Radovljica
00050000-556e-e191-4926-ccadc0be436b	8274	Raka
00050000-556e-e191-d021-3185270662a3	1381	Rakek
00050000-556e-e191-a82a-e74c56b1ab86	4283	Rateče - Planica
00050000-556e-e191-a089-48eec839d37b	2390	Ravne na Koroškem
00050000-556e-e191-9c8a-d45980d269f9	9246	Razkrižje
00050000-556e-e191-44d3-24392a05cf38	3332	Rečica ob Savinji
00050000-556e-e191-90bd-55b079a2a22f	5292	Renče
00050000-556e-e191-3b96-b85fcbe46050	1310	Ribnica
00050000-556e-e191-1e14-c5f8cfd70074	2364	Ribnica na Pohorju
00050000-556e-e191-e094-0f08320aeffb	3272	Rimske Toplice
00050000-556e-e191-6380-9d155816d7bd	1314	Rob
00050000-556e-e191-0fbd-66064cfce14c	5215	Ročinj
00050000-556e-e191-f693-20e206f91deb	3250	Rogaška Slatina
00050000-556e-e191-3b47-4553067e8166	9262	Rogašovci
00050000-556e-e191-0173-8a26f440d268	3252	Rogatec
00050000-556e-e191-c71b-fdd6086de708	1373	Rovte
00050000-556e-e191-b77b-a99deb5c9fed	2342	Ruše
00050000-556e-e191-277c-1484b28348aa	1282	Sava
00050000-556e-e191-b163-7aab6107716a	6333	Sečovlje/Sicciole
00050000-556e-e191-9300-d64c92e7d212	4227	Selca
00050000-556e-e191-469f-c776bca82411	2352	Selnica ob Dravi
00050000-556e-e191-e046-399cff842bb1	8333	Semič
00050000-556e-e191-4665-46a63d9eca83	8281	Senovo
00050000-556e-e191-82b2-1f7acbf9dc12	6224	Senožeče
00050000-556e-e191-f845-cb2b45fa352a	8290	Sevnica
00050000-556e-e191-a325-643680643029	6210	Sežana
00050000-556e-e191-9468-3bb9763588d1	2214	Sladki Vrh
00050000-556e-e191-ccd7-6f75a7314187	5283	Slap ob Idrijci
00050000-556e-e191-b11c-63f03606fc83	2380	Slovenj Gradec
00050000-556e-e191-e426-bef1a9d479e3	2310	Slovenska Bistrica
00050000-556e-e191-7a3c-972960d37f49	3210	Slovenske Konjice
00050000-556e-e191-cd43-489a71b1254b	1216	Smlednik
00050000-556e-e191-55e5-33c878039626	5232	Soča
00050000-556e-e191-d45f-c14281e2d8f3	1317	Sodražica
00050000-556e-e191-c772-c8cb9248e908	3335	Solčava
00050000-556e-e191-a3f4-c71fbb6357e5	5250	Solkan
00050000-556e-e191-3918-92dfba4b94a2	4229	Sorica
00050000-556e-e191-aa3b-c99594a85f73	4225	Sovodenj
00050000-556e-e191-9772-84164353710f	5281	Spodnja Idrija
00050000-556e-e191-73d1-e32977f1a917	2241	Spodnji Duplek
00050000-556e-e191-1d16-8ee0ef9d8b1c	9245	Spodnji Ivanjci
00050000-556e-e191-c28c-5fb0a090b066	2277	Središče ob Dravi
00050000-556e-e191-118b-d9fb51bf9eec	4267	Srednja vas v Bohinju
00050000-556e-e191-c04d-d09ad70d3f75	8256	Sromlje 
00050000-556e-e191-c27f-fa97b63ce61c	5224	Srpenica
00050000-556e-e191-6608-23664a596187	1242	Stahovica
00050000-556e-e191-1c5b-9ada9b0e74ab	1332	Stara Cerkev
00050000-556e-e191-8276-753a701a0819	8342	Stari trg ob Kolpi
00050000-556e-e191-ca2d-2fe41003a805	1386	Stari trg pri Ložu
00050000-556e-e191-c58a-d44e065a2d75	2205	Starše
00050000-556e-e191-0030-74067d72fd71	2289	Stoperce
00050000-556e-e191-4d14-d4ea2f3d1de7	8322	Stopiče
00050000-556e-e191-276a-fd491317e615	3206	Stranice
00050000-556e-e191-4679-b00381c12cb4	8351	Straža
00050000-556e-e191-c38f-ff676f4353b0	1313	Struge
00050000-556e-e191-411a-ea3b3748e640	8293	Studenec
00050000-556e-e191-6b41-e9c5fe48dfa0	8331	Suhor
00050000-556e-e191-1aa9-7d561f38fbe9	2233	Sv. Ana v Slovenskih goricah
00050000-556e-e191-c551-86257439c6c8	2235	Sv. Trojica v Slovenskih goricah
00050000-556e-e191-023f-4dc952df33ee	2353	Sveti Duh na Ostrem Vrhu
00050000-556e-e191-c4c1-d63f225f05d9	9244	Sveti Jurij ob Ščavnici
00050000-556e-e191-d33a-6d01ac8b7765	3264	Sveti Štefan
00050000-556e-e191-d999-33228ef8e749	2258	Sveti Tomaž
00050000-556e-e191-61df-ea13e385c5f0	9204	Šalovci
00050000-556e-e191-91be-0ca8d078b6ed	5261	Šempas
00050000-556e-e191-71c1-083114869c7a	5290	Šempeter pri Gorici
00050000-556e-e191-0407-c465115cafd3	3311	Šempeter v Savinjski dolini
00050000-556e-e191-d537-d17d9f6f375e	4208	Šenčur
00050000-556e-e191-44d4-aebf4d99ed24	2212	Šentilj v Slovenskih goricah
00050000-556e-e191-bfef-07a8ab9bef45	8297	Šentjanž
00050000-556e-e191-abf6-703cfc3a11a7	2373	Šentjanž pri Dravogradu
00050000-556e-e191-0019-b941fa77de57	8310	Šentjernej
00050000-556e-e191-a4d1-eadd1018b268	3230	Šentjur
00050000-556e-e191-205a-ef5bb5795895	3271	Šentrupert
00050000-556e-e191-a3e0-fdb6cb57b2ba	8232	Šentrupert
00050000-556e-e191-3e82-cf7c3a6af759	1296	Šentvid pri Stični
00050000-556e-e191-6e47-43026f10924f	8275	Škocjan
00050000-556e-e191-c542-3875e20b155a	6281	Škofije
00050000-556e-e191-4b0a-6e5cd1c55666	4220	Škofja Loka
00050000-556e-e191-34ed-2d8a55dd0f8b	3211	Škofja vas
00050000-556e-e191-29e2-463db8c40f8b	1291	Škofljica
00050000-556e-e191-f2bd-5ffd4aa26da5	6274	Šmarje
00050000-556e-e191-9064-fe25614d3d90	1293	Šmarje - Sap
00050000-556e-e191-705d-39581734867d	3240	Šmarje pri Jelšah
00050000-556e-e191-ede7-0d766757eaa9	8220	Šmarješke Toplice
00050000-556e-e191-ec3e-4d093c752e7f	2315	Šmartno na Pohorju
00050000-556e-e191-a263-a0c3583b94d2	3341	Šmartno ob Dreti
00050000-556e-e191-536b-ed55d0e59417	3327	Šmartno ob Paki
00050000-556e-e191-8636-85aafd2da8e7	1275	Šmartno pri Litiji
00050000-556e-e191-127b-ff92cd3d8845	2383	Šmartno pri Slovenj Gradcu
00050000-556e-e191-2677-bc91afe82b09	3201	Šmartno v Rožni dolini
00050000-556e-e191-eb9c-6d60d7367407	3325	Šoštanj
00050000-556e-e191-ca56-99b55aa9d45a	6222	Štanjel
00050000-556e-e191-4eea-527f7f4ec518	3220	Štore
00050000-556e-e191-0ddb-c4587326c23b	3304	Tabor
00050000-556e-e191-5314-364d8c6d4042	3221	Teharje
00050000-556e-e191-7002-56b4d18c167b	9251	Tišina
00050000-556e-e191-9d0b-d55bc0b37abc	5220	Tolmin
00050000-556e-e191-b0a5-c14568005661	3326	Topolšica
00050000-556e-e191-4154-8c80a6916877	2371	Trbonje
00050000-556e-e191-424d-3bdbe555e05f	1420	Trbovlje
00050000-556e-e191-297f-7e7bbe608928	8231	Trebelno 
00050000-556e-e191-bb0b-457550d159f9	8210	Trebnje
00050000-556e-e191-113c-5694af4a3782	5252	Trnovo pri Gorici
00050000-556e-e191-8a6f-2bc0165f5548	2254	Trnovska vas
00050000-556e-e191-7840-2b4dab07d3b9	1222	Trojane
00050000-556e-e191-1117-431c29294575	1236	Trzin
00050000-556e-e191-e12c-fa4ebefd6bf4	4290	Tržič
00050000-556e-e191-4513-7be9232e59aa	8295	Tržišče
00050000-556e-e191-50a3-7237eba73458	1311	Turjak
00050000-556e-e191-7477-b2f215b47558	9224	Turnišče
00050000-556e-e191-b515-5edc5221b765	8323	Uršna sela
00050000-556e-e191-52bd-43e31d2845c5	1252	Vače
00050000-556e-e191-11f8-04752eb48467	3320	Velenje 
00050000-556e-e191-5902-e854734223f3	3322	Velenje - poštni predali
00050000-556e-e191-452f-b560a3461419	8212	Velika Loka
00050000-556e-e191-8e73-bb98520e115f	2274	Velika Nedelja
00050000-556e-e191-4df8-3315982a4a2b	9225	Velika Polana
00050000-556e-e191-3dcd-490df5a42150	1315	Velike Lašče
00050000-556e-e191-ca0f-489d876ff1c4	8213	Veliki Gaber
00050000-556e-e191-eaeb-0d0420c17b07	9241	Veržej
00050000-556e-e191-1b44-dd5935b99773	1312	Videm - Dobrepolje
00050000-556e-e191-ae68-92baaaa23182	2284	Videm pri Ptuju
00050000-556e-e191-8905-a7cb7ea81338	8344	Vinica
00050000-556e-e191-9d5d-498e2bb4c62f	5271	Vipava
00050000-556e-e191-b966-ff50503d6a12	4212	Visoko
00050000-556e-e191-0157-47daada7236c	1294	Višnja Gora
00050000-556e-e191-c2aa-f0e6d3712711	3205	Vitanje
00050000-556e-e191-bb7b-9fefbd98c63a	2255	Vitomarci
00050000-556e-e191-1f99-e88353ef6d80	1217	Vodice
00050000-556e-e191-e53f-bd4e4be6c492	3212	Vojnik\t
00050000-556e-e191-366a-041358fe1ae6	5293	Volčja Draga
00050000-556e-e191-fd0a-40620c299a5a	2232	Voličina
00050000-556e-e191-2bde-7ac87773d503	3305	Vransko
00050000-556e-e191-a2dd-9af5dd10ff0f	6217	Vremski Britof
00050000-556e-e191-bdd7-001911f39f50	1360	Vrhnika
00050000-556e-e191-26ae-910e54a8cf83	2365	Vuhred
00050000-556e-e191-44fd-d8d365469699	2367	Vuzenica
00050000-556e-e191-b43f-5cc9e8a986e0	8292	Zabukovje 
00050000-556e-e191-5295-cce969263b81	1410	Zagorje ob Savi
00050000-556e-e191-df9b-a8d6a435e824	1303	Zagradec
00050000-556e-e191-8188-eb08e7ca5487	2283	Zavrč
00050000-556e-e191-0984-ea25d727e47d	8272	Zdole 
00050000-556e-e191-e6a4-e80cf5554dc3	4201	Zgornja Besnica
00050000-556e-e191-3e1a-4542aa0646a7	2242	Zgornja Korena
00050000-556e-e191-e318-058557522635	2201	Zgornja Kungota
00050000-556e-e191-e51e-7d765e2138b6	2316	Zgornja Ložnica
00050000-556e-e191-02db-205d37fce182	2314	Zgornja Polskava
00050000-556e-e191-ff11-2747ac369f4d	2213	Zgornja Velka
00050000-556e-e191-07d3-fd5c06fb3c09	4247	Zgornje Gorje
00050000-556e-e191-ba04-a832c872ab1d	4206	Zgornje Jezersko
00050000-556e-e191-7699-41dbf55c60c4	2285	Zgornji Leskovec
00050000-556e-e191-aa72-ac0f7d69f7d6	1432	Zidani Most
00050000-556e-e191-cdd8-3f6ee2b7d4db	3214	Zreče
00050000-556e-e191-6296-6da9983f1e5f	4209	Žabnica
00050000-556e-e191-00d3-0cec67b1f0b5	3310	Žalec
00050000-556e-e191-a671-4fd3de068d84	4228	Železniki
00050000-556e-e191-3720-f76851a3b961	2287	Žetale
00050000-556e-e191-56fd-95ca117b8b06	4226	Žiri
00050000-556e-e191-cb5e-b6cf69edf4de	4274	Žirovnica
00050000-556e-e191-7879-d71dc263a761	8360	Žužemberk
\.


--
-- TOC entry 2803 (class 0 OID 6196046)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6195857)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6195935)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6196058)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6196178)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6196229)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-556e-e192-89d2-4e0143579814	00080000-556e-e192-af1b-6e4a463e8699	0987	A
00190000-556e-e192-39f1-0bfab4b1ade4	00080000-556e-e192-1459-6b34ca26ef43	0989	A
\.


--
-- TOC entry 2829 (class 0 OID 6196341)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6196369)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 238
-- Name: programfestival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programfestival_id_seq', 1, false);


--
-- TOC entry 2830 (class 0 OID 6196350)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 236
-- Name: programgostovanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programgostovanje_id_seq', 1, false);


--
-- TOC entry 2809 (class 0 OID 6196087)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556e-e192-c795-dfab05a9f4aa	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556e-e192-d84c-5dd8d2bbdada	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556e-e192-1c9a-bd7adcf0c23f	0003	Kazinska	t	84	Kazinska dvorana
00220000-556e-e192-f5e6-9641957ccc9d	0004	Mali oder	t	24	Mali oder 
00220000-556e-e192-3fae-c92167fc2a40	0005	Komorni oder	t	15	Komorni oder
00220000-556e-e192-440f-b8e5c5008471	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556e-e192-0395-ae79c1c8a794	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2801 (class 0 OID 6196031)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6196021)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6196218)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6196155)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 6195729)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556e-e191-3d3d-17746badf7b8	00010000-556e-e191-5974-3a4953ea2c2c	2015-06-03 13:14:27	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROV0WV/Wt16sk6NzQQ0gFxFmmzpVZpNTW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2810 (class 0 OID 6196097)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2778 (class 0 OID 6195767)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556e-e191-2d49-05b70611a39f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556e-e191-80ff-68f2aac9bc96	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556e-e191-7b85-e3e3ca838d2b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556e-e191-752c-6f3284399238	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556e-e191-7d98-421a3f78fb97	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556e-e191-9d53-6cde0fa51727	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2776 (class 0 OID 6195751)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556e-e191-3d3d-17746badf7b8	00020000-556e-e191-752c-6f3284399238
00010000-556e-e191-5974-3a4953ea2c2c	00020000-556e-e191-752c-6f3284399238
\.


--
-- TOC entry 2812 (class 0 OID 6196111)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6196052)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6196002)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 6196388)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556e-e191-9d16-1a4c2d01318a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556e-e191-f9c8-e96f18e8ffe9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556e-e191-dd26-d48609098115	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556e-e191-a703-4c2b23854d39	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556e-e191-8198-2f67871c491e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2834 (class 0 OID 6196380)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556e-e191-5347-547e2aa6e61c	00000000-556e-e191-a703-4c2b23854d39	popa
00000000-556e-e191-8b5c-79e54dad2c4c	00000000-556e-e191-a703-4c2b23854d39	oseba
00000000-556e-e191-b791-954a59796b53	00000000-556e-e191-f9c8-e96f18e8ffe9	prostor
00000000-556e-e191-9490-3f6d76bf72e2	00000000-556e-e191-a703-4c2b23854d39	besedilo
00000000-556e-e191-f308-642a601f25e6	00000000-556e-e191-a703-4c2b23854d39	uprizoritev
00000000-556e-e191-9319-3781a0d85804	00000000-556e-e191-a703-4c2b23854d39	funkcija
00000000-556e-e191-6235-018f59d78cc0	00000000-556e-e191-a703-4c2b23854d39	tipfunkcije
00000000-556e-e191-bb92-9bbd23eb8d0d	00000000-556e-e191-a703-4c2b23854d39	alternacija
00000000-556e-e191-76d3-81eeb9549c30	00000000-556e-e191-9d16-1a4c2d01318a	pogodba
00000000-556e-e191-34f7-66f5e6a89323	00000000-556e-e191-a703-4c2b23854d39	zaposlitev
\.


--
-- TOC entry 2833 (class 0 OID 6196375)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6196165)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6195829)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2799 (class 0 OID 6196008)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556e-e192-43ab-4f6be14401cb	00180000-556e-e192-d675-cacace9187fc	000c0000-556e-e192-09a7-fffba62452aa	00090000-556e-e192-b468-9e2e9eea2859	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-e192-1f61-797cd6e234af	00180000-556e-e192-d675-cacace9187fc	000c0000-556e-e192-af9f-5b2e5dd89690	00090000-556e-e192-2e5a-e240e37c2032	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-e192-c1ad-0ddb05e83598	00180000-556e-e192-d675-cacace9187fc	000c0000-556e-e192-54c9-55fb0056407d	00090000-556e-e192-a6eb-ac3121a58886	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-e192-f1d2-d7c22cc741d4	00180000-556e-e192-d675-cacace9187fc	000c0000-556e-e192-b1ce-9f67789ccbc9	00090000-556e-e192-6178-75b7299abca0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-e192-793a-801f134fb456	00180000-556e-e192-d675-cacace9187fc	000c0000-556e-e192-9658-dc1634c78e62	00090000-556e-e192-e654-0d5d73642700	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-e192-fa06-bbac74025775	00180000-556e-e192-9aa9-ddd480c244ad	\N	00090000-556e-e192-e654-0d5d73642700	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2820 (class 0 OID 6196207)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556e-e191-600d-e5d1b879d268	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556e-e191-9f42-1a96f8d7e03b	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556e-e191-fd04-fb5409b48d4c	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556e-e191-ee79-7fcec56a3a1b	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556e-e191-7eab-62a8b0dff27c	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556e-e191-0310-182e40fab2dd	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556e-e191-6dd7-10c1ea2bce34	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556e-e191-9016-de008546a184	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556e-e191-0394-8f3d2b188dea	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556e-e191-f5ce-0fa984691827	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556e-e191-a347-aab148d1bb6a	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556e-e191-c5fa-8310d3e19dda	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556e-e191-8a86-1a9c6e1bcc0f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556e-e191-9b31-8d7d6749f5c8	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556e-e191-744f-bd535b548476	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556e-e191-b3e5-bb1ddd13a568	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2831 (class 0 OID 6196358)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipprogramskeenote_id_seq', 1, false);


--
-- TOC entry 2788 (class 0 OID 6195892)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 6195738)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556e-e191-5974-3a4953ea2c2c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROcO/EG9dX1ER3qWMVUYL6lKmQfVVQSc.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556e-e192-a3d2-f98f5c2b0b88	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556e-e192-65e6-02556ee10df0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556e-e192-f544-f536638794e7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556e-e192-25c2-139edae90801	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556e-e192-96d2-515188023faa	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-556e-e192-e5da-3329aa60f537	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-556e-e191-3d3d-17746badf7b8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2825 (class 0 OID 6196263)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556e-e192-f340-903667aa8dcc	00160000-556e-e192-fd01-e27f9109b162	00150000-556e-e191-b92a-7f2edd6761ac	00140000-556e-e191-18c8-4a58dbf1b58c	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556e-e192-3fae-c92167fc2a40
000e0000-556e-e192-ea56-e5e5c136778c	00160000-556e-e192-db99-9dd440963f2b	00150000-556e-e191-f1c3-a15983b539f5	00140000-556e-e191-bfe2-c4749c47bbe9	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556e-e192-440f-b8e5c5008471
\.


--
-- TOC entry 2793 (class 0 OID 6195954)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556e-e192-c959-152ba5980147	000e0000-556e-e192-ea56-e5e5c136778c	1	
00200000-556e-e192-57c0-e7e06f365da9	000e0000-556e-e192-ea56-e5e5c136778c	2	
\.


--
-- TOC entry 2808 (class 0 OID 6196079)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6196148)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6195986)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6196253)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556e-e191-18c8-4a58dbf1b58c	Drama	drama (SURS 01)
00140000-556e-e191-3c8f-11622da63124	Opera	opera (SURS 02)
00140000-556e-e191-1cb3-422217d4ee2e	Balet	balet (SURS 03)
00140000-556e-e191-1cff-f89d439bf7a2	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556e-e191-e84c-e7975fdf60ce	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556e-e191-bfe2-c4749c47bbe9	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556e-e191-5f37-998b8330cf4c	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2814 (class 0 OID 6196138)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556e-e191-b33e-86c59bad9243	Opera	opera
00150000-556e-e191-8951-bf15fbc0bcdd	Opereta	opereta
00150000-556e-e191-0e89-c7a3825245ca	Balet	balet
00150000-556e-e191-eae8-5e26736e9b3e	Plesne prireditve	plesne prireditve
00150000-556e-e191-32a2-f54ea12a8726	Lutkovno gledališče	lutkovno gledališče
00150000-556e-e191-f73d-b0e0dbb6f5f8	Raziskovalno gledališče	raziskovalno gledališče
00150000-556e-e191-fad0-ca7bd9a80e2a	Biografska drama	biografska drama
00150000-556e-e191-b92a-7f2edd6761ac	Komedija	komedija
00150000-556e-e191-3576-a02bad8975e0	Črna komedija	črna komedija
00150000-556e-e191-8ae9-d8b8527e5a8d	E-igra	E-igra
00150000-556e-e191-f1c3-a15983b539f5	Kriminalka	kriminalka
00150000-556e-e191-3015-f11c46b8fb62	Musical	musical
\.


--
-- TOC entry 2368 (class 2606 OID 6195792)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6196308)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6196298)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 6196206)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 6195976)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 6196001)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 6195918)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 6196337)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 6196134)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6195952)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6195995)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 6195932)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6196044)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 6196071)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 6195890)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 6195801)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2375 (class 2606 OID 6195825)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 6195781)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2359 (class 2606 OID 6195766)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 6196077)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6196110)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 6196248)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 6195854)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6195878)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 6196050)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 6195868)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 6195939)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 6196062)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6196190)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6196234)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6196348)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 6196373)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6196355)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 6196094)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 6196035)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6196026)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 6196228)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 6196162)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 6195737)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 6196101)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 6195755)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2361 (class 2606 OID 6195775)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 6196119)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6196057)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 6196007)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6196397)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 6196385)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 6196379)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6196175)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 6195834)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 6196017)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6196217)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6196368)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 6195903)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6195750)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 6196278)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6195961)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 6196085)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6196153)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 6195990)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6196262)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6196147)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 1259 OID 6195983)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2507 (class 1259 OID 6196176)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 6196177)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 6195856)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2341 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2342 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2343 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2473 (class 1259 OID 6196078)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2467 (class 1259 OID 6196064)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2468 (class 1259 OID 6196063)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2419 (class 1259 OID 6195962)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2495 (class 1259 OID 6196135)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2496 (class 1259 OID 6196137)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2497 (class 1259 OID 6196136)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2407 (class 1259 OID 6195934)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2408 (class 1259 OID 6195933)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 6196250)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 6196251)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2527 (class 1259 OID 6196252)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2533 (class 1259 OID 6196283)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2534 (class 1259 OID 6196280)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2535 (class 1259 OID 6196282)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2536 (class 1259 OID 6196281)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2397 (class 1259 OID 6195905)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 6195904)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2373 (class 1259 OID 6195828)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2483 (class 1259 OID 6196102)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2437 (class 1259 OID 6195996)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2363 (class 1259 OID 6195782)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2364 (class 1259 OID 6195783)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2488 (class 1259 OID 6196122)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2489 (class 1259 OID 6196121)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 6196120)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2411 (class 1259 OID 6195940)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 6195942)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2413 (class 1259 OID 6195941)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2571 (class 1259 OID 6196387)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2447 (class 1259 OID 6196030)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2448 (class 1259 OID 6196028)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2449 (class 1259 OID 6196027)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2450 (class 1259 OID 6196029)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2354 (class 1259 OID 6195756)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2355 (class 1259 OID 6195757)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2476 (class 1259 OID 6196086)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2462 (class 1259 OID 6196051)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2503 (class 1259 OID 6196163)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2504 (class 1259 OID 6196164)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 6196338)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2555 (class 1259 OID 6196340)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2556 (class 1259 OID 6196339)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2386 (class 1259 OID 6195870)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2387 (class 1259 OID 6195869)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2388 (class 1259 OID 6195871)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 6196374)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2511 (class 1259 OID 6196191)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2512 (class 1259 OID 6196192)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2546 (class 1259 OID 6196312)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 6196311)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2548 (class 1259 OID 6196314)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2549 (class 1259 OID 6196310)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2550 (class 1259 OID 6196313)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2500 (class 1259 OID 6196154)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2453 (class 1259 OID 6196039)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2454 (class 1259 OID 6196038)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2455 (class 1259 OID 6196036)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2456 (class 1259 OID 6196037)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2542 (class 1259 OID 6196300)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2543 (class 1259 OID 6196299)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2557 (class 1259 OID 6196349)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2418 (class 1259 OID 6195953)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2369 (class 1259 OID 6195803)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2370 (class 1259 OID 6195802)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2378 (class 1259 OID 6195835)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2379 (class 1259 OID 6195836)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2442 (class 1259 OID 6196020)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 6196019)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2444 (class 1259 OID 6196018)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2560 (class 1259 OID 6196357)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2561 (class 1259 OID 6196356)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 6195985)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2426 (class 1259 OID 6195981)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2427 (class 1259 OID 6195978)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2428 (class 1259 OID 6195979)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2429 (class 1259 OID 6195977)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2430 (class 1259 OID 6195982)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2431 (class 1259 OID 6195980)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2385 (class 1259 OID 6195855)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2403 (class 1259 OID 6195919)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2404 (class 1259 OID 6195921)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2405 (class 1259 OID 6195920)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2406 (class 1259 OID 6195922)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2461 (class 1259 OID 6196045)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6196249)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 6196279)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2376 (class 1259 OID 6195826)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2377 (class 1259 OID 6195827)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2577 (class 1259 OID 6196398)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2396 (class 1259 OID 6195891)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2574 (class 1259 OID 6196386)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2481 (class 1259 OID 6196096)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2482 (class 1259 OID 6196095)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 6196309)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2340 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2393 (class 1259 OID 6195879)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 6196235)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 6196236)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2362 (class 1259 OID 6195776)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2432 (class 1259 OID 6195984)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2603 (class 2606 OID 6196540)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2606 (class 2606 OID 6196525)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2605 (class 2606 OID 6196530)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2601 (class 2606 OID 6196550)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2607 (class 2606 OID 6196520)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2602 (class 2606 OID 6196545)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2604 (class 2606 OID 6196535)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2637 (class 2606 OID 6196695)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6196700)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6196455)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2624 (class 2606 OID 6196635)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2622 (class 2606 OID 6196630)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2623 (class 2606 OID 6196625)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2600 (class 2606 OID 6196515)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 6196665)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2630 (class 2606 OID 6196675)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2631 (class 2606 OID 6196670)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2594 (class 2606 OID 6196490)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2595 (class 2606 OID 6196485)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2620 (class 2606 OID 6196615)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2643 (class 2606 OID 6196720)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 6196725)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6196730)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2644 (class 2606 OID 6196750)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2647 (class 2606 OID 6196735)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2645 (class 2606 OID 6196745)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2646 (class 2606 OID 6196740)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2592 (class 2606 OID 6196480)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2593 (class 2606 OID 6196475)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 6196440)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2585 (class 2606 OID 6196435)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 6196645)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2608 (class 2606 OID 6196555)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2581 (class 2606 OID 6196415)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2580 (class 2606 OID 6196420)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2627 (class 2606 OID 6196660)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2628 (class 2606 OID 6196655)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2629 (class 2606 OID 6196650)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2598 (class 2606 OID 6196495)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2596 (class 2606 OID 6196505)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2597 (class 2606 OID 6196500)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2662 (class 2606 OID 6196825)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2612 (class 2606 OID 6196590)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2614 (class 2606 OID 6196580)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2615 (class 2606 OID 6196575)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2613 (class 2606 OID 6196585)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2579 (class 2606 OID 6196405)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2578 (class 2606 OID 6196410)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2625 (class 2606 OID 6196640)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2621 (class 2606 OID 6196620)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2635 (class 2606 OID 6196685)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2634 (class 2606 OID 6196690)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 6196790)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6196800)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 6196795)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2590 (class 2606 OID 6196465)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6196460)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2589 (class 2606 OID 6196470)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2661 (class 2606 OID 6196820)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2639 (class 2606 OID 6196705)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6196710)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2652 (class 2606 OID 6196775)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 6196770)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2650 (class 2606 OID 6196785)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2654 (class 2606 OID 6196765)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2651 (class 2606 OID 6196780)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2633 (class 2606 OID 6196680)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6196610)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2617 (class 2606 OID 6196605)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2619 (class 2606 OID 6196595)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2618 (class 2606 OID 6196600)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2648 (class 2606 OID 6196760)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2649 (class 2606 OID 6196755)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2658 (class 2606 OID 6196805)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2599 (class 2606 OID 6196510)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2640 (class 2606 OID 6196715)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2582 (class 2606 OID 6196430)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2583 (class 2606 OID 6196425)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2587 (class 2606 OID 6196445)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2586 (class 2606 OID 6196450)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2609 (class 2606 OID 6196570)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2610 (class 2606 OID 6196565)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2611 (class 2606 OID 6196560)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2659 (class 2606 OID 6196815)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 6196810)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-03 13:14:27 CEST

--
-- PostgreSQL database dump complete
--

