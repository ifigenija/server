--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-28 13:37:41 CEST

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
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 231
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 5417060)
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
-- TOC entry 227 (class 1259 OID 5417571)
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
-- TOC entry 226 (class 1259 OID 5417554)
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
-- TOC entry 219 (class 1259 OID 5417464)
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
-- TOC entry 194 (class 1259 OID 5417234)
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
-- TOC entry 197 (class 1259 OID 5417268)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5417181)
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
-- TOC entry 213 (class 1259 OID 5417394)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    vodjaekipe boolean,
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
-- TOC entry 192 (class 1259 OID 5417218)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5417262)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5417198)
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
-- TOC entry 202 (class 1259 OID 5417311)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5417336)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5417155)
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
-- TOC entry 181 (class 1259 OID 5417069)
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
-- TOC entry 182 (class 1259 OID 5417080)
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
-- TOC entry 177 (class 1259 OID 5417034)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5417053)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5417343)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5417374)
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
-- TOC entry 223 (class 1259 OID 5417507)
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
-- TOC entry 184 (class 1259 OID 5417112)
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
-- TOC entry 186 (class 1259 OID 5417147)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5417317)
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
-- TOC entry 185 (class 1259 OID 5417132)
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
-- TOC entry 191 (class 1259 OID 5417210)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5417329)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5417449)
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
-- TOC entry 222 (class 1259 OID 5417500)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5417358)
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
-- TOC entry 201 (class 1259 OID 5417302)
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
-- TOC entry 200 (class 1259 OID 5417292)
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
-- TOC entry 221 (class 1259 OID 5417489)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5417426)
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
-- TOC entry 174 (class 1259 OID 5417005)
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
-- TOC entry 173 (class 1259 OID 5417003)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 5417368)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5417043)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5417027)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5417382)
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
-- TOC entry 204 (class 1259 OID 5417323)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5417273)
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
-- TOC entry 230 (class 1259 OID 5417597)
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
-- TOC entry 229 (class 1259 OID 5417590)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5417585)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5417436)
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
-- TOC entry 183 (class 1259 OID 5417104)
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
-- TOC entry 199 (class 1259 OID 5417279)
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
-- TOC entry 220 (class 1259 OID 5417478)
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
-- TOC entry 188 (class 1259 OID 5417167)
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
-- TOC entry 175 (class 1259 OID 5417014)
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
-- TOC entry 225 (class 1259 OID 5417533)
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
-- TOC entry 193 (class 1259 OID 5417225)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5417350)
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
-- TOC entry 215 (class 1259 OID 5417418)
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
-- TOC entry 195 (class 1259 OID 5417257)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5417523)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5417408)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2144 (class 2604 OID 5417008)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2699 (class 0 OID 5417060)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5417571)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5566-fe04-d715-42e8c5e96042	000d0000-5566-fe04-9181-af4110d65b68	\N	00090000-5566-fe04-a677-2ae8c6bc6e31	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5566-fe04-f07c-237d9f5c1251	000d0000-5566-fe04-233e-bbe481128bb1	\N	00090000-5566-fe04-08d7-07c8b4e3c16b	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-5566-fe04-4304-5e1d27de969f	000d0000-5566-fe04-291d-6a47803dc586	\N	00090000-5566-fe04-6648-287d2aa87969	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-5566-fe04-5d20-137ad5b06c22	000d0000-5566-fe04-ff7b-8855c7f91bb4	\N	00090000-5566-fe04-4d45-8c77c11f6640	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5417554)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5417464)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5566-fe04-2ee4-0d3de5307d1b	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5566-fe04-bfae-6ec35d72fdcb	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5566-fe04-bb6c-63e2b8c925ea	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2713 (class 0 OID 5417234)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5566-fe04-5c9e-669985aa84bf	\N	\N	00200000-5566-fe04-66cc-03f3e633af71	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-5566-fe04-8242-a8b329033445	\N	\N	00200000-5566-fe04-6089-412ad73ec2ad	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
\.


--
-- TOC entry 2716 (class 0 OID 5417268)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5417181)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5566-fe03-c2e4-bd17be7e03ef	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5566-fe03-76d6-490742eb2d09	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5566-fe03-1c57-778db537730d	AL	ALB	008	Albania 	Albanija	\N
00040000-5566-fe03-0bb8-0953c91c4bd0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5566-fe03-3404-b3ee82fdc043	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5566-fe03-b5b8-60549d268110	AD	AND	020	Andorra 	Andora	\N
00040000-5566-fe03-6db2-0782c9dc8457	AO	AGO	024	Angola 	Angola	\N
00040000-5566-fe03-3a58-5c6b2baa638d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5566-fe03-cb21-48d7f048f088	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5566-fe03-45b6-3a3a71cfbbe7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5566-fe03-74c7-401add485fbc	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5566-fe03-959c-082186cee042	AM	ARM	051	Armenia 	Armenija	\N
00040000-5566-fe03-1854-dd7926366efa	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5566-fe03-2839-adb83413a12d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5566-fe03-1e63-5b4edd58f460	AT	AUT	040	Austria 	Avstrija	\N
00040000-5566-fe03-7508-184c8839357d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5566-fe03-cd86-1da62a12a34c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5566-fe03-c5bd-b98750046fd8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5566-fe03-9d4b-41223c9bceca	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5566-fe03-14ef-c3d1fce41faf	BB	BRB	052	Barbados 	Barbados	\N
00040000-5566-fe03-b034-78db42c2fdfe	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5566-fe03-bedf-47df27350ba1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5566-fe03-a968-f19ec728b6a6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5566-fe03-497a-cbf3164b6158	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5566-fe03-f1db-bf82e6d990c6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5566-fe03-bf71-6b2734fd45d2	BT	BTN	064	Bhutan 	Butan	\N
00040000-5566-fe03-5640-68e62cac0c5e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5566-fe03-6606-fd9cd38c95d5	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5566-fe03-b206-c38e60e5ebe0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5566-fe03-c498-775bfbc0a4b6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5566-fe03-d4c5-60c0fa743673	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5566-fe03-bb7b-70e627f56b0f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5566-fe03-fb33-8233348796af	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5566-fe03-7246-a81169267cd7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5566-fe03-aff7-b75ee587f8b3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5566-fe03-1a70-ac420c7e382c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5566-fe03-0808-1bc025aa70a7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5566-fe03-17c5-4186d7fc06a7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5566-fe03-d13c-b0591cdc48e7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5566-fe03-1517-5708f0778b92	CA	CAN	124	Canada 	Kanada	\N
00040000-5566-fe03-e7bf-1eae8f8650c0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5566-fe03-794b-8031a2a12898	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5566-fe03-4b23-f5de023b6a51	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5566-fe03-8245-0079335aff82	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5566-fe03-dfd8-26e94929e5a3	CL	CHL	152	Chile 	Čile	\N
00040000-5566-fe03-123b-5b224525189e	CN	CHN	156	China 	Kitajska	\N
00040000-5566-fe03-4a1d-a7225c6daaaa	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5566-fe03-e0e4-2f0eb8c427af	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5566-fe03-91c8-eb2433491987	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5566-fe03-e029-ac19f09455c1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5566-fe03-0787-eab86508aa08	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5566-fe03-fbe0-8bb4ffc30569	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5566-fe03-05f7-a96710f13c96	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5566-fe03-7dc0-372212ff4c47	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5566-fe03-07aa-b2b08c82c97a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5566-fe03-a108-72685b02b0ee	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5566-fe03-9b5d-49568f7d3a12	CU	CUB	192	Cuba 	Kuba	\N
00040000-5566-fe03-e198-6a76cbeb106e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5566-fe03-cdf2-56525e3e4b07	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5566-fe03-4a90-4fd98c59f0d8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5566-fe03-1b03-aa65998e0ce1	DK	DNK	208	Denmark 	Danska	\N
00040000-5566-fe03-f997-08010afb740f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5566-fe03-1946-5878f5dab362	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5566-fe03-cffa-580e437e3fb1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5566-fe03-9c1d-a46cda26f5e4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5566-fe03-696e-037a7ab6822f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5566-fe03-9335-fd8c143a450c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5566-fe03-9f79-27f3e84a45fc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5566-fe03-3bfc-03edb8922e7c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5566-fe03-888c-e7aa318fac87	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5566-fe03-59c3-758bc6a1c5c7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5566-fe03-24a9-4e6ad0e1b4dc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5566-fe03-f420-9127949079cd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5566-fe03-c1ad-4ff41e7ec862	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5566-fe03-b407-2a97f2f01f04	FI	FIN	246	Finland 	Finska	\N
00040000-5566-fe03-3d4a-b827efcf06d9	FR	FRA	250	France 	Francija	\N
00040000-5566-fe03-c2f6-921a80bd13f6	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5566-fe03-bc89-ce04857e3c31	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5566-fe03-a4f5-53f8314c3c37	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5566-fe03-3235-e3c71e14554e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5566-fe03-e4b2-0bd1ada6e27f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5566-fe03-1d96-0f21abfdf3b3	GM	GMB	270	Gambia 	Gambija	\N
00040000-5566-fe03-d3ad-6fcf025dc129	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5566-fe03-1a5b-e0944a97bc5a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5566-fe03-4cb8-f8e527d1356c	GH	GHA	288	Ghana 	Gana	\N
00040000-5566-fe03-aeb7-0182a9df0a5a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5566-fe03-85af-ecac21976b1b	GR	GRC	300	Greece 	Grčija	\N
00040000-5566-fe03-6a37-a655a9a3ba2b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5566-fe03-3497-ebaf630e6dfa	GD	GRD	308	Grenada 	Grenada	\N
00040000-5566-fe03-786c-47e964e078ca	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5566-fe03-5ce9-f2bc1bbafc3c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5566-fe03-f039-5bc835a5b30c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5566-fe03-c055-ad15b20332e3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5566-fe03-73db-895ff24af27a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5566-fe03-5caf-1020a3597b9e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5566-fe03-79ba-6d2dd6e43d46	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5566-fe03-969f-8ecbc060fcfd	HT	HTI	332	Haiti 	Haiti	\N
00040000-5566-fe03-a0d4-39340e534a43	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5566-fe03-bb58-1aa0eab8f2f5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5566-fe03-b9e2-78a47f606ca1	HN	HND	340	Honduras 	Honduras	\N
00040000-5566-fe03-3fea-f8510a5ac30d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5566-fe03-96c9-1a344141ea92	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5566-fe03-9e82-789e849b76e2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5566-fe03-a4d1-1730adca510f	IN	IND	356	India 	Indija	\N
00040000-5566-fe03-3916-541dab5b5ac9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5566-fe03-f436-e3f2019ce0e0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5566-fe03-0daf-9d79c5239033	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5566-fe03-498e-dddc7d870e4c	IE	IRL	372	Ireland 	Irska	\N
00040000-5566-fe03-5f04-6b28e1f76c52	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5566-fe03-3267-c5f01bdc0c01	IL	ISR	376	Israel 	Izrael	\N
00040000-5566-fe03-028a-85b538458277	IT	ITA	380	Italy 	Italija	\N
00040000-5566-fe03-d1d7-de31421d65d4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5566-fe03-1f0d-cbb5a97c8c6d	JP	JPN	392	Japan 	Japonska	\N
00040000-5566-fe03-e0f5-11e7d5cd3794	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5566-fe03-d417-b53e0e6b3fd3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5566-fe03-81d9-a7a9605919cb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5566-fe03-fde8-8644dd7ffdc3	KE	KEN	404	Kenya 	Kenija	\N
00040000-5566-fe03-a053-8ca0d34f5e89	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5566-fe03-bb68-a483106a1055	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5566-fe03-d082-0a0bc6e3e68d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5566-fe03-028a-4637954613a2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5566-fe03-f41e-c4a7921de5ba	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5566-fe03-4fb7-e838e37c7ded	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5566-fe03-4c44-5924481d8066	LV	LVA	428	Latvia 	Latvija	\N
00040000-5566-fe03-2912-107ee5fff8ae	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5566-fe03-e4c1-2edc90f3a17e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5566-fe03-7ac3-aa8196234e82	LR	LBR	430	Liberia 	Liberija	\N
00040000-5566-fe03-1666-54d56c4bc1fd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5566-fe03-d3b8-c4f6b8eba23b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5566-fe03-a479-5f163985d142	LT	LTU	440	Lithuania 	Litva	\N
00040000-5566-fe03-b072-9a30c2388fb2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5566-fe03-3e0a-a3599285bc03	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5566-fe03-5fba-9b60c739b012	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5566-fe03-b0e5-dc0473e77184	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5566-fe03-d51d-835d472d2611	MW	MWI	454	Malawi 	Malavi	\N
00040000-5566-fe03-5b71-4d154e1c5116	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5566-fe03-2952-eca450fded70	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5566-fe03-8130-c462e64c98b7	ML	MLI	466	Mali 	Mali	\N
00040000-5566-fe03-0951-8c65b3eeeddf	MT	MLT	470	Malta 	Malta	\N
00040000-5566-fe03-f489-0cf652de6c23	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5566-fe03-0ccb-1af8935e6f1c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5566-fe03-7ab5-920cded8c190	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5566-fe03-071a-fca08115ea71	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5566-fe03-f008-389e5ef9487e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5566-fe03-fb04-12d84c89245a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5566-fe03-b376-ad08b30ca0fd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5566-fe03-8537-e583ba32bda0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5566-fe03-9001-240f7376edd0	MC	MCO	492	Monaco 	Monako	\N
00040000-5566-fe03-1649-41440f6fd60c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5566-fe03-01f1-a2eb4a112630	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5566-fe03-3d5a-c5c3d2254026	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5566-fe03-d185-04704bfee829	MA	MAR	504	Morocco 	Maroko	\N
00040000-5566-fe03-c5a1-4dcd861c395d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5566-fe03-0970-79dd6aa2b6ca	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5566-fe03-570d-a925d2d0a845	NA	NAM	516	Namibia 	Namibija	\N
00040000-5566-fe03-13f3-17b51f02a44b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5566-fe03-ee1e-58b6eda85fcf	NP	NPL	524	Nepal 	Nepal	\N
00040000-5566-fe03-9c52-bef31100129a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5566-fe03-d207-867d3d409f65	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5566-fe03-f46c-966720f81a5d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5566-fe03-a38d-33bd0d856c42	NE	NER	562	Niger 	Niger 	\N
00040000-5566-fe03-b938-5d5a4c1b900d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5566-fe03-2845-6b0be44f19fd	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5566-fe03-50f3-f58bcc127981	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5566-fe03-eff5-1abffab1e1c3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5566-fe03-5a10-0cf152815133	NO	NOR	578	Norway 	Norveška	\N
00040000-5566-fe03-e186-d3366b6b6a5d	OM	OMN	512	Oman 	Oman	\N
00040000-5566-fe03-d3e0-38f22f47e7c7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5566-fe03-e0ce-918f70728cac	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5566-fe03-c5bf-2940db33beb0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5566-fe03-f566-0102336575f8	PA	PAN	591	Panama 	Panama	\N
00040000-5566-fe03-c4cb-c681a741edb0	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5566-fe03-5870-75e3e944846f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5566-fe03-8927-fda0a4e39db4	PE	PER	604	Peru 	Peru	\N
00040000-5566-fe03-ac26-54e671066fa9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5566-fe03-dbb1-8bec0bd9cd1d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5566-fe03-e523-dc63abb6becf	PL	POL	616	Poland 	Poljska	\N
00040000-5566-fe03-79c4-389c2644a600	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5566-fe03-dc61-51f426695c05	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5566-fe03-325a-e2fe661e42fe	QA	QAT	634	Qatar 	Katar	\N
00040000-5566-fe03-36fb-984136a698e7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5566-fe03-1162-19ddef0a47d9	RO	ROU	642	Romania 	Romunija	\N
00040000-5566-fe03-0da2-11389d1f25cf	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5566-fe03-629c-064334f03c18	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5566-fe03-ca3c-8d791971d8b6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5566-fe03-7b35-26d596949502	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5566-fe03-cccc-0da03939438a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5566-fe03-0a7b-eacde93f3516	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5566-fe03-ee7e-16a184d0ad65	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5566-fe03-e4f9-be6455539ae1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5566-fe03-8159-91c9be8ee1f9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5566-fe03-4007-6d5279f32812	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5566-fe03-2e6f-b658e34abd74	SM	SMR	674	San Marino 	San Marino	\N
00040000-5566-fe03-15ab-211258580268	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5566-fe03-b67d-a9e71ef64b1c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5566-fe03-81e7-bbaf9bd66af4	SN	SEN	686	Senegal 	Senegal	\N
00040000-5566-fe03-8d46-6829024ffbab	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5566-fe03-df72-7af15af1ffa7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5566-fe03-cb28-61c65433f3f4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5566-fe03-a498-98cfc1551cb3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5566-fe03-0b0a-f1df52a0e300	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5566-fe03-a2e1-abbbde7b34cb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5566-fe03-bcb6-65df422aec93	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5566-fe03-9d8a-6c0d22494bba	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5566-fe03-bf00-34b303e210c3	SO	SOM	706	Somalia 	Somalija	\N
00040000-5566-fe03-4d3b-04733b2de36d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5566-fe03-8aae-101343f165e7	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5566-fe03-144e-9ef32ead3395	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5566-fe03-de2a-10a85cc1e94b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5566-fe03-87e8-50620d3fdcf3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5566-fe03-931b-12e5504e80c3	SD	SDN	729	Sudan 	Sudan	\N
00040000-5566-fe03-4c03-e71a261028a1	SR	SUR	740	Suriname 	Surinam	\N
00040000-5566-fe03-ccd2-ecdcd86c865a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5566-fe03-8ccb-bc4c5f9795a6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5566-fe03-c8dd-542187a5938b	SE	SWE	752	Sweden 	Švedska	\N
00040000-5566-fe03-0705-0ac3f5a8e0eb	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5566-fe03-d773-2a0eaadbf7a7	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5566-fe03-ad33-adfb2d0e81e7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5566-fe03-37e3-e4b01d97ac35	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5566-fe03-1a04-7ce98a23f74d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5566-fe03-9746-0a7f2a68fe27	TH	THA	764	Thailand 	Tajska	\N
00040000-5566-fe03-5349-0a5dc822b493	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5566-fe03-8a45-4e855e6d10c9	TG	TGO	768	Togo 	Togo	\N
00040000-5566-fe03-8f56-4ee3ff512219	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5566-fe03-45b7-779ffa300baa	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5566-fe03-e123-0996ac219111	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5566-fe03-4b03-b27f50c20a56	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5566-fe03-fa8b-ce2b85ec1dc2	TR	TUR	792	Turkey 	Turčija	\N
00040000-5566-fe03-cd93-d454729e739b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5566-fe03-b774-2a30d16e61cc	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5566-fe03-0f53-b2751050b3f7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5566-fe03-d930-8955e24995c2	UG	UGA	800	Uganda 	Uganda	\N
00040000-5566-fe03-794f-b11a3998acdf	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5566-fe03-5b3f-40405bda99b9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5566-fe03-83e0-47468c420abd	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5566-fe03-a4e1-96b43368e69a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5566-fe03-ea0b-def7ec147619	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5566-fe03-c1e9-c33714f0775f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5566-fe03-50eb-197b6d53df34	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5566-fe03-a7d6-3c42ab4cfdd8	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5566-fe03-68c1-b110983c5ec1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5566-fe03-8826-30ec3e8eb5f6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5566-fe03-ec33-48a0cc331ae3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5566-fe03-d4bb-9811dfd3f3a8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5566-fe03-2032-16e7f7d49b7f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5566-fe03-8776-35bfe5c00a36	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5566-fe03-10bb-c78563a02b23	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5566-fe03-7a14-3026feef68bd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5566-fe03-7735-c84a1ac71ead	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2732 (class 0 OID 5417394)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5566-fe04-2b76-cd2bbcb095d7	000e0000-5566-fe04-060a-a0cf8547841f	\N	000f0000-5566-fe03-729e-9cb4c90eda5f	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N
000d0000-5566-fe04-9181-af4110d65b68	000e0000-5566-fe04-060a-a0cf8547841f	\N	000f0000-5566-fe03-729e-9cb4c90eda5f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N
000d0000-5566-fe04-233e-bbe481128bb1	000e0000-5566-fe04-060a-a0cf8547841f	\N	000f0000-5566-fe03-fc5e-181ce443de69	umetnik	\N	Režija		velika	t	8	t	t	\N
000d0000-5566-fe04-291d-6a47803dc586	000e0000-5566-fe04-060a-a0cf8547841f	\N	000f0000-5566-fe03-cb76-1ddb454d627e		t	Inšpicient			t	8	t	t	\N
000d0000-5566-fe04-ff7b-8855c7f91bb4	000e0000-5566-fe04-060a-a0cf8547841f	\N	000f0000-5566-fe03-d9bc-09fa7b1d2de6		t	Tehnični vodja			t	8	t	t	\N
\.


--
-- TOC entry 2711 (class 0 OID 5417218)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5417262)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5417198)
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
-- TOC entry 2721 (class 0 OID 5417311)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5417336)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 5417155)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5566-fe03-6b55-92f8e6b25ffc	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5566-fe03-2488-61da0a7cadb2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5566-fe03-eea2-243f2ab30f0d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5566-fe03-9f81-8fc9f594f2b9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5566-fe03-4025-a9b961a43994	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5566-fe03-0a2f-0f1e97d30c02	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5566-fe03-9d54-3bca76435c52	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5566-fe03-5450-d985dbe08666	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5566-fe03-a748-550ac188c734	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5566-fe03-0b7f-baff5acf8388	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5566-fe03-d473-95830294a5df	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5566-fe03-b143-e8aaa014933d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5566-fe03-c94c-92410a7861eb	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5566-fe03-922e-70938e47ba0b	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5566-fe03-2fc0-47328d8ac1a6	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2700 (class 0 OID 5417069)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5566-fe03-93bc-41ed65680165	00000000-5566-fe03-4025-a9b961a43994	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5566-fe03-b40b-b18717a42ebf	00000000-5566-fe03-4025-a9b961a43994	00010000-5566-fe03-6f69-7fa7386a6387	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5566-fe03-748d-542bc7cf226e	00000000-5566-fe03-0a2f-0f1e97d30c02	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2701 (class 0 OID 5417080)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5566-fe04-f894-2a91c998fd39	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5566-fe04-4d45-8c77c11f6640	00010000-5566-fe04-c2a5-66b99b82079d	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5566-fe04-6648-287d2aa87969	00010000-5566-fe04-10a7-32ba332ec0aa	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5566-fe04-a666-6f48734374f8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5566-fe04-69d7-23685acd73cf	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5566-fe04-9701-858e3867885a	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5566-fe04-17ef-5923c1622c0c	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5566-fe04-010c-fb2113eb04de	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5566-fe04-a677-2ae8c6bc6e31	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5566-fe04-08d7-07c8b4e3c16b	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5566-fe04-eb5d-fe9a14c47ed6	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2691 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5417034)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5566-fe03-62c7-33bafa623bda	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5566-fe03-955c-e9d5c116b179	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5566-fe03-34ab-bb64906ab39a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5566-fe03-75c9-54d8661df574	Abonma-read	Abonma - branje	f
00030000-5566-fe03-5d6c-033165925cf2	Abonma-write	Abonma - spreminjanje	f
00030000-5566-fe03-5921-552e0c05bd7a	Alternacija-read	Alternacija - branje	f
00030000-5566-fe03-2d5b-927cecc4ac9c	Alternacija-write	Alternacija - spreminjanje	f
00030000-5566-fe03-e8b5-a4898d313de0	Arhivalija-read	Arhivalija - branje	f
00030000-5566-fe03-6737-ab13e2432526	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5566-fe03-7f57-18859ac2941b	Besedilo-read	Besedilo - branje	f
00030000-5566-fe03-a4d8-6639df210cd4	Besedilo-write	Besedilo - spreminjanje	f
00030000-5566-fe03-4e2d-217d8c098f6f	DogodekIzven-read	DogodekIzven - branje	f
00030000-5566-fe03-01e7-1953afcf9da9	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5566-fe03-4878-280471ea3c02	Dogodek-read	Dogodek - branje	f
00030000-5566-fe03-30d8-d0eef30e6ad2	Dogodek-write	Dogodek - spreminjanje	f
00030000-5566-fe03-dd4c-274647863d57	Drzava-read	Drzava - branje	f
00030000-5566-fe03-844b-e929bec50014	Drzava-write	Drzava - spreminjanje	f
00030000-5566-fe03-a944-b4ebf2ef6a5d	Funkcija-read	Funkcija - branje	f
00030000-5566-fe03-f7fc-1718efa4b9e7	Funkcija-write	Funkcija - spreminjanje	f
00030000-5566-fe03-08fa-4fbc4976f5ac	Gostovanje-read	Gostovanje - branje	f
00030000-5566-fe03-18f1-37c3517e2691	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5566-fe03-0dfc-81b49101f6cc	Gostujoca-read	Gostujoca - branje	f
00030000-5566-fe03-d794-43b4e8c504a5	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5566-fe03-e131-c79f7b27d8ca	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5566-fe03-b644-33a95d57c9a1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5566-fe03-bb4c-04cebe94ecb5	Kupec-read	Kupec - branje	f
00030000-5566-fe03-58a5-ecc29f51aa0d	Kupec-write	Kupec - spreminjanje	f
00030000-5566-fe03-8bfd-27c66e2dee67	NacinPlacina-read	NacinPlacina - branje	f
00030000-5566-fe03-cb18-67a5be7526ce	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5566-fe03-7bc5-9279a6745c78	Option-read	Option - branje	f
00030000-5566-fe03-701d-dfc5d6f416f1	Option-write	Option - spreminjanje	f
00030000-5566-fe03-5088-619d848f333b	OptionValue-read	OptionValue - branje	f
00030000-5566-fe03-f572-d64002d03edf	OptionValue-write	OptionValue - spreminjanje	f
00030000-5566-fe03-2212-42cc3d768eba	Oseba-read	Oseba - branje	f
00030000-5566-fe03-1156-1a88930e18b7	Oseba-write	Oseba - spreminjanje	f
00030000-5566-fe03-5850-fc7b038fd2e3	Permission-read	Permission - branje	f
00030000-5566-fe03-ace8-3641382454cc	Permission-write	Permission - spreminjanje	f
00030000-5566-fe03-a5f3-249552945cee	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5566-fe03-89cb-cfffbbf2f468	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5566-fe03-9b70-e9ee3e16ee67	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5566-fe03-9ff2-009dcfdd763a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5566-fe03-9975-18d7576c79fb	Pogodba-read	Pogodba - branje	f
00030000-5566-fe03-bddd-2a28e3b21d15	Pogodba-write	Pogodba - spreminjanje	f
00030000-5566-fe03-d357-a5fb55f9ea00	Popa-read	Popa - branje	f
00030000-5566-fe03-1e45-0e7716e7264c	Popa-write	Popa - spreminjanje	f
00030000-5566-fe03-864c-de3bd20a5fd1	Posta-read	Posta - branje	f
00030000-5566-fe03-094a-5258930a0304	Posta-write	Posta - spreminjanje	f
00030000-5566-fe03-81d9-8af126129485	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5566-fe03-361b-3f2e7c793dfe	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5566-fe03-03cd-e3984b895fd9	PostniNaslov-read	PostniNaslov - branje	f
00030000-5566-fe03-55f1-954e47714dac	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5566-fe03-6f48-422f333eec15	Predstava-read	Predstava - branje	f
00030000-5566-fe03-b49b-3ff58dc69fa4	Predstava-write	Predstava - spreminjanje	f
00030000-5566-fe03-561d-4ba937f149ad	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5566-fe03-f2c8-a31dcf648d19	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5566-fe03-80ac-707ce69af71f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5566-fe03-cae6-d02739006b65	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5566-fe03-3173-75bd3a409034	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5566-fe03-24a3-15853d5e46ba	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5566-fe03-38b0-099fe234b466	Prostor-read	Prostor - branje	f
00030000-5566-fe03-4195-4ca8dff9aef6	Prostor-write	Prostor - spreminjanje	f
00030000-5566-fe03-a01d-dea36a223201	Racun-read	Racun - branje	f
00030000-5566-fe03-70d5-31e67e491e26	Racun-write	Racun - spreminjanje	f
00030000-5566-fe03-95a1-90f43fb9519e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5566-fe03-684b-c07164ba0741	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5566-fe03-605d-825a0e3fc4ef	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5566-fe03-3afc-65ebe5d3d814	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5566-fe03-8cba-3d1de6e95421	Rekvizit-read	Rekvizit - branje	f
00030000-5566-fe03-3609-0f919e5ad86d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5566-fe03-7c16-a04bf4f299ae	Revizija-read	Revizija - branje	f
00030000-5566-fe03-23cf-2908059d7967	Revizija-write	Revizija - spreminjanje	f
00030000-5566-fe03-04e1-a430b81ddf65	Rezervacija-read	Rezervacija - branje	f
00030000-5566-fe03-fe1e-47488d5099fe	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5566-fe03-56d9-e63b45a5400d	Role-read	Role - branje	f
00030000-5566-fe03-e265-569297be1ad1	Role-write	Role - spreminjanje	f
00030000-5566-fe03-1d2a-1faed1477761	SedezniRed-read	SedezniRed - branje	f
00030000-5566-fe03-9c5a-9eba960b6fbd	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5566-fe03-04dc-d2edf643a5f0	Sedez-read	Sedez - branje	f
00030000-5566-fe03-bc1f-35f5bd1c08da	Sedez-write	Sedez - spreminjanje	f
00030000-5566-fe03-4013-5b0e62cd1ddb	Sezona-read	Sezona - branje	f
00030000-5566-fe03-3af4-7290eaa975b8	Sezona-write	Sezona - spreminjanje	f
00030000-5566-fe03-d3d5-bdd40957b104	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5566-fe03-95c2-f89ad4b9802a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5566-fe03-a85a-415366455478	Stevilcenje-read	Stevilcenje - branje	f
00030000-5566-fe03-493e-92841fe8655f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5566-fe03-64b6-468b70e29f13	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5566-fe03-6e60-b3c0e08f120e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5566-fe03-8d76-70e29113d703	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5566-fe03-2c46-00591636c762	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5566-fe03-a2d6-ce6f5674e9a3	Telefonska-read	Telefonska - branje	f
00030000-5566-fe03-3bc8-fd28e52a33bd	Telefonska-write	Telefonska - spreminjanje	f
00030000-5566-fe03-4e41-6c257170be13	TerminStoritve-read	TerminStoritve - branje	f
00030000-5566-fe03-edac-2160dc10c953	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5566-fe03-2e39-c85ae02e2493	TipFunkcije-read	TipFunkcije - branje	f
00030000-5566-fe03-8a08-7983b23dc964	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5566-fe03-49db-6dcb93139697	Trr-read	Trr - branje	f
00030000-5566-fe03-beee-c79f1b157a57	Trr-write	Trr - spreminjanje	f
00030000-5566-fe03-7f6e-4ba847011f4e	Uprizoritev-read	Uprizoritev - branje	f
00030000-5566-fe03-c069-d94b1efe7766	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5566-fe03-454b-ee0a4c9b963c	User-read	User - branje	f
00030000-5566-fe03-f02d-1cce533681fd	User-write	User - spreminjanje	f
00030000-5566-fe03-1c70-b4d305e26b8c	Vaja-read	Vaja - branje	f
00030000-5566-fe03-3600-b057777a78d4	Vaja-write	Vaja - spreminjanje	f
00030000-5566-fe03-e1c0-7dd67704b37f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5566-fe03-7321-f2bc27fd097f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5566-fe03-17e9-fe7609810cdf	Zaposlitev-read	Zaposlitev - branje	f
00030000-5566-fe03-7eda-7af09917be38	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5566-fe03-8e53-6b364c881eb2	Zasedenost-read	Zasedenost - branje	f
00030000-5566-fe03-8dd6-89b96a04b275	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5566-fe03-2c0c-92fa83cb9e10	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5566-fe03-092c-deabad820e48	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5566-fe03-79e9-386387157a25	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5566-fe03-3465-f68c292be207	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2698 (class 0 OID 5417053)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5566-fe03-5496-7df21d8fcdd6	00030000-5566-fe03-dd4c-274647863d57
00020000-5566-fe03-555c-290d498e404e	00030000-5566-fe03-844b-e929bec50014
00020000-5566-fe03-555c-290d498e404e	00030000-5566-fe03-dd4c-274647863d57
\.


--
-- TOC entry 2726 (class 0 OID 5417343)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2730 (class 0 OID 5417374)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5417507)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 5417112)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5566-fe04-a3e6-8b0147d8d5f9	00040000-5566-fe03-c2e4-bd17be7e03ef	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5566-fe04-d9b1-f82d5252f3c7	00040000-5566-fe03-c2e4-bd17be7e03ef	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2705 (class 0 OID 5417147)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5566-fe03-d2f6-0e393d8043f2	8341	Adlešiči
00050000-5566-fe03-a760-854914dbd4b7	5270	Ajdovščina
00050000-5566-fe03-0014-aca9afc4d4ef	6280	Ankaran/Ancarano
00050000-5566-fe03-ad00-b4aa3ca022bc	9253	Apače
00050000-5566-fe03-2d2d-d9a500c31e05	8253	Artiče
00050000-5566-fe03-f701-e4e41af9147e	4275	Begunje na Gorenjskem
00050000-5566-fe03-c392-00cae9c929ad	1382	Begunje pri Cerknici
00050000-5566-fe03-1b5c-0dc98e784e43	9231	Beltinci
00050000-5566-fe03-9e10-c1d7d483bb84	2234	Benedikt
00050000-5566-fe03-23ee-2ab1d0b12f15	2345	Bistrica ob Dravi
00050000-5566-fe03-17e5-97de2793a6a5	3256	Bistrica ob Sotli
00050000-5566-fe03-3ee4-21cb49383db3	8259	Bizeljsko
00050000-5566-fe03-e45f-eff163d6bc7d	1223	Blagovica
00050000-5566-fe03-d8f7-c2e6fe3d22ca	8283	Blanca
00050000-5566-fe03-6e12-7dbb1cfd7e8d	4260	Bled
00050000-5566-fe03-8b50-11a087b63322	4273	Blejska Dobrava
00050000-5566-fe03-80e5-42d0985b1be2	9265	Bodonci
00050000-5566-fe03-1b4a-a4d2938bab3e	9222	Bogojina
00050000-5566-fe03-bdba-55773b3039be	4263	Bohinjska Bela
00050000-5566-fe03-c9ed-474854cc2af2	4264	Bohinjska Bistrica
00050000-5566-fe03-8fe1-445c832c1be5	4265	Bohinjsko jezero
00050000-5566-fe03-a103-a07b6e3e30b8	1353	Borovnica
00050000-5566-fe03-ada4-4d0f0e3103b2	8294	Boštanj
00050000-5566-fe03-ef52-630a2fe49a2d	5230	Bovec
00050000-5566-fe03-7246-778cf70ab346	5295	Branik
00050000-5566-fe03-a481-af9a28d977cd	3314	Braslovče
00050000-5566-fe03-cae1-ce9c55c13050	5223	Breginj
00050000-5566-fe03-bac3-1356baf00e16	8280	Brestanica
00050000-5566-fe03-e366-133dd8938370	2354	Bresternica
00050000-5566-fe03-bb93-baaa20cea1a8	4243	Brezje
00050000-5566-fe03-aa7e-ebfefb298ad6	1351	Brezovica pri Ljubljani
00050000-5566-fe03-ca52-844ef9b21808	8250	Brežice
00050000-5566-fe03-d1fa-6ea27c73632e	4210	Brnik - Aerodrom
00050000-5566-fe03-62ab-f8d6d6d2fa2e	8321	Brusnice
00050000-5566-fe03-b451-4e665770e11c	3255	Buče
00050000-5566-fe03-0206-3b9569dec806	8276	Bučka 
00050000-5566-fe03-a2eb-ee9d0747976f	9261	Cankova
00050000-5566-fe03-330f-f502dbd7d422	3000	Celje 
00050000-5566-fe03-0ecf-b5566958ff71	3001	Celje - poštni predali
00050000-5566-fe03-91d3-4874303f26cb	4207	Cerklje na Gorenjskem
00050000-5566-fe03-16a7-2a08773dcae4	8263	Cerklje ob Krki
00050000-5566-fe03-a6d1-03a90f59c706	1380	Cerknica
00050000-5566-fe03-610d-6ebbafe36eb3	5282	Cerkno
00050000-5566-fe03-b7c3-94ae58ff3e4c	2236	Cerkvenjak
00050000-5566-fe03-f4c9-7823b51c0968	2215	Ceršak
00050000-5566-fe03-0279-904da4eff189	2326	Cirkovce
00050000-5566-fe03-a890-ba9f44105ffe	2282	Cirkulane
00050000-5566-fe03-003d-433644e68962	5273	Col
00050000-5566-fe03-f171-d81487c8c4be	8251	Čatež ob Savi
00050000-5566-fe03-4cd7-2ffba7a862cc	1413	Čemšenik
00050000-5566-fe03-d52b-9e70e2744d53	5253	Čepovan
00050000-5566-fe03-1590-158febd92108	9232	Črenšovci
00050000-5566-fe03-f7bc-49aec8f9c90b	2393	Črna na Koroškem
00050000-5566-fe03-763c-a1ec535cac9e	6275	Črni Kal
00050000-5566-fe03-7af5-1d32e0013fb3	5274	Črni Vrh nad Idrijo
00050000-5566-fe03-9dbb-534c19aa97b5	5262	Črniče
00050000-5566-fe03-1fb9-17b63a88f27a	8340	Črnomelj
00050000-5566-fe03-31f1-a7a39262e38f	6271	Dekani
00050000-5566-fe03-47a0-82737d2399fc	5210	Deskle
00050000-5566-fe03-ed6c-2e4f2e56ca48	2253	Destrnik
00050000-5566-fe03-7eae-3358632dace9	6215	Divača
00050000-5566-fe03-9193-5fb194f10d24	1233	Dob
00050000-5566-fe03-9387-8d29fa0701e4	3224	Dobje pri Planini
00050000-5566-fe03-cecc-d7a4cbe14008	8257	Dobova
00050000-5566-fe03-2527-fc726063b3f9	1423	Dobovec
00050000-5566-fe03-4268-fadc15cb550e	5263	Dobravlje
00050000-5566-fe03-c0fe-bd4411786654	3204	Dobrna
00050000-5566-fe03-8479-f3993193e8ad	8211	Dobrnič
00050000-5566-fe03-1003-218a4aedaba3	1356	Dobrova
00050000-5566-fe03-538e-66c17545a590	9223	Dobrovnik/Dobronak 
00050000-5566-fe03-7d30-1a6cd29c2d31	5212	Dobrovo v Brdih
00050000-5566-fe03-e36c-7afc9b509334	1431	Dol pri Hrastniku
00050000-5566-fe03-f0f7-59361ce166c7	1262	Dol pri Ljubljani
00050000-5566-fe03-f108-158a43ae114a	1273	Dole pri Litiji
00050000-5566-fe03-e8f0-d1e0cfd4b570	1331	Dolenja vas
00050000-5566-fe03-7b6a-0e509dbaaf0f	8350	Dolenjske Toplice
00050000-5566-fe03-8477-3ae2d2222375	1230	Domžale
00050000-5566-fe03-ee74-7f6150389dbc	2252	Dornava
00050000-5566-fe03-d158-ac9069252afd	5294	Dornberk
00050000-5566-fe03-6a38-d39d3777a7c5	1319	Draga
00050000-5566-fe03-9de2-064aad46254f	8343	Dragatuš
00050000-5566-fe03-77a6-7de6176bc8e3	3222	Dramlje
00050000-5566-fe03-cec5-3cf689f64789	2370	Dravograd
00050000-5566-fe03-ba00-5b578d04d8fe	4203	Duplje
00050000-5566-fe03-959d-9bf130b51346	6221	Dutovlje
00050000-5566-fe03-cb7d-76cbc3c56289	8361	Dvor
00050000-5566-fe03-3d41-0934a1913c47	2343	Fala
00050000-5566-fe03-8812-f443d551ab1f	9208	Fokovci
00050000-5566-fe03-d2c0-e1e8eb20b231	2313	Fram
00050000-5566-fe03-032b-23b40369f349	3213	Frankolovo
00050000-5566-fe03-e8b2-25c693b90625	1274	Gabrovka
00050000-5566-fe03-873e-51104a5d7dce	8254	Globoko
00050000-5566-fe03-c143-9b14faa4aa08	5275	Godovič
00050000-5566-fe03-c212-0a1492c4d5c4	4204	Golnik
00050000-5566-fe03-6de3-23d04ff72ad6	3303	Gomilsko
00050000-5566-fe03-078c-007600f4868a	4224	Gorenja vas
00050000-5566-fe03-3719-1265eaad49e9	3263	Gorica pri Slivnici
00050000-5566-fe03-bff3-f318396f7053	2272	Gorišnica
00050000-5566-fe03-1172-0e6cc38e582c	9250	Gornja Radgona
00050000-5566-fe03-0e45-63d62c3818ed	3342	Gornji Grad
00050000-5566-fe03-27cd-b0e3b7b80d53	4282	Gozd Martuljek
00050000-5566-fe03-a3c1-56b91f40aa4c	6272	Gračišče
00050000-5566-fe03-4ef0-843bd1875cd5	9264	Grad
00050000-5566-fe03-9557-1ca995412276	8332	Gradac
00050000-5566-fe03-b642-c085efc9245b	1384	Grahovo
00050000-5566-fe03-e44a-ca629745af09	5242	Grahovo ob Bači
00050000-5566-fe03-308d-98cba969b945	5251	Grgar
00050000-5566-fe03-e9d7-4e3f011537eb	3302	Griže
00050000-5566-fe03-597e-adbdf1116e67	3231	Grobelno
00050000-5566-fe03-8a29-39e3aee632c2	1290	Grosuplje
00050000-5566-fe03-ecbf-121215182b6b	2288	Hajdina
00050000-5566-fe03-27b3-b81ab59cd3ba	8362	Hinje
00050000-5566-fe03-27a7-8527c0dcc6dc	2311	Hoče
00050000-5566-fe03-434e-d02d671b808a	9205	Hodoš/Hodos
00050000-5566-fe03-b11b-fb1dcf1e1409	1354	Horjul
00050000-5566-fe03-7632-e555636f5211	1372	Hotedršica
00050000-5566-fe03-d047-bfa367a14af4	1430	Hrastnik
00050000-5566-fe03-3525-f1895643a1fe	6225	Hruševje
00050000-5566-fe03-7f0f-bc8d02bbb5c1	4276	Hrušica
00050000-5566-fe03-beb8-82321daf8942	5280	Idrija
00050000-5566-fe03-7996-54b4e04dbdcd	1292	Ig
00050000-5566-fe03-dc5d-d1492fe0437b	6250	Ilirska Bistrica
00050000-5566-fe03-47d8-381926975641	6251	Ilirska Bistrica-Trnovo
00050000-5566-fe03-9db3-32f83c9ac847	1295	Ivančna Gorica
00050000-5566-fe03-9335-95143efb5497	2259	Ivanjkovci
00050000-5566-fe03-e3d1-3078c881ce79	1411	Izlake
00050000-5566-fe03-c2bd-7e664b1dbf9c	6310	Izola/Isola
00050000-5566-fe03-b0fd-b2d760cde376	2222	Jakobski Dol
00050000-5566-fe03-afc3-3c6aa2544e5e	2221	Jarenina
00050000-5566-fe03-658e-9092c097268d	6254	Jelšane
00050000-5566-fe03-eb5e-caeec01bef27	4270	Jesenice
00050000-5566-fe03-9d56-14548559cc99	8261	Jesenice na Dolenjskem
00050000-5566-fe03-4d64-9238f180667b	3273	Jurklošter
00050000-5566-fe03-6e6f-28b4c71faf89	2223	Jurovski Dol
00050000-5566-fe03-9b27-98315d512fad	2256	Juršinci
00050000-5566-fe03-6aa4-bb93c8786bbb	5214	Kal nad Kanalom
00050000-5566-fe03-d5aa-3d4c5ee971e4	3233	Kalobje
00050000-5566-fe03-36ba-65e6cebe9d3e	4246	Kamna Gorica
00050000-5566-fe03-750c-6eced7d0f13d	2351	Kamnica
00050000-5566-fe03-8875-74e52415d539	1241	Kamnik
00050000-5566-fe03-5c23-beb2462a8ba5	5213	Kanal
00050000-5566-fe03-f733-b684af7d7c25	8258	Kapele
00050000-5566-fe03-d4a5-a3970482eb0a	2362	Kapla
00050000-5566-fe03-3085-8a05194728ec	2325	Kidričevo
00050000-5566-fe03-2c17-cf09429d6fce	1412	Kisovec
00050000-5566-fe03-59f7-b0d881c1cfe4	6253	Knežak
00050000-5566-fe03-6ab2-966c32ed1b07	5222	Kobarid
00050000-5566-fe03-a8a1-3390991b6ee5	9227	Kobilje
00050000-5566-fe03-8219-68f54c487981	1330	Kočevje
00050000-5566-fe03-2ed8-a8a58f1b24cd	1338	Kočevska Reka
00050000-5566-fe03-47b8-6b3ff6231718	2276	Kog
00050000-5566-fe03-2f0b-365600855499	5211	Kojsko
00050000-5566-fe03-4f35-98533211778d	6223	Komen
00050000-5566-fe03-d46d-d9fa88d6506f	1218	Komenda
00050000-5566-fe03-ef9b-4efbb0c31fa3	6000	Koper/Capodistria 
00050000-5566-fe03-895d-255ff9042142	6001	Koper/Capodistria - poštni predali
00050000-5566-fe03-32e0-1bef5c395308	8282	Koprivnica
00050000-5566-fe03-a2f9-9a8f8538bed0	5296	Kostanjevica na Krasu
00050000-5566-fe03-c535-6aa2c5e69858	8311	Kostanjevica na Krki
00050000-5566-fe03-9d7a-7fe95182560f	1336	Kostel
00050000-5566-fe03-3d1d-1ec59f442b61	6256	Košana
00050000-5566-fe03-efd6-9406149701bb	2394	Kotlje
00050000-5566-fe03-f474-c9a1fc599a3c	6240	Kozina
00050000-5566-fe03-1f80-895c189d2f8a	3260	Kozje
00050000-5566-fe03-7f9f-919a4bd0b7b5	4000	Kranj 
00050000-5566-fe03-d996-4294b84c0afd	4001	Kranj - poštni predali
00050000-5566-fe03-ba0d-2497dc1eaeb5	4280	Kranjska Gora
00050000-5566-fe03-b560-c3b6943b6a39	1281	Kresnice
00050000-5566-fe03-d52b-bea371e221d1	4294	Križe
00050000-5566-fe03-bb26-e347e3d6ca3c	9206	Križevci
00050000-5566-fe03-8e5e-a7d0178026fb	9242	Križevci pri Ljutomeru
00050000-5566-fe03-cd26-7f74a4f6872f	1301	Krka
00050000-5566-fe03-1226-7ca78aecfcb6	8296	Krmelj
00050000-5566-fe03-0487-3d20f27f987a	4245	Kropa
00050000-5566-fe03-eb79-482431e18dd8	8262	Krška vas
00050000-5566-fe03-6f14-9cd67193a9fc	8270	Krško
00050000-5566-fe03-0362-7d4581808e09	9263	Kuzma
00050000-5566-fe03-8576-e020d4006878	2318	Laporje
00050000-5566-fe03-064b-361413abada4	3270	Laško
00050000-5566-fe03-29d6-bf0eb262f471	1219	Laze v Tuhinju
00050000-5566-fe03-fb3c-0eb272177a49	2230	Lenart v Slovenskih goricah
00050000-5566-fe03-71f1-b1d45788b81e	9220	Lendava/Lendva
00050000-5566-fe03-bd17-0849fc8b2873	4248	Lesce
00050000-5566-fe03-cd8c-8ed5ce8a11bb	3261	Lesično
00050000-5566-fe03-419c-d0b2a731f3cb	8273	Leskovec pri Krškem
00050000-5566-fe03-c27e-ace54de95085	2372	Libeliče
00050000-5566-fe03-a8d5-82f24a083a8e	2341	Limbuš
00050000-5566-fe03-77ca-97b1701b4c0d	1270	Litija
00050000-5566-fe03-cd0b-2c126eeb42b3	3202	Ljubečna
00050000-5566-fe03-00d3-16b8e2d94d56	1000	Ljubljana 
00050000-5566-fe03-1723-fdd4b71b2524	1001	Ljubljana - poštni predali
00050000-5566-fe03-fc67-865497889755	1231	Ljubljana - Črnuče
00050000-5566-fe03-3c21-499febd21e86	1261	Ljubljana - Dobrunje
00050000-5566-fe03-f7d7-1bbeeea20247	1260	Ljubljana - Polje
00050000-5566-fe03-9057-cef2e05bf188	1210	Ljubljana - Šentvid
00050000-5566-fe03-ac16-b2be9e8920f1	1211	Ljubljana - Šmartno
00050000-5566-fe03-7c47-08372db2bc59	3333	Ljubno ob Savinji
00050000-5566-fe03-4a37-7ddbd271e49d	9240	Ljutomer
00050000-5566-fe03-670a-54a301587707	3215	Loče
00050000-5566-fe03-e135-04a65e0f52aa	5231	Log pod Mangartom
00050000-5566-fe03-7863-7436ba198613	1358	Log pri Brezovici
00050000-5566-fe03-3901-494b110cbeb2	1370	Logatec
00050000-5566-fe03-4bd5-c219a7ba076a	1371	Logatec
00050000-5566-fe03-eaec-3dd5ac9011c8	1434	Loka pri Zidanem Mostu
00050000-5566-fe03-105d-8e38b5f48bb8	3223	Loka pri Žusmu
00050000-5566-fe03-4c17-c75b473b7af1	6219	Lokev
00050000-5566-fe03-a73c-38d211f211b7	1318	Loški Potok
00050000-5566-fe03-6e1a-d8b0da46863d	2324	Lovrenc na Dravskem polju
00050000-5566-fe03-9d6a-1429b462c61a	2344	Lovrenc na Pohorju
00050000-5566-fe03-79a1-0950f3bbdf38	3334	Luče
00050000-5566-fe03-d948-bff192d3878a	1225	Lukovica
00050000-5566-fe03-2d79-b29cb81703db	9202	Mačkovci
00050000-5566-fe03-b13e-6d5a451bbc8f	2322	Majšperk
00050000-5566-fe03-3179-639095f22dfb	2321	Makole
00050000-5566-fe03-220c-51e204c5c685	9243	Mala Nedelja
00050000-5566-fe03-ea77-4e550f28807f	2229	Malečnik
00050000-5566-fe03-58a1-dc2e37647366	6273	Marezige
00050000-5566-fe03-e0e5-f60cf58718ff	2000	Maribor 
00050000-5566-fe03-ca77-d1537c209efa	2001	Maribor - poštni predali
00050000-5566-fe03-ecc5-f193717d8bd2	2206	Marjeta na Dravskem polju
00050000-5566-fe03-bd8b-72206dd4e225	2281	Markovci
00050000-5566-fe03-f3c0-0365629f4c22	9221	Martjanci
00050000-5566-fe03-eef3-fa5cab68f6ff	6242	Materija
00050000-5566-fe03-3de1-e16bc71043dc	4211	Mavčiče
00050000-5566-fe03-a8d6-b0f19449e069	1215	Medvode
00050000-5566-fe03-a639-dedb6dad9197	1234	Mengeš
00050000-5566-fe03-7d5e-1b2b53a1db51	8330	Metlika
00050000-5566-fe03-5ced-4a7d93041e18	2392	Mežica
00050000-5566-fe03-51cd-52a701b06d77	2204	Miklavž na Dravskem polju
00050000-5566-fe03-28de-5fcd3beb4fcf	2275	Miklavž pri Ormožu
00050000-5566-fe03-40c9-5160e0196a9d	5291	Miren
00050000-5566-fe03-6ab4-deb8c591cafc	8233	Mirna
00050000-5566-fe03-c24a-6dad12ae2ca3	8216	Mirna Peč
00050000-5566-fe03-7c27-4c729db398c7	2382	Mislinja
00050000-5566-fe03-3101-1390d0b7da28	4281	Mojstrana
00050000-5566-fe03-4c6d-212229a01148	8230	Mokronog
00050000-5566-fe03-3636-92700b5bb5e3	1251	Moravče
00050000-5566-fe03-9924-4b273464300e	9226	Moravske Toplice
00050000-5566-fe03-1805-140be69c2c3b	5216	Most na Soči
00050000-5566-fe03-95e0-f569cda61ad5	1221	Motnik
00050000-5566-fe03-89ee-36d12040583f	3330	Mozirje
00050000-5566-fe03-94ea-d78e08705115	9000	Murska Sobota 
00050000-5566-fe03-fbb5-512acf3243b4	9001	Murska Sobota - poštni predali
00050000-5566-fe03-f655-a3c57fcc0914	2366	Muta
00050000-5566-fe03-8e37-2810710e88a1	4202	Naklo
00050000-5566-fe03-906d-9b82d2ea9546	3331	Nazarje
00050000-5566-fe03-466f-cdf8aa018e52	1357	Notranje Gorice
00050000-5566-fe03-c09f-749131f98bdb	3203	Nova Cerkev
00050000-5566-fe03-aada-1c37ae56b19e	5000	Nova Gorica 
00050000-5566-fe03-43f2-ed07c151ad60	5001	Nova Gorica - poštni predali
00050000-5566-fe03-98ff-05406821b1ef	1385	Nova vas
00050000-5566-fe03-f17f-2350eda755b3	8000	Novo mesto
00050000-5566-fe03-5ddc-6e6126f19079	8001	Novo mesto - poštni predali
00050000-5566-fe03-ba80-2b2648b792cf	6243	Obrov
00050000-5566-fe03-f5e7-97eb4675f079	9233	Odranci
00050000-5566-fe03-de84-e3b37055f70e	2317	Oplotnica
00050000-5566-fe03-f47f-89537393025d	2312	Orehova vas
00050000-5566-fe03-9c7e-cc6d1ea4f8a9	2270	Ormož
00050000-5566-fe03-8c28-c99122d12d65	1316	Ortnek
00050000-5566-fe03-a84e-3d8bea6a9409	1337	Osilnica
00050000-5566-fe03-329b-c61899ba43f0	8222	Otočec
00050000-5566-fe03-4fb8-910a6856cd53	2361	Ožbalt
00050000-5566-fe03-e2e9-186fcd3e5663	2231	Pernica
00050000-5566-fe03-48be-82edf9693ef8	2211	Pesnica pri Mariboru
00050000-5566-fe03-0636-306984da40cc	9203	Petrovci
00050000-5566-fe03-ac78-f87bbf83b1a1	3301	Petrovče
00050000-5566-fe03-21ee-844033b4fe5a	6330	Piran/Pirano
00050000-5566-fe03-b213-5cba45594d57	8255	Pišece
00050000-5566-fe03-2886-1c10c9fc0524	6257	Pivka
00050000-5566-fe03-143c-ba6570983de6	6232	Planina
00050000-5566-fe03-5848-6fdfaa2f78e7	3225	Planina pri Sevnici
00050000-5566-fe03-caca-1a0e21681c80	6276	Pobegi
00050000-5566-fe03-9d93-8cafce125dc0	8312	Podbočje
00050000-5566-fe03-bd92-aa3f1111a755	5243	Podbrdo
00050000-5566-fe03-33a9-52292447a969	3254	Podčetrtek
00050000-5566-fe03-3e8d-e0cb1d7c9afb	2273	Podgorci
00050000-5566-fe03-08d4-e993fe4b9bbc	6216	Podgorje
00050000-5566-fe03-b519-85afd9cc468b	2381	Podgorje pri Slovenj Gradcu
00050000-5566-fe03-7585-5332fa7e1fc6	6244	Podgrad
00050000-5566-fe03-a952-9e8659259967	1414	Podkum
00050000-5566-fe03-2f94-376c46fa124d	2286	Podlehnik
00050000-5566-fe03-9488-848cec8e84d9	5272	Podnanos
00050000-5566-fe03-c213-8b33ce6cdc0d	4244	Podnart
00050000-5566-fe03-4fac-d3fe045ec1b2	3241	Podplat
00050000-5566-fe03-3506-9062b540566a	3257	Podsreda
00050000-5566-fe03-9dd2-53e7becf0ca2	2363	Podvelka
00050000-5566-fe03-f03e-0bddb7701129	2208	Pohorje
00050000-5566-fe03-3b1f-e72b6d59fc86	2257	Polenšak
00050000-5566-fe03-0d01-812b4dc95ee7	1355	Polhov Gradec
00050000-5566-fe03-6a48-2e7d312d5158	4223	Poljane nad Škofjo Loko
00050000-5566-fe03-cf3e-e9b411db6b3f	2319	Poljčane
00050000-5566-fe03-81ba-126a85c2b586	1272	Polšnik
00050000-5566-fe03-6a47-3fd96007cce3	3313	Polzela
00050000-5566-fe03-a308-2d027402830f	3232	Ponikva
00050000-5566-fe03-b46a-8ce2165bdf95	6320	Portorož/Portorose
00050000-5566-fe03-916e-002a27cee396	6230	Postojna
00050000-5566-fe03-b21a-7f9440f1d3b7	2331	Pragersko
00050000-5566-fe03-1d4f-69e19d5317ae	3312	Prebold
00050000-5566-fe03-4262-e56579c8650b	4205	Preddvor
00050000-5566-fe03-520c-04cb527b6986	6255	Prem
00050000-5566-fe03-2f06-0c5beb82700b	1352	Preserje
00050000-5566-fe03-cf8e-bda2d4b4c62a	6258	Prestranek
00050000-5566-fe03-e617-8fe56373b000	2391	Prevalje
00050000-5566-fe03-5025-c8d47a1096e8	3262	Prevorje
00050000-5566-fe03-3e5b-9a31d50099b7	1276	Primskovo 
00050000-5566-fe03-55e0-0bcc1b71de4a	3253	Pristava pri Mestinju
00050000-5566-fe03-6eff-056e4b4303d0	9207	Prosenjakovci/Partosfalva
00050000-5566-fe03-b513-ab3b0d10d9cd	5297	Prvačina
00050000-5566-fe03-1257-e0986382c919	2250	Ptuj
00050000-5566-fe03-9cbf-6a53e2ac92a0	2323	Ptujska Gora
00050000-5566-fe03-71bb-226538c6f791	9201	Puconci
00050000-5566-fe03-64a1-5b6f4c7d8585	2327	Rače
00050000-5566-fe03-7749-aadc3f919047	1433	Radeče
00050000-5566-fe03-6175-bfde84397fbe	9252	Radenci
00050000-5566-fe03-27d0-cc89be5521a1	2360	Radlje ob Dravi
00050000-5566-fe03-d798-3a4d6d29f75b	1235	Radomlje
00050000-5566-fe03-f0be-3c7c27ef2ca4	4240	Radovljica
00050000-5566-fe03-3a7c-fafe4ae83830	8274	Raka
00050000-5566-fe03-a10d-84766938b94b	1381	Rakek
00050000-5566-fe03-24df-b3c4677d3a12	4283	Rateče - Planica
00050000-5566-fe03-3908-3db0090b22d2	2390	Ravne na Koroškem
00050000-5566-fe03-f31b-b38575395ddf	9246	Razkrižje
00050000-5566-fe03-a77b-1cb1c0871037	3332	Rečica ob Savinji
00050000-5566-fe03-25d2-0c42ef5fce6a	5292	Renče
00050000-5566-fe03-5f5e-e11100c202fa	1310	Ribnica
00050000-5566-fe03-52f1-62c682863b69	2364	Ribnica na Pohorju
00050000-5566-fe03-99c4-c6a767383f0b	3272	Rimske Toplice
00050000-5566-fe03-5e21-2ec0416a0784	1314	Rob
00050000-5566-fe03-bd76-b1adf95b9cc9	5215	Ročinj
00050000-5566-fe03-b636-77489721e377	3250	Rogaška Slatina
00050000-5566-fe03-26f6-9551f8f8502b	9262	Rogašovci
00050000-5566-fe03-4a50-d2d472252fec	3252	Rogatec
00050000-5566-fe03-9f4a-30274340e021	1373	Rovte
00050000-5566-fe03-da90-3516710f4afe	2342	Ruše
00050000-5566-fe03-0ff8-fad2e11efb40	1282	Sava
00050000-5566-fe03-27aa-e9682c649d0d	6333	Sečovlje/Sicciole
00050000-5566-fe03-032d-528ce7c12869	4227	Selca
00050000-5566-fe03-6f5b-96e937a595bf	2352	Selnica ob Dravi
00050000-5566-fe03-812b-205d33016cbc	8333	Semič
00050000-5566-fe03-e38b-973b5a8d5824	8281	Senovo
00050000-5566-fe03-b4eb-48d1bcb04c63	6224	Senožeče
00050000-5566-fe03-c0fd-14b0a4b03881	8290	Sevnica
00050000-5566-fe03-57aa-ec3e2c7a727b	6210	Sežana
00050000-5566-fe03-252e-3d4493c0273f	2214	Sladki Vrh
00050000-5566-fe03-d16f-9b4a36de127a	5283	Slap ob Idrijci
00050000-5566-fe03-a4b3-b5596f0ce172	2380	Slovenj Gradec
00050000-5566-fe03-1bb4-79d0fa42298e	2310	Slovenska Bistrica
00050000-5566-fe03-e3bb-090552722fb5	3210	Slovenske Konjice
00050000-5566-fe03-8e0b-ac8c4c9b5883	1216	Smlednik
00050000-5566-fe03-5e0b-fbf7c7dad5c6	5232	Soča
00050000-5566-fe03-7736-f3d798eac593	1317	Sodražica
00050000-5566-fe03-0ce3-0f21a43e4518	3335	Solčava
00050000-5566-fe03-987e-6048ea4fcfd7	5250	Solkan
00050000-5566-fe03-8d26-0e36d5a54d78	4229	Sorica
00050000-5566-fe03-60ba-2e6f27144dbd	4225	Sovodenj
00050000-5566-fe03-b859-caff58e23412	5281	Spodnja Idrija
00050000-5566-fe03-af0f-2f213acdd044	2241	Spodnji Duplek
00050000-5566-fe03-42c1-b8c663f448e3	9245	Spodnji Ivanjci
00050000-5566-fe03-fc35-4942d162e5d6	2277	Središče ob Dravi
00050000-5566-fe03-236e-70e3065c0ab1	4267	Srednja vas v Bohinju
00050000-5566-fe03-fcab-b08223f3dc7b	8256	Sromlje 
00050000-5566-fe03-434b-7e61dc5bf1ee	5224	Srpenica
00050000-5566-fe03-8091-09a599430a0f	1242	Stahovica
00050000-5566-fe03-b0c6-53a7f39cd7a3	1332	Stara Cerkev
00050000-5566-fe03-641c-be56308adc9e	8342	Stari trg ob Kolpi
00050000-5566-fe03-1630-140cc03aefaa	1386	Stari trg pri Ložu
00050000-5566-fe03-f509-2831c4352270	2205	Starše
00050000-5566-fe03-d89e-e6a4602e3243	2289	Stoperce
00050000-5566-fe03-44c0-bf359b9479d0	8322	Stopiče
00050000-5566-fe03-d0b3-4ae877b97d15	3206	Stranice
00050000-5566-fe03-0edf-cccd00187d99	8351	Straža
00050000-5566-fe03-0567-ef0f9d7044f9	1313	Struge
00050000-5566-fe03-1892-d30e0c4f20d3	8293	Studenec
00050000-5566-fe03-2dc9-7c527e2da031	8331	Suhor
00050000-5566-fe03-08a1-657aba9f376e	2233	Sv. Ana v Slovenskih goricah
00050000-5566-fe03-5cb5-1c90cf0340a5	2235	Sv. Trojica v Slovenskih goricah
00050000-5566-fe03-62d3-c0b9f70c95d1	2353	Sveti Duh na Ostrem Vrhu
00050000-5566-fe03-b47e-568724bfcaca	9244	Sveti Jurij ob Ščavnici
00050000-5566-fe03-cf89-b494eadf1a02	3264	Sveti Štefan
00050000-5566-fe03-5eb9-01fa9e77c710	2258	Sveti Tomaž
00050000-5566-fe03-c2bb-7eaec9e0b79f	9204	Šalovci
00050000-5566-fe03-f8f5-8b2863055f5f	5261	Šempas
00050000-5566-fe03-750f-15937405a287	5290	Šempeter pri Gorici
00050000-5566-fe03-9908-deca21e5a54f	3311	Šempeter v Savinjski dolini
00050000-5566-fe03-f3dc-a002234c9e24	4208	Šenčur
00050000-5566-fe03-78f4-a294439fa291	2212	Šentilj v Slovenskih goricah
00050000-5566-fe03-44a4-00e411f40d90	8297	Šentjanž
00050000-5566-fe03-6b07-6d7228321791	2373	Šentjanž pri Dravogradu
00050000-5566-fe03-81ef-7f3acddbf51f	8310	Šentjernej
00050000-5566-fe03-24cb-428a6765dee7	3230	Šentjur
00050000-5566-fe03-b207-7f44ca7ffeb9	3271	Šentrupert
00050000-5566-fe03-4adc-48421b52713a	8232	Šentrupert
00050000-5566-fe03-6317-9387a35daa55	1296	Šentvid pri Stični
00050000-5566-fe03-81f7-ce0c5f781aab	8275	Škocjan
00050000-5566-fe03-c457-9837c98fbe9a	6281	Škofije
00050000-5566-fe03-e152-dc20b8837db7	4220	Škofja Loka
00050000-5566-fe03-060b-8c2cdea8214b	3211	Škofja vas
00050000-5566-fe03-cf40-d66264bda227	1291	Škofljica
00050000-5566-fe03-37dc-6a882fb7a59e	6274	Šmarje
00050000-5566-fe03-f078-5f55271fa90b	1293	Šmarje - Sap
00050000-5566-fe03-d5c8-49eac0e5c8af	3240	Šmarje pri Jelšah
00050000-5566-fe03-1e5f-f99e0cd0498c	8220	Šmarješke Toplice
00050000-5566-fe03-b4fd-4aa3de414879	2315	Šmartno na Pohorju
00050000-5566-fe03-82a5-c6431ad4844d	3341	Šmartno ob Dreti
00050000-5566-fe03-4e90-b2d42c4d672d	3327	Šmartno ob Paki
00050000-5566-fe03-1e37-db1c4e799576	1275	Šmartno pri Litiji
00050000-5566-fe03-8542-c3eed3c67aed	2383	Šmartno pri Slovenj Gradcu
00050000-5566-fe03-c0ea-146a9be0ca6f	3201	Šmartno v Rožni dolini
00050000-5566-fe03-63c4-5e7571992c2e	3325	Šoštanj
00050000-5566-fe03-39a1-902eac43ca10	6222	Štanjel
00050000-5566-fe03-d9a0-e237b63340e5	3220	Štore
00050000-5566-fe03-9f2d-e0a9a6f6e901	3304	Tabor
00050000-5566-fe03-ca31-f8907beab85b	3221	Teharje
00050000-5566-fe03-d80b-1ddda0128e39	9251	Tišina
00050000-5566-fe03-ceab-6df1265c40d1	5220	Tolmin
00050000-5566-fe03-f716-109f88fde055	3326	Topolšica
00050000-5566-fe03-f522-a2b351d8ca78	2371	Trbonje
00050000-5566-fe03-a040-bdacdc4d0d10	1420	Trbovlje
00050000-5566-fe03-3179-c43b00f506f6	8231	Trebelno 
00050000-5566-fe03-76c8-bfbcab1ef8aa	8210	Trebnje
00050000-5566-fe03-7267-bd15e9a97b8c	5252	Trnovo pri Gorici
00050000-5566-fe03-667e-1386c4ef2731	2254	Trnovska vas
00050000-5566-fe03-05a3-4751f3df15d5	1222	Trojane
00050000-5566-fe03-c21e-4bb1f3cf450a	1236	Trzin
00050000-5566-fe03-6236-52d36970ff46	4290	Tržič
00050000-5566-fe03-5f0d-456417778da1	8295	Tržišče
00050000-5566-fe03-e284-5f74e684341e	1311	Turjak
00050000-5566-fe03-c72c-aed2fcad8447	9224	Turnišče
00050000-5566-fe03-1a65-44eaba32fe90	8323	Uršna sela
00050000-5566-fe03-5eed-ab5e666be135	1252	Vače
00050000-5566-fe03-51cd-cb5117744dd0	3320	Velenje 
00050000-5566-fe03-bc67-576ae0f3fa09	3322	Velenje - poštni predali
00050000-5566-fe03-bb2e-f567dd2fa8d1	8212	Velika Loka
00050000-5566-fe03-54eb-ef32173778af	2274	Velika Nedelja
00050000-5566-fe03-d162-7070bfa06f28	9225	Velika Polana
00050000-5566-fe03-742a-4bf8aca64a31	1315	Velike Lašče
00050000-5566-fe03-51bd-5a0969de25ad	8213	Veliki Gaber
00050000-5566-fe03-142e-092b24489626	9241	Veržej
00050000-5566-fe03-f2a6-56cee30b0517	1312	Videm - Dobrepolje
00050000-5566-fe03-38e5-aed43d515a48	2284	Videm pri Ptuju
00050000-5566-fe03-2026-790981aa853e	8344	Vinica
00050000-5566-fe03-bc12-e319d13be2c7	5271	Vipava
00050000-5566-fe03-53ea-7cfcf7f849b0	4212	Visoko
00050000-5566-fe03-77c6-a6df1b806c01	1294	Višnja Gora
00050000-5566-fe03-eea3-7d6171174db9	3205	Vitanje
00050000-5566-fe03-920c-ecb27c466b1b	2255	Vitomarci
00050000-5566-fe03-e164-37f211134346	1217	Vodice
00050000-5566-fe03-43e3-b3994d5d755e	3212	Vojnik\t
00050000-5566-fe03-5b6f-be7c2cef3604	5293	Volčja Draga
00050000-5566-fe03-4018-e31c0b808fe2	2232	Voličina
00050000-5566-fe03-212a-4646797af889	3305	Vransko
00050000-5566-fe03-3134-9a2eed15193c	6217	Vremski Britof
00050000-5566-fe03-b912-1ffaf49a932e	1360	Vrhnika
00050000-5566-fe03-422b-0028bc569593	2365	Vuhred
00050000-5566-fe03-b46e-3cfcb9767b8e	2367	Vuzenica
00050000-5566-fe03-7e06-aaf566d3d02a	8292	Zabukovje 
00050000-5566-fe03-20ae-2d930aff9b52	1410	Zagorje ob Savi
00050000-5566-fe03-ac1f-03b6063e3aa9	1303	Zagradec
00050000-5566-fe03-d409-b3fea5ca6efd	2283	Zavrč
00050000-5566-fe03-ab0b-2ef1c95717f8	8272	Zdole 
00050000-5566-fe03-e25d-e9b7e0e8a0ce	4201	Zgornja Besnica
00050000-5566-fe03-3639-be4c965e0147	2242	Zgornja Korena
00050000-5566-fe03-1ace-b4b8bbb4d292	2201	Zgornja Kungota
00050000-5566-fe03-6942-c8925452e804	2316	Zgornja Ložnica
00050000-5566-fe03-a786-5704bda05bc2	2314	Zgornja Polskava
00050000-5566-fe03-2615-0d6666baefb6	2213	Zgornja Velka
00050000-5566-fe03-c2e9-566def420ae8	4247	Zgornje Gorje
00050000-5566-fe03-6bc1-52978044e734	4206	Zgornje Jezersko
00050000-5566-fe03-d1d6-b383bf6496cc	2285	Zgornji Leskovec
00050000-5566-fe03-4fe5-26ac1ce2b64c	1432	Zidani Most
00050000-5566-fe03-e2d5-5043b8f032e2	3214	Zreče
00050000-5566-fe03-582a-25f97d8db51f	4209	Žabnica
00050000-5566-fe03-63a2-c813d3fb40c4	3310	Žalec
00050000-5566-fe03-70f0-9ff74b37a703	4228	Železniki
00050000-5566-fe03-314e-7b15402b4715	2287	Žetale
00050000-5566-fe03-1b7b-f827eb52d1bc	4226	Žiri
00050000-5566-fe03-2d4e-c93391a3adb9	4274	Žirovnica
00050000-5566-fe03-6f7c-2f5aa0c24dce	8360	Žužemberk
\.


--
-- TOC entry 2722 (class 0 OID 5417317)
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
-- TOC entry 2704 (class 0 OID 5417132)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5417210)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5417329)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5417449)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5417500)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5417358)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5566-fe04-19cf-7684e1797c66	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5566-fe04-5a6f-10f568ae801e	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5566-fe04-4407-f3c62d691026	0003	Kazinska	t	84	Kazinska dvorana
00220000-5566-fe04-cfb8-fe91d152d947	0004	Mali oder	t	24	Mali oder 
00220000-5566-fe04-3266-584170a31652	0005	Komorni oder	t	15	Komorni oder
00220000-5566-fe04-65b9-7b283bfe3692	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5566-fe04-ed10-163cb671dddd	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2720 (class 0 OID 5417302)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5417292)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5417489)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5417426)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5417005)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5566-fe03-6f69-7fa7386a6387	00010000-5566-fe03-c798-90a71efcce15	2015-05-28 13:37:41	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROqyDCwxD/JqlhfFiZgRJVmhs0Oux1g6O";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2729 (class 0 OID 5417368)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5417043)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5566-fe03-0f36-38f6cea4bccd	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5566-fe03-a24b-6421fda702ff	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5566-fe03-5496-7df21d8fcdd6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5566-fe03-b341-37f844a42f5f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5566-fe03-6eed-d8e4e8be8995	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5566-fe03-555c-290d498e404e	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2695 (class 0 OID 5417027)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5566-fe03-6f69-7fa7386a6387	00020000-5566-fe03-b341-37f844a42f5f
00010000-5566-fe03-c798-90a71efcce15	00020000-5566-fe03-b341-37f844a42f5f
\.


--
-- TOC entry 2731 (class 0 OID 5417382)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5417323)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5417273)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2749 (class 0 OID 5417597)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5566-fe03-99fb-78e3f0b24cf1	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5566-fe03-8f41-071b9d2b2fc5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5566-fe03-6ac1-26329ad062cc	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5566-fe03-cfc4-d54446e40c19	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5566-fe03-2ea7-f6fffcb14e1d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2748 (class 0 OID 5417590)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5566-fe03-cfc1-dffc006ffba7	00000000-5566-fe03-cfc4-d54446e40c19	popa
00000000-5566-fe03-1f82-52fc131336b7	00000000-5566-fe03-cfc4-d54446e40c19	oseba
00000000-5566-fe03-3960-a5d3dec64b40	00000000-5566-fe03-8f41-071b9d2b2fc5	prostor
00000000-5566-fe03-5db9-1970291f9409	00000000-5566-fe03-cfc4-d54446e40c19	besedilo
00000000-5566-fe03-a2eb-ff637fe1fdbd	00000000-5566-fe03-cfc4-d54446e40c19	uprizoritev
00000000-5566-fe03-a9a9-2f3dd4b343a0	00000000-5566-fe03-cfc4-d54446e40c19	funkcija
00000000-5566-fe03-8544-58eeb32b9008	00000000-5566-fe03-cfc4-d54446e40c19	tipfunkcije
00000000-5566-fe03-1d69-0735a45f528b	00000000-5566-fe03-cfc4-d54446e40c19	alternacija
\.


--
-- TOC entry 2747 (class 0 OID 5417585)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5417436)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5417104)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5417279)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5417478)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5566-fe03-cb76-1ddb454d627e	Inšpicient	Inšpicienti	f	Inšpicientka	\N
000f0000-5566-fe03-d9bc-09fa7b1d2de6	Tehnični vodja	Tehnične vodje	f	Tehnični vodja	\N
000f0000-5566-fe03-729e-9cb4c90eda5f	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5566-fe03-c06e-2ab9868824da	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5566-fe03-1189-4d93edd2688d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5566-fe03-fc5e-181ce443de69	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5566-fe03-e2b6-97d36bc1740d	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5566-fe03-5722-2ddc5bb5c76a	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5566-fe03-bc36-97aa01f1abaa	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5566-fe03-e998-fa4fb2ee2cc1	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5566-fe03-d1a7-4fb607dabff5	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5566-fe03-533e-9a8fe89f0e89	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5566-fe03-22f9-46ec896cb85f	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5566-fe03-8815-42f734d31e60	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5566-fe03-e31f-946eca078513	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5566-fe03-ccc6-15d9d61a3b9b	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5566-fe03-9586-c2d2d004fbf7	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5566-fe03-3972-c8d10adce916	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2707 (class 0 OID 5417167)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5417014)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5566-fe03-c798-90a71efcce15	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROn1cbKkTftEQSc/R9OHbi265tgPkg/5.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5566-fe04-10a7-32ba332ec0aa	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5566-fe04-c2a5-66b99b82079d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5566-fe03-6f69-7fa7386a6387	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 5417533)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5566-fe04-684b-55529a8fce1a	00160000-5566-fe04-2ee4-0d3de5307d1b	00150000-5566-fe03-c8ca-8b2c788d2163	00140000-5566-fe03-a5af-ea48795e0f24	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5566-fe04-3266-584170a31652
000e0000-5566-fe04-060a-a0cf8547841f	00160000-5566-fe04-bb6c-63e2b8c925ea	00150000-5566-fe03-ee9b-2915881584d7	00140000-5566-fe03-73fd-3ad5a2ca1b51	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5566-fe04-65b9-7b283bfe3692
\.


--
-- TOC entry 2712 (class 0 OID 5417225)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5566-fe04-66cc-03f3e633af71	000e0000-5566-fe04-060a-a0cf8547841f	1	
00200000-5566-fe04-6089-412ad73ec2ad	000e0000-5566-fe04-060a-a0cf8547841f	2	
\.


--
-- TOC entry 2727 (class 0 OID 5417350)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5417418)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5417257)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5417523)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5566-fe03-a5af-ea48795e0f24	Drama	drama (SURS 01)
00140000-5566-fe03-0451-551eeb17bd6f	Opera	opera (SURS 02)
00140000-5566-fe03-ba7f-dc1f8a77530b	Balet	balet (SURS 03)
00140000-5566-fe03-60de-4c23881b5198	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5566-fe03-f3f2-bafaf1bbe6aa	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5566-fe03-73fd-3ad5a2ca1b51	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5566-fe03-ee41-856dac407cba	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2733 (class 0 OID 5417408)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5566-fe03-c086-3ca8150cc4e6	Opera	opera
00150000-5566-fe03-073f-61e5293702b9	Opereta	opereta
00150000-5566-fe03-d44d-bb7231762aa2	Balet	balet
00150000-5566-fe03-44d3-f1eb6129e63e	Plesne prireditve	plesne prireditve
00150000-5566-fe03-2183-a2519fae0025	Lutkovno gledališče	lutkovno gledališče
00150000-5566-fe03-43c4-7e191d5d0749	Raziskovalno gledališče	raziskovalno gledališče
00150000-5566-fe03-c0ff-d0faa065483f	Biografska drama	biografska drama
00150000-5566-fe03-c8ca-8b2c788d2163	Komedija	komedija
00150000-5566-fe03-400a-dbe96e1aa935	Črna komedija	črna komedija
00150000-5566-fe03-44a2-9240faa65858	E-igra	E-igra
00150000-5566-fe03-ee9b-2915881584d7	Kriminalka	kriminalka
00150000-5566-fe03-f575-63f9a118d0eb	Musical	musical
\.


--
-- TOC entry 2314 (class 2606 OID 5417068)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 5417578)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 5417568)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5417477)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5417247)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 5417272)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5417193)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5417404)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5417223)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5417266)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 5417207)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 5417315)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5417342)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 5417165)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 5417077)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2320 (class 2606 OID 5417101)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 5417057)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2305 (class 2606 OID 5417042)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 5417348)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5417381)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 5417518)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 5417129)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 5417153)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 5417321)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 5417143)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 5417214)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 5417333)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 5417461)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5417505)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5417365)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 5417306)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 5417297)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5417499)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 5417433)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 5417013)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 5417372)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 5417031)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2307 (class 2606 OID 5417051)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 5417390)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5417328)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5417278)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5417603)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5417594)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5417589)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 5417446)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 5417109)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 5417288)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5417488)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 5417178)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 5417026)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5417548)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 5417232)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 5417356)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 5417424)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 5417261)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 5417532)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 5417417)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 1259 OID 5417254)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2452 (class 1259 OID 5417447)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2453 (class 1259 OID 5417448)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2327 (class 1259 OID 5417131)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2287 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2288 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2289 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2418 (class 1259 OID 5417349)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2412 (class 1259 OID 5417335)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2413 (class 1259 OID 5417334)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2364 (class 1259 OID 5417233)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 5417407)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2441 (class 1259 OID 5417405)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 5417406)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 5417209)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 5417208)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2469 (class 1259 OID 5417520)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 5417521)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5417522)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2477 (class 1259 OID 5417553)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2478 (class 1259 OID 5417550)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2479 (class 1259 OID 5417552)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2480 (class 1259 OID 5417551)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2342 (class 1259 OID 5417180)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 5417179)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 5417373)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2382 (class 1259 OID 5417267)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2309 (class 1259 OID 5417058)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2310 (class 1259 OID 5417059)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2433 (class 1259 OID 5417393)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2434 (class 1259 OID 5417392)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2435 (class 1259 OID 5417391)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2356 (class 1259 OID 5417215)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2357 (class 1259 OID 5417217)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2358 (class 1259 OID 5417216)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5417596)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2392 (class 1259 OID 5417301)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2393 (class 1259 OID 5417299)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2394 (class 1259 OID 5417298)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2395 (class 1259 OID 5417300)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2300 (class 1259 OID 5417032)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 5417033)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2421 (class 1259 OID 5417357)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2407 (class 1259 OID 5417322)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2448 (class 1259 OID 5417434)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2449 (class 1259 OID 5417435)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2331 (class 1259 OID 5417145)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2332 (class 1259 OID 5417144)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2333 (class 1259 OID 5417146)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2456 (class 1259 OID 5417462)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2457 (class 1259 OID 5417463)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2490 (class 1259 OID 5417582)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 5417581)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2492 (class 1259 OID 5417584)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2493 (class 1259 OID 5417580)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2494 (class 1259 OID 5417583)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2445 (class 1259 OID 5417425)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 5417310)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2399 (class 1259 OID 5417309)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2400 (class 1259 OID 5417307)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2401 (class 1259 OID 5417308)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2283 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 5417570)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 5417569)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2363 (class 1259 OID 5417224)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2315 (class 1259 OID 5417079)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2316 (class 1259 OID 5417078)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2323 (class 1259 OID 5417110)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2324 (class 1259 OID 5417111)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 5417291)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2388 (class 1259 OID 5417290)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2389 (class 1259 OID 5417289)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2370 (class 1259 OID 5417256)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2371 (class 1259 OID 5417252)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2372 (class 1259 OID 5417249)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2373 (class 1259 OID 5417250)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2374 (class 1259 OID 5417248)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2375 (class 1259 OID 5417253)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2376 (class 1259 OID 5417251)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2330 (class 1259 OID 5417130)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2348 (class 1259 OID 5417194)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5417196)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2350 (class 1259 OID 5417195)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2351 (class 1259 OID 5417197)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2406 (class 1259 OID 5417316)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2474 (class 1259 OID 5417519)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 5417549)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2321 (class 1259 OID 5417102)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5417103)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5417604)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2341 (class 1259 OID 5417166)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5417595)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2426 (class 1259 OID 5417367)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2427 (class 1259 OID 5417366)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2495 (class 1259 OID 5417579)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2286 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2338 (class 1259 OID 5417154)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 5417506)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 5417052)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2377 (class 1259 OID 5417255)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2529 (class 2606 OID 5417735)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2532 (class 2606 OID 5417720)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2531 (class 2606 OID 5417725)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2527 (class 2606 OID 5417745)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2533 (class 2606 OID 5417715)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2528 (class 2606 OID 5417740)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2530 (class 2606 OID 5417730)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2563 (class 2606 OID 5417890)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2562 (class 2606 OID 5417895)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5417650)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2550 (class 2606 OID 5417830)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2548 (class 2606 OID 5417825)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2549 (class 2606 OID 5417820)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2526 (class 2606 OID 5417710)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5417870)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2558 (class 2606 OID 5417860)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5417865)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2520 (class 2606 OID 5417685)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2521 (class 2606 OID 5417680)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2546 (class 2606 OID 5417810)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2569 (class 2606 OID 5417915)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2568 (class 2606 OID 5417920)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2567 (class 2606 OID 5417925)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2570 (class 2606 OID 5417945)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2573 (class 2606 OID 5417930)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2571 (class 2606 OID 5417940)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2572 (class 2606 OID 5417935)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2518 (class 2606 OID 5417675)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 5417670)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5417635)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2552 (class 2606 OID 5417840)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2534 (class 2606 OID 5417750)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 5417615)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 5417620)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2553 (class 2606 OID 5417855)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2554 (class 2606 OID 5417850)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2555 (class 2606 OID 5417845)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2524 (class 2606 OID 5417690)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2522 (class 2606 OID 5417700)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2523 (class 2606 OID 5417695)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2581 (class 2606 OID 5417985)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2538 (class 2606 OID 5417785)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2540 (class 2606 OID 5417775)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2541 (class 2606 OID 5417770)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2539 (class 2606 OID 5417780)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 5417605)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 5417610)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2551 (class 2606 OID 5417835)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2547 (class 2606 OID 5417815)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2561 (class 2606 OID 5417880)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2560 (class 2606 OID 5417885)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 5417660)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2517 (class 2606 OID 5417655)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5417665)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 5417900)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2564 (class 2606 OID 5417905)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2578 (class 2606 OID 5417970)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2579 (class 2606 OID 5417965)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2576 (class 2606 OID 5417980)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2580 (class 2606 OID 5417960)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2577 (class 2606 OID 5417975)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2559 (class 2606 OID 5417875)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2542 (class 2606 OID 5417805)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2543 (class 2606 OID 5417800)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2545 (class 2606 OID 5417790)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2544 (class 2606 OID 5417795)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2574 (class 2606 OID 5417955)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2575 (class 2606 OID 5417950)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2525 (class 2606 OID 5417705)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5417910)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 5417630)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 5417625)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2513 (class 2606 OID 5417640)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 5417645)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2535 (class 2606 OID 5417765)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2536 (class 2606 OID 5417760)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2537 (class 2606 OID 5417755)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-28 13:37:41 CEST

--
-- PostgreSQL database dump complete
--

