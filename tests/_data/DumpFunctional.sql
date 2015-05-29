--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-29 14:43:30 CEST

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
-- TOC entry 180 (class 1259 OID 5535573)
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
-- TOC entry 227 (class 1259 OID 5536084)
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
-- TOC entry 226 (class 1259 OID 5536067)
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
-- TOC entry 219 (class 1259 OID 5535977)
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
-- TOC entry 194 (class 1259 OID 5535747)
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
-- TOC entry 197 (class 1259 OID 5535781)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5535694)
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
-- TOC entry 213 (class 1259 OID 5535907)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    vodjaekipe boolean,
    naziv character varying(255) NOT NULL,
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
-- TOC entry 192 (class 1259 OID 5535731)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5535775)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5535711)
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
-- TOC entry 202 (class 1259 OID 5535824)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5535849)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5535668)
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
-- TOC entry 181 (class 1259 OID 5535582)
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
-- TOC entry 182 (class 1259 OID 5535593)
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
-- TOC entry 177 (class 1259 OID 5535547)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5535566)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5535856)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5535887)
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
-- TOC entry 223 (class 1259 OID 5536020)
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
-- TOC entry 184 (class 1259 OID 5535625)
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
-- TOC entry 186 (class 1259 OID 5535660)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5535830)
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
-- TOC entry 185 (class 1259 OID 5535645)
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
-- TOC entry 191 (class 1259 OID 5535723)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5535842)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5535962)
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
-- TOC entry 222 (class 1259 OID 5536013)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5535871)
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
-- TOC entry 201 (class 1259 OID 5535815)
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
-- TOC entry 200 (class 1259 OID 5535805)
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
-- TOC entry 221 (class 1259 OID 5536002)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5535939)
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
-- TOC entry 174 (class 1259 OID 5535518)
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
-- TOC entry 173 (class 1259 OID 5535516)
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
-- TOC entry 210 (class 1259 OID 5535881)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5535556)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5535540)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5535895)
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
-- TOC entry 204 (class 1259 OID 5535836)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5535786)
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
-- TOC entry 230 (class 1259 OID 5536110)
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
-- TOC entry 229 (class 1259 OID 5536103)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5536098)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5535949)
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
-- TOC entry 183 (class 1259 OID 5535617)
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
-- TOC entry 199 (class 1259 OID 5535792)
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
-- TOC entry 220 (class 1259 OID 5535991)
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
-- TOC entry 188 (class 1259 OID 5535680)
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
-- TOC entry 175 (class 1259 OID 5535527)
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
-- TOC entry 225 (class 1259 OID 5536046)
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
-- TOC entry 193 (class 1259 OID 5535738)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5535863)
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
-- TOC entry 215 (class 1259 OID 5535931)
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
-- TOC entry 195 (class 1259 OID 5535770)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5536036)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5535921)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2144 (class 2604 OID 5535521)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2699 (class 0 OID 5535573)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5536084)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5568-5ef1-cdbb-373b0c248bb8	000d0000-5568-5ef1-7094-21290196d6ab	\N	00090000-5568-5ef1-e04e-b06aed2dfd8d	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5568-5ef1-247a-cb5d4b1f5ada	000d0000-5568-5ef1-f6d8-06355e961ec4	\N	00090000-5568-5ef1-1de4-69443e2c6e8e	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-5568-5ef1-7a02-7117a3178498	000d0000-5568-5ef1-8439-8ce9988534dd	\N	00090000-5568-5ef1-cd83-994c315ef6a7	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-5568-5ef1-12b7-2db132680a94	000d0000-5568-5ef1-fc50-96ee3cc1a7a9	\N	00090000-5568-5ef1-9245-979b7341ca72	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-5568-5ef1-8735-b8b7b2b4c67b	000d0000-5568-5ef1-453a-f4ff51fc661a	\N	00090000-5568-5ef1-67ad-a100e8243a1f	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5536067)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5535977)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5568-5ef1-edb8-7efa4be9bc5d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5568-5ef1-82a2-109b8a1c9bb4	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5568-5ef1-4d2d-562bc4427025	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2713 (class 0 OID 5535747)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5568-5ef1-e208-e20c83e41fe5	\N	\N	00200000-5568-5ef1-ad48-d4e5418a1107	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-5568-5ef1-e4d7-65ad12300864	\N	\N	00200000-5568-5ef1-267e-43fa1bacd700	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
\.


--
-- TOC entry 2716 (class 0 OID 5535781)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5535694)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5568-5ef0-2d0f-bf7d3d79b2d2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5568-5ef0-3aba-d434a38a7ceb	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5568-5ef0-de83-04e2aeefc62d	AL	ALB	008	Albania 	Albanija	\N
00040000-5568-5ef0-db36-34d55f4d8985	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5568-5ef0-8cc8-1e86fc9bb9f5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5568-5ef0-7d5d-69bc0d3d52c0	AD	AND	020	Andorra 	Andora	\N
00040000-5568-5ef0-35c8-423d36128eba	AO	AGO	024	Angola 	Angola	\N
00040000-5568-5ef0-e698-6889f48adcb6	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5568-5ef0-5354-7695e6488452	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5568-5ef0-15c4-2b50111e80a0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5568-5ef0-c137-e16a9f431ebc	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5568-5ef0-74bc-2cf0285d1c5c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5568-5ef0-b6ca-9780185105bd	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5568-5ef0-a245-62bec0b77ef2	AU	AUS	036	Australia 	Avstralija	\N
00040000-5568-5ef0-3c1b-53d5ea4cfa6a	AT	AUT	040	Austria 	Avstrija	\N
00040000-5568-5ef0-cf09-42a6973f93a1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5568-5ef0-4dbb-df01f07a8f6c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5568-5ef0-6a74-3caaef76c17f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5568-5ef0-f3f8-82afe6b19056	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5568-5ef0-b3a4-47ccc2aa5c3e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5568-5ef0-fc6a-972613c01938	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5568-5ef0-9c79-db9ca03abea3	BE	BEL	056	Belgium 	Belgija	\N
00040000-5568-5ef0-899f-532ba20bfaa7	BZ	BLZ	084	Belize 	Belize	\N
00040000-5568-5ef0-77c3-33e4eb59c89c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5568-5ef0-2404-b8ea647ad9e2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5568-5ef0-ed07-d3a4b5d92d8b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5568-5ef0-6bf6-518d013bc62e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5568-5ef0-9d5b-3d97dfd6f9b9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5568-5ef0-5af7-9f06035fb4c5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5568-5ef0-9fc7-66ace3b8b58f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5568-5ef0-cadd-82e1497077d5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5568-5ef0-363e-24e4363c045b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5568-5ef0-be16-317cf9b4be0e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5568-5ef0-68d6-c82fcfac90ad	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5568-5ef0-8288-1ab30c40956d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5568-5ef0-8f10-cb0a856c501d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5568-5ef0-8535-0139a5cddc5a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5568-5ef0-9504-0d2c20222dce	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5568-5ef0-3665-c9d81516bbad	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5568-5ef0-8b38-78f9ff0a18c4	CA	CAN	124	Canada 	Kanada	\N
00040000-5568-5ef0-d417-0cd53f2adbd0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5568-5ef0-8d56-fc4a618c7b0c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5568-5ef0-b789-ca622d23e3da	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5568-5ef0-fed4-2e77f3b48391	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5568-5ef0-cee8-e631510e9378	CL	CHL	152	Chile 	Čile	\N
00040000-5568-5ef0-422b-e7ff3fb4670e	CN	CHN	156	China 	Kitajska	\N
00040000-5568-5ef0-f169-e0e1fab88153	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5568-5ef0-2365-e3470467b54c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5568-5ef0-4708-ab28a486ace3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5568-5ef0-8948-148140ee975e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5568-5ef0-3c03-746d2ac5e6fd	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5568-5ef0-6c99-cea557e2bfa0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5568-5ef0-8106-95e2d3f421fa	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5568-5ef0-8a88-7f30fbe8879f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5568-5ef0-0241-eda3b2df25a4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5568-5ef0-5bf7-41405659706d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5568-5ef0-2de5-4f181e71820b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5568-5ef0-f74c-23384aabf5d8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5568-5ef0-df89-4141881d6e58	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5568-5ef0-3d07-7b1118dd454a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5568-5ef0-a37b-9d9dd02dfade	DK	DNK	208	Denmark 	Danska	\N
00040000-5568-5ef0-d83c-9011f77a68e2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5568-5ef0-6d5a-d3cf7d81a71a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5568-5ef0-48e1-4cd8b470de3d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5568-5ef0-b453-caf40de5bda0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5568-5ef0-1fc9-9a315071a143	EG	EGY	818	Egypt 	Egipt	\N
00040000-5568-5ef0-c985-6dd795f33e7b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5568-5ef0-6a4a-c0604238f7ec	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5568-5ef0-a135-ddc9f3845d1b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5568-5ef0-7abf-4b24ce4c6027	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5568-5ef0-b3fa-7b2bec7096a2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5568-5ef0-491e-e227ec3743f8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5568-5ef0-3add-554edb2e7b56	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5568-5ef0-e590-883635972c2f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5568-5ef0-7b54-80cad6ad71dc	FI	FIN	246	Finland 	Finska	\N
00040000-5568-5ef0-85fb-4ad59c9488eb	FR	FRA	250	France 	Francija	\N
00040000-5568-5ef0-4c49-6ca0c62069db	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5568-5ef0-3e41-7a47e6158830	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5568-5ef0-dbcd-0b63479e07a0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5568-5ef0-ac72-5f4fcff5cbe2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5568-5ef0-5331-c21b49607629	GA	GAB	266	Gabon 	Gabon	\N
00040000-5568-5ef0-70f3-dabf39921ba8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5568-5ef0-806a-e4556b3b6527	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5568-5ef0-1b6f-9e7627560c04	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5568-5ef0-bb55-0c368e183c59	GH	GHA	288	Ghana 	Gana	\N
00040000-5568-5ef0-9d6f-b1812c97e1f5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5568-5ef0-7e0f-f7571e1ed8f4	GR	GRC	300	Greece 	Grčija	\N
00040000-5568-5ef0-1aeb-a458d6ff6c8b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5568-5ef0-d8a0-01c101934a14	GD	GRD	308	Grenada 	Grenada	\N
00040000-5568-5ef0-e1d3-5b7cf7af9074	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5568-5ef0-d5c2-c58a893c7b0b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5568-5ef0-1fe6-f809e2190ca1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5568-5ef0-41d5-6dd416a29cd6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5568-5ef0-f55f-f977f798ea54	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5568-5ef0-22ed-a75e53265723	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5568-5ef0-a1dc-1df605fa6ee7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5568-5ef0-8036-4a3eb1c5b561	HT	HTI	332	Haiti 	Haiti	\N
00040000-5568-5ef0-545b-a0759ddc0517	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5568-5ef0-030f-c2ec7a9e028a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5568-5ef0-a79d-1ec7909d4339	HN	HND	340	Honduras 	Honduras	\N
00040000-5568-5ef0-eb3f-5956a332212f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5568-5ef0-d9b5-898acd119bf8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5568-5ef0-cb7e-0f12bbf7b057	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5568-5ef0-0463-2940b22fe33e	IN	IND	356	India 	Indija	\N
00040000-5568-5ef0-b8dc-9458b6156641	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5568-5ef0-3414-6167a8825f32	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5568-5ef0-a428-dfb3145c3582	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5568-5ef0-a7ec-a03bd299a583	IE	IRL	372	Ireland 	Irska	\N
00040000-5568-5ef0-cef6-8bf858d80fca	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5568-5ef0-9ed8-891b14d53bfb	IL	ISR	376	Israel 	Izrael	\N
00040000-5568-5ef0-8852-58ec21f8a700	IT	ITA	380	Italy 	Italija	\N
00040000-5568-5ef0-1d66-c85342db4892	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5568-5ef0-bce1-c1fbd23d18ef	JP	JPN	392	Japan 	Japonska	\N
00040000-5568-5ef0-661e-69c48e027ec1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5568-5ef0-89cb-258afa71865d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5568-5ef0-ced5-5c590fe82d09	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5568-5ef0-b15a-15b886b01f90	KE	KEN	404	Kenya 	Kenija	\N
00040000-5568-5ef0-61cc-6d71f623330b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5568-5ef0-1818-fcbe859bf2c6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5568-5ef0-a5cb-e6f0bee26970	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5568-5ef0-5776-33313bb73b59	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5568-5ef0-826e-f6612f38ecb0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5568-5ef0-8070-b6b7e69f77aa	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5568-5ef0-f4f8-abdfc3453d67	LV	LVA	428	Latvia 	Latvija	\N
00040000-5568-5ef0-8921-7129e8ddff1d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5568-5ef0-b416-c0ec6cbc64f7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5568-5ef0-436b-7a77b59b8cfc	LR	LBR	430	Liberia 	Liberija	\N
00040000-5568-5ef0-8a74-27f5faa9a504	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5568-5ef0-a264-ecf45686ef99	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5568-5ef0-193f-29aa9167574e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5568-5ef0-05a2-1f13d49c9fd7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5568-5ef0-e932-d7127abf09b8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5568-5ef0-6472-a23be2d5dcc9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5568-5ef0-a90f-0735a0b8f7a8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5568-5ef0-4f4e-3994c94123f9	MW	MWI	454	Malawi 	Malavi	\N
00040000-5568-5ef0-89a3-a53af086e4b1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5568-5ef0-8be1-2d8643df0886	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5568-5ef0-2769-526d8c5565c3	ML	MLI	466	Mali 	Mali	\N
00040000-5568-5ef0-c65b-b664111723ef	MT	MLT	470	Malta 	Malta	\N
00040000-5568-5ef0-45f2-8e18f7199350	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5568-5ef0-5578-cfd52000102b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5568-5ef0-b6ee-6b0ddf50fac9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5568-5ef0-81f6-0ffdcbb3d08c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5568-5ef0-64bc-49b39ecbe4e5	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5568-5ef0-2a49-859811590e3f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5568-5ef0-5b59-58062d8d4998	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5568-5ef0-fa41-225f2676adb6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5568-5ef0-dd8a-77af72cd58a3	MC	MCO	492	Monaco 	Monako	\N
00040000-5568-5ef0-829a-4657dc4271b5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5568-5ef0-d7cf-7724a4c7e13f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5568-5ef0-efba-c7f8fa54e08d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5568-5ef0-92c7-aaf505f09b8e	MA	MAR	504	Morocco 	Maroko	\N
00040000-5568-5ef0-d78d-2c0418560d41	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5568-5ef0-42a0-5252a4efab11	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5568-5ef0-cf0a-dbbddc1e03de	NA	NAM	516	Namibia 	Namibija	\N
00040000-5568-5ef0-d7f6-b492be390417	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5568-5ef0-dea8-d1fed1d8a1cd	NP	NPL	524	Nepal 	Nepal	\N
00040000-5568-5ef0-393a-ec86218de73b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5568-5ef0-9083-85db96717531	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5568-5ef0-c869-17bb9887ac25	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5568-5ef0-20cb-5a8016edb5aa	NE	NER	562	Niger 	Niger 	\N
00040000-5568-5ef0-ff9a-5073691dc69b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5568-5ef0-0eaf-6d7623d193c6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5568-5ef0-599a-880701ba8db7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5568-5ef0-d205-fb936395d17e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5568-5ef0-56ec-a9050951fc4a	NO	NOR	578	Norway 	Norveška	\N
00040000-5568-5ef0-04f0-1bfbb55fe912	OM	OMN	512	Oman 	Oman	\N
00040000-5568-5ef0-c0c3-1cd04805ce4c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5568-5ef0-0eac-38daa898fa82	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5568-5ef0-db24-1a4b80c0f8b6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5568-5ef0-51f7-02dc9a7ec30b	PA	PAN	591	Panama 	Panama	\N
00040000-5568-5ef0-95ac-8deb6ef805db	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5568-5ef0-04d2-ae4d3f07344c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5568-5ef0-2626-159604f4caee	PE	PER	604	Peru 	Peru	\N
00040000-5568-5ef0-32e2-e0472559bdee	PH	PHL	608	Philippines 	Filipini	\N
00040000-5568-5ef0-b29f-d3bba685a42b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5568-5ef0-dc6d-538bf717b22a	PL	POL	616	Poland 	Poljska	\N
00040000-5568-5ef0-3c81-b7daaf193935	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5568-5ef0-84f9-15780ddee218	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5568-5ef0-4a3c-10e87779076d	QA	QAT	634	Qatar 	Katar	\N
00040000-5568-5ef0-d983-a686d5fef062	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5568-5ef0-45fd-e0c5e84d88c7	RO	ROU	642	Romania 	Romunija	\N
00040000-5568-5ef0-c4c9-1e1892d755d5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5568-5ef0-98f8-29834a0f7c8c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5568-5ef0-8909-f5a75bf88c74	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5568-5ef0-f81d-9b8daed6b7fb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5568-5ef0-101b-5bbc162bef48	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5568-5ef0-ea8c-e17ea132e86b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5568-5ef0-e40c-57e8d5176661	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5568-5ef0-841d-b69e9bd580ba	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5568-5ef0-f32c-497a75b18a59	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5568-5ef0-5cc1-cdc7caf85214	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5568-5ef0-f96a-6920af88d39c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5568-5ef0-8f4b-e80f9c41dc72	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5568-5ef0-181c-ff13411b56ec	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5568-5ef0-1391-90e958f041d7	SN	SEN	686	Senegal 	Senegal	\N
00040000-5568-5ef0-cc9b-61a027edec95	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5568-5ef0-b0e3-bf7e9c995d9c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5568-5ef0-2f03-52544defe4c4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5568-5ef0-bda9-b6cbc3829579	SG	SGP	702	Singapore 	Singapur	\N
00040000-5568-5ef0-7604-719a4447aa53	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5568-5ef0-a735-750fdb5fe512	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5568-5ef0-fe1d-03e3df603980	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5568-5ef0-2fd1-4f2aab503964	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5568-5ef0-8cdc-20b0e70e3a9d	SO	SOM	706	Somalia 	Somalija	\N
00040000-5568-5ef0-1e8f-94f7ff9f8f9e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5568-5ef0-5435-c7a52c2bb560	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5568-5ef0-d703-bce7aabaac6a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5568-5ef0-5913-ee0efe50d190	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5568-5ef0-dad5-397cc3503b04	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5568-5ef0-46ec-5140ae024b5b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5568-5ef0-508a-7aed1dd8ceb3	SR	SUR	740	Suriname 	Surinam	\N
00040000-5568-5ef0-0956-8ab5178043fe	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5568-5ef0-6522-1f3d6d88f4c5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5568-5ef0-8d5c-b3c4d408ced1	SE	SWE	752	Sweden 	Švedska	\N
00040000-5568-5ef0-0515-74511c5c2782	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5568-5ef0-2c79-141227f5384f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5568-5ef0-248e-fa0f3cdf75bd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5568-5ef0-b69d-cbb211b1ac3a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5568-5ef0-2d5e-f9e1fb360b85	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5568-5ef0-c4f9-ad9b44d3506e	TH	THA	764	Thailand 	Tajska	\N
00040000-5568-5ef0-f3ec-a712883a6e6c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5568-5ef0-979f-5e6ff1c8f0a3	TG	TGO	768	Togo 	Togo	\N
00040000-5568-5ef0-0b5f-4cb4b44fd735	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5568-5ef0-f907-099983e2d912	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5568-5ef0-0d81-17d9d99f19ee	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5568-5ef0-01b0-b2072b6f4eeb	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5568-5ef0-120b-3ee3cfa10e96	TR	TUR	792	Turkey 	Turčija	\N
00040000-5568-5ef0-0f7d-3b56bd98e409	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5568-5ef0-bdfc-3240e92854f7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5568-5ef0-0767-4a7fcb8bf88d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5568-5ef0-a7b5-1080940f7b77	UG	UGA	800	Uganda 	Uganda	\N
00040000-5568-5ef0-0e47-e25eacdaeca5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5568-5ef0-5d77-b8c86387b8b4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5568-5ef0-2fc5-48f0cf597572	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5568-5ef0-d37d-0da1a6cdeb28	US	USA	840	United States 	Združene države Amerike	\N
00040000-5568-5ef0-762c-2237d7d3fb7e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5568-5ef0-c6f6-5dacc99771de	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5568-5ef0-5aba-0e10d9b29531	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5568-5ef0-4fba-8809edd19525	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5568-5ef0-1225-8d7267f691d6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5568-5ef0-9908-f4562d63189d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5568-5ef0-2afb-47439969f8ef	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5568-5ef0-2278-823316d18c9f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5568-5ef0-9260-aef12ec12760	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5568-5ef0-339c-e68b2f4d00a3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5568-5ef0-bacb-9db77d92ae6d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5568-5ef0-b95f-58ed3b420809	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5568-5ef0-900a-e5dc01de1061	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2732 (class 0 OID 5535907)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-5568-5ef1-c3f1-6ae9e1994fc1	000e0000-5568-5ef1-7dc7-5b0be6a7932e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5568-5ef0-6d63-91e18cb2d2ab
000d0000-5568-5ef1-7094-21290196d6ab	000e0000-5568-5ef1-7dc7-5b0be6a7932e	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5568-5ef0-6d63-91e18cb2d2ab
000d0000-5568-5ef1-f6d8-06355e961ec4	000e0000-5568-5ef1-7dc7-5b0be6a7932e	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5568-5ef0-d2f5-be6010cfeef5
000d0000-5568-5ef1-8439-8ce9988534dd	000e0000-5568-5ef1-7dc7-5b0be6a7932e	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5568-5ef0-0d64-cfca5ee9efb5
000d0000-5568-5ef1-fc50-96ee3cc1a7a9	000e0000-5568-5ef1-7dc7-5b0be6a7932e	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5568-5ef0-0d64-cfca5ee9efb5
000d0000-5568-5ef1-453a-f4ff51fc661a	000e0000-5568-5ef1-7dc7-5b0be6a7932e	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5568-5ef0-0d64-cfca5ee9efb5
\.


--
-- TOC entry 2711 (class 0 OID 5535731)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5535775)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5535711)
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
-- TOC entry 2721 (class 0 OID 5535824)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5535849)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 5535668)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5568-5ef0-c7ab-37d31f5c1692	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5568-5ef0-e3e8-ed8287f3d564	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5568-5ef0-2952-6e7b10509a30	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5568-5ef0-8b75-aab495178358	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5568-5ef0-26fd-669140f260ca	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5568-5ef0-a9ca-b69249e0edfc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5568-5ef0-d4fa-fb8cff898a8b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5568-5ef0-da7b-13ce12ea9f44	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5568-5ef0-b35e-0a8f87c75530	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5568-5ef0-137f-be44f2f688da	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5568-5ef0-7283-cdf5418ee711	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5568-5ef0-7273-8c7c323df3c3	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5568-5ef0-15b8-accc32982bcd	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5568-5ef0-c9cf-15c8f4fdf2cc	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5568-5ef0-7c0d-c2c536384af3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2700 (class 0 OID 5535582)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5568-5ef0-79eb-89b4b9014a17	00000000-5568-5ef0-26fd-669140f260ca	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5568-5ef0-9b57-a45726160e7e	00000000-5568-5ef0-26fd-669140f260ca	00010000-5568-5ef0-7cf1-de339d820b95	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5568-5ef0-b8b4-67249a473307	00000000-5568-5ef0-a9ca-b69249e0edfc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2701 (class 0 OID 5535593)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5568-5ef1-eb7e-b33cc7c30eee	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5568-5ef1-9245-979b7341ca72	00010000-5568-5ef1-5030-9c34d62c6461	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5568-5ef1-cd83-994c315ef6a7	00010000-5568-5ef1-ac7b-c069106fad77	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5568-5ef1-d7f2-9a5e845f2a1b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5568-5ef1-abe9-85bec88ffd0f	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5568-5ef1-70e7-69f07493c210	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5568-5ef1-23b0-54690c9f65ab	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5568-5ef1-fc2e-f1ac86e9ae67	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5568-5ef1-e04e-b06aed2dfd8d	00010000-5568-5ef1-ef3e-1c4c498cf795	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5568-5ef1-1de4-69443e2c6e8e	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5568-5ef1-197e-120c844c67bb	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5568-5ef1-67ad-a100e8243a1f	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 2691 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5535547)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5568-5ef0-87a2-29a809860ec2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5568-5ef0-e642-5e43f99a38a0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5568-5ef0-d7b2-803d9b7db7ba	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5568-5ef0-ac89-d34aa4db6b9d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5568-5ef0-1c8b-928b80407c55	Abonma-read	Abonma - branje	f
00030000-5568-5ef0-949a-0e32fc120e83	Abonma-write	Abonma - spreminjanje	f
00030000-5568-5ef0-624a-da1e79f3b8cc	Alternacija-read	Alternacija - branje	f
00030000-5568-5ef0-a033-03e4d0bf6d18	Alternacija-write	Alternacija - spreminjanje	f
00030000-5568-5ef0-ac80-27278c1ef254	Arhivalija-read	Arhivalija - branje	f
00030000-5568-5ef0-02d4-086c17a10c18	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5568-5ef0-ed49-3efe490b6daf	Besedilo-read	Besedilo - branje	f
00030000-5568-5ef0-d36f-baf6cb6aca67	Besedilo-write	Besedilo - spreminjanje	f
00030000-5568-5ef0-e258-5f429df5ceab	DogodekIzven-read	DogodekIzven - branje	f
00030000-5568-5ef0-e60f-f3cd384bd356	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5568-5ef0-4d0e-0561ec9af5aa	Dogodek-read	Dogodek - branje	f
00030000-5568-5ef0-9846-8faff79f5c3b	Dogodek-write	Dogodek - spreminjanje	f
00030000-5568-5ef0-60a7-ca5ab7e52820	Drzava-read	Drzava - branje	f
00030000-5568-5ef0-6524-b68733a9daca	Drzava-write	Drzava - spreminjanje	f
00030000-5568-5ef0-d52c-3611922480b3	Funkcija-read	Funkcija - branje	f
00030000-5568-5ef0-7908-2c57e508a37f	Funkcija-write	Funkcija - spreminjanje	f
00030000-5568-5ef0-c5a3-e26e91822199	Gostovanje-read	Gostovanje - branje	f
00030000-5568-5ef0-1973-c7ac0cf26d6c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5568-5ef0-48ab-17dad6e34155	Gostujoca-read	Gostujoca - branje	f
00030000-5568-5ef0-4cb1-96a5ed4448d3	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5568-5ef0-cf8f-bfea0692e4aa	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5568-5ef0-ce6f-56d955fb817f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5568-5ef0-d575-2b1e8fd8b4a0	Kupec-read	Kupec - branje	f
00030000-5568-5ef0-c2bc-bf1784d4b33e	Kupec-write	Kupec - spreminjanje	f
00030000-5568-5ef0-bb95-4f8ade8220bf	NacinPlacina-read	NacinPlacina - branje	f
00030000-5568-5ef0-e52b-a770c870ad34	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5568-5ef0-d0ed-40e6b8ccfe7e	Option-read	Option - branje	f
00030000-5568-5ef0-4484-2e162d997025	Option-write	Option - spreminjanje	f
00030000-5568-5ef0-d291-185fe5e74da7	OptionValue-read	OptionValue - branje	f
00030000-5568-5ef0-13e3-b1f8b93b4a33	OptionValue-write	OptionValue - spreminjanje	f
00030000-5568-5ef0-ce6f-e53ebfd7b23e	Oseba-read	Oseba - branje	f
00030000-5568-5ef0-edb7-96e7038b4fba	Oseba-write	Oseba - spreminjanje	f
00030000-5568-5ef0-975f-d3841a41e31d	Permission-read	Permission - branje	f
00030000-5568-5ef0-a7d7-73cc7587d37e	Permission-write	Permission - spreminjanje	f
00030000-5568-5ef0-36f8-87228f9f02ec	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5568-5ef0-23f2-011d022dcbcd	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5568-5ef0-765e-539764cc9d54	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5568-5ef0-0807-79cd27138018	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5568-5ef0-5b5b-079c5354023f	Pogodba-read	Pogodba - branje	f
00030000-5568-5ef0-1716-b8347be6b095	Pogodba-write	Pogodba - spreminjanje	f
00030000-5568-5ef0-493a-020daed5eb18	Popa-read	Popa - branje	f
00030000-5568-5ef0-f3e4-607795f2c0db	Popa-write	Popa - spreminjanje	f
00030000-5568-5ef0-39e2-d8357c98efa3	Posta-read	Posta - branje	f
00030000-5568-5ef0-bf79-1374f93f2e5b	Posta-write	Posta - spreminjanje	f
00030000-5568-5ef0-7285-85278e787f6a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5568-5ef0-6d45-a9e935cf4151	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5568-5ef0-cbda-66334ec5a141	PostniNaslov-read	PostniNaslov - branje	f
00030000-5568-5ef0-3848-7238ba7c28e7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5568-5ef0-9273-1880051c434c	Predstava-read	Predstava - branje	f
00030000-5568-5ef0-f3e0-c93c8d2a9638	Predstava-write	Predstava - spreminjanje	f
00030000-5568-5ef0-9bec-5aa894e2b4bd	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5568-5ef0-9e6e-b9ee377a7177	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5568-5ef0-e3e8-81cc161c1387	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5568-5ef0-b336-e2fdf3eb0cb8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5568-5ef0-20cf-4e3489b2253d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5568-5ef0-7810-dec158046cdc	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5568-5ef0-8ac2-42c9ab3135c3	Prostor-read	Prostor - branje	f
00030000-5568-5ef0-3114-a4e50b04a2ff	Prostor-write	Prostor - spreminjanje	f
00030000-5568-5ef0-64c5-3d37db7521c6	Racun-read	Racun - branje	f
00030000-5568-5ef0-dc59-7c687fdafb53	Racun-write	Racun - spreminjanje	f
00030000-5568-5ef0-bd0c-26287c5aa2f8	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5568-5ef0-ef6b-d7e655fae86b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5568-5ef0-50a9-17b52c7aa028	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5568-5ef0-9622-18fcae86c1a3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5568-5ef0-cf5e-aa04545844bb	Rekvizit-read	Rekvizit - branje	f
00030000-5568-5ef0-6439-066d3ab739b0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5568-5ef0-ba03-76e1b8091fcd	Revizija-read	Revizija - branje	f
00030000-5568-5ef0-9467-2d142f7ebf72	Revizija-write	Revizija - spreminjanje	f
00030000-5568-5ef0-cfdd-e8ed8b77da76	Rezervacija-read	Rezervacija - branje	f
00030000-5568-5ef0-35c1-46fa41fbf6d4	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5568-5ef0-142d-8c407fa5b165	Role-read	Role - branje	f
00030000-5568-5ef0-1fcd-70eca9a6e749	Role-write	Role - spreminjanje	f
00030000-5568-5ef0-c7a5-d7d3a8880dbd	SedezniRed-read	SedezniRed - branje	f
00030000-5568-5ef0-09c8-368d58fb66e5	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5568-5ef0-4da2-285f5953920c	Sedez-read	Sedez - branje	f
00030000-5568-5ef0-20db-1d7e7f3f21a6	Sedez-write	Sedez - spreminjanje	f
00030000-5568-5ef0-bccd-d327043d880c	Sezona-read	Sezona - branje	f
00030000-5568-5ef0-27e5-4593dda6b516	Sezona-write	Sezona - spreminjanje	f
00030000-5568-5ef0-912e-1acf27c21b56	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5568-5ef0-ce66-60ef4048c4b2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5568-5ef0-1a29-1adea05cfff7	Stevilcenje-read	Stevilcenje - branje	f
00030000-5568-5ef0-d602-63707017a306	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5568-5ef0-6cac-1c6de5085df7	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5568-5ef0-c9a6-f6045111b429	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5568-5ef0-c8c7-95eee6433fd0	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5568-5ef0-e0e8-59f64faa0764	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5568-5ef0-64cf-9e7707100227	Telefonska-read	Telefonska - branje	f
00030000-5568-5ef0-a8e5-b38da38e7fbc	Telefonska-write	Telefonska - spreminjanje	f
00030000-5568-5ef0-5af5-50f32a3697cc	TerminStoritve-read	TerminStoritve - branje	f
00030000-5568-5ef0-7ff1-96f70b608cc1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5568-5ef0-916a-c4fe66313e6f	TipFunkcije-read	TipFunkcije - branje	f
00030000-5568-5ef0-662f-5100e0207702	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5568-5ef0-ffdf-cf1740737cca	Trr-read	Trr - branje	f
00030000-5568-5ef0-a18b-be4beeb80d4e	Trr-write	Trr - spreminjanje	f
00030000-5568-5ef0-01a2-e95df96ea00b	Uprizoritev-read	Uprizoritev - branje	f
00030000-5568-5ef0-12fd-16f509c0aeef	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5568-5ef0-4e68-9166eb493b44	User-read	User - branje	f
00030000-5568-5ef0-3dab-5905f2bd544c	User-write	User - spreminjanje	f
00030000-5568-5ef0-4dcd-61f72ef74482	Vaja-read	Vaja - branje	f
00030000-5568-5ef0-4f69-92d858bdd1ab	Vaja-write	Vaja - spreminjanje	f
00030000-5568-5ef0-27b7-3ce8eaef56e3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5568-5ef0-b5cc-444d881fbb5b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5568-5ef0-4f13-9bb6604f49ee	Zaposlitev-read	Zaposlitev - branje	f
00030000-5568-5ef0-e673-f92e675d8423	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5568-5ef0-af3e-0fa86de588c6	Zasedenost-read	Zasedenost - branje	f
00030000-5568-5ef0-4e3c-3a38ff5c45d5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5568-5ef0-a985-e886a39bca2c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5568-5ef0-8293-2322062f4597	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5568-5ef0-4677-765156159e9b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5568-5ef0-4db0-d7d7d47d153c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2698 (class 0 OID 5535566)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5568-5ef0-3ae2-b71efb8b14f5	00030000-5568-5ef0-60a7-ca5ab7e52820
00020000-5568-5ef0-a8fa-6ec177502c85	00030000-5568-5ef0-6524-b68733a9daca
00020000-5568-5ef0-a8fa-6ec177502c85	00030000-5568-5ef0-60a7-ca5ab7e52820
\.


--
-- TOC entry 2726 (class 0 OID 5535856)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2730 (class 0 OID 5535887)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5536020)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 5535625)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5568-5ef1-15b3-21548e8275a9	00040000-5568-5ef0-2d0f-bf7d3d79b2d2	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5568-5ef1-bbc9-f67fe8e78529	00040000-5568-5ef0-2d0f-bf7d3d79b2d2	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2705 (class 0 OID 5535660)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5568-5ef0-8295-fd589df25cca	8341	Adlešiči
00050000-5568-5ef0-0724-3dd940301dde	5270	Ajdovščina
00050000-5568-5ef0-0972-1b0eae8cf3de	6280	Ankaran/Ancarano
00050000-5568-5ef0-6e53-a8c3e4f7f3d0	9253	Apače
00050000-5568-5ef0-4090-c03dbe4e777b	8253	Artiče
00050000-5568-5ef0-33cd-52ab79a1dda4	4275	Begunje na Gorenjskem
00050000-5568-5ef0-b34f-eaaf82f49cb2	1382	Begunje pri Cerknici
00050000-5568-5ef0-eeee-3abefcb68f2e	9231	Beltinci
00050000-5568-5ef0-bc28-3a1cfd49db6f	2234	Benedikt
00050000-5568-5ef0-1ce4-63fca6efa566	2345	Bistrica ob Dravi
00050000-5568-5ef0-6f61-721cb2fa8746	3256	Bistrica ob Sotli
00050000-5568-5ef0-0656-3a965a378f41	8259	Bizeljsko
00050000-5568-5ef0-32cf-5ad1abb65a71	1223	Blagovica
00050000-5568-5ef0-105a-f45fccaa8ac6	8283	Blanca
00050000-5568-5ef0-f746-137df5b2d173	4260	Bled
00050000-5568-5ef0-6430-bb5d58b00750	4273	Blejska Dobrava
00050000-5568-5ef0-3b26-43b099a8a8e8	9265	Bodonci
00050000-5568-5ef0-3c4b-5fec5af08964	9222	Bogojina
00050000-5568-5ef0-0e7f-db0d66d7a48a	4263	Bohinjska Bela
00050000-5568-5ef0-4e35-766212d62424	4264	Bohinjska Bistrica
00050000-5568-5ef0-e65d-a8c6af9320c3	4265	Bohinjsko jezero
00050000-5568-5ef0-69d1-819132d54567	1353	Borovnica
00050000-5568-5ef0-c17c-a453b4133716	8294	Boštanj
00050000-5568-5ef0-d273-6d6da2c69766	5230	Bovec
00050000-5568-5ef0-16c4-102e51ff4439	5295	Branik
00050000-5568-5ef0-8dd2-9fb79e44ec6f	3314	Braslovče
00050000-5568-5ef0-ccc7-dd163404fa85	5223	Breginj
00050000-5568-5ef0-4b8a-39a45789111a	8280	Brestanica
00050000-5568-5ef0-4b1b-eddeaf288736	2354	Bresternica
00050000-5568-5ef0-331e-fae7bdbbb30c	4243	Brezje
00050000-5568-5ef0-c230-f0981fcce309	1351	Brezovica pri Ljubljani
00050000-5568-5ef0-4671-f7de41134351	8250	Brežice
00050000-5568-5ef0-5bcf-e244136c29ba	4210	Brnik - Aerodrom
00050000-5568-5ef0-8604-a9b5eda3ce74	8321	Brusnice
00050000-5568-5ef0-47f9-967cf205797d	3255	Buče
00050000-5568-5ef0-c851-7f07377659d2	8276	Bučka 
00050000-5568-5ef0-8462-ff93c945938a	9261	Cankova
00050000-5568-5ef0-6bd6-a298b94270b4	3000	Celje 
00050000-5568-5ef0-ead9-75a226e58821	3001	Celje - poštni predali
00050000-5568-5ef0-cc7a-37320b258062	4207	Cerklje na Gorenjskem
00050000-5568-5ef0-b80f-396b7da4702d	8263	Cerklje ob Krki
00050000-5568-5ef0-09b6-b59a43e8852a	1380	Cerknica
00050000-5568-5ef0-0957-878972ac771a	5282	Cerkno
00050000-5568-5ef0-ae52-bafc6e6d5b8b	2236	Cerkvenjak
00050000-5568-5ef0-9180-ebee1c470734	2215	Ceršak
00050000-5568-5ef0-7038-34080e91bee5	2326	Cirkovce
00050000-5568-5ef0-0f91-94c2ee1d05d8	2282	Cirkulane
00050000-5568-5ef0-3817-f0837f5bf344	5273	Col
00050000-5568-5ef0-ba67-875eab59de7e	8251	Čatež ob Savi
00050000-5568-5ef0-865c-e9afccfa1457	1413	Čemšenik
00050000-5568-5ef0-3cc3-cc35bba04fb8	5253	Čepovan
00050000-5568-5ef0-508e-b9d9ff0ba4cc	9232	Črenšovci
00050000-5568-5ef0-3e5c-44a54bd2d5a8	2393	Črna na Koroškem
00050000-5568-5ef0-1c1b-3c2ef53c1d21	6275	Črni Kal
00050000-5568-5ef0-037b-fd67bb773888	5274	Črni Vrh nad Idrijo
00050000-5568-5ef0-1786-97a48e34c5c4	5262	Črniče
00050000-5568-5ef0-8cb2-e5bb41ad2064	8340	Črnomelj
00050000-5568-5ef0-8126-26fb3978683c	6271	Dekani
00050000-5568-5ef0-7d19-e1e73846a876	5210	Deskle
00050000-5568-5ef0-6c4f-bbded699c594	2253	Destrnik
00050000-5568-5ef0-c7f5-9aaef6ad0fb0	6215	Divača
00050000-5568-5ef0-1fc6-921f361ab7ce	1233	Dob
00050000-5568-5ef0-4f35-aaa796ea5bde	3224	Dobje pri Planini
00050000-5568-5ef0-2ec2-e578a2fdc1c3	8257	Dobova
00050000-5568-5ef0-3872-96adb7e31c8a	1423	Dobovec
00050000-5568-5ef0-1337-ac60fa655153	5263	Dobravlje
00050000-5568-5ef0-ca7d-9405a8410c52	3204	Dobrna
00050000-5568-5ef0-1cd3-94dc8ce8f87c	8211	Dobrnič
00050000-5568-5ef0-30b4-387de58f71c1	1356	Dobrova
00050000-5568-5ef0-1e9a-4c7ab5690e7b	9223	Dobrovnik/Dobronak 
00050000-5568-5ef0-fe1b-6dd87748f548	5212	Dobrovo v Brdih
00050000-5568-5ef0-2cfb-cacc1fb67306	1431	Dol pri Hrastniku
00050000-5568-5ef0-e993-a2f72a71ee91	1262	Dol pri Ljubljani
00050000-5568-5ef0-e7ca-3d94425d7225	1273	Dole pri Litiji
00050000-5568-5ef0-6983-d1da0aeb384c	1331	Dolenja vas
00050000-5568-5ef0-459a-635fa2835911	8350	Dolenjske Toplice
00050000-5568-5ef0-b74b-c8e017ba0920	1230	Domžale
00050000-5568-5ef0-4b06-5052a3098d9b	2252	Dornava
00050000-5568-5ef0-1efb-ddb43b893c0b	5294	Dornberk
00050000-5568-5ef0-ae92-2b3b0ed5b0a6	1319	Draga
00050000-5568-5ef0-edea-9661971ed4a5	8343	Dragatuš
00050000-5568-5ef0-8e0c-21f4d2bfce72	3222	Dramlje
00050000-5568-5ef0-f307-f138d313363d	2370	Dravograd
00050000-5568-5ef0-ba96-f0022fda1075	4203	Duplje
00050000-5568-5ef0-c586-f2317d861101	6221	Dutovlje
00050000-5568-5ef0-38b4-168404ac3bab	8361	Dvor
00050000-5568-5ef0-6f68-e1e8f226b03b	2343	Fala
00050000-5568-5ef0-775f-178a37a14bbb	9208	Fokovci
00050000-5568-5ef0-4653-bf8c69938035	2313	Fram
00050000-5568-5ef0-09f7-25932bc53776	3213	Frankolovo
00050000-5568-5ef0-a1fd-2040726389d4	1274	Gabrovka
00050000-5568-5ef0-b366-9f7511151371	8254	Globoko
00050000-5568-5ef0-fac8-1e7828b0b189	5275	Godovič
00050000-5568-5ef0-dcbd-f102881613c9	4204	Golnik
00050000-5568-5ef0-c0f2-f9fbb889b9c1	3303	Gomilsko
00050000-5568-5ef0-3a25-60e34cf328ae	4224	Gorenja vas
00050000-5568-5ef0-7446-3686ff6a6fcc	3263	Gorica pri Slivnici
00050000-5568-5ef0-7ab2-b3be995a8357	2272	Gorišnica
00050000-5568-5ef0-b67c-38fa90f04519	9250	Gornja Radgona
00050000-5568-5ef0-7399-f8d2fe2e550e	3342	Gornji Grad
00050000-5568-5ef0-1aab-c8fd1feed3ab	4282	Gozd Martuljek
00050000-5568-5ef0-2164-378408847e21	6272	Gračišče
00050000-5568-5ef0-d554-7f672195c814	9264	Grad
00050000-5568-5ef0-d275-4cd0a12ac4a9	8332	Gradac
00050000-5568-5ef0-cd77-ed351daf0d33	1384	Grahovo
00050000-5568-5ef0-54ef-220cfd9f6f99	5242	Grahovo ob Bači
00050000-5568-5ef0-7540-6508885de077	5251	Grgar
00050000-5568-5ef0-496b-d44768c7438c	3302	Griže
00050000-5568-5ef0-2383-4eb453384c2d	3231	Grobelno
00050000-5568-5ef0-f93e-d6970539cbcf	1290	Grosuplje
00050000-5568-5ef0-ecaa-8665e4b5a925	2288	Hajdina
00050000-5568-5ef0-5e3b-f72bcba6b5dd	8362	Hinje
00050000-5568-5ef0-16eb-b4708e0df15e	2311	Hoče
00050000-5568-5ef0-a7ab-56feb15acea2	9205	Hodoš/Hodos
00050000-5568-5ef0-4420-281d8fd89017	1354	Horjul
00050000-5568-5ef0-c0df-86cb67c93bf7	1372	Hotedršica
00050000-5568-5ef0-41a8-6882d803ccba	1430	Hrastnik
00050000-5568-5ef0-10e1-0257d43cbfc1	6225	Hruševje
00050000-5568-5ef0-34c0-31a2cd4cc565	4276	Hrušica
00050000-5568-5ef0-f9c6-86a591986f9e	5280	Idrija
00050000-5568-5ef0-2568-41f1e82bbfda	1292	Ig
00050000-5568-5ef0-4ebd-f8971a6af971	6250	Ilirska Bistrica
00050000-5568-5ef0-968a-fa319d2d3f7b	6251	Ilirska Bistrica-Trnovo
00050000-5568-5ef0-277e-e2382ed45a99	1295	Ivančna Gorica
00050000-5568-5ef0-06a9-a57d2f4bbf7f	2259	Ivanjkovci
00050000-5568-5ef0-feab-4f77c972ddde	1411	Izlake
00050000-5568-5ef0-b6b0-cb77a74736c1	6310	Izola/Isola
00050000-5568-5ef0-b845-c74813abb86f	2222	Jakobski Dol
00050000-5568-5ef0-686d-de4673cd5e3a	2221	Jarenina
00050000-5568-5ef0-e2b7-33a0e7e916b3	6254	Jelšane
00050000-5568-5ef0-7bbe-a3b69d11501e	4270	Jesenice
00050000-5568-5ef0-f9d4-4d2452ef300c	8261	Jesenice na Dolenjskem
00050000-5568-5ef0-9b93-b26a79ef83ba	3273	Jurklošter
00050000-5568-5ef0-455c-1cc095a96341	2223	Jurovski Dol
00050000-5568-5ef0-336d-9f24f6f9d8e9	2256	Juršinci
00050000-5568-5ef0-8ab6-e8682e4e171d	5214	Kal nad Kanalom
00050000-5568-5ef0-3dbc-f34119d1c703	3233	Kalobje
00050000-5568-5ef0-e02c-f50f14c78b73	4246	Kamna Gorica
00050000-5568-5ef0-f57b-05d6831d21a8	2351	Kamnica
00050000-5568-5ef0-ff91-924e795dc7d0	1241	Kamnik
00050000-5568-5ef0-07f2-88989e92ec06	5213	Kanal
00050000-5568-5ef0-da2a-2cf4e41dec2d	8258	Kapele
00050000-5568-5ef0-d763-2db67a7c3707	2362	Kapla
00050000-5568-5ef0-5ac0-2e9c26a3baeb	2325	Kidričevo
00050000-5568-5ef0-29bb-97a6f2b86622	1412	Kisovec
00050000-5568-5ef0-f605-de7159a33c26	6253	Knežak
00050000-5568-5ef0-1586-524c56b62ee7	5222	Kobarid
00050000-5568-5ef0-e687-1c4b4d2adaf7	9227	Kobilje
00050000-5568-5ef0-c1ad-45e49570bacc	1330	Kočevje
00050000-5568-5ef0-a1a8-32841edd7b9d	1338	Kočevska Reka
00050000-5568-5ef0-49b5-6df28bd0128b	2276	Kog
00050000-5568-5ef0-e892-3c69dfa1664d	5211	Kojsko
00050000-5568-5ef0-8d01-e9a3c855efcf	6223	Komen
00050000-5568-5ef0-14ec-e4f2bfd3dab0	1218	Komenda
00050000-5568-5ef0-dc13-5aaeafd31d15	6000	Koper/Capodistria 
00050000-5568-5ef0-0b36-1608e54dd817	6001	Koper/Capodistria - poštni predali
00050000-5568-5ef0-bf54-285468cbe14c	8282	Koprivnica
00050000-5568-5ef0-5838-ce02b3f3eb7d	5296	Kostanjevica na Krasu
00050000-5568-5ef0-ced7-a21df3991630	8311	Kostanjevica na Krki
00050000-5568-5ef0-5076-bf194f8ab92e	1336	Kostel
00050000-5568-5ef0-6939-0e4ace1747ee	6256	Košana
00050000-5568-5ef0-b335-2ec8c8a14049	2394	Kotlje
00050000-5568-5ef0-253f-952430bebdb3	6240	Kozina
00050000-5568-5ef0-9ff7-1d47869bb8f2	3260	Kozje
00050000-5568-5ef0-8f4f-d828f92459e8	4000	Kranj 
00050000-5568-5ef0-1bd6-edff426dbb5f	4001	Kranj - poštni predali
00050000-5568-5ef0-42e5-85797cb8f49c	4280	Kranjska Gora
00050000-5568-5ef0-4c38-4285be70c6d9	1281	Kresnice
00050000-5568-5ef0-4d59-ad0a0eb4a2b6	4294	Križe
00050000-5568-5ef0-d3bd-c675455d4a0b	9206	Križevci
00050000-5568-5ef0-9ef0-3af9185c8947	9242	Križevci pri Ljutomeru
00050000-5568-5ef0-edcd-b78584026d37	1301	Krka
00050000-5568-5ef0-3b39-7487567cf10d	8296	Krmelj
00050000-5568-5ef0-db38-a0ac86da333c	4245	Kropa
00050000-5568-5ef0-c519-2e2dc8d6c075	8262	Krška vas
00050000-5568-5ef0-5a92-188fe08d5896	8270	Krško
00050000-5568-5ef0-7c30-2954f6db1749	9263	Kuzma
00050000-5568-5ef0-5bb1-59eb0e54b6be	2318	Laporje
00050000-5568-5ef0-499b-63da34227684	3270	Laško
00050000-5568-5ef0-6a4d-510493882fb9	1219	Laze v Tuhinju
00050000-5568-5ef0-e164-dac05765bf5f	2230	Lenart v Slovenskih goricah
00050000-5568-5ef0-5bdb-e5e4e9ff154e	9220	Lendava/Lendva
00050000-5568-5ef0-b9f2-7c84263cebca	4248	Lesce
00050000-5568-5ef0-119c-cef2d366af5b	3261	Lesično
00050000-5568-5ef0-06b7-a8f75b0863b8	8273	Leskovec pri Krškem
00050000-5568-5ef0-dce4-e0cc93568214	2372	Libeliče
00050000-5568-5ef0-6a58-83a7f6390dcd	2341	Limbuš
00050000-5568-5ef0-cf4d-5e80d84e9882	1270	Litija
00050000-5568-5ef0-507c-28ec07d880e1	3202	Ljubečna
00050000-5568-5ef0-abeb-bc354e7faa91	1000	Ljubljana 
00050000-5568-5ef0-fc7a-5bdaf6ee6e3e	1001	Ljubljana - poštni predali
00050000-5568-5ef0-2a83-387847bae72c	1231	Ljubljana - Črnuče
00050000-5568-5ef0-ecdd-3fcfc1111caf	1261	Ljubljana - Dobrunje
00050000-5568-5ef0-1053-3f7549c3dee4	1260	Ljubljana - Polje
00050000-5568-5ef0-13b2-6d92c86d0f74	1210	Ljubljana - Šentvid
00050000-5568-5ef0-7c80-af85a0e8c7a7	1211	Ljubljana - Šmartno
00050000-5568-5ef0-b94e-69c68f3c30b4	3333	Ljubno ob Savinji
00050000-5568-5ef0-565e-e3aff574a1ed	9240	Ljutomer
00050000-5568-5ef0-4ab2-14381a6b9ae2	3215	Loče
00050000-5568-5ef0-64b5-f26847177f39	5231	Log pod Mangartom
00050000-5568-5ef0-9baa-a9e79d9101bb	1358	Log pri Brezovici
00050000-5568-5ef0-9f25-e6ac3851fb30	1370	Logatec
00050000-5568-5ef0-c468-e885a9d4deb9	1371	Logatec
00050000-5568-5ef0-e0f4-bc17d7f72661	1434	Loka pri Zidanem Mostu
00050000-5568-5ef0-6438-84b0900d7f08	3223	Loka pri Žusmu
00050000-5568-5ef0-70d7-689a6a21f134	6219	Lokev
00050000-5568-5ef0-4f86-d5e8610e3c94	1318	Loški Potok
00050000-5568-5ef0-00f1-ab69c99f03ab	2324	Lovrenc na Dravskem polju
00050000-5568-5ef0-a5ba-72aa15ed23f5	2344	Lovrenc na Pohorju
00050000-5568-5ef0-9e57-5989b6858274	3334	Luče
00050000-5568-5ef0-8f4d-d0564a377c33	1225	Lukovica
00050000-5568-5ef0-e204-f871418542f1	9202	Mačkovci
00050000-5568-5ef0-7fea-ea5737ba30e0	2322	Majšperk
00050000-5568-5ef0-8035-cbf0708dc25d	2321	Makole
00050000-5568-5ef0-9307-b6ece221cdce	9243	Mala Nedelja
00050000-5568-5ef0-ec4e-2d0ab50d952b	2229	Malečnik
00050000-5568-5ef0-de08-3ff0c6ab21a6	6273	Marezige
00050000-5568-5ef0-d5f6-138dade84985	2000	Maribor 
00050000-5568-5ef0-74de-87db49e6df8e	2001	Maribor - poštni predali
00050000-5568-5ef0-eacb-93273174c8cb	2206	Marjeta na Dravskem polju
00050000-5568-5ef0-b581-b3c74fa5e791	2281	Markovci
00050000-5568-5ef0-9d37-95b31afe9c49	9221	Martjanci
00050000-5568-5ef0-5b0e-8197f8d2fe27	6242	Materija
00050000-5568-5ef0-88cc-23c0b0394001	4211	Mavčiče
00050000-5568-5ef0-61ca-0d430c247fa8	1215	Medvode
00050000-5568-5ef0-9806-929e82dac4b2	1234	Mengeš
00050000-5568-5ef0-a71c-aa86725c92bd	8330	Metlika
00050000-5568-5ef0-bf38-f1496d8f2cd7	2392	Mežica
00050000-5568-5ef0-8587-7de83fce2505	2204	Miklavž na Dravskem polju
00050000-5568-5ef0-73f8-f1b719b426b9	2275	Miklavž pri Ormožu
00050000-5568-5ef0-7ff9-2128a3e25f2e	5291	Miren
00050000-5568-5ef0-f807-aa534874bb18	8233	Mirna
00050000-5568-5ef0-cb4a-66f580829601	8216	Mirna Peč
00050000-5568-5ef0-7d50-cd026a9c25c3	2382	Mislinja
00050000-5568-5ef0-b62d-4d33b9e70c7b	4281	Mojstrana
00050000-5568-5ef0-c59e-0ee0e487eb6d	8230	Mokronog
00050000-5568-5ef0-84d2-c6ea0ddfc627	1251	Moravče
00050000-5568-5ef0-f592-c8a8a9b4cd06	9226	Moravske Toplice
00050000-5568-5ef0-7374-a15f32834ae4	5216	Most na Soči
00050000-5568-5ef0-b4f5-509fbf1a1194	1221	Motnik
00050000-5568-5ef0-9798-ecd539a9f9d9	3330	Mozirje
00050000-5568-5ef0-2038-e8cb757c1627	9000	Murska Sobota 
00050000-5568-5ef0-3208-66103aad761d	9001	Murska Sobota - poštni predali
00050000-5568-5ef0-7c77-8412805fe41d	2366	Muta
00050000-5568-5ef0-7ca3-a2417a07d251	4202	Naklo
00050000-5568-5ef0-68f4-c416c0d49ff9	3331	Nazarje
00050000-5568-5ef0-7637-11dabb0e61f8	1357	Notranje Gorice
00050000-5568-5ef0-0699-9e85ebd5af08	3203	Nova Cerkev
00050000-5568-5ef0-4ea2-540a45329753	5000	Nova Gorica 
00050000-5568-5ef0-8535-b091b6f99c13	5001	Nova Gorica - poštni predali
00050000-5568-5ef0-970b-b27d2c51f59a	1385	Nova vas
00050000-5568-5ef0-7f5b-30fda2c49be4	8000	Novo mesto
00050000-5568-5ef0-ee08-10c2c3702bf3	8001	Novo mesto - poštni predali
00050000-5568-5ef0-5de7-8988c691934b	6243	Obrov
00050000-5568-5ef0-86ab-0418dbe48b5f	9233	Odranci
00050000-5568-5ef0-69f6-29e20bfb7c62	2317	Oplotnica
00050000-5568-5ef0-49d0-ae8406e1e498	2312	Orehova vas
00050000-5568-5ef0-cb18-882ec85961b4	2270	Ormož
00050000-5568-5ef0-bf0d-525a84428fd8	1316	Ortnek
00050000-5568-5ef0-db5b-3c64d0c8f7c7	1337	Osilnica
00050000-5568-5ef0-77d0-0decc63f0d31	8222	Otočec
00050000-5568-5ef0-e06b-c1c8a24473d3	2361	Ožbalt
00050000-5568-5ef0-9aee-e8e8d5335ff5	2231	Pernica
00050000-5568-5ef0-48bc-73afd6e0a87f	2211	Pesnica pri Mariboru
00050000-5568-5ef0-87bc-2281ec40a016	9203	Petrovci
00050000-5568-5ef0-a481-b3aaf2e15666	3301	Petrovče
00050000-5568-5ef0-a296-968a4e1cd70c	6330	Piran/Pirano
00050000-5568-5ef0-06b6-607713ec91a9	8255	Pišece
00050000-5568-5ef0-bdce-ab995f42c450	6257	Pivka
00050000-5568-5ef0-28ce-43867cdb0bd3	6232	Planina
00050000-5568-5ef0-8b0e-28ad28fa8744	3225	Planina pri Sevnici
00050000-5568-5ef0-a286-73b4e5f8713a	6276	Pobegi
00050000-5568-5ef0-b99f-79e1c928fa48	8312	Podbočje
00050000-5568-5ef0-ffea-6b910946b4bb	5243	Podbrdo
00050000-5568-5ef0-b98b-48268e40824b	3254	Podčetrtek
00050000-5568-5ef0-9c60-3b826312427b	2273	Podgorci
00050000-5568-5ef0-37cb-c0bb5e3c217c	6216	Podgorje
00050000-5568-5ef0-21c2-11957793314d	2381	Podgorje pri Slovenj Gradcu
00050000-5568-5ef0-f5a9-48c9f5b0ccc3	6244	Podgrad
00050000-5568-5ef0-4a96-7307b364e2c2	1414	Podkum
00050000-5568-5ef0-1465-6f8bccf1e333	2286	Podlehnik
00050000-5568-5ef0-b9c2-b8acbc5c962a	5272	Podnanos
00050000-5568-5ef0-4706-de7d0f432a8c	4244	Podnart
00050000-5568-5ef0-05fc-97f66499761a	3241	Podplat
00050000-5568-5ef0-6dbd-96793dfd9662	3257	Podsreda
00050000-5568-5ef0-aac6-f9bfc380aba6	2363	Podvelka
00050000-5568-5ef0-3f2a-4f9e173b9cbd	2208	Pohorje
00050000-5568-5ef0-1990-40fa0143fc44	2257	Polenšak
00050000-5568-5ef0-bf84-1bd7e54de50a	1355	Polhov Gradec
00050000-5568-5ef0-9aa5-e5c0242af839	4223	Poljane nad Škofjo Loko
00050000-5568-5ef0-865b-9c8f122d1f00	2319	Poljčane
00050000-5568-5ef0-59c5-d06bb1a097d4	1272	Polšnik
00050000-5568-5ef0-0d93-168f418c69d7	3313	Polzela
00050000-5568-5ef0-b228-5512c21501ee	3232	Ponikva
00050000-5568-5ef0-31ef-ba89f48f46ac	6320	Portorož/Portorose
00050000-5568-5ef0-3fdc-59b4cea97c84	6230	Postojna
00050000-5568-5ef0-4e69-18230ade0cce	2331	Pragersko
00050000-5568-5ef0-79fb-72c14799e2b7	3312	Prebold
00050000-5568-5ef0-83f9-7854a302c10a	4205	Preddvor
00050000-5568-5ef0-9be4-7c2e75d743b1	6255	Prem
00050000-5568-5ef0-5e67-c5c24618b323	1352	Preserje
00050000-5568-5ef0-4a2f-509591caf8d8	6258	Prestranek
00050000-5568-5ef0-8d41-f3c007294e48	2391	Prevalje
00050000-5568-5ef0-4e21-e20c07e6dc43	3262	Prevorje
00050000-5568-5ef0-46af-34b4947f2b39	1276	Primskovo 
00050000-5568-5ef0-681d-fd356306b341	3253	Pristava pri Mestinju
00050000-5568-5ef0-389b-13708ade0ab3	9207	Prosenjakovci/Partosfalva
00050000-5568-5ef0-c8a3-6917726d3068	5297	Prvačina
00050000-5568-5ef0-438b-b26ccd6477f4	2250	Ptuj
00050000-5568-5ef0-b179-ba3d9195ab6c	2323	Ptujska Gora
00050000-5568-5ef0-4989-211d42d050e8	9201	Puconci
00050000-5568-5ef0-f08c-3166018d3fd6	2327	Rače
00050000-5568-5ef0-0393-a792fa0a51fd	1433	Radeče
00050000-5568-5ef0-863c-d9f4bd279844	9252	Radenci
00050000-5568-5ef0-fbc5-84e12d3f22d1	2360	Radlje ob Dravi
00050000-5568-5ef0-da65-4076c48c3f6d	1235	Radomlje
00050000-5568-5ef0-b1fa-317dc5ebc3ae	4240	Radovljica
00050000-5568-5ef0-c0e1-37a1d0c87d50	8274	Raka
00050000-5568-5ef0-2edd-b1ff8087f2d6	1381	Rakek
00050000-5568-5ef0-c32f-0254a3e30472	4283	Rateče - Planica
00050000-5568-5ef0-682f-cd794da22834	2390	Ravne na Koroškem
00050000-5568-5ef0-e07e-e86414210903	9246	Razkrižje
00050000-5568-5ef0-3ac5-dd4a7a5268f7	3332	Rečica ob Savinji
00050000-5568-5ef0-a424-4e4afed48252	5292	Renče
00050000-5568-5ef0-4779-0246a0659d0f	1310	Ribnica
00050000-5568-5ef0-f38e-0eae44a2e620	2364	Ribnica na Pohorju
00050000-5568-5ef0-6e39-2db02646c210	3272	Rimske Toplice
00050000-5568-5ef0-6f76-ac4f69e2789c	1314	Rob
00050000-5568-5ef0-a2cc-b40d0583f9e5	5215	Ročinj
00050000-5568-5ef0-70e1-09fbf3d85324	3250	Rogaška Slatina
00050000-5568-5ef0-41f3-98ea6194d61c	9262	Rogašovci
00050000-5568-5ef0-8394-aabcf0e36899	3252	Rogatec
00050000-5568-5ef0-8f17-ea525ad0b7ef	1373	Rovte
00050000-5568-5ef0-efd9-90b92e14fd4d	2342	Ruše
00050000-5568-5ef0-42ad-b487268b8063	1282	Sava
00050000-5568-5ef0-3e86-35fbbd67af86	6333	Sečovlje/Sicciole
00050000-5568-5ef0-c001-a73a6886e320	4227	Selca
00050000-5568-5ef0-16f5-6886d588c942	2352	Selnica ob Dravi
00050000-5568-5ef0-b289-8db3c35a4420	8333	Semič
00050000-5568-5ef0-f758-b296c7569103	8281	Senovo
00050000-5568-5ef0-a1a9-4e0a1b285d69	6224	Senožeče
00050000-5568-5ef0-b106-a412b7431e70	8290	Sevnica
00050000-5568-5ef0-c804-fce8b4155d92	6210	Sežana
00050000-5568-5ef0-372e-cce53db58d88	2214	Sladki Vrh
00050000-5568-5ef0-7a58-3bfc290b1059	5283	Slap ob Idrijci
00050000-5568-5ef0-431a-756874da505f	2380	Slovenj Gradec
00050000-5568-5ef0-9c49-b09f01011325	2310	Slovenska Bistrica
00050000-5568-5ef0-ed8c-95cc61850901	3210	Slovenske Konjice
00050000-5568-5ef0-59ed-fe9bb5aea1e2	1216	Smlednik
00050000-5568-5ef0-dbe0-67ed9f5fcacf	5232	Soča
00050000-5568-5ef0-ffaa-e10c884b704d	1317	Sodražica
00050000-5568-5ef0-9ff9-8719f36e468c	3335	Solčava
00050000-5568-5ef0-751d-e6e99331636e	5250	Solkan
00050000-5568-5ef0-87af-2754529a393d	4229	Sorica
00050000-5568-5ef0-df5f-849b6dfaf720	4225	Sovodenj
00050000-5568-5ef0-4267-eff5fa995c78	5281	Spodnja Idrija
00050000-5568-5ef0-d69a-bd6c9f63c0c5	2241	Spodnji Duplek
00050000-5568-5ef0-0ac7-8bd44aa72728	9245	Spodnji Ivanjci
00050000-5568-5ef0-372d-48229d821818	2277	Središče ob Dravi
00050000-5568-5ef0-c267-573411864b6d	4267	Srednja vas v Bohinju
00050000-5568-5ef0-68fd-f551f1f9a184	8256	Sromlje 
00050000-5568-5ef0-5ffe-c17e0a37f931	5224	Srpenica
00050000-5568-5ef0-e40e-bfc6ba4611a9	1242	Stahovica
00050000-5568-5ef0-4a54-873d99688d84	1332	Stara Cerkev
00050000-5568-5ef0-72ee-6173c64b5dd7	8342	Stari trg ob Kolpi
00050000-5568-5ef0-77b8-949e1d6a5071	1386	Stari trg pri Ložu
00050000-5568-5ef0-9060-7b89ea2b0057	2205	Starše
00050000-5568-5ef0-5f88-46054ad468d5	2289	Stoperce
00050000-5568-5ef0-3a82-b6bdceb73f90	8322	Stopiče
00050000-5568-5ef0-d45a-c186fcc9c9b2	3206	Stranice
00050000-5568-5ef0-65b1-fb9fcdc0cb12	8351	Straža
00050000-5568-5ef0-b2a9-998b6339419b	1313	Struge
00050000-5568-5ef0-2256-d74481ed52de	8293	Studenec
00050000-5568-5ef0-feca-0095eea9a262	8331	Suhor
00050000-5568-5ef0-361e-e3abdf26d052	2233	Sv. Ana v Slovenskih goricah
00050000-5568-5ef0-41bf-567a95eb3d4a	2235	Sv. Trojica v Slovenskih goricah
00050000-5568-5ef0-1dd5-94a5edfb277f	2353	Sveti Duh na Ostrem Vrhu
00050000-5568-5ef0-8518-11a39170d14b	9244	Sveti Jurij ob Ščavnici
00050000-5568-5ef0-1e7e-1ccffbb43edf	3264	Sveti Štefan
00050000-5568-5ef0-2c50-588c0cf2d2d1	2258	Sveti Tomaž
00050000-5568-5ef0-8a09-a63acae7fde9	9204	Šalovci
00050000-5568-5ef0-471b-9a38bc97bb23	5261	Šempas
00050000-5568-5ef0-fb5a-cb54c70e82cc	5290	Šempeter pri Gorici
00050000-5568-5ef0-5c59-e51009f0ec90	3311	Šempeter v Savinjski dolini
00050000-5568-5ef0-ecef-9e2cf7dbab90	4208	Šenčur
00050000-5568-5ef0-de83-6d5a3f03577e	2212	Šentilj v Slovenskih goricah
00050000-5568-5ef0-6212-224ee472e842	8297	Šentjanž
00050000-5568-5ef0-c025-1e291743efe4	2373	Šentjanž pri Dravogradu
00050000-5568-5ef0-5431-eb91d8ec4a20	8310	Šentjernej
00050000-5568-5ef0-7a9c-494a536f04da	3230	Šentjur
00050000-5568-5ef0-043b-5d178eef31ca	3271	Šentrupert
00050000-5568-5ef0-4637-9dae41fd7ce2	8232	Šentrupert
00050000-5568-5ef0-e579-c45f04e2555d	1296	Šentvid pri Stični
00050000-5568-5ef0-6305-2b3f75731cf9	8275	Škocjan
00050000-5568-5ef0-4ab1-0e71024e4e56	6281	Škofije
00050000-5568-5ef0-90d4-9a9850cf5c65	4220	Škofja Loka
00050000-5568-5ef0-4067-427298f3d714	3211	Škofja vas
00050000-5568-5ef0-2a4e-1858bd8f3227	1291	Škofljica
00050000-5568-5ef0-94f0-1d262342c97a	6274	Šmarje
00050000-5568-5ef0-4a24-0c4406141f85	1293	Šmarje - Sap
00050000-5568-5ef0-4022-63e25e115bbc	3240	Šmarje pri Jelšah
00050000-5568-5ef0-e492-fcdc046995de	8220	Šmarješke Toplice
00050000-5568-5ef0-6614-6eb8587be8f7	2315	Šmartno na Pohorju
00050000-5568-5ef0-0eb3-4a192f991eac	3341	Šmartno ob Dreti
00050000-5568-5ef0-6e8b-8168d6564a27	3327	Šmartno ob Paki
00050000-5568-5ef0-dd19-e1b15782ee4f	1275	Šmartno pri Litiji
00050000-5568-5ef0-d7be-8c6efaa48d78	2383	Šmartno pri Slovenj Gradcu
00050000-5568-5ef0-198c-5ce0d7fca263	3201	Šmartno v Rožni dolini
00050000-5568-5ef0-4654-5ba8d297603a	3325	Šoštanj
00050000-5568-5ef0-ac6d-639f7f3484ab	6222	Štanjel
00050000-5568-5ef0-795b-b47c6f432577	3220	Štore
00050000-5568-5ef0-9d51-1e04c92041ca	3304	Tabor
00050000-5568-5ef0-f382-08df3d15d8b3	3221	Teharje
00050000-5568-5ef0-dc20-7625afec1259	9251	Tišina
00050000-5568-5ef0-f8b3-cb3868a004b9	5220	Tolmin
00050000-5568-5ef0-e41a-dcbcdc4cc15a	3326	Topolšica
00050000-5568-5ef0-b326-7a8682ff3173	2371	Trbonje
00050000-5568-5ef0-325c-b1a89a47d1e9	1420	Trbovlje
00050000-5568-5ef0-2110-84dca50a55a3	8231	Trebelno 
00050000-5568-5ef0-717c-13273be0bf02	8210	Trebnje
00050000-5568-5ef0-2a1e-80c346c446ef	5252	Trnovo pri Gorici
00050000-5568-5ef0-b76b-200399c0a62c	2254	Trnovska vas
00050000-5568-5ef0-3fba-e18d7bac88ee	1222	Trojane
00050000-5568-5ef0-77f2-fc5d46f2cf53	1236	Trzin
00050000-5568-5ef0-8dcd-1fccc27efdb4	4290	Tržič
00050000-5568-5ef0-ed6e-540847b731ac	8295	Tržišče
00050000-5568-5ef0-b270-b0b0bf4a2d7e	1311	Turjak
00050000-5568-5ef0-808d-672e6f09dd2e	9224	Turnišče
00050000-5568-5ef0-a62b-bc8d8251cec2	8323	Uršna sela
00050000-5568-5ef0-828b-5e9d23ae80a3	1252	Vače
00050000-5568-5ef0-902f-7db4d9419ef0	3320	Velenje 
00050000-5568-5ef0-2a93-1c2ee6bb26b3	3322	Velenje - poštni predali
00050000-5568-5ef0-e2fa-3766d64d972f	8212	Velika Loka
00050000-5568-5ef0-be72-1a306e22775b	2274	Velika Nedelja
00050000-5568-5ef0-921b-4e24016cdb96	9225	Velika Polana
00050000-5568-5ef0-e4d4-047b9b6c12c7	1315	Velike Lašče
00050000-5568-5ef0-cc23-a0950e412f60	8213	Veliki Gaber
00050000-5568-5ef0-5816-779a6fdb5408	9241	Veržej
00050000-5568-5ef0-6a48-38d653b1c6f3	1312	Videm - Dobrepolje
00050000-5568-5ef0-ff50-66b4d7bb4504	2284	Videm pri Ptuju
00050000-5568-5ef0-a610-18a8d8803124	8344	Vinica
00050000-5568-5ef0-c9d6-e2ed021105b0	5271	Vipava
00050000-5568-5ef0-787e-8eec6903283a	4212	Visoko
00050000-5568-5ef0-a4d4-a9e9f3f19625	1294	Višnja Gora
00050000-5568-5ef0-a6ae-e43bc3521721	3205	Vitanje
00050000-5568-5ef0-be1a-2ea45c250340	2255	Vitomarci
00050000-5568-5ef0-9292-31e1148b660c	1217	Vodice
00050000-5568-5ef0-3339-c9cc88c7661b	3212	Vojnik\t
00050000-5568-5ef0-0c77-895bfcd45b9b	5293	Volčja Draga
00050000-5568-5ef0-b53d-41fcd37f23ba	2232	Voličina
00050000-5568-5ef0-2a25-f6b1d9b09155	3305	Vransko
00050000-5568-5ef0-4b2d-cf4c31aaa104	6217	Vremski Britof
00050000-5568-5ef0-a414-e19b996ffeb1	1360	Vrhnika
00050000-5568-5ef0-d9d7-333b2fb62b5b	2365	Vuhred
00050000-5568-5ef0-dc17-f7686db3cf12	2367	Vuzenica
00050000-5568-5ef0-3692-b96e687ee0dd	8292	Zabukovje 
00050000-5568-5ef0-e6cc-f1d68c24d2d1	1410	Zagorje ob Savi
00050000-5568-5ef0-f1ed-604a5e3a678c	1303	Zagradec
00050000-5568-5ef0-7d21-addd0fd89996	2283	Zavrč
00050000-5568-5ef0-0822-e1d1cdaf63d3	8272	Zdole 
00050000-5568-5ef0-0681-73f804811a8a	4201	Zgornja Besnica
00050000-5568-5ef0-b872-ab96a0baddce	2242	Zgornja Korena
00050000-5568-5ef0-c93e-132289f692f7	2201	Zgornja Kungota
00050000-5568-5ef0-07ab-7b92ba059e4b	2316	Zgornja Ložnica
00050000-5568-5ef0-eacd-e0b610c87ef9	2314	Zgornja Polskava
00050000-5568-5ef0-f94b-6f33c67e25a5	2213	Zgornja Velka
00050000-5568-5ef0-2d5b-e64101a7ba66	4247	Zgornje Gorje
00050000-5568-5ef0-d4e1-9dbfb09c94e5	4206	Zgornje Jezersko
00050000-5568-5ef0-5828-e4dcac9070e6	2285	Zgornji Leskovec
00050000-5568-5ef0-6790-2074563f40a4	1432	Zidani Most
00050000-5568-5ef0-328d-718c17f11ce1	3214	Zreče
00050000-5568-5ef0-95fc-6f6049434dab	4209	Žabnica
00050000-5568-5ef0-d964-95651f28aa5d	3310	Žalec
00050000-5568-5ef0-a68a-b4364aca4f6e	4228	Železniki
00050000-5568-5ef0-5a9e-f7fe8c123b6a	2287	Žetale
00050000-5568-5ef0-c3ed-80b00ff48ee7	4226	Žiri
00050000-5568-5ef0-08f1-f3045e972288	4274	Žirovnica
00050000-5568-5ef0-2bea-591162e75a45	8360	Žužemberk
\.


--
-- TOC entry 2722 (class 0 OID 5535830)
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
-- TOC entry 2704 (class 0 OID 5535645)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5535723)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5535842)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5535962)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5536013)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5535871)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5568-5ef1-1026-69678da58d65	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5568-5ef1-382c-1ce9bf0e9482	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5568-5ef1-c30c-9223adcf886f	0003	Kazinska	t	84	Kazinska dvorana
00220000-5568-5ef1-391d-7fca60c87b2b	0004	Mali oder	t	24	Mali oder 
00220000-5568-5ef1-086d-ff224fd42bbf	0005	Komorni oder	t	15	Komorni oder
00220000-5568-5ef1-3b5a-35b0d8b46cce	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5568-5ef1-90cc-452385cbc4f0	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2720 (class 0 OID 5535815)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5535805)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5536002)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5535939)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5535518)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5568-5ef0-7cf1-de339d820b95	00010000-5568-5ef0-eb4e-b94c1f745075	2015-05-29 14:43:30	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROcuptWg99Vn2FRhIpFBmQD/ztw7DYNTG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2729 (class 0 OID 5535881)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5535556)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5568-5ef0-d337-a40d89ffda40	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5568-5ef0-b567-8f37f4148e15	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5568-5ef0-3ae2-b71efb8b14f5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5568-5ef0-5449-9b4ec9a3d6c2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5568-5ef0-734e-e015658eb8da	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5568-5ef0-a8fa-6ec177502c85	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2695 (class 0 OID 5535540)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5568-5ef0-7cf1-de339d820b95	00020000-5568-5ef0-5449-9b4ec9a3d6c2
00010000-5568-5ef0-eb4e-b94c1f745075	00020000-5568-5ef0-5449-9b4ec9a3d6c2
\.


--
-- TOC entry 2731 (class 0 OID 5535895)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5535836)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5535786)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2749 (class 0 OID 5536110)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5568-5ef0-1305-df447c07fcc0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5568-5ef0-77e2-ab39b15cd840	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5568-5ef0-e628-9b07751cea6f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5568-5ef0-511f-b2a95765a3db	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5568-5ef0-8d57-2e606f9a0d8f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2748 (class 0 OID 5536103)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5568-5ef0-059a-aa07361bf245	00000000-5568-5ef0-511f-b2a95765a3db	popa
00000000-5568-5ef0-604b-2834e7527588	00000000-5568-5ef0-511f-b2a95765a3db	oseba
00000000-5568-5ef0-03a4-da51cffacd60	00000000-5568-5ef0-77e2-ab39b15cd840	prostor
00000000-5568-5ef0-c86b-9935ba5f909f	00000000-5568-5ef0-511f-b2a95765a3db	besedilo
00000000-5568-5ef0-28d5-d36095a399d5	00000000-5568-5ef0-511f-b2a95765a3db	uprizoritev
00000000-5568-5ef0-2a37-5c2aba66d1b0	00000000-5568-5ef0-511f-b2a95765a3db	funkcija
00000000-5568-5ef0-055d-d367eec293e1	00000000-5568-5ef0-511f-b2a95765a3db	tipfunkcije
00000000-5568-5ef0-8b3f-6a5cd32031cb	00000000-5568-5ef0-511f-b2a95765a3db	alternacija
\.


--
-- TOC entry 2747 (class 0 OID 5536098)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5535949)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5535617)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5535792)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5568-5ef1-93a0-607580111dae	00180000-5568-5ef1-e208-e20c83e41fe5	000c0000-5568-5ef1-cdbb-373b0c248bb8	00090000-5568-5ef1-e04e-b06aed2dfd8d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5568-5ef1-2430-8dd39d33d532	00180000-5568-5ef1-e208-e20c83e41fe5	000c0000-5568-5ef1-247a-cb5d4b1f5ada	00090000-5568-5ef1-1de4-69443e2c6e8e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5568-5ef1-b0a5-d36ac76d8d60	00180000-5568-5ef1-e208-e20c83e41fe5	000c0000-5568-5ef1-7a02-7117a3178498	00090000-5568-5ef1-cd83-994c315ef6a7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5568-5ef1-a8aa-086dc81a1946	00180000-5568-5ef1-e208-e20c83e41fe5	000c0000-5568-5ef1-12b7-2db132680a94	00090000-5568-5ef1-9245-979b7341ca72	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5568-5ef1-1004-2251d017ac9f	00180000-5568-5ef1-e208-e20c83e41fe5	000c0000-5568-5ef1-8735-b8b7b2b4c67b	00090000-5568-5ef1-67ad-a100e8243a1f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
\.


--
-- TOC entry 2739 (class 0 OID 5535991)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5568-5ef0-6d63-91e18cb2d2ab	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5568-5ef0-ea4f-563ae821ffe1	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5568-5ef0-f76e-efa6f4c28e75	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5568-5ef0-d2f5-be6010cfeef5	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5568-5ef0-918c-0a31757d1adb	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5568-5ef0-8506-cf78070a6c28	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5568-5ef0-ec91-77360a7e07e8	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5568-5ef0-2c72-6a7c32e8649e	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5568-5ef0-7bfc-8b12d8e2d66c	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5568-5ef0-87bf-f9eefba1eb46	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5568-5ef0-53ff-051b1a8a024a	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5568-5ef0-c896-5dfe56022624	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5568-5ef0-c9bb-9428c316d42f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5568-5ef0-fb71-81cf738b3258	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5568-5ef0-2ce5-576f547a358d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5568-5ef0-0d64-cfca5ee9efb5	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2707 (class 0 OID 5535680)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5535527)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5568-5ef0-eb4e-b94c1f745075	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROpnH1shWXthMToesJh4XpIowE4zNl3qe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5568-5ef1-ac7b-c069106fad77	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5568-5ef1-5030-9c34d62c6461	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5568-5ef1-ef3e-1c4c498cf795	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5568-5ef0-7cf1-de339d820b95	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 5536046)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5568-5ef1-6799-2e8d4e92ae5f	00160000-5568-5ef1-edb8-7efa4be9bc5d	00150000-5568-5ef0-89ce-4e57a9a4875a	00140000-5568-5ef0-9839-5358c08dfdb0	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5568-5ef1-086d-ff224fd42bbf
000e0000-5568-5ef1-7dc7-5b0be6a7932e	00160000-5568-5ef1-4d2d-562bc4427025	00150000-5568-5ef0-6995-be6eaa44213d	00140000-5568-5ef0-518b-0729eb9d447d	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5568-5ef1-3b5a-35b0d8b46cce
\.


--
-- TOC entry 2712 (class 0 OID 5535738)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5568-5ef1-ad48-d4e5418a1107	000e0000-5568-5ef1-7dc7-5b0be6a7932e	1	
00200000-5568-5ef1-267e-43fa1bacd700	000e0000-5568-5ef1-7dc7-5b0be6a7932e	2	
\.


--
-- TOC entry 2727 (class 0 OID 5535863)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5535931)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5535770)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5536036)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5568-5ef0-9839-5358c08dfdb0	Drama	drama (SURS 01)
00140000-5568-5ef0-017f-7d4951b48a0d	Opera	opera (SURS 02)
00140000-5568-5ef0-2c7c-79d5fa0cc0f3	Balet	balet (SURS 03)
00140000-5568-5ef0-5136-e06c7140b06f	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5568-5ef0-4a18-dd17e1d3eb79	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5568-5ef0-518b-0729eb9d447d	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5568-5ef0-75a6-a3660066059c	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2733 (class 0 OID 5535921)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5568-5ef0-14b8-9eed07d0111c	Opera	opera
00150000-5568-5ef0-f1ed-2071dd3ef8f8	Opereta	opereta
00150000-5568-5ef0-c710-95404612de59	Balet	balet
00150000-5568-5ef0-bb90-e744163a1ad8	Plesne prireditve	plesne prireditve
00150000-5568-5ef0-e3ea-1e973b30a219	Lutkovno gledališče	lutkovno gledališče
00150000-5568-5ef0-f61c-d55ffad05ca6	Raziskovalno gledališče	raziskovalno gledališče
00150000-5568-5ef0-b4b0-de2a3745583e	Biografska drama	biografska drama
00150000-5568-5ef0-89ce-4e57a9a4875a	Komedija	komedija
00150000-5568-5ef0-187c-1d833baca792	Črna komedija	črna komedija
00150000-5568-5ef0-983f-ee5c8dd2da83	E-igra	E-igra
00150000-5568-5ef0-6995-be6eaa44213d	Kriminalka	kriminalka
00150000-5568-5ef0-e5ab-01687ffbe77f	Musical	musical
\.


--
-- TOC entry 2314 (class 2606 OID 5535581)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 5536091)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 5536081)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5535990)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5535760)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 5535785)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5535706)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5535917)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5535736)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5535779)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 5535720)
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
-- TOC entry 2405 (class 2606 OID 5535828)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5535855)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 5535678)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 5535590)
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
-- TOC entry 2320 (class 2606 OID 5535614)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 5535570)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2305 (class 2606 OID 5535555)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 5535861)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5535894)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 5536031)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 5535642)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 5535666)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 5535834)
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
-- TOC entry 2335 (class 2606 OID 5535656)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 5535727)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 5535846)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 5535974)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5536018)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5535878)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 5535819)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 5535810)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5536012)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 5535946)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 5535526)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 5535885)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 5535544)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2307 (class 2606 OID 5535564)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 5535903)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5535841)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5535791)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5536116)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5536107)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5536102)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 5535959)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 5535622)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 5535801)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5536001)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 5535691)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 5535539)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5536061)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 5535745)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 5535869)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 5535937)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 5535774)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 5536045)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 5535930)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 1259 OID 5535767)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2452 (class 1259 OID 5535960)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2453 (class 1259 OID 5535961)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2327 (class 1259 OID 5535644)
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
-- TOC entry 2418 (class 1259 OID 5535862)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2412 (class 1259 OID 5535848)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2413 (class 1259 OID 5535847)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2364 (class 1259 OID 5535746)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 5535918)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5535920)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2442 (class 1259 OID 5535919)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 5535722)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 5535721)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2469 (class 1259 OID 5536033)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 5536034)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5536035)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2477 (class 1259 OID 5536066)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2478 (class 1259 OID 5536063)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2479 (class 1259 OID 5536065)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2480 (class 1259 OID 5536064)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2342 (class 1259 OID 5535693)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 5535692)
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
-- TOC entry 2428 (class 1259 OID 5535886)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2382 (class 1259 OID 5535780)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2309 (class 1259 OID 5535571)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2310 (class 1259 OID 5535572)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2433 (class 1259 OID 5535906)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2434 (class 1259 OID 5535905)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2435 (class 1259 OID 5535904)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2356 (class 1259 OID 5535728)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2357 (class 1259 OID 5535730)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2358 (class 1259 OID 5535729)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5536109)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2392 (class 1259 OID 5535814)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2393 (class 1259 OID 5535812)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2394 (class 1259 OID 5535811)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2395 (class 1259 OID 5535813)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2300 (class 1259 OID 5535545)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 5535546)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2421 (class 1259 OID 5535870)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2407 (class 1259 OID 5535835)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2448 (class 1259 OID 5535947)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2449 (class 1259 OID 5535948)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2331 (class 1259 OID 5535658)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2332 (class 1259 OID 5535657)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2333 (class 1259 OID 5535659)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2456 (class 1259 OID 5535975)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2457 (class 1259 OID 5535976)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2490 (class 1259 OID 5536095)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 5536094)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2492 (class 1259 OID 5536097)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2493 (class 1259 OID 5536093)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2494 (class 1259 OID 5536096)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2445 (class 1259 OID 5535938)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 5535823)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2399 (class 1259 OID 5535822)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2400 (class 1259 OID 5535820)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2401 (class 1259 OID 5535821)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2283 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 5536083)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 5536082)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2363 (class 1259 OID 5535737)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2315 (class 1259 OID 5535592)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2316 (class 1259 OID 5535591)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2323 (class 1259 OID 5535623)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2324 (class 1259 OID 5535624)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 5535804)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2388 (class 1259 OID 5535803)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2389 (class 1259 OID 5535802)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2370 (class 1259 OID 5535769)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2371 (class 1259 OID 5535765)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2372 (class 1259 OID 5535762)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2373 (class 1259 OID 5535763)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2374 (class 1259 OID 5535761)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2375 (class 1259 OID 5535766)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2376 (class 1259 OID 5535764)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2330 (class 1259 OID 5535643)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2348 (class 1259 OID 5535707)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5535709)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2350 (class 1259 OID 5535708)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2351 (class 1259 OID 5535710)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2406 (class 1259 OID 5535829)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2474 (class 1259 OID 5536032)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 5536062)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2321 (class 1259 OID 5535615)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5535616)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5536117)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2341 (class 1259 OID 5535679)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5536108)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2426 (class 1259 OID 5535880)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2427 (class 1259 OID 5535879)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2495 (class 1259 OID 5536092)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2286 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2338 (class 1259 OID 5535667)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 5536019)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 5535565)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2377 (class 1259 OID 5535768)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2531 (class 2606 OID 5536248)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2528 (class 2606 OID 5536233)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2529 (class 2606 OID 5536238)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2533 (class 2606 OID 5536258)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2527 (class 2606 OID 5536228)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2532 (class 2606 OID 5536253)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2530 (class 2606 OID 5536243)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2562 (class 2606 OID 5536403)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5536408)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5536163)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2550 (class 2606 OID 5536343)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5536338)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2548 (class 2606 OID 5536333)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2526 (class 2606 OID 5536223)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5536373)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5536383)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 5536378)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5536198)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5536193)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2546 (class 2606 OID 5536323)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2567 (class 2606 OID 5536428)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2568 (class 2606 OID 5536433)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2569 (class 2606 OID 5536438)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2573 (class 2606 OID 5536458)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2570 (class 2606 OID 5536443)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5536453)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2571 (class 2606 OID 5536448)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5536188)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5536183)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5536148)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2552 (class 2606 OID 5536353)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2534 (class 2606 OID 5536263)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 5536128)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 5536133)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2555 (class 2606 OID 5536368)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2554 (class 2606 OID 5536363)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2553 (class 2606 OID 5536358)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2522 (class 2606 OID 5536203)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2524 (class 2606 OID 5536213)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2523 (class 2606 OID 5536208)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2581 (class 2606 OID 5536498)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2541 (class 2606 OID 5536298)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2539 (class 2606 OID 5536288)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2538 (class 2606 OID 5536283)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5536293)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 5536118)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 5536123)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2551 (class 2606 OID 5536348)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2547 (class 2606 OID 5536328)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2560 (class 2606 OID 5536393)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5536398)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 5536173)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2515 (class 2606 OID 5536168)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2517 (class 2606 OID 5536178)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2564 (class 2606 OID 5536413)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5536418)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2578 (class 2606 OID 5536483)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2577 (class 2606 OID 5536478)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2580 (class 2606 OID 5536493)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2576 (class 2606 OID 5536473)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2579 (class 2606 OID 5536488)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2559 (class 2606 OID 5536388)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2545 (class 2606 OID 5536318)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5536313)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2542 (class 2606 OID 5536303)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2543 (class 2606 OID 5536308)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5536468)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2574 (class 2606 OID 5536463)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2525 (class 2606 OID 5536218)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5536423)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5536143)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 5536138)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2512 (class 2606 OID 5536153)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5536158)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2537 (class 2606 OID 5536278)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2536 (class 2606 OID 5536273)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2535 (class 2606 OID 5536268)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-29 14:43:30 CEST

--
-- PostgreSQL database dump complete
--

