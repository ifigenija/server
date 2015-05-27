--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-27 16:14:38 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 231 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 231
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 5349419)
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
-- TOC entry 227 (class 1259 OID 5349929)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
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
-- TOC entry 226 (class 1259 OID 5349912)
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
-- TOC entry 219 (class 1259 OID 5349822)
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
-- TOC entry 194 (class 1259 OID 5349592)
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
-- TOC entry 197 (class 1259 OID 5349626)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5349539)
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
-- TOC entry 213 (class 1259 OID 5349752)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    naziv character varying(255) NOT NULL,
    komentar character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekirvanj integer
);


--
-- TOC entry 192 (class 1259 OID 5349576)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5349620)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5349556)
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
-- TOC entry 202 (class 1259 OID 5349669)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5349694)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5349513)
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
-- TOC entry 181 (class 1259 OID 5349428)
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
-- TOC entry 182 (class 1259 OID 5349439)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
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
-- TOC entry 177 (class 1259 OID 5349393)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5349412)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5349701)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5349732)
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
-- TOC entry 223 (class 1259 OID 5349865)
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
-- TOC entry 184 (class 1259 OID 5349470)
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
-- TOC entry 186 (class 1259 OID 5349505)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5349675)
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
-- TOC entry 185 (class 1259 OID 5349490)
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
-- TOC entry 191 (class 1259 OID 5349568)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5349687)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5349807)
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
-- TOC entry 222 (class 1259 OID 5349858)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5349716)
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
-- TOC entry 201 (class 1259 OID 5349660)
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
-- TOC entry 200 (class 1259 OID 5349650)
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
-- TOC entry 221 (class 1259 OID 5349847)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5349784)
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
-- TOC entry 174 (class 1259 OID 5349364)
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
-- TOC entry 173 (class 1259 OID 5349362)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 5349726)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5349402)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5349386)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5349740)
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
-- TOC entry 204 (class 1259 OID 5349681)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5349631)
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
-- TOC entry 230 (class 1259 OID 5349955)
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
-- TOC entry 229 (class 1259 OID 5349948)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5349943)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5349794)
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
-- TOC entry 183 (class 1259 OID 5349462)
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
-- TOC entry 199 (class 1259 OID 5349637)
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
-- TOC entry 220 (class 1259 OID 5349836)
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
-- TOC entry 188 (class 1259 OID 5349525)
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
-- TOC entry 175 (class 1259 OID 5349373)
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
-- TOC entry 225 (class 1259 OID 5349891)
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
-- TOC entry 193 (class 1259 OID 5349583)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5349708)
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
-- TOC entry 215 (class 1259 OID 5349776)
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
-- TOC entry 195 (class 1259 OID 5349615)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5349881)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5349766)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2144 (class 2604 OID 5349367)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2698 (class 0 OID 5349419)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2745 (class 0 OID 5349929)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5565-d14d-8b48-cb4227242bbf	000d0000-5565-d14d-fa8c-07aaacdd961e	\N	00090000-5565-d14d-8a67-01be387d2542	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5565-d14d-cc0f-b36e035e66ed	000d0000-5565-d14d-ad57-dddf3f7c5e88	\N	00090000-5565-d14d-680b-8073a5d4aa39	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 5349912)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5349822)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5565-d14d-a18c-48f6d36fbddc	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5565-d14d-8c08-c2ed2ae80965	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5565-d14d-6a18-fac3f13bd95d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2712 (class 0 OID 5349592)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5349626)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5349539)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5565-d14c-7021-da877a5ad52f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5565-d14c-e387-65979a2cac8a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5565-d14c-4717-d1bb2cfbe0b9	AL	ALB	008	Albania 	Albanija	\N
00040000-5565-d14c-ee4a-14763e302c2f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5565-d14c-617f-1bd8fe6efa28	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5565-d14c-cd30-9c8f3e895342	AD	AND	020	Andorra 	Andora	\N
00040000-5565-d14c-4306-143840f66e9a	AO	AGO	024	Angola 	Angola	\N
00040000-5565-d14c-de69-877f1dd09eb8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5565-d14c-e786-2446febc69c9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5565-d14c-cb62-2987ca592f87	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-d14c-499d-36bbacc6341b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5565-d14c-d2cb-04fa2501aec9	AM	ARM	051	Armenia 	Armenija	\N
00040000-5565-d14c-dda6-1d2f61af46de	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5565-d14c-9d35-e07d6a3a1532	AU	AUS	036	Australia 	Avstralija	\N
00040000-5565-d14c-e8cf-238137974d18	AT	AUT	040	Austria 	Avstrija	\N
00040000-5565-d14c-3c75-309ab0c4ad38	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5565-d14c-a566-8453c5757ebc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5565-d14c-0232-15fed19bde41	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5565-d14c-b379-ee871450aaf5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5565-d14c-ce42-dda321389e23	BB	BRB	052	Barbados 	Barbados	\N
00040000-5565-d14c-33df-d2e9a12100e3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5565-d14c-0b19-9f7c924ab70c	BE	BEL	056	Belgium 	Belgija	\N
00040000-5565-d14c-1205-275bf71d089e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5565-d14c-a52e-da5736b57003	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5565-d14c-95f3-f2962e61cb9a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5565-d14c-da2f-38a11bdaa845	BT	BTN	064	Bhutan 	Butan	\N
00040000-5565-d14c-b440-c7a8fbe729e6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5565-d14c-bf55-2f7199da3c7f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5565-d14c-59ce-af1593c984fb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5565-d14c-172b-f76543583c7c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5565-d14c-2872-93be3f540c23	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5565-d14c-69a3-3c9b5fd572aa	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5565-d14c-e6b4-35c07e92522c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5565-d14c-5398-3dbaaa52daf5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5565-d14c-a116-aa348e657e28	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5565-d14c-28be-079f19bf7022	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5565-d14c-b0b2-805e413dd91c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5565-d14c-6ed7-d29eb9486558	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5565-d14c-30cd-8f6d822a60c2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5565-d14c-c8de-d5d0efef89f8	CA	CAN	124	Canada 	Kanada	\N
00040000-5565-d14c-301d-e96455346c20	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5565-d14c-df88-a76c7b508a86	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5565-d14c-f88c-ada0b122ced2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5565-d14c-3456-b78632b59168	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5565-d14c-1e00-c4e5254250cb	CL	CHL	152	Chile 	Čile	\N
00040000-5565-d14c-cd9f-32330c6753dd	CN	CHN	156	China 	Kitajska	\N
00040000-5565-d14c-92a2-fa828e03acf8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5565-d14c-e396-ec02c7faaea7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5565-d14c-bd11-188aceca04f9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5565-d14c-fe0b-0f65f6f7a2f6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5565-d14c-ef80-58255e35eb5c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5565-d14c-3f63-28e874953271	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5565-d14c-4707-0a019a3fe535	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5565-d14c-05db-fb27967b0e7a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5565-d14c-0d51-cfaac5dbb2e8	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5565-d14c-04ab-0ce6b8c10145	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5565-d14c-88f7-916eaccf7221	CU	CUB	192	Cuba 	Kuba	\N
00040000-5565-d14c-7b73-93731a4fde71	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5565-d14c-14c4-2b0f105eb366	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5565-d14c-794e-7d7cb5cc77f0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5565-d14c-c59e-b66d046064ea	DK	DNK	208	Denmark 	Danska	\N
00040000-5565-d14c-1105-f4c1b5003444	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5565-d14c-a43f-896e10f0eb02	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-d14c-5e60-662113b99c3b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5565-d14c-2922-0b5b1e7df7a3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5565-d14c-6886-cd65c865a2f0	EG	EGY	818	Egypt 	Egipt	\N
00040000-5565-d14c-26ad-0358ff18c020	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5565-d14c-dd76-d0edc23fd15c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5565-d14c-a1bb-fe93cd1c7314	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5565-d14c-e618-b152bf370a59	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5565-d14c-df7d-21783a7112b7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5565-d14c-b680-caadbd96d590	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5565-d14c-f96d-ba53f7b263a9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5565-d14c-cc67-661c9a37a0ad	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5565-d14c-c694-6312f737aaca	FI	FIN	246	Finland 	Finska	\N
00040000-5565-d14c-2c5c-ad7e2555003c	FR	FRA	250	France 	Francija	\N
00040000-5565-d14c-450b-9ad5ca90768f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5565-d14c-936f-f5143cbe3904	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5565-d14c-5e0e-1e40b5f0cb0d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5565-d14c-4a67-2f6aea0bba8b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5565-d14c-95f3-a804f39530f3	GA	GAB	266	Gabon 	Gabon	\N
00040000-5565-d14c-0abc-a92bc966cddc	GM	GMB	270	Gambia 	Gambija	\N
00040000-5565-d14c-c53e-d5dd33e3fb2c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5565-d14c-c529-a425ffaaab7c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5565-d14c-3e40-1a7ce51da4e8	GH	GHA	288	Ghana 	Gana	\N
00040000-5565-d14c-af28-5aea39fd7d20	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5565-d14c-be7c-218afa6c8585	GR	GRC	300	Greece 	Grčija	\N
00040000-5565-d14c-adf8-8ce408911e59	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5565-d14c-1088-5c8db7256d96	GD	GRD	308	Grenada 	Grenada	\N
00040000-5565-d14c-173f-eb71ec319e58	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5565-d14c-9ad8-eb7a2840fd33	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5565-d14c-7876-e5c8c8310749	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5565-d14c-2855-18ac76814bd4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5565-d14c-2710-d321b4cdf364	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5565-d14c-417d-3180602a1db3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5565-d14c-19fe-3d77dc5768ad	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5565-d14c-7b9f-3bf77004a664	HT	HTI	332	Haiti 	Haiti	\N
00040000-5565-d14c-9845-dbe47bbc21a3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5565-d14c-6ca8-82cc24ad2aa4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5565-d14c-8c92-fadf372609cb	HN	HND	340	Honduras 	Honduras	\N
00040000-5565-d14c-3e7d-3a2975f8c55e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5565-d14c-0400-724910d6cdba	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5565-d14c-dd7d-3ea16870a9d8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5565-d14c-4d12-29d18c0efb6c	IN	IND	356	India 	Indija	\N
00040000-5565-d14c-b18f-85d507f07d1c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5565-d14c-49b8-773d96ec24b1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5565-d14c-8189-0b269f00b2a7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5565-d14c-33c2-232e501bab33	IE	IRL	372	Ireland 	Irska	\N
00040000-5565-d14c-cc32-c4f51c02b453	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5565-d14c-131a-81721b1cd4bd	IL	ISR	376	Israel 	Izrael	\N
00040000-5565-d14c-003c-0f86debe1656	IT	ITA	380	Italy 	Italija	\N
00040000-5565-d14c-ce26-0358d2e183b1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5565-d14c-b0ab-d57e0e5d9d6b	JP	JPN	392	Japan 	Japonska	\N
00040000-5565-d14c-da73-cf4248663a1a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5565-d14c-3b4e-7ead0634fa48	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5565-d14c-76f5-9c8ada9e7952	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5565-d14c-129e-c4d452551e44	KE	KEN	404	Kenya 	Kenija	\N
00040000-5565-d14c-b76e-caf8e16c350a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5565-d14c-946a-d995b388fd71	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5565-d14c-b7d5-a51e76fdb221	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5565-d14c-9c55-60ab2551c1f2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5565-d14c-a794-47c388c0aa1a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5565-d14c-fe73-6d9514ce098f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5565-d14c-8291-fe006f7e4e25	LV	LVA	428	Latvia 	Latvija	\N
00040000-5565-d14c-5e31-89dfc7dfdbc9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5565-d14c-639a-9b0e5be23872	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5565-d14c-a9a6-c594c13da31b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5565-d14c-27f0-2964c0f90818	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5565-d14c-6e52-4bce099566fc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5565-d14c-fd6e-5ffe49a9e4b1	LT	LTU	440	Lithuania 	Litva	\N
00040000-5565-d14c-d0c5-3dd670ac8bc8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5565-d14c-0b71-86673d135ff3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5565-d14c-5382-035c9f788ffb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5565-d14c-b392-9a3b89eb7fbb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5565-d14c-8092-59b60b7ac4b0	MW	MWI	454	Malawi 	Malavi	\N
00040000-5565-d14c-4f4e-e9682203dc64	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5565-d14c-10d9-655fd54d5acb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5565-d14c-95be-6e05b3fbdbfd	ML	MLI	466	Mali 	Mali	\N
00040000-5565-d14c-095c-9887444f368b	MT	MLT	470	Malta 	Malta	\N
00040000-5565-d14c-f1a6-24590566001c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5565-d14c-5522-71ba034b3d94	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5565-d14c-4632-bf253abf01ce	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5565-d14c-548b-d956bba9738d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5565-d14c-8725-ef70007b68d8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5565-d14c-13a3-9bfc08d790c4	MX	MEX	484	Mexico 	Mehika	\N
00040000-5565-d14c-fae1-f211a7a3a643	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5565-d14c-feb3-29e4532f3f85	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5565-d14c-0423-837d046d6aba	MC	MCO	492	Monaco 	Monako	\N
00040000-5565-d14c-2880-10b6dc2e2a18	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5565-d14c-1a6c-188ac4a00246	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5565-d14c-dc14-d17f1b96235e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5565-d14c-27fe-9d882a99c45d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5565-d14c-174a-b97b4ed9c90a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5565-d14c-5059-1c230d5599bb	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5565-d14c-4735-9aef87100bc9	NA	NAM	516	Namibia 	Namibija	\N
00040000-5565-d14c-a54f-1930a7dfdc8a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5565-d14c-853b-bf656996897f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5565-d14c-5ddc-fbc95a6e3da6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5565-d14c-52c2-5bbded359ee2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5565-d14c-5b04-63e00772f0d1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5565-d14c-913f-41975aef058e	NE	NER	562	Niger 	Niger 	\N
00040000-5565-d14c-d46c-2a5a529a198a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5565-d14c-4b82-5b19ea387305	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5565-d14c-9514-1805c7cdfc3b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5565-d14c-421a-b716e44024e2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5565-d14c-a2e6-44e7dda1b341	NO	NOR	578	Norway 	Norveška	\N
00040000-5565-d14c-c491-f7796c3cd455	OM	OMN	512	Oman 	Oman	\N
00040000-5565-d14c-4db5-c7607d07257c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5565-d14c-073a-cc81f08f6304	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5565-d14c-911b-e1a10c4fe3c1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5565-d14c-a65c-a12be978f938	PA	PAN	591	Panama 	Panama	\N
00040000-5565-d14c-e573-9dc614718578	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5565-d14c-8019-8cd4e9a214c1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5565-d14c-a53c-0f14322d04c4	PE	PER	604	Peru 	Peru	\N
00040000-5565-d14c-17d7-c68acc72adf8	PH	PHL	608	Philippines 	Filipini	\N
00040000-5565-d14c-7750-8ff976011df7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5565-d14c-caf2-852c1a9d408e	PL	POL	616	Poland 	Poljska	\N
00040000-5565-d14c-6af6-1adc2c9e6cc1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5565-d14c-0fd8-3731fa24ac9c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5565-d14c-0ece-97bbbc2bce98	QA	QAT	634	Qatar 	Katar	\N
00040000-5565-d14c-9683-569f6743195b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5565-d14c-2c39-6f4c168d928d	RO	ROU	642	Romania 	Romunija	\N
00040000-5565-d14c-39f3-062e856548a7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5565-d14c-e766-3a87c1120ec7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5565-d14c-b621-72bbbb867df3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5565-d14c-8aba-53ddbdb7949b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5565-d14c-b1b9-f4b95a2507d0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5565-d14c-49b1-99d27a5480bd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5565-d14c-32ec-5b0dd8f7bd10	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5565-d14c-c011-acf91aa6dfc0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5565-d14c-423d-5e6c79872ac8	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5565-d14c-c8ae-204551452569	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5565-d14c-efc9-46d2808e1cd8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5565-d14c-53fb-32f62504974d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5565-d14c-4b0c-29dcbedeaf5c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5565-d14c-8b84-21c47ac6f7ed	SN	SEN	686	Senegal 	Senegal	\N
00040000-5565-d14c-9a5c-c0b2875af843	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5565-d14c-1b00-933ff77e35da	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5565-d14c-ad08-3d6011126d52	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5565-d14c-c3d0-5d22aee529ce	SG	SGP	702	Singapore 	Singapur	\N
00040000-5565-d14c-3a51-5802552ae0fa	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5565-d14c-3f96-6ae7a5285475	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5565-d14c-8f73-383937deb331	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5565-d14c-be94-2e592cded1eb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5565-d14c-3c7c-0e197b7ff0eb	SO	SOM	706	Somalia 	Somalija	\N
00040000-5565-d14c-05bd-6af80215b085	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5565-d14c-7d1c-abede316a882	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5565-d14c-24df-c1a3e55bb9b7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5565-d14c-ddf8-e6fbf7fdd0a9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5565-d14c-6049-bb94e749596d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5565-d14c-b2c7-da8300e146c7	SD	SDN	729	Sudan 	Sudan	\N
00040000-5565-d14c-52e0-4efa9fd61c9b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5565-d14c-7fd1-ae194068a12e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5565-d14c-88d9-5ad24d7782bf	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5565-d14c-c46f-a19df30a8164	SE	SWE	752	Sweden 	Švedska	\N
00040000-5565-d14c-b036-5ee428c96e85	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5565-d14c-56a9-b17d55015b0e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5565-d14c-9837-f5cdf5151f1f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5565-d14c-8e63-acf37c2d05e1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5565-d14c-d493-054b7a881bd1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5565-d14c-8b10-089292a640e8	TH	THA	764	Thailand 	Tajska	\N
00040000-5565-d14c-59b8-385ff8d21bb6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5565-d14c-263e-1eae8a6ffbb4	TG	TGO	768	Togo 	Togo	\N
00040000-5565-d14c-edd7-2c2bb41c2c7f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5565-d14c-c5a5-589ad6bb9194	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5565-d14c-9e8f-71af9715a31c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5565-d14c-4778-e60a9a21e1fa	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5565-d14c-8e62-a64a14423115	TR	TUR	792	Turkey 	Turčija	\N
00040000-5565-d14c-9cde-d93c58ac91d6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5565-d14c-11b5-aafe7c4f0151	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-d14c-78af-9829990fd1ac	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5565-d14c-1943-7b595ba0a77b	UG	UGA	800	Uganda 	Uganda	\N
00040000-5565-d14c-fcf5-5cf78f08f4b0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5565-d14c-0ffc-735c5d255014	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5565-d14c-fe76-867aa0e95823	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5565-d14c-4c22-a19e18c31639	US	USA	840	United States 	Združene države Amerike	\N
00040000-5565-d14c-2784-93d833575c8f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5565-d14c-0ca0-a11dd4fbc612	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5565-d14c-166d-dca260955618	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5565-d14c-8298-c34977dd5ea4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5565-d14c-f3ed-2598a6040f28	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5565-d14c-ac7e-1160dae2e24c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5565-d14d-c9f7-80d2ef76c2ee	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-d14d-80be-8dfb2cabadb0	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5565-d14d-54da-75efe40297e9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5565-d14d-4fcc-79fb2811c06a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5565-d14d-afd0-1d648260023a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5565-d14d-4601-60f77736c5a1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5565-d14d-05e1-00742f0154cd	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2731 (class 0 OID 5349752)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5565-d14d-e0cc-f17430a5c171	000e0000-5565-d14d-f6f1-d87adb830d59	\N	000f0000-5565-d14c-35c8-ddb843894079	igralec	Hipolita	glavna vloga	velika	t	6	t	t	\N
000d0000-5565-d14d-fa8c-07aaacdd961e	000e0000-5565-d14d-f6f1-d87adb830d59	\N	000f0000-5565-d14c-35c8-ddb843894079	igralec	Tezej	glavna vloga	velika	t	5	t	t	\N
000d0000-5565-d14d-ad57-dddf3f7c5e88	000e0000-5565-d14d-f6f1-d87adb830d59	\N	000f0000-5565-d14c-6996-6c54b3ea2893	umetnik	Režija		velika	t	8	t	t	\N
\.


--
-- TOC entry 2710 (class 0 OID 5349576)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5349620)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5349556)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2688 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5349669)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5349694)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 5349513)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5565-d14d-9a3c-ac967d4ff6f6	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5565-d14d-709c-a413dfd26b8c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5565-d14d-1df6-a1400c5d8184	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5565-d14d-a94a-878d4e8f77a3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5565-d14d-690c-41c754288de1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5565-d14d-7325-d0b19321c34b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5565-d14d-dc60-b3056563ce2e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5565-d14d-bca9-ebf9ac37734b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5565-d14d-f45a-42d2ce4a3890	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5565-d14d-ce06-e0333e536dab	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5565-d14d-273c-5598f96c1254	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5565-d14d-e5a6-85e8270085c4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5565-d14d-f3db-d0c917a25dbe	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-d14d-162d-1c26b41cc9d9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-d14d-f870-7c99967699c1	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2699 (class 0 OID 5349428)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5565-d14d-4233-57aae2d4443d	00000000-5565-d14d-690c-41c754288de1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5565-d14d-fb5b-f7c388f98b08	00000000-5565-d14d-690c-41c754288de1	00010000-5565-d14d-7b30-4c2cb1fd4810	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5565-d14d-8799-04982e9ce4a6	00000000-5565-d14d-7325-d0b19321c34b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2700 (class 0 OID 5349439)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5565-d14d-7b33-7604fc09d7d3	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5565-d14d-c713-95205b828b2d	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5565-d14d-cfaa-f0b1b6af6f74	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5565-d14d-cc66-9509f76f4c51	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5565-d14d-927d-640cf6a2169f	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5565-d14d-c261-7ab7e6d2302b	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5565-d14d-d3a5-cda6db7cd254	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5565-d14d-1222-28c6ebb9c860	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5565-d14d-8a67-01be387d2542	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5565-d14d-680b-8073a5d4aa39	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5565-d14d-4ab9-30dc736f90a2	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2690 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5349393)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5565-d14d-9f64-2a77315b1966	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5565-d14d-5cb3-2a49d8789f23	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5565-d14d-d877-ea50aa67272b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5565-d14d-d69c-3c52706419d5	Abonma-read	Abonma - branje	f
00030000-5565-d14d-16c4-a46ac004ee7b	Abonma-write	Abonma - spreminjanje	f
00030000-5565-d14d-f005-eafd9eeadbf7	Alternacija-read	Alternacija - branje	f
00030000-5565-d14d-f1c2-b78d569f67e2	Alternacija-write	Alternacija - spreminjanje	f
00030000-5565-d14d-b080-0203e4a50702	Arhivalija-read	Arhivalija - branje	f
00030000-5565-d14d-0b9a-e9f291fd8d84	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5565-d14d-804e-41cbb7b6bf36	Besedilo-read	Besedilo - branje	f
00030000-5565-d14d-46bc-9b497e753740	Besedilo-write	Besedilo - spreminjanje	f
00030000-5565-d14d-bdd0-be8024dc09ac	DogodekIzven-read	DogodekIzven - branje	f
00030000-5565-d14d-6de4-f7a99d7b897c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5565-d14d-bd68-25cb0b5d7230	Dogodek-read	Dogodek - branje	f
00030000-5565-d14d-80a3-8de9caf9e009	Dogodek-write	Dogodek - spreminjanje	f
00030000-5565-d14d-e3d6-75269cdb9e0e	Drzava-read	Drzava - branje	f
00030000-5565-d14d-9bab-8c226e01aeb5	Drzava-write	Drzava - spreminjanje	f
00030000-5565-d14d-0424-20001128cf84	Funkcija-read	Funkcija - branje	f
00030000-5565-d14d-287c-1d38f5660fc5	Funkcija-write	Funkcija - spreminjanje	f
00030000-5565-d14d-60ed-aa39223e13e8	Gostovanje-read	Gostovanje - branje	f
00030000-5565-d14d-8c68-dcd5bc3fa4ef	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5565-d14d-204e-f59df78a5d2f	Gostujoca-read	Gostujoca - branje	f
00030000-5565-d14d-d0e0-f703311bed88	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5565-d14d-54bf-dcb947b97234	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5565-d14d-0aae-150796badd00	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5565-d14d-3930-42ed44bcd7e2	Kupec-read	Kupec - branje	f
00030000-5565-d14d-6e9f-5129b5648286	Kupec-write	Kupec - spreminjanje	f
00030000-5565-d14d-9d5f-6cd0f286167e	NacinPlacina-read	NacinPlacina - branje	f
00030000-5565-d14d-1f33-8fa77a3c193b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5565-d14d-a03d-9210bc08651c	Option-read	Option - branje	f
00030000-5565-d14d-fbb8-9e0e46ebb4e7	Option-write	Option - spreminjanje	f
00030000-5565-d14d-ef46-1b932a2b8c86	OptionValue-read	OptionValue - branje	f
00030000-5565-d14d-047d-59507e15a8c8	OptionValue-write	OptionValue - spreminjanje	f
00030000-5565-d14d-15dc-9024e7d9052f	Oseba-read	Oseba - branje	f
00030000-5565-d14d-c8f6-25fe40712bb2	Oseba-write	Oseba - spreminjanje	f
00030000-5565-d14d-8d33-027da57303a1	Permission-read	Permission - branje	f
00030000-5565-d14d-fd56-a607d6600725	Permission-write	Permission - spreminjanje	f
00030000-5565-d14d-0a9e-22266544644a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5565-d14d-2e56-615abcc96fbf	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5565-d14d-7861-d6bf1a6254ed	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5565-d14d-3713-5901d0636473	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5565-d14d-13e7-a1c399c0191d	Pogodba-read	Pogodba - branje	f
00030000-5565-d14d-4942-b3eec6216352	Pogodba-write	Pogodba - spreminjanje	f
00030000-5565-d14d-beca-737859ae7f78	Popa-read	Popa - branje	f
00030000-5565-d14d-4879-010f4ab5e6d5	Popa-write	Popa - spreminjanje	f
00030000-5565-d14d-3e17-d54e5d87f0c5	Posta-read	Posta - branje	f
00030000-5565-d14d-77c9-f3470cce65a0	Posta-write	Posta - spreminjanje	f
00030000-5565-d14d-586b-b885dfaa026f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5565-d14d-c3e0-821bd613fea1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5565-d14d-83bc-9e694a723a15	PostniNaslov-read	PostniNaslov - branje	f
00030000-5565-d14d-ac7d-6d0224ae7196	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5565-d14d-b750-4bbdaf0c56ec	Predstava-read	Predstava - branje	f
00030000-5565-d14d-eaa7-062f7ddda4f5	Predstava-write	Predstava - spreminjanje	f
00030000-5565-d14d-5802-447d9a9083b1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5565-d14d-7b78-2d742afd675a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5565-d14d-c02f-2818c2457b4e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5565-d14d-c512-bb1025efe263	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5565-d14d-4488-fa66c4401093	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5565-d14d-6c37-6e8cc338d35b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5565-d14d-663a-13916a5ba576	Prostor-read	Prostor - branje	f
00030000-5565-d14d-c910-04b742419409	Prostor-write	Prostor - spreminjanje	f
00030000-5565-d14d-9f19-d514fba27760	Racun-read	Racun - branje	f
00030000-5565-d14d-8ab9-dcbcb7ac4ce6	Racun-write	Racun - spreminjanje	f
00030000-5565-d14d-d52f-272b8a18d931	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5565-d14d-c214-e8fcddf74b82	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5565-d14d-da44-7c109fadbc8b	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5565-d14d-fb82-fd75bfa1634b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5565-d14d-bab1-d2e5e663c226	Rekvizit-read	Rekvizit - branje	f
00030000-5565-d14d-5b64-97e3024aeb91	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5565-d14d-e12e-2ba78ce0b02d	Revizija-read	Revizija - branje	f
00030000-5565-d14d-c075-d1074c2329ba	Revizija-write	Revizija - spreminjanje	f
00030000-5565-d14d-f6ae-25a40c8fa25d	Rezervacija-read	Rezervacija - branje	f
00030000-5565-d14d-a697-39ee016a0b3d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5565-d14d-3b31-523c4db3e263	Role-read	Role - branje	f
00030000-5565-d14d-16fe-144eb4c5bde3	Role-write	Role - spreminjanje	f
00030000-5565-d14d-149a-897dfc7de1b8	SedezniRed-read	SedezniRed - branje	f
00030000-5565-d14d-851d-56a7c7b67a0c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5565-d14d-e8cf-21ca52ba790f	Sedez-read	Sedez - branje	f
00030000-5565-d14d-c9c0-6285143b3fe7	Sedez-write	Sedez - spreminjanje	f
00030000-5565-d14d-5281-f6de0f4033bb	Sezona-read	Sezona - branje	f
00030000-5565-d14d-9900-98c54844444e	Sezona-write	Sezona - spreminjanje	f
00030000-5565-d14d-1a3e-2f729cd0032d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5565-d14d-997a-e02d93ad2db0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5565-d14d-9d30-ca34cf4f90ec	Stevilcenje-read	Stevilcenje - branje	f
00030000-5565-d14d-f411-ca8c6931cd0c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5565-d14d-a315-8dbf3c8011ea	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5565-d14d-22bc-ca09292933a6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5565-d14d-ddd9-7640c2a47340	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5565-d14d-725f-17b470d8e7a7	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5565-d14d-920e-b24ece9a6ecc	Telefonska-read	Telefonska - branje	f
00030000-5565-d14d-ffcf-a3262bc6a887	Telefonska-write	Telefonska - spreminjanje	f
00030000-5565-d14d-8252-f57f3f44e699	TerminStoritve-read	TerminStoritve - branje	f
00030000-5565-d14d-762c-c006a5575f99	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5565-d14d-9cbe-bb25ad1f9574	TipFunkcije-read	TipFunkcije - branje	f
00030000-5565-d14d-3948-c129c8703dfa	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5565-d14d-dd5d-a91ae807efa1	Trr-read	Trr - branje	f
00030000-5565-d14d-eb91-5c2c2c2580bc	Trr-write	Trr - spreminjanje	f
00030000-5565-d14d-97bd-07ee9fe1582f	Uprizoritev-read	Uprizoritev - branje	f
00030000-5565-d14d-89e3-7e7fde64da6b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5565-d14d-e6e2-f697ac19cfa2	User-read	User - branje	f
00030000-5565-d14d-da57-c6a638411773	User-write	User - spreminjanje	f
00030000-5565-d14d-623b-4b5d8bad813b	Vaja-read	Vaja - branje	f
00030000-5565-d14d-da31-d943023d0bf5	Vaja-write	Vaja - spreminjanje	f
00030000-5565-d14d-69af-d89500b41ce8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5565-d14d-d182-d4b7380cf9d0	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5565-d14d-0213-2fc51418baa9	Zaposlitev-read	Zaposlitev - branje	f
00030000-5565-d14d-4022-dcd44f9e829f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5565-d14d-6b69-7c542a8d3c04	Zasedenost-read	Zasedenost - branje	f
00030000-5565-d14d-5c86-600cebce1e08	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5565-d14d-5a17-b31bf9ba48ab	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5565-d14d-3b7c-3ce192da847f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5565-d14d-49b0-01797f637c4f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5565-d14d-9026-a9c2745da01b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2697 (class 0 OID 5349412)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5565-d14d-576b-5704562038a1	00030000-5565-d14d-e3d6-75269cdb9e0e
00020000-5565-d14d-7d62-db99720356a0	00030000-5565-d14d-9bab-8c226e01aeb5
00020000-5565-d14d-7d62-db99720356a0	00030000-5565-d14d-e3d6-75269cdb9e0e
\.


--
-- TOC entry 2725 (class 0 OID 5349701)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5349732)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5349865)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5349470)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5565-d14d-063d-f2ce4165fc0b	00040000-5565-d14c-7021-da877a5ad52f	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5565-d14d-80fa-cead9d87450f	00040000-5565-d14c-7021-da877a5ad52f	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2704 (class 0 OID 5349505)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5565-d14c-2011-f832bd22d1e1	8341	Adlešiči
00050000-5565-d14c-a846-8dcf4e6e8259	5270	Ajdovščina
00050000-5565-d14c-3f45-14f058284afa	6280	Ankaran/Ancarano
00050000-5565-d14c-a56d-2a2ccdcc508a	9253	Apače
00050000-5565-d14c-9b66-c4880a513f57	8253	Artiče
00050000-5565-d14c-d4e7-9ef2262f3aaf	4275	Begunje na Gorenjskem
00050000-5565-d14c-0311-dc9ae97e5102	1382	Begunje pri Cerknici
00050000-5565-d14c-48bc-989ff4698fe9	9231	Beltinci
00050000-5565-d14c-2d80-8c1735b2ee4c	2234	Benedikt
00050000-5565-d14c-0b78-48905e908614	2345	Bistrica ob Dravi
00050000-5565-d14c-acd9-798889829dc8	3256	Bistrica ob Sotli
00050000-5565-d14c-a35e-4c6ac0bc9af7	8259	Bizeljsko
00050000-5565-d14c-d25b-adcffe865bab	1223	Blagovica
00050000-5565-d14c-adbd-55102589c618	8283	Blanca
00050000-5565-d14c-4a24-b1971e8a1321	4260	Bled
00050000-5565-d14c-6a2c-18ad06e5a285	4273	Blejska Dobrava
00050000-5565-d14c-0c15-134b1af0d995	9265	Bodonci
00050000-5565-d14c-10c8-f65ea420aa59	9222	Bogojina
00050000-5565-d14c-3c3b-dd4d23b53b31	4263	Bohinjska Bela
00050000-5565-d14c-def2-dc9503ccdfff	4264	Bohinjska Bistrica
00050000-5565-d14c-d822-6ed3a6939059	4265	Bohinjsko jezero
00050000-5565-d14c-68bb-9890c0a57bd2	1353	Borovnica
00050000-5565-d14c-f3ed-619719e7b1e5	8294	Boštanj
00050000-5565-d14c-0869-e33378599a20	5230	Bovec
00050000-5565-d14c-5b8c-3c0b44599d3d	5295	Branik
00050000-5565-d14c-cf2d-44c5cb99218c	3314	Braslovče
00050000-5565-d14c-3a79-d1761f7e9481	5223	Breginj
00050000-5565-d14c-f235-973089e2d24d	8280	Brestanica
00050000-5565-d14c-470a-1b10ab348567	2354	Bresternica
00050000-5565-d14c-c036-9f139304de54	4243	Brezje
00050000-5565-d14c-b349-d792c477e001	1351	Brezovica pri Ljubljani
00050000-5565-d14c-9d22-f75b545bee90	8250	Brežice
00050000-5565-d14c-4636-b51a969195fa	4210	Brnik - Aerodrom
00050000-5565-d14c-0c5d-c18d7e82e854	8321	Brusnice
00050000-5565-d14c-6bc9-bccd634e4a78	3255	Buče
00050000-5565-d14c-b78b-25bafe60fd85	8276	Bučka 
00050000-5565-d14c-cede-9aa5a77c2303	9261	Cankova
00050000-5565-d14c-c9ff-57c86403a754	3000	Celje 
00050000-5565-d14c-dff7-b2c03a27b23f	3001	Celje - poštni predali
00050000-5565-d14c-3c1b-b4f60540c80b	4207	Cerklje na Gorenjskem
00050000-5565-d14c-ef14-845af980409c	8263	Cerklje ob Krki
00050000-5565-d14c-3a02-f541056e6748	1380	Cerknica
00050000-5565-d14c-55b2-8f72f648cac6	5282	Cerkno
00050000-5565-d14c-e0e6-1706324448e8	2236	Cerkvenjak
00050000-5565-d14c-6edb-4b96e4e9ac86	2215	Ceršak
00050000-5565-d14c-d074-906ee1b467fe	2326	Cirkovce
00050000-5565-d14c-a8bd-80248db5a816	2282	Cirkulane
00050000-5565-d14c-0a61-b1c9608ee607	5273	Col
00050000-5565-d14c-0b97-a9555ac8c546	8251	Čatež ob Savi
00050000-5565-d14c-750c-9d497e17da67	1413	Čemšenik
00050000-5565-d14c-a0b4-bf5b40bf9a59	5253	Čepovan
00050000-5565-d14c-fceb-b603455110fb	9232	Črenšovci
00050000-5565-d14c-f4b9-1feaf39594fd	2393	Črna na Koroškem
00050000-5565-d14c-9a35-8b023eb1c5a6	6275	Črni Kal
00050000-5565-d14c-ab72-f1bc13f03d00	5274	Črni Vrh nad Idrijo
00050000-5565-d14c-61ba-8092290105b7	5262	Črniče
00050000-5565-d14c-0f25-93f950ee7399	8340	Črnomelj
00050000-5565-d14c-5dcc-8b2add0eaaf1	6271	Dekani
00050000-5565-d14c-3ba2-989ab07e89ca	5210	Deskle
00050000-5565-d14c-72b5-fd30ae2818a1	2253	Destrnik
00050000-5565-d14c-6cc4-988f345281d9	6215	Divača
00050000-5565-d14c-81c3-007e69c61130	1233	Dob
00050000-5565-d14c-7819-47fa1d3e6dee	3224	Dobje pri Planini
00050000-5565-d14c-3eab-f1201ed10d1a	8257	Dobova
00050000-5565-d14c-0302-ccd063038a6a	1423	Dobovec
00050000-5565-d14c-3c53-6f2b49999ac5	5263	Dobravlje
00050000-5565-d14c-fa22-686599b10492	3204	Dobrna
00050000-5565-d14c-9a3e-5bb3783b0444	8211	Dobrnič
00050000-5565-d14c-fdf1-48c98c36bd13	1356	Dobrova
00050000-5565-d14c-9acd-c1f48f9483a4	9223	Dobrovnik/Dobronak 
00050000-5565-d14c-f718-6cf153c9a5a9	5212	Dobrovo v Brdih
00050000-5565-d14c-e854-540b7d5a0ebd	1431	Dol pri Hrastniku
00050000-5565-d14c-a65c-08bfbca2c624	1262	Dol pri Ljubljani
00050000-5565-d14c-972a-4bfd3d3a71bc	1273	Dole pri Litiji
00050000-5565-d14c-4809-c2f96939cf29	1331	Dolenja vas
00050000-5565-d14c-91fb-354a4015d54f	8350	Dolenjske Toplice
00050000-5565-d14c-089f-ccbf8eb7cf8b	1230	Domžale
00050000-5565-d14c-fc93-652702dbdc92	2252	Dornava
00050000-5565-d14c-e7f6-22fda405e3cf	5294	Dornberk
00050000-5565-d14c-2421-6b61ccd2663c	1319	Draga
00050000-5565-d14c-f92e-d7fd5d5b9430	8343	Dragatuš
00050000-5565-d14c-27f6-4c51e8187e10	3222	Dramlje
00050000-5565-d14c-e304-43826c3d75a1	2370	Dravograd
00050000-5565-d14c-da91-33f597f79b64	4203	Duplje
00050000-5565-d14c-9c12-4654bc80bab6	6221	Dutovlje
00050000-5565-d14c-5784-58813adecfa5	8361	Dvor
00050000-5565-d14c-5634-7c80995f1ad7	2343	Fala
00050000-5565-d14c-68f6-63477db794e3	9208	Fokovci
00050000-5565-d14c-0f72-9613c33d75e6	2313	Fram
00050000-5565-d14c-22f4-84692e725797	3213	Frankolovo
00050000-5565-d14c-e198-013d41e74305	1274	Gabrovka
00050000-5565-d14c-9527-a83f957067f4	8254	Globoko
00050000-5565-d14c-17f5-89042ed3c05d	5275	Godovič
00050000-5565-d14c-d67d-30bff7bf74ad	4204	Golnik
00050000-5565-d14c-8f5c-2c42c7831eb4	3303	Gomilsko
00050000-5565-d14c-5c36-382293fd1b4c	4224	Gorenja vas
00050000-5565-d14c-3eb6-1220a9cc5f0c	3263	Gorica pri Slivnici
00050000-5565-d14c-8a12-c3437eb1a80f	2272	Gorišnica
00050000-5565-d14c-03df-9644f787e788	9250	Gornja Radgona
00050000-5565-d14c-6d3c-a787db8002a5	3342	Gornji Grad
00050000-5565-d14c-84c4-1089838a5839	4282	Gozd Martuljek
00050000-5565-d14c-6e2f-40715646c0fa	6272	Gračišče
00050000-5565-d14c-a7f2-238a66947e5f	9264	Grad
00050000-5565-d14c-0126-51114e3d70d8	8332	Gradac
00050000-5565-d14c-e9ec-d6c79c572087	1384	Grahovo
00050000-5565-d14c-f799-cd18f9365bf1	5242	Grahovo ob Bači
00050000-5565-d14c-7cde-45fa6a520cfd	5251	Grgar
00050000-5565-d14c-bc79-ebd3146964c1	3302	Griže
00050000-5565-d14c-de8a-c5feb7702426	3231	Grobelno
00050000-5565-d14c-dbd9-72fa86701562	1290	Grosuplje
00050000-5565-d14c-1beb-be1ec4de0efe	2288	Hajdina
00050000-5565-d14c-a8d5-b5b1f04035c5	8362	Hinje
00050000-5565-d14c-7947-b4352986117d	2311	Hoče
00050000-5565-d14c-d377-dd40341a3fbb	9205	Hodoš/Hodos
00050000-5565-d14c-80bc-ec2f9de7c805	1354	Horjul
00050000-5565-d14c-18cb-407bf82fa5ae	1372	Hotedršica
00050000-5565-d14c-e81f-cfbe314814b3	1430	Hrastnik
00050000-5565-d14c-aaae-d6a333fe8808	6225	Hruševje
00050000-5565-d14c-562d-f92ec98e362e	4276	Hrušica
00050000-5565-d14c-1581-09a1c6e3ac1e	5280	Idrija
00050000-5565-d14c-3444-2ded3dbc8646	1292	Ig
00050000-5565-d14c-0af8-4dd275b9a764	6250	Ilirska Bistrica
00050000-5565-d14c-538b-b03dbaa09f77	6251	Ilirska Bistrica-Trnovo
00050000-5565-d14c-ff30-184d2da38031	1295	Ivančna Gorica
00050000-5565-d14c-ae81-d656e0068c80	2259	Ivanjkovci
00050000-5565-d14c-5106-c12ac778e624	1411	Izlake
00050000-5565-d14c-9d1d-506ca8519bfc	6310	Izola/Isola
00050000-5565-d14c-4426-2d84513872f2	2222	Jakobski Dol
00050000-5565-d14c-2e18-ec53ff7b28c5	2221	Jarenina
00050000-5565-d14c-14dc-c10e9919d8b0	6254	Jelšane
00050000-5565-d14c-3e28-0686af9e9f92	4270	Jesenice
00050000-5565-d14c-762d-3bea23328135	8261	Jesenice na Dolenjskem
00050000-5565-d14c-7a5a-86f5d4e057f2	3273	Jurklošter
00050000-5565-d14c-e900-d2b335d22852	2223	Jurovski Dol
00050000-5565-d14c-f651-0b97ca3add07	2256	Juršinci
00050000-5565-d14c-15b8-a482f5e1934f	5214	Kal nad Kanalom
00050000-5565-d14c-76e1-463cefcde061	3233	Kalobje
00050000-5565-d14c-f4f0-4e1e3c0a3fba	4246	Kamna Gorica
00050000-5565-d14c-22d9-f184f0dc2736	2351	Kamnica
00050000-5565-d14c-f99c-1a0807f82377	1241	Kamnik
00050000-5565-d14c-54a6-392142be2370	5213	Kanal
00050000-5565-d14c-b9d5-22ee7b8a049f	8258	Kapele
00050000-5565-d14c-efb0-019c29a949d3	2362	Kapla
00050000-5565-d14c-5413-be3290e7c744	2325	Kidričevo
00050000-5565-d14c-f48d-32867eda44a2	1412	Kisovec
00050000-5565-d14c-ecff-cfc17372cc91	6253	Knežak
00050000-5565-d14c-473a-2870288ca5e7	5222	Kobarid
00050000-5565-d14c-9f30-953f75cb678e	9227	Kobilje
00050000-5565-d14c-371c-0a066dbddf39	1330	Kočevje
00050000-5565-d14c-381d-5821cc2c4d37	1338	Kočevska Reka
00050000-5565-d14c-5ecf-b6282cb5b37d	2276	Kog
00050000-5565-d14c-5613-2041f29dcfb8	5211	Kojsko
00050000-5565-d14c-84df-5954a789cef8	6223	Komen
00050000-5565-d14c-f9e0-713d4b72e61f	1218	Komenda
00050000-5565-d14c-c83f-00985e4e4f7c	6000	Koper/Capodistria 
00050000-5565-d14c-45b5-b39cf16eb776	6001	Koper/Capodistria - poštni predali
00050000-5565-d14c-8967-43400b2f2555	8282	Koprivnica
00050000-5565-d14c-ecfb-0e62b3043f52	5296	Kostanjevica na Krasu
00050000-5565-d14c-fe97-f805ac470708	8311	Kostanjevica na Krki
00050000-5565-d14c-6ec5-2e1b974a2108	1336	Kostel
00050000-5565-d14c-5ea3-70fa555a8137	6256	Košana
00050000-5565-d14c-492b-dbcf6438bb2c	2394	Kotlje
00050000-5565-d14c-d662-ce053d7794f1	6240	Kozina
00050000-5565-d14c-a8f2-f37dd8e4f2c9	3260	Kozje
00050000-5565-d14c-5626-07942cc2f007	4000	Kranj 
00050000-5565-d14c-5c71-263924ae0c45	4001	Kranj - poštni predali
00050000-5565-d14c-346d-ae7d7a2fa38e	4280	Kranjska Gora
00050000-5565-d14c-d190-1e57c4c6d7ca	1281	Kresnice
00050000-5565-d14c-b708-b86e0e52b972	4294	Križe
00050000-5565-d14c-ce35-8caa21a6a2f6	9206	Križevci
00050000-5565-d14c-e87b-d24fa8a6096a	9242	Križevci pri Ljutomeru
00050000-5565-d14c-dd24-9d02de64f690	1301	Krka
00050000-5565-d14c-4221-674e078c262b	8296	Krmelj
00050000-5565-d14c-aa8e-d35aa65575d4	4245	Kropa
00050000-5565-d14c-e7f0-8860097881e4	8262	Krška vas
00050000-5565-d14c-6692-9b2a2db2cc95	8270	Krško
00050000-5565-d14c-071c-73b23c4bfeb9	9263	Kuzma
00050000-5565-d14c-80fb-27a4fa2639d7	2318	Laporje
00050000-5565-d14c-2807-417ab21a5dc0	3270	Laško
00050000-5565-d14c-3e40-01eed6c23f61	1219	Laze v Tuhinju
00050000-5565-d14c-f2ca-7c93c22648b8	2230	Lenart v Slovenskih goricah
00050000-5565-d14c-522f-b53b9c21e0ed	9220	Lendava/Lendva
00050000-5565-d14c-8e76-8d679de9e084	4248	Lesce
00050000-5565-d14c-59cd-4133604b12bb	3261	Lesično
00050000-5565-d14c-9e39-bd2afea93c6b	8273	Leskovec pri Krškem
00050000-5565-d14c-6973-fe9685e20f61	2372	Libeliče
00050000-5565-d14c-8f7b-67f97a29809f	2341	Limbuš
00050000-5565-d14c-1dd7-3680930c7803	1270	Litija
00050000-5565-d14c-8a6e-c58655fe4e81	3202	Ljubečna
00050000-5565-d14c-ff9e-06f5d3e98959	1000	Ljubljana 
00050000-5565-d14c-6640-f5cfedbe5ebf	1001	Ljubljana - poštni predali
00050000-5565-d14c-0634-ea8ceece551e	1231	Ljubljana - Črnuče
00050000-5565-d14c-2fe3-66cd1692d44d	1261	Ljubljana - Dobrunje
00050000-5565-d14c-20fa-929394d9bd04	1260	Ljubljana - Polje
00050000-5565-d14c-a99d-4d6898becfd8	1210	Ljubljana - Šentvid
00050000-5565-d14c-592e-69fc93981372	1211	Ljubljana - Šmartno
00050000-5565-d14c-9899-ea44bb1f804e	3333	Ljubno ob Savinji
00050000-5565-d14c-2d2c-695f4a37985e	9240	Ljutomer
00050000-5565-d14c-5798-a83452b82dae	3215	Loče
00050000-5565-d14c-28e2-aa4ed69a6db7	5231	Log pod Mangartom
00050000-5565-d14c-7f83-109c512671f8	1358	Log pri Brezovici
00050000-5565-d14c-5afa-f8d59784fab8	1370	Logatec
00050000-5565-d14c-f464-7c772b7719d6	1371	Logatec
00050000-5565-d14c-e79b-53d5fd21359f	1434	Loka pri Zidanem Mostu
00050000-5565-d14c-ab13-3a0a8554aa49	3223	Loka pri Žusmu
00050000-5565-d14c-8ca0-89f6cfba9cb0	6219	Lokev
00050000-5565-d14c-059a-baea8dd2d089	1318	Loški Potok
00050000-5565-d14c-1287-771180b25dde	2324	Lovrenc na Dravskem polju
00050000-5565-d14c-9f91-cd63ec00ee6d	2344	Lovrenc na Pohorju
00050000-5565-d14c-010d-8b792d899d15	3334	Luče
00050000-5565-d14c-4fda-2274ce6ce3d4	1225	Lukovica
00050000-5565-d14c-1475-cc35e562713b	9202	Mačkovci
00050000-5565-d14c-f262-6679bf5c6d25	2322	Majšperk
00050000-5565-d14c-63fc-bedadaee1b82	2321	Makole
00050000-5565-d14c-4e95-1423b3ff3b8e	9243	Mala Nedelja
00050000-5565-d14c-65eb-5688ba110943	2229	Malečnik
00050000-5565-d14c-5085-00471ea1b03a	6273	Marezige
00050000-5565-d14c-9402-edd36448cd71	2000	Maribor 
00050000-5565-d14c-33ff-baa511aeee9a	2001	Maribor - poštni predali
00050000-5565-d14c-39fa-0e0b8329123c	2206	Marjeta na Dravskem polju
00050000-5565-d14c-fcd6-a3cd244277bd	2281	Markovci
00050000-5565-d14c-525b-73e0e1b7ed73	9221	Martjanci
00050000-5565-d14c-1ef4-fcc63bce3751	6242	Materija
00050000-5565-d14c-de86-1d1aaa95e530	4211	Mavčiče
00050000-5565-d14c-3892-8308f4e44e8e	1215	Medvode
00050000-5565-d14c-b85c-3722bb5e6817	1234	Mengeš
00050000-5565-d14c-2f76-fc270e724eca	8330	Metlika
00050000-5565-d14c-26a7-aeb1de51b366	2392	Mežica
00050000-5565-d14c-cd78-96080178dc03	2204	Miklavž na Dravskem polju
00050000-5565-d14c-9fd3-04e86d794337	2275	Miklavž pri Ormožu
00050000-5565-d14c-95e1-3b5e73183c79	5291	Miren
00050000-5565-d14c-1ea7-5c5a393121be	8233	Mirna
00050000-5565-d14c-45ab-a042f93de478	8216	Mirna Peč
00050000-5565-d14c-3012-d4ff0d416392	2382	Mislinja
00050000-5565-d14c-a277-2df11d8c51ac	4281	Mojstrana
00050000-5565-d14c-2f0f-cf46f2658a6b	8230	Mokronog
00050000-5565-d14c-2b0d-ba139d5367aa	1251	Moravče
00050000-5565-d14c-efd6-87fddc82281e	9226	Moravske Toplice
00050000-5565-d14c-6591-8102ce3178f2	5216	Most na Soči
00050000-5565-d14c-a97d-e67265395eff	1221	Motnik
00050000-5565-d14c-e717-3df5b9234c64	3330	Mozirje
00050000-5565-d14c-33fb-15bf27ea48f3	9000	Murska Sobota 
00050000-5565-d14c-7a6f-78151882978d	9001	Murska Sobota - poštni predali
00050000-5565-d14c-4033-7558c8693401	2366	Muta
00050000-5565-d14c-985f-28c4927fc8ef	4202	Naklo
00050000-5565-d14c-5e73-b2c55eccceaa	3331	Nazarje
00050000-5565-d14c-021a-8946c75117c4	1357	Notranje Gorice
00050000-5565-d14c-df53-381f7f3d1fbe	3203	Nova Cerkev
00050000-5565-d14c-22ca-f83661e2f3ef	5000	Nova Gorica 
00050000-5565-d14c-78e1-1d1d736769aa	5001	Nova Gorica - poštni predali
00050000-5565-d14c-89d5-5a9d54576a2f	1385	Nova vas
00050000-5565-d14c-0cf6-fb1b8710331a	8000	Novo mesto
00050000-5565-d14c-2755-595f7266be5d	8001	Novo mesto - poštni predali
00050000-5565-d14c-ec26-a0c308e43dfe	6243	Obrov
00050000-5565-d14c-d8d2-299208d916b4	9233	Odranci
00050000-5565-d14c-4bb2-48967de0a6df	2317	Oplotnica
00050000-5565-d14c-b6e4-f00a7e0ed5c9	2312	Orehova vas
00050000-5565-d14c-ef58-1c6762552446	2270	Ormož
00050000-5565-d14c-d9c8-ae7ac2f390c2	1316	Ortnek
00050000-5565-d14c-67cc-f4c17cf09a86	1337	Osilnica
00050000-5565-d14c-ffe6-59b173e7aaa1	8222	Otočec
00050000-5565-d14c-bc50-4eb727fb4a52	2361	Ožbalt
00050000-5565-d14c-505c-34ec20957837	2231	Pernica
00050000-5565-d14c-4126-e33ef8696758	2211	Pesnica pri Mariboru
00050000-5565-d14c-2936-ff17c75bdcd1	9203	Petrovci
00050000-5565-d14c-5885-bf5e09ca1eed	3301	Petrovče
00050000-5565-d14c-f3bc-28a795c68c6a	6330	Piran/Pirano
00050000-5565-d14c-8b3c-069714643c60	8255	Pišece
00050000-5565-d14c-d53f-16aabf393082	6257	Pivka
00050000-5565-d14c-e408-fcffc0bf154b	6232	Planina
00050000-5565-d14c-e409-c7728cfdd042	3225	Planina pri Sevnici
00050000-5565-d14c-cefe-26253aa663d2	6276	Pobegi
00050000-5565-d14c-2376-b1da22b52147	8312	Podbočje
00050000-5565-d14c-5ca0-c9181e5739b0	5243	Podbrdo
00050000-5565-d14c-1580-4b21758b0680	3254	Podčetrtek
00050000-5565-d14c-52b5-33d52b131c5f	2273	Podgorci
00050000-5565-d14c-5cd0-1c69bcf8d066	6216	Podgorje
00050000-5565-d14c-d2c7-be63e8a5d4be	2381	Podgorje pri Slovenj Gradcu
00050000-5565-d14c-19ef-c079394e4571	6244	Podgrad
00050000-5565-d14c-55b6-04ac4aace71b	1414	Podkum
00050000-5565-d14c-9792-dc5c13a346a5	2286	Podlehnik
00050000-5565-d14c-514f-f402eda60444	5272	Podnanos
00050000-5565-d14c-f4a5-5b9de298c30d	4244	Podnart
00050000-5565-d14c-2d68-d70c0d5a39b5	3241	Podplat
00050000-5565-d14c-3ef4-57532cb4b512	3257	Podsreda
00050000-5565-d14c-24ac-deaf9f1499ea	2363	Podvelka
00050000-5565-d14c-bd12-0eba513cc0a4	2208	Pohorje
00050000-5565-d14c-d2aa-66aed5b27b7c	2257	Polenšak
00050000-5565-d14c-5aa9-c42e24d60e8b	1355	Polhov Gradec
00050000-5565-d14c-1ef2-fda81ebe3b2a	4223	Poljane nad Škofjo Loko
00050000-5565-d14c-2584-bb3ff5bf72b7	2319	Poljčane
00050000-5565-d14c-8f4f-e7d45cc4f317	1272	Polšnik
00050000-5565-d14c-f6a2-a21166029527	3313	Polzela
00050000-5565-d14c-0e09-b2e67d9653cd	3232	Ponikva
00050000-5565-d14c-8abb-b2df8c14eab2	6320	Portorož/Portorose
00050000-5565-d14c-3f54-0f6ef016b453	6230	Postojna
00050000-5565-d14c-1a50-7024ca952a9e	2331	Pragersko
00050000-5565-d14c-4e4b-3555348953db	3312	Prebold
00050000-5565-d14c-6d8d-fec0da3ddd1d	4205	Preddvor
00050000-5565-d14c-734c-4009bfe0bbd3	6255	Prem
00050000-5565-d14c-0d3f-4e961ffa9620	1352	Preserje
00050000-5565-d14c-b357-4684d5a323f0	6258	Prestranek
00050000-5565-d14c-2e25-717947164f46	2391	Prevalje
00050000-5565-d14c-546e-f41b7aa52f8c	3262	Prevorje
00050000-5565-d14c-db2f-8bc7c43ae4b0	1276	Primskovo 
00050000-5565-d14c-4149-43740d03af32	3253	Pristava pri Mestinju
00050000-5565-d14c-ff94-46c82a6e9504	9207	Prosenjakovci/Partosfalva
00050000-5565-d14c-58ec-92e9e06323be	5297	Prvačina
00050000-5565-d14c-8265-dd83175dbfca	2250	Ptuj
00050000-5565-d14c-d9fe-72ea6d2289a1	2323	Ptujska Gora
00050000-5565-d14c-f54d-798e3f3f10c8	9201	Puconci
00050000-5565-d14c-037c-dea0bbb91c2a	2327	Rače
00050000-5565-d14c-6df3-45df8c90fe2b	1433	Radeče
00050000-5565-d14c-06b3-4df2f3a3149e	9252	Radenci
00050000-5565-d14c-1877-998528a3480e	2360	Radlje ob Dravi
00050000-5565-d14c-e402-f0cb51066873	1235	Radomlje
00050000-5565-d14c-cc3e-4c89fa4d4f69	4240	Radovljica
00050000-5565-d14c-5189-c74206a5f49d	8274	Raka
00050000-5565-d14c-2c57-f5199840e2c1	1381	Rakek
00050000-5565-d14c-0c6a-3c3d14657e29	4283	Rateče - Planica
00050000-5565-d14c-4b6a-da625ebc74d6	2390	Ravne na Koroškem
00050000-5565-d14c-b57c-885b149e356a	9246	Razkrižje
00050000-5565-d14c-ed87-bdedf1b7e6e7	3332	Rečica ob Savinji
00050000-5565-d14c-0c41-4d1397269879	5292	Renče
00050000-5565-d14c-88f2-2b44a9723368	1310	Ribnica
00050000-5565-d14c-3098-157250a7f854	2364	Ribnica na Pohorju
00050000-5565-d14c-2e9f-9a013ddd7b38	3272	Rimske Toplice
00050000-5565-d14c-d033-754ea34529d0	1314	Rob
00050000-5565-d14c-7315-87596746701f	5215	Ročinj
00050000-5565-d14c-0532-6f5204b1d8fe	3250	Rogaška Slatina
00050000-5565-d14c-4dd3-4240df55fd77	9262	Rogašovci
00050000-5565-d14c-a427-f08c445b32cc	3252	Rogatec
00050000-5565-d14c-6a49-0a71c9808b0e	1373	Rovte
00050000-5565-d14c-b707-ae59ee4e0451	2342	Ruše
00050000-5565-d14c-2ef7-0efdc9ad90fb	1282	Sava
00050000-5565-d14c-4180-f42d5b7bc70a	6333	Sečovlje/Sicciole
00050000-5565-d14c-0949-e6f832319c70	4227	Selca
00050000-5565-d14c-38b7-c81841dbe0eb	2352	Selnica ob Dravi
00050000-5565-d14c-b16d-58e9c82a1cb4	8333	Semič
00050000-5565-d14c-7784-a064264ac59d	8281	Senovo
00050000-5565-d14c-580d-91ffe04801c8	6224	Senožeče
00050000-5565-d14c-6952-6f3015de4819	8290	Sevnica
00050000-5565-d14c-e0d3-eaf3cbf11674	6210	Sežana
00050000-5565-d14c-7e7f-493a95c2d4b0	2214	Sladki Vrh
00050000-5565-d14c-57b3-1edea6789fd1	5283	Slap ob Idrijci
00050000-5565-d14c-6dee-2956f82cc82e	2380	Slovenj Gradec
00050000-5565-d14c-3393-e4d1876b56cd	2310	Slovenska Bistrica
00050000-5565-d14c-0954-f40bc177adb8	3210	Slovenske Konjice
00050000-5565-d14c-2a51-36966f4c36bb	1216	Smlednik
00050000-5565-d14c-4653-3b973fe2be4c	5232	Soča
00050000-5565-d14c-db46-153d198bf87f	1317	Sodražica
00050000-5565-d14c-6554-14252fd3e346	3335	Solčava
00050000-5565-d14c-f1d0-a1652f6cfcf6	5250	Solkan
00050000-5565-d14c-b31e-cfe412b28704	4229	Sorica
00050000-5565-d14c-8812-dbaa9cff0b42	4225	Sovodenj
00050000-5565-d14c-56b9-19b79d7a9080	5281	Spodnja Idrija
00050000-5565-d14c-cef3-ceab11513fe2	2241	Spodnji Duplek
00050000-5565-d14c-2169-01d664959ba9	9245	Spodnji Ivanjci
00050000-5565-d14c-5078-ff53fd5d4159	2277	Središče ob Dravi
00050000-5565-d14c-3b3e-9a31c3bcaa9a	4267	Srednja vas v Bohinju
00050000-5565-d14c-2219-2c9e007e73e7	8256	Sromlje 
00050000-5565-d14c-6c48-9d7baf00f419	5224	Srpenica
00050000-5565-d14c-41e7-d10c0f504b45	1242	Stahovica
00050000-5565-d14c-1f35-b3d1c239eedf	1332	Stara Cerkev
00050000-5565-d14c-2b19-96149ef36506	8342	Stari trg ob Kolpi
00050000-5565-d14c-d4ad-5c28bcfe396e	1386	Stari trg pri Ložu
00050000-5565-d14c-83a8-1de6399727ab	2205	Starše
00050000-5565-d14c-5a57-7b1aca196d5d	2289	Stoperce
00050000-5565-d14c-4897-13cb7bdebaf2	8322	Stopiče
00050000-5565-d14c-567e-6c3b2862d669	3206	Stranice
00050000-5565-d14c-3c74-3d738b2f668f	8351	Straža
00050000-5565-d14c-b1ad-7830a56baa57	1313	Struge
00050000-5565-d14c-c2a0-e1ee8bfb8bf1	8293	Studenec
00050000-5565-d14c-86d1-0da650ed6bde	8331	Suhor
00050000-5565-d14c-fc7d-0ad7c273e13b	2233	Sv. Ana v Slovenskih goricah
00050000-5565-d14c-cdcc-2405ef21bdb0	2235	Sv. Trojica v Slovenskih goricah
00050000-5565-d14c-72a8-c16fdae23c35	2353	Sveti Duh na Ostrem Vrhu
00050000-5565-d14c-ad03-b1d5c733c866	9244	Sveti Jurij ob Ščavnici
00050000-5565-d14c-ab0a-b91bba8dbfda	3264	Sveti Štefan
00050000-5565-d14c-efbf-bba628752073	2258	Sveti Tomaž
00050000-5565-d14c-b744-b83bbd1d4c42	9204	Šalovci
00050000-5565-d14c-3328-9395aff3d23e	5261	Šempas
00050000-5565-d14c-2a91-df6b5accfe52	5290	Šempeter pri Gorici
00050000-5565-d14c-891f-691342bc4aeb	3311	Šempeter v Savinjski dolini
00050000-5565-d14c-ac4d-5f5058bc5e3c	4208	Šenčur
00050000-5565-d14c-c5ec-f488d61da238	2212	Šentilj v Slovenskih goricah
00050000-5565-d14c-a3a1-9c955dad1212	8297	Šentjanž
00050000-5565-d14c-cc5a-06043b99e755	2373	Šentjanž pri Dravogradu
00050000-5565-d14c-2a92-9c5778bada15	8310	Šentjernej
00050000-5565-d14c-03a9-09fee5ff09b3	3230	Šentjur
00050000-5565-d14c-fe07-f9ef711a2541	3271	Šentrupert
00050000-5565-d14c-7e8c-15ec74e80ae0	8232	Šentrupert
00050000-5565-d14c-3bea-3ac118dbfc7d	1296	Šentvid pri Stični
00050000-5565-d14c-4d5b-a6a44f944e17	8275	Škocjan
00050000-5565-d14c-ed67-6eeddc5d2ae2	6281	Škofije
00050000-5565-d14c-9c04-d143b7220180	4220	Škofja Loka
00050000-5565-d14c-be3d-939f5578b3e4	3211	Škofja vas
00050000-5565-d14c-2bc2-d08643ecb68f	1291	Škofljica
00050000-5565-d14c-662f-cbcb8920904b	6274	Šmarje
00050000-5565-d14c-36b1-a1745ffe1c73	1293	Šmarje - Sap
00050000-5565-d14c-2455-7ccc1cc4bddd	3240	Šmarje pri Jelšah
00050000-5565-d14c-ccd7-0fd4d44d0c19	8220	Šmarješke Toplice
00050000-5565-d14c-696d-1842fe345f3d	2315	Šmartno na Pohorju
00050000-5565-d14c-0fb2-d6c3c859ea7d	3341	Šmartno ob Dreti
00050000-5565-d14c-a4a6-2615f45c274c	3327	Šmartno ob Paki
00050000-5565-d14c-cbf1-1302de75e00d	1275	Šmartno pri Litiji
00050000-5565-d14c-b66b-2afec1b3c37c	2383	Šmartno pri Slovenj Gradcu
00050000-5565-d14c-edbf-320f5c24929d	3201	Šmartno v Rožni dolini
00050000-5565-d14c-d039-abf6ca7b83bd	3325	Šoštanj
00050000-5565-d14c-3e38-b5682180b248	6222	Štanjel
00050000-5565-d14c-a09b-c982a526afbf	3220	Štore
00050000-5565-d14c-5f53-fcc989ed35d6	3304	Tabor
00050000-5565-d14c-1363-44cbbdec4128	3221	Teharje
00050000-5565-d14c-e88c-438359e47a0e	9251	Tišina
00050000-5565-d14c-a9cd-584942b2f48b	5220	Tolmin
00050000-5565-d14c-50ae-59d98e1a3230	3326	Topolšica
00050000-5565-d14c-6c8b-73411a0440fe	2371	Trbonje
00050000-5565-d14c-6a93-357b293c198d	1420	Trbovlje
00050000-5565-d14c-0935-93554214d83c	8231	Trebelno 
00050000-5565-d14c-0295-20be60ea47c3	8210	Trebnje
00050000-5565-d14c-44c6-4158839cbe6e	5252	Trnovo pri Gorici
00050000-5565-d14c-98fc-6f86f5a6c0ec	2254	Trnovska vas
00050000-5565-d14c-a05f-55be4178579f	1222	Trojane
00050000-5565-d14c-274c-4c5854fe0c32	1236	Trzin
00050000-5565-d14c-637a-99bc03bdbb0e	4290	Tržič
00050000-5565-d14c-b9e4-0041cf30ad9c	8295	Tržišče
00050000-5565-d14c-0a5e-4d645475752f	1311	Turjak
00050000-5565-d14c-dcaa-b87137b3fce6	9224	Turnišče
00050000-5565-d14c-c72f-6237ad8d3424	8323	Uršna sela
00050000-5565-d14c-96b9-2c9a64012d9e	1252	Vače
00050000-5565-d14c-6b6d-7fd6732c9527	3320	Velenje 
00050000-5565-d14c-45e6-9ed52a26150a	3322	Velenje - poštni predali
00050000-5565-d14c-722f-746ff7f1a3c5	8212	Velika Loka
00050000-5565-d14c-accb-fd7f43505cb0	2274	Velika Nedelja
00050000-5565-d14c-bf22-0672e5c017ce	9225	Velika Polana
00050000-5565-d14c-97e7-7ab2a9ffa453	1315	Velike Lašče
00050000-5565-d14c-7766-b126f35811ad	8213	Veliki Gaber
00050000-5565-d14c-98dd-b5f594a11f26	9241	Veržej
00050000-5565-d14c-db28-3bdb45573f5c	1312	Videm - Dobrepolje
00050000-5565-d14c-f044-dc45ba8f6246	2284	Videm pri Ptuju
00050000-5565-d14c-6d8f-4d2a1aad878a	8344	Vinica
00050000-5565-d14c-1b7a-9a1c4fdfaa4f	5271	Vipava
00050000-5565-d14c-e5d0-c1b6d0ec459f	4212	Visoko
00050000-5565-d14c-9563-8c780c83ef1b	1294	Višnja Gora
00050000-5565-d14c-b9b5-e2ad7456a68b	3205	Vitanje
00050000-5565-d14c-70ef-cb62e9d998d2	2255	Vitomarci
00050000-5565-d14c-411a-c395216916d9	1217	Vodice
00050000-5565-d14c-7707-ab2a6d4f8162	3212	Vojnik\t
00050000-5565-d14c-4c54-a08ba4bbe8bb	5293	Volčja Draga
00050000-5565-d14c-8e05-ee673c3f152f	2232	Voličina
00050000-5565-d14c-c2c8-c518c5b51ab3	3305	Vransko
00050000-5565-d14c-a2f0-f11cc56b5cbb	6217	Vremski Britof
00050000-5565-d14c-9078-5674ad8a207e	1360	Vrhnika
00050000-5565-d14c-ce0c-d07cd567a8a1	2365	Vuhred
00050000-5565-d14c-c19f-dc37ba7e2c66	2367	Vuzenica
00050000-5565-d14c-db89-9c1b4adc25b8	8292	Zabukovje 
00050000-5565-d14c-9cab-1d8e65159c95	1410	Zagorje ob Savi
00050000-5565-d14c-19ed-841b2daca84c	1303	Zagradec
00050000-5565-d14c-ea35-8194a53d1936	2283	Zavrč
00050000-5565-d14c-0efe-6e1fe830ce62	8272	Zdole 
00050000-5565-d14c-7bad-d70130f62f72	4201	Zgornja Besnica
00050000-5565-d14c-62fe-a34a1839defe	2242	Zgornja Korena
00050000-5565-d14c-9db9-a2ca5b831d62	2201	Zgornja Kungota
00050000-5565-d14c-0144-398b737d6471	2316	Zgornja Ložnica
00050000-5565-d14c-0502-8584e44f6f2d	2314	Zgornja Polskava
00050000-5565-d14c-c028-480b9f265dd6	2213	Zgornja Velka
00050000-5565-d14c-3fe4-f8d7ace1a93f	4247	Zgornje Gorje
00050000-5565-d14c-cf9c-3b2dd87f90b4	4206	Zgornje Jezersko
00050000-5565-d14c-3a7a-79d311c85ade	2285	Zgornji Leskovec
00050000-5565-d14c-ea0b-0575e2f35cbf	1432	Zidani Most
00050000-5565-d14c-6c53-d6f569c9d1ee	3214	Zreče
00050000-5565-d14c-427b-d5ef8e0001bf	4209	Žabnica
00050000-5565-d14c-1f5f-1fc49d9f83cf	3310	Žalec
00050000-5565-d14c-7a70-e0fe3e6e87ae	4228	Železniki
00050000-5565-d14c-0f1c-e2e01916e115	2287	Žetale
00050000-5565-d14c-df8a-df17df3dddd5	4226	Žiri
00050000-5565-d14c-349d-7c7bbabf53a3	4274	Žirovnica
00050000-5565-d14c-1406-483114d08e74	8360	Žužemberk
\.


--
-- TOC entry 2721 (class 0 OID 5349675)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2689 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 5349490)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5349568)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5349687)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5349807)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5349858)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2727 (class 0 OID 5349716)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5565-d14d-00db-5512db4f5ad8	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5565-d14d-6ab9-1b1c5a6a53f7	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5565-d14d-dda7-2b5990717087	0003	Kazinska	t	84	Kazinska dvorana
00220000-5565-d14d-a4c4-85cb738d98de	0004	Mali oder	t	24	Mali oder 
00220000-5565-d14d-30ea-63db47f83f57	0005	Komorni oder	t	15	Komorni oder
00220000-5565-d14d-4645-4c1318795f75	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5565-d14d-e15b-08caba5b2ec7	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2719 (class 0 OID 5349660)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5349650)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5349847)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5349784)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2692 (class 0 OID 5349364)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5565-d14d-7b30-4c2cb1fd4810	00010000-5565-d14d-6216-7e15c9f15ac7	2015-05-27 16:14:38	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROyGrKLUE41hm4fx4y.KzIGWUFtB0JJr.";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2728 (class 0 OID 5349726)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5349402)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5565-d14d-3079-e9ade584603a	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5565-d14d-f4cd-3e7a2c931091	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5565-d14d-576b-5704562038a1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5565-d14d-9ead-278667fd94a2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5565-d14d-54c5-6c6370eacd54	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5565-d14d-7d62-db99720356a0	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2694 (class 0 OID 5349386)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5565-d14d-7b30-4c2cb1fd4810	00020000-5565-d14d-9ead-278667fd94a2
00010000-5565-d14d-6216-7e15c9f15ac7	00020000-5565-d14d-9ead-278667fd94a2
\.


--
-- TOC entry 2730 (class 0 OID 5349740)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 5349681)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5349631)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2748 (class 0 OID 5349955)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5565-d14c-1780-872ad58bfd24	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5565-d14c-04a0-7c972270c97f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5565-d14c-4575-903757e04800	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5565-d14c-6ffb-edb91d3696ea	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5565-d14c-7881-de8a228b17f2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2747 (class 0 OID 5349948)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5565-d14c-adf4-b8a264fa9864	00000000-5565-d14c-6ffb-edb91d3696ea	popa
00000000-5565-d14c-3921-c5369059aab1	00000000-5565-d14c-6ffb-edb91d3696ea	oseba
00000000-5565-d14c-d101-ea82c0c6464b	00000000-5565-d14c-04a0-7c972270c97f	prostor
00000000-5565-d14c-6609-d2610f0bf462	00000000-5565-d14c-6ffb-edb91d3696ea	besedilo
00000000-5565-d14c-7a4f-0c45ac377bdc	00000000-5565-d14c-6ffb-edb91d3696ea	uprizoritev
00000000-5565-d14c-9f3e-8436be36a142	00000000-5565-d14c-6ffb-edb91d3696ea	funkcija
00000000-5565-d14c-ba5c-3d52e669bb79	00000000-5565-d14c-6ffb-edb91d3696ea	tipfunkcije
00000000-5565-d14c-627d-0adc6d17f594	00000000-5565-d14c-6ffb-edb91d3696ea	alternacija
\.


--
-- TOC entry 2746 (class 0 OID 5349943)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5349794)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2701 (class 0 OID 5349462)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5349637)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5349836)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5565-d14c-35c8-ddb843894079	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5565-d14c-a8ef-c911c3012f6f	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5565-d14c-3b85-62cf242223ae	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5565-d14c-6996-6c54b3ea2893	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5565-d14c-2cb4-a5cababea1b1	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5565-d14c-37f1-20575d506dfa	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5565-d14c-a5a2-8332fe678c63	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5565-d14c-9a4c-de2f6557f297	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5565-d14c-c2d9-41e7cb12725d	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5565-d14c-1ec1-afb3aab0feb9	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5565-d14c-e674-42333a0f4b38	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5565-d14c-30ee-5d405031727c	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5565-d14c-5b81-0e5f2859f61d	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5565-d14c-526d-d1e43224b687	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5565-d14c-4415-a58f4f765b54	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
000f0000-5565-d14c-f726-88dc3d58a291	Nerazvrščeno	Nerazvrščeno	\N	Nerazvrščeno	\N
\.


--
-- TOC entry 2706 (class 0 OID 5349525)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5349373)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5565-d14d-6216-7e15c9f15ac7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROBB9VRW7NiVhQhc67G69i96qvN6swFoW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5565-d14d-995d-d0db65f49370	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROOM3y2byt1OoK60IY6svwt9HF7MBnlkO	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5565-d14d-f978-7a382af4bf8a	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROeXgZ7JrExbK13hAFtf3BkZkzc8twJYy	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5565-d14d-9dc9-ab8d229b8460	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROzWGptuH9FRHAO/IaUNJx30LxP3sV77S	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5565-d14d-8319-e03813b04737	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxROQGknUPBmnmCuYlzNizwY3nQtd3iCVmO	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5565-d14d-2805-b02a2496d6b0	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROPFKOLCDkv8QINs6m7nj8tmAWIHW3Jba	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5565-d14d-c4cf-f608fe7767e6	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROxgiegjv3ZMaOFD37gVwo5B5TNr6xBri	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5565-d14d-ea35-ae3890ba7592	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROcM.8tzl0GOjOEH7XxZchh9dJoNE.7e2	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5565-d14d-f7a6-5634f36c4482	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROtfgtzf9rygWF8ub0Awra.jzOzlahuMm	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5565-d14d-2779-671b1da5fe0a	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROa8ZOwIp70Gototf9AQpygruIWUGyWwO	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5565-d14d-2656-89b805d38079	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROqtymYkVMD4F8u4Q/MwZ8xqwdSTU6xEi	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5565-d14d-7b30-4c2cb1fd4810	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2743 (class 0 OID 5349891)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5565-d14d-0cca-5ab6d475bef4	00160000-5565-d14d-a18c-48f6d36fbddc	00150000-5565-d14c-cd83-0eabaee96f3b	00140000-5565-d14c-391c-e70b6fdf1f9f	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5565-d14d-30ea-63db47f83f57
000e0000-5565-d14d-f6f1-d87adb830d59	00160000-5565-d14d-6a18-fac3f13bd95d	00150000-5565-d14c-046d-92cb3fcbcacf	00140000-5565-d14c-99c0-27d9b0d8cc31	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5565-d14d-4645-4c1318795f75
\.


--
-- TOC entry 2711 (class 0 OID 5349583)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5349708)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2733 (class 0 OID 5349776)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 5349615)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5349881)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5565-d14c-391c-e70b6fdf1f9f	Drama	drama (SURS 01)
00140000-5565-d14c-6f7b-3c92c62e34e9	Opera	opera (SURS 02)
00140000-5565-d14c-b93f-d67542d03355	Balet	balet (SURS 03)
00140000-5565-d14c-cd75-36c6ba1e3488	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5565-d14c-6331-33d4624ab4c0	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5565-d14c-99c0-27d9b0d8cc31	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5565-d14c-da04-67f1aed16e5b	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2732 (class 0 OID 5349766)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5565-d14c-fe84-eacb6c3e20b3	Opera	opera
00150000-5565-d14c-c8b8-b4bea0ba17a1	Opereta	opereta
00150000-5565-d14c-0ab9-b57d92aadd93	Balet	balet
00150000-5565-d14c-a418-5c862882ac52	Plesne prireditve	plesne prireditve
00150000-5565-d14c-d6fb-381be9ceb125	Lutkovno gledališče	lutkovno gledališče
00150000-5565-d14c-9daa-ba8263cd1981	Raziskovalno gledališče	raziskovalno gledališče
00150000-5565-d14c-da29-eba4525e0b7c	Biografska drama	biografska drama
00150000-5565-d14c-cd83-0eabaee96f3b	Komedija	komedija
00150000-5565-d14c-e1ed-f8706022e15f	Črna komedija	črna komedija
00150000-5565-d14c-5655-b62f4a573f81	E-igra	E-igra
00150000-5565-d14c-046d-92cb3fcbcacf	Kriminalka	kriminalka
00150000-5565-d14c-afd5-85d27d0ef306	Musical	musical
\.


--
-- TOC entry 2313 (class 2606 OID 5349427)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 5349936)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5349926)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5349835)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 5349605)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 5349630)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 5349551)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 5349762)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 5349581)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5349624)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 5349565)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 5349673)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 5349700)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 5349523)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 5349436)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2319 (class 2606 OID 5349459)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 5349416)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2304 (class 2606 OID 5349401)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5349706)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 5349739)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 5349876)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 5349487)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 5349511)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 5349679)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 5349501)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 5349572)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 5349691)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 5349819)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5349863)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 5349723)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 5349664)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 5349655)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 5349857)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 5349791)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 5349372)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 5349730)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 5349390)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2306 (class 2606 OID 5349410)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 5349748)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 5349686)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 5349636)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 5349961)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 5349952)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 5349947)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 5349804)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 5349467)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 5349646)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5349846)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 5349536)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5349385)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 5349906)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 5349590)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 5349714)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 5349782)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 5349619)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 5349890)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 5349775)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 1259 OID 5349612)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2451 (class 1259 OID 5349805)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2452 (class 1259 OID 5349806)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2326 (class 1259 OID 5349489)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2286 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2288 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2417 (class 1259 OID 5349707)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2411 (class 1259 OID 5349693)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2412 (class 1259 OID 5349692)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2363 (class 1259 OID 5349591)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 5349765)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2440 (class 1259 OID 5349763)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5349764)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2351 (class 1259 OID 5349567)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2352 (class 1259 OID 5349566)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2468 (class 1259 OID 5349878)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 5349879)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 5349880)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2476 (class 1259 OID 5349911)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2477 (class 1259 OID 5349908)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2478 (class 1259 OID 5349910)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2479 (class 1259 OID 5349909)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2341 (class 1259 OID 5349538)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2342 (class 1259 OID 5349537)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 5349731)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2381 (class 1259 OID 5349625)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2308 (class 1259 OID 5349417)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2309 (class 1259 OID 5349418)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2432 (class 1259 OID 5349751)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2433 (class 1259 OID 5349750)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2434 (class 1259 OID 5349749)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2355 (class 1259 OID 5349573)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2356 (class 1259 OID 5349575)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2357 (class 1259 OID 5349574)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2497 (class 1259 OID 5349954)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2391 (class 1259 OID 5349659)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2392 (class 1259 OID 5349657)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2393 (class 1259 OID 5349656)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2394 (class 1259 OID 5349658)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2299 (class 1259 OID 5349391)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 5349392)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2420 (class 1259 OID 5349715)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2406 (class 1259 OID 5349680)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2447 (class 1259 OID 5349792)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2448 (class 1259 OID 5349793)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2330 (class 1259 OID 5349503)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2331 (class 1259 OID 5349502)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2332 (class 1259 OID 5349504)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2455 (class 1259 OID 5349820)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2456 (class 1259 OID 5349821)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2489 (class 1259 OID 5349940)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2490 (class 1259 OID 5349939)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2491 (class 1259 OID 5349942)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2492 (class 1259 OID 5349938)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2493 (class 1259 OID 5349941)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2444 (class 1259 OID 5349783)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2397 (class 1259 OID 5349668)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2398 (class 1259 OID 5349667)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2399 (class 1259 OID 5349665)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2400 (class 1259 OID 5349666)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2282 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2485 (class 1259 OID 5349928)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2486 (class 1259 OID 5349927)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2362 (class 1259 OID 5349582)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2314 (class 1259 OID 5349438)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2315 (class 1259 OID 5349437)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2322 (class 1259 OID 5349468)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2323 (class 1259 OID 5349469)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 5349649)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2387 (class 1259 OID 5349648)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2388 (class 1259 OID 5349647)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2369 (class 1259 OID 5349614)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2370 (class 1259 OID 5349610)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2371 (class 1259 OID 5349607)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2372 (class 1259 OID 5349608)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2373 (class 1259 OID 5349606)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2374 (class 1259 OID 5349611)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2375 (class 1259 OID 5349609)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2329 (class 1259 OID 5349488)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2347 (class 1259 OID 5349552)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2348 (class 1259 OID 5349554)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2349 (class 1259 OID 5349553)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2350 (class 1259 OID 5349555)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2405 (class 1259 OID 5349674)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 5349877)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 5349907)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2320 (class 1259 OID 5349460)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2321 (class 1259 OID 5349461)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 5349962)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2340 (class 1259 OID 5349524)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 5349953)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2425 (class 1259 OID 5349725)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2426 (class 1259 OID 5349724)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2494 (class 1259 OID 5349937)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2337 (class 1259 OID 5349512)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 5349864)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2307 (class 1259 OID 5349411)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2376 (class 1259 OID 5349613)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2528 (class 2606 OID 5350093)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2531 (class 2606 OID 5350078)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2530 (class 2606 OID 5350083)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2526 (class 2606 OID 5350103)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2532 (class 2606 OID 5350073)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2527 (class 2606 OID 5350098)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2529 (class 2606 OID 5350088)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2562 (class 2606 OID 5350248)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2561 (class 2606 OID 5350253)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 5350008)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2549 (class 2606 OID 5350188)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2547 (class 2606 OID 5350183)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2548 (class 2606 OID 5350178)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2525 (class 2606 OID 5350068)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2555 (class 2606 OID 5350228)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 5350218)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5350223)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2519 (class 2606 OID 5350043)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5350038)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2545 (class 2606 OID 5350168)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5350273)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2567 (class 2606 OID 5350278)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2566 (class 2606 OID 5350283)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2569 (class 2606 OID 5350303)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2572 (class 2606 OID 5350288)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2570 (class 2606 OID 5350298)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2571 (class 2606 OID 5350293)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2517 (class 2606 OID 5350033)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5350028)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5349993)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2551 (class 2606 OID 5350198)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2533 (class 2606 OID 5350108)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 5349973)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2506 (class 2606 OID 5349978)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2552 (class 2606 OID 5350213)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2553 (class 2606 OID 5350208)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2554 (class 2606 OID 5350203)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2523 (class 2606 OID 5350048)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2521 (class 2606 OID 5350058)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2522 (class 2606 OID 5350053)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2580 (class 2606 OID 5350343)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2537 (class 2606 OID 5350143)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2539 (class 2606 OID 5350133)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2540 (class 2606 OID 5350128)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2538 (class 2606 OID 5350138)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 5349963)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2504 (class 2606 OID 5349968)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2550 (class 2606 OID 5350193)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2546 (class 2606 OID 5350173)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2560 (class 2606 OID 5350238)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2559 (class 2606 OID 5350243)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 5350018)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 5350013)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5350023)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2564 (class 2606 OID 5350258)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5350263)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2577 (class 2606 OID 5350328)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2578 (class 2606 OID 5350323)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2575 (class 2606 OID 5350338)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2579 (class 2606 OID 5350318)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2576 (class 2606 OID 5350333)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2558 (class 2606 OID 5350233)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2541 (class 2606 OID 5350163)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2542 (class 2606 OID 5350158)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2544 (class 2606 OID 5350148)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2543 (class 2606 OID 5350153)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2573 (class 2606 OID 5350313)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2574 (class 2606 OID 5350308)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2524 (class 2606 OID 5350063)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 5350268)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 5349988)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 5349983)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2512 (class 2606 OID 5349998)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2511 (class 2606 OID 5350003)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2534 (class 2606 OID 5350123)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2535 (class 2606 OID 5350118)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2536 (class 2606 OID 5350113)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-27 16:14:38 CEST

--
-- PostgreSQL database dump complete
--

