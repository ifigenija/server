--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-25 13:35:22 CEST

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
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 232
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 4870112)
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
-- TOC entry 227 (class 1259 OID 4870621)
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
-- TOC entry 226 (class 1259 OID 4870604)
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
-- TOC entry 219 (class 1259 OID 4870515)
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
-- TOC entry 194 (class 1259 OID 4870285)
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
-- TOC entry 197 (class 1259 OID 4870319)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4870232)
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
-- TOC entry 213 (class 1259 OID 4870445)
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
-- TOC entry 192 (class 1259 OID 4870269)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 4870313)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 4870249)
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
-- TOC entry 202 (class 1259 OID 4870362)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 4870387)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4870206)
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
-- TOC entry 181 (class 1259 OID 4870121)
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
-- TOC entry 182 (class 1259 OID 4870132)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
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
-- TOC entry 177 (class 1259 OID 4870086)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4870105)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 4870394)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 4870425)
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
-- TOC entry 223 (class 1259 OID 4870558)
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
-- TOC entry 184 (class 1259 OID 4870163)
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
-- TOC entry 186 (class 1259 OID 4870198)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 4870368)
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
-- TOC entry 185 (class 1259 OID 4870183)
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
-- TOC entry 191 (class 1259 OID 4870261)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4870380)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 4870500)
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
-- TOC entry 222 (class 1259 OID 4870551)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 4870409)
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
-- TOC entry 201 (class 1259 OID 4870353)
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
-- TOC entry 200 (class 1259 OID 4870343)
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
-- TOC entry 221 (class 1259 OID 4870540)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4870477)
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
-- TOC entry 174 (class 1259 OID 4870057)
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
-- TOC entry 173 (class 1259 OID 4870055)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 4870419)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4870095)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 4870079)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 4870433)
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
-- TOC entry 204 (class 1259 OID 4870374)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4870324)
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
-- TOC entry 230 (class 1259 OID 4870646)
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
-- TOC entry 229 (class 1259 OID 4870639)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 4870634)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4870487)
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
-- TOC entry 231 (class 1259 OID 4870654)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 4870155)
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
-- TOC entry 199 (class 1259 OID 4870330)
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
-- TOC entry 220 (class 1259 OID 4870529)
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
-- TOC entry 188 (class 1259 OID 4870218)
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
-- TOC entry 175 (class 1259 OID 4870066)
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
-- TOC entry 225 (class 1259 OID 4870584)
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
-- TOC entry 193 (class 1259 OID 4870276)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 4870401)
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
-- TOC entry 215 (class 1259 OID 4870469)
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
-- TOC entry 195 (class 1259 OID 4870308)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 4870574)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 4870459)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 4870060)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2699 (class 0 OID 4870112)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 4870621)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2745 (class 0 OID 4870604)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 4870515)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 4870285)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 4870319)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 4870232)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5563-08f9-caae-a87697cdf413	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5563-08f9-b7e3-80f720bb5afe	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5563-08f9-8ae0-6e999b2b4178	AL	ALB	008	Albania 	Albanija	\N
00040000-5563-08f9-c3d5-cd46cd13421a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5563-08f9-58a9-d16f8560d30f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5563-08f9-8db8-e204fd53d514	AD	AND	020	Andorra 	Andora	\N
00040000-5563-08f9-7015-f2808f813ef8	AO	AGO	024	Angola 	Angola	\N
00040000-5563-08f9-1cc1-64514571d412	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5563-08f9-5ff6-c6873b1665cf	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5563-08f9-7856-10764ea16a44	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5563-08f9-13de-ae7342f97e16	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5563-08f9-be87-663183a66d09	AM	ARM	051	Armenia 	Armenija	\N
00040000-5563-08f9-c019-a90c35a780e0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5563-08f9-f498-606bd51faacb	AU	AUS	036	Australia 	Avstralija	\N
00040000-5563-08f9-35e4-55578d7cc1a1	AT	AUT	040	Austria 	Avstrija	\N
00040000-5563-08f9-6f41-f4f850fa53f4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5563-08f9-2db4-23303dc9743f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5563-08f9-ec06-d91b53f88570	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5563-08f9-6eb7-75b3d26a60ed	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5563-08f9-9b91-403a2e445e7c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5563-08f9-7a22-e479f09af4ed	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5563-08f9-fbe9-9f8898e5b8ea	BE	BEL	056	Belgium 	Belgija	\N
00040000-5563-08f9-59b3-bd48bbc17afa	BZ	BLZ	084	Belize 	Belize	\N
00040000-5563-08f9-e7a7-189e7336cd8b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5563-08f9-6262-27ba68b5c5da	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5563-08f9-ebc4-3e7c662503a7	BT	BTN	064	Bhutan 	Butan	\N
00040000-5563-08f9-73c3-5de0da58dd86	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5563-08f9-bb35-f02fa79d804d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5563-08f9-56c5-38bcb9ceff6f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5563-08f9-4248-4052abb086a1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5563-08f9-b6a0-b660fa680498	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5563-08f9-f5da-ecf51fafbfea	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5563-08f9-eb8a-d45758ed9c34	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5563-08f9-4c2a-f84fec82366f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5563-08f9-7c19-173e1f298040	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5563-08f9-638f-0b691cdf1a0f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5563-08f9-40a5-372e96c82128	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5563-08f9-3031-7c8965d29e63	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5563-08f9-1b24-bcea8b4f1fb3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5563-08f9-09e9-a300a1141457	CA	CAN	124	Canada 	Kanada	\N
00040000-5563-08f9-1d41-a7f85beddefc	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5563-08f9-b734-f75025ecc03b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5563-08f9-3967-d233ab4e22b8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5563-08f9-9e1c-574520e9afad	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5563-08f9-4ba1-19b680636a91	CL	CHL	152	Chile 	Čile	\N
00040000-5563-08f9-f6f6-f5a894ea6f4e	CN	CHN	156	China 	Kitajska	\N
00040000-5563-08f9-4287-063926f9453d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5563-08f9-ae9a-cbd92342a9aa	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5563-08f9-fbb9-8a1e0ca7ad2b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5563-08f9-525b-50e72a77cb7f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5563-08f9-611d-c5d7a249af97	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5563-08f9-31be-69a45761851f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5563-08f9-e3fa-5d702b88bb11	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5563-08f9-1f43-87f151e3de61	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5563-08f9-125e-d369fec827b9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5563-08f9-fe50-67e4bafdd4ce	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5563-08f9-de86-0674c2b0259e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5563-08f9-f4ab-7b0a1070d4d6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5563-08f9-9420-31924b60949a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5563-08f9-ae1e-7a4c92e293cc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5563-08f9-10bf-b153fb820ec2	DK	DNK	208	Denmark 	Danska	\N
00040000-5563-08f9-dac1-cb80f09f0a46	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5563-08f9-32f2-da28fa17d735	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5563-08f9-00cd-d67999062439	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5563-08f9-e579-eefd4bce676a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5563-08f9-b7fb-7f63ce0b5f59	EG	EGY	818	Egypt 	Egipt	\N
00040000-5563-08f9-7302-46d966e566a9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5563-08f9-6347-1682bf925a34	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5563-08f9-c570-c783166eb5c5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5563-08f9-f22f-ce679bff3d77	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5563-08f9-5d6f-8bd2ae189201	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5563-08f9-44d9-dbd684f32d72	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5563-08f9-846b-265ae7598759	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5563-08f9-7a2c-530a8f06b91e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5563-08f9-4dba-27aeea304d33	FI	FIN	246	Finland 	Finska	\N
00040000-5563-08f9-117a-61c716c21391	FR	FRA	250	France 	Francija	\N
00040000-5563-08f9-9dc0-857083ef4846	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5563-08f9-91c5-351ee27db034	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5563-08f9-d476-63d230cd034c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5563-08f9-ae86-29a0bcaa37be	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5563-08f9-9117-fc358ba0c702	GA	GAB	266	Gabon 	Gabon	\N
00040000-5563-08f9-aec3-e2d8e3af84ec	GM	GMB	270	Gambia 	Gambija	\N
00040000-5563-08f9-c3fc-9d722afa0c2d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5563-08f9-e5ef-df391369fb0d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5563-08f9-b2af-5d18478cf93f	GH	GHA	288	Ghana 	Gana	\N
00040000-5563-08f9-a802-4c0052d349b5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5563-08f9-3c59-ec3f8817e8ba	GR	GRC	300	Greece 	Grčija	\N
00040000-5563-08f9-da85-60469fefabf1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5563-08f9-1de5-f51334cea355	GD	GRD	308	Grenada 	Grenada	\N
00040000-5563-08f9-b7da-a1e43b71fe08	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5563-08f9-7271-6c4b8a4ae5b8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5563-08f9-2f43-599154f55539	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5563-08f9-98a6-79fa127ec9f9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5563-08f9-2455-c588ec0fd60f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5563-08f9-364b-26c59ea113df	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5563-08f9-bd0f-542b376c28e6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5563-08f9-bf4a-dbb5dd35951a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5563-08f9-3f3c-c84c902ad4ba	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5563-08f9-3c48-9c3d4b625e39	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5563-08f9-41bd-af1ab12e33ac	HN	HND	340	Honduras 	Honduras	\N
00040000-5563-08f9-8779-be3dacf09250	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5563-08f9-8b74-831e6bac176c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5563-08f9-68bd-2ae51ae53d68	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5563-08f9-7b00-2d0100d8d370	IN	IND	356	India 	Indija	\N
00040000-5563-08f9-a66a-f4feb22876fd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5563-08f9-6ad9-b168cfb52516	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5563-08f9-3bbf-326924d9b183	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5563-08f9-2101-79df7331d222	IE	IRL	372	Ireland 	Irska	\N
00040000-5563-08f9-46b2-ddb64b643e20	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5563-08f9-93cd-c0e1ca1644b4	IL	ISR	376	Israel 	Izrael	\N
00040000-5563-08f9-31e1-8d9d25f333a7	IT	ITA	380	Italy 	Italija	\N
00040000-5563-08f9-6a5d-f93ddcc2b4b6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5563-08f9-1989-537cffc2970b	JP	JPN	392	Japan 	Japonska	\N
00040000-5563-08f9-68ad-64091cba3e15	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5563-08f9-9830-e23156b139ef	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5563-08f9-d207-eb3748d2eb16	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5563-08f9-8403-edcf43aec798	KE	KEN	404	Kenya 	Kenija	\N
00040000-5563-08f9-ffa9-ed9a53ac42b6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5563-08f9-b661-0524f6ef3154	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5563-08f9-728d-de0c50eb61fe	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5563-08f9-7c68-ae62442d9c49	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5563-08f9-9827-36bab7b9347a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5563-08f9-9909-d60c48e42995	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5563-08f9-be8e-e40023561c0a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5563-08f9-bf4e-d70936c232ba	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5563-08f9-d269-7205f7ce95d9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5563-08f9-c3d6-4edaf0a1a3ab	LR	LBR	430	Liberia 	Liberija	\N
00040000-5563-08f9-5b4f-a5175216106b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5563-08f9-92e8-0feea8bd170c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5563-08f9-7fa9-c3432e7c32b7	LT	LTU	440	Lithuania 	Litva	\N
00040000-5563-08f9-5e3c-3132e4131df4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5563-08f9-1366-488463f2d1a9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5563-08f9-a323-21d4e4ee8d63	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5563-08f9-2945-6995708a388c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5563-08f9-c651-d5d42260c4f4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5563-08f9-e1ed-089fa4d92f96	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5563-08f9-d8ec-31061a14df35	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5563-08f9-2b9b-02211058c89e	ML	MLI	466	Mali 	Mali	\N
00040000-5563-08f9-0d79-fe5a6f43a1a1	MT	MLT	470	Malta 	Malta	\N
00040000-5563-08f9-f25c-ab99886d0a29	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5563-08f9-2fa9-d59b8b6b8149	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5563-08f9-75ed-4326d593b8e3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5563-08f9-5b60-5e07c1b30d36	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5563-08f9-efdd-54c3ab9f52d8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5563-08f9-ab5b-57ab34df698e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5563-08f9-6805-3eb68f008af8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5563-08f9-0e51-a271ee502218	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5563-08f9-ce36-4b337429246f	MC	MCO	492	Monaco 	Monako	\N
00040000-5563-08f9-afbd-43d98c2b14ba	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5563-08f9-4cd4-d343ebc9db99	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5563-08f9-bc7f-b5e018e1ab80	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5563-08f9-9793-1ac2d051ee59	MA	MAR	504	Morocco 	Maroko	\N
00040000-5563-08f9-196a-6f76768431e1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5563-08f9-a54e-524acb8658ee	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5563-08f9-d510-bdf46ce14c98	NA	NAM	516	Namibia 	Namibija	\N
00040000-5563-08f9-2be9-2c38e990204f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5563-08f9-689d-8159b60a26bc	NP	NPL	524	Nepal 	Nepal	\N
00040000-5563-08f9-ffeb-d09dc06c6c0d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5563-08f9-a372-8c219d6901c7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5563-08f9-c7c8-89d593f83be0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5563-08f9-0c20-a18479ea5435	NE	NER	562	Niger 	Niger 	\N
00040000-5563-08f9-2456-74e46662375c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5563-08f9-41ae-a7d16a5ad11a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5563-08f9-9daa-5c8b80f5aa87	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5563-08f9-d60a-43883334f242	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5563-08f9-a324-4ca98bf99398	NO	NOR	578	Norway 	Norveška	\N
00040000-5563-08f9-b265-9904fabbf3f1	OM	OMN	512	Oman 	Oman	\N
00040000-5563-08f9-d1bb-cfcd426fa92d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5563-08f9-7dd5-8278bd09bed9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5563-08f9-dfcc-7f94d0800782	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5563-08f9-b7ad-35cdf7e20e7b	PA	PAN	591	Panama 	Panama	\N
00040000-5563-08f9-291d-be969f6a0568	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5563-08f9-389b-6ae0eeecf458	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5563-08f9-e8b3-6c4194b460cf	PE	PER	604	Peru 	Peru	\N
00040000-5563-08f9-bd7e-b09f79e95719	PH	PHL	608	Philippines 	Filipini	\N
00040000-5563-08f9-35bd-016f6d4ec44b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5563-08f9-0b76-e7502774f78c	PL	POL	616	Poland 	Poljska	\N
00040000-5563-08f9-3c44-f1b6c1f1004d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5563-08f9-7603-86555d50cc90	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5563-08f9-b306-cd080a040e69	QA	QAT	634	Qatar 	Katar	\N
00040000-5563-08f9-b181-ca236e8e989b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5563-08f9-b9ab-264dfcd8545f	RO	ROU	642	Romania 	Romunija	\N
00040000-5563-08f9-9ecd-4d42694e9c72	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5563-08f9-bd83-3bb44e47517e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5563-08f9-389d-0a9f8f70e5a1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5563-08f9-f9c7-f540d8ccced8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5563-08f9-9e26-6a6d01dacaa1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5563-08f9-40db-ad96bddc9e71	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5563-08f9-35b9-36d87379ff36	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5563-08f9-45ca-5e5706f4ee2d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5563-08f9-f684-8e9b30daa380	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5563-08f9-dc89-6b67a2fccb3d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5563-08f9-ae0c-23782d0be9cb	SM	SMR	674	San Marino 	San Marino	\N
00040000-5563-08f9-43c3-32c52cbe9d9b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5563-08f9-ac56-6adedaf098ac	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5563-08f9-35fa-c7be411437c0	SN	SEN	686	Senegal 	Senegal	\N
00040000-5563-08f9-e1af-d24690f804bd	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5563-08f9-a2d1-508f9c79b574	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5563-08f9-7d79-8f6a93e28075	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5563-08f9-c39c-bc6dbe3cd132	SG	SGP	702	Singapore 	Singapur	\N
00040000-5563-08f9-9c95-3dffcf728237	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5563-08f9-fb50-b147d1aef5cb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5563-08f9-811d-3d5e93a0c6a4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5563-08f9-a452-26f56b9e75b3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5563-08f9-9602-7862a4ca1aa8	SO	SOM	706	Somalia 	Somalija	\N
00040000-5563-08f9-23e5-ffcf5680352e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5563-08f9-a256-c2ec3d660e53	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5563-08f9-0aff-75d0e9369018	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5563-08f9-bbe6-26b30d91f33d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5563-08f9-c03a-472bb78ecbfb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5563-08f9-a96a-0e2e02435cf0	SD	SDN	729	Sudan 	Sudan	\N
00040000-5563-08f9-714f-b7f8cc92a458	SR	SUR	740	Suriname 	Surinam	\N
00040000-5563-08f9-a84c-8f382bafbd08	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5563-08f9-2692-56c945fec849	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5563-08f9-dd98-f97e103f15df	SE	SWE	752	Sweden 	Švedska	\N
00040000-5563-08f9-7d66-a6323b1bcd51	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5563-08f9-0b64-b5ba14cd4a7c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5563-08f9-0341-00d77c9bd464	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5563-08f9-438a-6239a6531fba	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5563-08f9-0ecb-6164b35db55b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5563-08f9-d71d-c1ee539fafe4	TH	THA	764	Thailand 	Tajska	\N
00040000-5563-08f9-d67a-e06d29d16863	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5563-08f9-83f6-c9421710af19	TG	TGO	768	Togo 	Togo	\N
00040000-5563-08f9-25d0-3b5ffbc5200d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5563-08f9-8bae-d1961fad1068	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5563-08f9-da38-75163217466e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5563-08f9-923d-72899826c5f5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5563-08f9-e90f-b625f97e3b0e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5563-08f9-6337-dd06d06cb350	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5563-08f9-e9a9-e500b726cc64	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5563-08f9-e07c-efe6959cfaaa	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5563-08f9-a856-2c0610acc7b8	UG	UGA	800	Uganda 	Uganda	\N
00040000-5563-08f9-3983-c146c5e63071	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5563-08f9-28b5-850905f6e0ac	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5563-08f9-6250-5bafa2daee00	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5563-08f9-3043-9bb27568ac30	US	USA	840	United States 	Združene države Amerike	\N
00040000-5563-08f9-2b1d-94f32031a202	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5563-08f9-3d8b-e14a86c697fb	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5563-08f9-063d-798a10d811c7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5563-08f9-3fca-872f2fd3bc82	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5563-08f9-dec7-534a25a672c8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5563-08f9-21a5-379fbf212e6c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5563-08f9-e5c1-7a62a97236dc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5563-08f9-f0e6-1a2a4442aa62	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5563-08f9-f62b-892f4b9e4d27	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5563-08f9-7928-fc0c036ffe0a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5563-08f9-4fb2-c26587dc82b4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5563-08f9-d1b3-d87e739d1bda	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5563-08f9-4b0e-65b7aa1544d4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2732 (class 0 OID 4870445)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 4870269)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 4870313)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 4870249)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2689 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2721 (class 0 OID 4870362)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 4870387)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 4870206)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5563-08f9-247b-0bcf63d72119	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5563-08f9-847e-da132c356c4c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5563-08f9-f40b-d125a833d74c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5563-08f9-78be-5ee2499665be	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5563-08f9-26ab-65286a50fdbc	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5563-08f9-a488-5452e1b39eaf	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5563-08f9-f04b-e508ccbcf853	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5563-08f9-3e17-9f0676425d5c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5563-08f9-42f3-dd0f0692d21f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5563-08f9-868b-9ad8b5fc5666	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5563-08f9-8d87-d3607d8841e8	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5563-08f9-b9b5-5cd324b2a244	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5563-08f9-8b4c-5482b9cc29be	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5563-08f9-85a2-8b135671fc7d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5563-08f9-df80-24fb8544dc86	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2700 (class 0 OID 4870121)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5563-08f9-9a79-4e9ac3c83937	00000000-5563-08f9-26ab-65286a50fdbc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5563-08f9-c6ee-a950054f2fc6	00000000-5563-08f9-26ab-65286a50fdbc	00010000-5563-08f9-7d82-7e8759eb0816	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5563-08f9-13ee-0db0709a3adb	00000000-5563-08f9-a488-5452e1b39eaf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2701 (class 0 OID 4870132)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5563-08fa-15a2-7c8a37ef52fa	\N	\N	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	\N	0601958000000	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5563-08fa-ac1a-6fd4a5ebe868	\N	\N	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	\N	1202968111111	M		Slovenija	Slovenija	Maribor
00090000-5563-08fa-3ddb-b70db11869c0	\N	\N		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	\N	2603976222222	M		Slovenija	Slovenija	Celje
00090000-5563-08fa-96e2-92af8f062f95	\N	\N	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	\N	3004971333333	M		Slovenija	Slovenija	Kranj
00090000-5563-08fa-00b4-11fb339d68ff	\N	\N		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	\N	0705984444444	M		Slovenija	Slovenija	Koper
00090000-5563-08fa-db26-68de914aba0b	\N	\N	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	\N	1906962444444	Z		Slovenija	Slovenija	Murska Sobota
00090000-5563-08fa-1e0c-7c5ad6fc1d6b	\N	\N	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	\N	2407975555555	Z		Slovenija	Slovenija	Novo Mesto
00090000-5563-08fa-fb3a-a6044f032a73	\N	\N	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	\N	0208986666666	Z		Slovenija	Slovenija	Nova Gorica
00090000-5563-08fa-0c36-f6ff7d16c2c3	\N	\N		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	\N	1409967777777	Z		Slovenija	Slovenija	Ptuj
00090000-5563-08fa-f905-c6b870e73720	\N	\N		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	\N	1409967777777	Z		Slovenija	Slovenija	Idrija
\.


--
-- TOC entry 2691 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 4870086)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5563-08f9-0a3c-08c17729bcd7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5563-08f9-3ac5-efe177b4931b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5563-08f9-a745-16f516ba45f5	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5563-08f9-cd2e-5d7908cd2184	Abonma-read	Abonma - branje	f
00030000-5563-08f9-9063-8d8e4cd5783c	Abonma-write	Abonma - spreminjanje	f
00030000-5563-08f9-1438-97af353d04a4	Alternacija-read	Alternacija - branje	f
00030000-5563-08f9-f626-6c66371203fc	Alternacija-write	Alternacija - spreminjanje	f
00030000-5563-08f9-8fe8-066c44b14d44	Arhivalija-read	Arhivalija - branje	f
00030000-5563-08f9-d2ae-7f5df031c4cf	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5563-08f9-ff7f-78fcdc6393e0	Besedilo-read	Besedilo - branje	f
00030000-5563-08f9-5f1c-287ff4fdc3dc	Besedilo-write	Besedilo - spreminjanje	f
00030000-5563-08f9-7b0a-fd2f04fcef3b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5563-08f9-e4cd-ef96cfbd2d46	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5563-08f9-cf61-a80a55e6cb09	Dogodek-read	Dogodek - branje	f
00030000-5563-08f9-68a7-c08574c6d45a	Dogodek-write	Dogodek - spreminjanje	f
00030000-5563-08f9-f602-e9cb94958715	Drzava-read	Drzava - branje	f
00030000-5563-08f9-1546-f85b48a8f2ae	Drzava-write	Drzava - spreminjanje	f
00030000-5563-08f9-76e3-81e40c5848f1	Funkcija-read	Funkcija - branje	f
00030000-5563-08f9-7c29-8cd50ce5a763	Funkcija-write	Funkcija - spreminjanje	f
00030000-5563-08f9-a257-f696c47541ec	Gostovanje-read	Gostovanje - branje	f
00030000-5563-08f9-f3f0-102523d0cd4a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5563-08f9-8961-fb264c62f1af	Gostujoca-read	Gostujoca - branje	f
00030000-5563-08f9-07c1-6569d31e34d9	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5563-08f9-b6f0-fa0e85b8c628	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5563-08f9-5cab-b6d7c7feb9ea	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5563-08f9-cb55-26f48a2d43b4	Kupec-read	Kupec - branje	f
00030000-5563-08f9-75ae-fa74c9ac835a	Kupec-write	Kupec - spreminjanje	f
00030000-5563-08f9-da85-b2475bcbb67d	NacinPlacina-read	NacinPlacina - branje	f
00030000-5563-08f9-790a-1f2102868e29	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5563-08f9-1819-a16057a793ea	Option-read	Option - branje	f
00030000-5563-08f9-3886-ccac6e98b43a	Option-write	Option - spreminjanje	f
00030000-5563-08f9-bd5e-6de8f97bcf7b	OptionValue-read	OptionValue - branje	f
00030000-5563-08f9-a9db-260c096c4ef4	OptionValue-write	OptionValue - spreminjanje	f
00030000-5563-08f9-ae68-fd72e558ab9c	Oseba-read	Oseba - branje	f
00030000-5563-08f9-40dd-abc23010887c	Oseba-write	Oseba - spreminjanje	f
00030000-5563-08f9-383b-f4f7f625b67c	Permission-read	Permission - branje	f
00030000-5563-08f9-3cb4-8b48a427a520	Permission-write	Permission - spreminjanje	f
00030000-5563-08f9-ca46-0735b91df331	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5563-08f9-510e-2c92f10677dd	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5563-08f9-925a-47dae701a3ce	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5563-08f9-72d0-6a839527741f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5563-08f9-4485-098d0bb725c1	Pogodba-read	Pogodba - branje	f
00030000-5563-08f9-e839-78c1be733de2	Pogodba-write	Pogodba - spreminjanje	f
00030000-5563-08f9-78b4-f61903fa0dad	Popa-read	Popa - branje	f
00030000-5563-08f9-0dfc-1966c13a96b3	Popa-write	Popa - spreminjanje	f
00030000-5563-08f9-c650-c9e7e3622f5c	Posta-read	Posta - branje	f
00030000-5563-08f9-3ac9-bbb2f8ab7c8a	Posta-write	Posta - spreminjanje	f
00030000-5563-08f9-54c6-4e734b0f16f4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5563-08f9-5f0e-6f9a93e6c922	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5563-08f9-b496-a898bd05129f	PostniNaslov-read	PostniNaslov - branje	f
00030000-5563-08f9-c2ba-3e56bc78a2b0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5563-08f9-ac67-bb5375bf3537	Predstava-read	Predstava - branje	f
00030000-5563-08f9-548a-7f53fc075da4	Predstava-write	Predstava - spreminjanje	f
00030000-5563-08f9-b552-3d7e09c86ca6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5563-08f9-09a7-5adb39020d24	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5563-08f9-3977-e4a7c72ac538	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5563-08f9-911b-064a2596bbdb	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5563-08f9-eb39-309403e3877b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5563-08f9-0a77-b321b0d28422	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5563-08f9-e689-711d301f1245	Prostor-read	Prostor - branje	f
00030000-5563-08f9-89e8-082aa197cef6	Prostor-write	Prostor - spreminjanje	f
00030000-5563-08f9-1fb1-53f76af81b7f	Racun-read	Racun - branje	f
00030000-5563-08f9-570c-799a41023bd1	Racun-write	Racun - spreminjanje	f
00030000-5563-08f9-7423-b8910e78eb01	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5563-08f9-af45-10b156a5ac84	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5563-08f9-6787-e3b160cb14c1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5563-08f9-0bb2-146dc0b69b3c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5563-08f9-7f71-e021cb895956	Rekvizit-read	Rekvizit - branje	f
00030000-5563-08f9-2e2f-89c07e4cd91d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5563-08f9-9990-124d5a980dbd	Revizija-read	Revizija - branje	f
00030000-5563-08f9-0b7e-efde8cea5e58	Revizija-write	Revizija - spreminjanje	f
00030000-5563-08f9-a832-53bc8929dca8	Rezervacija-read	Rezervacija - branje	f
00030000-5563-08f9-9bda-27e2d0f575ac	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5563-08f9-5349-af965423c985	Role-read	Role - branje	f
00030000-5563-08f9-86a8-b5df61d84783	Role-write	Role - spreminjanje	f
00030000-5563-08f9-b739-0466c25b1580	SedezniRed-read	SedezniRed - branje	f
00030000-5563-08f9-1560-08bc5fb23dfa	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5563-08f9-24d8-5aa8aa5f8059	Sedez-read	Sedez - branje	f
00030000-5563-08f9-1152-e9ae44ba02bf	Sedez-write	Sedez - spreminjanje	f
00030000-5563-08f9-7741-72692008f7b3	Sezona-read	Sezona - branje	f
00030000-5563-08f9-3326-3c1fdbd51e70	Sezona-write	Sezona - spreminjanje	f
00030000-5563-08f9-adf3-2c8adeb9db08	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5563-08f9-bc8b-1042615a818e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5563-08f9-f0a1-78ec2b521c12	Stevilcenje-read	Stevilcenje - branje	f
00030000-5563-08f9-e497-66062077d0da	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5563-08f9-9b17-9d1e62a71ad8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5563-08f9-ea02-b900c6afcd95	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5563-08f9-79d2-2ad0f58474d1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5563-08f9-3c11-bcbda58ecf01	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5563-08f9-e863-60e2b51c8102	Telefonska-read	Telefonska - branje	f
00030000-5563-08f9-b465-5648aa0cefca	Telefonska-write	Telefonska - spreminjanje	f
00030000-5563-08f9-7d73-daba6c289937	TerminStoritve-read	TerminStoritve - branje	f
00030000-5563-08f9-f881-aeef7b1d5b35	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5563-08f9-72d3-28e2bebb7de6	TipFunkcije-read	TipFunkcije - branje	f
00030000-5563-08f9-146b-176bd30c5736	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5563-08f9-733e-9595b42c22ef	Trr-read	Trr - branje	f
00030000-5563-08f9-02d0-c3a054ad912d	Trr-write	Trr - spreminjanje	f
00030000-5563-08f9-3f79-d752d88693e1	Uprizoritev-read	Uprizoritev - branje	f
00030000-5563-08f9-827c-bd1a0031f168	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5563-08f9-8b4c-d2eb24f20590	User-read	User - branje	f
00030000-5563-08f9-8dc6-bdb5c1c8e149	User-write	User - spreminjanje	f
00030000-5563-08f9-6c0f-c1212ae1d75f	Vaja-read	Vaja - branje	f
00030000-5563-08f9-94d9-cd0ffb81aad8	Vaja-write	Vaja - spreminjanje	f
00030000-5563-08f9-58ea-1910d4296fa2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5563-08f9-fcaa-d736418d22e6	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5563-08f9-c43f-1cee378be515	Zaposlitev-read	Zaposlitev - branje	f
00030000-5563-08f9-04a4-550b9bdf8715	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5563-08f9-29de-fbd67dc1536d	Zasedenost-read	Zasedenost - branje	f
00030000-5563-08f9-099b-bf9d88bec820	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5563-08f9-9211-355b3f1c7b08	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5563-08f9-da25-832f9f44a1ae	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5563-08f9-8e20-8a752d2629fe	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5563-08f9-8cb2-fcdd520d97df	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2698 (class 0 OID 4870105)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5563-08f9-0d14-b1c02cfcff2e	00030000-5563-08f9-f602-e9cb94958715
00020000-5563-08f9-19c6-a14e00f8c145	00030000-5563-08f9-1546-f85b48a8f2ae
00020000-5563-08f9-19c6-a14e00f8c145	00030000-5563-08f9-f602-e9cb94958715
\.


--
-- TOC entry 2726 (class 0 OID 4870394)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2730 (class 0 OID 4870425)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 4870558)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 4870163)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5563-08fa-6e18-d3253ba3a8cd	00040000-5563-08f9-caae-a87697cdf413	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5563-08fa-e391-10e39c72f51a	00040000-5563-08f9-caae-a87697cdf413	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2705 (class 0 OID 4870198)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5563-08f8-b4f5-d7342c5c362e	8341	Adlešiči
00050000-5563-08f8-289d-763b190dd7c5	5270	Ajdovščina
00050000-5563-08f8-a5b4-0e6f00880c22	6280	Ankaran/Ancarano
00050000-5563-08f8-21d8-bb46e9018522	9253	Apače
00050000-5563-08f8-b31c-3dafdeac16c1	8253	Artiče
00050000-5563-08f8-752e-70a8782e5621	4275	Begunje na Gorenjskem
00050000-5563-08f8-8916-678d7e376335	1382	Begunje pri Cerknici
00050000-5563-08f8-5b82-87ebb88a205f	9231	Beltinci
00050000-5563-08f8-d400-ebeea4a3a4ec	2234	Benedikt
00050000-5563-08f8-c834-47ee0fb482c0	2345	Bistrica ob Dravi
00050000-5563-08f8-2d68-493ba41086ce	3256	Bistrica ob Sotli
00050000-5563-08f8-9371-431b932969b7	8259	Bizeljsko
00050000-5563-08f8-bcca-5f66aa2ce9b1	1223	Blagovica
00050000-5563-08f8-bbcf-b7a8614a91bb	8283	Blanca
00050000-5563-08f8-ef4c-853191772d52	4260	Bled
00050000-5563-08f8-6693-9429b098289c	4273	Blejska Dobrava
00050000-5563-08f8-2cc0-08b31db4a081	9265	Bodonci
00050000-5563-08f8-6e52-22e66736ea2b	9222	Bogojina
00050000-5563-08f8-53bf-70fb31ddeb86	4263	Bohinjska Bela
00050000-5563-08f8-a5f3-d7bfafa9af75	4264	Bohinjska Bistrica
00050000-5563-08f8-7b6e-d8e2bc283568	4265	Bohinjsko jezero
00050000-5563-08f8-91b7-19dee2e0e3c5	1353	Borovnica
00050000-5563-08f8-5ba4-127b63eda0c3	8294	Boštanj
00050000-5563-08f8-2827-327cd94bae13	5230	Bovec
00050000-5563-08f8-c1b5-66121953d89b	5295	Branik
00050000-5563-08f8-01ab-faa0ac187fe0	3314	Braslovče
00050000-5563-08f8-a89f-ef1cf96c6a6c	5223	Breginj
00050000-5563-08f8-7d25-52be5ae84fe2	8280	Brestanica
00050000-5563-08f8-bdc4-53b4722bca2e	2354	Bresternica
00050000-5563-08f8-992a-573b1ad21165	4243	Brezje
00050000-5563-08f8-fc5b-46293494a7b9	1351	Brezovica pri Ljubljani
00050000-5563-08f8-32e1-862782650bb8	8250	Brežice
00050000-5563-08f8-be5f-1b96d56c64cc	4210	Brnik - Aerodrom
00050000-5563-08f8-7f01-a7fa47afb761	8321	Brusnice
00050000-5563-08f8-0d0c-931b93f5d93b	3255	Buče
00050000-5563-08f8-f5cb-c36ff968a419	8276	Bučka 
00050000-5563-08f8-b5d7-d3f38c1c2358	9261	Cankova
00050000-5563-08f8-3c12-771340b5c548	3000	Celje 
00050000-5563-08f8-d392-fd9bca772d85	3001	Celje - poštni predali
00050000-5563-08f8-f2b1-f11ac5de008e	4207	Cerklje na Gorenjskem
00050000-5563-08f8-2651-abcdd9bb691b	8263	Cerklje ob Krki
00050000-5563-08f8-772b-832d08291c42	1380	Cerknica
00050000-5563-08f8-1ee5-3c672db4f594	5282	Cerkno
00050000-5563-08f8-908d-04419c791537	2236	Cerkvenjak
00050000-5563-08f8-6ba0-5de9c585b988	2215	Ceršak
00050000-5563-08f8-9343-5e6a29388028	2326	Cirkovce
00050000-5563-08f8-c803-714270a4e9d5	2282	Cirkulane
00050000-5563-08f8-b80b-498fc3320e73	5273	Col
00050000-5563-08f8-f1eb-f9f6fb4e22e0	8251	Čatež ob Savi
00050000-5563-08f8-1813-147b2b19ffec	1413	Čemšenik
00050000-5563-08f8-704c-6d20abb367b0	5253	Čepovan
00050000-5563-08f8-83f8-e314b0fdb796	9232	Črenšovci
00050000-5563-08f8-404e-0f680dbea58b	2393	Črna na Koroškem
00050000-5563-08f8-64c6-f3a2e431d811	6275	Črni Kal
00050000-5563-08f8-0754-53c4bbf3a6df	5274	Črni Vrh nad Idrijo
00050000-5563-08f8-0bc4-433d0ae400cd	5262	Črniče
00050000-5563-08f8-1004-b753cc670ba5	8340	Črnomelj
00050000-5563-08f8-68ad-72ecd725ed9d	6271	Dekani
00050000-5563-08f8-c7fe-c84d5e1dcd05	5210	Deskle
00050000-5563-08f8-8f19-39a64c7a10d3	2253	Destrnik
00050000-5563-08f8-5537-c923d37dcfc2	6215	Divača
00050000-5563-08f8-961c-2531a5b43b69	1233	Dob
00050000-5563-08f8-26ed-601c7d5abcde	3224	Dobje pri Planini
00050000-5563-08f8-9c10-a066eca2cb55	8257	Dobova
00050000-5563-08f8-4bf0-893825237ce8	1423	Dobovec
00050000-5563-08f8-3967-1280f72bc9e3	5263	Dobravlje
00050000-5563-08f8-92c0-a527650907a2	3204	Dobrna
00050000-5563-08f8-cb15-e212fc345792	8211	Dobrnič
00050000-5563-08f8-5dce-332ab4038e83	1356	Dobrova
00050000-5563-08f8-d3b1-e9d2e6825021	9223	Dobrovnik/Dobronak 
00050000-5563-08f8-9a5e-cf3f487ffe26	5212	Dobrovo v Brdih
00050000-5563-08f8-ab8c-e13a777ff269	1431	Dol pri Hrastniku
00050000-5563-08f8-4d4a-ec037c234ad0	1262	Dol pri Ljubljani
00050000-5563-08f8-3110-5c207a103dbb	1273	Dole pri Litiji
00050000-5563-08f8-0034-dedc9de71db6	1331	Dolenja vas
00050000-5563-08f8-c8e8-854ae71cedac	8350	Dolenjske Toplice
00050000-5563-08f8-472c-de0380fbba6e	1230	Domžale
00050000-5563-08f8-55c1-54db9c2fef1a	2252	Dornava
00050000-5563-08f8-2d6a-dbaa1b2086d6	5294	Dornberk
00050000-5563-08f8-9bb0-ab28088a8bb5	1319	Draga
00050000-5563-08f8-cf87-62f7ed3859e8	8343	Dragatuš
00050000-5563-08f8-b18b-cb9a27dbba1b	3222	Dramlje
00050000-5563-08f8-c352-3f355e24185f	2370	Dravograd
00050000-5563-08f8-7843-d90114ba3eca	4203	Duplje
00050000-5563-08f8-9753-e99ffe8c3208	6221	Dutovlje
00050000-5563-08f8-1073-f2245d782caa	8361	Dvor
00050000-5563-08f8-9d84-6598030c61b9	2343	Fala
00050000-5563-08f8-6fb2-b86bb94b282f	9208	Fokovci
00050000-5563-08f8-027e-8f47a03e884c	2313	Fram
00050000-5563-08f8-1761-fb21fadc39b8	3213	Frankolovo
00050000-5563-08f8-2f75-b4c0c7a9b948	1274	Gabrovka
00050000-5563-08f8-8369-6a69d60487eb	8254	Globoko
00050000-5563-08f8-68ef-4fabfa145676	5275	Godovič
00050000-5563-08f8-bf83-0842d29de14f	4204	Golnik
00050000-5563-08f8-e442-3522f334270c	3303	Gomilsko
00050000-5563-08f8-9ac1-d6697d543e34	4224	Gorenja vas
00050000-5563-08f8-948d-2b365fa00037	3263	Gorica pri Slivnici
00050000-5563-08f8-40bb-fda9d6e14877	2272	Gorišnica
00050000-5563-08f8-017c-2db6bcef446b	9250	Gornja Radgona
00050000-5563-08f8-5842-3d5bf6fcae0b	3342	Gornji Grad
00050000-5563-08f8-c7c8-d1a1765f3e9d	4282	Gozd Martuljek
00050000-5563-08f8-1056-df8482dcd533	6272	Gračišče
00050000-5563-08f8-f4c2-ca4314050295	9264	Grad
00050000-5563-08f8-59cb-32e0b2c79d1e	8332	Gradac
00050000-5563-08f8-4a0e-e5a8784738af	1384	Grahovo
00050000-5563-08f8-bb53-492cd5cea4d0	5242	Grahovo ob Bači
00050000-5563-08f8-a3e5-bfc09a5b1465	5251	Grgar
00050000-5563-08f8-7bea-c3e99c45f4b6	3302	Griže
00050000-5563-08f8-734a-7195529984e1	3231	Grobelno
00050000-5563-08f8-b3fd-992b953eee5a	1290	Grosuplje
00050000-5563-08f8-2f3d-3856da5fb622	2288	Hajdina
00050000-5563-08f8-ef3c-cb8a3d76ce8c	8362	Hinje
00050000-5563-08f8-a0a6-791ace8cfecd	2311	Hoče
00050000-5563-08f8-50eb-649e3c4621d8	9205	Hodoš/Hodos
00050000-5563-08f8-2fb3-6632bc1414fc	1354	Horjul
00050000-5563-08f8-5fe2-75f667063701	1372	Hotedršica
00050000-5563-08f8-9a75-06ef8781fbcd	1430	Hrastnik
00050000-5563-08f8-167e-91148f983b2a	6225	Hruševje
00050000-5563-08f8-10a9-b3f793cd5d0e	4276	Hrušica
00050000-5563-08f8-43a3-3ed67a805a24	5280	Idrija
00050000-5563-08f8-be5e-795b6eddc7a6	1292	Ig
00050000-5563-08f8-ecbf-59819dbd4f33	6250	Ilirska Bistrica
00050000-5563-08f8-3366-5109bfef9e75	6251	Ilirska Bistrica-Trnovo
00050000-5563-08f8-5520-3c8962ed0b6b	1295	Ivančna Gorica
00050000-5563-08f8-3ad8-8748ef3e8ecf	2259	Ivanjkovci
00050000-5563-08f8-0059-61cdaed11c77	1411	Izlake
00050000-5563-08f8-d761-42112ec8023b	6310	Izola/Isola
00050000-5563-08f8-2b4f-77beaa35b7d8	2222	Jakobski Dol
00050000-5563-08f8-cfd5-2cf83db7cd07	2221	Jarenina
00050000-5563-08f8-1c65-814da56a8e7f	6254	Jelšane
00050000-5563-08f8-9cf5-a78e32f36b91	4270	Jesenice
00050000-5563-08f8-16a8-fe63706ac880	8261	Jesenice na Dolenjskem
00050000-5563-08f8-a612-d23ad7190c4a	3273	Jurklošter
00050000-5563-08f8-cec7-70aff1cb50b6	2223	Jurovski Dol
00050000-5563-08f8-0e32-9f9a9719b0f6	2256	Juršinci
00050000-5563-08f8-3eff-176f25d020ff	5214	Kal nad Kanalom
00050000-5563-08f8-3810-37da419953c6	3233	Kalobje
00050000-5563-08f8-4267-01bcd0d51a37	4246	Kamna Gorica
00050000-5563-08f8-5b0d-904da3241e1e	2351	Kamnica
00050000-5563-08f8-5896-c5ca9dcc6340	1241	Kamnik
00050000-5563-08f8-9ac2-3867dd8bd76d	5213	Kanal
00050000-5563-08f8-44ec-0bcfb956a552	8258	Kapele
00050000-5563-08f8-3654-b0b9e086d327	2362	Kapla
00050000-5563-08f8-d036-a516e7458d0e	2325	Kidričevo
00050000-5563-08f8-13f4-ac4d95b75bc2	1412	Kisovec
00050000-5563-08f8-22ee-e71797ddf218	6253	Knežak
00050000-5563-08f8-9615-0f5c9ea447ec	5222	Kobarid
00050000-5563-08f8-1d47-5be3c2d2834b	9227	Kobilje
00050000-5563-08f8-2e7a-9c911f4fcfc6	1330	Kočevje
00050000-5563-08f8-116f-694195295eb7	1338	Kočevska Reka
00050000-5563-08f8-2c25-fb07cd4a86bf	2276	Kog
00050000-5563-08f8-3923-2b6875485275	5211	Kojsko
00050000-5563-08f8-c301-c50b89e704f3	6223	Komen
00050000-5563-08f8-8842-310a8c9c4fdf	1218	Komenda
00050000-5563-08f8-b488-c72567dfdc73	6000	Koper/Capodistria 
00050000-5563-08f8-4293-c57190892ace	6001	Koper/Capodistria - poštni predali
00050000-5563-08f8-f401-7c95e2bbcd0e	8282	Koprivnica
00050000-5563-08f8-09e9-81be53b17bd7	5296	Kostanjevica na Krasu
00050000-5563-08f8-9630-a67303a6b78a	8311	Kostanjevica na Krki
00050000-5563-08f8-4c71-4557ff5ae341	1336	Kostel
00050000-5563-08f8-f660-9ddaf0badb22	6256	Košana
00050000-5563-08f8-c71d-0a1e3145690b	2394	Kotlje
00050000-5563-08f8-5a88-cdde281a21bb	6240	Kozina
00050000-5563-08f8-76b0-0b96b197d2f9	3260	Kozje
00050000-5563-08f8-fd5e-0b6e8fee1a30	4000	Kranj 
00050000-5563-08f8-da95-28cfb13b1b63	4001	Kranj - poštni predali
00050000-5563-08f8-b4a4-3f75ddefc0d8	4280	Kranjska Gora
00050000-5563-08f8-1c26-6d04134cf87b	1281	Kresnice
00050000-5563-08f8-362b-c125699e27e9	4294	Križe
00050000-5563-08f8-30bd-89f5793e44d0	9206	Križevci
00050000-5563-08f8-f533-3f0841448955	9242	Križevci pri Ljutomeru
00050000-5563-08f8-c049-8e2284418ace	1301	Krka
00050000-5563-08f8-2427-30cdc186f391	8296	Krmelj
00050000-5563-08f8-5b7c-17a2bad435cf	4245	Kropa
00050000-5563-08f8-a7ef-9329a68ffc3d	8262	Krška vas
00050000-5563-08f8-6586-a1a2ae7b9a68	8270	Krško
00050000-5563-08f8-2468-fe9d9a3c566b	9263	Kuzma
00050000-5563-08f8-3226-53f4993162f8	2318	Laporje
00050000-5563-08f8-0e73-62fbbaf4abf5	3270	Laško
00050000-5563-08f8-ab4b-e2b6a5e747dd	1219	Laze v Tuhinju
00050000-5563-08f8-4e66-ebb18848fcfc	2230	Lenart v Slovenskih goricah
00050000-5563-08f8-05e9-b9f2eaf7bb32	9220	Lendava/Lendva
00050000-5563-08f8-76fa-f4410f2a30f8	4248	Lesce
00050000-5563-08f8-d9ce-a8848ef91cef	3261	Lesično
00050000-5563-08f8-45a6-7e649e700258	8273	Leskovec pri Krškem
00050000-5563-08f8-7ea3-2ecbee8675aa	2372	Libeliče
00050000-5563-08f8-a30a-e2851c76dca9	2341	Limbuš
00050000-5563-08f8-877b-86e47499fb7e	1270	Litija
00050000-5563-08f8-a380-29c5f21ca4e9	3202	Ljubečna
00050000-5563-08f8-99ee-baf1c0f0efd8	1000	Ljubljana 
00050000-5563-08f8-ed2e-eddde15f005a	1001	Ljubljana - poštni predali
00050000-5563-08f8-4749-f8fb530e7ccd	1231	Ljubljana - Črnuče
00050000-5563-08f8-17df-8eb728b38be4	1261	Ljubljana - Dobrunje
00050000-5563-08f8-70d1-653167e08d0a	1260	Ljubljana - Polje
00050000-5563-08f8-2f18-bbb566baf7c7	1210	Ljubljana - Šentvid
00050000-5563-08f8-478d-25babd4fb203	1211	Ljubljana - Šmartno
00050000-5563-08f8-3599-a0e5840f1f1c	3333	Ljubno ob Savinji
00050000-5563-08f8-ad51-4f30b78dfb78	9240	Ljutomer
00050000-5563-08f8-180d-23b23a0d94d1	3215	Loče
00050000-5563-08f8-43f3-4ab1701a8183	5231	Log pod Mangartom
00050000-5563-08f8-509e-31b43bd1297b	1358	Log pri Brezovici
00050000-5563-08f8-1e15-247e5f093100	1370	Logatec
00050000-5563-08f8-2820-5f62958b0b18	1371	Logatec
00050000-5563-08f8-ad8e-963d8ea6ff11	1434	Loka pri Zidanem Mostu
00050000-5563-08f8-9805-e509a694bdea	3223	Loka pri Žusmu
00050000-5563-08f8-2c40-6f4c8d91ddf1	6219	Lokev
00050000-5563-08f8-e7c0-d5e312ad5903	1318	Loški Potok
00050000-5563-08f8-3795-8ea5cf3ab01d	2324	Lovrenc na Dravskem polju
00050000-5563-08f8-500b-2f95d9aa6540	2344	Lovrenc na Pohorju
00050000-5563-08f8-5157-ad4fbb59ed01	3334	Luče
00050000-5563-08f8-0e33-7398828896ab	1225	Lukovica
00050000-5563-08f8-63ce-29813f9e6a41	9202	Mačkovci
00050000-5563-08f8-fd29-12d1cf5b975f	2322	Majšperk
00050000-5563-08f8-af8c-4f0a589fbe7f	2321	Makole
00050000-5563-08f8-8917-e93a73934c51	9243	Mala Nedelja
00050000-5563-08f8-f529-ba92669f03b8	2229	Malečnik
00050000-5563-08f8-9381-ab87eff31adc	6273	Marezige
00050000-5563-08f8-672a-19fb1eb2967e	2000	Maribor 
00050000-5563-08f8-5e72-2a43360f56da	2001	Maribor - poštni predali
00050000-5563-08f8-0701-18df81f6c0c7	2206	Marjeta na Dravskem polju
00050000-5563-08f8-51cc-7836ed99705a	2281	Markovci
00050000-5563-08f8-4c7c-95a110a3f051	9221	Martjanci
00050000-5563-08f8-250a-8baa55a644ac	6242	Materija
00050000-5563-08f8-dbbe-a660aceb6dd6	4211	Mavčiče
00050000-5563-08f8-8696-746dd1d06321	1215	Medvode
00050000-5563-08f8-f15a-90fee3eeaa61	1234	Mengeš
00050000-5563-08f8-aae0-c79201d28e02	8330	Metlika
00050000-5563-08f8-55c5-42c946064182	2392	Mežica
00050000-5563-08f8-13a9-fe353bec986b	2204	Miklavž na Dravskem polju
00050000-5563-08f8-0398-46be4eee2283	2275	Miklavž pri Ormožu
00050000-5563-08f8-ac5d-dadad44e803c	5291	Miren
00050000-5563-08f8-8526-fc24a5264fd3	8233	Mirna
00050000-5563-08f8-a987-778860b2c0ee	8216	Mirna Peč
00050000-5563-08f8-f4e3-2d7e5ff1ec0e	2382	Mislinja
00050000-5563-08f8-2017-9f5cffa844bc	4281	Mojstrana
00050000-5563-08f8-33cd-ae04b113b906	8230	Mokronog
00050000-5563-08f8-0050-dbb3a9c5ee68	1251	Moravče
00050000-5563-08f8-ba0a-bdf4b4941560	9226	Moravske Toplice
00050000-5563-08f8-d2d4-06643898e08c	5216	Most na Soči
00050000-5563-08f8-55ca-374a5c0875cf	1221	Motnik
00050000-5563-08f8-5c4e-ff75cbdfe9d2	3330	Mozirje
00050000-5563-08f8-8406-2fa00272a665	9000	Murska Sobota 
00050000-5563-08f8-7373-9185ee50ad04	9001	Murska Sobota - poštni predali
00050000-5563-08f8-e7c6-64558a83dcf9	2366	Muta
00050000-5563-08f8-9087-8debf134d48e	4202	Naklo
00050000-5563-08f8-a89c-0a34b999dfb9	3331	Nazarje
00050000-5563-08f8-a7c4-f09d580b7b0c	1357	Notranje Gorice
00050000-5563-08f8-2332-3f1e191c26ae	3203	Nova Cerkev
00050000-5563-08f8-90f9-48965a5228cc	5000	Nova Gorica 
00050000-5563-08f8-8047-9ecb48bc6b02	5001	Nova Gorica - poštni predali
00050000-5563-08f8-37e7-29ff75703b90	1385	Nova vas
00050000-5563-08f8-a2a3-24168c572de1	8000	Novo mesto
00050000-5563-08f8-0f85-d8e9deefc9b0	8001	Novo mesto - poštni predali
00050000-5563-08f8-f94b-e4bf86cc6cec	6243	Obrov
00050000-5563-08f8-43db-7108a07dc523	9233	Odranci
00050000-5563-08f8-8335-ba821df3fef3	2317	Oplotnica
00050000-5563-08f8-421e-e5373bb6c448	2312	Orehova vas
00050000-5563-08f8-54ea-3f16069fdc5a	2270	Ormož
00050000-5563-08f8-7524-102e3450b49e	1316	Ortnek
00050000-5563-08f8-d08a-2dfd2dddbef9	1337	Osilnica
00050000-5563-08f8-09eb-9c61031a51d2	8222	Otočec
00050000-5563-08f8-bb08-86a65ee69b77	2361	Ožbalt
00050000-5563-08f8-f242-c79099c8fde2	2231	Pernica
00050000-5563-08f8-d617-4ade5f378eb3	2211	Pesnica pri Mariboru
00050000-5563-08f8-2aae-8bb373984bfc	9203	Petrovci
00050000-5563-08f8-5e28-2c9988e0c2c8	3301	Petrovče
00050000-5563-08f8-71e1-735cf2de5068	6330	Piran/Pirano
00050000-5563-08f8-b1a7-80f0c8507db4	8255	Pišece
00050000-5563-08f8-7896-034d29ac550f	6257	Pivka
00050000-5563-08f8-ae3d-9d52b2070605	6232	Planina
00050000-5563-08f8-a3a4-5f3cdeb4f549	3225	Planina pri Sevnici
00050000-5563-08f8-882c-c3a0a8e1c9df	6276	Pobegi
00050000-5563-08f8-03a3-981c613ff205	8312	Podbočje
00050000-5563-08f8-945d-8d3c584024af	5243	Podbrdo
00050000-5563-08f8-7e3f-cf0774ca2ae2	3254	Podčetrtek
00050000-5563-08f8-93d8-f318ec3a5b0f	2273	Podgorci
00050000-5563-08f8-4cd2-963e188da6de	6216	Podgorje
00050000-5563-08f8-e131-06d21f34cfc5	2381	Podgorje pri Slovenj Gradcu
00050000-5563-08f8-5aa9-931793e20080	6244	Podgrad
00050000-5563-08f8-5ce2-9c4049e087d4	1414	Podkum
00050000-5563-08f8-b94a-93f90c3908c0	2286	Podlehnik
00050000-5563-08f8-c917-05ca4ad7195b	5272	Podnanos
00050000-5563-08f8-1a99-61b74f0de475	4244	Podnart
00050000-5563-08f8-05aa-111f281417bf	3241	Podplat
00050000-5563-08f8-788b-213c6063b5f0	3257	Podsreda
00050000-5563-08f8-1034-8f995c5aa12c	2363	Podvelka
00050000-5563-08f8-7ae1-daf4ceee0d42	2208	Pohorje
00050000-5563-08f8-844d-707790afa49c	2257	Polenšak
00050000-5563-08f8-467f-ba8b22db42f9	1355	Polhov Gradec
00050000-5563-08f8-3b1c-b58edddd7a6b	4223	Poljane nad Škofjo Loko
00050000-5563-08f8-fadb-9198f853bd24	2319	Poljčane
00050000-5563-08f8-5890-6a2678852e43	1272	Polšnik
00050000-5563-08f8-c786-6a3065e9359c	3313	Polzela
00050000-5563-08f8-cd12-b78fe7f66a58	3232	Ponikva
00050000-5563-08f8-e161-a88e5515cfba	6320	Portorož/Portorose
00050000-5563-08f8-d682-f74733a80fb4	6230	Postojna
00050000-5563-08f8-a9bb-40019278d5b3	2331	Pragersko
00050000-5563-08f8-bbbe-bc9438b4f88b	3312	Prebold
00050000-5563-08f8-a549-934cc89b83c7	4205	Preddvor
00050000-5563-08f8-6246-afccdf98f82e	6255	Prem
00050000-5563-08f8-a8af-cf4a079bbc74	1352	Preserje
00050000-5563-08f8-08a8-7f1eaf8bb067	6258	Prestranek
00050000-5563-08f8-e977-d0fb96c301f1	2391	Prevalje
00050000-5563-08f8-9879-fd2df22bfadf	3262	Prevorje
00050000-5563-08f8-bcfc-e98282a42a4b	1276	Primskovo 
00050000-5563-08f8-8d38-3973df15010f	3253	Pristava pri Mestinju
00050000-5563-08f8-2b21-0b36c87691ed	9207	Prosenjakovci/Partosfalva
00050000-5563-08f8-45d5-15ae996099ae	5297	Prvačina
00050000-5563-08f8-8582-7a0d887d7b1f	2250	Ptuj
00050000-5563-08f8-c757-a7f673b3e052	2323	Ptujska Gora
00050000-5563-08f8-7fec-e9314ebeb996	9201	Puconci
00050000-5563-08f8-2d03-40c3de3868c1	2327	Rače
00050000-5563-08f8-64c6-ea5d0df3ea20	1433	Radeče
00050000-5563-08f8-9112-67c3e70b4099	9252	Radenci
00050000-5563-08f8-ff14-2b3f53707ab1	2360	Radlje ob Dravi
00050000-5563-08f8-9fda-9126cfdb7529	1235	Radomlje
00050000-5563-08f8-68fc-552832ea98d1	4240	Radovljica
00050000-5563-08f8-39f1-06061ac8e8ed	8274	Raka
00050000-5563-08f8-bb9a-772f3f83d796	1381	Rakek
00050000-5563-08f8-7374-cee0ae977dce	4283	Rateče - Planica
00050000-5563-08f8-b7fd-3186b398f0da	2390	Ravne na Koroškem
00050000-5563-08f8-47e6-8293abe9893a	9246	Razkrižje
00050000-5563-08f8-18d1-348036dd8e2e	3332	Rečica ob Savinji
00050000-5563-08f8-b8d5-56c3e553dc0b	5292	Renče
00050000-5563-08f8-7fea-36f12357022c	1310	Ribnica
00050000-5563-08f8-c639-dbc8ef930476	2364	Ribnica na Pohorju
00050000-5563-08f8-5420-c5ab2b9693d6	3272	Rimske Toplice
00050000-5563-08f8-5e09-809d013b21e3	1314	Rob
00050000-5563-08f8-e039-4b25e330007d	5215	Ročinj
00050000-5563-08f8-9d30-e061ce95eed2	3250	Rogaška Slatina
00050000-5563-08f8-84f7-7949a15dd959	9262	Rogašovci
00050000-5563-08f8-f51a-d46c27d0f5d1	3252	Rogatec
00050000-5563-08f8-a3d6-f681f2a2e068	1373	Rovte
00050000-5563-08f8-0389-25746cd1ab14	2342	Ruše
00050000-5563-08f8-69c6-27a4d8072a0e	1282	Sava
00050000-5563-08f8-b1a5-ed5518b3f97f	6333	Sečovlje/Sicciole
00050000-5563-08f8-6c53-15ce3bfcfc2e	4227	Selca
00050000-5563-08f8-51e2-82b4d16b03d7	2352	Selnica ob Dravi
00050000-5563-08f8-3eb2-2dcb0af77ea0	8333	Semič
00050000-5563-08f8-cdf5-8dabb3aa8f6f	8281	Senovo
00050000-5563-08f8-fa11-d592a74d82cf	6224	Senožeče
00050000-5563-08f8-73a1-338272deed5f	8290	Sevnica
00050000-5563-08f8-fd98-166b7a999ee5	6210	Sežana
00050000-5563-08f8-2733-3f7c0fc0aefb	2214	Sladki Vrh
00050000-5563-08f8-bffe-638ae03c77cd	5283	Slap ob Idrijci
00050000-5563-08f8-d9f5-36348c2226a6	2380	Slovenj Gradec
00050000-5563-08f8-2772-33c97e0c44e2	2310	Slovenska Bistrica
00050000-5563-08f8-0ca2-6a9acfdf2d30	3210	Slovenske Konjice
00050000-5563-08f8-1c46-3c7fc7700783	1216	Smlednik
00050000-5563-08f8-e98d-6ccd1fce4ee2	5232	Soča
00050000-5563-08f8-23f5-c4466201988d	1317	Sodražica
00050000-5563-08f8-adce-20aebe1f01dc	3335	Solčava
00050000-5563-08f8-2d19-20bb32126b3b	5250	Solkan
00050000-5563-08f8-1d6c-cc721070b054	4229	Sorica
00050000-5563-08f8-a530-1bc24afe3c2e	4225	Sovodenj
00050000-5563-08f8-63be-f8f8bcfbab5a	5281	Spodnja Idrija
00050000-5563-08f8-49f3-ff92ba5040d2	2241	Spodnji Duplek
00050000-5563-08f8-6db1-b1243d1becd8	9245	Spodnji Ivanjci
00050000-5563-08f8-d66a-dc858ceb9f7c	2277	Središče ob Dravi
00050000-5563-08f8-0fb9-f00dcf068b54	4267	Srednja vas v Bohinju
00050000-5563-08f8-6f10-6249b90a2bd3	8256	Sromlje 
00050000-5563-08f8-361f-d3b932c3dba2	5224	Srpenica
00050000-5563-08f8-b01d-b99d7e124c36	1242	Stahovica
00050000-5563-08f8-f475-9f3ef3cb9fde	1332	Stara Cerkev
00050000-5563-08f8-7055-ae8cbbcebfd0	8342	Stari trg ob Kolpi
00050000-5563-08f8-49ef-235cee2d3ec5	1386	Stari trg pri Ložu
00050000-5563-08f8-718e-60742156db0e	2205	Starše
00050000-5563-08f8-eff4-56990376b653	2289	Stoperce
00050000-5563-08f8-51f7-fa93b12a9ddb	8322	Stopiče
00050000-5563-08f8-c04d-c4d7d17338ed	3206	Stranice
00050000-5563-08f8-5ddd-ae17d4c287f2	8351	Straža
00050000-5563-08f8-b315-e3861837dbfd	1313	Struge
00050000-5563-08f8-1255-45dbbbb4203a	8293	Studenec
00050000-5563-08f8-7253-ab8ee5a53a55	8331	Suhor
00050000-5563-08f8-6cf8-c0668411ef6c	2233	Sv. Ana v Slovenskih goricah
00050000-5563-08f8-6a1f-80c0eff0c8c4	2235	Sv. Trojica v Slovenskih goricah
00050000-5563-08f8-287a-fdd0a769a06f	2353	Sveti Duh na Ostrem Vrhu
00050000-5563-08f8-7439-368be7b41315	9244	Sveti Jurij ob Ščavnici
00050000-5563-08f8-9523-b7c002540e44	3264	Sveti Štefan
00050000-5563-08f8-be3f-17e409949e3f	2258	Sveti Tomaž
00050000-5563-08f8-eb16-3d9513ce43cf	9204	Šalovci
00050000-5563-08f8-d9e7-7c70d8919066	5261	Šempas
00050000-5563-08f8-cb01-4a2021b63351	5290	Šempeter pri Gorici
00050000-5563-08f8-4f01-8b479305aae4	3311	Šempeter v Savinjski dolini
00050000-5563-08f8-dc89-01611b5db7e2	4208	Šenčur
00050000-5563-08f8-1043-b0f46cdfe3e2	2212	Šentilj v Slovenskih goricah
00050000-5563-08f8-9fcd-791c9f2f90a0	8297	Šentjanž
00050000-5563-08f8-4066-b032e72fd55d	2373	Šentjanž pri Dravogradu
00050000-5563-08f8-3508-73ca5199dca9	8310	Šentjernej
00050000-5563-08f8-f4ad-27602a824d01	3230	Šentjur
00050000-5563-08f8-a79f-83f2cc86720c	3271	Šentrupert
00050000-5563-08f8-228f-b49df61bd20b	8232	Šentrupert
00050000-5563-08f8-e038-53e7728df555	1296	Šentvid pri Stični
00050000-5563-08f8-dc9c-287ff1f5352b	8275	Škocjan
00050000-5563-08f8-b3eb-2378bc0313e3	6281	Škofije
00050000-5563-08f8-f0c8-85d71709fc72	4220	Škofja Loka
00050000-5563-08f8-6a31-99ff6c30bb1f	3211	Škofja vas
00050000-5563-08f8-24cf-29104ce2d16c	1291	Škofljica
00050000-5563-08f8-2544-e683f66e48e5	6274	Šmarje
00050000-5563-08f8-b555-7010ff646bd6	1293	Šmarje - Sap
00050000-5563-08f8-3745-4acc00044af6	3240	Šmarje pri Jelšah
00050000-5563-08f8-7196-9d703c588a74	8220	Šmarješke Toplice
00050000-5563-08f8-ffc1-a745e065d9cb	2315	Šmartno na Pohorju
00050000-5563-08f8-7cb0-ef25e6112f43	3341	Šmartno ob Dreti
00050000-5563-08f8-0677-33f1ed2302b7	3327	Šmartno ob Paki
00050000-5563-08f8-7392-0384f070eeed	1275	Šmartno pri Litiji
00050000-5563-08f8-e65f-abf1e9994e9d	2383	Šmartno pri Slovenj Gradcu
00050000-5563-08f8-8105-63f172caa3a6	3201	Šmartno v Rožni dolini
00050000-5563-08f8-b9ec-d0a6f74c8430	3325	Šoštanj
00050000-5563-08f8-6831-89b6c326db29	6222	Štanjel
00050000-5563-08f8-b52c-66fc44860d0b	3220	Štore
00050000-5563-08f8-51f5-6c339725546b	3304	Tabor
00050000-5563-08f8-1b48-c439c1c201bb	3221	Teharje
00050000-5563-08f8-bff3-16de1872dfc4	9251	Tišina
00050000-5563-08f8-b3f2-e87340da9fad	5220	Tolmin
00050000-5563-08f8-c223-73cd8d9f31aa	3326	Topolšica
00050000-5563-08f8-0792-e2087fc34a0a	2371	Trbonje
00050000-5563-08f8-26c5-92d9c9c3597e	1420	Trbovlje
00050000-5563-08f8-33ca-41be4074858d	8231	Trebelno 
00050000-5563-08f8-8cf7-a712fb79b730	8210	Trebnje
00050000-5563-08f8-cb1a-d3ae354019b5	5252	Trnovo pri Gorici
00050000-5563-08f8-a757-152c923d391e	2254	Trnovska vas
00050000-5563-08f8-1abe-f75f23eb2179	1222	Trojane
00050000-5563-08f8-906c-cc01bf5bfd0c	1236	Trzin
00050000-5563-08f8-3c58-ba6f3311417e	4290	Tržič
00050000-5563-08f8-7fee-2b19457504de	8295	Tržišče
00050000-5563-08f8-58a3-44f7b172b73b	1311	Turjak
00050000-5563-08f8-3698-0b59ce98f14f	9224	Turnišče
00050000-5563-08f8-d6dd-eea510645dd6	8323	Uršna sela
00050000-5563-08f8-d4c9-ade4702a96df	1252	Vače
00050000-5563-08f8-aa72-550337220b48	3320	Velenje 
00050000-5563-08f8-4588-42f362107f23	3322	Velenje - poštni predali
00050000-5563-08f8-8b36-3e4135eb49cc	8212	Velika Loka
00050000-5563-08f8-1ab7-85bee7661edb	2274	Velika Nedelja
00050000-5563-08f8-f44d-9f08cc32da95	9225	Velika Polana
00050000-5563-08f8-4d53-35498d646a56	1315	Velike Lašče
00050000-5563-08f8-4e9d-e5589a779d00	8213	Veliki Gaber
00050000-5563-08f8-5a5f-0293a2d4e7b9	9241	Veržej
00050000-5563-08f8-d932-d626be90ad99	1312	Videm - Dobrepolje
00050000-5563-08f8-cc6c-dbbe3dd8153f	2284	Videm pri Ptuju
00050000-5563-08f8-36fb-3ae7515d7d8a	8344	Vinica
00050000-5563-08f8-0819-c189e29fe2ae	5271	Vipava
00050000-5563-08f8-e9b8-097100666c2b	4212	Visoko
00050000-5563-08f8-37d8-6c1f914a2693	1294	Višnja Gora
00050000-5563-08f8-16d1-c3ef8b032c48	3205	Vitanje
00050000-5563-08f8-b325-239d38443b30	2255	Vitomarci
00050000-5563-08f8-8e19-319e83daaa02	1217	Vodice
00050000-5563-08f8-8aaa-e47d724dbb68	3212	Vojnik\t
00050000-5563-08f8-cf2d-03961a96366f	5293	Volčja Draga
00050000-5563-08f8-5086-bad0a504a5a7	2232	Voličina
00050000-5563-08f8-39ab-fd60e269ade8	3305	Vransko
00050000-5563-08f8-fa52-3220ab9fe93e	6217	Vremski Britof
00050000-5563-08f8-c4c5-9f8866a88e23	1360	Vrhnika
00050000-5563-08f8-6d02-f3afcae03442	2365	Vuhred
00050000-5563-08f8-e655-6f39f622ba21	2367	Vuzenica
00050000-5563-08f8-2200-34ada36ea0d8	8292	Zabukovje 
00050000-5563-08f8-410f-e0bf846d747e	1410	Zagorje ob Savi
00050000-5563-08f8-4397-2c25581c67a7	1303	Zagradec
00050000-5563-08f8-b73e-1915a56a317c	2283	Zavrč
00050000-5563-08f8-d71b-6c199c3b404a	8272	Zdole 
00050000-5563-08f8-6351-599affeab5d3	4201	Zgornja Besnica
00050000-5563-08f8-3f57-d667c97e061e	2242	Zgornja Korena
00050000-5563-08f8-4b8b-9eb56dd8ef31	2201	Zgornja Kungota
00050000-5563-08f8-2083-225b3a4e21a8	2316	Zgornja Ložnica
00050000-5563-08f8-a4e3-5ca1dded4e6f	2314	Zgornja Polskava
00050000-5563-08f8-02c4-e15d55fe3335	2213	Zgornja Velka
00050000-5563-08f8-199b-0a9e4ca1a562	4247	Zgornje Gorje
00050000-5563-08f8-f4d9-9b3b9f1fdffa	4206	Zgornje Jezersko
00050000-5563-08f8-8a67-32fff9474afc	2285	Zgornji Leskovec
00050000-5563-08f8-cfd3-fdc70628e03c	1432	Zidani Most
00050000-5563-08f8-bc12-4a3da16df3ec	3214	Zreče
00050000-5563-08f8-12d2-43f889ae0ea9	4209	Žabnica
00050000-5563-08f8-0c10-f9d56b7d99b5	3310	Žalec
00050000-5563-08f8-9065-3e88b9d317a6	4228	Železniki
00050000-5563-08f8-c0eb-19ae0e3bd076	2287	Žetale
00050000-5563-08f8-3e8f-fbcbc489e42e	4226	Žiri
00050000-5563-08f8-fa99-2ad50fc1496f	4274	Žirovnica
00050000-5563-08f8-48ce-0a50716ca7c2	8360	Žužemberk
\.


--
-- TOC entry 2722 (class 0 OID 4870368)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2690 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 4870183)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 4870261)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 4870380)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 4870500)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 4870551)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 4870409)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 4870353)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 4870343)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 4870540)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 4870477)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 4870057)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5563-08f9-7d82-7e8759eb0816	00010000-5563-08f9-06b4-d8c71ec4c352	2015-05-25 13:35:22	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO6Cp//VwJxz2uuHvzBKO63b2PDlhBMzC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2729 (class 0 OID 4870419)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 4870095)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5563-08f9-827a-dc14c5d8cd53	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5563-08f9-468f-15652999f29f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5563-08f9-0d14-b1c02cfcff2e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5563-08f9-6518-a655e07e79b4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5563-08f9-f329-3b01af247585	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5563-08f9-19c6-a14e00f8c145	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2695 (class 0 OID 4870079)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5563-08f9-7d82-7e8759eb0816	00020000-5563-08f9-6518-a655e07e79b4
00010000-5563-08f9-06b4-d8c71ec4c352	00020000-5563-08f9-6518-a655e07e79b4
\.


--
-- TOC entry 2731 (class 0 OID 4870433)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 4870374)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 4870324)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2749 (class 0 OID 4870646)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5563-08f8-62a5-4575d2df72f4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5563-08f8-491d-65a0131cceb3	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5563-08f8-db0a-1e6a9105940a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5563-08f8-3e46-3bbd8dbde922	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5563-08f8-a087-a006fb14823c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2748 (class 0 OID 4870639)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5563-08f9-b2d1-c493da164518	00000000-5563-08f8-3e46-3bbd8dbde922	popa
00000000-5563-08f9-0b7a-30bbe1a59383	00000000-5563-08f8-3e46-3bbd8dbde922	oseba
00000000-5563-08f9-8cf2-2f57037202b6	00000000-5563-08f8-491d-65a0131cceb3	prostor
00000000-5563-08f9-ad7c-1e6c5c91da44	00000000-5563-08f8-3e46-3bbd8dbde922	besedilo
00000000-5563-08f9-c13f-bd5b07f366d2	00000000-5563-08f8-3e46-3bbd8dbde922	uprizoritev
00000000-5563-08f9-3812-ce9267744e10	00000000-5563-08f8-3e46-3bbd8dbde922	funkcija
00000000-5563-08f9-6ad0-da70c4ec29a8	00000000-5563-08f8-3e46-3bbd8dbde922	tipfunkcije
\.


--
-- TOC entry 2747 (class 0 OID 4870634)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 4870487)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 231
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2702 (class 0 OID 4870155)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 4870330)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 4870529)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5563-08f8-371b-c1a445152a7a	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5563-08f8-4c8a-bfb52018a699	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5563-08f8-56ee-2d181ec89f4d	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5563-08f8-5720-5ae5b0c00e43	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5563-08f8-c8f1-49da076ac49f	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5563-08f8-780b-1f6d598ef7f5	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5563-08f8-8528-46eef1f87b7c	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5563-08f8-a517-fb8a33e57ceb	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5563-08f8-19c0-4c3c48b9e284	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5563-08f8-32b9-d7ce30909357	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5563-08f8-25d7-1019daa6b95f	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5563-08f8-336d-0a1b3285f9c4	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5563-08f8-c379-9eaa32ad482c	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5563-08f8-4d9e-21bb9bf1eb48	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5563-08f8-cccc-e8f9e972c9c1	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5563-08f8-9278-b0b10d071430	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2707 (class 0 OID 4870218)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 4870066)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5563-08f9-06b4-d8c71ec4c352	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROZF8E9zJUht0QfT6Bx4/UqbaXsUtRhKO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5563-08f9-7d82-7e8759eb0816	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 4870584)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 4870276)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2727 (class 0 OID 4870401)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 4870469)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 4870308)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 4870574)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2733 (class 0 OID 4870459)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2315 (class 2606 OID 4870120)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 4870628)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 4870618)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 4870528)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 4870298)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 4870323)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 4870244)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 4870455)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 4870274)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 4870317)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 4870258)
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
-- TOC entry 2406 (class 2606 OID 4870366)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 4870393)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4870216)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4870129)
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
-- TOC entry 2322 (class 2606 OID 4870152)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 4870109)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 4870094)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 4870399)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4870432)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 4870569)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 4870180)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 4870204)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 4870372)
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
-- TOC entry 2336 (class 2606 OID 4870194)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 4870265)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 4870384)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 4870512)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 4870556)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4870416)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 4870357)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4870348)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 4870550)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 4870484)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4870065)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4870423)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4870083)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 4870103)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 4870441)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 4870379)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 4870329)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 4870652)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 4870643)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 4870638)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 4870497)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 4870160)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 4870339)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 4870539)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4870229)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4870078)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 4870599)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 4870283)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 4870407)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 4870475)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4870312)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 4870583)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 4870468)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 1259 OID 4870305)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 4870498)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2454 (class 1259 OID 4870499)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2328 (class 1259 OID 4870182)
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
-- TOC entry 2419 (class 1259 OID 4870400)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2413 (class 1259 OID 4870386)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 4870385)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2365 (class 1259 OID 4870284)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 4870458)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2442 (class 1259 OID 4870456)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 4870457)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2353 (class 1259 OID 4870260)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2354 (class 1259 OID 4870259)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 4870571)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 4870572)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2472 (class 1259 OID 4870573)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2478 (class 1259 OID 4870603)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2479 (class 1259 OID 4870600)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2480 (class 1259 OID 4870602)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2481 (class 1259 OID 4870601)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2343 (class 1259 OID 4870231)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2344 (class 1259 OID 4870230)
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
-- TOC entry 2320 (class 1259 OID 4870154)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2429 (class 1259 OID 4870424)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2383 (class 1259 OID 4870318)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 4870110)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 4870111)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2434 (class 1259 OID 4870444)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2435 (class 1259 OID 4870443)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2436 (class 1259 OID 4870442)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2357 (class 1259 OID 4870266)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2358 (class 1259 OID 4870268)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2359 (class 1259 OID 4870267)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2497 (class 1259 OID 4870645)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2393 (class 1259 OID 4870352)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2394 (class 1259 OID 4870350)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2395 (class 1259 OID 4870349)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2396 (class 1259 OID 4870351)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 4870084)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 4870085)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2422 (class 1259 OID 4870408)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2408 (class 1259 OID 4870373)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2449 (class 1259 OID 4870485)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2450 (class 1259 OID 4870486)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2332 (class 1259 OID 4870196)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2333 (class 1259 OID 4870195)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2334 (class 1259 OID 4870197)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2457 (class 1259 OID 4870513)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2458 (class 1259 OID 4870514)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2490 (class 1259 OID 4870631)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 4870630)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2492 (class 1259 OID 4870633)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2493 (class 1259 OID 4870629)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2494 (class 1259 OID 4870632)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2446 (class 1259 OID 4870476)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2399 (class 1259 OID 4870361)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2400 (class 1259 OID 4870360)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2401 (class 1259 OID 4870358)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2402 (class 1259 OID 4870359)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 4870620)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 4870619)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2364 (class 1259 OID 4870275)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 4870131)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 4870130)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2324 (class 1259 OID 4870161)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2325 (class 1259 OID 4870162)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 4870342)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 4870341)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2390 (class 1259 OID 4870340)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2371 (class 1259 OID 4870307)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2372 (class 1259 OID 4870303)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2373 (class 1259 OID 4870300)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2374 (class 1259 OID 4870301)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2375 (class 1259 OID 4870299)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2376 (class 1259 OID 4870304)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2377 (class 1259 OID 4870302)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2331 (class 1259 OID 4870181)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 4870245)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 4870247)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2351 (class 1259 OID 4870246)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2352 (class 1259 OID 4870248)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2407 (class 1259 OID 4870367)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2475 (class 1259 OID 4870570)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 4870153)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 4870653)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 4870217)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 4870644)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2427 (class 1259 OID 4870418)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2428 (class 1259 OID 4870417)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2339 (class 1259 OID 4870205)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 4870557)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 4870104)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2378 (class 1259 OID 4870306)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2529 (class 2606 OID 4870791)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2532 (class 2606 OID 4870776)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2531 (class 2606 OID 4870781)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2527 (class 2606 OID 4870801)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2533 (class 2606 OID 4870771)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2528 (class 2606 OID 4870796)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2530 (class 2606 OID 4870786)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2563 (class 2606 OID 4870946)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2562 (class 2606 OID 4870951)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 4870706)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2550 (class 2606 OID 4870886)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2548 (class 2606 OID 4870881)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2549 (class 2606 OID 4870876)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2526 (class 2606 OID 4870766)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 4870926)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2558 (class 2606 OID 4870916)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 4870921)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2520 (class 2606 OID 4870741)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2521 (class 2606 OID 4870736)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2546 (class 2606 OID 4870866)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2569 (class 2606 OID 4870971)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2568 (class 2606 OID 4870976)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2567 (class 2606 OID 4870981)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2570 (class 2606 OID 4871001)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2573 (class 2606 OID 4870986)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2571 (class 2606 OID 4870996)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2572 (class 2606 OID 4870991)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2518 (class 2606 OID 4870731)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 4870726)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 4870691)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2511 (class 2606 OID 4870686)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2552 (class 2606 OID 4870896)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2534 (class 2606 OID 4870806)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 4870666)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2506 (class 2606 OID 4870671)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2553 (class 2606 OID 4870911)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2554 (class 2606 OID 4870906)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2555 (class 2606 OID 4870901)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2524 (class 2606 OID 4870746)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2522 (class 2606 OID 4870756)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2523 (class 2606 OID 4870751)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2581 (class 2606 OID 4871041)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2538 (class 2606 OID 4870841)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2540 (class 2606 OID 4870831)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2541 (class 2606 OID 4870826)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2539 (class 2606 OID 4870836)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 4870656)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2504 (class 2606 OID 4870661)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2551 (class 2606 OID 4870891)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2547 (class 2606 OID 4870871)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2561 (class 2606 OID 4870936)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2560 (class 2606 OID 4870941)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 4870716)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2517 (class 2606 OID 4870711)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 4870721)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 4870956)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2564 (class 2606 OID 4870961)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2578 (class 2606 OID 4871026)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2579 (class 2606 OID 4871021)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2576 (class 2606 OID 4871036)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2580 (class 2606 OID 4871016)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2577 (class 2606 OID 4871031)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2559 (class 2606 OID 4870931)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2542 (class 2606 OID 4870861)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2543 (class 2606 OID 4870856)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2545 (class 2606 OID 4870846)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2544 (class 2606 OID 4870851)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2574 (class 2606 OID 4871011)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2575 (class 2606 OID 4871006)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2525 (class 2606 OID 4870761)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 4870966)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 4870681)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 4870676)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2513 (class 2606 OID 4870696)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 4870701)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2535 (class 2606 OID 4870821)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2536 (class 2606 OID 4870816)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2537 (class 2606 OID 4870811)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-25 13:35:22 CEST

--
-- PostgreSQL database dump complete
--

