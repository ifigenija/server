--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-26 16:56:31 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 232 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 232
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 5150063)
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
-- TOC entry 227 (class 1259 OID 5150573)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
    pogodba_id uuid,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean
);


--
-- TOC entry 226 (class 1259 OID 5150556)
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
-- TOC entry 219 (class 1259 OID 5150467)
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
-- TOC entry 194 (class 1259 OID 5150237)
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
-- TOC entry 197 (class 1259 OID 5150271)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5150184)
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
-- TOC entry 213 (class 1259 OID 5150397)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekirvanj integer
);


--
-- TOC entry 192 (class 1259 OID 5150221)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5150265)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5150201)
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
-- TOC entry 202 (class 1259 OID 5150314)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5150339)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5150158)
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
-- TOC entry 181 (class 1259 OID 5150072)
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
-- TOC entry 182 (class 1259 OID 5150083)
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
-- TOC entry 177 (class 1259 OID 5150037)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5150056)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5150346)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5150377)
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
-- TOC entry 223 (class 1259 OID 5150510)
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
-- TOC entry 184 (class 1259 OID 5150115)
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
-- TOC entry 186 (class 1259 OID 5150150)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5150320)
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
-- TOC entry 185 (class 1259 OID 5150135)
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
-- TOC entry 191 (class 1259 OID 5150213)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5150332)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5150452)
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
-- TOC entry 222 (class 1259 OID 5150503)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5150361)
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
-- TOC entry 201 (class 1259 OID 5150305)
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
-- TOC entry 200 (class 1259 OID 5150295)
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
-- TOC entry 221 (class 1259 OID 5150492)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5150429)
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
-- TOC entry 174 (class 1259 OID 5150008)
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
-- TOC entry 173 (class 1259 OID 5150006)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 5150371)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5150046)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5150030)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5150385)
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
-- TOC entry 204 (class 1259 OID 5150326)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5150276)
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
-- TOC entry 230 (class 1259 OID 5150598)
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
-- TOC entry 229 (class 1259 OID 5150591)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5150586)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5150439)
-- Name: strosekuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE strosekuprizoritve (
    id integer NOT NULL,
    uprizoritev_id uuid,
    popa_id uuid,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrednostdo numeric(10,0) DEFAULT NULL::numeric,
    vrednostna numeric(10,0) DEFAULT NULL::numeric,
    opis text,
    sort integer
);


--
-- TOC entry 231 (class 1259 OID 5150606)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5150107)
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
-- TOC entry 199 (class 1259 OID 5150282)
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
-- TOC entry 220 (class 1259 OID 5150481)
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
-- TOC entry 188 (class 1259 OID 5150170)
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
-- TOC entry 175 (class 1259 OID 5150017)
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
-- TOC entry 225 (class 1259 OID 5150536)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
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
-- TOC entry 193 (class 1259 OID 5150228)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5150353)
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
-- TOC entry 215 (class 1259 OID 5150421)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    status character varying(10) DEFAULT NULL::character varying,
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
-- TOC entry 195 (class 1259 OID 5150260)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5150526)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5150411)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5150011)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5150063)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5150573)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5150556)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5150467)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5564-899e-2897-3b6d28097dfd	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5564-899e-f9c1-141442218710	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5564-899e-ea5d-910a2d4f490a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5150237)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5150271)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5150184)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5564-899d-819b-463a1e428348	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5564-899d-c05d-1a3918be7a2c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5564-899d-c210-19a9561aefa2	AL	ALB	008	Albania 	Albanija	\N
00040000-5564-899d-76bf-e16bee746e74	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5564-899d-a4dd-ed4ee96cfc5f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5564-899d-25d3-6394237255a7	AD	AND	020	Andorra 	Andora	\N
00040000-5564-899d-cc53-a5cb3882209f	AO	AGO	024	Angola 	Angola	\N
00040000-5564-899d-cda5-4ed40ee3c775	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5564-899d-ef11-1798712b177e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5564-899d-9917-cb5ee44a15b5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-899d-bb2c-98ea3d4b6ab2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5564-899d-2c4e-ae21d56b8d7b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5564-899d-f13d-fa4221094a33	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5564-899d-ce01-c578e7905e5c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5564-899d-ffad-8353637e7b7d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5564-899d-fcbe-b3ec7201b104	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5564-899d-f1c7-cc54efcb5f39	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5564-899d-8614-5cea6dd568dc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5564-899d-196f-799b79e8d47b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5564-899d-f951-e9616e7a1f89	BB	BRB	052	Barbados 	Barbados	\N
00040000-5564-899d-a0e2-23ae532880c1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5564-899d-f1d1-e8eccb64bb79	BE	BEL	056	Belgium 	Belgija	\N
00040000-5564-899d-0a82-237374489057	BZ	BLZ	084	Belize 	Belize	\N
00040000-5564-899d-f30f-1697c9fc41f8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5564-899d-b74e-c3c0eb9db3d3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5564-899d-cbfe-dd890ec46ba3	BT	BTN	064	Bhutan 	Butan	\N
00040000-5564-899d-efe9-d94a4ca1c68a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5564-899d-51a0-61ef29d200bf	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5564-899d-aca0-427fb89fda18	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5564-899d-51c8-f65eb149a2c4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5564-899d-f300-9b62e86bdd5d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5564-899d-5bbb-f3c480881601	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5564-899d-7df1-c1c1bd75f292	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5564-899d-5730-bedefa14390f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5564-899d-6cd7-3803b64301ac	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5564-899d-062b-ad2b2780dccb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5564-899d-ffc8-4e5ece951d3b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5564-899d-f89b-6674e7b0b800	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5564-899d-91d7-8a079749abdf	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5564-899d-cdce-ded53c1a3e49	CA	CAN	124	Canada 	Kanada	\N
00040000-5564-899d-4836-88796561e4d8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5564-899d-86c6-6ecd5123cda1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5564-899d-c291-7c4301a84700	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5564-899d-3285-27fa29073daa	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5564-899d-6345-ca40e6901c58	CL	CHL	152	Chile 	Čile	\N
00040000-5564-899d-8988-ef522630865d	CN	CHN	156	China 	Kitajska	\N
00040000-5564-899d-6f7e-84c9bd33b9a8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5564-899d-e8cb-459ad82259cc	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5564-899d-b0ae-35906eb37291	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5564-899d-6223-c5f1a89f7128	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5564-899d-6488-cdc5c822fbcf	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5564-899d-dffe-74c375b9d331	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5564-899d-457e-99efaa8b2c8f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5564-899d-52fd-3a92cf9dd454	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5564-899d-2c1e-746f831e3c98	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5564-899d-47df-1d292db8a442	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5564-899d-a641-50d680579476	CU	CUB	192	Cuba 	Kuba	\N
00040000-5564-899d-b831-1f61cbc28962	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5564-899d-325d-7f3597ca87d0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5564-899d-d501-c48d4b2ec468	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5564-899d-e718-3cefb4c6bc72	DK	DNK	208	Denmark 	Danska	\N
00040000-5564-899d-a02a-a01dd040b26f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5564-899d-47f5-aff72a534ebf	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-899d-ad44-cbb0f4187049	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5564-899d-6485-d16354e11683	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5564-899d-d8d1-cee7d61781aa	EG	EGY	818	Egypt 	Egipt	\N
00040000-5564-899d-240c-b790d97a59ce	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5564-899d-e509-84c8b0aa0d97	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5564-899d-0fb2-eca7eb84a5d4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5564-899d-36a4-b2651d6b7993	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5564-899d-8b3b-b36de7515194	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5564-899d-dd73-8c7f2d363776	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5564-899d-2cb8-148c861f9555	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5564-899d-a589-e233e6dbf9b0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5564-899d-5299-a3f14f01a30a	FI	FIN	246	Finland 	Finska	\N
00040000-5564-899d-c17d-c09d6c24a44f	FR	FRA	250	France 	Francija	\N
00040000-5564-899d-0088-af09206bd987	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5564-899d-0f3d-2d7dc22ae76e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5564-899d-a722-70fff3a9fd4f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5564-899d-6c99-5d20ad29becf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5564-899d-ac03-d553adcea1ce	GA	GAB	266	Gabon 	Gabon	\N
00040000-5564-899d-757e-cb72f87a8b90	GM	GMB	270	Gambia 	Gambija	\N
00040000-5564-899d-4c9f-2382347df004	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5564-899d-fe1a-510a14129675	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5564-899d-2a51-d05ecc179300	GH	GHA	288	Ghana 	Gana	\N
00040000-5564-899d-2a6e-7f595098449b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5564-899d-642c-bd7a112e33f1	GR	GRC	300	Greece 	Grčija	\N
00040000-5564-899d-8be2-f4e7c0b3a90c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5564-899d-66de-dc01a04b341e	GD	GRD	308	Grenada 	Grenada	\N
00040000-5564-899d-0e7e-4694e17d5473	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5564-899d-df8f-5b9ca8c83690	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5564-899d-2e91-b6fc044b5c84	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5564-899d-ab50-9bbd939e2bfc	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5564-899d-7133-68cce3c4057b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5564-899d-e26d-7fd1d353e280	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5564-899d-4f9a-49ca528a5ef6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5564-899d-c787-9c52845bdcd7	HT	HTI	332	Haiti 	Haiti	\N
00040000-5564-899d-f3f0-1a0bb9e80936	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5564-899d-4996-8e1824e8c611	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5564-899d-f9f6-dc4c895c08ef	HN	HND	340	Honduras 	Honduras	\N
00040000-5564-899d-8059-72cc1100f73e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5564-899d-eb5b-b5c0a599d050	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5564-899d-e7c7-2bdc10150696	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5564-899d-6b88-f05c48ef0461	IN	IND	356	India 	Indija	\N
00040000-5564-899d-6462-c42309c25c56	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5564-899d-7840-3b6253958f02	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5564-899d-dafd-704ffa25ec6b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5564-899d-8445-f6357b3998d0	IE	IRL	372	Ireland 	Irska	\N
00040000-5564-899d-4775-86b2a368bd9a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5564-899d-eeee-2bc7b7984ffd	IL	ISR	376	Israel 	Izrael	\N
00040000-5564-899d-4ed4-b79f07786560	IT	ITA	380	Italy 	Italija	\N
00040000-5564-899d-d103-03ebe08e3e78	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5564-899d-9d07-5b6dcba22bbe	JP	JPN	392	Japan 	Japonska	\N
00040000-5564-899d-0659-0ac4aa50e9de	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5564-899d-4476-b78408ae5cc8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5564-899d-b4d9-3c3acac2d97d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5564-899d-3c55-f2135ab7481b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5564-899d-7413-c65c5b56a501	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5564-899d-b524-8c08250872d8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5564-899d-2a69-8113e0cc11c6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5564-899d-722a-65fcfec748c9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5564-899d-339b-209d7cbea600	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5564-899d-73d0-7cc6a7f7d031	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5564-899d-7fea-f10b74e41977	LV	LVA	428	Latvia 	Latvija	\N
00040000-5564-899d-4331-0853c495df50	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5564-899d-513d-e95b5d28aab7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5564-899d-ae4e-9d940a8a4489	LR	LBR	430	Liberia 	Liberija	\N
00040000-5564-899d-26dd-03d468457285	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5564-899d-e4e0-ff35c027f3b5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5564-899d-0423-531e17c19095	LT	LTU	440	Lithuania 	Litva	\N
00040000-5564-899d-e0fa-4f0d5e87b7ec	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5564-899d-8571-ddc8b46ef254	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5564-899d-b020-932a1599f4b3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5564-899d-15c3-5b35ef74f409	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5564-899d-e747-23bafe28b3bc	MW	MWI	454	Malawi 	Malavi	\N
00040000-5564-899d-7be6-5df61aac5569	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5564-899d-42c0-e1bf2585f993	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5564-899d-c4cf-989086432a63	ML	MLI	466	Mali 	Mali	\N
00040000-5564-899d-2999-00424ca21603	MT	MLT	470	Malta 	Malta	\N
00040000-5564-899d-dac5-ef56555ab3ff	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5564-899d-378f-09fcabbfc9c7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5564-899d-6943-40c4966931b4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5564-899d-4ec2-f8910b82ba23	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5564-899d-55e2-b832fd158964	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5564-899d-b550-5ba5757a8bfc	MX	MEX	484	Mexico 	Mehika	\N
00040000-5564-899d-093d-2caa7a274196	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5564-899d-1b9a-a0fe87753dc2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5564-899d-055d-940dc178dd2c	MC	MCO	492	Monaco 	Monako	\N
00040000-5564-899d-d471-c0ddb79f896c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5564-899d-2460-bf770aa94bbe	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5564-899d-55ee-17cf7e7b33aa	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5564-899d-b2e6-080f09ebb715	MA	MAR	504	Morocco 	Maroko	\N
00040000-5564-899d-0c74-6899b9f64129	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5564-899d-5b2d-501ef188e151	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5564-899d-ac8c-7fd0aac15ae5	NA	NAM	516	Namibia 	Namibija	\N
00040000-5564-899d-0cd5-68c46e187281	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5564-899d-2708-6d38732fdac4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5564-899d-8663-040acd7da8b1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5564-899d-7ea3-e63fa7927836	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5564-899d-c78a-322cf37a778b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5564-899d-4cac-af17d027f44b	NE	NER	562	Niger 	Niger 	\N
00040000-5564-899d-fcc1-93cb5912e9bb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5564-899d-9387-2a673da2969b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5564-899d-ad23-ce702343900d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5564-899d-c267-b8464c9af0d3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5564-899d-a085-5e759f763c9f	NO	NOR	578	Norway 	Norveška	\N
00040000-5564-899d-62a1-07e0ffc6c255	OM	OMN	512	Oman 	Oman	\N
00040000-5564-899d-dbe0-9ef3c01c6f20	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5564-899d-0a89-cfab8c02879e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5564-899d-466b-9afb99e196b8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5564-899d-2be9-85ef983cb499	PA	PAN	591	Panama 	Panama	\N
00040000-5564-899d-b3d9-6e90fe8f60e5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5564-899d-e2f9-3772bcbce82f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5564-899d-d86e-583a679f1435	PE	PER	604	Peru 	Peru	\N
00040000-5564-899d-3497-ca4f786bdbb7	PH	PHL	608	Philippines 	Filipini	\N
00040000-5564-899d-c5d9-8c7a9a161dfc	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5564-899d-a156-9982db07da20	PL	POL	616	Poland 	Poljska	\N
00040000-5564-899d-078a-a93f4bbb673b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5564-899d-33e9-83ad9a30e095	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5564-899d-c7bb-c0e4d16ac832	QA	QAT	634	Qatar 	Katar	\N
00040000-5564-899d-b024-9a85cf1cd387	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5564-899d-8ebf-c7e169dea2db	RO	ROU	642	Romania 	Romunija	\N
00040000-5564-899d-6347-fe65ba633d43	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5564-899d-cc7e-092753ee65c0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5564-899d-814e-3091c49d0357	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5564-899d-7500-070f6981fd5f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5564-899d-17cf-4418bc251738	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5564-899d-cf00-00b7bcd56865	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5564-899d-0b3e-66f5386f4d58	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5564-899d-721f-93ed92934f2d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5564-899d-3a27-a426f8cbfd4e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5564-899d-057c-62d6309a5a15	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5564-899d-612f-8e4dd089d72f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5564-899d-8a42-d217fc57cad4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5564-899d-5e2e-4d43edd8188b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5564-899d-78be-514fd72d2b31	SN	SEN	686	Senegal 	Senegal	\N
00040000-5564-899d-3795-29a1c56c6424	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5564-899d-24e7-caea1cd92867	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5564-899d-c5c3-5665b93ad663	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5564-899d-574a-1338f8cdb605	SG	SGP	702	Singapore 	Singapur	\N
00040000-5564-899d-01bf-0298c6d885bf	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5564-899d-1ed7-d8d579f72ffa	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5564-899d-464e-274dd8459ab2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5564-899d-0094-30b8a88097cb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5564-899d-bab3-75844a8244d5	SO	SOM	706	Somalia 	Somalija	\N
00040000-5564-899d-f5b2-feed95d72bda	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5564-899d-4e57-5d9a324e9ab0	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5564-899d-b566-4c6d8acd6d36	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5564-899d-c682-51acb321a259	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5564-899d-878e-26676af525ed	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5564-899d-a0e1-b5f65efc0843	SD	SDN	729	Sudan 	Sudan	\N
00040000-5564-899d-641c-4431b8eb8476	SR	SUR	740	Suriname 	Surinam	\N
00040000-5564-899d-7b04-b4ec15e2496a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5564-899d-b92c-9bef3911e058	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5564-899d-03e1-b24d1e8800c6	SE	SWE	752	Sweden 	Švedska	\N
00040000-5564-899d-e6e5-d380756b2a53	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5564-899d-cc76-b766c9cab277	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5564-899d-0e37-4dd4abe81317	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5564-899d-e5d9-3007f5589719	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5564-899d-5ce2-8645b7e2bfce	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5564-899d-66a4-0520e713c2dc	TH	THA	764	Thailand 	Tajska	\N
00040000-5564-899d-aba9-6ea76d726108	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5564-899d-d83d-7773063f5c15	TG	TGO	768	Togo 	Togo	\N
00040000-5564-899d-8776-2e0dd09eabe8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5564-899d-4638-48296da4f9a3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5564-899d-4293-7f6789c38590	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5564-899d-78b7-6c7e4f74813a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5564-899d-a244-9fca7a99f8f4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5564-899d-fd70-c4e8c068ec65	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5564-899d-71b9-7ad8daf88383	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-899d-769d-703402a2cba4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5564-899d-d9b1-a503e5461db5	UG	UGA	800	Uganda 	Uganda	\N
00040000-5564-899d-251e-a0920e3aab9d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5564-899d-a626-3f99e159ec04	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5564-899d-7219-1211405bc567	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5564-899d-bc9f-02bef435a935	US	USA	840	United States 	Združene države Amerike	\N
00040000-5564-899d-4a15-facce1602722	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5564-899d-bc36-96b0fff29e80	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5564-899d-ef27-3d24f8d8e9a3	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5564-899d-e312-9b56ac57cf70	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5564-899d-aa6c-dfe725a59db9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5564-899d-3287-8e912ab628ea	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5564-899d-d727-bbec0e703739	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-899d-9cc2-b9c3a2182578	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5564-899d-8730-f1faa9dc6bbb	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5564-899d-c7de-57182146bc4b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5564-899d-2074-a77a25912523	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5564-899d-3046-d6b4d6a4ecf6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5564-899d-d73e-e8992a09b787	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5150397)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5564-899e-35de-cbbd1670f1ec	000e0000-5564-899e-30a7-a1d3b9844ef3	\N	000f0000-5564-899d-114a-3954048ef051	igralec	Hipolita	velika	t	9	t	t	\N
000d0000-5564-899e-e9ee-5388d0f533f9	000e0000-5564-899e-30a7-a1d3b9844ef3	\N	000f0000-5564-899d-114a-3954048ef051	igralec	Tezej	velika	t	9	t	t	\N
\.


--
-- TOC entry 2712 (class 0 OID 5150221)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5150265)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5150201)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2690 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 5150314)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5150339)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5150158)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5564-899e-c108-7919199b5ee8	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5564-899e-e2e6-4f17748fd4f0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5564-899e-5c5a-2a7c4c8d2e66	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5564-899e-6ea2-52158729f088	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5564-899e-2a6b-2d28fb5a606d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5564-899e-c2be-9b7cba42936c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5564-899e-3aeb-2421e71b8bb3	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5564-899e-88da-4edb16d66636	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5564-899e-d25a-b61076d3e95b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5564-899e-4e00-82dc022a814d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5564-899e-24b4-f5d15059fa20	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5564-899e-f201-c17f308f4c11	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5564-899e-5d0c-25abf0342fad	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-899e-e81b-1dcdc32531ea	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-899e-078e-722316bc8ba5	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5150072)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5564-899e-13f1-575834379dcd	00000000-5564-899e-2a6b-2d28fb5a606d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5564-899e-9f41-c9dcfdfcacd1	00000000-5564-899e-2a6b-2d28fb5a606d	00010000-5564-899e-0e89-5df8b9c20863	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5564-899e-4c72-b6e8821ae83f	00000000-5564-899e-c2be-9b7cba42936c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5150083)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5564-899e-ad5d-f477149a3cee	\N	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5564-899e-3bec-1aa9813d38d1	\N	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5564-899e-d114-6d7e239e35df	\N	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5564-899e-15eb-0e4976098593	\N	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5564-899e-d5be-133c1ff50654	\N	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5564-899e-de82-0d8fee1b821d	\N	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5564-899e-4dcf-8c426029ff4f	\N	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5564-899e-5dd9-fd20598340db	\N	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5564-899e-606e-beef4b2f0463	\N	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5564-899e-0a49-e2d0e3ad876f	\N	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5564-899e-3ab6-67924a92d389	\N	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5150037)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5564-899d-129d-e3ad0d38fb05	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5564-899d-eaaf-158c589d0e18	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5564-899d-4be6-de78b889d5ca	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5564-899d-a343-1ad38cf5d9f3	Abonma-read	Abonma - branje	f
00030000-5564-899d-7f26-4f148a24550e	Abonma-write	Abonma - spreminjanje	f
00030000-5564-899d-021e-cecdf271c7e0	Alternacija-read	Alternacija - branje	f
00030000-5564-899d-f2a7-01da4c30d505	Alternacija-write	Alternacija - spreminjanje	f
00030000-5564-899d-51d4-b291a95bbc14	Arhivalija-read	Arhivalija - branje	f
00030000-5564-899d-f55c-d5ed9a62229c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5564-899d-a7c3-9bd519b3ba3e	Besedilo-read	Besedilo - branje	f
00030000-5564-899d-7dd3-41c8f5c7015f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5564-899d-3874-386ba1e07cfb	DogodekIzven-read	DogodekIzven - branje	f
00030000-5564-899d-8259-feabe9d289fa	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5564-899d-0f5a-3c6055f0cd88	Dogodek-read	Dogodek - branje	f
00030000-5564-899d-7053-3faec2697113	Dogodek-write	Dogodek - spreminjanje	f
00030000-5564-899d-5a08-f41c5be55c7c	Drzava-read	Drzava - branje	f
00030000-5564-899d-adec-5c529e0ac13b	Drzava-write	Drzava - spreminjanje	f
00030000-5564-899d-37ca-752fc09b9f65	Funkcija-read	Funkcija - branje	f
00030000-5564-899d-6610-24c3997ff4b6	Funkcija-write	Funkcija - spreminjanje	f
00030000-5564-899d-8db0-24a67e64a1ad	Gostovanje-read	Gostovanje - branje	f
00030000-5564-899d-efa7-4ca41c799d50	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5564-899d-d6d0-3ebfe334c1b1	Gostujoca-read	Gostujoca - branje	f
00030000-5564-899d-bc89-7035ce52006d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5564-899d-1c43-866a0ec2cfc9	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5564-899d-4ada-18789919b5bf	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5564-899d-9a62-acab8c64d309	Kupec-read	Kupec - branje	f
00030000-5564-899d-3b9a-d43b1626b017	Kupec-write	Kupec - spreminjanje	f
00030000-5564-899d-a48c-17444aa93ee9	NacinPlacina-read	NacinPlacina - branje	f
00030000-5564-899d-f04e-dd43e5adef7d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5564-899d-8102-13ea40843299	Option-read	Option - branje	f
00030000-5564-899d-5f12-15d74b12f899	Option-write	Option - spreminjanje	f
00030000-5564-899d-1dbf-c47a3d9fa296	OptionValue-read	OptionValue - branje	f
00030000-5564-899d-99a9-08fa1775f466	OptionValue-write	OptionValue - spreminjanje	f
00030000-5564-899d-c8b0-8780b9d0943d	Oseba-read	Oseba - branje	f
00030000-5564-899d-f2d2-603af9572c8f	Oseba-write	Oseba - spreminjanje	f
00030000-5564-899d-84d1-b00142a6c36d	Permission-read	Permission - branje	f
00030000-5564-899d-3949-6df16962f52a	Permission-write	Permission - spreminjanje	f
00030000-5564-899d-13a5-750d18b196ee	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5564-899d-86be-a3eb8678bd1a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5564-899d-2ef5-66739111b101	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5564-899d-617e-2169c6a2014e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5564-899d-016c-1d89d80b942b	Pogodba-read	Pogodba - branje	f
00030000-5564-899d-7f41-f2736b6e1893	Pogodba-write	Pogodba - spreminjanje	f
00030000-5564-899d-5b47-914819531e23	Popa-read	Popa - branje	f
00030000-5564-899d-6a5b-385fb3060bec	Popa-write	Popa - spreminjanje	f
00030000-5564-899d-a9cc-9394e0365b27	Posta-read	Posta - branje	f
00030000-5564-899d-20e5-62989023cecd	Posta-write	Posta - spreminjanje	f
00030000-5564-899d-e327-1be371bd5972	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5564-899d-b458-841f6f91e87b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5564-899d-1f26-8d1092347b64	PostniNaslov-read	PostniNaslov - branje	f
00030000-5564-899d-5c83-3699de9cdeef	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5564-899d-494a-6312d62ee2d6	Predstava-read	Predstava - branje	f
00030000-5564-899d-cda0-6f6c97380c6b	Predstava-write	Predstava - spreminjanje	f
00030000-5564-899d-9694-91fb6c547a4e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5564-899d-8210-b60f2c5f04f0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5564-899d-bda6-f4b262befd89	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5564-899d-b9e0-76dfbbe51dc3	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5564-899d-3f8a-f26ef1b6e992	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5564-899d-2057-8aa7101fe3de	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5564-899d-e5ed-6ea5cad37ac1	Prostor-read	Prostor - branje	f
00030000-5564-899e-7fc5-4ec6e4260c5e	Prostor-write	Prostor - spreminjanje	f
00030000-5564-899e-907b-20e79a6e1b0a	Racun-read	Racun - branje	f
00030000-5564-899e-25f6-5bb23fd0f4a3	Racun-write	Racun - spreminjanje	f
00030000-5564-899e-d348-928ac102c273	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5564-899e-dd88-b67aae895494	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5564-899e-ac44-4f5d8def70bf	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5564-899e-92b4-682d188ade61	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5564-899e-38d0-107679993839	Rekvizit-read	Rekvizit - branje	f
00030000-5564-899e-1f59-9ab77c10a968	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5564-899e-a02b-399b05dd307a	Revizija-read	Revizija - branje	f
00030000-5564-899e-c638-5e7dc796f2a5	Revizija-write	Revizija - spreminjanje	f
00030000-5564-899e-5496-76cd7c54551f	Rezervacija-read	Rezervacija - branje	f
00030000-5564-899e-9d99-fc3febabe10b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5564-899e-93d9-095d7e0d0d84	Role-read	Role - branje	f
00030000-5564-899e-754a-a4a184d94a5e	Role-write	Role - spreminjanje	f
00030000-5564-899e-794a-51f1325bef87	SedezniRed-read	SedezniRed - branje	f
00030000-5564-899e-21cf-83365cf91d5e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5564-899e-5a4e-55276bb4504a	Sedez-read	Sedez - branje	f
00030000-5564-899e-19a0-2ebc59072975	Sedez-write	Sedez - spreminjanje	f
00030000-5564-899e-e384-c3e270e25919	Sezona-read	Sezona - branje	f
00030000-5564-899e-ef00-3c4f9d709574	Sezona-write	Sezona - spreminjanje	f
00030000-5564-899e-b16f-fe2475d1e71c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5564-899e-9e73-3dc336452deb	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5564-899e-4dcb-0884b878c82a	Stevilcenje-read	Stevilcenje - branje	f
00030000-5564-899e-514e-1445fed6209d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5564-899e-c385-88abf124dd82	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5564-899e-a28c-4709cc21b6d7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5564-899e-5741-275812bc41d0	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5564-899e-33fe-fbd95f90753d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5564-899e-6f67-7399b15f1c9e	Telefonska-read	Telefonska - branje	f
00030000-5564-899e-f58a-e6f8ab045d13	Telefonska-write	Telefonska - spreminjanje	f
00030000-5564-899e-0bc8-80b86811d446	TerminStoritve-read	TerminStoritve - branje	f
00030000-5564-899e-48e2-ed6038c4ce34	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5564-899e-343d-56738096201c	TipFunkcije-read	TipFunkcije - branje	f
00030000-5564-899e-d12a-92ebfeba894d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5564-899e-5a66-6e3a58990d00	Trr-read	Trr - branje	f
00030000-5564-899e-e90a-767a74858f7b	Trr-write	Trr - spreminjanje	f
00030000-5564-899e-cc09-5d38a8902572	Uprizoritev-read	Uprizoritev - branje	f
00030000-5564-899e-6e14-98c8ad1eb636	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5564-899e-55da-f3a32d28df91	User-read	User - branje	f
00030000-5564-899e-8263-ee2b11a6e5fe	User-write	User - spreminjanje	f
00030000-5564-899e-8f5d-4615956d6192	Vaja-read	Vaja - branje	f
00030000-5564-899e-c2bd-681ad800786e	Vaja-write	Vaja - spreminjanje	f
00030000-5564-899e-8692-cf7c537d471e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5564-899e-ba5d-0f71d3b590cd	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5564-899e-0180-540cf8cb0ac2	Zaposlitev-read	Zaposlitev - branje	f
00030000-5564-899e-fda0-84e356bc6553	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5564-899e-0555-203197326dd6	Zasedenost-read	Zasedenost - branje	f
00030000-5564-899e-25a4-bb27d1e8c9cb	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5564-899e-2619-3da211a98d0f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5564-899e-f3c3-682973c8cb38	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5564-899e-76e2-3c8b0537421f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5564-899e-8802-1b42c89101ed	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5150056)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5564-899e-df29-d0315fe55ace	00030000-5564-899d-5a08-f41c5be55c7c
00020000-5564-899e-c62d-c6140c95bb49	00030000-5564-899d-adec-5c529e0ac13b
00020000-5564-899e-c62d-c6140c95bb49	00030000-5564-899d-5a08-f41c5be55c7c
\.


--
-- TOC entry 2727 (class 0 OID 5150346)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5150377)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5150510)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5150115)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5564-899e-66c5-d046ccca13b6	00040000-5564-899d-819b-463a1e428348	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5564-899e-a1ae-cd98d5f1c7b8	00040000-5564-899d-819b-463a1e428348	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5150150)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5564-899d-f380-898dae34e23e	8341	Adlešiči
00050000-5564-899d-5eb2-30149f2ee4ec	5270	Ajdovščina
00050000-5564-899d-84ec-5fe996fcda1e	6280	Ankaran/Ancarano
00050000-5564-899d-4b3a-7c9946d3ba42	9253	Apače
00050000-5564-899d-6108-29ac056ecf31	8253	Artiče
00050000-5564-899d-9df2-11c413f43028	4275	Begunje na Gorenjskem
00050000-5564-899d-576e-92ff5d4afb26	1382	Begunje pri Cerknici
00050000-5564-899d-214d-5325b4719458	9231	Beltinci
00050000-5564-899d-1a13-6c59046932aa	2234	Benedikt
00050000-5564-899d-3e5d-74db79b62a6b	2345	Bistrica ob Dravi
00050000-5564-899d-f20c-00443cedc460	3256	Bistrica ob Sotli
00050000-5564-899d-ff45-2a3de41b9444	8259	Bizeljsko
00050000-5564-899d-79f7-672cbcd7dd69	1223	Blagovica
00050000-5564-899d-a308-699768ab98bf	8283	Blanca
00050000-5564-899d-cc5e-8f3af27b9a3d	4260	Bled
00050000-5564-899d-2eda-87fee66a62ca	4273	Blejska Dobrava
00050000-5564-899d-60e7-f2c56570af7e	9265	Bodonci
00050000-5564-899d-a7ee-6b2e2f8d343e	9222	Bogojina
00050000-5564-899d-d8d6-6cdb191e77b0	4263	Bohinjska Bela
00050000-5564-899d-2070-ca6dd9573a88	4264	Bohinjska Bistrica
00050000-5564-899d-670a-4ad4e4d76044	4265	Bohinjsko jezero
00050000-5564-899d-604e-f9f400fdab06	1353	Borovnica
00050000-5564-899d-5ef0-53bca9cad1c8	8294	Boštanj
00050000-5564-899d-3083-2d7bd93d9547	5230	Bovec
00050000-5564-899d-aa86-e7f58d42030a	5295	Branik
00050000-5564-899d-d4e3-67ac4df65ca9	3314	Braslovče
00050000-5564-899d-3c7f-4db522b08ac9	5223	Breginj
00050000-5564-899d-1993-88088f0bcb3f	8280	Brestanica
00050000-5564-899d-ae90-724f6155c0f9	2354	Bresternica
00050000-5564-899d-0591-df1f07ac4de7	4243	Brezje
00050000-5564-899d-9406-9c082a5db40b	1351	Brezovica pri Ljubljani
00050000-5564-899d-3b32-98a197fb0f90	8250	Brežice
00050000-5564-899d-240c-fffcac34dbd3	4210	Brnik - Aerodrom
00050000-5564-899d-4c43-caf7d24d8927	8321	Brusnice
00050000-5564-899d-073f-051b91d7f371	3255	Buče
00050000-5564-899d-da65-866c082bc010	8276	Bučka 
00050000-5564-899d-1e1e-2576a22d524f	9261	Cankova
00050000-5564-899d-b9e5-e3f41314d522	3000	Celje 
00050000-5564-899d-63ab-a535f906e295	3001	Celje - poštni predali
00050000-5564-899d-f8b6-b550fc2db362	4207	Cerklje na Gorenjskem
00050000-5564-899d-5bd5-dc88772b586b	8263	Cerklje ob Krki
00050000-5564-899d-af70-a9cc81f44b61	1380	Cerknica
00050000-5564-899d-a15a-2be2cc7d37fa	5282	Cerkno
00050000-5564-899d-16bb-47a66a2a64ca	2236	Cerkvenjak
00050000-5564-899d-89ec-8dc6e955186d	2215	Ceršak
00050000-5564-899d-a43d-f1bbe481779f	2326	Cirkovce
00050000-5564-899d-e853-0e0ed5b04a23	2282	Cirkulane
00050000-5564-899d-9e45-e951418881c7	5273	Col
00050000-5564-899d-0822-432302252e6e	8251	Čatež ob Savi
00050000-5564-899d-54f1-e77aece3a4ae	1413	Čemšenik
00050000-5564-899d-b663-e6a03912b6a8	5253	Čepovan
00050000-5564-899d-8a24-47edd989f986	9232	Črenšovci
00050000-5564-899d-9b3f-dd12203c61a7	2393	Črna na Koroškem
00050000-5564-899d-9e05-87e31dc3aad7	6275	Črni Kal
00050000-5564-899d-f61f-fcc3cbc19c4b	5274	Črni Vrh nad Idrijo
00050000-5564-899d-5bda-07b68c2dade5	5262	Črniče
00050000-5564-899d-266f-0e887c0d210e	8340	Črnomelj
00050000-5564-899d-f077-8f5ff50817c2	6271	Dekani
00050000-5564-899d-5b98-97276c2d13dd	5210	Deskle
00050000-5564-899d-2ac2-9d74022089ed	2253	Destrnik
00050000-5564-899d-aa05-4115f908a692	6215	Divača
00050000-5564-899d-7348-4b6367c47d6b	1233	Dob
00050000-5564-899d-80dc-2efcd7d42e19	3224	Dobje pri Planini
00050000-5564-899d-88ad-716f734d1865	8257	Dobova
00050000-5564-899d-c1e4-d1ada20dfe56	1423	Dobovec
00050000-5564-899d-c014-1685b3ff7189	5263	Dobravlje
00050000-5564-899d-4804-8b1e4f7a9c5e	3204	Dobrna
00050000-5564-899d-7219-3ab8c6cce833	8211	Dobrnič
00050000-5564-899d-af6d-fc73ae4bb4b9	1356	Dobrova
00050000-5564-899d-0070-2c93bf50c9c4	9223	Dobrovnik/Dobronak 
00050000-5564-899d-bafc-c4d90efb3210	5212	Dobrovo v Brdih
00050000-5564-899d-18d7-9b84267366bd	1431	Dol pri Hrastniku
00050000-5564-899d-1b48-64f50e43a7d7	1262	Dol pri Ljubljani
00050000-5564-899d-06e0-925cde861818	1273	Dole pri Litiji
00050000-5564-899d-2c9b-2bab9f1e35b8	1331	Dolenja vas
00050000-5564-899d-bd2b-73a04eea46e0	8350	Dolenjske Toplice
00050000-5564-899d-77f4-0447749b5a26	1230	Domžale
00050000-5564-899d-2777-916c176fdbc3	2252	Dornava
00050000-5564-899d-8f47-2142e1dde1f2	5294	Dornberk
00050000-5564-899d-549d-90cce23e8ba5	1319	Draga
00050000-5564-899d-6a73-75e2a3044117	8343	Dragatuš
00050000-5564-899d-ddbf-4081694a68ec	3222	Dramlje
00050000-5564-899d-0a7a-5d32bfa47d2c	2370	Dravograd
00050000-5564-899d-7330-b50d1aa9c0ca	4203	Duplje
00050000-5564-899d-b88c-51c2b9bb8353	6221	Dutovlje
00050000-5564-899d-9e17-f1ae43a62b8f	8361	Dvor
00050000-5564-899d-ede6-a678d0c4959d	2343	Fala
00050000-5564-899d-f8ec-92f8c36fb240	9208	Fokovci
00050000-5564-899d-da2c-4df5c04dd4cb	2313	Fram
00050000-5564-899d-607a-760baa34cd57	3213	Frankolovo
00050000-5564-899d-3c30-f7dd62da5423	1274	Gabrovka
00050000-5564-899d-e8e4-1e6d34e854ea	8254	Globoko
00050000-5564-899d-de48-6286d4d12815	5275	Godovič
00050000-5564-899d-0c71-3b1f625caa77	4204	Golnik
00050000-5564-899d-4ca8-7e8abf927017	3303	Gomilsko
00050000-5564-899d-e5a5-dfa11d4c01dc	4224	Gorenja vas
00050000-5564-899d-0d6e-ffd2f0565adf	3263	Gorica pri Slivnici
00050000-5564-899d-00dc-4b8d1ec6afc7	2272	Gorišnica
00050000-5564-899d-7fdd-e4ed1c520e12	9250	Gornja Radgona
00050000-5564-899d-ad22-2118a6000046	3342	Gornji Grad
00050000-5564-899d-56d6-411175f0979a	4282	Gozd Martuljek
00050000-5564-899d-1085-ff4110c24afe	6272	Gračišče
00050000-5564-899d-210c-14e6a44459d0	9264	Grad
00050000-5564-899d-6f16-68d5429489fc	8332	Gradac
00050000-5564-899d-8e23-3aaa57b3419d	1384	Grahovo
00050000-5564-899d-b28e-c249a1187821	5242	Grahovo ob Bači
00050000-5564-899d-5b8b-0530fdba4880	5251	Grgar
00050000-5564-899d-2b7c-ce1b7ee69219	3302	Griže
00050000-5564-899d-4301-cbb8b6791e4a	3231	Grobelno
00050000-5564-899d-a3ec-468c95237e17	1290	Grosuplje
00050000-5564-899d-afe1-51509cdeda9e	2288	Hajdina
00050000-5564-899d-37a6-c10637f14ed6	8362	Hinje
00050000-5564-899d-daed-0de740b4178c	2311	Hoče
00050000-5564-899d-bb59-e8df237cede2	9205	Hodoš/Hodos
00050000-5564-899d-bdeb-0c442c74a742	1354	Horjul
00050000-5564-899d-c093-d03e895ca802	1372	Hotedršica
00050000-5564-899d-554f-fd63c81b72ae	1430	Hrastnik
00050000-5564-899d-3138-84249636b934	6225	Hruševje
00050000-5564-899d-c36d-f52d35f20d6e	4276	Hrušica
00050000-5564-899d-cfdb-3a0429d45153	5280	Idrija
00050000-5564-899d-a2da-e33eca8c2f91	1292	Ig
00050000-5564-899d-a854-23eac88da215	6250	Ilirska Bistrica
00050000-5564-899d-0c20-e47280d03f86	6251	Ilirska Bistrica-Trnovo
00050000-5564-899d-3e51-4ff6bd0fd763	1295	Ivančna Gorica
00050000-5564-899d-8ad6-7756b1661d9b	2259	Ivanjkovci
00050000-5564-899d-4508-f384893a7eaf	1411	Izlake
00050000-5564-899d-e792-e6e668b6c17b	6310	Izola/Isola
00050000-5564-899d-4860-488edb2f5346	2222	Jakobski Dol
00050000-5564-899d-ae40-27760b16d573	2221	Jarenina
00050000-5564-899d-b0a4-5ba8cf946184	6254	Jelšane
00050000-5564-899d-e051-943787a314c5	4270	Jesenice
00050000-5564-899d-01d4-f2d65c95f797	8261	Jesenice na Dolenjskem
00050000-5564-899d-e999-86cce157e43d	3273	Jurklošter
00050000-5564-899d-522f-cabca6d5e848	2223	Jurovski Dol
00050000-5564-899d-5c0b-ac8dc2bbd3d3	2256	Juršinci
00050000-5564-899d-d452-0e02ba65b728	5214	Kal nad Kanalom
00050000-5564-899d-27bd-bbfe7459677c	3233	Kalobje
00050000-5564-899d-3fc1-9437a7b23a86	4246	Kamna Gorica
00050000-5564-899d-1ecf-56349d4d16ab	2351	Kamnica
00050000-5564-899d-377a-d536eedde3e3	1241	Kamnik
00050000-5564-899d-ff69-ba68903ce776	5213	Kanal
00050000-5564-899d-7c8c-5108dbd33a4a	8258	Kapele
00050000-5564-899d-900a-a56ef3fc158c	2362	Kapla
00050000-5564-899d-715b-7151363e8ebd	2325	Kidričevo
00050000-5564-899d-3e2a-18fd6fefd234	1412	Kisovec
00050000-5564-899d-f822-ed3a67de4439	6253	Knežak
00050000-5564-899d-2b57-4ab510af9391	5222	Kobarid
00050000-5564-899d-81fc-4aa29af0a7f8	9227	Kobilje
00050000-5564-899d-4b64-a44caa32935f	1330	Kočevje
00050000-5564-899d-aa93-eff407b1b208	1338	Kočevska Reka
00050000-5564-899d-d5d8-484f3aeb0d1e	2276	Kog
00050000-5564-899d-7f1a-35a8f95c5858	5211	Kojsko
00050000-5564-899d-af53-945875a52951	6223	Komen
00050000-5564-899d-ea12-07f1cb3f2f65	1218	Komenda
00050000-5564-899d-a79a-a1ac822c0ca6	6000	Koper/Capodistria 
00050000-5564-899d-ca90-4dd1418a2af4	6001	Koper/Capodistria - poštni predali
00050000-5564-899d-901a-933e28456158	8282	Koprivnica
00050000-5564-899d-a66f-0fbca549a5b5	5296	Kostanjevica na Krasu
00050000-5564-899d-7f0d-61bfef6e89b1	8311	Kostanjevica na Krki
00050000-5564-899d-cc35-8f1e47aa68ab	1336	Kostel
00050000-5564-899d-55ea-135269bb0c01	6256	Košana
00050000-5564-899d-bd1d-22cf2c002a1b	2394	Kotlje
00050000-5564-899d-c170-9fccc961c2e4	6240	Kozina
00050000-5564-899d-3ada-81e7b801cdb9	3260	Kozje
00050000-5564-899d-e33e-00636eae7aa1	4000	Kranj 
00050000-5564-899d-eadf-f3fdfcd98b60	4001	Kranj - poštni predali
00050000-5564-899d-d1ee-89c208a333f8	4280	Kranjska Gora
00050000-5564-899d-442d-ee971293817e	1281	Kresnice
00050000-5564-899d-53d8-838e2102f8df	4294	Križe
00050000-5564-899d-2e89-061d2f6d1b27	9206	Križevci
00050000-5564-899d-ca8e-32acee8478d1	9242	Križevci pri Ljutomeru
00050000-5564-899d-2517-3a6895ca96f9	1301	Krka
00050000-5564-899d-19c3-764f8cb954e5	8296	Krmelj
00050000-5564-899d-42b5-d4c63dcdabae	4245	Kropa
00050000-5564-899d-b7b4-fa84338d1a0c	8262	Krška vas
00050000-5564-899d-8cc4-946c9b590018	8270	Krško
00050000-5564-899d-1156-2700fe5ba3ef	9263	Kuzma
00050000-5564-899d-f093-35bf68924984	2318	Laporje
00050000-5564-899d-90c0-033efabb7eb0	3270	Laško
00050000-5564-899d-7351-0b57161b3315	1219	Laze v Tuhinju
00050000-5564-899d-885d-c351fd79226e	2230	Lenart v Slovenskih goricah
00050000-5564-899d-d919-25a837e0a158	9220	Lendava/Lendva
00050000-5564-899d-5ff2-450159b39c71	4248	Lesce
00050000-5564-899d-c28e-38e425fdc32e	3261	Lesično
00050000-5564-899d-5ce2-69a50275a2d1	8273	Leskovec pri Krškem
00050000-5564-899d-5eef-061135cceb80	2372	Libeliče
00050000-5564-899d-6291-98ce1227708e	2341	Limbuš
00050000-5564-899d-750e-bfb4ddb10c4e	1270	Litija
00050000-5564-899d-2f3c-fbf1f5844eb2	3202	Ljubečna
00050000-5564-899d-d5f5-4b42fa32c7a8	1000	Ljubljana 
00050000-5564-899d-8733-effb45876f1a	1001	Ljubljana - poštni predali
00050000-5564-899d-5b97-e15365cb0508	1231	Ljubljana - Črnuče
00050000-5564-899d-34eb-12197cbc21ad	1261	Ljubljana - Dobrunje
00050000-5564-899d-3fa8-d63e13671896	1260	Ljubljana - Polje
00050000-5564-899d-ffdd-cdfe3a944514	1210	Ljubljana - Šentvid
00050000-5564-899d-90f3-28a418b91be4	1211	Ljubljana - Šmartno
00050000-5564-899d-5d95-6bdf0061d293	3333	Ljubno ob Savinji
00050000-5564-899d-ce96-4e9451d78f5b	9240	Ljutomer
00050000-5564-899d-866e-dbf38e1d8c8c	3215	Loče
00050000-5564-899d-3af8-48e3ce62ca57	5231	Log pod Mangartom
00050000-5564-899d-0317-a229301ce79c	1358	Log pri Brezovici
00050000-5564-899d-ec23-73e8b1f06988	1370	Logatec
00050000-5564-899d-8c27-cade5c0c0de8	1371	Logatec
00050000-5564-899d-7aff-d74a9d4e82cc	1434	Loka pri Zidanem Mostu
00050000-5564-899d-f984-4e55cc2d1f7d	3223	Loka pri Žusmu
00050000-5564-899d-f5eb-fffe376e8353	6219	Lokev
00050000-5564-899d-56c0-3f6f05e582c6	1318	Loški Potok
00050000-5564-899d-a736-8404e8dccfe0	2324	Lovrenc na Dravskem polju
00050000-5564-899d-2584-e201ad2d6587	2344	Lovrenc na Pohorju
00050000-5564-899d-1165-b3f67dda141f	3334	Luče
00050000-5564-899d-5266-6dea9a0d0456	1225	Lukovica
00050000-5564-899d-3c53-af0f3710d832	9202	Mačkovci
00050000-5564-899d-c7ff-91c0035b0052	2322	Majšperk
00050000-5564-899d-c8ab-74c3c4e99687	2321	Makole
00050000-5564-899d-d207-a6cf928f461a	9243	Mala Nedelja
00050000-5564-899d-240a-a92d4851119a	2229	Malečnik
00050000-5564-899d-d528-1cc0f5fd69d4	6273	Marezige
00050000-5564-899d-7daa-84d66d46c885	2000	Maribor 
00050000-5564-899d-eec0-0eb91f567405	2001	Maribor - poštni predali
00050000-5564-899d-6328-d28c6f17d0db	2206	Marjeta na Dravskem polju
00050000-5564-899d-d9e3-dd60ddeb1abd	2281	Markovci
00050000-5564-899d-acd1-6cc2b569feb9	9221	Martjanci
00050000-5564-899d-e852-d71375a971bf	6242	Materija
00050000-5564-899d-dc7a-182650402d49	4211	Mavčiče
00050000-5564-899d-03b4-a6b13d37c4ff	1215	Medvode
00050000-5564-899d-6f54-20fa13b669c6	1234	Mengeš
00050000-5564-899d-3ed3-4530904824bd	8330	Metlika
00050000-5564-899d-f6d2-698415e2dcc8	2392	Mežica
00050000-5564-899d-e6dc-655a3dd7b977	2204	Miklavž na Dravskem polju
00050000-5564-899d-d580-a77f426cb6a9	2275	Miklavž pri Ormožu
00050000-5564-899d-2b26-511d353d4f00	5291	Miren
00050000-5564-899d-7e50-2368a90223ef	8233	Mirna
00050000-5564-899d-f37b-3947e7795b2b	8216	Mirna Peč
00050000-5564-899d-dbea-0e9329e9f569	2382	Mislinja
00050000-5564-899d-8642-b525bd4ef889	4281	Mojstrana
00050000-5564-899d-14e6-4298d883f166	8230	Mokronog
00050000-5564-899d-c379-2ee7119d07a6	1251	Moravče
00050000-5564-899d-0dd9-faef569d4c15	9226	Moravske Toplice
00050000-5564-899d-2995-a63fc6a663be	5216	Most na Soči
00050000-5564-899d-c0fc-60406d579431	1221	Motnik
00050000-5564-899d-c4b5-a9d969e7aa0f	3330	Mozirje
00050000-5564-899d-e001-1baa6f1b6cf6	9000	Murska Sobota 
00050000-5564-899d-0990-915a93b6932b	9001	Murska Sobota - poštni predali
00050000-5564-899d-141d-4ba700611b81	2366	Muta
00050000-5564-899d-b480-0f9135d06ae6	4202	Naklo
00050000-5564-899d-56e6-13ba658025d7	3331	Nazarje
00050000-5564-899d-e90f-a569fd4267b5	1357	Notranje Gorice
00050000-5564-899d-7ded-204e276f2414	3203	Nova Cerkev
00050000-5564-899d-3725-9fb1f96e84cb	5000	Nova Gorica 
00050000-5564-899d-00e5-9392f248d7d5	5001	Nova Gorica - poštni predali
00050000-5564-899d-b282-105d8954ada8	1385	Nova vas
00050000-5564-899d-965b-3fda35e9bb83	8000	Novo mesto
00050000-5564-899d-ca72-74733b75ff6e	8001	Novo mesto - poštni predali
00050000-5564-899d-a601-7df617c7fea6	6243	Obrov
00050000-5564-899d-962c-27fe31648770	9233	Odranci
00050000-5564-899d-2519-29fee0e4b3d7	2317	Oplotnica
00050000-5564-899d-f27b-9e1e3ae8a74a	2312	Orehova vas
00050000-5564-899d-7563-ed9f6cd9bfe1	2270	Ormož
00050000-5564-899d-7509-c36429152e7d	1316	Ortnek
00050000-5564-899d-bf57-e2a982cac3d0	1337	Osilnica
00050000-5564-899d-b241-70553000a0f5	8222	Otočec
00050000-5564-899d-70bb-b9bdbc304b0f	2361	Ožbalt
00050000-5564-899d-103f-c4cc027c0adc	2231	Pernica
00050000-5564-899d-61d2-f88cc222e7cf	2211	Pesnica pri Mariboru
00050000-5564-899d-79b3-6301609bd3e1	9203	Petrovci
00050000-5564-899d-cdaa-2ff85ff062c3	3301	Petrovče
00050000-5564-899d-d646-4a37624caf20	6330	Piran/Pirano
00050000-5564-899d-af28-46532a24bdca	8255	Pišece
00050000-5564-899d-5d5d-75fd8f25593c	6257	Pivka
00050000-5564-899d-f171-abe47443fcee	6232	Planina
00050000-5564-899d-0097-6e7fb49caf08	3225	Planina pri Sevnici
00050000-5564-899d-ff90-e6627c74f09e	6276	Pobegi
00050000-5564-899d-0021-03e4d2aeae61	8312	Podbočje
00050000-5564-899d-fd99-24a438cbcbcb	5243	Podbrdo
00050000-5564-899d-e395-957cc47d5f71	3254	Podčetrtek
00050000-5564-899d-8bdb-27b608b1971f	2273	Podgorci
00050000-5564-899d-82cb-29d4040b83be	6216	Podgorje
00050000-5564-899d-df67-bda53fdd983a	2381	Podgorje pri Slovenj Gradcu
00050000-5564-899d-94eb-8e1263ff0af8	6244	Podgrad
00050000-5564-899d-2729-1228b73c57cb	1414	Podkum
00050000-5564-899d-6ba3-b0bf5bc14c91	2286	Podlehnik
00050000-5564-899d-0420-b77cc7b92151	5272	Podnanos
00050000-5564-899d-40e7-2521737a914b	4244	Podnart
00050000-5564-899d-2926-8280ab90b6c6	3241	Podplat
00050000-5564-899d-a55c-1497da98893d	3257	Podsreda
00050000-5564-899d-d486-e2a2079206a4	2363	Podvelka
00050000-5564-899d-9b75-1d7f63ca4ace	2208	Pohorje
00050000-5564-899d-3c4c-b11fa166ec78	2257	Polenšak
00050000-5564-899d-a4db-52e4fd7f6997	1355	Polhov Gradec
00050000-5564-899d-5a54-6f92dbdb5dae	4223	Poljane nad Škofjo Loko
00050000-5564-899d-9fa4-71ad04f262a4	2319	Poljčane
00050000-5564-899d-fc92-a0bb3b195827	1272	Polšnik
00050000-5564-899d-b1a1-d849bee87256	3313	Polzela
00050000-5564-899d-8a18-a11a77e71721	3232	Ponikva
00050000-5564-899d-ca77-14050d90556e	6320	Portorož/Portorose
00050000-5564-899d-f1eb-7452757be5f5	6230	Postojna
00050000-5564-899d-fa7d-973e2a351036	2331	Pragersko
00050000-5564-899d-a991-4c1c6b78dbc0	3312	Prebold
00050000-5564-899d-bd65-f38496bc1a10	4205	Preddvor
00050000-5564-899d-bb41-eeb6746c6a11	6255	Prem
00050000-5564-899d-508f-18b13c0fbe10	1352	Preserje
00050000-5564-899d-4f21-c393cfd0a7aa	6258	Prestranek
00050000-5564-899d-2164-ca98e5e05567	2391	Prevalje
00050000-5564-899d-739e-5d2a0093e8b3	3262	Prevorje
00050000-5564-899d-9a76-4bd2eb7335f7	1276	Primskovo 
00050000-5564-899d-a842-1e024ada17cb	3253	Pristava pri Mestinju
00050000-5564-899d-2eed-11d40cbbb5f2	9207	Prosenjakovci/Partosfalva
00050000-5564-899d-b55b-364963540b47	5297	Prvačina
00050000-5564-899d-c3e2-4c10bddce9c4	2250	Ptuj
00050000-5564-899d-cee9-b55d5f3f5e86	2323	Ptujska Gora
00050000-5564-899d-beee-770439db91a2	9201	Puconci
00050000-5564-899d-f4e2-ba62a1b7c893	2327	Rače
00050000-5564-899d-a0b8-01c3e6c83957	1433	Radeče
00050000-5564-899d-7d0b-682909073d53	9252	Radenci
00050000-5564-899d-bfce-ca083c2fa590	2360	Radlje ob Dravi
00050000-5564-899d-047a-7d918898fe45	1235	Radomlje
00050000-5564-899d-b55e-4fc9f99c2a7d	4240	Radovljica
00050000-5564-899d-a293-ccabd4b60705	8274	Raka
00050000-5564-899d-d5f3-fda9c3583f98	1381	Rakek
00050000-5564-899d-c924-7924c78fea9c	4283	Rateče - Planica
00050000-5564-899d-c4ac-9e07bfb5b35a	2390	Ravne na Koroškem
00050000-5564-899d-db8f-d42331905089	9246	Razkrižje
00050000-5564-899d-eb72-1186d4fc2f12	3332	Rečica ob Savinji
00050000-5564-899d-2fab-f2d2563d1c1f	5292	Renče
00050000-5564-899d-b069-73b325b54e50	1310	Ribnica
00050000-5564-899d-82ed-895eea6cfb76	2364	Ribnica na Pohorju
00050000-5564-899d-90c3-9478160f0c52	3272	Rimske Toplice
00050000-5564-899d-0356-5bac903f41b5	1314	Rob
00050000-5564-899d-e31c-7ab8c47981ed	5215	Ročinj
00050000-5564-899d-b1dd-1d55422572c6	3250	Rogaška Slatina
00050000-5564-899d-6418-805245e429a8	9262	Rogašovci
00050000-5564-899d-eaad-a4e92ef1ea93	3252	Rogatec
00050000-5564-899d-a576-3215c94fc31f	1373	Rovte
00050000-5564-899d-62eb-1edd0acb9a07	2342	Ruše
00050000-5564-899d-2042-1cf23ce728fb	1282	Sava
00050000-5564-899d-d162-dcb8657c6427	6333	Sečovlje/Sicciole
00050000-5564-899d-19de-becbcd749b1d	4227	Selca
00050000-5564-899d-9483-bb89e93884f5	2352	Selnica ob Dravi
00050000-5564-899d-cd41-7a496df53d41	8333	Semič
00050000-5564-899d-9555-e92e247c5120	8281	Senovo
00050000-5564-899d-ac25-01577f43eba4	6224	Senožeče
00050000-5564-899d-d646-625bbe40bd26	8290	Sevnica
00050000-5564-899d-34f1-d132d29f359a	6210	Sežana
00050000-5564-899d-fb54-c0c995af43c8	2214	Sladki Vrh
00050000-5564-899d-db17-6534ad34378f	5283	Slap ob Idrijci
00050000-5564-899d-0179-785580540a6d	2380	Slovenj Gradec
00050000-5564-899d-b820-fa94b514c42c	2310	Slovenska Bistrica
00050000-5564-899d-4ce1-a1ece8d6aa04	3210	Slovenske Konjice
00050000-5564-899d-f14f-229cd82af7cf	1216	Smlednik
00050000-5564-899d-89aa-44e451e4ff39	5232	Soča
00050000-5564-899d-aadf-4790af05eaf8	1317	Sodražica
00050000-5564-899d-b467-98c6ead72e6b	3335	Solčava
00050000-5564-899d-b2f4-4c818b118013	5250	Solkan
00050000-5564-899d-91aa-2c89f0007eab	4229	Sorica
00050000-5564-899d-9f6a-c584d38e03f3	4225	Sovodenj
00050000-5564-899d-455c-9deb79d93515	5281	Spodnja Idrija
00050000-5564-899d-b0a4-2468ff3bb162	2241	Spodnji Duplek
00050000-5564-899d-3c8f-e6c3d49d32e5	9245	Spodnji Ivanjci
00050000-5564-899d-20b1-ab21e02ee343	2277	Središče ob Dravi
00050000-5564-899d-838c-6454690a9e9c	4267	Srednja vas v Bohinju
00050000-5564-899d-3c2a-9ad2cc00cf61	8256	Sromlje 
00050000-5564-899d-bf4b-744f52b3e598	5224	Srpenica
00050000-5564-899d-f48b-d7999d746f0f	1242	Stahovica
00050000-5564-899d-2645-8f363dd1f827	1332	Stara Cerkev
00050000-5564-899d-a51c-aeb6b86ba34c	8342	Stari trg ob Kolpi
00050000-5564-899d-7a79-b9d521122c9b	1386	Stari trg pri Ložu
00050000-5564-899d-3af5-377f90691546	2205	Starše
00050000-5564-899d-d703-7cdb0a81b84f	2289	Stoperce
00050000-5564-899d-7965-99d3c30c0047	8322	Stopiče
00050000-5564-899d-d79d-34d7a7163db2	3206	Stranice
00050000-5564-899d-9b7f-f8314a2a791c	8351	Straža
00050000-5564-899d-8812-182864ff7a38	1313	Struge
00050000-5564-899d-a4f8-9ac1251c7248	8293	Studenec
00050000-5564-899d-aa65-3e70c3462f31	8331	Suhor
00050000-5564-899d-db31-f9331a42db43	2233	Sv. Ana v Slovenskih goricah
00050000-5564-899d-bcaa-8553380cde3a	2235	Sv. Trojica v Slovenskih goricah
00050000-5564-899d-13a4-b77a25191d22	2353	Sveti Duh na Ostrem Vrhu
00050000-5564-899d-0c61-b8ab30806581	9244	Sveti Jurij ob Ščavnici
00050000-5564-899d-a4de-a50aaadf68c2	3264	Sveti Štefan
00050000-5564-899d-5eba-f4f3b31a7355	2258	Sveti Tomaž
00050000-5564-899d-7e41-395606f0f7e5	9204	Šalovci
00050000-5564-899d-c971-4778c13f04fd	5261	Šempas
00050000-5564-899d-60d2-00f1cb05e41c	5290	Šempeter pri Gorici
00050000-5564-899d-8fe2-5abc1430b2d7	3311	Šempeter v Savinjski dolini
00050000-5564-899d-8110-8d7ce78e9e9a	4208	Šenčur
00050000-5564-899d-024c-bdcd9b8d8e80	2212	Šentilj v Slovenskih goricah
00050000-5564-899d-d047-ca56fec6bb66	8297	Šentjanž
00050000-5564-899d-3d03-73f3ea3f1530	2373	Šentjanž pri Dravogradu
00050000-5564-899d-a7e4-8b31a9eaa65e	8310	Šentjernej
00050000-5564-899d-90eb-26737f3b8c6a	3230	Šentjur
00050000-5564-899d-9636-395307ba9c03	3271	Šentrupert
00050000-5564-899d-180d-9e9c992d1847	8232	Šentrupert
00050000-5564-899d-081d-ee1c4d9ad207	1296	Šentvid pri Stični
00050000-5564-899d-4d56-1aadc5b1de0e	8275	Škocjan
00050000-5564-899d-5b78-994b2b6c8ed3	6281	Škofije
00050000-5564-899d-7e47-7d6d249f3d1d	4220	Škofja Loka
00050000-5564-899d-99b1-0ddeebe858cb	3211	Škofja vas
00050000-5564-899d-3281-a71c4cff724e	1291	Škofljica
00050000-5564-899d-2b31-144179214542	6274	Šmarje
00050000-5564-899d-a8c4-45db5b30758f	1293	Šmarje - Sap
00050000-5564-899d-aad4-4bc9b3617878	3240	Šmarje pri Jelšah
00050000-5564-899d-54d1-378a116195f4	8220	Šmarješke Toplice
00050000-5564-899d-7634-d6a03b6eeeb4	2315	Šmartno na Pohorju
00050000-5564-899d-6592-8a6e25f98c27	3341	Šmartno ob Dreti
00050000-5564-899d-777e-35b7230f10c9	3327	Šmartno ob Paki
00050000-5564-899d-2f80-b9dd185cb9fd	1275	Šmartno pri Litiji
00050000-5564-899d-af9c-c0477631613d	2383	Šmartno pri Slovenj Gradcu
00050000-5564-899d-c4a5-7bbe2e1d10f1	3201	Šmartno v Rožni dolini
00050000-5564-899d-5718-4abc8e3cc4bd	3325	Šoštanj
00050000-5564-899d-51ba-39b090bc358e	6222	Štanjel
00050000-5564-899d-bf58-fe4d67d6e7fe	3220	Štore
00050000-5564-899d-c88a-0fe90f2ec769	3304	Tabor
00050000-5564-899d-ce70-1d9e58ae1370	3221	Teharje
00050000-5564-899d-4401-0eda99c07ddd	9251	Tišina
00050000-5564-899d-4eb9-2b1c6af465c4	5220	Tolmin
00050000-5564-899d-ccba-52c8d5a40b4e	3326	Topolšica
00050000-5564-899d-a461-b5a2d0ec7717	2371	Trbonje
00050000-5564-899d-bdf9-f1db46a3a2e4	1420	Trbovlje
00050000-5564-899d-db0b-b6be881aedc8	8231	Trebelno 
00050000-5564-899d-9d25-cdf3a2f4f9e8	8210	Trebnje
00050000-5564-899d-29c1-3f8f054d1220	5252	Trnovo pri Gorici
00050000-5564-899d-5371-b7af2192cad1	2254	Trnovska vas
00050000-5564-899d-6819-faa122ab21be	1222	Trojane
00050000-5564-899d-4b6e-e5b97f8c5667	1236	Trzin
00050000-5564-899d-ea90-0c9f23dae726	4290	Tržič
00050000-5564-899d-6f1e-bba931050bf1	8295	Tržišče
00050000-5564-899d-d675-bcee74dc20da	1311	Turjak
00050000-5564-899d-73bc-447376957668	9224	Turnišče
00050000-5564-899d-68e8-6788754b96e5	8323	Uršna sela
00050000-5564-899d-a1c4-e7417aefdff9	1252	Vače
00050000-5564-899d-c4dd-083202187024	3320	Velenje 
00050000-5564-899d-aa71-a87005a8730c	3322	Velenje - poštni predali
00050000-5564-899d-c619-04501c725f18	8212	Velika Loka
00050000-5564-899d-c50b-5c082f5367c3	2274	Velika Nedelja
00050000-5564-899d-f76d-efbbb89ce747	9225	Velika Polana
00050000-5564-899d-a183-3b9a150b2594	1315	Velike Lašče
00050000-5564-899d-b3ce-bdf8ec8462e9	8213	Veliki Gaber
00050000-5564-899d-5130-8f22d0f7afd9	9241	Veržej
00050000-5564-899d-1447-c81f02ec1974	1312	Videm - Dobrepolje
00050000-5564-899d-63bd-b44f60578f36	2284	Videm pri Ptuju
00050000-5564-899d-2387-8b1aef9cc3db	8344	Vinica
00050000-5564-899d-44ba-1a1ca2089bb0	5271	Vipava
00050000-5564-899d-f17d-60aebf0cfba0	4212	Visoko
00050000-5564-899d-dd1c-c803597bb43b	1294	Višnja Gora
00050000-5564-899d-a69a-2d3ef82dfd93	3205	Vitanje
00050000-5564-899d-0fa0-39ae6a6f63cd	2255	Vitomarci
00050000-5564-899d-4f63-97912465ae18	1217	Vodice
00050000-5564-899d-5932-eed3e259dd6c	3212	Vojnik\t
00050000-5564-899d-0660-1d088751b8fd	5293	Volčja Draga
00050000-5564-899d-bff6-84fc67c77b42	2232	Voličina
00050000-5564-899d-ed9b-eed74a2d33fe	3305	Vransko
00050000-5564-899d-e6b7-29d743e28689	6217	Vremski Britof
00050000-5564-899d-b68f-fd9b81013843	1360	Vrhnika
00050000-5564-899d-9c65-1dee19ca3669	2365	Vuhred
00050000-5564-899d-1b55-c375119848f0	2367	Vuzenica
00050000-5564-899d-3664-1c46c54aaca5	8292	Zabukovje 
00050000-5564-899d-8266-8c0e317248a6	1410	Zagorje ob Savi
00050000-5564-899d-0712-8664dac7123d	1303	Zagradec
00050000-5564-899d-1a11-a003a0bb7b92	2283	Zavrč
00050000-5564-899d-2c4d-21207755d03b	8272	Zdole 
00050000-5564-899d-3efa-0a1e12e558c0	4201	Zgornja Besnica
00050000-5564-899d-34ac-e5cca48890f4	2242	Zgornja Korena
00050000-5564-899d-128c-240dad5e61be	2201	Zgornja Kungota
00050000-5564-899d-1bed-03064631dda6	2316	Zgornja Ložnica
00050000-5564-899d-d68a-0b4bbfea233b	2314	Zgornja Polskava
00050000-5564-899d-191b-5d716ffdfbf4	2213	Zgornja Velka
00050000-5564-899d-4872-8ee76cb112f6	4247	Zgornje Gorje
00050000-5564-899d-004f-5df27057014b	4206	Zgornje Jezersko
00050000-5564-899d-80db-45c328f952fd	2285	Zgornji Leskovec
00050000-5564-899d-75f1-2dbb807d9b4e	1432	Zidani Most
00050000-5564-899d-6ba0-02a62b47278b	3214	Zreče
00050000-5564-899d-9754-723076797032	4209	Žabnica
00050000-5564-899d-bb8c-2fd0e86c18df	3310	Žalec
00050000-5564-899d-746a-37505f6d0910	4228	Železniki
00050000-5564-899d-5691-582f399ebe14	2287	Žetale
00050000-5564-899d-f6ab-fb25fc6aff80	4226	Žiri
00050000-5564-899d-44b5-c7295332c378	4274	Žirovnica
00050000-5564-899d-6f45-10927a8ed2c4	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5150320)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2691 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 5150135)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5150213)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5150332)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5150452)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5150503)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5150361)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5564-899e-1151-c74102b74f83	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5564-899e-ced1-6be08dffefb6	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5564-899e-4014-0885f7b2209d	0003	Kazinska	t	84	Kazinska dvorana
00220000-5564-899e-ff8f-7dd7404d6a5f	0004	Mali oder	t	24	Mali oder 
00220000-5564-899e-c0bb-3615493f4d3d	0005	Komorni oder	t	15	Komorni oder
00220000-5564-899e-c323-c01cb02003f0	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5564-899e-aa2a-67f135b21df2	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5150305)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5150295)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5150492)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5150429)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5150008)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5564-899e-0e89-5df8b9c20863	00010000-5564-899e-d7ad-a4005c944f9d	2015-05-26 16:56:31	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROJA0Gzue3/FXFV/JSc5Bgxp2ij364m82";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5150371)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5150046)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5564-899e-68c6-096609edf4fc	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5564-899e-4e4b-0b6a02737622	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5564-899e-df29-d0315fe55ace	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5564-899e-a33e-09f90b890e07	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5564-899e-c06c-1d853a474ff5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5564-899e-c62d-c6140c95bb49	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5150030)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5564-899e-0e89-5df8b9c20863	00020000-5564-899e-a33e-09f90b890e07
00010000-5564-899e-d7ad-a4005c944f9d	00020000-5564-899e-a33e-09f90b890e07
\.


--
-- TOC entry 2732 (class 0 OID 5150385)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5150326)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5150276)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5150598)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5564-899d-76f5-f2d3409a950f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5564-899d-8ac4-02c772a62425	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5564-899d-f1bc-b490d68d5f3e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5564-899d-85fb-41cc3c601965	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5564-899d-f7f0-a2457b3be8b8	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5150591)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5564-899d-42f8-e9e24c88a39d	00000000-5564-899d-85fb-41cc3c601965	popa
00000000-5564-899d-a282-bc370852ff6d	00000000-5564-899d-85fb-41cc3c601965	oseba
00000000-5564-899d-0db6-1d869e3393a0	00000000-5564-899d-8ac4-02c772a62425	prostor
00000000-5564-899d-fec1-592e385f56fa	00000000-5564-899d-85fb-41cc3c601965	besedilo
00000000-5564-899d-63ad-1789d2acb0e7	00000000-5564-899d-85fb-41cc3c601965	uprizoritev
00000000-5564-899d-ec30-a5bd16c7230a	00000000-5564-899d-85fb-41cc3c601965	funkcija
00000000-5564-899d-3fa5-b22b00ad90c3	00000000-5564-899d-85fb-41cc3c601965	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 5150586)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5150439)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 231
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2703 (class 0 OID 5150107)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5150282)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5150481)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5564-899d-114a-3954048ef051	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-899d-4bd1-64d8467e2a58	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5564-899d-cfc4-0c1dfe5e1b3f	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5564-899d-b0cf-be7fd8cc2d7b	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5564-899d-00b7-f545a149bef3	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5564-899d-08f5-20f994fa9bf7	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5564-899d-28cf-73c52b4429dc	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5564-899d-6629-1bf3091e8e93	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5564-899d-17a9-a5dc5d42b44d	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5564-899d-f01a-8c484f20ea0c	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5564-899d-499a-b96663f7a2df	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5564-899d-dc89-cb8170cfd1db	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5564-899d-6b66-fc1b3683418a	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5564-899d-6a68-10bb2d31c561	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5564-899d-2e7c-d2853d7e2cfa	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 5150170)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5150017)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5564-899e-d7ad-a4005c944f9d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROVkHTZ9uBGNu7/MzzlEMZ/ZcZ6YTTD7O	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5564-899e-9d9f-199727f61142	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROk9PlDiGd2jhnBVlZkq.aYEwvd7.Vioa	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5564-899e-0f20-fb6365519d68	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROnx4lwrm5soMTdOcIRP4z58IDSiLPjVS	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5564-899e-7198-2f4bfc2108ce	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROj6EZMLiCUyR3bLkbck5xal1zjRdNk8K	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5564-899e-5324-1839f8bf3186	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxRO4f1kuxx/7/1qUvC9Jx9wbZoAUaHd5YO	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5564-899e-b2b6-781cce1c2390	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROBifDmW0d.LjP6160qALujHtLhxi7iGG	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5564-899e-1296-a01335bc0796	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROWMHBCHPss9/imXtPQGOge9/Q6kHt8LS	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5564-899e-4434-bf2ee4bae75d	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROeFlXSNG0zQvC8vcOTFGUTHjP1gA6UXS	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5564-899e-4e9a-9e2067c6bf70	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxRO.fEeCIz5puy8rRa.0/npxqyO8R1PslC	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5564-899e-8966-25889e170362	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROMlvGhM3zrFyhFs6Eyu0JsgP0i4aGaxC	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5564-899e-3f7b-da2d281a0ec1	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROhz7keeEJEWzklZ0xkQKuIyD6GY8plK.	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5564-899e-0e89-5df8b9c20863	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5150536)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5564-899e-30a7-a1d3b9844ef3	00160000-5564-899e-2897-3b6d28097dfd	00150000-5564-899d-f6e6-aee6285641c9	00140000-5564-899d-86ae-4576ca6de120	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5564-899e-c0bb-3615493f4d3d
000e0000-5564-899e-c5a5-75da7d5dfc90	00160000-5564-899e-ea5d-910a2d4f490a	00150000-5564-899d-d1e4-1c9ba70b2cd9	00140000-5564-899d-bfb2-ae6d7c3b18a4	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5564-899e-c323-c01cb02003f0
\.


--
-- TOC entry 2713 (class 0 OID 5150228)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5150353)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5150421)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5150260)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5150526)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5564-899d-86ae-4576ca6de120	Drama	drama (SURS 01)
00140000-5564-899d-789a-893624cb0425	Opera	opera (SURS 02)
00140000-5564-899d-5215-6cfc73762f0e	Balet	balet (SURS 03)
00140000-5564-899d-485e-41ec9bfe9da5	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5564-899d-0c8c-3353a115b478	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5564-899d-bfb2-ae6d7c3b18a4	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5564-899d-69fc-576bb46a3de0	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5150411)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5564-899d-57fc-cb49d14d73d0	Opera	opera
00150000-5564-899d-8e87-a0a140c2faa0	Opereta	opereta
00150000-5564-899d-496d-cf28965814c8	Balet	balet
00150000-5564-899d-26aa-0c0ef924c312	Plesne prireditve	plesne prireditve
00150000-5564-899d-da68-1297f1a25db4	Lutkovno gledališče	lutkovno gledališče
00150000-5564-899d-ed44-a859f04937b1	Raziskovalno gledališče	raziskovalno gledališče
00150000-5564-899d-b73b-e1cf1520dfc2	Biografska drama	biografska drama
00150000-5564-899d-f6e6-aee6285641c9	Komedija	komedija
00150000-5564-899d-ac35-fa1c6801a40f	Črna komedija	črna komedija
00150000-5564-899d-0f1b-0c91534fec66	E-igra	E-igra
00150000-5564-899d-d1e4-1c9ba70b2cd9	Kriminalka	kriminalka
00150000-5564-899d-4709-35aa0d9e2be0	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5150071)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5150580)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5150570)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5150480)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 5150250)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5150275)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 5150196)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 5150407)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 5150226)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 5150269)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 5150210)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 5150318)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5150345)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 5150168)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5150080)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2322 (class 2606 OID 5150103)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5150060)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5150045)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 5150351)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 5150384)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 5150521)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 5150132)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 5150156)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5150324)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 5150146)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5150217)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5150336)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5150464)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 5150508)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 5150368)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 5150309)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 5150300)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5150502)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 5150436)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5150016)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5150375)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5150034)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5150054)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5150393)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 5150331)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 5150281)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5150604)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5150595)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5150590)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 5150449)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 5150112)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 5150291)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5150491)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5150181)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5150029)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5150551)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5150235)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5150359)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 5150427)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5150264)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 5150535)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 5150420)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 5150257)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 5150450)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 5150451)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 5150134)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2288 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2289 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2290 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 5150352)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 5150338)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 5150337)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 5150236)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 5150410)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 5150408)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 5150409)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 5150212)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 5150211)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5150523)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 5150524)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 5150525)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 5150555)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 5150552)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 5150554)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 5150553)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 5150183)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 5150182)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2293 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2294 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2320 (class 1259 OID 5150106)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 5150376)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 5150270)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5150061)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5150062)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 5150396)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 5150395)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 5150394)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 5150218)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 5150220)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 5150219)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5150597)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 5150304)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 5150302)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 5150301)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 5150303)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5150035)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5150036)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 5150360)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 5150325)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 5150437)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 5150438)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 5150148)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 5150147)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 5150149)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 5150465)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 5150466)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5150583)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5150582)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5150585)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5150581)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5150584)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 5150428)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 5150313)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 5150312)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 5150310)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 5150311)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5150572)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5150571)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 5150227)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5150082)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5150081)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 5150113)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 5150114)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 5150294)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 5150293)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 5150292)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 5150259)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 5150255)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 5150252)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 5150253)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 5150251)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 5150256)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 5150254)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 5150133)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5150197)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 5150199)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 5150198)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 5150200)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 5150319)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 5150522)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5150104)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 5150105)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5150605)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 5150169)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5150596)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 5150370)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 5150369)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 5150157)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 5150509)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5150055)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 5150258)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5150743)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5150728)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5150733)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5150753)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5150723)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5150748)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5150738)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5150898)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5150903)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5150658)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5150838)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5150833)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5150828)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5150718)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5150878)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5150868)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5150873)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5150693)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5150688)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5150818)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5150923)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5150928)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5150933)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5150953)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5150938)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5150948)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5150943)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5150683)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5150678)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5150643)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2512 (class 2606 OID 5150638)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5150848)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5150758)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 5150618)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 5150623)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5150863)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5150858)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5150853)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5150698)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5150708)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5150703)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5150993)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5150793)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5150783)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5150778)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5150788)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 5150608)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 5150613)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5150843)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5150823)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5150888)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5150893)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5150668)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5150663)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5150673)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5150908)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5150913)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5150978)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5150973)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5150988)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5150968)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5150983)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5150883)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5150813)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5150808)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5150798)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5150803)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5150963)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5150958)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5150713)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5150918)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 5150633)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 5150628)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5150648)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5150653)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5150773)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5150768)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5150763)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-26 16:56:31 CEST

--
-- PostgreSQL database dump complete
--

