--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-29 14:32:00 CEST

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
-- TOC entry 180 (class 1259 OID 5527354)
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
-- TOC entry 227 (class 1259 OID 5527865)
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
-- TOC entry 226 (class 1259 OID 5527848)
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
-- TOC entry 219 (class 1259 OID 5527758)
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
-- TOC entry 194 (class 1259 OID 5527528)
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
-- TOC entry 197 (class 1259 OID 5527562)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5527475)
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
-- TOC entry 213 (class 1259 OID 5527688)
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
-- TOC entry 192 (class 1259 OID 5527512)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5527556)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5527492)
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
-- TOC entry 202 (class 1259 OID 5527605)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5527630)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5527449)
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
-- TOC entry 181 (class 1259 OID 5527363)
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
-- TOC entry 182 (class 1259 OID 5527374)
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
-- TOC entry 177 (class 1259 OID 5527328)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5527347)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5527637)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5527668)
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
-- TOC entry 223 (class 1259 OID 5527801)
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
-- TOC entry 184 (class 1259 OID 5527406)
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
-- TOC entry 186 (class 1259 OID 5527441)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5527611)
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
-- TOC entry 185 (class 1259 OID 5527426)
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
-- TOC entry 191 (class 1259 OID 5527504)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5527623)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5527743)
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
-- TOC entry 222 (class 1259 OID 5527794)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5527652)
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
-- TOC entry 201 (class 1259 OID 5527596)
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
-- TOC entry 200 (class 1259 OID 5527586)
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
-- TOC entry 221 (class 1259 OID 5527783)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5527720)
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
-- TOC entry 174 (class 1259 OID 5527299)
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
-- TOC entry 173 (class 1259 OID 5527297)
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
-- TOC entry 210 (class 1259 OID 5527662)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5527337)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5527321)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5527676)
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
-- TOC entry 204 (class 1259 OID 5527617)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5527567)
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
-- TOC entry 230 (class 1259 OID 5527891)
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
-- TOC entry 229 (class 1259 OID 5527884)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5527879)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5527730)
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
-- TOC entry 183 (class 1259 OID 5527398)
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
-- TOC entry 199 (class 1259 OID 5527573)
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
-- TOC entry 220 (class 1259 OID 5527772)
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
-- TOC entry 188 (class 1259 OID 5527461)
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
-- TOC entry 175 (class 1259 OID 5527308)
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
-- TOC entry 225 (class 1259 OID 5527827)
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
-- TOC entry 193 (class 1259 OID 5527519)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5527644)
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
-- TOC entry 215 (class 1259 OID 5527712)
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
-- TOC entry 195 (class 1259 OID 5527551)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5527817)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5527702)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2144 (class 2604 OID 5527302)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2699 (class 0 OID 5527354)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5527865)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5568-5c3f-fc0e-e8c6f6669ebf	000d0000-5568-5c3f-84d1-f94096537f5f	\N	00090000-5568-5c3f-8585-804739bfc0a8	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5568-5c3f-315d-4fe85839855a	000d0000-5568-5c3f-9025-3ac2aba85759	\N	00090000-5568-5c3f-1096-3c9577523254	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-5568-5c3f-8ed4-f854b7281505	000d0000-5568-5c3f-98a3-95ef6745feb9	\N	00090000-5568-5c3f-ddd3-6f32aeb81e85	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-5568-5c3f-acc0-72e7e68f3403	000d0000-5568-5c3f-6c9d-5ae726c7808f	\N	00090000-5568-5c3f-5cd8-f7bc2de7b993	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-5568-5c3f-de23-b86db868e875	000d0000-5568-5c3f-6b73-fedade0ee5fb	\N	00090000-5568-5c3f-858b-1f43df35e2f1	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5527848)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5527758)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5568-5c3f-6168-733c19252b45	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5568-5c3f-7710-a7f5ec7c3667	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5568-5c3f-bac6-dc69fed87ecd	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2713 (class 0 OID 5527528)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5568-5c3f-7aa6-d6187f23d931	\N	\N	00200000-5568-5c3f-6271-7da86b3e6d6d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-5568-5c3f-a32a-6db61d4abfc2	\N	\N	00200000-5568-5c3f-429e-65162a190148	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
\.


--
-- TOC entry 2716 (class 0 OID 5527562)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5527475)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5568-5c3e-bb67-6c06e6e211a6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5568-5c3e-21c5-1ed3de74c19f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5568-5c3e-07a7-152d835c4818	AL	ALB	008	Albania 	Albanija	\N
00040000-5568-5c3e-a7db-d712ba217986	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5568-5c3e-c8c1-d170472a4f3d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5568-5c3e-a9b1-e1a0a7ce6e00	AD	AND	020	Andorra 	Andora	\N
00040000-5568-5c3e-e916-60e6131fe6f6	AO	AGO	024	Angola 	Angola	\N
00040000-5568-5c3e-78cb-12a975047f59	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5568-5c3e-33b0-c7f0cb73c0e3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5568-5c3e-6c4e-d25da5b276ac	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5568-5c3e-6f6c-76c898ac5c5b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5568-5c3e-8e4c-e9eab7d1d1fe	AM	ARM	051	Armenia 	Armenija	\N
00040000-5568-5c3e-7053-8fb605c50dc8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5568-5c3e-b293-0f5515405015	AU	AUS	036	Australia 	Avstralija	\N
00040000-5568-5c3e-8f25-e92dd42c82f9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5568-5c3e-214a-fa0fb12e842d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5568-5c3e-5b15-6eaa3bdcd7c9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5568-5c3e-0985-2180e98c0c53	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5568-5c3e-016b-1c76aac7ca02	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5568-5c3e-e98b-fca04079362f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5568-5c3e-26ab-4d6960669d2a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5568-5c3e-9b77-b3bc9c109e1f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5568-5c3e-5cb2-7cca2fecadf2	BZ	BLZ	084	Belize 	Belize	\N
00040000-5568-5c3e-f3b7-f7d362c1274b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5568-5c3e-b0cb-9f3e99f126d2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5568-5c3e-184d-2a6dd08c7e69	BT	BTN	064	Bhutan 	Butan	\N
00040000-5568-5c3e-f620-d413fd8dd466	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5568-5c3e-3258-ba1faad238e2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5568-5c3e-0a34-e4da2d22c25e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5568-5c3e-ef82-df7cb765a649	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5568-5c3e-6ec8-01d15a4e975d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5568-5c3e-2bde-c602d9d4e29c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5568-5c3e-1c74-6853cf8bcb83	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5568-5c3e-67a1-aa37a38e7a98	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5568-5c3e-9f72-826ebd743503	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5568-5c3e-9753-3dfe656ffc2b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5568-5c3e-dcf8-55fb7d29417c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5568-5c3e-e171-d91c455c395d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5568-5c3e-9b0c-69175df56c28	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5568-5c3e-faf8-0ba8f9bbc117	CA	CAN	124	Canada 	Kanada	\N
00040000-5568-5c3e-90ff-0a02c9d9e6b9	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5568-5c3e-725f-5f177bcc7dad	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5568-5c3e-f980-9ee4c91746df	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5568-5c3e-b518-3e1352baf513	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5568-5c3e-babf-0d088403650d	CL	CHL	152	Chile 	Čile	\N
00040000-5568-5c3e-0c85-f7e9da2cb661	CN	CHN	156	China 	Kitajska	\N
00040000-5568-5c3e-0528-e584dfeb3d74	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5568-5c3e-8d09-3865d1d2f1e5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5568-5c3e-6de7-8541a4193389	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5568-5c3e-5a4d-a76aad2ba9ff	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5568-5c3e-74f9-5cc47ec18426	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5568-5c3e-0fb3-f280c75e6b31	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5568-5c3e-d7c3-6780926a833d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5568-5c3e-8a52-6bc362fd9045	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5568-5c3e-48bc-c640dba40fc1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5568-5c3e-bbad-012ad842de79	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5568-5c3e-ea8f-cd1f47430b14	CU	CUB	192	Cuba 	Kuba	\N
00040000-5568-5c3e-0ec7-6b06ed26b948	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5568-5c3e-af3c-10cea52944af	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5568-5c3e-0b1e-b23a11ba7651	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5568-5c3e-c237-e52603ff69d5	DK	DNK	208	Denmark 	Danska	\N
00040000-5568-5c3e-1c07-767f52ac856b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5568-5c3e-f9ea-e03d7fbe244b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5568-5c3e-0fe0-f119eab69720	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5568-5c3e-c037-f234feb1b176	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5568-5c3e-0926-c8635bb11cf2	EG	EGY	818	Egypt 	Egipt	\N
00040000-5568-5c3e-a8a6-eef2f9d12ccf	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5568-5c3e-2770-5d1f6282447b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5568-5c3e-a8cb-8117154ef402	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5568-5c3e-48e1-bcb441311600	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5568-5c3e-8414-e68b4054ef96	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5568-5c3e-75b1-c8106c0bc42c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5568-5c3e-058e-3c3131361da6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5568-5c3e-e32a-1f2790f6178c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5568-5c3e-d9ef-cbad723dec1c	FI	FIN	246	Finland 	Finska	\N
00040000-5568-5c3e-5955-3440ec20628c	FR	FRA	250	France 	Francija	\N
00040000-5568-5c3e-1950-e460107276de	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5568-5c3e-1cc4-f4b30f616a89	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5568-5c3e-c05f-f631b454912b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5568-5c3e-ff4d-c0b24463948a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5568-5c3e-7b22-b37d2ea2f97f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5568-5c3e-90d5-2e4535899ad7	GM	GMB	270	Gambia 	Gambija	\N
00040000-5568-5c3e-db36-9286906089fb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5568-5c3e-1406-5f8fd64f177a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5568-5c3e-ff77-95d6800709ee	GH	GHA	288	Ghana 	Gana	\N
00040000-5568-5c3e-f84b-6a1c0679d3bd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5568-5c3e-cd3d-5ac8795520aa	GR	GRC	300	Greece 	Grčija	\N
00040000-5568-5c3e-eb60-089e3185c99e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5568-5c3e-95cf-e77943ccae51	GD	GRD	308	Grenada 	Grenada	\N
00040000-5568-5c3e-8379-46e63fbe5ab7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5568-5c3e-4cf7-a60b61f659a1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5568-5c3e-003d-ccd8a287092e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5568-5c3e-2733-304352a02048	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5568-5c3e-8bab-cd96542c11ae	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5568-5c3e-c737-e2f2f2509c08	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5568-5c3e-99d2-9e892239bb1b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5568-5c3e-1c45-12fa9d2ddac2	HT	HTI	332	Haiti 	Haiti	\N
00040000-5568-5c3e-13a2-051e6f7c4166	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5568-5c3e-6f8a-a9944a60f78e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5568-5c3e-0b7b-337da195e0f8	HN	HND	340	Honduras 	Honduras	\N
00040000-5568-5c3e-1398-8ad96aa50d85	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5568-5c3e-68ba-bbf2e0a14382	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5568-5c3e-c969-fce87aea5274	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5568-5c3e-c2f6-6c16c3bd572f	IN	IND	356	India 	Indija	\N
00040000-5568-5c3e-403f-80a64b733e5a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5568-5c3e-b350-7174a2e5c825	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5568-5c3e-ae1e-3c7ba5228f68	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5568-5c3e-1628-be726f639f1a	IE	IRL	372	Ireland 	Irska	\N
00040000-5568-5c3e-d6d4-5d625aa45981	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5568-5c3e-e525-1cb964018752	IL	ISR	376	Israel 	Izrael	\N
00040000-5568-5c3e-534c-4e77b39ec307	IT	ITA	380	Italy 	Italija	\N
00040000-5568-5c3e-c276-f96c8ac47c90	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5568-5c3e-566d-32740da95ee6	JP	JPN	392	Japan 	Japonska	\N
00040000-5568-5c3e-0941-fe188fb83382	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5568-5c3e-f7ca-0cef6d66fe63	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5568-5c3e-3c21-71c6394cc642	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5568-5c3e-085c-0c9cb18d082c	KE	KEN	404	Kenya 	Kenija	\N
00040000-5568-5c3e-4df4-9b33b0c491e1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5568-5c3e-b664-3cbc8a7e4eef	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5568-5c3e-9fb8-885be78d8cb0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5568-5c3e-3cc1-87f490149fce	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5568-5c3e-7d9e-088dcfa51d40	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5568-5c3e-0c0e-ebfed1ec8161	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5568-5c3e-5c74-c6b73abbc7a1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5568-5c3e-1fe3-0fc45626e23e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5568-5c3e-6084-63c6f5c615a5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5568-5c3e-4bb0-cb7d1fe3c81c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5568-5c3e-e9b2-40cb0568b464	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5568-5c3e-7107-7b37bb7c2616	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5568-5c3e-9d2a-4f5f9e2e33ee	LT	LTU	440	Lithuania 	Litva	\N
00040000-5568-5c3e-c935-6b224821b5a2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5568-5c3e-d9ae-04a18d60f8ea	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5568-5c3e-4bb5-9b302eee839f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5568-5c3e-7899-aa8179b6bccd	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5568-5c3e-db44-3bff7daa9a3b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5568-5c3e-3914-7d788b0a19c0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5568-5c3e-6e7c-3178d1083423	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5568-5c3e-aa36-6219a07b83eb	ML	MLI	466	Mali 	Mali	\N
00040000-5568-5c3e-40eb-5b0e236a2fdf	MT	MLT	470	Malta 	Malta	\N
00040000-5568-5c3e-7776-d64bee629797	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5568-5c3e-e177-67e24c524d09	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5568-5c3e-99cc-cb92d6b5a77a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5568-5c3e-4caf-1ec8b0bf1f48	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5568-5c3e-3eac-25c68687edf4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5568-5c3e-c44c-9f0295a2837d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5568-5c3e-9621-24250df450e9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5568-5c3e-e431-669817629a1b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5568-5c3e-11d0-dce6677b47e9	MC	MCO	492	Monaco 	Monako	\N
00040000-5568-5c3e-c48f-2513483dc2ca	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5568-5c3e-ada9-add6e19269da	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5568-5c3e-37db-55ca614921c8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5568-5c3e-2cda-9e535e8b5c18	MA	MAR	504	Morocco 	Maroko	\N
00040000-5568-5c3e-d2e9-c8f63b6d7c26	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5568-5c3e-8955-3fd077418bf8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5568-5c3e-a5c4-0a1f80a9142f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5568-5c3e-fc6e-2b3ff8fa5053	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5568-5c3e-3996-be21d7f4b4d4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5568-5c3e-14d9-2c9137acd405	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5568-5c3e-bd37-5e5adca09746	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5568-5c3e-b480-99cbc9578241	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5568-5c3e-04e5-8c274acf873a	NE	NER	562	Niger 	Niger 	\N
00040000-5568-5c3e-9a68-4d0d96a9627a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5568-5c3e-ba3b-a8179a5adaf4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5568-5c3e-2103-d4da9e5cd6c3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5568-5c3e-660b-51000c24d8e0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5568-5c3e-6fdc-d16792df1d52	NO	NOR	578	Norway 	Norveška	\N
00040000-5568-5c3e-c0ad-9a497e6f0aa4	OM	OMN	512	Oman 	Oman	\N
00040000-5568-5c3e-f32a-a3b465a65ae2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5568-5c3e-a170-69e9fa4f4ca3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5568-5c3e-7f94-7846170239ff	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5568-5c3e-eef5-f630e0bbaaf5	PA	PAN	591	Panama 	Panama	\N
00040000-5568-5c3e-f3b6-4e7fca3ccac8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5568-5c3e-a1f3-f1e1de7a77d0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5568-5c3e-0295-eea2e3a09625	PE	PER	604	Peru 	Peru	\N
00040000-5568-5c3e-cdeb-10903818f3c5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5568-5c3e-1b6b-9fcf926973c6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5568-5c3e-8adc-3114bb9d8e39	PL	POL	616	Poland 	Poljska	\N
00040000-5568-5c3e-b18d-640a965b8c83	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5568-5c3e-9d28-e8258fd5cfc9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5568-5c3e-f32c-783267d36ee6	QA	QAT	634	Qatar 	Katar	\N
00040000-5568-5c3e-38a1-9d6c812f535f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5568-5c3e-32de-74004d9d4f97	RO	ROU	642	Romania 	Romunija	\N
00040000-5568-5c3e-ef83-df21a8813273	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5568-5c3e-70d8-61bcc7f0af6a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5568-5c3e-6617-4b7365477b23	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5568-5c3e-8fd3-b77f73c6a0d1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5568-5c3e-808a-4b9ca3b4f604	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5568-5c3e-f1ac-5bb48baa4e13	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5568-5c3e-eceb-ee904133c6fe	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5568-5c3e-dcea-9aca9bd81b35	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5568-5c3e-12ba-c99356e2cf59	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5568-5c3e-c7f2-4da5f5562498	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5568-5c3e-61f4-7ae6f1124c0e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5568-5c3e-0513-faffa93dd491	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5568-5c3e-43f9-3a69be1797c5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5568-5c3e-4282-2b1ed9fe8a86	SN	SEN	686	Senegal 	Senegal	\N
00040000-5568-5c3e-74b6-c787758d4290	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5568-5c3e-b4d1-ec325c0a8125	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5568-5c3e-ebbe-d47b491e5589	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5568-5c3e-9d12-fc9db44055de	SG	SGP	702	Singapore 	Singapur	\N
00040000-5568-5c3e-ec8b-846b337dca29	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5568-5c3e-6a61-54121e37a2d0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5568-5c3e-f70f-fa8652edc5ee	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5568-5c3e-9cb9-133ad3255f9a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5568-5c3e-c9b2-d81e5997db0a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5568-5c3e-9f21-bc8092427ce1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5568-5c3e-0bb7-aad27c525a5b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5568-5c3e-a200-e50a5473b1af	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5568-5c3e-01f1-8db74f862b71	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5568-5c3e-bee1-5f8b47964019	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5568-5c3e-dde1-8d5e7456426d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5568-5c3e-7ade-c91956b8bceb	SR	SUR	740	Suriname 	Surinam	\N
00040000-5568-5c3e-519a-cb165a6c4b2c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5568-5c3e-dc67-ef3e9cbaa895	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5568-5c3e-05c3-26606b9fc53d	SE	SWE	752	Sweden 	Švedska	\N
00040000-5568-5c3e-20c6-af1bbb1d6821	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5568-5c3e-9069-1a1250a8b74a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5568-5c3e-5abe-113825f6b908	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5568-5c3e-a8e3-9ccb6f887e0a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5568-5c3e-e4bd-ac5d1e2380c8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5568-5c3e-3c20-32f4e554a107	TH	THA	764	Thailand 	Tajska	\N
00040000-5568-5c3e-36af-f7974fbc59b2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5568-5c3e-bc48-3b4e0dff9d93	TG	TGO	768	Togo 	Togo	\N
00040000-5568-5c3e-21ff-56bb6e7ff461	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5568-5c3e-6d8a-acb3f7c50a40	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5568-5c3e-b4d8-b21e552a885e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5568-5c3e-98f4-f26989e4ca17	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5568-5c3e-514e-3573ec89bc33	TR	TUR	792	Turkey 	Turčija	\N
00040000-5568-5c3e-8502-974f16bbbd10	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5568-5c3e-20ff-e84dc5b5b683	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5568-5c3e-d285-76e5672821f3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5568-5c3e-4d11-f32a88715183	UG	UGA	800	Uganda 	Uganda	\N
00040000-5568-5c3e-e3f1-82173f8b4fe8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5568-5c3e-3248-6ed4583cc22d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5568-5c3e-6658-6514fc873ca4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5568-5c3e-95c1-1f71b2de3d2e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5568-5c3e-2f69-5aad49726612	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5568-5c3e-e243-9d5fa6d40064	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5568-5c3e-c31d-6d94764567fd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5568-5c3e-73c8-26112d3fa7c2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5568-5c3e-4a13-8fd7eabbfe66	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5568-5c3e-9ef6-62550d4d1195	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5568-5c3e-c014-b78bcda44fbb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5568-5c3e-6a2a-c5e76b4586f2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5568-5c3e-8125-70b577683203	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5568-5c3e-b9f4-4e3f6e5e1f85	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5568-5c3e-a064-343c1cb4fb40	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5568-5c3e-db32-18ff25363ec1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5568-5c3e-8889-3310174fc4aa	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2732 (class 0 OID 5527688)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-5568-5c3f-c657-88c7a4152b58	000e0000-5568-5c3f-1173-b0c53a2669af	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5568-5c3e-5e3d-5bdca0ca3e7b
000d0000-5568-5c3f-84d1-f94096537f5f	000e0000-5568-5c3f-1173-b0c53a2669af	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5568-5c3e-5e3d-5bdca0ca3e7b
000d0000-5568-5c3f-9025-3ac2aba85759	000e0000-5568-5c3f-1173-b0c53a2669af	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5568-5c3e-151e-c4d42bcd1665
000d0000-5568-5c3f-98a3-95ef6745feb9	000e0000-5568-5c3f-1173-b0c53a2669af	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5568-5c3e-d76e-12787ba4d735
000d0000-5568-5c3f-6c9d-5ae726c7808f	000e0000-5568-5c3f-1173-b0c53a2669af	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5568-5c3e-d76e-12787ba4d735
000d0000-5568-5c3f-6b73-fedade0ee5fb	000e0000-5568-5c3f-1173-b0c53a2669af	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5568-5c3e-d76e-12787ba4d735
\.


--
-- TOC entry 2711 (class 0 OID 5527512)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5527556)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5527492)
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
-- TOC entry 2721 (class 0 OID 5527605)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5527630)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 5527449)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5568-5c3e-2857-8143edeb15d5	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5568-5c3e-191d-972408d59da5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5568-5c3e-76ea-a02fe9bcd1a0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5568-5c3e-4574-841070c7b9a5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5568-5c3e-8fc3-7c1bf198f7a6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5568-5c3e-7dd7-e8a0dff19358	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5568-5c3e-d3d9-cdb940e42c51	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5568-5c3e-d8e8-289678065a64	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5568-5c3e-86bd-2449bd6a48cc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5568-5c3e-8f4b-eb390f386bec	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5568-5c3e-0c5c-f15e0de41128	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5568-5c3e-307e-a3ecd349e8f0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5568-5c3e-8704-eb88cd45c336	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5568-5c3e-9039-baf518734685	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5568-5c3e-26b9-7aa2e4e69257	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2700 (class 0 OID 5527363)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5568-5c3e-bdac-609ffe4ee19e	00000000-5568-5c3e-8fc3-7c1bf198f7a6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5568-5c3e-114c-450fdc154970	00000000-5568-5c3e-8fc3-7c1bf198f7a6	00010000-5568-5c3e-9dcf-35861086fc42	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5568-5c3e-b8d2-38b2eb3f53cb	00000000-5568-5c3e-7dd7-e8a0dff19358	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2701 (class 0 OID 5527374)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5568-5c3f-6629-3a5e9def169d	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5568-5c3f-5cd8-f7bc2de7b993	00010000-5568-5c3f-d4e1-e2ade69fa45e	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5568-5c3f-ddd3-6f32aeb81e85	00010000-5568-5c3f-1109-ac9545a6f821	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5568-5c3f-16e0-e29cd9e28c2f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5568-5c3f-52ba-5805cf9a0e49	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5568-5c3f-293d-96f12a74e160	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5568-5c3f-1f01-0f2827e5dcee	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5568-5c3f-5af2-aec7c462b801	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5568-5c3f-8585-804739bfc0a8	00010000-5568-5c3f-97e1-fbc9efe8cce5	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5568-5c3f-1096-3c9577523254	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5568-5c3f-5e14-11f86f6b0deb	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5568-5c3f-858b-1f43df35e2f1	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 2691 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5527328)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5568-5c3e-ddef-89e4358f6332	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5568-5c3e-d745-7b9151999712	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5568-5c3e-5a18-17ef655a2a5f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5568-5c3e-8e7b-2ab1ede6fae6	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5568-5c3e-33c0-1d6c2ce23481	Abonma-read	Abonma - branje	f
00030000-5568-5c3e-02ac-46ce3f4f330a	Abonma-write	Abonma - spreminjanje	f
00030000-5568-5c3e-3454-e78e034928a2	Alternacija-read	Alternacija - branje	f
00030000-5568-5c3e-5de4-955e3aaaacd7	Alternacija-write	Alternacija - spreminjanje	f
00030000-5568-5c3e-3381-de49addebeac	Arhivalija-read	Arhivalija - branje	f
00030000-5568-5c3e-9fa2-7e380b9f2595	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5568-5c3e-2817-ebfc4422597e	Besedilo-read	Besedilo - branje	f
00030000-5568-5c3e-c8c8-5798adb50023	Besedilo-write	Besedilo - spreminjanje	f
00030000-5568-5c3e-83e9-20eeacbae48c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5568-5c3e-f966-afa98e3d312e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5568-5c3e-671a-bee15d561f30	Dogodek-read	Dogodek - branje	f
00030000-5568-5c3e-ab82-7907e94a3bf6	Dogodek-write	Dogodek - spreminjanje	f
00030000-5568-5c3e-f5be-de202b6c5248	Drzava-read	Drzava - branje	f
00030000-5568-5c3e-a47d-1835965a09eb	Drzava-write	Drzava - spreminjanje	f
00030000-5568-5c3e-0e73-bb2d50720149	Funkcija-read	Funkcija - branje	f
00030000-5568-5c3e-e1bd-bafb867f0f69	Funkcija-write	Funkcija - spreminjanje	f
00030000-5568-5c3e-c427-69cb7b5f0482	Gostovanje-read	Gostovanje - branje	f
00030000-5568-5c3e-300f-318ed6514863	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5568-5c3e-d858-f34e73b5e467	Gostujoca-read	Gostujoca - branje	f
00030000-5568-5c3e-730a-e8fff7576cdc	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5568-5c3e-5530-7ef8ad9f70d1	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5568-5c3e-f029-721f3d246df8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5568-5c3e-a66e-e0c34fbca601	Kupec-read	Kupec - branje	f
00030000-5568-5c3e-4f89-77936b6631d8	Kupec-write	Kupec - spreminjanje	f
00030000-5568-5c3e-a1fe-cea63e235dd7	NacinPlacina-read	NacinPlacina - branje	f
00030000-5568-5c3e-10e5-10bf78f1ae94	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5568-5c3e-8e7e-528113fa2c36	Option-read	Option - branje	f
00030000-5568-5c3e-0bef-4436a6011c20	Option-write	Option - spreminjanje	f
00030000-5568-5c3e-5138-df11ee3d31a8	OptionValue-read	OptionValue - branje	f
00030000-5568-5c3e-ab6a-5298301bd72a	OptionValue-write	OptionValue - spreminjanje	f
00030000-5568-5c3e-3d7f-c7d8efa4d888	Oseba-read	Oseba - branje	f
00030000-5568-5c3e-3264-66612ecd3d33	Oseba-write	Oseba - spreminjanje	f
00030000-5568-5c3e-c82d-24686a0f3bcd	Permission-read	Permission - branje	f
00030000-5568-5c3e-4e34-4766a0b07d06	Permission-write	Permission - spreminjanje	f
00030000-5568-5c3e-95a8-d927a146858e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5568-5c3e-3023-3333d1f28551	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5568-5c3e-bdc3-44cf01b934ed	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5568-5c3e-9f27-4c2ad60a642f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5568-5c3e-b06a-d3d5e8fb1b27	Pogodba-read	Pogodba - branje	f
00030000-5568-5c3e-9daf-e51b844c4219	Pogodba-write	Pogodba - spreminjanje	f
00030000-5568-5c3e-7843-6ab18b049b9a	Popa-read	Popa - branje	f
00030000-5568-5c3e-2536-62d15a1e066d	Popa-write	Popa - spreminjanje	f
00030000-5568-5c3e-d39b-7c3775f66daa	Posta-read	Posta - branje	f
00030000-5568-5c3e-049f-cbcff41820db	Posta-write	Posta - spreminjanje	f
00030000-5568-5c3e-6e71-43ec98d60088	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5568-5c3e-5662-58e5ed2021d7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5568-5c3e-40de-dfdfdb32e650	PostniNaslov-read	PostniNaslov - branje	f
00030000-5568-5c3e-b161-9318caab6ea6	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5568-5c3e-b448-d1237705dd28	Predstava-read	Predstava - branje	f
00030000-5568-5c3e-068f-3e66092cae19	Predstava-write	Predstava - spreminjanje	f
00030000-5568-5c3e-a80b-75a1ddb7be50	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5568-5c3e-a989-199b629293a5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5568-5c3e-3ef5-58f4f8c11778	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5568-5c3e-1e05-549752ea32dd	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5568-5c3e-e961-60ca11758cc2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5568-5c3e-bf18-e86577c63b13	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5568-5c3e-b465-90b2ede85009	Prostor-read	Prostor - branje	f
00030000-5568-5c3e-5c8e-bb552167d43a	Prostor-write	Prostor - spreminjanje	f
00030000-5568-5c3e-cc66-37e00c682a1a	Racun-read	Racun - branje	f
00030000-5568-5c3e-059e-a0eac71a1f77	Racun-write	Racun - spreminjanje	f
00030000-5568-5c3e-1bf0-5b0a2ac29bd3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5568-5c3e-6e8b-b889b4ae5c6b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5568-5c3e-8317-56018a3e282f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5568-5c3e-b30d-56421450d2c8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5568-5c3e-23f8-b9a6a8ca1692	Rekvizit-read	Rekvizit - branje	f
00030000-5568-5c3e-29bc-1e92dd193bcd	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5568-5c3e-63d7-f9b6a413eff0	Revizija-read	Revizija - branje	f
00030000-5568-5c3e-fb16-b939d9c3616f	Revizija-write	Revizija - spreminjanje	f
00030000-5568-5c3e-28bf-5c64a082c13b	Rezervacija-read	Rezervacija - branje	f
00030000-5568-5c3e-d9c2-a54cd07b395d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5568-5c3e-4c71-7ccb8e351db6	Role-read	Role - branje	f
00030000-5568-5c3e-07b6-16e4d4de176c	Role-write	Role - spreminjanje	f
00030000-5568-5c3e-4acd-fc494fae5a62	SedezniRed-read	SedezniRed - branje	f
00030000-5568-5c3e-c5da-32b124287ea7	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5568-5c3e-cb0a-b93be6070b88	Sedez-read	Sedez - branje	f
00030000-5568-5c3e-d170-20d1212abce5	Sedez-write	Sedez - spreminjanje	f
00030000-5568-5c3e-fb49-d178397d466c	Sezona-read	Sezona - branje	f
00030000-5568-5c3e-8333-360ada2d3eb5	Sezona-write	Sezona - spreminjanje	f
00030000-5568-5c3e-e8cd-2ff60329249a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5568-5c3e-3f18-68ac73310d0f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5568-5c3e-eccc-90a5b076dfd7	Stevilcenje-read	Stevilcenje - branje	f
00030000-5568-5c3e-afda-47f96b8b8e1b	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5568-5c3e-a151-8d69ba3f3aea	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5568-5c3e-4b32-3e4e5826df98	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5568-5c3e-f66f-4ce5ad717082	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5568-5c3e-aba0-988df70f9bd2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5568-5c3e-faa4-c156372c127c	Telefonska-read	Telefonska - branje	f
00030000-5568-5c3e-af52-c7639ce4141c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5568-5c3e-df91-229b68260727	TerminStoritve-read	TerminStoritve - branje	f
00030000-5568-5c3e-6459-6c73b7274c86	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5568-5c3e-10ff-1921ee9fd29a	TipFunkcije-read	TipFunkcije - branje	f
00030000-5568-5c3e-7cdf-b291bb02efe8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5568-5c3e-323c-bd6512fe5aea	Trr-read	Trr - branje	f
00030000-5568-5c3e-583f-6ed3bc558c8e	Trr-write	Trr - spreminjanje	f
00030000-5568-5c3e-0b2a-019ff355d8e0	Uprizoritev-read	Uprizoritev - branje	f
00030000-5568-5c3e-c975-ff0891351cb8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5568-5c3e-3731-85e808ad35a3	User-read	User - branje	f
00030000-5568-5c3e-2ed3-00a0b134ae7a	User-write	User - spreminjanje	f
00030000-5568-5c3e-ecbe-94e15275b890	Vaja-read	Vaja - branje	f
00030000-5568-5c3e-a469-e4e72d47ab29	Vaja-write	Vaja - spreminjanje	f
00030000-5568-5c3e-990b-890aeac9df5a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5568-5c3e-d7ce-a1da5bc93a5e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5568-5c3e-1ee3-81cce387593a	Zaposlitev-read	Zaposlitev - branje	f
00030000-5568-5c3e-d2d0-67dc7ba70a0c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5568-5c3e-d3f7-04c18935f225	Zasedenost-read	Zasedenost - branje	f
00030000-5568-5c3e-b620-2842e484e5db	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5568-5c3e-0c7a-e06a205a492e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5568-5c3e-4652-d140b64b67d8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5568-5c3e-11c6-c5acfeb817d3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5568-5c3e-baad-fb3e4a40638a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2698 (class 0 OID 5527347)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5568-5c3e-8045-2160c683d28c	00030000-5568-5c3e-f5be-de202b6c5248
00020000-5568-5c3e-5e81-0df637d49259	00030000-5568-5c3e-a47d-1835965a09eb
00020000-5568-5c3e-5e81-0df637d49259	00030000-5568-5c3e-f5be-de202b6c5248
\.


--
-- TOC entry 2726 (class 0 OID 5527637)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2730 (class 0 OID 5527668)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5527801)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 5527406)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5568-5c3f-0151-b9fe5c404943	00040000-5568-5c3e-bb67-6c06e6e211a6	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5568-5c3f-a0f2-7f1db22235ca	00040000-5568-5c3e-bb67-6c06e6e211a6	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2705 (class 0 OID 5527441)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5568-5c3d-3ae6-b882388fa603	8341	Adlešiči
00050000-5568-5c3d-ee9c-dea656a85b35	5270	Ajdovščina
00050000-5568-5c3d-8550-96bcbee93930	6280	Ankaran/Ancarano
00050000-5568-5c3d-cc08-183dfbbc972f	9253	Apače
00050000-5568-5c3d-0da9-6d661953ed16	8253	Artiče
00050000-5568-5c3d-71d1-8fc8b57198ed	4275	Begunje na Gorenjskem
00050000-5568-5c3d-dbce-1b7e322963e2	1382	Begunje pri Cerknici
00050000-5568-5c3d-31f4-832d54a60a9f	9231	Beltinci
00050000-5568-5c3d-ea77-b408907cd834	2234	Benedikt
00050000-5568-5c3d-4a63-63b15499c21a	2345	Bistrica ob Dravi
00050000-5568-5c3d-c4c4-0f5337ac103f	3256	Bistrica ob Sotli
00050000-5568-5c3d-bfc5-7b30341a8af9	8259	Bizeljsko
00050000-5568-5c3d-3ff8-1860494063d5	1223	Blagovica
00050000-5568-5c3d-e32d-32b9c72e91b9	8283	Blanca
00050000-5568-5c3d-3cc2-59628fad6cce	4260	Bled
00050000-5568-5c3d-8d42-462c97e1cd2b	4273	Blejska Dobrava
00050000-5568-5c3d-6719-ec34311bf042	9265	Bodonci
00050000-5568-5c3d-fcf9-1495a25058cb	9222	Bogojina
00050000-5568-5c3d-47b3-a2013f264076	4263	Bohinjska Bela
00050000-5568-5c3d-8a79-d4f2f8dbd013	4264	Bohinjska Bistrica
00050000-5568-5c3d-1583-a57d319e8e2a	4265	Bohinjsko jezero
00050000-5568-5c3d-7e49-4fd59e21db38	1353	Borovnica
00050000-5568-5c3d-94cf-e5142f789ec2	8294	Boštanj
00050000-5568-5c3d-ba51-4936f5703c7b	5230	Bovec
00050000-5568-5c3d-9eeb-247c7ba9f537	5295	Branik
00050000-5568-5c3d-e4ad-1c7f056399f7	3314	Braslovče
00050000-5568-5c3d-7051-6eeb88716955	5223	Breginj
00050000-5568-5c3d-72b1-83535f49c0f0	8280	Brestanica
00050000-5568-5c3d-eb9b-e1590dc5a3e6	2354	Bresternica
00050000-5568-5c3d-7c6c-2198ba617be8	4243	Brezje
00050000-5568-5c3d-b7be-703fdc3d4cd7	1351	Brezovica pri Ljubljani
00050000-5568-5c3d-cb2f-a699f9b3ac70	8250	Brežice
00050000-5568-5c3d-c92a-0a19ae66901d	4210	Brnik - Aerodrom
00050000-5568-5c3d-1c71-4b6f601da521	8321	Brusnice
00050000-5568-5c3d-ace6-6465289177ca	3255	Buče
00050000-5568-5c3d-bcfd-2be002c674e4	8276	Bučka 
00050000-5568-5c3d-eee9-6fb41ea300b7	9261	Cankova
00050000-5568-5c3d-cc80-438209c7f08c	3000	Celje 
00050000-5568-5c3d-956a-e43cdba737a5	3001	Celje - poštni predali
00050000-5568-5c3d-c07b-3ca016313603	4207	Cerklje na Gorenjskem
00050000-5568-5c3d-7676-6d973aeaa5b4	8263	Cerklje ob Krki
00050000-5568-5c3d-b956-d950c7697592	1380	Cerknica
00050000-5568-5c3d-d04d-cc130bb172cc	5282	Cerkno
00050000-5568-5c3d-d5f8-28f44e9d3f7c	2236	Cerkvenjak
00050000-5568-5c3d-f4b4-74c49b23db98	2215	Ceršak
00050000-5568-5c3d-452e-10d6a401e95d	2326	Cirkovce
00050000-5568-5c3d-2ee6-3afe53a884f7	2282	Cirkulane
00050000-5568-5c3d-3c62-ad8febb74896	5273	Col
00050000-5568-5c3d-f21a-526d28c5ffcf	8251	Čatež ob Savi
00050000-5568-5c3d-424e-271a423d7711	1413	Čemšenik
00050000-5568-5c3d-37c6-96808a1807c9	5253	Čepovan
00050000-5568-5c3d-bb0b-8131b9042218	9232	Črenšovci
00050000-5568-5c3d-b195-615412430fc1	2393	Črna na Koroškem
00050000-5568-5c3d-b843-195877258a75	6275	Črni Kal
00050000-5568-5c3d-6f94-663c8d28bd69	5274	Črni Vrh nad Idrijo
00050000-5568-5c3d-9430-31ad2611862f	5262	Črniče
00050000-5568-5c3d-5b83-15fd3536e029	8340	Črnomelj
00050000-5568-5c3d-77cb-fb6efa4ce16e	6271	Dekani
00050000-5568-5c3d-4fa3-6cefffbf018a	5210	Deskle
00050000-5568-5c3d-3abc-9452f6bf9154	2253	Destrnik
00050000-5568-5c3d-07c2-001efdb7801e	6215	Divača
00050000-5568-5c3d-bf05-f68978723893	1233	Dob
00050000-5568-5c3d-fd0b-540887a5e0b1	3224	Dobje pri Planini
00050000-5568-5c3d-834d-771fdc0e143f	8257	Dobova
00050000-5568-5c3d-2764-54fdb3d07ead	1423	Dobovec
00050000-5568-5c3d-fc86-ca2c01e35b4c	5263	Dobravlje
00050000-5568-5c3d-f2c6-3961f8cfa4f5	3204	Dobrna
00050000-5568-5c3d-348a-0b7141cb8625	8211	Dobrnič
00050000-5568-5c3d-d0a9-c8a3dba531d8	1356	Dobrova
00050000-5568-5c3d-14dc-e0b38fce1390	9223	Dobrovnik/Dobronak 
00050000-5568-5c3d-e730-01ae576fceaa	5212	Dobrovo v Brdih
00050000-5568-5c3d-fdcc-2ef0686e739a	1431	Dol pri Hrastniku
00050000-5568-5c3d-670e-fd65c33269c9	1262	Dol pri Ljubljani
00050000-5568-5c3d-f87f-24c2927cca70	1273	Dole pri Litiji
00050000-5568-5c3d-4fe2-99bd6c8c4fda	1331	Dolenja vas
00050000-5568-5c3d-165a-6f781ff7c268	8350	Dolenjske Toplice
00050000-5568-5c3d-5b39-903f965dda00	1230	Domžale
00050000-5568-5c3d-6f0a-89c6a0f0bf58	2252	Dornava
00050000-5568-5c3d-2e34-a6ca415b64da	5294	Dornberk
00050000-5568-5c3d-ac8a-160242fd0f16	1319	Draga
00050000-5568-5c3d-a31b-00adc11b8627	8343	Dragatuš
00050000-5568-5c3d-cf24-60631157dee5	3222	Dramlje
00050000-5568-5c3d-0363-d2756c86fa0d	2370	Dravograd
00050000-5568-5c3d-8c29-b4ef294e0045	4203	Duplje
00050000-5568-5c3d-61e9-bb6fcc428790	6221	Dutovlje
00050000-5568-5c3d-eb70-45410e2cca7e	8361	Dvor
00050000-5568-5c3d-65c6-eeec7a27ab99	2343	Fala
00050000-5568-5c3d-ebc0-10c7ecdfa133	9208	Fokovci
00050000-5568-5c3d-e6bc-0999ddd0e25e	2313	Fram
00050000-5568-5c3d-843f-2715449d1e88	3213	Frankolovo
00050000-5568-5c3d-a7a2-4e3229444a95	1274	Gabrovka
00050000-5568-5c3d-d002-4de9068147c1	8254	Globoko
00050000-5568-5c3d-ec8a-206e95f22142	5275	Godovič
00050000-5568-5c3d-8826-3b8ebce4f541	4204	Golnik
00050000-5568-5c3d-b5e9-67348faf86a9	3303	Gomilsko
00050000-5568-5c3d-c502-c177dca73db1	4224	Gorenja vas
00050000-5568-5c3d-325e-652c048ef36d	3263	Gorica pri Slivnici
00050000-5568-5c3d-98c0-b2684047ea5a	2272	Gorišnica
00050000-5568-5c3d-f388-211e04165e73	9250	Gornja Radgona
00050000-5568-5c3d-57d3-f86b808b9c6c	3342	Gornji Grad
00050000-5568-5c3d-0abd-9196c808e765	4282	Gozd Martuljek
00050000-5568-5c3d-a283-6d8e4580a422	6272	Gračišče
00050000-5568-5c3d-8a79-2809902716f9	9264	Grad
00050000-5568-5c3d-55ce-78e1c62bc618	8332	Gradac
00050000-5568-5c3d-114c-a6961c04bfa7	1384	Grahovo
00050000-5568-5c3d-f93c-f9997ff26945	5242	Grahovo ob Bači
00050000-5568-5c3d-3078-6275b773255b	5251	Grgar
00050000-5568-5c3d-09ac-618f7d854c28	3302	Griže
00050000-5568-5c3d-0980-307c99b8a605	3231	Grobelno
00050000-5568-5c3d-f965-08a58fe2913b	1290	Grosuplje
00050000-5568-5c3d-19d8-1c51757ce222	2288	Hajdina
00050000-5568-5c3d-6e02-d9d28e611f54	8362	Hinje
00050000-5568-5c3d-2fa4-0a573a53f1f0	2311	Hoče
00050000-5568-5c3d-bd84-35ab74f6a677	9205	Hodoš/Hodos
00050000-5568-5c3d-b1b2-561fb72b2b76	1354	Horjul
00050000-5568-5c3d-3d92-a5b4d7680aa3	1372	Hotedršica
00050000-5568-5c3d-17c4-a90c09f063c1	1430	Hrastnik
00050000-5568-5c3d-fafb-3527ec6ebabd	6225	Hruševje
00050000-5568-5c3d-a8be-aa0b8ca7886e	4276	Hrušica
00050000-5568-5c3d-6f29-f53cf4cbe4c6	5280	Idrija
00050000-5568-5c3d-02f6-5d4abc2fb0ca	1292	Ig
00050000-5568-5c3d-6962-09968eb77ee3	6250	Ilirska Bistrica
00050000-5568-5c3d-ef32-f053a1719563	6251	Ilirska Bistrica-Trnovo
00050000-5568-5c3d-a0e0-25dc2879d13a	1295	Ivančna Gorica
00050000-5568-5c3d-15b0-d08b10dfe0d1	2259	Ivanjkovci
00050000-5568-5c3d-3368-22bcb945606d	1411	Izlake
00050000-5568-5c3d-38df-6c9999bd073a	6310	Izola/Isola
00050000-5568-5c3d-31a5-82bf269d0cbb	2222	Jakobski Dol
00050000-5568-5c3d-6b3b-cbd9e90652d0	2221	Jarenina
00050000-5568-5c3d-bfab-74be94defe95	6254	Jelšane
00050000-5568-5c3d-c506-b4e311a5b85d	4270	Jesenice
00050000-5568-5c3d-a544-a4693d6a8366	8261	Jesenice na Dolenjskem
00050000-5568-5c3d-3384-ec5c496cd2b5	3273	Jurklošter
00050000-5568-5c3d-df3c-b7feaf65bffc	2223	Jurovski Dol
00050000-5568-5c3d-f44f-a3d67e763dd2	2256	Juršinci
00050000-5568-5c3d-3fc3-112bc82f3246	5214	Kal nad Kanalom
00050000-5568-5c3d-0f6d-cf3ddf73af6e	3233	Kalobje
00050000-5568-5c3d-231c-79b5ec6263b4	4246	Kamna Gorica
00050000-5568-5c3d-887c-4c9cc9fb8e02	2351	Kamnica
00050000-5568-5c3d-cbf3-36d2a874ba5d	1241	Kamnik
00050000-5568-5c3d-8f00-9e015f32c693	5213	Kanal
00050000-5568-5c3d-d2a9-90466db1594d	8258	Kapele
00050000-5568-5c3d-ee02-edf1f883679a	2362	Kapla
00050000-5568-5c3d-4ac1-cec13dcb9269	2325	Kidričevo
00050000-5568-5c3d-5459-8a98154ce12b	1412	Kisovec
00050000-5568-5c3d-faf8-9abeb292a970	6253	Knežak
00050000-5568-5c3d-8c96-260878f04347	5222	Kobarid
00050000-5568-5c3d-e955-3e2b0251b41e	9227	Kobilje
00050000-5568-5c3d-62d6-0d9f5b3fb02e	1330	Kočevje
00050000-5568-5c3d-96b9-f56711fe08d9	1338	Kočevska Reka
00050000-5568-5c3d-0c3e-94382ae6b221	2276	Kog
00050000-5568-5c3d-921f-ebb6e4ee3e1e	5211	Kojsko
00050000-5568-5c3d-fe4d-00d4903acfdb	6223	Komen
00050000-5568-5c3d-ced1-f1555d491c6f	1218	Komenda
00050000-5568-5c3d-f28f-da4ff0f0e580	6000	Koper/Capodistria 
00050000-5568-5c3d-e02c-46bf111783da	6001	Koper/Capodistria - poštni predali
00050000-5568-5c3d-0a4f-348de1367b1c	8282	Koprivnica
00050000-5568-5c3d-de75-93d16d92d1c1	5296	Kostanjevica na Krasu
00050000-5568-5c3d-9c81-5ec41ef3563b	8311	Kostanjevica na Krki
00050000-5568-5c3d-41af-5250a2708906	1336	Kostel
00050000-5568-5c3d-97a7-02ee2750837c	6256	Košana
00050000-5568-5c3d-6e20-439d91a40991	2394	Kotlje
00050000-5568-5c3d-1d4d-0e239438af08	6240	Kozina
00050000-5568-5c3d-65a4-063e93b5d738	3260	Kozje
00050000-5568-5c3d-b9df-12cfd7b9a18d	4000	Kranj 
00050000-5568-5c3d-ac40-f1ece0d9e53e	4001	Kranj - poštni predali
00050000-5568-5c3d-60c7-46e626a608ee	4280	Kranjska Gora
00050000-5568-5c3d-cadc-ec88d2ecd633	1281	Kresnice
00050000-5568-5c3d-3771-cde9a4c5e88f	4294	Križe
00050000-5568-5c3d-e91b-383726692813	9206	Križevci
00050000-5568-5c3d-d0d8-9039eb317fab	9242	Križevci pri Ljutomeru
00050000-5568-5c3d-6bfa-532535479cda	1301	Krka
00050000-5568-5c3d-abff-b6d8d8889dd7	8296	Krmelj
00050000-5568-5c3d-1de5-1074041150d6	4245	Kropa
00050000-5568-5c3d-60a4-b7064f8ec682	8262	Krška vas
00050000-5568-5c3d-77d0-d7ebc5b5ff1e	8270	Krško
00050000-5568-5c3d-0cc0-0ffe4ce15a27	9263	Kuzma
00050000-5568-5c3d-2f67-e07d4608aa74	2318	Laporje
00050000-5568-5c3d-bc58-6a353caee0a2	3270	Laško
00050000-5568-5c3d-d4ec-bbd90ff568e7	1219	Laze v Tuhinju
00050000-5568-5c3d-4555-1801b181c863	2230	Lenart v Slovenskih goricah
00050000-5568-5c3d-4fc8-bd9d96245445	9220	Lendava/Lendva
00050000-5568-5c3d-375c-ae7765030b67	4248	Lesce
00050000-5568-5c3d-e761-e36e8af2899d	3261	Lesično
00050000-5568-5c3d-5286-58dfcc8a22ac	8273	Leskovec pri Krškem
00050000-5568-5c3d-9322-2d1169068c30	2372	Libeliče
00050000-5568-5c3d-70ec-30e5a8c64058	2341	Limbuš
00050000-5568-5c3d-f625-6b85795c6566	1270	Litija
00050000-5568-5c3d-5ba5-b69d6a7d5d51	3202	Ljubečna
00050000-5568-5c3d-cff2-87984a56edbe	1000	Ljubljana 
00050000-5568-5c3d-0bc5-0a27fe9543f6	1001	Ljubljana - poštni predali
00050000-5568-5c3d-a23a-0781b9b99c6e	1231	Ljubljana - Črnuče
00050000-5568-5c3d-e656-d09076fb090f	1261	Ljubljana - Dobrunje
00050000-5568-5c3d-85b6-7567b13279b4	1260	Ljubljana - Polje
00050000-5568-5c3d-b3a3-de945018461a	1210	Ljubljana - Šentvid
00050000-5568-5c3d-e69c-94aa00bf0f20	1211	Ljubljana - Šmartno
00050000-5568-5c3d-cd76-cd76203ab0ac	3333	Ljubno ob Savinji
00050000-5568-5c3d-dea4-77be95f1a046	9240	Ljutomer
00050000-5568-5c3d-357a-bc4748dedf97	3215	Loče
00050000-5568-5c3d-88ed-985c5cd501cb	5231	Log pod Mangartom
00050000-5568-5c3d-6661-9defc4ad6990	1358	Log pri Brezovici
00050000-5568-5c3d-58bc-d0e199c74b08	1370	Logatec
00050000-5568-5c3d-3545-95c3d705f0e1	1371	Logatec
00050000-5568-5c3d-dfd9-541c99b92775	1434	Loka pri Zidanem Mostu
00050000-5568-5c3d-dc8b-4c4326f9c75c	3223	Loka pri Žusmu
00050000-5568-5c3d-70bb-266af4e6d7b6	6219	Lokev
00050000-5568-5c3d-5e0f-5c69a8039a52	1318	Loški Potok
00050000-5568-5c3d-c801-93661794a840	2324	Lovrenc na Dravskem polju
00050000-5568-5c3d-90c9-ee08b7ed59ec	2344	Lovrenc na Pohorju
00050000-5568-5c3d-4be3-90ba13728abc	3334	Luče
00050000-5568-5c3d-814b-13ca7a53eb46	1225	Lukovica
00050000-5568-5c3d-746b-35c0607c1957	9202	Mačkovci
00050000-5568-5c3d-c09e-35a1bef66446	2322	Majšperk
00050000-5568-5c3d-0e56-15c825ad8ad0	2321	Makole
00050000-5568-5c3d-baca-de37f43c1c9b	9243	Mala Nedelja
00050000-5568-5c3d-b06c-8dcb06aae90d	2229	Malečnik
00050000-5568-5c3e-5e75-2c86311cbd4f	6273	Marezige
00050000-5568-5c3e-7621-7b71efbfc9a0	2000	Maribor 
00050000-5568-5c3e-88c9-056862c1215d	2001	Maribor - poštni predali
00050000-5568-5c3e-20ce-f339b8805005	2206	Marjeta na Dravskem polju
00050000-5568-5c3e-517d-4ab68ba8f4c5	2281	Markovci
00050000-5568-5c3e-aad3-9a4001217d75	9221	Martjanci
00050000-5568-5c3e-7020-56413aa3b1b6	6242	Materija
00050000-5568-5c3e-a17c-dd9c1c28d286	4211	Mavčiče
00050000-5568-5c3e-62a1-ca040d56a659	1215	Medvode
00050000-5568-5c3e-d6e0-90d4a6c0aec8	1234	Mengeš
00050000-5568-5c3e-9947-21b0d56fde42	8330	Metlika
00050000-5568-5c3e-62df-16b9e9c26e72	2392	Mežica
00050000-5568-5c3e-eec0-11b4953310ac	2204	Miklavž na Dravskem polju
00050000-5568-5c3e-16d9-84aba2d9240d	2275	Miklavž pri Ormožu
00050000-5568-5c3e-dc56-737d6814ba20	5291	Miren
00050000-5568-5c3e-39e9-d65bc324000c	8233	Mirna
00050000-5568-5c3e-57d0-687dc99189f6	8216	Mirna Peč
00050000-5568-5c3e-a6b1-feae68e56b9a	2382	Mislinja
00050000-5568-5c3e-cea8-e2dba4819d3e	4281	Mojstrana
00050000-5568-5c3e-c7bf-dfce08de0b47	8230	Mokronog
00050000-5568-5c3e-c11b-f0d8c811aa8d	1251	Moravče
00050000-5568-5c3e-94ff-f32481e9c9cb	9226	Moravske Toplice
00050000-5568-5c3e-16a0-e01cf4aae9de	5216	Most na Soči
00050000-5568-5c3e-ca38-5bfb5ba38129	1221	Motnik
00050000-5568-5c3e-a0e8-0512034abbdc	3330	Mozirje
00050000-5568-5c3e-c81b-971edff9fc16	9000	Murska Sobota 
00050000-5568-5c3e-3f4e-aa4a66518f31	9001	Murska Sobota - poštni predali
00050000-5568-5c3e-a6f9-f147e41e12c8	2366	Muta
00050000-5568-5c3e-a410-18e8b00163c3	4202	Naklo
00050000-5568-5c3e-1021-b61124c980f8	3331	Nazarje
00050000-5568-5c3e-528b-feaeb980529a	1357	Notranje Gorice
00050000-5568-5c3e-6659-283a8cba0545	3203	Nova Cerkev
00050000-5568-5c3e-059a-81e7da5cc2cd	5000	Nova Gorica 
00050000-5568-5c3e-fa54-c315b0620d2a	5001	Nova Gorica - poštni predali
00050000-5568-5c3e-705f-7690d2ca3f78	1385	Nova vas
00050000-5568-5c3e-cf97-73b7f9af5184	8000	Novo mesto
00050000-5568-5c3e-72f3-d56e4cc7b510	8001	Novo mesto - poštni predali
00050000-5568-5c3e-1eeb-d6878d7fa4d5	6243	Obrov
00050000-5568-5c3e-7eca-d92174ef181e	9233	Odranci
00050000-5568-5c3e-b914-ad11063c6061	2317	Oplotnica
00050000-5568-5c3e-dd94-1ae5703b9b9a	2312	Orehova vas
00050000-5568-5c3e-e45c-62af495cd07a	2270	Ormož
00050000-5568-5c3e-0a1b-a746be63c64a	1316	Ortnek
00050000-5568-5c3e-2aa7-8bbd16e851d1	1337	Osilnica
00050000-5568-5c3e-f65a-a2baca7819bc	8222	Otočec
00050000-5568-5c3e-bd38-99f264a241e3	2361	Ožbalt
00050000-5568-5c3e-75ea-34e21f3d4cce	2231	Pernica
00050000-5568-5c3e-36e6-01523e7f1ae1	2211	Pesnica pri Mariboru
00050000-5568-5c3e-ad5b-d23732b88b78	9203	Petrovci
00050000-5568-5c3e-b115-73c5e9831ec3	3301	Petrovče
00050000-5568-5c3e-0471-e888838bf78d	6330	Piran/Pirano
00050000-5568-5c3e-28d4-34ef56b30086	8255	Pišece
00050000-5568-5c3e-e5df-a1bb426371e0	6257	Pivka
00050000-5568-5c3e-f126-1b3822bcc2c9	6232	Planina
00050000-5568-5c3e-03ab-7357bdb33146	3225	Planina pri Sevnici
00050000-5568-5c3e-2cf1-4f69cb132f6b	6276	Pobegi
00050000-5568-5c3e-cec8-f77d1a5fb418	8312	Podbočje
00050000-5568-5c3e-eb6a-40a71316ef0d	5243	Podbrdo
00050000-5568-5c3e-a307-a2186bfca34b	3254	Podčetrtek
00050000-5568-5c3e-4227-3181a4ea3c3a	2273	Podgorci
00050000-5568-5c3e-7e00-89539e988d6a	6216	Podgorje
00050000-5568-5c3e-44b4-9245050c6dd0	2381	Podgorje pri Slovenj Gradcu
00050000-5568-5c3e-6930-c0e2bf515b46	6244	Podgrad
00050000-5568-5c3e-f56e-9208daa07f43	1414	Podkum
00050000-5568-5c3e-9a64-e003316daf38	2286	Podlehnik
00050000-5568-5c3e-9847-9575ec964594	5272	Podnanos
00050000-5568-5c3e-8096-f985b79b634f	4244	Podnart
00050000-5568-5c3e-1de5-db2246d06434	3241	Podplat
00050000-5568-5c3e-78e9-c74dd779a4e5	3257	Podsreda
00050000-5568-5c3e-08ce-9fc48099e299	2363	Podvelka
00050000-5568-5c3e-7b24-86d9e4506fd4	2208	Pohorje
00050000-5568-5c3e-3e62-704de151c210	2257	Polenšak
00050000-5568-5c3e-ad05-6ad8e3f2646e	1355	Polhov Gradec
00050000-5568-5c3e-f821-9d9e1fd7a071	4223	Poljane nad Škofjo Loko
00050000-5568-5c3e-2420-37dbbd8f76f9	2319	Poljčane
00050000-5568-5c3e-0354-1a2ca2e55c28	1272	Polšnik
00050000-5568-5c3e-aca6-47f8abb4b3e1	3313	Polzela
00050000-5568-5c3e-aad4-a110eb93509a	3232	Ponikva
00050000-5568-5c3e-dbce-02794a082bb9	6320	Portorož/Portorose
00050000-5568-5c3e-ee16-ea94ef2dcfd1	6230	Postojna
00050000-5568-5c3e-78ee-69d1163296ef	2331	Pragersko
00050000-5568-5c3e-cddb-5ef114033309	3312	Prebold
00050000-5568-5c3e-347e-b98eb6a25978	4205	Preddvor
00050000-5568-5c3e-a430-f5ecfa672474	6255	Prem
00050000-5568-5c3e-c87f-5361da9d0e32	1352	Preserje
00050000-5568-5c3e-d51f-1c1dfd1727b0	6258	Prestranek
00050000-5568-5c3e-097e-34875d827f93	2391	Prevalje
00050000-5568-5c3e-4b24-463a918cce97	3262	Prevorje
00050000-5568-5c3e-b7ea-bd0a249cffb9	1276	Primskovo 
00050000-5568-5c3e-a64b-09f0cd45c379	3253	Pristava pri Mestinju
00050000-5568-5c3e-3c66-81a5a5902ce8	9207	Prosenjakovci/Partosfalva
00050000-5568-5c3e-c8ae-776d15d11342	5297	Prvačina
00050000-5568-5c3e-79c1-de4d451c1439	2250	Ptuj
00050000-5568-5c3e-8647-44705b030df3	2323	Ptujska Gora
00050000-5568-5c3e-f712-05a1e5a8f7b9	9201	Puconci
00050000-5568-5c3e-5705-6550b995f74c	2327	Rače
00050000-5568-5c3e-e8e0-329c7a95c18f	1433	Radeče
00050000-5568-5c3e-3818-8858c501bea9	9252	Radenci
00050000-5568-5c3e-a1b2-b5ba9c99826a	2360	Radlje ob Dravi
00050000-5568-5c3e-9d55-ef0ee3070f8a	1235	Radomlje
00050000-5568-5c3e-0620-b13e59aa2fe7	4240	Radovljica
00050000-5568-5c3e-ea04-7c8ba6bfd2b4	8274	Raka
00050000-5568-5c3e-49bb-5efcd241a3cc	1381	Rakek
00050000-5568-5c3e-040c-619a770016ec	4283	Rateče - Planica
00050000-5568-5c3e-0738-b02beb650a85	2390	Ravne na Koroškem
00050000-5568-5c3e-6c8a-68e0fd1b0d48	9246	Razkrižje
00050000-5568-5c3e-c091-d73b17230589	3332	Rečica ob Savinji
00050000-5568-5c3e-5666-60836fca2529	5292	Renče
00050000-5568-5c3e-00a8-85c4fbe7ff66	1310	Ribnica
00050000-5568-5c3e-d115-285bfc7e57ac	2364	Ribnica na Pohorju
00050000-5568-5c3e-87ce-f354b54adc13	3272	Rimske Toplice
00050000-5568-5c3e-0fdc-6643eebe4fc7	1314	Rob
00050000-5568-5c3e-cbfc-d2f3288c903f	5215	Ročinj
00050000-5568-5c3e-27b4-d0158c782a70	3250	Rogaška Slatina
00050000-5568-5c3e-52c8-ad802e32d2ad	9262	Rogašovci
00050000-5568-5c3e-398a-efedf05f2aa3	3252	Rogatec
00050000-5568-5c3e-a052-8c20c4130da6	1373	Rovte
00050000-5568-5c3e-01b0-41ce686dce6e	2342	Ruše
00050000-5568-5c3e-f5c0-2eb16a68cd42	1282	Sava
00050000-5568-5c3e-00d6-b25ef5695822	6333	Sečovlje/Sicciole
00050000-5568-5c3e-71e3-6c92578db36b	4227	Selca
00050000-5568-5c3e-b7f8-e93acd4e60ae	2352	Selnica ob Dravi
00050000-5568-5c3e-63ee-718ee2f490b8	8333	Semič
00050000-5568-5c3e-a879-eac3e40eeab1	8281	Senovo
00050000-5568-5c3e-c405-d66781a1e386	6224	Senožeče
00050000-5568-5c3e-e0ac-829f4a5a34a6	8290	Sevnica
00050000-5568-5c3e-2dc5-0bde6c8de9ac	6210	Sežana
00050000-5568-5c3e-628b-2f45093d296d	2214	Sladki Vrh
00050000-5568-5c3e-7650-e961bb27deaf	5283	Slap ob Idrijci
00050000-5568-5c3e-892f-b9aaf858c310	2380	Slovenj Gradec
00050000-5568-5c3e-3b27-7d642cded7cd	2310	Slovenska Bistrica
00050000-5568-5c3e-a5b1-dcc7c7e294e9	3210	Slovenske Konjice
00050000-5568-5c3e-2646-e6661aa83f48	1216	Smlednik
00050000-5568-5c3e-f3a4-d5c2c5563f7c	5232	Soča
00050000-5568-5c3e-4bdf-b0eeb6703820	1317	Sodražica
00050000-5568-5c3e-0084-31aa1bc82e5f	3335	Solčava
00050000-5568-5c3e-553c-15fcabc22850	5250	Solkan
00050000-5568-5c3e-cecc-0a68740faf2f	4229	Sorica
00050000-5568-5c3e-5e1a-4a8d952b1e93	4225	Sovodenj
00050000-5568-5c3e-162f-b3b4a2ccd9fa	5281	Spodnja Idrija
00050000-5568-5c3e-e393-9f725e633a7c	2241	Spodnji Duplek
00050000-5568-5c3e-e8f4-dea01f9ea725	9245	Spodnji Ivanjci
00050000-5568-5c3e-3b3d-ddb6f0552cbf	2277	Središče ob Dravi
00050000-5568-5c3e-131a-d966e5bd8b8c	4267	Srednja vas v Bohinju
00050000-5568-5c3e-999d-d3ad55d203d8	8256	Sromlje 
00050000-5568-5c3e-a4c1-9612072f2873	5224	Srpenica
00050000-5568-5c3e-120d-c4a526b45bab	1242	Stahovica
00050000-5568-5c3e-ce8b-895873e4f58e	1332	Stara Cerkev
00050000-5568-5c3e-5df6-3af9bd40b7b1	8342	Stari trg ob Kolpi
00050000-5568-5c3e-90ec-15e8f2ed0ae9	1386	Stari trg pri Ložu
00050000-5568-5c3e-965f-2e59892dbee4	2205	Starše
00050000-5568-5c3e-0c42-f3fc525de9ab	2289	Stoperce
00050000-5568-5c3e-aa0c-323cb3967a8b	8322	Stopiče
00050000-5568-5c3e-f8b4-e946efb6de34	3206	Stranice
00050000-5568-5c3e-8729-c1857f7ec18b	8351	Straža
00050000-5568-5c3e-0d66-b0f50bdd391b	1313	Struge
00050000-5568-5c3e-0005-e7640369ce6f	8293	Studenec
00050000-5568-5c3e-dc0a-1bbe7cbafb03	8331	Suhor
00050000-5568-5c3e-9cb0-c9a03c78fc49	2233	Sv. Ana v Slovenskih goricah
00050000-5568-5c3e-426a-1f568454e68f	2235	Sv. Trojica v Slovenskih goricah
00050000-5568-5c3e-f11c-bafce1fc4f47	2353	Sveti Duh na Ostrem Vrhu
00050000-5568-5c3e-3060-9a2f2a0da5c6	9244	Sveti Jurij ob Ščavnici
00050000-5568-5c3e-b9be-3b27776c0783	3264	Sveti Štefan
00050000-5568-5c3e-e4d4-eceab3561ae7	2258	Sveti Tomaž
00050000-5568-5c3e-e1ee-8d2b14ec8092	9204	Šalovci
00050000-5568-5c3e-e8a8-432434683072	5261	Šempas
00050000-5568-5c3e-92ee-3243517dcd23	5290	Šempeter pri Gorici
00050000-5568-5c3e-1bba-31def9cbf9f4	3311	Šempeter v Savinjski dolini
00050000-5568-5c3e-35ac-d86cd98f6a36	4208	Šenčur
00050000-5568-5c3e-c0c2-a271d13722b8	2212	Šentilj v Slovenskih goricah
00050000-5568-5c3e-c1f2-20faa8675f8d	8297	Šentjanž
00050000-5568-5c3e-911e-d1bf53e19b66	2373	Šentjanž pri Dravogradu
00050000-5568-5c3e-2d77-4602855db007	8310	Šentjernej
00050000-5568-5c3e-a9a3-3ccfae5a7a89	3230	Šentjur
00050000-5568-5c3e-27ae-fcb58d357f7f	3271	Šentrupert
00050000-5568-5c3e-ae92-f5a39a0757c6	8232	Šentrupert
00050000-5568-5c3e-5b79-5bcdfab25117	1296	Šentvid pri Stični
00050000-5568-5c3e-e710-007406d3c56e	8275	Škocjan
00050000-5568-5c3e-1e4c-2dc076f29082	6281	Škofije
00050000-5568-5c3e-2fed-f63ee1c127e2	4220	Škofja Loka
00050000-5568-5c3e-f822-2dfeb1acfdeb	3211	Škofja vas
00050000-5568-5c3e-5559-3e6200006217	1291	Škofljica
00050000-5568-5c3e-8a71-2dcfc1e3d844	6274	Šmarje
00050000-5568-5c3e-3c72-f951eedd74d1	1293	Šmarje - Sap
00050000-5568-5c3e-c8a3-39a5af662210	3240	Šmarje pri Jelšah
00050000-5568-5c3e-7a63-6c83f06187a7	8220	Šmarješke Toplice
00050000-5568-5c3e-118e-7ddb155580ca	2315	Šmartno na Pohorju
00050000-5568-5c3e-f18c-261b49cf320c	3341	Šmartno ob Dreti
00050000-5568-5c3e-1dca-4a3b973b7af9	3327	Šmartno ob Paki
00050000-5568-5c3e-e8e3-64861767ec17	1275	Šmartno pri Litiji
00050000-5568-5c3e-ddf1-c2c5b9f4e596	2383	Šmartno pri Slovenj Gradcu
00050000-5568-5c3e-df5d-4eb4487d9668	3201	Šmartno v Rožni dolini
00050000-5568-5c3e-3c64-cba7fd96ecc8	3325	Šoštanj
00050000-5568-5c3e-4e47-92914b5f0f0c	6222	Štanjel
00050000-5568-5c3e-9530-5fb47b197f2a	3220	Štore
00050000-5568-5c3e-146a-93c4bac9ff66	3304	Tabor
00050000-5568-5c3e-030b-d092604083da	3221	Teharje
00050000-5568-5c3e-551d-e442c0c380de	9251	Tišina
00050000-5568-5c3e-f6cf-7c5c6aad5905	5220	Tolmin
00050000-5568-5c3e-2b9f-cde1b8393498	3326	Topolšica
00050000-5568-5c3e-a868-ebaa418bf322	2371	Trbonje
00050000-5568-5c3e-5a2b-5de072d48781	1420	Trbovlje
00050000-5568-5c3e-6efb-811ecbfee967	8231	Trebelno 
00050000-5568-5c3e-f6cf-fc2ba214ebcb	8210	Trebnje
00050000-5568-5c3e-a63a-bddc88ba04a6	5252	Trnovo pri Gorici
00050000-5568-5c3e-b2be-2f5db6b26ba2	2254	Trnovska vas
00050000-5568-5c3e-af59-bbd3c4da5d07	1222	Trojane
00050000-5568-5c3e-d92f-f3ca110d5041	1236	Trzin
00050000-5568-5c3e-3653-5063ffccc8d7	4290	Tržič
00050000-5568-5c3e-cba6-0a6279da56d7	8295	Tržišče
00050000-5568-5c3e-3275-8b2e4a6b3c0f	1311	Turjak
00050000-5568-5c3e-c20f-703b1f00f023	9224	Turnišče
00050000-5568-5c3e-c30b-5caa8d035d7d	8323	Uršna sela
00050000-5568-5c3e-f154-8462e01b3d15	1252	Vače
00050000-5568-5c3e-7bed-31d8306407a3	3320	Velenje 
00050000-5568-5c3e-b480-c6eb0811285f	3322	Velenje - poštni predali
00050000-5568-5c3e-8c0e-9d296ba0d17c	8212	Velika Loka
00050000-5568-5c3e-f549-a7b56a10680e	2274	Velika Nedelja
00050000-5568-5c3e-e144-c07a970227e4	9225	Velika Polana
00050000-5568-5c3e-dcca-21982e2cc803	1315	Velike Lašče
00050000-5568-5c3e-0e51-5554fbe69b6c	8213	Veliki Gaber
00050000-5568-5c3e-1d7f-81fed82623fd	9241	Veržej
00050000-5568-5c3e-e1fa-3fe7cd7a062f	1312	Videm - Dobrepolje
00050000-5568-5c3e-9da0-5f360cc7dc8d	2284	Videm pri Ptuju
00050000-5568-5c3e-bac5-466f5cc59aca	8344	Vinica
00050000-5568-5c3e-b3c5-a7a0a0299a9a	5271	Vipava
00050000-5568-5c3e-84f5-c6c026c55bf9	4212	Visoko
00050000-5568-5c3e-7a66-42ea2a4e4e12	1294	Višnja Gora
00050000-5568-5c3e-34ef-c9b21e4d1201	3205	Vitanje
00050000-5568-5c3e-5062-36874c5a3fd2	2255	Vitomarci
00050000-5568-5c3e-8836-118e2810e741	1217	Vodice
00050000-5568-5c3e-561f-1208f06b64cf	3212	Vojnik\t
00050000-5568-5c3e-44bb-aff811aec5a2	5293	Volčja Draga
00050000-5568-5c3e-9c2c-6df0c1a3c831	2232	Voličina
00050000-5568-5c3e-b66f-883331f3629a	3305	Vransko
00050000-5568-5c3e-b0c8-894854643b5e	6217	Vremski Britof
00050000-5568-5c3e-7b29-094eee390e83	1360	Vrhnika
00050000-5568-5c3e-4fa2-a4823193a3b3	2365	Vuhred
00050000-5568-5c3e-c8ed-5e4d8b33013e	2367	Vuzenica
00050000-5568-5c3e-09ce-3a350413c242	8292	Zabukovje 
00050000-5568-5c3e-c73a-232b81b789aa	1410	Zagorje ob Savi
00050000-5568-5c3e-2a2d-783f55164286	1303	Zagradec
00050000-5568-5c3e-4028-3478bddbdfbc	2283	Zavrč
00050000-5568-5c3e-ce5b-840cb20d61b0	8272	Zdole 
00050000-5568-5c3e-9fb8-4a28d7581abc	4201	Zgornja Besnica
00050000-5568-5c3e-eb97-6d77ed371a90	2242	Zgornja Korena
00050000-5568-5c3e-e9f4-e1479bde92ba	2201	Zgornja Kungota
00050000-5568-5c3e-0429-6f09ee0af344	2316	Zgornja Ložnica
00050000-5568-5c3e-53d8-dac1f50c5da7	2314	Zgornja Polskava
00050000-5568-5c3e-a846-8a115a148710	2213	Zgornja Velka
00050000-5568-5c3e-46c8-d65df3adbd40	4247	Zgornje Gorje
00050000-5568-5c3e-5323-66b1cbb7ca57	4206	Zgornje Jezersko
00050000-5568-5c3e-537e-c6f8f3e06493	2285	Zgornji Leskovec
00050000-5568-5c3e-437e-b54c8dc235ae	1432	Zidani Most
00050000-5568-5c3e-eec8-ecb76b5f2867	3214	Zreče
00050000-5568-5c3e-3ec1-6c949104d7c9	4209	Žabnica
00050000-5568-5c3e-8cb2-adb47f7ad90c	3310	Žalec
00050000-5568-5c3e-3133-992d524418d7	4228	Železniki
00050000-5568-5c3e-2676-670b9c0871b5	2287	Žetale
00050000-5568-5c3e-d480-fdbc83f993a4	4226	Žiri
00050000-5568-5c3e-79c4-cdd1dcbf6bed	4274	Žirovnica
00050000-5568-5c3e-6cc6-4191e230ea58	8360	Žužemberk
\.


--
-- TOC entry 2722 (class 0 OID 5527611)
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
-- TOC entry 2704 (class 0 OID 5527426)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5527504)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5527623)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5527743)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5527794)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5527652)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5568-5c3f-6af1-4ac2ed7f9466	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5568-5c3f-646b-657907b85cb2	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5568-5c3f-88f3-45d0485dd176	0003	Kazinska	t	84	Kazinska dvorana
00220000-5568-5c3f-24f0-73bf9001c690	0004	Mali oder	t	24	Mali oder 
00220000-5568-5c3f-0d3b-f854e04c29bc	0005	Komorni oder	t	15	Komorni oder
00220000-5568-5c3f-55eb-2d84a060a0fc	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5568-5c3f-3622-8337da43133c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2720 (class 0 OID 5527596)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5527586)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5527783)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5527720)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5527299)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5568-5c3e-9dcf-35861086fc42	00010000-5568-5c3e-eb5d-ee593a7002e1	2015-05-29 14:32:00	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROMm.6IqQ39fepdTtxsqYpaZjr6MFlKpq";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2729 (class 0 OID 5527662)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5527337)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5568-5c3e-1189-4fb62f1d0b86	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5568-5c3e-c6b9-ee4fcf3ac3d0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5568-5c3e-8045-2160c683d28c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5568-5c3e-ac65-c7534ee100f8	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5568-5c3e-d038-b6cea4513065	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5568-5c3e-5e81-0df637d49259	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2695 (class 0 OID 5527321)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5568-5c3e-9dcf-35861086fc42	00020000-5568-5c3e-ac65-c7534ee100f8
00010000-5568-5c3e-eb5d-ee593a7002e1	00020000-5568-5c3e-ac65-c7534ee100f8
\.


--
-- TOC entry 2731 (class 0 OID 5527676)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5527617)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5527567)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2749 (class 0 OID 5527891)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5568-5c3e-e85d-5792b2a68510	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5568-5c3e-8dec-364445f97a8f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5568-5c3e-4d90-a7dde3f41b19	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5568-5c3e-bc9d-4fcca1cccc83	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5568-5c3e-012a-0ea90f22139c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2748 (class 0 OID 5527884)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5568-5c3e-4c3b-8476bdc1ae4f	00000000-5568-5c3e-bc9d-4fcca1cccc83	popa
00000000-5568-5c3e-a02c-19f30580ce1c	00000000-5568-5c3e-bc9d-4fcca1cccc83	oseba
00000000-5568-5c3e-f5c5-98a26972aecf	00000000-5568-5c3e-8dec-364445f97a8f	prostor
00000000-5568-5c3e-14d2-397dfee9b357	00000000-5568-5c3e-bc9d-4fcca1cccc83	besedilo
00000000-5568-5c3e-6eb2-355f2933178a	00000000-5568-5c3e-bc9d-4fcca1cccc83	uprizoritev
00000000-5568-5c3e-ff18-eb7b609a164d	00000000-5568-5c3e-bc9d-4fcca1cccc83	funkcija
00000000-5568-5c3e-5973-e6657bc28f7c	00000000-5568-5c3e-bc9d-4fcca1cccc83	tipfunkcije
00000000-5568-5c3e-af11-518ae986cb57	00000000-5568-5c3e-bc9d-4fcca1cccc83	alternacija
\.


--
-- TOC entry 2747 (class 0 OID 5527879)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5527730)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5527398)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5527573)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5568-5c3f-59da-1b0e5448d9b0	00180000-5568-5c3f-7aa6-d6187f23d931	000c0000-5568-5c3f-fc0e-e8c6f6669ebf	00090000-5568-5c3f-8585-804739bfc0a8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5568-5c3f-e6b4-799fe7bc3491	00180000-5568-5c3f-7aa6-d6187f23d931	000c0000-5568-5c3f-315d-4fe85839855a	00090000-5568-5c3f-1096-3c9577523254	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5568-5c3f-a80a-1e7d46160350	00180000-5568-5c3f-7aa6-d6187f23d931	000c0000-5568-5c3f-8ed4-f854b7281505	00090000-5568-5c3f-ddd3-6f32aeb81e85	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5568-5c3f-9687-889cc97392b1	00180000-5568-5c3f-7aa6-d6187f23d931	000c0000-5568-5c3f-acc0-72e7e68f3403	00090000-5568-5c3f-5cd8-f7bc2de7b993	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5568-5c3f-2338-83d0d5fbb275	00180000-5568-5c3f-7aa6-d6187f23d931	000c0000-5568-5c3f-de23-b86db868e875	00090000-5568-5c3f-858b-1f43df35e2f1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
\.


--
-- TOC entry 2739 (class 0 OID 5527772)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5568-5c3e-5e3d-5bdca0ca3e7b	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5568-5c3e-7099-96157b546fea	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5568-5c3e-fd04-54232fe758f3	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5568-5c3e-151e-c4d42bcd1665	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5568-5c3e-7fa8-a65c82e55552	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5568-5c3e-8e5e-d77b7b55e0aa	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5568-5c3e-2824-f36d92a886cc	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5568-5c3e-f2af-b38254986a91	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5568-5c3e-2ef9-4e9fa359862e	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5568-5c3e-930a-c52a24527d34	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5568-5c3e-cbfd-753cc86ffea3	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5568-5c3e-0540-14238d57e445	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5568-5c3e-ec9d-bf930341ad0b	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5568-5c3e-0929-40fba1564a15	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5568-5c3e-b559-f408be75a9c1	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5568-5c3e-d76e-12787ba4d735	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2707 (class 0 OID 5527461)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5527308)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5568-5c3e-eb5d-ee593a7002e1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROAE.2xaCHE8d6NFP6Vot9PCRVsCGVfqu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5568-5c3f-1109-ac9545a6f821	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5568-5c3f-d4e1-e2ade69fa45e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5568-5c3f-97e1-fbc9efe8cce5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5568-5c3e-9dcf-35861086fc42	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 5527827)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5568-5c3f-fc58-01e2afe9ca94	00160000-5568-5c3f-6168-733c19252b45	00150000-5568-5c3e-96e2-65a91a83dd62	00140000-5568-5c3e-0c30-a517f0446e82	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5568-5c3f-0d3b-f854e04c29bc
000e0000-5568-5c3f-1173-b0c53a2669af	00160000-5568-5c3f-bac6-dc69fed87ecd	00150000-5568-5c3e-d3eb-d23d382f9097	00140000-5568-5c3e-56fd-5288af3d3d3e	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5568-5c3f-55eb-2d84a060a0fc
\.


--
-- TOC entry 2712 (class 0 OID 5527519)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5568-5c3f-6271-7da86b3e6d6d	000e0000-5568-5c3f-1173-b0c53a2669af	1	
00200000-5568-5c3f-429e-65162a190148	000e0000-5568-5c3f-1173-b0c53a2669af	2	
\.


--
-- TOC entry 2727 (class 0 OID 5527644)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5527712)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5527551)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5527817)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5568-5c3e-0c30-a517f0446e82	Drama	drama (SURS 01)
00140000-5568-5c3e-5115-54f25bbdd749	Opera	opera (SURS 02)
00140000-5568-5c3e-b5a6-7e7ee09db19f	Balet	balet (SURS 03)
00140000-5568-5c3e-49a7-4db3d1c3e7a2	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5568-5c3e-5d61-86d89909d37c	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5568-5c3e-56fd-5288af3d3d3e	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5568-5c3e-22cc-69a6090917d4	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2733 (class 0 OID 5527702)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5568-5c3e-5c51-ce8f47ee7e41	Opera	opera
00150000-5568-5c3e-334f-02b410e91b51	Opereta	opereta
00150000-5568-5c3e-e7e7-c932214d026c	Balet	balet
00150000-5568-5c3e-fa54-be19c738321a	Plesne prireditve	plesne prireditve
00150000-5568-5c3e-cb52-8082a57761f3	Lutkovno gledališče	lutkovno gledališče
00150000-5568-5c3e-6252-dc1af9c4cc60	Raziskovalno gledališče	raziskovalno gledališče
00150000-5568-5c3e-30e2-758737f67eac	Biografska drama	biografska drama
00150000-5568-5c3e-96e2-65a91a83dd62	Komedija	komedija
00150000-5568-5c3e-3489-1ca7e5e75954	Črna komedija	črna komedija
00150000-5568-5c3e-250a-aafb32a79310	E-igra	E-igra
00150000-5568-5c3e-d3eb-d23d382f9097	Kriminalka	kriminalka
00150000-5568-5c3e-d968-e5704d99e988	Musical	musical
\.


--
-- TOC entry 2314 (class 2606 OID 5527362)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 5527872)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 5527862)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5527771)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5527541)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 5527566)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5527487)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5527698)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5527517)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5527560)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 5527501)
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
-- TOC entry 2405 (class 2606 OID 5527609)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5527636)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 5527459)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 5527371)
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
-- TOC entry 2320 (class 2606 OID 5527395)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 5527351)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2305 (class 2606 OID 5527336)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 5527642)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5527675)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 5527812)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 5527423)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 5527447)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 5527615)
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
-- TOC entry 2335 (class 2606 OID 5527437)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 5527508)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 5527627)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 5527755)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5527799)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5527659)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 5527600)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 5527591)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5527793)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 5527727)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 5527307)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 5527666)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 5527325)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2307 (class 2606 OID 5527345)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 5527684)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5527622)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5527572)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5527897)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5527888)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5527883)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 5527740)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 5527403)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 5527582)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5527782)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 5527472)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 5527320)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5527842)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 5527526)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 5527650)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 5527718)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 5527555)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 5527826)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 5527711)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 1259 OID 5527548)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2452 (class 1259 OID 5527741)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2453 (class 1259 OID 5527742)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2327 (class 1259 OID 5527425)
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
-- TOC entry 2418 (class 1259 OID 5527643)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2412 (class 1259 OID 5527629)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2413 (class 1259 OID 5527628)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2364 (class 1259 OID 5527527)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 5527699)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5527701)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2442 (class 1259 OID 5527700)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 5527503)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 5527502)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2469 (class 1259 OID 5527814)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 5527815)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5527816)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2477 (class 1259 OID 5527847)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2478 (class 1259 OID 5527844)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2479 (class 1259 OID 5527846)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2480 (class 1259 OID 5527845)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2342 (class 1259 OID 5527474)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 5527473)
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
-- TOC entry 2428 (class 1259 OID 5527667)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2382 (class 1259 OID 5527561)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2309 (class 1259 OID 5527352)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2310 (class 1259 OID 5527353)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2433 (class 1259 OID 5527687)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2434 (class 1259 OID 5527686)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2435 (class 1259 OID 5527685)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2356 (class 1259 OID 5527509)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2357 (class 1259 OID 5527511)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2358 (class 1259 OID 5527510)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5527890)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2392 (class 1259 OID 5527595)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2393 (class 1259 OID 5527593)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2394 (class 1259 OID 5527592)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2395 (class 1259 OID 5527594)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2300 (class 1259 OID 5527326)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 5527327)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2421 (class 1259 OID 5527651)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2407 (class 1259 OID 5527616)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2448 (class 1259 OID 5527728)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2449 (class 1259 OID 5527729)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2331 (class 1259 OID 5527439)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2332 (class 1259 OID 5527438)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2333 (class 1259 OID 5527440)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2456 (class 1259 OID 5527756)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2457 (class 1259 OID 5527757)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2490 (class 1259 OID 5527876)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 5527875)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2492 (class 1259 OID 5527878)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2493 (class 1259 OID 5527874)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2494 (class 1259 OID 5527877)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2445 (class 1259 OID 5527719)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 5527604)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2399 (class 1259 OID 5527603)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2400 (class 1259 OID 5527601)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2401 (class 1259 OID 5527602)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2283 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 5527864)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 5527863)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2363 (class 1259 OID 5527518)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2315 (class 1259 OID 5527373)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2316 (class 1259 OID 5527372)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2323 (class 1259 OID 5527404)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2324 (class 1259 OID 5527405)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 5527585)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2388 (class 1259 OID 5527584)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2389 (class 1259 OID 5527583)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2370 (class 1259 OID 5527550)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2371 (class 1259 OID 5527546)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2372 (class 1259 OID 5527543)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2373 (class 1259 OID 5527544)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2374 (class 1259 OID 5527542)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2375 (class 1259 OID 5527547)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2376 (class 1259 OID 5527545)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2330 (class 1259 OID 5527424)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2348 (class 1259 OID 5527488)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5527490)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2350 (class 1259 OID 5527489)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2351 (class 1259 OID 5527491)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2406 (class 1259 OID 5527610)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2474 (class 1259 OID 5527813)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 5527843)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2321 (class 1259 OID 5527396)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5527397)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5527898)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2341 (class 1259 OID 5527460)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5527889)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2426 (class 1259 OID 5527661)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2427 (class 1259 OID 5527660)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2495 (class 1259 OID 5527873)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2286 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2338 (class 1259 OID 5527448)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 5527800)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 5527346)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2377 (class 1259 OID 5527549)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2529 (class 2606 OID 5528029)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2532 (class 2606 OID 5528014)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2531 (class 2606 OID 5528019)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2527 (class 2606 OID 5528039)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2533 (class 2606 OID 5528009)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2528 (class 2606 OID 5528034)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2530 (class 2606 OID 5528024)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2563 (class 2606 OID 5528184)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2562 (class 2606 OID 5528189)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5527944)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2550 (class 2606 OID 5528124)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2548 (class 2606 OID 5528119)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2549 (class 2606 OID 5528114)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2526 (class 2606 OID 5528004)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5528154)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5528164)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 5528159)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2520 (class 2606 OID 5527979)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2521 (class 2606 OID 5527974)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2546 (class 2606 OID 5528104)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2569 (class 2606 OID 5528209)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2568 (class 2606 OID 5528214)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2567 (class 2606 OID 5528219)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2570 (class 2606 OID 5528239)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2573 (class 2606 OID 5528224)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2571 (class 2606 OID 5528234)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2572 (class 2606 OID 5528229)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2518 (class 2606 OID 5527969)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 5527964)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5527929)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2552 (class 2606 OID 5528134)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2534 (class 2606 OID 5528044)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 5527909)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 5527914)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2553 (class 2606 OID 5528149)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2554 (class 2606 OID 5528144)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2555 (class 2606 OID 5528139)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2524 (class 2606 OID 5527984)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2522 (class 2606 OID 5527994)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2523 (class 2606 OID 5527989)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2581 (class 2606 OID 5528279)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2538 (class 2606 OID 5528079)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2540 (class 2606 OID 5528069)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2541 (class 2606 OID 5528064)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2539 (class 2606 OID 5528074)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 5527899)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 5527904)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2551 (class 2606 OID 5528129)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2547 (class 2606 OID 5528109)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2561 (class 2606 OID 5528174)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2560 (class 2606 OID 5528179)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 5527954)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2517 (class 2606 OID 5527949)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5527959)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 5528194)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2564 (class 2606 OID 5528199)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2578 (class 2606 OID 5528264)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2579 (class 2606 OID 5528259)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2576 (class 2606 OID 5528274)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2580 (class 2606 OID 5528254)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2577 (class 2606 OID 5528269)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2559 (class 2606 OID 5528169)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2542 (class 2606 OID 5528099)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2543 (class 2606 OID 5528094)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2545 (class 2606 OID 5528084)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2544 (class 2606 OID 5528089)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2574 (class 2606 OID 5528249)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2575 (class 2606 OID 5528244)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2525 (class 2606 OID 5527999)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5528204)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 5527924)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 5527919)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2513 (class 2606 OID 5527934)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 5527939)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2535 (class 2606 OID 5528059)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2536 (class 2606 OID 5528054)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2537 (class 2606 OID 5528049)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-29 14:32:00 CEST

--
-- PostgreSQL database dump complete
--

