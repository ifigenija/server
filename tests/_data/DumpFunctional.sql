--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-26 09:06:12 CEST

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
-- TOC entry 180 (class 1259 OID 4996794)
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
-- TOC entry 227 (class 1259 OID 4997304)
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
-- TOC entry 226 (class 1259 OID 4997287)
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
-- TOC entry 219 (class 1259 OID 4997198)
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
-- TOC entry 194 (class 1259 OID 4996968)
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
-- TOC entry 197 (class 1259 OID 4997002)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4996915)
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
-- TOC entry 213 (class 1259 OID 4997128)
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
-- TOC entry 192 (class 1259 OID 4996952)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 4996996)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 4996932)
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
-- TOC entry 202 (class 1259 OID 4997045)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 4997070)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4996889)
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
-- TOC entry 181 (class 1259 OID 4996803)
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
-- TOC entry 182 (class 1259 OID 4996814)
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
-- TOC entry 177 (class 1259 OID 4996768)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4996787)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 4997077)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 4997108)
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
-- TOC entry 223 (class 1259 OID 4997241)
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
-- TOC entry 184 (class 1259 OID 4996846)
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
-- TOC entry 186 (class 1259 OID 4996881)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 4997051)
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
-- TOC entry 185 (class 1259 OID 4996866)
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
-- TOC entry 191 (class 1259 OID 4996944)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4997063)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 4997183)
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
-- TOC entry 222 (class 1259 OID 4997234)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 4997092)
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
-- TOC entry 201 (class 1259 OID 4997036)
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
-- TOC entry 200 (class 1259 OID 4997026)
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
-- TOC entry 221 (class 1259 OID 4997223)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4997160)
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
-- TOC entry 174 (class 1259 OID 4996739)
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
-- TOC entry 173 (class 1259 OID 4996737)
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
-- TOC entry 210 (class 1259 OID 4997102)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4996777)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 4996761)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 4997116)
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
-- TOC entry 204 (class 1259 OID 4997057)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4997007)
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
-- TOC entry 230 (class 1259 OID 4997329)
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
-- TOC entry 229 (class 1259 OID 4997322)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 4997317)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4997170)
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
-- TOC entry 231 (class 1259 OID 4997337)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 4996838)
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
-- TOC entry 199 (class 1259 OID 4997013)
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
-- TOC entry 220 (class 1259 OID 4997212)
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
-- TOC entry 188 (class 1259 OID 4996901)
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
-- TOC entry 175 (class 1259 OID 4996748)
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
-- TOC entry 225 (class 1259 OID 4997267)
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
-- TOC entry 193 (class 1259 OID 4996959)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 4997084)
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
-- TOC entry 215 (class 1259 OID 4997152)
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
-- TOC entry 195 (class 1259 OID 4996991)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 4997257)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 4997142)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 4996742)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 4996794)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 4997304)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 4997287)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 4997198)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 4996968)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 4997002)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 4996915)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5564-1b63-d547-94e0959d7222	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5564-1b63-3eba-bb3e0fd79157	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5564-1b63-a026-c424ab05fdfe	AL	ALB	008	Albania 	Albanija	\N
00040000-5564-1b63-55e2-f06e9e307fa2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5564-1b63-a833-68c3fe82368d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5564-1b63-a00b-7297bdd72fff	AD	AND	020	Andorra 	Andora	\N
00040000-5564-1b63-3653-445f626a9baf	AO	AGO	024	Angola 	Angola	\N
00040000-5564-1b63-a16f-109396557411	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5564-1b63-27e3-f9ea0f0491db	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5564-1b63-0339-8104e0bdec20	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-1b63-5928-5bdd1b9ff664	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5564-1b63-1570-e888f24a69c9	AM	ARM	051	Armenia 	Armenija	\N
00040000-5564-1b63-fd50-238359bf1e09	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5564-1b63-bf5e-077cbb8064d7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5564-1b63-8921-98b3b0378c38	AT	AUT	040	Austria 	Avstrija	\N
00040000-5564-1b63-2abf-55bea94b85b1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5564-1b63-fb95-4f7d262560b8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5564-1b63-5ca0-539419b02ece	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5564-1b63-f9bc-25fdef75c416	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5564-1b63-6510-6ae37109e924	BB	BRB	052	Barbados 	Barbados	\N
00040000-5564-1b63-09e0-1df7eaddaf99	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5564-1b63-5734-da1193ddc239	BE	BEL	056	Belgium 	Belgija	\N
00040000-5564-1b63-b2fc-fcd7d554b666	BZ	BLZ	084	Belize 	Belize	\N
00040000-5564-1b63-4a31-1965848f584b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5564-1b63-ac39-0c3fc316cd29	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5564-1b63-4b71-25921c8422ef	BT	BTN	064	Bhutan 	Butan	\N
00040000-5564-1b63-81c4-6c7f0597a043	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5564-1b63-4af7-f6d24d467087	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5564-1b63-97e1-7c638aa4d0b3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5564-1b63-fffe-3d7dbc06bcc5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5564-1b63-6c66-7a9bc63bf64e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5564-1b63-c055-181d0c41f388	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5564-1b63-f617-27ce3736a567	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5564-1b63-8f8c-5b633b06f552	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5564-1b63-00b1-9edd050dfd2a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5564-1b63-523a-605666ff45df	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5564-1b63-1ad5-6a83585b7024	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5564-1b63-28e6-1ee01105b458	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5564-1b63-94dc-7671e64c9e4f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5564-1b63-10e3-26380c16f067	CA	CAN	124	Canada 	Kanada	\N
00040000-5564-1b63-b1c8-5056e7ba87dd	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5564-1b63-786a-3736116bbfbe	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5564-1b63-cc32-f6e00c4772f2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5564-1b63-67ab-a8ad6859347b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5564-1b63-0a6a-89d8430e5657	CL	CHL	152	Chile 	Čile	\N
00040000-5564-1b63-dab8-e029fd7497c6	CN	CHN	156	China 	Kitajska	\N
00040000-5564-1b63-4592-ede6cafa3241	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5564-1b63-244b-5eaec9cc7a31	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5564-1b63-ac16-3923cf32d3d6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5564-1b63-4631-ed330931fd53	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5564-1b63-1231-a38f5573626f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5564-1b63-73ad-4d0f273646fe	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5564-1b63-1e7c-512c978f5912	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5564-1b63-428b-9165a693368b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5564-1b63-3ee3-b63d2fbd6261	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5564-1b63-e961-87006681192d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5564-1b63-d7bc-5fcc6427cd91	CU	CUB	192	Cuba 	Kuba	\N
00040000-5564-1b63-d968-02520a73e60c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5564-1b63-82f9-9d55b14b9f32	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5564-1b63-535d-8fe18e2489c4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5564-1b63-dae6-3c7f123451f0	DK	DNK	208	Denmark 	Danska	\N
00040000-5564-1b63-127c-a453caa783d1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5564-1b63-aff4-7d8980c2935c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-1b63-1a7c-50406d916bfb	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5564-1b63-f0bb-0a0575a0da0e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5564-1b63-ec67-3fc620a00a4d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5564-1b63-10c4-c169c5f894e5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5564-1b63-c6b6-a2feae1a8939	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5564-1b63-04ef-89f4cb0e45fc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5564-1b63-cf0c-13178eeb1fe9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5564-1b63-2d35-5e30edb6b8a6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5564-1b63-2ba0-0de8a9b31a1d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5564-1b63-9298-67a34a29c1ce	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5564-1b63-5272-3715aa7109c0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5564-1b63-55ce-a0822103e36d	FI	FIN	246	Finland 	Finska	\N
00040000-5564-1b63-a5fd-3072ce6bc273	FR	FRA	250	France 	Francija	\N
00040000-5564-1b63-c890-e1e0ea9b5a24	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5564-1b63-8d3d-7f07940e4e90	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5564-1b63-91f9-0eba06fc225e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5564-1b63-5cc7-2c8081072cc5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5564-1b63-29ed-f2c6cbd765ea	GA	GAB	266	Gabon 	Gabon	\N
00040000-5564-1b63-c4ad-89541f26c977	GM	GMB	270	Gambia 	Gambija	\N
00040000-5564-1b63-80c9-c1b0a5bc76fa	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5564-1b63-d727-38a532470afc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5564-1b63-ebe7-8fd9b0913590	GH	GHA	288	Ghana 	Gana	\N
00040000-5564-1b63-169e-22d4b1825551	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5564-1b63-3af6-b260c9b23536	GR	GRC	300	Greece 	Grčija	\N
00040000-5564-1b63-59de-af63bc101ac8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5564-1b63-5632-76041ee47f71	GD	GRD	308	Grenada 	Grenada	\N
00040000-5564-1b63-4b43-074243af1c7a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5564-1b63-bd46-f50fb1db7797	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5564-1b63-5976-f8127ef640b7	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5564-1b63-1da0-687856f0391c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5564-1b63-430c-cd1c79757704	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5564-1b63-1175-78fc7bccd93b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5564-1b63-8fe8-b43cd0cd1606	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5564-1b63-becf-9c868b983031	HT	HTI	332	Haiti 	Haiti	\N
00040000-5564-1b63-eb5d-89940693ebd3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5564-1b63-b75f-45c8d296e570	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5564-1b63-7bc6-9cf91df7db4e	HN	HND	340	Honduras 	Honduras	\N
00040000-5564-1b63-1ba9-f6b5267b7356	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5564-1b63-55ee-eb63cb15c174	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5564-1b63-1e83-22c8d7854a53	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5564-1b63-f7fc-667ff5a092e1	IN	IND	356	India 	Indija	\N
00040000-5564-1b63-1063-874d5c43ed82	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5564-1b63-795a-b4a80716f359	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5564-1b63-73ea-3a6f26f51b2a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5564-1b63-21fe-5e9fb7f10695	IE	IRL	372	Ireland 	Irska	\N
00040000-5564-1b63-7ee7-a77eb69efabc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5564-1b63-3765-0a3c22504067	IL	ISR	376	Israel 	Izrael	\N
00040000-5564-1b63-967c-1bdf71e60d36	IT	ITA	380	Italy 	Italija	\N
00040000-5564-1b63-cd0f-96bacd625ea1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5564-1b63-0656-306a6baf06db	JP	JPN	392	Japan 	Japonska	\N
00040000-5564-1b63-3300-d3cd80264aa6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5564-1b63-12d6-e349c33a343f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5564-1b63-9af8-3585bd343b3a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5564-1b63-a42a-6e616df6f902	KE	KEN	404	Kenya 	Kenija	\N
00040000-5564-1b63-b506-06edcca4b32b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5564-1b63-2c0a-0fb4f08f1193	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5564-1b63-9832-adc6067caff4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5564-1b63-c236-5f80dbe0c69f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5564-1b63-5d43-c5593fa65ac2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5564-1b63-604d-7ae210463280	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5564-1b63-f93e-0edffcba3869	LV	LVA	428	Latvia 	Latvija	\N
00040000-5564-1b63-12ff-3707a4e4dc8c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5564-1b63-97a2-f829e5b823f5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5564-1b63-0a02-a42bb375323b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5564-1b63-07b3-a32ea17aa8d8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5564-1b63-4239-6bcdec0daeec	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5564-1b63-b369-af087ef8cf20	LT	LTU	440	Lithuania 	Litva	\N
00040000-5564-1b63-0f9b-b73a1b160738	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5564-1b63-c0b3-43ed59b68c5d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5564-1b63-731e-6e43f3db3969	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5564-1b63-f735-1e9b2c5f4739	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5564-1b63-5a83-de4ea81cfbb7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5564-1b63-cd9f-e31e9e3e07af	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5564-1b63-036f-ba2018b6595e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5564-1b63-c3a4-4e12567e6fb4	ML	MLI	466	Mali 	Mali	\N
00040000-5564-1b63-f9df-e366affa1dba	MT	MLT	470	Malta 	Malta	\N
00040000-5564-1b63-5d3e-2c65ce5ca7da	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5564-1b63-2acc-6f4339a1e5e3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5564-1b63-65f9-717409ce8b78	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5564-1b63-fe4d-ba0b6bc1c109	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5564-1b63-c5b4-529a7bedc8f3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5564-1b63-96b8-01db1aec1505	MX	MEX	484	Mexico 	Mehika	\N
00040000-5564-1b63-184f-cbe8e2fb0bb9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5564-1b63-fdf7-2553cf71886c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5564-1b63-db86-4e35484183f1	MC	MCO	492	Monaco 	Monako	\N
00040000-5564-1b63-d054-6ff224a67f25	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5564-1b63-f950-42818c2b1f9e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5564-1b63-66a7-2a9a049b48db	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5564-1b63-d854-69cca87520d2	MA	MAR	504	Morocco 	Maroko	\N
00040000-5564-1b63-bfbf-be072d7418e6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5564-1b63-3365-2df66df84285	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5564-1b63-e48f-ab1f4edb7ce1	NA	NAM	516	Namibia 	Namibija	\N
00040000-5564-1b63-1603-2f1decbf05a4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5564-1b63-2f39-1a3dd4173e9e	NP	NPL	524	Nepal 	Nepal	\N
00040000-5564-1b63-9401-e0e6a1c2db21	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5564-1b63-cfbd-485a2cc947eb	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5564-1b63-ae80-c8ed92503068	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5564-1b63-39d5-4741a0b8bc5e	NE	NER	562	Niger 	Niger 	\N
00040000-5564-1b63-690a-026c586155df	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5564-1b63-6ddd-845f0a6d58b9	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5564-1b63-e0cf-f0ba9899c363	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5564-1b63-c6a7-6033624747d5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5564-1b63-edb2-b7d1eea630a9	NO	NOR	578	Norway 	Norveška	\N
00040000-5564-1b63-414d-a0fb4dd284df	OM	OMN	512	Oman 	Oman	\N
00040000-5564-1b63-590f-970af97a655b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5564-1b63-ffdb-9b5e8714b3ff	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5564-1b63-91d7-a7157cf8a1ff	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5564-1b63-2e15-d21c7182b517	PA	PAN	591	Panama 	Panama	\N
00040000-5564-1b63-db74-0ece1a415bcb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5564-1b63-da3d-374aa242e337	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5564-1b63-b9e5-f7b4446e913b	PE	PER	604	Peru 	Peru	\N
00040000-5564-1b63-bc47-573e71930d6f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5564-1b63-3164-07af9166f2c3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5564-1b63-17e0-7267c5358513	PL	POL	616	Poland 	Poljska	\N
00040000-5564-1b63-deb7-34f6a6bfd3d4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5564-1b63-6483-eec74ea85f57	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5564-1b63-6ee3-2b10e3ca46c3	QA	QAT	634	Qatar 	Katar	\N
00040000-5564-1b63-cde5-9dcce4d72ff8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5564-1b63-0eb6-47cb1aeaec78	RO	ROU	642	Romania 	Romunija	\N
00040000-5564-1b63-74fa-3c21c9a7c0cb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5564-1b63-8801-f65709df811f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5564-1b63-e1ff-0aea7fecf028	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5564-1b63-c070-6ccd0a55a796	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5564-1b63-61e3-73491c527ab9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5564-1b63-6a1b-9a959b6663ca	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5564-1b63-f038-aea89ef79565	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5564-1b63-9601-b2f5ee61f77e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5564-1b63-a281-e984800c881b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5564-1b63-7e1e-76315184e3c9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5564-1b63-7f0a-099a88320680	SM	SMR	674	San Marino 	San Marino	\N
00040000-5564-1b63-c550-f7581f665d5b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5564-1b63-f00b-6c3e25b8d0dd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5564-1b63-bf43-4257b5b1ba3d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5564-1b63-0332-1d2e3bdaf729	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5564-1b63-5b2f-805d0522883b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5564-1b63-d44b-a577c7792c4b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5564-1b63-f368-bf2c7be71eb5	SG	SGP	702	Singapore 	Singapur	\N
00040000-5564-1b63-8f9f-a821900f9628	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5564-1b63-6c22-94947028cdbd	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5564-1b63-b8c6-1e54965212ba	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5564-1b63-52d6-e61929344c03	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5564-1b63-5150-3b9c9ac2ccd0	SO	SOM	706	Somalia 	Somalija	\N
00040000-5564-1b63-09f7-f13fb0e683d7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5564-1b63-4aac-a624985540f3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5564-1b63-be28-b60ec37e66d5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5564-1b63-8c1a-0535624fd18c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5564-1b63-6b3d-d9321ec4df75	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5564-1b63-dc12-db4798d80318	SD	SDN	729	Sudan 	Sudan	\N
00040000-5564-1b63-581b-53038b9e192c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5564-1b63-74cd-6d959bf9649e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5564-1b63-9cd3-f1c0071f71c8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5564-1b63-742d-770c141838c4	SE	SWE	752	Sweden 	Švedska	\N
00040000-5564-1b63-24cb-a1b39c3139c6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5564-1b63-d221-de58e08ec366	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5564-1b63-09f2-e8e5140ab410	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5564-1b63-39af-56de8e3e711f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5564-1b63-7c28-60817c4fb149	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5564-1b63-f52f-70f7b89106b9	TH	THA	764	Thailand 	Tajska	\N
00040000-5564-1b63-b826-c3086968375a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5564-1b63-82fe-a7cb43f98148	TG	TGO	768	Togo 	Togo	\N
00040000-5564-1b63-5a35-5d25a30f70d8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5564-1b63-2abb-71fd6f49df98	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5564-1b63-60c1-d9beb6abae4d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5564-1b63-aa86-fb7adcd5daf7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5564-1b63-6473-b667404a2a76	TR	TUR	792	Turkey 	Turčija	\N
00040000-5564-1b63-21eb-f852a0a56481	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5564-1b63-eb16-73921f9bc328	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-1b63-57bc-81a6de15bc02	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5564-1b63-0d05-e66b4ecbf8b0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5564-1b63-6192-a328796ec9e7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5564-1b63-ad04-98757786ce89	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5564-1b63-c4b3-fdbc87f4e4e9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5564-1b63-9130-36a129a94684	US	USA	840	United States 	Združene države Amerike	\N
00040000-5564-1b63-65ae-5e227642f383	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5564-1b63-5f80-336eb5d94e5c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5564-1b63-d7d3-a16f02654fff	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5564-1b63-5e8b-1270da118cc5	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5564-1b63-9166-b1d4fbc4c2f4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5564-1b63-a83b-50653db85fec	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5564-1b63-538b-ce2430e7b379	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-1b63-86e4-477c1136e123	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5564-1b63-6737-dd5522938588	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5564-1b63-3bbd-733a15d79008	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5564-1b63-8561-d6be3ae9d587	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5564-1b63-17cc-72d63d2c0388	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5564-1b63-184a-5ddd33892dfc	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 4997128)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 4996952)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 4996996)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 4996932)
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
-- TOC entry 2722 (class 0 OID 4997045)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 4997070)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 4996889)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5564-1b63-6b9c-87d12e3c56e4	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5564-1b63-07ba-2001dd577aa5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5564-1b63-e43b-4b5142e7de07	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5564-1b63-5d24-c3b055011910	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5564-1b63-ef11-01d9c2bd4c48	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5564-1b63-8041-c30e732a18b0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5564-1b63-aab6-7d784da1501d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5564-1b63-dba6-65b8d252187b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5564-1b63-c922-e458dec744bf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5564-1b63-bfe0-8f0a55b21685	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5564-1b63-4aa9-f0ef8df69365	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5564-1b63-6661-76fc06fc7f82	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5564-1b63-dab1-e3878a3cd964	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-1b63-5add-cc1670ae72ac	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-1b63-de16-30dcd6182b87	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 4996803)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5564-1b63-22bc-f1e5932ba0a7	00000000-5564-1b63-ef11-01d9c2bd4c48	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5564-1b63-882f-de8a5276dee6	00000000-5564-1b63-ef11-01d9c2bd4c48	00010000-5564-1b63-6bb1-22202ff6f65e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5564-1b63-06ba-09cec73ad1e3	00000000-5564-1b63-8041-c30e732a18b0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 4996814)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5564-1b64-5d2a-ccdfdbf051ec	\N	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5564-1b64-578f-015bbc0bbefa	\N	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5564-1b64-f6c3-ad21abf49988	\N	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5564-1b64-9df1-88d2bb8c874e	\N	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5564-1b64-481d-dbc6ae134748	\N	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5564-1b64-1428-9d9824420eda	\N	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5564-1b64-a646-6f821b1ea353	\N	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5564-1b64-2c52-8abc11077f91	\N	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5564-1b64-fd4c-1c50e99ef4f3	\N	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5564-1b64-8db9-05c8e2635ae4	\N	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 4996768)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5564-1b63-ecbe-e22a52366b5b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5564-1b63-a0a1-10cfd1d00e59	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5564-1b63-4d29-fd5c3d268d3a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5564-1b63-50ad-ee10314d8b54	Abonma-read	Abonma - branje	f
00030000-5564-1b63-8861-924ed70b6572	Abonma-write	Abonma - spreminjanje	f
00030000-5564-1b63-b481-306808093cb5	Alternacija-read	Alternacija - branje	f
00030000-5564-1b63-4a74-e5f8fd8faea9	Alternacija-write	Alternacija - spreminjanje	f
00030000-5564-1b63-b8f6-7cc84b6bd0d2	Arhivalija-read	Arhivalija - branje	f
00030000-5564-1b63-e58f-c9d714b03662	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5564-1b63-da58-0b95e232548d	Besedilo-read	Besedilo - branje	f
00030000-5564-1b63-778e-f9ffa65c6e4b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5564-1b63-c2f1-f19ee870d25b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5564-1b63-d331-97131afcfd29	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5564-1b63-d51a-f3423e5f7b03	Dogodek-read	Dogodek - branje	f
00030000-5564-1b63-d4e9-864a4d0cf3cb	Dogodek-write	Dogodek - spreminjanje	f
00030000-5564-1b63-c186-089477bfe86f	Drzava-read	Drzava - branje	f
00030000-5564-1b63-3d60-45f7d3751624	Drzava-write	Drzava - spreminjanje	f
00030000-5564-1b63-6e49-2090d7911f6d	Funkcija-read	Funkcija - branje	f
00030000-5564-1b63-2a4f-27646d20e793	Funkcija-write	Funkcija - spreminjanje	f
00030000-5564-1b63-4505-7357f2a09b99	Gostovanje-read	Gostovanje - branje	f
00030000-5564-1b63-cdf4-710c31aca2a0	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5564-1b63-5061-117af70d9808	Gostujoca-read	Gostujoca - branje	f
00030000-5564-1b63-6374-c1e45c87d248	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5564-1b63-e709-997d64b6c6d2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5564-1b63-053e-9aec56013f46	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5564-1b63-151f-dc374a244b54	Kupec-read	Kupec - branje	f
00030000-5564-1b63-e09e-21b937e295ef	Kupec-write	Kupec - spreminjanje	f
00030000-5564-1b63-577f-fcd8c6f25a31	NacinPlacina-read	NacinPlacina - branje	f
00030000-5564-1b63-f9c5-94b980b18864	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5564-1b63-ed11-f23568aca5d8	Option-read	Option - branje	f
00030000-5564-1b63-2e58-cce533db587f	Option-write	Option - spreminjanje	f
00030000-5564-1b63-d8ba-2d86e9922562	OptionValue-read	OptionValue - branje	f
00030000-5564-1b63-13f8-9fec2e31fc18	OptionValue-write	OptionValue - spreminjanje	f
00030000-5564-1b63-e1e2-f7680d231738	Oseba-read	Oseba - branje	f
00030000-5564-1b63-43dc-ce89a23c73bc	Oseba-write	Oseba - spreminjanje	f
00030000-5564-1b63-2bf3-4c97ffbec848	Permission-read	Permission - branje	f
00030000-5564-1b63-7fb4-c4045ef4bed9	Permission-write	Permission - spreminjanje	f
00030000-5564-1b63-4269-ce3356f089d1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5564-1b63-5575-f7b85cb15e70	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5564-1b63-6bab-464db869c7dc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5564-1b63-4cad-8869434fd702	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5564-1b63-7dc5-2fd8076b6a2c	Pogodba-read	Pogodba - branje	f
00030000-5564-1b63-23d1-87203605a960	Pogodba-write	Pogodba - spreminjanje	f
00030000-5564-1b63-6324-71086cbdfcc7	Popa-read	Popa - branje	f
00030000-5564-1b63-3d89-81587a9c1c27	Popa-write	Popa - spreminjanje	f
00030000-5564-1b63-6305-a1a6222a92ca	Posta-read	Posta - branje	f
00030000-5564-1b63-5903-a41c8cbafc14	Posta-write	Posta - spreminjanje	f
00030000-5564-1b63-af25-64fc8b79bddd	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5564-1b63-d106-e85eacb2f593	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5564-1b63-ba9c-922ca3bbb637	PostniNaslov-read	PostniNaslov - branje	f
00030000-5564-1b63-c22a-135488752121	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5564-1b63-5653-5a2382b3ba56	Predstava-read	Predstava - branje	f
00030000-5564-1b63-0e5b-d889d4194b31	Predstava-write	Predstava - spreminjanje	f
00030000-5564-1b63-e372-7af36ba405ea	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5564-1b63-570b-45a522953c3b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5564-1b63-323c-145d6ea9436e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5564-1b63-f84e-63e171a8f01a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5564-1b63-e53b-ff52a05b1ada	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5564-1b63-c0a2-03cf70a60fe4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5564-1b63-40c6-cc75c46f7897	Prostor-read	Prostor - branje	f
00030000-5564-1b63-1a52-4ade7ea3bb14	Prostor-write	Prostor - spreminjanje	f
00030000-5564-1b63-3e62-ff34a5ed8e04	Racun-read	Racun - branje	f
00030000-5564-1b63-2d0f-5e3572efa8eb	Racun-write	Racun - spreminjanje	f
00030000-5564-1b63-5630-024f8a4df64a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5564-1b63-6455-f168539a50fe	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5564-1b63-05ba-4c465094e87c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5564-1b63-4645-2ea3100712dd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5564-1b63-43c0-1c3310e552a6	Rekvizit-read	Rekvizit - branje	f
00030000-5564-1b63-62f4-f0ef5587d181	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5564-1b63-6dde-604fe9eea59b	Revizija-read	Revizija - branje	f
00030000-5564-1b63-d10d-4f54d2475b03	Revizija-write	Revizija - spreminjanje	f
00030000-5564-1b63-68db-d1f51feae1ee	Rezervacija-read	Rezervacija - branje	f
00030000-5564-1b63-f605-0b13c08f5255	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5564-1b63-b6cf-bf21a8faa3f4	Role-read	Role - branje	f
00030000-5564-1b63-097d-36f93492b95b	Role-write	Role - spreminjanje	f
00030000-5564-1b63-474a-56f433166740	SedezniRed-read	SedezniRed - branje	f
00030000-5564-1b63-bd85-67a1424f0811	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5564-1b63-cccd-03df1ca12bf9	Sedez-read	Sedez - branje	f
00030000-5564-1b63-9ad6-887d96306a72	Sedez-write	Sedez - spreminjanje	f
00030000-5564-1b63-a2af-05c01d1469c3	Sezona-read	Sezona - branje	f
00030000-5564-1b63-2a70-220fa1127c69	Sezona-write	Sezona - spreminjanje	f
00030000-5564-1b63-8922-7875c9cb9e54	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5564-1b63-3b88-2eda34342907	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5564-1b63-ce6b-7fd44f467f19	Stevilcenje-read	Stevilcenje - branje	f
00030000-5564-1b63-bb80-332c2ee0518e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5564-1b63-8b99-3b93bc41cc51	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5564-1b63-b171-580dbbd08347	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5564-1b63-f92d-c7e726c1252f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5564-1b63-30c3-14a1f2648328	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5564-1b63-a31f-7e0baefdad40	Telefonska-read	Telefonska - branje	f
00030000-5564-1b63-7e95-ef1db840767c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5564-1b63-b990-04433e7092bf	TerminStoritve-read	TerminStoritve - branje	f
00030000-5564-1b63-f617-423e8d276539	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5564-1b63-05c8-d63f21ac1d05	TipFunkcije-read	TipFunkcije - branje	f
00030000-5564-1b63-4a75-023fbdb36903	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5564-1b63-4798-104e5b4d94ab	Trr-read	Trr - branje	f
00030000-5564-1b63-c282-fde8067ad041	Trr-write	Trr - spreminjanje	f
00030000-5564-1b63-8191-6978cba0a6d5	Uprizoritev-read	Uprizoritev - branje	f
00030000-5564-1b63-12d7-f43523942391	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5564-1b63-a5fb-0558cc1b9b12	User-read	User - branje	f
00030000-5564-1b63-e27a-143f74228665	User-write	User - spreminjanje	f
00030000-5564-1b63-a960-738a43d1eee5	Vaja-read	Vaja - branje	f
00030000-5564-1b63-1e89-2418b87c91ad	Vaja-write	Vaja - spreminjanje	f
00030000-5564-1b63-db44-65e72dbdb34a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5564-1b63-172d-7420c768e4e5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5564-1b63-0be7-0669fbabfdc6	Zaposlitev-read	Zaposlitev - branje	f
00030000-5564-1b63-80f1-0c7ce1cfe8cc	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5564-1b63-6a7e-3ee13a377242	Zasedenost-read	Zasedenost - branje	f
00030000-5564-1b63-09b7-c8be625a13df	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5564-1b63-e8c1-d823b21b6ded	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5564-1b63-4037-396edf2d6afe	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5564-1b63-579d-d0214c7fc810	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5564-1b63-e677-5671e451fd2c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 4996787)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5564-1b63-55ff-24c902f119f2	00030000-5564-1b63-c186-089477bfe86f
00020000-5564-1b63-8796-d802c526a486	00030000-5564-1b63-3d60-45f7d3751624
00020000-5564-1b63-8796-d802c526a486	00030000-5564-1b63-c186-089477bfe86f
\.


--
-- TOC entry 2727 (class 0 OID 4997077)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 4997108)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 4997241)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 4996846)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5564-1b63-f2b3-7ad8cf04f516	00040000-5564-1b63-d547-94e0959d7222	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5564-1b63-f3f9-eeaeb2f1661a	00040000-5564-1b63-d547-94e0959d7222	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 4996881)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5564-1b62-dbd1-213989464e44	8341	Adlešiči
00050000-5564-1b62-1e5f-93abc8870232	5270	Ajdovščina
00050000-5564-1b62-82f1-44d883435ae1	6280	Ankaran/Ancarano
00050000-5564-1b62-c051-d459f839dce2	9253	Apače
00050000-5564-1b62-bbe9-800b8e6d8f5c	8253	Artiče
00050000-5564-1b62-b742-2c45e697b6f6	4275	Begunje na Gorenjskem
00050000-5564-1b62-8d07-26deb6757191	1382	Begunje pri Cerknici
00050000-5564-1b62-c1b5-39d21433d171	9231	Beltinci
00050000-5564-1b62-cec1-6f9679e7a063	2234	Benedikt
00050000-5564-1b62-8320-7b64a8c26553	2345	Bistrica ob Dravi
00050000-5564-1b62-e481-25b3d44a49f1	3256	Bistrica ob Sotli
00050000-5564-1b62-d11d-af5c44bd2d75	8259	Bizeljsko
00050000-5564-1b62-b762-0b68db5c2667	1223	Blagovica
00050000-5564-1b62-485f-484830015830	8283	Blanca
00050000-5564-1b62-07b1-362afdd57db7	4260	Bled
00050000-5564-1b62-ef9b-938c57ec310d	4273	Blejska Dobrava
00050000-5564-1b62-bbc7-23b2c4d1cc89	9265	Bodonci
00050000-5564-1b62-ddf9-af64ffe3d42f	9222	Bogojina
00050000-5564-1b62-c615-f3ee6d0cde72	4263	Bohinjska Bela
00050000-5564-1b62-e537-e427395bc703	4264	Bohinjska Bistrica
00050000-5564-1b62-cbcd-de03c0ac5258	4265	Bohinjsko jezero
00050000-5564-1b62-62db-b28ac2c5f2f6	1353	Borovnica
00050000-5564-1b62-a9c2-45e50362835f	8294	Boštanj
00050000-5564-1b62-bd32-2d4cd11c28c2	5230	Bovec
00050000-5564-1b62-21f6-fcf0a0e05576	5295	Branik
00050000-5564-1b62-e930-f0eb0ccf4a23	3314	Braslovče
00050000-5564-1b62-cf91-120e0d97c381	5223	Breginj
00050000-5564-1b62-7a67-4b4b8df0e239	8280	Brestanica
00050000-5564-1b62-0cba-bb301b9f7fc1	2354	Bresternica
00050000-5564-1b62-dce4-a501511c1882	4243	Brezje
00050000-5564-1b62-2a32-228e42f5b184	1351	Brezovica pri Ljubljani
00050000-5564-1b62-a865-b164d7115271	8250	Brežice
00050000-5564-1b62-ecd1-6f4fac0386eb	4210	Brnik - Aerodrom
00050000-5564-1b62-355e-12463b155b97	8321	Brusnice
00050000-5564-1b62-8d84-42c6a76994c3	3255	Buče
00050000-5564-1b62-acf9-820f239cd989	8276	Bučka 
00050000-5564-1b62-4a7c-fcf246cf26cb	9261	Cankova
00050000-5564-1b62-6f04-622212d2a6e9	3000	Celje 
00050000-5564-1b62-f2cf-eb2e865e5155	3001	Celje - poštni predali
00050000-5564-1b62-6f7a-af65c3af1f7c	4207	Cerklje na Gorenjskem
00050000-5564-1b62-53b4-19cb438c96fb	8263	Cerklje ob Krki
00050000-5564-1b62-710f-f154d44c1851	1380	Cerknica
00050000-5564-1b62-8984-ddc3a6075f5f	5282	Cerkno
00050000-5564-1b62-fea3-7245da4acfc2	2236	Cerkvenjak
00050000-5564-1b62-b26d-513bfd0232e7	2215	Ceršak
00050000-5564-1b62-cad9-eef04c39972a	2326	Cirkovce
00050000-5564-1b62-3797-aacec4e90225	2282	Cirkulane
00050000-5564-1b62-16b8-dc2bd43af0c2	5273	Col
00050000-5564-1b62-cff9-e6d1ef15d934	8251	Čatež ob Savi
00050000-5564-1b62-dd82-a3f861c7635e	1413	Čemšenik
00050000-5564-1b62-6cd8-0955bea862cb	5253	Čepovan
00050000-5564-1b62-42b3-a0a7bbf02841	9232	Črenšovci
00050000-5564-1b62-2ff9-d34daebd9ac7	2393	Črna na Koroškem
00050000-5564-1b62-5d3a-62344d899362	6275	Črni Kal
00050000-5564-1b62-1fac-59c9007571a6	5274	Črni Vrh nad Idrijo
00050000-5564-1b62-8550-39116149cbf4	5262	Črniče
00050000-5564-1b62-40dc-262cd74006e3	8340	Črnomelj
00050000-5564-1b62-dc5d-60890a991995	6271	Dekani
00050000-5564-1b62-f7d0-19f1b9c7b992	5210	Deskle
00050000-5564-1b62-870e-fd4f7eb000ef	2253	Destrnik
00050000-5564-1b62-81bf-a3f738ca10eb	6215	Divača
00050000-5564-1b62-a5bf-3f4666e8b7a5	1233	Dob
00050000-5564-1b62-54b6-782a16a80e4c	3224	Dobje pri Planini
00050000-5564-1b62-6d27-c3727e03db00	8257	Dobova
00050000-5564-1b62-35e3-7117c9e9c320	1423	Dobovec
00050000-5564-1b62-f6be-e1d7e701e58a	5263	Dobravlje
00050000-5564-1b62-df96-925591da4165	3204	Dobrna
00050000-5564-1b62-6243-16cae8e02399	8211	Dobrnič
00050000-5564-1b62-9131-914d67c08090	1356	Dobrova
00050000-5564-1b62-9e8c-fd1e4375d31f	9223	Dobrovnik/Dobronak 
00050000-5564-1b62-7e9e-38af28f467ab	5212	Dobrovo v Brdih
00050000-5564-1b62-39e2-f87a6f4ec60b	1431	Dol pri Hrastniku
00050000-5564-1b62-b3d3-7aeb0caa277d	1262	Dol pri Ljubljani
00050000-5564-1b62-e107-6fbfdae81463	1273	Dole pri Litiji
00050000-5564-1b62-feb0-0a030d588a7e	1331	Dolenja vas
00050000-5564-1b62-a7c5-938cf7e86a78	8350	Dolenjske Toplice
00050000-5564-1b62-b0c4-7516545d4d79	1230	Domžale
00050000-5564-1b62-3e8b-5b687662a3c4	2252	Dornava
00050000-5564-1b62-2a6b-3cf1d4c11871	5294	Dornberk
00050000-5564-1b62-b9fe-48ec281ff54a	1319	Draga
00050000-5564-1b62-2aa1-f2876e0ee0c5	8343	Dragatuš
00050000-5564-1b62-913e-0fff096917c3	3222	Dramlje
00050000-5564-1b62-0508-1a77bc6af731	2370	Dravograd
00050000-5564-1b62-a5da-bf44d653d0a5	4203	Duplje
00050000-5564-1b62-8d56-79c9cc918465	6221	Dutovlje
00050000-5564-1b62-8cbb-ad1aee0ee906	8361	Dvor
00050000-5564-1b62-d2bc-9bd2c33ea7b5	2343	Fala
00050000-5564-1b62-0ca9-0a291a0fbaba	9208	Fokovci
00050000-5564-1b62-709b-18a22703f974	2313	Fram
00050000-5564-1b62-5ea0-749e9dacfbe4	3213	Frankolovo
00050000-5564-1b62-c485-9f0cb4404b2c	1274	Gabrovka
00050000-5564-1b62-cec0-d8825fe51007	8254	Globoko
00050000-5564-1b62-74d2-26218bf30976	5275	Godovič
00050000-5564-1b62-4247-3db3e6247513	4204	Golnik
00050000-5564-1b62-ae70-e708f40f4429	3303	Gomilsko
00050000-5564-1b62-fd94-6f378c41a433	4224	Gorenja vas
00050000-5564-1b62-cfdf-bd72a51c6c29	3263	Gorica pri Slivnici
00050000-5564-1b62-396f-b2695578bb18	2272	Gorišnica
00050000-5564-1b62-4701-0110e7e63e2b	9250	Gornja Radgona
00050000-5564-1b62-cb2e-60dad3d37cff	3342	Gornji Grad
00050000-5564-1b62-cc70-07f187bd6f60	4282	Gozd Martuljek
00050000-5564-1b62-c6af-333181758a7c	6272	Gračišče
00050000-5564-1b62-590e-26f19cc6e0f4	9264	Grad
00050000-5564-1b62-08d4-27dbd9b0d804	8332	Gradac
00050000-5564-1b62-9ef2-0584331e7dcd	1384	Grahovo
00050000-5564-1b62-fef2-38770cd39040	5242	Grahovo ob Bači
00050000-5564-1b62-f591-4787f39a8c57	5251	Grgar
00050000-5564-1b62-e5b5-b4cf2380d9bf	3302	Griže
00050000-5564-1b62-5ef5-b7c1003aeae1	3231	Grobelno
00050000-5564-1b62-e7a8-55cac361b31e	1290	Grosuplje
00050000-5564-1b62-46c6-2e8ec4eb213e	2288	Hajdina
00050000-5564-1b62-97ac-552ef8aa2041	8362	Hinje
00050000-5564-1b62-0ddb-c6e6541cfe00	2311	Hoče
00050000-5564-1b62-7b8a-915a19661fe8	9205	Hodoš/Hodos
00050000-5564-1b62-197b-b6e747fefd3c	1354	Horjul
00050000-5564-1b62-5619-604fa9460def	1372	Hotedršica
00050000-5564-1b62-dac9-92a3f587c256	1430	Hrastnik
00050000-5564-1b62-e713-02c3e2de84a7	6225	Hruševje
00050000-5564-1b62-616b-af3b5211597d	4276	Hrušica
00050000-5564-1b62-3c48-4f2ad11c8b5a	5280	Idrija
00050000-5564-1b62-0c28-9b09021b0bfa	1292	Ig
00050000-5564-1b62-eb6d-921bb1aef05f	6250	Ilirska Bistrica
00050000-5564-1b62-ac9e-49ede8372ad3	6251	Ilirska Bistrica-Trnovo
00050000-5564-1b62-e186-611954feb490	1295	Ivančna Gorica
00050000-5564-1b62-8861-563fedaffcbb	2259	Ivanjkovci
00050000-5564-1b62-9706-363efb03d1ef	1411	Izlake
00050000-5564-1b62-4e48-2bda6a1ea0fe	6310	Izola/Isola
00050000-5564-1b62-add6-34e930f12bd9	2222	Jakobski Dol
00050000-5564-1b62-f956-798ccb3d7f32	2221	Jarenina
00050000-5564-1b62-a2c7-16d6b9797f46	6254	Jelšane
00050000-5564-1b62-5839-dfebb44795c3	4270	Jesenice
00050000-5564-1b62-e5ba-e3b825e36e10	8261	Jesenice na Dolenjskem
00050000-5564-1b62-1d22-ccf628436037	3273	Jurklošter
00050000-5564-1b62-74a2-b57a2e2593b5	2223	Jurovski Dol
00050000-5564-1b62-b488-7649e40a4d2b	2256	Juršinci
00050000-5564-1b62-b21a-23dbb1adaf73	5214	Kal nad Kanalom
00050000-5564-1b62-cb6d-bb6e39d860a1	3233	Kalobje
00050000-5564-1b62-ea87-b25c813a769c	4246	Kamna Gorica
00050000-5564-1b62-f598-9c786f71a6aa	2351	Kamnica
00050000-5564-1b62-21f1-63b8bb1a39c9	1241	Kamnik
00050000-5564-1b62-f171-239e70746694	5213	Kanal
00050000-5564-1b62-8991-93cd41c1be81	8258	Kapele
00050000-5564-1b62-6817-20b1d3a4dc03	2362	Kapla
00050000-5564-1b62-30f4-fedeb9722e73	2325	Kidričevo
00050000-5564-1b62-df29-1da540f3f67c	1412	Kisovec
00050000-5564-1b62-e81f-1d09733845d5	6253	Knežak
00050000-5564-1b62-e6ec-1e765eabb22e	5222	Kobarid
00050000-5564-1b62-5c4f-3514cbebe018	9227	Kobilje
00050000-5564-1b62-1b2c-2569ede57f71	1330	Kočevje
00050000-5564-1b62-6bfe-fbe92eef7eb6	1338	Kočevska Reka
00050000-5564-1b62-c412-9292a4e6f20f	2276	Kog
00050000-5564-1b62-482c-d1204c36faac	5211	Kojsko
00050000-5564-1b62-b569-ec75a284f671	6223	Komen
00050000-5564-1b62-4088-f68803cb72dc	1218	Komenda
00050000-5564-1b62-e661-22019d28b6f9	6000	Koper/Capodistria 
00050000-5564-1b62-0ed5-008ce31017df	6001	Koper/Capodistria - poštni predali
00050000-5564-1b62-5ae3-d24daf6e117c	8282	Koprivnica
00050000-5564-1b62-ecec-05fc6cb827dc	5296	Kostanjevica na Krasu
00050000-5564-1b62-bb12-6605f69eca13	8311	Kostanjevica na Krki
00050000-5564-1b62-0b6f-9b25a97dcba7	1336	Kostel
00050000-5564-1b62-c7cb-1be2b237bb93	6256	Košana
00050000-5564-1b62-bd72-d10db25f9ec8	2394	Kotlje
00050000-5564-1b62-5e67-383c92fcc0c0	6240	Kozina
00050000-5564-1b62-af5f-81b4ac245dc5	3260	Kozje
00050000-5564-1b62-61ef-693c728f673a	4000	Kranj 
00050000-5564-1b62-ebb1-16e87cfa3397	4001	Kranj - poštni predali
00050000-5564-1b62-7b45-6074ea8b0806	4280	Kranjska Gora
00050000-5564-1b62-97fa-29a247c074ba	1281	Kresnice
00050000-5564-1b62-4d67-b6c5905e0036	4294	Križe
00050000-5564-1b62-f3f6-b49f5c77f17a	9206	Križevci
00050000-5564-1b62-fdb5-5862259a475b	9242	Križevci pri Ljutomeru
00050000-5564-1b62-c474-eb15875e95a6	1301	Krka
00050000-5564-1b62-8d94-92e46db2436e	8296	Krmelj
00050000-5564-1b62-03e0-c2321aa899c3	4245	Kropa
00050000-5564-1b62-d2f9-852688b88bac	8262	Krška vas
00050000-5564-1b62-185a-a5c480dafd41	8270	Krško
00050000-5564-1b62-2890-e31324e9fd8f	9263	Kuzma
00050000-5564-1b62-2112-f59130eab179	2318	Laporje
00050000-5564-1b62-02ec-b039e4ba4020	3270	Laško
00050000-5564-1b62-8913-3cd7e6adbbf0	1219	Laze v Tuhinju
00050000-5564-1b62-945d-f7d48313bcc9	2230	Lenart v Slovenskih goricah
00050000-5564-1b62-e964-0011be2a2524	9220	Lendava/Lendva
00050000-5564-1b62-b48e-872c4a2a6989	4248	Lesce
00050000-5564-1b62-8d74-36f68d7bf2cb	3261	Lesično
00050000-5564-1b62-32eb-ab2ef58fdb3b	8273	Leskovec pri Krškem
00050000-5564-1b62-ef0a-605424b63526	2372	Libeliče
00050000-5564-1b62-ded7-e84d9332f76a	2341	Limbuš
00050000-5564-1b62-7f24-77db9cd89b1e	1270	Litija
00050000-5564-1b62-206b-42145c94246e	3202	Ljubečna
00050000-5564-1b62-d172-efd3459b4982	1000	Ljubljana 
00050000-5564-1b62-a9cc-fba02a3a06d9	1001	Ljubljana - poštni predali
00050000-5564-1b62-9ad6-100e19c82624	1231	Ljubljana - Črnuče
00050000-5564-1b62-00d7-c2126e3b67bf	1261	Ljubljana - Dobrunje
00050000-5564-1b62-4c32-5db6410d78b6	1260	Ljubljana - Polje
00050000-5564-1b62-610d-1faba2e9c573	1210	Ljubljana - Šentvid
00050000-5564-1b62-d6e3-6174f1e9ec47	1211	Ljubljana - Šmartno
00050000-5564-1b62-40af-b7bf7dce5764	3333	Ljubno ob Savinji
00050000-5564-1b62-fe7f-d74e9be82125	9240	Ljutomer
00050000-5564-1b62-7cf2-a9da7b8a3e93	3215	Loče
00050000-5564-1b62-cf0c-1574ddd1ea04	5231	Log pod Mangartom
00050000-5564-1b62-5cfc-787e74038714	1358	Log pri Brezovici
00050000-5564-1b62-8a3e-ac1b3989e160	1370	Logatec
00050000-5564-1b62-7453-fad38c30c281	1371	Logatec
00050000-5564-1b62-de73-b1ed21b9bfdd	1434	Loka pri Zidanem Mostu
00050000-5564-1b62-9362-354d06607aa3	3223	Loka pri Žusmu
00050000-5564-1b62-06f9-6dc5fffbd1b1	6219	Lokev
00050000-5564-1b62-0af0-4d32962e9774	1318	Loški Potok
00050000-5564-1b62-18ed-29dc01df12b4	2324	Lovrenc na Dravskem polju
00050000-5564-1b62-c176-ff83d8b83d42	2344	Lovrenc na Pohorju
00050000-5564-1b62-ff6f-c2022c4157b6	3334	Luče
00050000-5564-1b62-dc82-6db81b9bae35	1225	Lukovica
00050000-5564-1b62-bcea-49b7ba24cce8	9202	Mačkovci
00050000-5564-1b62-75fd-c516786c2d3f	2322	Majšperk
00050000-5564-1b62-4abd-16af736e1a12	2321	Makole
00050000-5564-1b62-0b80-05c6f538c424	9243	Mala Nedelja
00050000-5564-1b62-b9e2-9d486a0a35b5	2229	Malečnik
00050000-5564-1b62-cc75-c973a724a196	6273	Marezige
00050000-5564-1b62-c6fe-13e2e65fb4b4	2000	Maribor 
00050000-5564-1b62-747b-0e02e5b38b52	2001	Maribor - poštni predali
00050000-5564-1b62-0000-d73b34a4f4bc	2206	Marjeta na Dravskem polju
00050000-5564-1b62-3d16-685742824cd8	2281	Markovci
00050000-5564-1b62-e18b-0ee68fa3a9a9	9221	Martjanci
00050000-5564-1b62-7b70-1c43ccfbc423	6242	Materija
00050000-5564-1b62-955b-a1695baff394	4211	Mavčiče
00050000-5564-1b62-885f-4c1c8e9764b9	1215	Medvode
00050000-5564-1b62-2847-5f1ede9ac582	1234	Mengeš
00050000-5564-1b62-9496-ee3563fe8333	8330	Metlika
00050000-5564-1b62-f774-cfc546d9ee7b	2392	Mežica
00050000-5564-1b62-ce1f-85aa8239a753	2204	Miklavž na Dravskem polju
00050000-5564-1b62-529a-ae709e4bf279	2275	Miklavž pri Ormožu
00050000-5564-1b62-ee75-b57848353599	5291	Miren
00050000-5564-1b62-ea55-b88db3541cfa	8233	Mirna
00050000-5564-1b62-29c8-88ad0fbbc77b	8216	Mirna Peč
00050000-5564-1b62-9471-0263cb2f8e86	2382	Mislinja
00050000-5564-1b62-f507-080a89616f6b	4281	Mojstrana
00050000-5564-1b62-8e18-3ff4e23c459d	8230	Mokronog
00050000-5564-1b62-70db-d09ba8dbc76a	1251	Moravče
00050000-5564-1b62-07ba-57f296107bf6	9226	Moravske Toplice
00050000-5564-1b62-784d-e084641699bc	5216	Most na Soči
00050000-5564-1b62-c027-52fb466b8a1d	1221	Motnik
00050000-5564-1b62-2d88-a7c636102b49	3330	Mozirje
00050000-5564-1b62-a48c-e1e6749e3fe3	9000	Murska Sobota 
00050000-5564-1b62-9b1d-1eec77d9f8bf	9001	Murska Sobota - poštni predali
00050000-5564-1b62-d101-a612db8b54b0	2366	Muta
00050000-5564-1b62-63a5-9f8342d8de8d	4202	Naklo
00050000-5564-1b62-9ea0-9da6c7232c4f	3331	Nazarje
00050000-5564-1b62-1e42-06841fb9730a	1357	Notranje Gorice
00050000-5564-1b62-f3e5-5665ab8aa233	3203	Nova Cerkev
00050000-5564-1b62-189e-2a5193e01727	5000	Nova Gorica 
00050000-5564-1b62-acd4-90a201c612fb	5001	Nova Gorica - poštni predali
00050000-5564-1b62-84f9-b903af2099df	1385	Nova vas
00050000-5564-1b62-3871-9be6b6cc2b0f	8000	Novo mesto
00050000-5564-1b62-3ee0-66a68df5b9d7	8001	Novo mesto - poštni predali
00050000-5564-1b62-6c5d-7ff17ec7792f	6243	Obrov
00050000-5564-1b62-cbce-0a0af61e8af1	9233	Odranci
00050000-5564-1b62-3d37-82a646bda727	2317	Oplotnica
00050000-5564-1b62-c3e5-33ee1e0b0a5c	2312	Orehova vas
00050000-5564-1b62-9502-63ec5a650973	2270	Ormož
00050000-5564-1b62-0c1e-ebeaca25f155	1316	Ortnek
00050000-5564-1b62-1c6d-4b36f6308743	1337	Osilnica
00050000-5564-1b62-2100-5c5d8719840c	8222	Otočec
00050000-5564-1b62-8e26-c434a53d6195	2361	Ožbalt
00050000-5564-1b62-ab50-cd26daf456d1	2231	Pernica
00050000-5564-1b62-3b4c-a8459ba184af	2211	Pesnica pri Mariboru
00050000-5564-1b62-eac1-105fa220face	9203	Petrovci
00050000-5564-1b62-7e0a-47042f7035fd	3301	Petrovče
00050000-5564-1b62-abfd-3e85ed80b16f	6330	Piran/Pirano
00050000-5564-1b62-c827-3bc43a46db60	8255	Pišece
00050000-5564-1b62-aa73-39e46ee71f9f	6257	Pivka
00050000-5564-1b62-5624-be4b62cb411a	6232	Planina
00050000-5564-1b62-57f1-e8abe767cecb	3225	Planina pri Sevnici
00050000-5564-1b62-4eac-c7ce80815a27	6276	Pobegi
00050000-5564-1b62-ee13-d9a3430d0fc5	8312	Podbočje
00050000-5564-1b62-f91c-a710dd5dfc0f	5243	Podbrdo
00050000-5564-1b62-afba-6f2019997a9e	3254	Podčetrtek
00050000-5564-1b62-3457-454863454ce3	2273	Podgorci
00050000-5564-1b62-9e2c-8290e33e0089	6216	Podgorje
00050000-5564-1b62-c3a5-1e002230af83	2381	Podgorje pri Slovenj Gradcu
00050000-5564-1b62-2fb6-ad9e7505f615	6244	Podgrad
00050000-5564-1b62-e01d-e23d2fe5a276	1414	Podkum
00050000-5564-1b62-cabb-9a60fe563bfa	2286	Podlehnik
00050000-5564-1b62-3900-e49bd4cfc94c	5272	Podnanos
00050000-5564-1b62-eb99-0c3f85a6f485	4244	Podnart
00050000-5564-1b62-8b5f-c0a1471b9575	3241	Podplat
00050000-5564-1b62-ec73-98034c2746e8	3257	Podsreda
00050000-5564-1b62-67cb-534cb66e7539	2363	Podvelka
00050000-5564-1b62-5ea8-ac807d1575b3	2208	Pohorje
00050000-5564-1b62-5322-2524c8db392d	2257	Polenšak
00050000-5564-1b62-5eea-a5c8e10b6a61	1355	Polhov Gradec
00050000-5564-1b62-f46c-b1db898e7f86	4223	Poljane nad Škofjo Loko
00050000-5564-1b62-6ad3-eb4886b25958	2319	Poljčane
00050000-5564-1b62-28d6-0652650af87f	1272	Polšnik
00050000-5564-1b62-ebe5-b95bb9205b57	3313	Polzela
00050000-5564-1b62-0fc2-1a6299f7453d	3232	Ponikva
00050000-5564-1b62-ee9f-f5b100ee7482	6320	Portorož/Portorose
00050000-5564-1b62-917f-ec55381f3375	6230	Postojna
00050000-5564-1b62-3202-63df01925dcb	2331	Pragersko
00050000-5564-1b62-97e9-03c884eaae88	3312	Prebold
00050000-5564-1b62-17dd-65e79274d962	4205	Preddvor
00050000-5564-1b62-6aec-0ca54fc8c35e	6255	Prem
00050000-5564-1b62-93b1-3ebe0bee95f3	1352	Preserje
00050000-5564-1b62-4967-2e5f460826fe	6258	Prestranek
00050000-5564-1b62-f6b6-52ab1ccb623e	2391	Prevalje
00050000-5564-1b62-976b-708da327ae71	3262	Prevorje
00050000-5564-1b62-b941-360849b619b7	1276	Primskovo 
00050000-5564-1b62-76d5-636e23f05493	3253	Pristava pri Mestinju
00050000-5564-1b62-4749-d0b562e1dd5f	9207	Prosenjakovci/Partosfalva
00050000-5564-1b62-43e5-4edcbc22e752	5297	Prvačina
00050000-5564-1b62-0e81-bb115bd064f1	2250	Ptuj
00050000-5564-1b62-2390-e6cfedfacb94	2323	Ptujska Gora
00050000-5564-1b62-d0ef-46a89bbb7317	9201	Puconci
00050000-5564-1b62-a4a7-a923064cf6d5	2327	Rače
00050000-5564-1b62-2cc2-f3e9e434a9c2	1433	Radeče
00050000-5564-1b62-6125-f215aa943ebc	9252	Radenci
00050000-5564-1b62-e8d1-671ff7626dba	2360	Radlje ob Dravi
00050000-5564-1b62-30cb-9024b3481bda	1235	Radomlje
00050000-5564-1b62-9402-f0a6115af1fd	4240	Radovljica
00050000-5564-1b62-2265-44fdb4a00b4d	8274	Raka
00050000-5564-1b62-fe25-2dd9aee6f70b	1381	Rakek
00050000-5564-1b62-316e-7b001b78c0f0	4283	Rateče - Planica
00050000-5564-1b62-3155-2d7509c9e137	2390	Ravne na Koroškem
00050000-5564-1b62-6361-65204b13e7ad	9246	Razkrižje
00050000-5564-1b62-e560-f270582d8572	3332	Rečica ob Savinji
00050000-5564-1b62-aa82-5b7e9e7d26a0	5292	Renče
00050000-5564-1b62-fdb6-a2f352b480a5	1310	Ribnica
00050000-5564-1b62-4af5-8badac23526a	2364	Ribnica na Pohorju
00050000-5564-1b62-f08e-2a683c4f09bf	3272	Rimske Toplice
00050000-5564-1b62-3fd1-27d5f60c9bc3	1314	Rob
00050000-5564-1b62-1634-db7a1e4a1cd0	5215	Ročinj
00050000-5564-1b62-408f-baa06b554231	3250	Rogaška Slatina
00050000-5564-1b62-7776-8beb36c8aa06	9262	Rogašovci
00050000-5564-1b62-1446-90bbb555b7b9	3252	Rogatec
00050000-5564-1b62-3d49-7c1578cb706e	1373	Rovte
00050000-5564-1b62-c4ab-4c9cbcef90ed	2342	Ruše
00050000-5564-1b62-378b-8877a57c93ab	1282	Sava
00050000-5564-1b62-5e44-aa1c2882ee7b	6333	Sečovlje/Sicciole
00050000-5564-1b62-b277-a32fd91fe037	4227	Selca
00050000-5564-1b62-a880-775c158f3d17	2352	Selnica ob Dravi
00050000-5564-1b62-9cb2-d39c6ab9f5e8	8333	Semič
00050000-5564-1b62-bff8-ab6b73f5f070	8281	Senovo
00050000-5564-1b62-3962-334c83974721	6224	Senožeče
00050000-5564-1b62-cfcc-21c032d574de	8290	Sevnica
00050000-5564-1b62-c199-8e16b64a915b	6210	Sežana
00050000-5564-1b62-5a0c-2c2524f771e2	2214	Sladki Vrh
00050000-5564-1b62-7a68-f633f5b28519	5283	Slap ob Idrijci
00050000-5564-1b62-6521-dbb8ac85f530	2380	Slovenj Gradec
00050000-5564-1b62-6211-1f0c3a9ed6a2	2310	Slovenska Bistrica
00050000-5564-1b62-f56f-8d2e59beb0a2	3210	Slovenske Konjice
00050000-5564-1b62-e2be-016b69c3127b	1216	Smlednik
00050000-5564-1b62-ff27-cab9b3264329	5232	Soča
00050000-5564-1b62-2c1d-a46b41af7857	1317	Sodražica
00050000-5564-1b62-5a2b-d168619e1ab7	3335	Solčava
00050000-5564-1b62-de80-da76c0192c5a	5250	Solkan
00050000-5564-1b62-e66a-9788c05bf1c7	4229	Sorica
00050000-5564-1b62-3951-b3571ea12011	4225	Sovodenj
00050000-5564-1b62-afa5-7a2714bcd90e	5281	Spodnja Idrija
00050000-5564-1b62-a3ad-8632516ccf5b	2241	Spodnji Duplek
00050000-5564-1b62-cd2b-c925d5bfe601	9245	Spodnji Ivanjci
00050000-5564-1b62-ceae-19eb29e7f6f9	2277	Središče ob Dravi
00050000-5564-1b62-e6a4-2d14409d1c05	4267	Srednja vas v Bohinju
00050000-5564-1b62-8b48-81c645cb39a3	8256	Sromlje 
00050000-5564-1b62-23ea-7b50d7f56ed1	5224	Srpenica
00050000-5564-1b62-d2b2-a4b927efb575	1242	Stahovica
00050000-5564-1b62-3f20-6065862f35d7	1332	Stara Cerkev
00050000-5564-1b62-6046-caf5d64411c8	8342	Stari trg ob Kolpi
00050000-5564-1b62-291e-07544f0a77ee	1386	Stari trg pri Ložu
00050000-5564-1b62-cdb0-367dc60e85dc	2205	Starše
00050000-5564-1b62-8a57-8c266f0fbc73	2289	Stoperce
00050000-5564-1b62-305d-7d164204479b	8322	Stopiče
00050000-5564-1b62-eb40-53ccbd0806a5	3206	Stranice
00050000-5564-1b62-9ff5-f1bc96e930fc	8351	Straža
00050000-5564-1b62-78d3-3812856e77ab	1313	Struge
00050000-5564-1b62-70a0-c8a1add6bf67	8293	Studenec
00050000-5564-1b62-93cb-2516c9985e45	8331	Suhor
00050000-5564-1b62-3e4e-fe784cbd19ee	2233	Sv. Ana v Slovenskih goricah
00050000-5564-1b62-2df8-4ac50e40495c	2235	Sv. Trojica v Slovenskih goricah
00050000-5564-1b62-cd51-dbe2083b2ffc	2353	Sveti Duh na Ostrem Vrhu
00050000-5564-1b62-268b-0090fd0f7459	9244	Sveti Jurij ob Ščavnici
00050000-5564-1b62-dbba-51bb7db604cc	3264	Sveti Štefan
00050000-5564-1b62-37f5-d8f05ab7f88b	2258	Sveti Tomaž
00050000-5564-1b62-13c7-3cbe1da74729	9204	Šalovci
00050000-5564-1b62-ae02-c7b99dcc0681	5261	Šempas
00050000-5564-1b62-40e6-f074b1f78cda	5290	Šempeter pri Gorici
00050000-5564-1b62-6152-59081c523525	3311	Šempeter v Savinjski dolini
00050000-5564-1b62-2447-01e7d99cf4ba	4208	Šenčur
00050000-5564-1b62-1b9e-b846d7f480f8	2212	Šentilj v Slovenskih goricah
00050000-5564-1b62-6977-03d9cce99a0f	8297	Šentjanž
00050000-5564-1b62-b2fc-b91b8d00014e	2373	Šentjanž pri Dravogradu
00050000-5564-1b62-90c8-c26628b4ea17	8310	Šentjernej
00050000-5564-1b62-9ec4-f0a018b26c9c	3230	Šentjur
00050000-5564-1b62-be25-6c9dc53eb576	3271	Šentrupert
00050000-5564-1b62-d895-885c46b99e25	8232	Šentrupert
00050000-5564-1b62-0a89-38fdae026bc6	1296	Šentvid pri Stični
00050000-5564-1b62-dccd-15d10a773f6c	8275	Škocjan
00050000-5564-1b62-5f45-7236db5f038e	6281	Škofije
00050000-5564-1b62-7780-13d1460450de	4220	Škofja Loka
00050000-5564-1b62-9dff-3bf54b581272	3211	Škofja vas
00050000-5564-1b62-d561-70687b371c8d	1291	Škofljica
00050000-5564-1b62-196f-b07169f779d0	6274	Šmarje
00050000-5564-1b62-676c-b2eb6c3b8739	1293	Šmarje - Sap
00050000-5564-1b62-6c29-be5d8f1df63e	3240	Šmarje pri Jelšah
00050000-5564-1b62-2026-400d2ca2eb7e	8220	Šmarješke Toplice
00050000-5564-1b62-b55a-6b4caef0cc05	2315	Šmartno na Pohorju
00050000-5564-1b62-659f-2159d4b994e1	3341	Šmartno ob Dreti
00050000-5564-1b62-e886-80acbadf5c3c	3327	Šmartno ob Paki
00050000-5564-1b62-32d9-6b476c3ae2f3	1275	Šmartno pri Litiji
00050000-5564-1b62-f48b-96476628b70f	2383	Šmartno pri Slovenj Gradcu
00050000-5564-1b62-e93f-d5e37348cbf6	3201	Šmartno v Rožni dolini
00050000-5564-1b62-e175-96b49c3d596a	3325	Šoštanj
00050000-5564-1b62-27aa-26497d542597	6222	Štanjel
00050000-5564-1b62-38dd-0d3d046e8f0f	3220	Štore
00050000-5564-1b62-f1ad-65808e0bd069	3304	Tabor
00050000-5564-1b62-f5dc-73e00acd4dff	3221	Teharje
00050000-5564-1b62-3e6c-7415939154d1	9251	Tišina
00050000-5564-1b62-3a88-408786d57f28	5220	Tolmin
00050000-5564-1b62-274a-5630bb059402	3326	Topolšica
00050000-5564-1b62-5cb9-6ff7c9e19258	2371	Trbonje
00050000-5564-1b62-19bd-ff7b6b9d3220	1420	Trbovlje
00050000-5564-1b62-4f88-d3ccedf6aec3	8231	Trebelno 
00050000-5564-1b62-49fd-2a256c7d42a7	8210	Trebnje
00050000-5564-1b62-e7e7-e657d9820e5e	5252	Trnovo pri Gorici
00050000-5564-1b62-c9e4-9e12c1973ac4	2254	Trnovska vas
00050000-5564-1b62-f6ec-3088149d27c1	1222	Trojane
00050000-5564-1b62-6b0f-577826087c9f	1236	Trzin
00050000-5564-1b62-ad1b-69da61d3be64	4290	Tržič
00050000-5564-1b62-af51-7539d0fc3fea	8295	Tržišče
00050000-5564-1b62-3d22-4ad3b9fca180	1311	Turjak
00050000-5564-1b62-2be8-b1ab420aa9ef	9224	Turnišče
00050000-5564-1b62-8079-b3a1459df34f	8323	Uršna sela
00050000-5564-1b62-2bc7-022817be8ce1	1252	Vače
00050000-5564-1b62-849d-47d66bab4be8	3320	Velenje 
00050000-5564-1b62-4f30-a57b98ee9bf4	3322	Velenje - poštni predali
00050000-5564-1b62-067f-d0ebcdcd3a81	8212	Velika Loka
00050000-5564-1b62-4806-0bdab974dab5	2274	Velika Nedelja
00050000-5564-1b62-7229-942a48670d46	9225	Velika Polana
00050000-5564-1b62-b4a7-e1bd842402db	1315	Velike Lašče
00050000-5564-1b62-5184-595184b4b0d9	8213	Veliki Gaber
00050000-5564-1b62-a395-1268b3e418f0	9241	Veržej
00050000-5564-1b62-cedf-dc0ba1f83782	1312	Videm - Dobrepolje
00050000-5564-1b62-1ddb-733af094ea98	2284	Videm pri Ptuju
00050000-5564-1b62-a590-57755214e095	8344	Vinica
00050000-5564-1b62-5ea8-85699dc94bbb	5271	Vipava
00050000-5564-1b62-9b96-bc11cbc703c1	4212	Visoko
00050000-5564-1b62-c2f6-c72340bb0d85	1294	Višnja Gora
00050000-5564-1b62-79e2-f8ffbf08b813	3205	Vitanje
00050000-5564-1b62-a0c7-f4b6128ec2bc	2255	Vitomarci
00050000-5564-1b62-0383-c1af48cc7473	1217	Vodice
00050000-5564-1b62-ff7e-575f9bb2e1f5	3212	Vojnik\t
00050000-5564-1b62-795a-fc696b5945de	5293	Volčja Draga
00050000-5564-1b62-67bd-592389fb5ed4	2232	Voličina
00050000-5564-1b62-34b3-c0aa69973064	3305	Vransko
00050000-5564-1b62-2699-3ca5cc4f6080	6217	Vremski Britof
00050000-5564-1b62-ad29-1d260b5513d7	1360	Vrhnika
00050000-5564-1b62-b738-618226eef73d	2365	Vuhred
00050000-5564-1b62-4b0e-d54abc367b65	2367	Vuzenica
00050000-5564-1b62-01a5-8893949edbb2	8292	Zabukovje 
00050000-5564-1b62-d182-84ec0c381dce	1410	Zagorje ob Savi
00050000-5564-1b62-466a-c54329501519	1303	Zagradec
00050000-5564-1b62-d987-a524ea161f20	2283	Zavrč
00050000-5564-1b62-dccc-8f54dcc9d853	8272	Zdole 
00050000-5564-1b62-c1f9-b61e4270edd0	4201	Zgornja Besnica
00050000-5564-1b62-f615-3ece66fac182	2242	Zgornja Korena
00050000-5564-1b62-8cb9-63c70513136b	2201	Zgornja Kungota
00050000-5564-1b62-ed3a-5757243d8438	2316	Zgornja Ložnica
00050000-5564-1b62-345a-caa5b1f6407a	2314	Zgornja Polskava
00050000-5564-1b62-367b-68e21769fdeb	2213	Zgornja Velka
00050000-5564-1b62-f531-777ad7005544	4247	Zgornje Gorje
00050000-5564-1b62-2973-1c5e6763cde3	4206	Zgornje Jezersko
00050000-5564-1b62-43cc-f71bf6c6ee0c	2285	Zgornji Leskovec
00050000-5564-1b62-4781-574de05de069	1432	Zidani Most
00050000-5564-1b62-c75b-cf35fd6dd396	3214	Zreče
00050000-5564-1b62-960f-2bb5651c5a09	4209	Žabnica
00050000-5564-1b62-ba58-aefac82822e8	3310	Žalec
00050000-5564-1b62-c4a4-65904a8cc633	4228	Železniki
00050000-5564-1b62-77e7-a1f8adcad509	2287	Žetale
00050000-5564-1b62-1543-756a5e785d59	4226	Žiri
00050000-5564-1b62-1573-e898b24e556d	4274	Žirovnica
00050000-5564-1b62-36b3-ecfd19c979eb	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 4997051)
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
-- TOC entry 2705 (class 0 OID 4996866)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 4996944)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 4997063)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 4997183)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 4997234)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 4997092)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5564-1b64-b099-17dd7f8867d8	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5564-1b64-ff9a-0aff0e1fe6e8	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5564-1b64-b369-64f76f5dcd6d	0003	Kazinska	t	84	Kazinska dvorana
00220000-5564-1b64-eb0a-12c5894bd531	0004	Mali oder	t	24	Mali oder 
00220000-5564-1b64-27a4-bd7a02452092	0005	Komorni oder	t	15	Komorni oder
00220000-5564-1b64-3bbd-8b7614503792	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5564-1b64-14bb-3ebc249caf6f	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 4997036)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 4997026)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 4997223)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 4997160)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 4996739)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5564-1b63-6bb1-22202ff6f65e	00010000-5564-1b63-cc83-1149e9946576	2015-05-26 09:06:12	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROl0Gpl3u8GCchZzTEiwCG4NpMw2Ce/bW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 4997102)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 4996777)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5564-1b63-fd30-1fea00175dfa	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5564-1b63-9724-be70ca3c68d4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5564-1b63-55ff-24c902f119f2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5564-1b63-3685-07ff0b89b5dc	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5564-1b63-b497-5f2dd669a8b0	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5564-1b63-8796-d802c526a486	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 4996761)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5564-1b63-6bb1-22202ff6f65e	00020000-5564-1b63-3685-07ff0b89b5dc
00010000-5564-1b63-cc83-1149e9946576	00020000-5564-1b63-3685-07ff0b89b5dc
\.


--
-- TOC entry 2732 (class 0 OID 4997116)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 4997057)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 4997007)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 4997329)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5564-1b63-7428-a411b5f82f9a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5564-1b63-e889-85eaec615389	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5564-1b63-9fe4-4dd00b84aa6a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5564-1b63-ff71-e6a81552f86d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5564-1b63-f9e7-a30c9ebde7a1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 4997322)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5564-1b63-2c3f-c3a03bc81b70	00000000-5564-1b63-ff71-e6a81552f86d	popa
00000000-5564-1b63-ce6b-989316ed09a9	00000000-5564-1b63-ff71-e6a81552f86d	oseba
00000000-5564-1b63-8fa9-0240ec962210	00000000-5564-1b63-e889-85eaec615389	prostor
00000000-5564-1b63-b0c2-9c47ecf860bc	00000000-5564-1b63-ff71-e6a81552f86d	besedilo
00000000-5564-1b63-1a97-e948e293544e	00000000-5564-1b63-ff71-e6a81552f86d	uprizoritev
00000000-5564-1b63-3d1f-aa172982ea36	00000000-5564-1b63-ff71-e6a81552f86d	funkcija
00000000-5564-1b63-bff2-ee16633066e5	00000000-5564-1b63-ff71-e6a81552f86d	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 4997317)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 4997170)
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
-- TOC entry 2703 (class 0 OID 4996838)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 4997013)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 4997212)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5564-1b63-f559-ae1fb7832db1	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-1b63-3df3-d3654c1ac669	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-1b63-f5cd-5ca2b0af72e3	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5564-1b63-e237-ba3dc0bf9088	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5564-1b63-aac0-9f21319c0f7e	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5564-1b63-8252-9da9ae06a1c2	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5564-1b63-9879-5383618958fd	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5564-1b63-2615-590b1a313fac	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5564-1b63-07ed-1082e4b6a702	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5564-1b63-55dc-deab486d66fc	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5564-1b63-d1d8-714e6cc6dea6	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5564-1b63-e90a-7205c234b820	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5564-1b63-fba8-ba162017746f	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5564-1b63-524d-40160fab3384	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5564-1b63-9d54-4e91d2013004	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5564-1b63-cd89-90cb7182d744	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 4996901)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 4996748)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5564-1b63-cc83-1149e9946576	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROMGZGORbVLN5Hrqs0XpQ/RLQLkhP6awG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5564-1b63-6bb1-22202ff6f65e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 4997267)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 4996959)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 4997084)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 4997152)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 4996991)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 4997257)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5564-1b63-f489-704aa6784547	Drama	drama (SURS 01)
00140000-5564-1b63-a8fe-a4516e51cb00	Opera	opera (SURS 02)
00140000-5564-1b63-4adf-afe3fd248001	Balet	balet (SURS 03)
00140000-5564-1b63-4be0-6cd3757d3b90	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5564-1b63-bc32-3c59675f4d7f	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5564-1b63-1804-f395a7b31b5e	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5564-1b63-bb61-c300b6ec85cf	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 4997142)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5564-1b63-bb66-81e6fa9618f4	Opera	opera
00150000-5564-1b63-b968-4dc6f701b977	Opereta	opereta
00150000-5564-1b63-ead9-f8c631b96c5d	Balet	balet
00150000-5564-1b63-70ba-faa5c4aa6260	Plesne prireditve	plesne prireditve
00150000-5564-1b63-04b3-96b6377f190c	Lutkovno gledališče	lutkovno gledališče
00150000-5564-1b63-0555-6cb193cf7b0a	Raziskovalno gledališče	raziskovalno gledališče
00150000-5564-1b63-d17e-38cd7edf6128	Biografska drama	biografska drama
00150000-5564-1b63-a7af-1dd624e1447f	Komedija	komedija
00150000-5564-1b63-5bfa-95d4c1c96fd1	Črna komedija	črna komedija
00150000-5564-1b63-d837-f54c1b7c9ec2	E-igra	E-igra
00150000-5564-1b63-cc20-c52fd599cff3	Kriminalka	kriminalka
00150000-5564-1b63-91c0-f791de7408be	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 4996802)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 4997311)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 4997301)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 4997211)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4996981)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4997006)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 4996927)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 4997138)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4996957)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 4997000)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 4996941)
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
-- TOC entry 2407 (class 2606 OID 4997049)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4997076)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 4996899)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4996811)
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
-- TOC entry 2322 (class 2606 OID 4996834)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 4996791)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 4996776)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 4997082)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 4997115)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 4997252)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 4996863)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4996887)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4997055)
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
-- TOC entry 2337 (class 2606 OID 4996877)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4996948)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4997067)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 4997195)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 4997239)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 4997099)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4997040)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 4997031)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 4997233)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 4997167)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4996747)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 4997106)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4996765)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 4996785)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 4997124)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4997062)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4997012)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 4997335)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 4997326)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 4997321)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 4997180)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 4996843)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4997022)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 4997222)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 4996912)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4996760)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 4997282)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4996966)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 4997090)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 4997158)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 4996995)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 4997266)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 4997151)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 4996988)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 4997181)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 4997182)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 4996865)
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
-- TOC entry 2420 (class 1259 OID 4997083)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 4997069)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 4997068)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 4996967)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 4997141)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 4997139)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 4997140)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 4996943)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 4996942)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 4997254)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 4997255)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 4997256)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 4997286)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 4997283)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 4997285)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 4997284)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 4996914)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 4996913)
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
-- TOC entry 2320 (class 1259 OID 4996837)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 4997107)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 4997001)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 4996792)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 4996793)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 4997127)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 4997126)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 4997125)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 4996949)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 4996951)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 4996950)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 4997328)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 4997035)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 4997033)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 4997032)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 4997034)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 4996766)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 4996767)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 4997091)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 4997056)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 4997168)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 4997169)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 4996879)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 4996878)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 4996880)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 4997196)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 4997197)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 4997314)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 4997313)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 4997316)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 4997312)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 4997315)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 4997159)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 4997044)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 4997043)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 4997041)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 4997042)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 4997303)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 4997302)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 4996958)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 4996813)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 4996812)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 4996844)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 4996845)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 4997025)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 4997024)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 4997023)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 4996990)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 4996986)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 4996983)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 4996984)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 4996982)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 4996987)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 4996985)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 4996864)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 4996928)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 4996930)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 4996929)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 4996931)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 4997050)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 4997253)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 4996835)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 4996836)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 4997336)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 4996900)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 4997327)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 4997101)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 4997100)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 4996888)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 4997240)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 4996786)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 4996989)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2532 (class 2606 OID 4997474)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2529 (class 2606 OID 4997459)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2530 (class 2606 OID 4997464)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2534 (class 2606 OID 4997484)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2528 (class 2606 OID 4997454)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2533 (class 2606 OID 4997479)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 4997469)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2563 (class 2606 OID 4997629)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2564 (class 2606 OID 4997634)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 4997389)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 4997569)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2550 (class 2606 OID 4997564)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2549 (class 2606 OID 4997559)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 4997449)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2559 (class 2606 OID 4997609)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 4997599)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 4997604)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2522 (class 2606 OID 4997424)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2521 (class 2606 OID 4997419)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 4997549)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 4997654)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 4997659)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 4997664)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2574 (class 2606 OID 4997684)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2571 (class 2606 OID 4997669)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2573 (class 2606 OID 4997679)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2572 (class 2606 OID 4997674)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2520 (class 2606 OID 4997414)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 4997409)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2512 (class 2606 OID 4997374)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2511 (class 2606 OID 4997369)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 4997579)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 4997489)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 4997349)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 4997354)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2556 (class 2606 OID 4997594)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 4997589)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2554 (class 2606 OID 4997584)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2523 (class 2606 OID 4997429)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2525 (class 2606 OID 4997439)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 4997434)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 4997724)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2542 (class 2606 OID 4997524)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2540 (class 2606 OID 4997514)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2539 (class 2606 OID 4997509)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2541 (class 2606 OID 4997519)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 4997339)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 4997344)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 4997574)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 4997554)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2561 (class 2606 OID 4997619)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2562 (class 2606 OID 4997624)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 4997399)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 4997394)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2518 (class 2606 OID 4997404)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 4997639)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2566 (class 2606 OID 4997644)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 4997709)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2578 (class 2606 OID 4997704)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2581 (class 2606 OID 4997719)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2577 (class 2606 OID 4997699)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2580 (class 2606 OID 4997714)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 4997614)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2546 (class 2606 OID 4997544)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2545 (class 2606 OID 4997539)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2543 (class 2606 OID 4997529)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2544 (class 2606 OID 4997534)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2576 (class 2606 OID 4997694)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2575 (class 2606 OID 4997689)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 4997444)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 4997649)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 4997364)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 4997359)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2513 (class 2606 OID 4997379)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4997384)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2538 (class 2606 OID 4997504)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 4997499)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2536 (class 2606 OID 4997494)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-26 09:06:12 CEST

--
-- PostgreSQL database dump complete
--

