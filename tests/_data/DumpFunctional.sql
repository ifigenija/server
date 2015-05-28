--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-28 10:54:54 CEST

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
-- TOC entry 180 (class 1259 OID 5403638)
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
-- TOC entry 227 (class 1259 OID 5404148)
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
-- TOC entry 226 (class 1259 OID 5404131)
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
-- TOC entry 219 (class 1259 OID 5404041)
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
-- TOC entry 194 (class 1259 OID 5403811)
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
-- TOC entry 197 (class 1259 OID 5403845)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5403758)
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
-- TOC entry 213 (class 1259 OID 5403971)
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
-- TOC entry 192 (class 1259 OID 5403795)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5403839)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5403775)
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
-- TOC entry 202 (class 1259 OID 5403888)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5403913)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5403732)
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
-- TOC entry 181 (class 1259 OID 5403647)
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
-- TOC entry 182 (class 1259 OID 5403658)
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
-- TOC entry 177 (class 1259 OID 5403612)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5403631)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5403920)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5403951)
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
-- TOC entry 223 (class 1259 OID 5404084)
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
-- TOC entry 184 (class 1259 OID 5403689)
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
-- TOC entry 186 (class 1259 OID 5403724)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5403894)
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
-- TOC entry 185 (class 1259 OID 5403709)
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
-- TOC entry 191 (class 1259 OID 5403787)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5403906)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5404026)
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
-- TOC entry 222 (class 1259 OID 5404077)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5403935)
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
-- TOC entry 201 (class 1259 OID 5403879)
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
-- TOC entry 200 (class 1259 OID 5403869)
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
-- TOC entry 221 (class 1259 OID 5404066)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5404003)
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
-- TOC entry 174 (class 1259 OID 5403583)
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
-- TOC entry 173 (class 1259 OID 5403581)
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
-- TOC entry 210 (class 1259 OID 5403945)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5403621)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5403605)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5403959)
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
-- TOC entry 204 (class 1259 OID 5403900)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5403850)
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
-- TOC entry 230 (class 1259 OID 5404174)
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
-- TOC entry 229 (class 1259 OID 5404167)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5404162)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5404013)
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
-- TOC entry 183 (class 1259 OID 5403681)
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
-- TOC entry 199 (class 1259 OID 5403856)
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
-- TOC entry 220 (class 1259 OID 5404055)
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
-- TOC entry 188 (class 1259 OID 5403744)
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
-- TOC entry 175 (class 1259 OID 5403592)
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
-- TOC entry 225 (class 1259 OID 5404110)
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
-- TOC entry 193 (class 1259 OID 5403802)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5403927)
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
-- TOC entry 215 (class 1259 OID 5403995)
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
-- TOC entry 195 (class 1259 OID 5403834)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5404100)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5403985)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2144 (class 2604 OID 5403586)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2698 (class 0 OID 5403638)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2745 (class 0 OID 5404148)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5566-d7de-f619-34af73d97ddd	000d0000-5566-d7de-9229-1008e1889073	\N	00090000-5566-d7de-85f3-bd583c480a2f	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5566-d7de-b62b-444f905878a0	000d0000-5566-d7de-2d00-6a591b3f94f0	\N	00090000-5566-d7de-fa70-a6c506206988	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-5566-d7de-149c-aed14c99ea09	000d0000-5566-d7de-adb0-27f049683a0c	\N	00090000-5566-d7de-c20a-2723cdc2223c	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-5566-d7de-6a02-89ddbcd82237	000d0000-5566-d7de-8f71-13d4ede86b31	\N	00090000-5566-d7de-1460-cb31e8d5c3a4	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 5404131)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5404041)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5566-d7de-5313-6df003bf8927	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5566-d7de-9587-bbd43d4e19ea	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5566-d7de-394b-54a906046867	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2712 (class 0 OID 5403811)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5566-d7de-9d8a-f69aadd322ba	\N	\N	00200000-5566-d7de-b3d6-be563286caac	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-5566-d7de-fba3-1a3652743b32	\N	\N	00200000-5566-d7de-c0ac-39179d984cef	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
\.


--
-- TOC entry 2715 (class 0 OID 5403845)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5403758)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5566-d7dc-bc0f-c6011f452c20	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5566-d7dc-0a59-b2161fa91434	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5566-d7dc-ca5a-9dce7d9e6480	AL	ALB	008	Albania 	Albanija	\N
00040000-5566-d7dc-5495-0e3f88ca4d6e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5566-d7dc-215e-0e0d2c51b96f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5566-d7dc-886d-e013f1c2d226	AD	AND	020	Andorra 	Andora	\N
00040000-5566-d7dc-f44e-9096e2e3748b	AO	AGO	024	Angola 	Angola	\N
00040000-5566-d7dc-689c-dcab381f9366	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5566-d7dc-f6b4-9b24cf7d250a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5566-d7dc-7265-390e03569138	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5566-d7dc-826b-cdc7cb757813	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5566-d7dc-5036-cc43a8d6d4f2	AM	ARM	051	Armenia 	Armenija	\N
00040000-5566-d7dc-dd55-34c529dafe66	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5566-d7dc-adbd-2e712116687d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5566-d7dc-911a-bc5e2e28d646	AT	AUT	040	Austria 	Avstrija	\N
00040000-5566-d7dc-6566-6d2934660aba	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5566-d7dc-7b7e-ebdd23f8b6a0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5566-d7dc-7132-4c97e9b11796	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5566-d7dc-0049-51166b4b3aa6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5566-d7dc-a56f-a1fed9801ad6	BB	BRB	052	Barbados 	Barbados	\N
00040000-5566-d7dc-4344-139a55088c9d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5566-d7dc-9692-f62c47090811	BE	BEL	056	Belgium 	Belgija	\N
00040000-5566-d7dc-c64b-e2e7cba3c4ec	BZ	BLZ	084	Belize 	Belize	\N
00040000-5566-d7dc-e0ef-60f77df764d5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5566-d7dc-e75e-8ee153bcbd8a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5566-d7dc-1f8a-bc4a2311793a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5566-d7dc-0725-64e9ae72c240	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5566-d7dc-7378-2d67aa4d7d48	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5566-d7dc-e8d4-ddd96b9f05c5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5566-d7dc-bd22-9514316e86ec	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5566-d7dc-0cab-d391120899dc	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5566-d7dc-fa4c-88918159aafd	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5566-d7dc-abb3-5e84dedc6d75	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5566-d7dc-ddf1-03647957c716	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5566-d7dc-2add-d2b58072718a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5566-d7dc-9a90-746102674270	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5566-d7dc-55fd-450edbb15cf6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5566-d7dc-4291-2f203f368478	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5566-d7dc-9642-906f8d31ef5a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5566-d7dc-f7e3-83b2300e1125	CA	CAN	124	Canada 	Kanada	\N
00040000-5566-d7dc-691d-29b466dcaf92	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5566-d7dc-0692-0fbf19f9c602	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5566-d7dc-f92b-60d5d61c8624	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5566-d7dc-240c-ee80f47b1bfc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5566-d7dc-ad76-25a5b7532775	CL	CHL	152	Chile 	Čile	\N
00040000-5566-d7dc-d99d-51d145977310	CN	CHN	156	China 	Kitajska	\N
00040000-5566-d7dc-145a-33227471c2f9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5566-d7dc-1071-28e516fcaefa	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5566-d7dc-6e91-0bc8dc85d7e6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5566-d7dc-634e-af4eb4aabdf9	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5566-d7dc-decd-94e78f37f736	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5566-d7dc-258f-4d21c543002b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5566-d7dc-ea3f-a8e7d846cbe3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5566-d7dc-a9d0-acd8a24aab1a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5566-d7dc-478a-36926a1c4c7e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5566-d7dc-c763-e678ee1d2265	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5566-d7dc-d5cb-137e12e39d44	CU	CUB	192	Cuba 	Kuba	\N
00040000-5566-d7dc-52d6-4977aafd2518	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5566-d7dc-4a16-3364ad6108d0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5566-d7dc-b774-16722d03893e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5566-d7dc-df94-950da39508cd	DK	DNK	208	Denmark 	Danska	\N
00040000-5566-d7dc-ecdb-43c8b98adf29	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5566-d7dc-3634-fabc46fb04c8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5566-d7dc-d61f-20adadc1ecaf	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5566-d7dc-c5b2-dfb83112a744	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5566-d7dc-63f1-a7d135b02d87	EG	EGY	818	Egypt 	Egipt	\N
00040000-5566-d7dc-ccf1-28982eb3eb71	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5566-d7dc-3471-278080433653	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5566-d7dc-af19-d1d795c1859f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5566-d7dc-59b8-4b3f4fe6d337	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5566-d7dc-f658-ef491978a4dd	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5566-d7dc-a584-0ee653bd5c6c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5566-d7dc-21f1-b5ceeb5ca784	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5566-d7dc-c9d5-e012d588b487	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5566-d7dc-b6e3-4bacee9675b2	FI	FIN	246	Finland 	Finska	\N
00040000-5566-d7dc-38cf-d5f1ce235088	FR	FRA	250	France 	Francija	\N
00040000-5566-d7dc-ab48-4f382ab2379c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5566-d7dc-c304-f580f17dffcb	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5566-d7dc-bd93-d062d873ae45	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5566-d7dc-f548-09b294770a3e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5566-d7dc-bbef-f40693fd74b5	GA	GAB	266	Gabon 	Gabon	\N
00040000-5566-d7dc-3019-643f9e12eb79	GM	GMB	270	Gambia 	Gambija	\N
00040000-5566-d7dc-af4c-403e95c4cfcd	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5566-d7dc-be80-599f817ae66e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5566-d7dc-d9d4-a759929132e6	GH	GHA	288	Ghana 	Gana	\N
00040000-5566-d7dc-c4cf-48b0c1b1625f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5566-d7dc-fb18-ceca68c9ea05	GR	GRC	300	Greece 	Grčija	\N
00040000-5566-d7dc-3c49-4cea29fea808	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5566-d7dc-8bc3-1a18cf07c760	GD	GRD	308	Grenada 	Grenada	\N
00040000-5566-d7dc-dd4c-2328e5963fcf	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5566-d7dc-de88-c60777afd228	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5566-d7dc-ed6f-52653fcfcda9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5566-d7dc-9f9c-f4abce8d8436	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5566-d7dc-8b76-a892891e9215	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5566-d7dc-1ea7-d78e54d081cd	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5566-d7dc-697f-d506ddb246d3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5566-d7dc-ff1e-0d37c125d934	HT	HTI	332	Haiti 	Haiti	\N
00040000-5566-d7dc-4f98-011768e26f46	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5566-d7dc-2f38-919e8e155066	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5566-d7dc-cce3-8fa27c125f2f	HN	HND	340	Honduras 	Honduras	\N
00040000-5566-d7dc-a5ae-399abb2b9784	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5566-d7dc-bc4a-5334a0a52011	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5566-d7dc-fa85-8ee0c1a580af	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5566-d7dc-4e4e-3e9072023609	IN	IND	356	India 	Indija	\N
00040000-5566-d7dc-03ad-03bba27caca3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5566-d7dc-dd18-618428804c76	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5566-d7dc-1aca-0c324c0e630d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5566-d7dc-cc16-eea3cc25feb4	IE	IRL	372	Ireland 	Irska	\N
00040000-5566-d7dc-1d2b-638f61ae867b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5566-d7dc-df21-bdfc38d6e8e5	IL	ISR	376	Israel 	Izrael	\N
00040000-5566-d7dc-cef4-a0d00f04251b	IT	ITA	380	Italy 	Italija	\N
00040000-5566-d7dc-af3c-30160c592f9d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5566-d7dc-067f-f3cc7e0561fd	JP	JPN	392	Japan 	Japonska	\N
00040000-5566-d7dc-3198-50ca72114787	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5566-d7dc-be05-42dd78c79e73	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5566-d7dc-3049-2110fb4e3c23	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5566-d7dc-3846-b7fa504cb472	KE	KEN	404	Kenya 	Kenija	\N
00040000-5566-d7dc-9bc9-1778f22daede	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5566-d7dc-b68d-d87e794f8b06	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5566-d7dc-d4d7-7b0cc5348910	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5566-d7dc-7369-3a4e169f6fee	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5566-d7dc-e748-6942825a81a0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5566-d7dc-05f7-04c716476950	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5566-d7dc-2af6-fbefa0ac12be	LV	LVA	428	Latvia 	Latvija	\N
00040000-5566-d7dc-f86e-2efa9b7944be	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5566-d7dc-1ca8-4d53456c8be0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5566-d7dc-0e84-75d5c02a7b25	LR	LBR	430	Liberia 	Liberija	\N
00040000-5566-d7dc-db49-44f0bd4cc113	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5566-d7dc-a3bb-3217a1fb98af	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5566-d7dc-57bc-26bbc753312e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5566-d7dc-8c1e-8c3aac104a51	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5566-d7dc-bf41-301648a1c023	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5566-d7dc-d3d6-ee515800fc3a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5566-d7dc-7ea5-c1258cc9fc89	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5566-d7dc-a478-1181ccccf362	MW	MWI	454	Malawi 	Malavi	\N
00040000-5566-d7dc-246f-0fc0e1ff5e2e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5566-d7dc-2a99-6d35cc3c0109	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5566-d7dc-4300-8dba64ad1827	ML	MLI	466	Mali 	Mali	\N
00040000-5566-d7dc-1e40-77a5dac49496	MT	MLT	470	Malta 	Malta	\N
00040000-5566-d7dc-52b4-f579dc4aedb0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5566-d7dc-5ec0-d065b5eb3379	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5566-d7dc-0752-02861ebbcbb4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5566-d7dc-03b8-7011a08697db	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5566-d7dc-3c9d-9d06e9818200	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5566-d7dc-3a31-858136779df4	MX	MEX	484	Mexico 	Mehika	\N
00040000-5566-d7dc-6841-2543e7f447d0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5566-d7dc-648d-42b28c23c816	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5566-d7dc-b8d1-f1956370e586	MC	MCO	492	Monaco 	Monako	\N
00040000-5566-d7dc-8ac3-56dc39bb8ad0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5566-d7dc-9d7a-79dab9e4ec96	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5566-d7dc-d9f5-f9e81b650659	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5566-d7dc-793f-c6a60b3c805b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5566-d7dc-c00e-7c0297d75e3c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5566-d7dc-b2ed-22d8c75fa94b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5566-d7dc-8b1c-476ca93d1927	NA	NAM	516	Namibia 	Namibija	\N
00040000-5566-d7dc-7d17-6365ef12506c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5566-d7dc-be2b-dc163e407ea2	NP	NPL	524	Nepal 	Nepal	\N
00040000-5566-d7dc-f4a5-23cd7938bd1d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5566-d7dc-b2d6-6ba6a7ad14c9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5566-d7dc-6297-3d0ad13a12a1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5566-d7dc-1714-0b1571d8953b	NE	NER	562	Niger 	Niger 	\N
00040000-5566-d7dc-6cea-52f9b4b62c03	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5566-d7dc-e366-7f3445a24d8d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5566-d7dc-4f7b-c01efebe4ad4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5566-d7dc-fb66-aff49f7ae791	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5566-d7dc-71c7-53b3fdab2dd5	NO	NOR	578	Norway 	Norveška	\N
00040000-5566-d7dc-bcc7-0144dc38f1d3	OM	OMN	512	Oman 	Oman	\N
00040000-5566-d7dc-f2ba-17e3f6b0899a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5566-d7dc-3d6c-36bba5916ae0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5566-d7dc-c620-a57dc8baa023	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5566-d7dc-aabc-f55145282c0f	PA	PAN	591	Panama 	Panama	\N
00040000-5566-d7dc-51a8-c659352ea8e2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5566-d7dc-72d3-7b111a019010	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5566-d7dc-3117-0c0ec91e950c	PE	PER	604	Peru 	Peru	\N
00040000-5566-d7dc-6dc7-fbc8f3d302e4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5566-d7dc-9db8-673839d7c617	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5566-d7dc-0c7b-14a3485ead39	PL	POL	616	Poland 	Poljska	\N
00040000-5566-d7dc-8003-2ff0f9668a62	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5566-d7dc-99c1-1d4738611e9c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5566-d7dc-4dc3-de0071b62519	QA	QAT	634	Qatar 	Katar	\N
00040000-5566-d7dc-9c6a-8d924570e8c5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5566-d7dc-ad00-a0acace110e6	RO	ROU	642	Romania 	Romunija	\N
00040000-5566-d7dc-f4fb-6b6967c50538	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5566-d7dc-912b-2c5d1c17c663	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5566-d7dc-fbbf-781d6e34b0d6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5566-d7dc-5c2d-ce28077fee1f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5566-d7dc-d546-3458b32fe5b6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5566-d7dc-5887-b139bc470c66	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5566-d7dc-26fe-717de7c879fc	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5566-d7dc-fd1c-afa198b247a0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5566-d7dc-e9f1-b4f8d3dc12f7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5566-d7dc-2c97-af1bc0c51c0b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5566-d7dc-053f-7f57c8b841d8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5566-d7dc-cbeb-36a4f892bc29	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5566-d7dc-557e-4dfd04cf53de	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5566-d7dc-f81b-9c818d30dfa7	SN	SEN	686	Senegal 	Senegal	\N
00040000-5566-d7dc-beb5-834f9062a508	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5566-d7dc-c8d2-1fd2b8735982	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5566-d7dc-24ee-69bc6f4a80b8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5566-d7dc-42f6-24e2e3d41200	SG	SGP	702	Singapore 	Singapur	\N
00040000-5566-d7dc-2db8-6f57371c699f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5566-d7dc-8f35-105f24daab71	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5566-d7dc-470b-1974cd996f0d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5566-d7dc-2b57-77e96b1b43fa	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5566-d7dc-a44d-b4fe06af1091	SO	SOM	706	Somalia 	Somalija	\N
00040000-5566-d7dc-deef-50b133a431c9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5566-d7dc-0d92-7d1c5f8948ab	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5566-d7dc-5634-85f654281068	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5566-d7dc-ee9c-cb9ed8e11436	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5566-d7dc-0386-5915a631d944	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5566-d7dc-f12f-655c4880e33f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5566-d7dc-5cb5-59368e6f30f1	SR	SUR	740	Suriname 	Surinam	\N
00040000-5566-d7dc-bb8f-d59a6a7e6951	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5566-d7dc-8bdc-b0e899974723	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5566-d7dc-ed94-6f6cca6a9ddf	SE	SWE	752	Sweden 	Švedska	\N
00040000-5566-d7dc-a04d-f4e76b43e4d5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5566-d7dc-90ab-81531531ed13	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5566-d7dc-74ea-0381a76831dc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5566-d7dc-ae4f-b86468b48b7c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5566-d7dc-2493-ff353bc0aada	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5566-d7dc-97f8-ed1db719b591	TH	THA	764	Thailand 	Tajska	\N
00040000-5566-d7dc-c55a-a10b5365ab44	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5566-d7dc-ea93-c600dd43789b	TG	TGO	768	Togo 	Togo	\N
00040000-5566-d7dc-0551-8366b23fe045	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5566-d7dc-e701-0aefd34ddf4a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5566-d7dc-c136-dd67d5d8abf1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5566-d7dc-d387-9f1e3c8bdcfa	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5566-d7dc-ed52-3d1e3dfe8d59	TR	TUR	792	Turkey 	Turčija	\N
00040000-5566-d7dc-59a9-d2dfa42b6ee5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5566-d7dc-dc9a-0525917b48d8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5566-d7dc-9c00-5ed8655f3e97	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5566-d7dc-6f7a-d0bd75568fc1	UG	UGA	800	Uganda 	Uganda	\N
00040000-5566-d7dc-ed24-cac9aa4e9940	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5566-d7dc-3699-0a82aa5b1027	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5566-d7dc-93ae-16f916ea01c4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5566-d7dc-3582-dab0f312a056	US	USA	840	United States 	Združene države Amerike	\N
00040000-5566-d7dc-17d7-d4d4fd7204ed	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5566-d7dc-14d8-6df1502d9dc3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5566-d7dc-7b15-3b01fc9c6037	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5566-d7dc-063d-14bd7cfaa858	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5566-d7dc-5daf-e12f0b1bfdf8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5566-d7dc-ba15-a8f0d3608f38	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5566-d7dc-b97e-7fa11973d4a3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5566-d7dc-1a92-34c6fc90bcf3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5566-d7dc-49f2-d41c9905000e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5566-d7dc-7ca0-ea8d144a2e9e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5566-d7dc-e65c-a2bf8b617964	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5566-d7dc-ff5c-e5f6c33338d9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5566-d7dc-3d8b-8c2ed022f632	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2731 (class 0 OID 5403971)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5566-d7de-5afa-0097e322ccd8	000e0000-5566-d7de-a1e0-bc8bdefc6336	\N	000f0000-5566-d7dc-bc4f-6ba2535a139d	igralec	Hipolita	glavna vloga	velika	t	6	t	t	\N
000d0000-5566-d7de-9229-1008e1889073	000e0000-5566-d7de-a1e0-bc8bdefc6336	\N	000f0000-5566-d7dc-bc4f-6ba2535a139d	igralec	Tezej	glavna vloga	velika	t	5	t	t	\N
000d0000-5566-d7de-2d00-6a591b3f94f0	000e0000-5566-d7de-a1e0-bc8bdefc6336	\N	000f0000-5566-d7dc-c5d7-664a6990c0c6	umetnik	Režija		velika	t	8	t	t	\N
000d0000-5566-d7de-adb0-27f049683a0c	000e0000-5566-d7de-a1e0-bc8bdefc6336	\N	000f0000-5566-d7dc-004c-fbf55f8f2640		Inšpicient			t	8	t	t	\N
000d0000-5566-d7de-8f71-13d4ede86b31	000e0000-5566-d7de-a1e0-bc8bdefc6336	\N	000f0000-5566-d7dc-dff6-0c9872ec2ab9		Tehnični vodja			t	8	t	t	\N
\.


--
-- TOC entry 2710 (class 0 OID 5403795)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5403839)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5403775)
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
-- TOC entry 2720 (class 0 OID 5403888)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5403913)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 5403732)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5566-d7dd-5a5a-3332f2f2f448	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5566-d7dd-263d-a60f335daeaf	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5566-d7dd-ce15-61fdf605420d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5566-d7dd-5ce7-9306f52ab0e7	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5566-d7dd-9ebe-532739971186	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5566-d7dd-2415-d482d920014d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5566-d7dd-39c5-f1076d483035	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5566-d7dd-bd64-2c4e5f1cdbf6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5566-d7dd-6304-f36a63d250ae	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5566-d7dd-ee7e-2758467fb80a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5566-d7dd-8d97-179894faba3c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5566-d7dd-2dd7-ecf3bddcf034	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5566-d7dd-20b3-f6cece508a62	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5566-d7dd-2af1-365418403e31	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5566-d7dd-e750-431c852a4c16	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2699 (class 0 OID 5403647)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5566-d7dd-6377-7e86af575b95	00000000-5566-d7dd-9ebe-532739971186	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5566-d7dd-5d4e-d8496915287a	00000000-5566-d7dd-9ebe-532739971186	00010000-5566-d7dd-d2ec-ac7fda7c72e2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5566-d7dd-c819-c4f0d3e6d543	00000000-5566-d7dd-2415-d482d920014d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2700 (class 0 OID 5403658)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5566-d7de-cbd3-161b67b7d85b	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5566-d7de-1460-cb31e8d5c3a4	00010000-5566-d7de-cc4f-170d51d1457b	0002	dr.	Anton	Horvat	b		Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5566-d7de-c20a-2723cdc2223c	00010000-5566-d7de-912a-73143b3ea062	0003		Ivan	Kovačič	c		Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5566-d7de-6976-943cf4ec6aad	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5566-d7de-bfec-d92ffe787ecc	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5566-d7de-4c78-a1ad1374aff7	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5566-d7de-fdd1-ac5dd49480f3	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5566-d7de-4b7d-50ff0f9a56e4	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5566-d7de-85f3-bd583c480a2f	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5566-d7de-fa70-a6c506206988	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5566-d7de-4aec-ae0f74ace88b	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2690 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5403612)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5566-d7dd-ff98-18b9d571127a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5566-d7dd-7f9b-7ee8b9313675	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5566-d7dd-7bed-53a61fcf5ac7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5566-d7dd-60e7-aa2fdac7ab90	Abonma-read	Abonma - branje	f
00030000-5566-d7dd-0681-9f70dd559bad	Abonma-write	Abonma - spreminjanje	f
00030000-5566-d7dd-80dd-490db6ca6cba	Alternacija-read	Alternacija - branje	f
00030000-5566-d7dd-7389-7d17fd0fc8a9	Alternacija-write	Alternacija - spreminjanje	f
00030000-5566-d7dd-4730-8563203b3a69	Arhivalija-read	Arhivalija - branje	f
00030000-5566-d7dd-a54f-058f57cbddf6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5566-d7dd-6e81-2e20a801e4f0	Besedilo-read	Besedilo - branje	f
00030000-5566-d7dd-094b-8cb0ed76172d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5566-d7dd-e9af-245fae9a4047	DogodekIzven-read	DogodekIzven - branje	f
00030000-5566-d7dd-632d-f357eddb05cb	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5566-d7dd-28f1-e04269df1a70	Dogodek-read	Dogodek - branje	f
00030000-5566-d7dd-1eaa-169beb18bee9	Dogodek-write	Dogodek - spreminjanje	f
00030000-5566-d7dd-c4d5-82536be2a78a	Drzava-read	Drzava - branje	f
00030000-5566-d7dd-9f4f-43f654ff5138	Drzava-write	Drzava - spreminjanje	f
00030000-5566-d7dd-acf9-12f0575cabc7	Funkcija-read	Funkcija - branje	f
00030000-5566-d7dd-1ffb-e34119f2530b	Funkcija-write	Funkcija - spreminjanje	f
00030000-5566-d7dd-7786-265704261d5f	Gostovanje-read	Gostovanje - branje	f
00030000-5566-d7dd-c025-f96f8dd44fe9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5566-d7dd-646d-784b7ecea9c0	Gostujoca-read	Gostujoca - branje	f
00030000-5566-d7dd-2839-526bf7f06b84	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5566-d7dd-e632-10ba56fd0369	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5566-d7dd-37c2-ddd3717d3e22	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5566-d7dd-f0b3-1d761e815598	Kupec-read	Kupec - branje	f
00030000-5566-d7dd-7e55-5243f732da2c	Kupec-write	Kupec - spreminjanje	f
00030000-5566-d7dd-ca1a-0535719403b5	NacinPlacina-read	NacinPlacina - branje	f
00030000-5566-d7dd-5d06-0c3c11cb61b6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5566-d7dd-9445-0c2a9dfc9487	Option-read	Option - branje	f
00030000-5566-d7dd-a9ba-d9f88875ed2a	Option-write	Option - spreminjanje	f
00030000-5566-d7dd-77b7-25e7e9f8106d	OptionValue-read	OptionValue - branje	f
00030000-5566-d7dd-3f1e-c32d21884ca0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5566-d7dd-62e9-2a34ff313ab2	Oseba-read	Oseba - branje	f
00030000-5566-d7dd-affc-b17f9fa049e5	Oseba-write	Oseba - spreminjanje	f
00030000-5566-d7dd-e89c-517f2d321abe	Permission-read	Permission - branje	f
00030000-5566-d7dd-734b-99b13e521060	Permission-write	Permission - spreminjanje	f
00030000-5566-d7dd-d72d-c8b4f2951e1a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5566-d7dd-f349-90c026cd3c28	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5566-d7dd-eed4-5f5348a6bb82	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5566-d7dd-0c07-08046a5c2046	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5566-d7dd-faf5-1595101670c3	Pogodba-read	Pogodba - branje	f
00030000-5566-d7dd-0832-bf6ce2d025c4	Pogodba-write	Pogodba - spreminjanje	f
00030000-5566-d7dd-0b6e-2e7930853991	Popa-read	Popa - branje	f
00030000-5566-d7dd-197a-296b66a94622	Popa-write	Popa - spreminjanje	f
00030000-5566-d7dd-3878-5247fde5f563	Posta-read	Posta - branje	f
00030000-5566-d7dd-fc60-b90238b75531	Posta-write	Posta - spreminjanje	f
00030000-5566-d7dd-835e-43482e3a71db	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5566-d7dd-1e86-2f3ac95b9638	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5566-d7dd-21cc-46e13b4ba49f	PostniNaslov-read	PostniNaslov - branje	f
00030000-5566-d7dd-930d-3cea43859ab8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5566-d7dd-b825-b02308cfef26	Predstava-read	Predstava - branje	f
00030000-5566-d7dd-e034-981b867bd366	Predstava-write	Predstava - spreminjanje	f
00030000-5566-d7dd-56a5-84baa75f3011	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5566-d7dd-40f0-295f5e63313a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5566-d7dd-ade2-b0348ec4eb8a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5566-d7dd-925b-30329aecec75	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5566-d7dd-12d3-3e23692a6592	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5566-d7dd-47f9-0e807875a224	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5566-d7dd-e85e-a513797125a9	Prostor-read	Prostor - branje	f
00030000-5566-d7dd-f737-d0b72fbba587	Prostor-write	Prostor - spreminjanje	f
00030000-5566-d7dd-5231-c932a5df8729	Racun-read	Racun - branje	f
00030000-5566-d7dd-1e97-a8341dc5d387	Racun-write	Racun - spreminjanje	f
00030000-5566-d7dd-a670-63c57719c49b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5566-d7dd-f51d-e740f68d4085	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5566-d7dd-993f-dcaed5c085bd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5566-d7dd-c374-eff355de0405	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5566-d7dd-6456-f2a73e3cc0f9	Rekvizit-read	Rekvizit - branje	f
00030000-5566-d7dd-29a2-6be79a8a59eb	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5566-d7dd-72b8-cbde712cd4b1	Revizija-read	Revizija - branje	f
00030000-5566-d7dd-c655-cd1c6bcfb18e	Revizija-write	Revizija - spreminjanje	f
00030000-5566-d7dd-15d2-5c30889b1a7a	Rezervacija-read	Rezervacija - branje	f
00030000-5566-d7dd-8b9a-1e34e34b5930	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5566-d7dd-8e2c-d6c914605705	Role-read	Role - branje	f
00030000-5566-d7dd-b602-551d0321bade	Role-write	Role - spreminjanje	f
00030000-5566-d7dd-946d-f78e3c654e05	SedezniRed-read	SedezniRed - branje	f
00030000-5566-d7dd-3723-2abd6fceb1ed	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5566-d7dd-6fea-fc38473a2296	Sedez-read	Sedez - branje	f
00030000-5566-d7dd-137a-854147736ad5	Sedez-write	Sedez - spreminjanje	f
00030000-5566-d7dd-b66a-180ec2f30abd	Sezona-read	Sezona - branje	f
00030000-5566-d7dd-47c0-559b2971afcb	Sezona-write	Sezona - spreminjanje	f
00030000-5566-d7dd-afbf-84d5f2d111de	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5566-d7dd-3284-2805c199927f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5566-d7dd-0b56-ebd0e96c2170	Stevilcenje-read	Stevilcenje - branje	f
00030000-5566-d7dd-1fa2-49dcd0b75820	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5566-d7dd-59ef-715e48d78c8f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5566-d7dd-bf20-a64aa9a1ed38	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5566-d7dd-bc43-b57a48cdd595	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5566-d7dd-2e74-21de046aa54f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5566-d7dd-60b3-1f665200b8d2	Telefonska-read	Telefonska - branje	f
00030000-5566-d7dd-de30-0c0749a80566	Telefonska-write	Telefonska - spreminjanje	f
00030000-5566-d7dd-1cfe-bfd1a0b80bfa	TerminStoritve-read	TerminStoritve - branje	f
00030000-5566-d7dd-64f3-378733d0c3b5	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5566-d7dd-1fb1-0c262ce31148	TipFunkcije-read	TipFunkcije - branje	f
00030000-5566-d7dd-2031-ae62fa5cae91	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5566-d7dd-1636-d94916c6e099	Trr-read	Trr - branje	f
00030000-5566-d7dd-5b3a-6c42b6005a4f	Trr-write	Trr - spreminjanje	f
00030000-5566-d7dd-e7f0-4db9a0142ef7	Uprizoritev-read	Uprizoritev - branje	f
00030000-5566-d7dd-bf70-344e0bfdbe2b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5566-d7dd-8876-18172fb03f27	User-read	User - branje	f
00030000-5566-d7dd-b890-eb2dfc28e516	User-write	User - spreminjanje	f
00030000-5566-d7dd-424d-0cc26725110e	Vaja-read	Vaja - branje	f
00030000-5566-d7dd-7b6a-cf0c4d86b5c4	Vaja-write	Vaja - spreminjanje	f
00030000-5566-d7dd-b13f-97ac773ec5f8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5566-d7dd-3562-e683c26122da	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5566-d7dd-23a6-8486377bd1f6	Zaposlitev-read	Zaposlitev - branje	f
00030000-5566-d7dd-4532-b16faac78a9a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5566-d7dd-5a8d-8179aaf75582	Zasedenost-read	Zasedenost - branje	f
00030000-5566-d7dd-391f-eaacdcfc9c91	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5566-d7dd-2b56-de77af06da99	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5566-d7dd-b228-cd6c752d59a8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5566-d7dd-4196-3deb0e6dd24e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5566-d7dd-22e9-58896e84b195	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2697 (class 0 OID 5403631)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5566-d7dd-7340-95577763b826	00030000-5566-d7dd-c4d5-82536be2a78a
00020000-5566-d7dd-f6ff-35c5c6bfd2ba	00030000-5566-d7dd-9f4f-43f654ff5138
00020000-5566-d7dd-f6ff-35c5c6bfd2ba	00030000-5566-d7dd-c4d5-82536be2a78a
\.


--
-- TOC entry 2725 (class 0 OID 5403920)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5403951)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5404084)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5403689)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5566-d7de-8bb8-74b260fd6f55	00040000-5566-d7dc-bc0f-c6011f452c20	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5566-d7de-9af6-bc9db72ba574	00040000-5566-d7dc-bc0f-c6011f452c20	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2704 (class 0 OID 5403724)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5566-d7dc-fd8e-3a3610c1d8c8	8341	Adlešiči
00050000-5566-d7dc-abc7-c6b08a8c7506	5270	Ajdovščina
00050000-5566-d7dc-fc8d-438e97bef57b	6280	Ankaran/Ancarano
00050000-5566-d7dc-a274-bdbf07a1109f	9253	Apače
00050000-5566-d7dc-1d9b-210ab9e607c5	8253	Artiče
00050000-5566-d7dc-6dbd-57a6b53cdb9b	4275	Begunje na Gorenjskem
00050000-5566-d7dc-4c33-185d89c0b74c	1382	Begunje pri Cerknici
00050000-5566-d7dc-b043-1f156a8d9c61	9231	Beltinci
00050000-5566-d7dc-a29e-23fcb486edd4	2234	Benedikt
00050000-5566-d7dc-48b2-494b4d464641	2345	Bistrica ob Dravi
00050000-5566-d7dc-dbad-abfd38404fa9	3256	Bistrica ob Sotli
00050000-5566-d7dc-a5df-f25646cbdafa	8259	Bizeljsko
00050000-5566-d7dc-76e5-f1bef9e7cc72	1223	Blagovica
00050000-5566-d7dc-f6dc-734683b64a8d	8283	Blanca
00050000-5566-d7dc-747b-faa6349a10a0	4260	Bled
00050000-5566-d7dc-020f-5f83b089e3be	4273	Blejska Dobrava
00050000-5566-d7dc-e074-6cc1aceba08f	9265	Bodonci
00050000-5566-d7dc-7edc-a0a53ba331ce	9222	Bogojina
00050000-5566-d7dc-b8bc-dc825846b33e	4263	Bohinjska Bela
00050000-5566-d7dc-6ae6-55e9abff8b87	4264	Bohinjska Bistrica
00050000-5566-d7dc-1042-ce47016b438a	4265	Bohinjsko jezero
00050000-5566-d7dc-c955-0b3097d90f60	1353	Borovnica
00050000-5566-d7dc-f809-dacfeedeb20b	8294	Boštanj
00050000-5566-d7dc-42db-ca804fe207f8	5230	Bovec
00050000-5566-d7dc-53e8-e5c1677a3560	5295	Branik
00050000-5566-d7dc-7520-448885b554ed	3314	Braslovče
00050000-5566-d7dc-0399-19ebfd3a78ed	5223	Breginj
00050000-5566-d7dc-f52b-c5c4a1cf6568	8280	Brestanica
00050000-5566-d7dc-5e72-9d7c5e6dca61	2354	Bresternica
00050000-5566-d7dc-b0f5-f96a2c89fa93	4243	Brezje
00050000-5566-d7dc-9a00-277ffee9ec58	1351	Brezovica pri Ljubljani
00050000-5566-d7dc-dad4-3d5ab31729d7	8250	Brežice
00050000-5566-d7dc-1031-9630c4bdd020	4210	Brnik - Aerodrom
00050000-5566-d7dc-78d0-2661cfeb04cd	8321	Brusnice
00050000-5566-d7dc-7532-c85b6216622c	3255	Buče
00050000-5566-d7dc-c677-426eaab692a2	8276	Bučka 
00050000-5566-d7dc-a8fe-703ba783e131	9261	Cankova
00050000-5566-d7dc-2a2d-1def59c4586e	3000	Celje 
00050000-5566-d7dc-d489-795281800799	3001	Celje - poštni predali
00050000-5566-d7dc-9ebb-1c72b318b374	4207	Cerklje na Gorenjskem
00050000-5566-d7dc-2d75-7247355fbe21	8263	Cerklje ob Krki
00050000-5566-d7dc-ee2d-2d8d7025e558	1380	Cerknica
00050000-5566-d7dc-356e-088f7b89a24d	5282	Cerkno
00050000-5566-d7dc-a533-126c1df67bbf	2236	Cerkvenjak
00050000-5566-d7dc-9bba-5127a12f0141	2215	Ceršak
00050000-5566-d7dc-a414-fd6498fac0c2	2326	Cirkovce
00050000-5566-d7dc-aedc-461d92e06d09	2282	Cirkulane
00050000-5566-d7dc-5eed-4e49c8aca5ed	5273	Col
00050000-5566-d7dc-c9e6-4217b1e19c8f	8251	Čatež ob Savi
00050000-5566-d7dc-0e99-16338765deac	1413	Čemšenik
00050000-5566-d7dc-05eb-929fd1ee60ec	5253	Čepovan
00050000-5566-d7dc-a41b-56b3c967715e	9232	Črenšovci
00050000-5566-d7dc-6cab-5558cb65fb53	2393	Črna na Koroškem
00050000-5566-d7dc-7f75-89302b65dc40	6275	Črni Kal
00050000-5566-d7dc-eec5-a451fc7936c8	5274	Črni Vrh nad Idrijo
00050000-5566-d7dc-4b20-5341969ecb05	5262	Črniče
00050000-5566-d7dc-d438-2c69d89cdb23	8340	Črnomelj
00050000-5566-d7dc-8676-cec65375fe0d	6271	Dekani
00050000-5566-d7dc-e063-d7fe0ae14b0c	5210	Deskle
00050000-5566-d7dc-7801-1c3e77442910	2253	Destrnik
00050000-5566-d7dc-7945-b5982e1b671a	6215	Divača
00050000-5566-d7dc-78d0-352708057d44	1233	Dob
00050000-5566-d7dc-adfb-1eeeaed873fd	3224	Dobje pri Planini
00050000-5566-d7dc-0752-86818a577c7a	8257	Dobova
00050000-5566-d7dc-bac0-dd8c3151189a	1423	Dobovec
00050000-5566-d7dc-6034-a9e25139b51e	5263	Dobravlje
00050000-5566-d7dc-1c71-9125fef5ba11	3204	Dobrna
00050000-5566-d7dc-8a14-c72566d51fb1	8211	Dobrnič
00050000-5566-d7dc-a069-6eedb3b5e4b0	1356	Dobrova
00050000-5566-d7dc-229d-751efbb101dc	9223	Dobrovnik/Dobronak 
00050000-5566-d7dc-df24-96e25e71d887	5212	Dobrovo v Brdih
00050000-5566-d7dc-c397-15ea64818400	1431	Dol pri Hrastniku
00050000-5566-d7dc-96cb-d72c201c5b8c	1262	Dol pri Ljubljani
00050000-5566-d7dc-474b-456fa0814d47	1273	Dole pri Litiji
00050000-5566-d7dc-7a06-ff84d51db3dc	1331	Dolenja vas
00050000-5566-d7dc-fb32-23a0f5042430	8350	Dolenjske Toplice
00050000-5566-d7dc-1941-a902afdf7b73	1230	Domžale
00050000-5566-d7dc-7df2-69cc0ae768dd	2252	Dornava
00050000-5566-d7dc-def3-8c22149697fa	5294	Dornberk
00050000-5566-d7dc-c83e-1995fadf8916	1319	Draga
00050000-5566-d7dc-c565-4ff1bd69066f	8343	Dragatuš
00050000-5566-d7dc-c9cf-3c1b3f84e8c5	3222	Dramlje
00050000-5566-d7dc-fd66-95d50d61ee55	2370	Dravograd
00050000-5566-d7dc-5601-6c74e4cafdad	4203	Duplje
00050000-5566-d7dc-56ad-092f1a3a3bcb	6221	Dutovlje
00050000-5566-d7dc-7256-a48759f9d273	8361	Dvor
00050000-5566-d7dc-a215-356111e781fe	2343	Fala
00050000-5566-d7dc-8ba9-4a3f416a9e4c	9208	Fokovci
00050000-5566-d7dc-783f-e3b04d5a6754	2313	Fram
00050000-5566-d7dc-8797-67f7f2a27ca7	3213	Frankolovo
00050000-5566-d7dc-6210-f79e57922ebf	1274	Gabrovka
00050000-5566-d7dc-ee76-12c4cd53a9f5	8254	Globoko
00050000-5566-d7dc-b246-8e4c64d8c480	5275	Godovič
00050000-5566-d7dc-993b-45ba5811a0b6	4204	Golnik
00050000-5566-d7dc-dda4-efe92ae03de2	3303	Gomilsko
00050000-5566-d7dc-5e08-cff2eaf88839	4224	Gorenja vas
00050000-5566-d7dc-50a3-e4ead9f94768	3263	Gorica pri Slivnici
00050000-5566-d7dc-eb8c-72a4fe48a730	2272	Gorišnica
00050000-5566-d7dc-4f80-ece61bc776c1	9250	Gornja Radgona
00050000-5566-d7dc-8ddd-b2d387655503	3342	Gornji Grad
00050000-5566-d7dc-d54b-480d749a1e06	4282	Gozd Martuljek
00050000-5566-d7dc-e6b5-52dc7b086770	6272	Gračišče
00050000-5566-d7dc-e27b-e7eea2628987	9264	Grad
00050000-5566-d7dc-ab8c-5be65d8db1f9	8332	Gradac
00050000-5566-d7dc-4f94-8adbc3a0e9b7	1384	Grahovo
00050000-5566-d7dc-579d-c21b4b5ae527	5242	Grahovo ob Bači
00050000-5566-d7dc-3a63-614f02fece42	5251	Grgar
00050000-5566-d7dc-9d80-f7bd783021bf	3302	Griže
00050000-5566-d7dc-2cca-c9a6ff617951	3231	Grobelno
00050000-5566-d7dc-da8b-f7744e823dc5	1290	Grosuplje
00050000-5566-d7dc-6977-b2ec401171c7	2288	Hajdina
00050000-5566-d7dc-9d76-4618ea652fd1	8362	Hinje
00050000-5566-d7dc-11ba-2dc2f709d9eb	2311	Hoče
00050000-5566-d7dc-21d9-675c53395baf	9205	Hodoš/Hodos
00050000-5566-d7dc-6fd7-b646ee584a09	1354	Horjul
00050000-5566-d7dc-8e09-a794c5f74e6a	1372	Hotedršica
00050000-5566-d7dc-207c-5b02484ab33b	1430	Hrastnik
00050000-5566-d7dc-bfb7-866ef9b161e4	6225	Hruševje
00050000-5566-d7dc-5683-94b3fc102b28	4276	Hrušica
00050000-5566-d7dc-84e0-8d8c7bc2f696	5280	Idrija
00050000-5566-d7dc-997d-80499a294307	1292	Ig
00050000-5566-d7dc-2269-1a14420d8aff	6250	Ilirska Bistrica
00050000-5566-d7dc-4387-44dececdd809	6251	Ilirska Bistrica-Trnovo
00050000-5566-d7dc-6558-025ef1095816	1295	Ivančna Gorica
00050000-5566-d7dc-e90a-8846352867e6	2259	Ivanjkovci
00050000-5566-d7dc-d453-cda1aa3ddbd5	1411	Izlake
00050000-5566-d7dc-54de-a4aceb076032	6310	Izola/Isola
00050000-5566-d7dc-c89e-51da410f78ad	2222	Jakobski Dol
00050000-5566-d7dc-febf-f91bc5f4c2f4	2221	Jarenina
00050000-5566-d7dc-15bd-d3d8e1571088	6254	Jelšane
00050000-5566-d7dc-3bf8-6eb0e8bbbea2	4270	Jesenice
00050000-5566-d7dc-d000-671c4ef2ca5a	8261	Jesenice na Dolenjskem
00050000-5566-d7dc-aef6-25422733ff96	3273	Jurklošter
00050000-5566-d7dc-93f2-2cced04b5747	2223	Jurovski Dol
00050000-5566-d7dc-0cd1-ab10c6a37982	2256	Juršinci
00050000-5566-d7dc-8e81-2fba17370f45	5214	Kal nad Kanalom
00050000-5566-d7dc-4f39-276d66d4dbbf	3233	Kalobje
00050000-5566-d7dc-f1f8-b0985804136e	4246	Kamna Gorica
00050000-5566-d7dc-01e4-efaf9cbc4aa1	2351	Kamnica
00050000-5566-d7dc-197a-34e3a3864c18	1241	Kamnik
00050000-5566-d7dc-9423-f7946e287cf0	5213	Kanal
00050000-5566-d7dc-4494-c2f993267b06	8258	Kapele
00050000-5566-d7dc-8589-0dd822d7e99a	2362	Kapla
00050000-5566-d7dc-9281-630ffb031856	2325	Kidričevo
00050000-5566-d7dc-1f20-163806e06707	1412	Kisovec
00050000-5566-d7dc-9aa6-45d32634f558	6253	Knežak
00050000-5566-d7dc-02df-c34e37e9eee6	5222	Kobarid
00050000-5566-d7dc-a0ac-2906c327e716	9227	Kobilje
00050000-5566-d7dc-2805-857cea3ba3c3	1330	Kočevje
00050000-5566-d7dc-d2ef-f42aa8ab6055	1338	Kočevska Reka
00050000-5566-d7dc-18b5-f71a50376f50	2276	Kog
00050000-5566-d7dc-029f-8276954d4b45	5211	Kojsko
00050000-5566-d7dc-d22f-10edc849896e	6223	Komen
00050000-5566-d7dc-af98-59203c9cd6b1	1218	Komenda
00050000-5566-d7dc-a77d-e307f6bb3642	6000	Koper/Capodistria 
00050000-5566-d7dc-0cfb-b8cd8ac8331b	6001	Koper/Capodistria - poštni predali
00050000-5566-d7dc-bac7-707a93d8e2fc	8282	Koprivnica
00050000-5566-d7dc-f1b4-497e6143ba39	5296	Kostanjevica na Krasu
00050000-5566-d7dc-27b4-f626832755ab	8311	Kostanjevica na Krki
00050000-5566-d7dc-0b92-7f94b8568770	1336	Kostel
00050000-5566-d7dc-6bd2-fa08ace74ae5	6256	Košana
00050000-5566-d7dc-a4dd-f16357300be8	2394	Kotlje
00050000-5566-d7dc-574d-9984efd35156	6240	Kozina
00050000-5566-d7dc-d373-9e586dd9fe72	3260	Kozje
00050000-5566-d7dc-4e25-ca6ccb7db39f	4000	Kranj 
00050000-5566-d7dc-0068-767447670520	4001	Kranj - poštni predali
00050000-5566-d7dc-d553-abbf8bf512e3	4280	Kranjska Gora
00050000-5566-d7dc-a401-f289aedb8fc9	1281	Kresnice
00050000-5566-d7dc-9118-482be862b5e5	4294	Križe
00050000-5566-d7dc-1a18-5a94b0f34446	9206	Križevci
00050000-5566-d7dc-0954-98935a2f9071	9242	Križevci pri Ljutomeru
00050000-5566-d7dc-1d79-49e4c40cd0d7	1301	Krka
00050000-5566-d7dc-a2c0-98740000cbbc	8296	Krmelj
00050000-5566-d7dc-91ec-228cc0914433	4245	Kropa
00050000-5566-d7dc-48d7-749dc06aa6a2	8262	Krška vas
00050000-5566-d7dc-b54b-47173170fae6	8270	Krško
00050000-5566-d7dc-ff9a-19f3cb867d2c	9263	Kuzma
00050000-5566-d7dc-8df8-0b2499a90843	2318	Laporje
00050000-5566-d7dc-517b-a15ae036e9f9	3270	Laško
00050000-5566-d7dc-a771-148d7e59c652	1219	Laze v Tuhinju
00050000-5566-d7dc-13c3-e4ff8ff71894	2230	Lenart v Slovenskih goricah
00050000-5566-d7dc-5efc-cec00b05ea8b	9220	Lendava/Lendva
00050000-5566-d7dc-4da5-6749352736d0	4248	Lesce
00050000-5566-d7dc-495e-97eac685645e	3261	Lesično
00050000-5566-d7dc-5508-35072e7b55af	8273	Leskovec pri Krškem
00050000-5566-d7dc-a315-9fca65c72e70	2372	Libeliče
00050000-5566-d7dc-20e4-5bdb8ea436b8	2341	Limbuš
00050000-5566-d7dc-8ff6-47d418ac4d5c	1270	Litija
00050000-5566-d7dc-f894-ba8025152113	3202	Ljubečna
00050000-5566-d7dc-f0ed-4b2cf003e49e	1000	Ljubljana 
00050000-5566-d7dc-aaed-806fb9518556	1001	Ljubljana - poštni predali
00050000-5566-d7dc-b4bb-1b0b4540f0c3	1231	Ljubljana - Črnuče
00050000-5566-d7dc-edd7-7b5fc5bb91f4	1261	Ljubljana - Dobrunje
00050000-5566-d7dc-9491-5906b4a4bd53	1260	Ljubljana - Polje
00050000-5566-d7dc-5e6b-9482f8bb8c88	1210	Ljubljana - Šentvid
00050000-5566-d7dc-5cb4-3dd33a1bd254	1211	Ljubljana - Šmartno
00050000-5566-d7dc-bdff-0eb30eddbd2b	3333	Ljubno ob Savinji
00050000-5566-d7dc-71ce-86e171f11d92	9240	Ljutomer
00050000-5566-d7dc-f988-b0d97a147588	3215	Loče
00050000-5566-d7dc-20c4-e8827dc0b3b9	5231	Log pod Mangartom
00050000-5566-d7dc-822c-653951b78fdd	1358	Log pri Brezovici
00050000-5566-d7dc-1553-8c0ea38dc12f	1370	Logatec
00050000-5566-d7dc-f13b-af59871092b6	1371	Logatec
00050000-5566-d7dc-0c35-9710c84941e8	1434	Loka pri Zidanem Mostu
00050000-5566-d7dc-35f3-50149f7f8299	3223	Loka pri Žusmu
00050000-5566-d7dc-fb0f-2ce8df115b36	6219	Lokev
00050000-5566-d7dc-211a-30890c340d51	1318	Loški Potok
00050000-5566-d7dc-b3a1-8f410ce0b6e5	2324	Lovrenc na Dravskem polju
00050000-5566-d7dc-93df-0b730a3e86e9	2344	Lovrenc na Pohorju
00050000-5566-d7dc-7154-13f3ba96fbbe	3334	Luče
00050000-5566-d7dc-4f7f-99dddc3fdc0b	1225	Lukovica
00050000-5566-d7dc-ded5-e83274d8add9	9202	Mačkovci
00050000-5566-d7dc-209b-6623a924464b	2322	Majšperk
00050000-5566-d7dc-cc7f-0b362512a0d5	2321	Makole
00050000-5566-d7dc-20d4-ace0f8266d14	9243	Mala Nedelja
00050000-5566-d7dc-9f82-b3decb8a9d97	2229	Malečnik
00050000-5566-d7dc-fc8e-7da5809bc98f	6273	Marezige
00050000-5566-d7dc-a63c-2ca69a3aff28	2000	Maribor 
00050000-5566-d7dc-1883-9c963394a3c6	2001	Maribor - poštni predali
00050000-5566-d7dc-ddc2-2f069ac42c77	2206	Marjeta na Dravskem polju
00050000-5566-d7dc-f09d-e77ecc63c70b	2281	Markovci
00050000-5566-d7dc-f6e4-6dd01ae61139	9221	Martjanci
00050000-5566-d7dc-fa14-0546c1982316	6242	Materija
00050000-5566-d7dc-e365-3150fd95e03e	4211	Mavčiče
00050000-5566-d7dc-452e-b6532993c92c	1215	Medvode
00050000-5566-d7dc-8f52-9af71398d1ba	1234	Mengeš
00050000-5566-d7dc-0a24-74bbe9d41eca	8330	Metlika
00050000-5566-d7dc-d9f0-1b175679cf6f	2392	Mežica
00050000-5566-d7dc-1041-d98f61a6ba2f	2204	Miklavž na Dravskem polju
00050000-5566-d7dc-7e99-4767d1c53aeb	2275	Miklavž pri Ormožu
00050000-5566-d7dc-b59f-fa461964c6fd	5291	Miren
00050000-5566-d7dc-a258-558c5b0ace6a	8233	Mirna
00050000-5566-d7dc-d30d-df4a8666c977	8216	Mirna Peč
00050000-5566-d7dc-7911-88c07437c794	2382	Mislinja
00050000-5566-d7dc-ce9b-dde880f87967	4281	Mojstrana
00050000-5566-d7dc-39f2-c60b2ebfcd66	8230	Mokronog
00050000-5566-d7dc-6b7d-aec3928ce701	1251	Moravče
00050000-5566-d7dc-d4e4-ac4f2c521d7e	9226	Moravske Toplice
00050000-5566-d7dc-e173-a29cc35f13a2	5216	Most na Soči
00050000-5566-d7dc-2cdb-6d62a50fedbd	1221	Motnik
00050000-5566-d7dc-4adf-e0b40b8daefc	3330	Mozirje
00050000-5566-d7dc-6341-791517dec673	9000	Murska Sobota 
00050000-5566-d7dc-f189-c61a87d89698	9001	Murska Sobota - poštni predali
00050000-5566-d7dc-a99a-c0254588a539	2366	Muta
00050000-5566-d7dc-9b18-1e07104e024a	4202	Naklo
00050000-5566-d7dc-0fad-6f14f49f0c1d	3331	Nazarje
00050000-5566-d7dc-bcc0-431c52c1f560	1357	Notranje Gorice
00050000-5566-d7dc-37d4-9b0604e4abc6	3203	Nova Cerkev
00050000-5566-d7dc-dee2-9350304b50c2	5000	Nova Gorica 
00050000-5566-d7dc-9f4e-fe33431a0d96	5001	Nova Gorica - poštni predali
00050000-5566-d7dc-f103-21c29a89f0ac	1385	Nova vas
00050000-5566-d7dc-a75d-a8a9c64870b7	8000	Novo mesto
00050000-5566-d7dc-3f75-0285eefbcad0	8001	Novo mesto - poštni predali
00050000-5566-d7dc-b9e6-e1f74c40121c	6243	Obrov
00050000-5566-d7dc-d4e5-0cd1804d1043	9233	Odranci
00050000-5566-d7dc-e853-0c25160a13b8	2317	Oplotnica
00050000-5566-d7dc-c56d-537d1b5f250d	2312	Orehova vas
00050000-5566-d7dc-0a29-18620e08531d	2270	Ormož
00050000-5566-d7dc-1a59-84d681d4297b	1316	Ortnek
00050000-5566-d7dc-32f1-4114f3cedf7e	1337	Osilnica
00050000-5566-d7dc-090b-4b320b8cde1f	8222	Otočec
00050000-5566-d7dc-800a-f55385efc9c1	2361	Ožbalt
00050000-5566-d7dc-91f7-f06d2b60d706	2231	Pernica
00050000-5566-d7dc-2c59-90863efe403d	2211	Pesnica pri Mariboru
00050000-5566-d7dc-52f9-a68ed7fa9994	9203	Petrovci
00050000-5566-d7dc-2ca3-19cfd088715f	3301	Petrovče
00050000-5566-d7dc-483e-fcebe896f06d	6330	Piran/Pirano
00050000-5566-d7dc-eb98-25d1ab4aaf13	8255	Pišece
00050000-5566-d7dc-ccef-a9263165f35f	6257	Pivka
00050000-5566-d7dc-065b-7411386345c8	6232	Planina
00050000-5566-d7dc-b101-f90fcd23fd0a	3225	Planina pri Sevnici
00050000-5566-d7dc-a276-541cfb1e3ff8	6276	Pobegi
00050000-5566-d7dc-649e-64811a73e95d	8312	Podbočje
00050000-5566-d7dc-cd3e-d9c11be8d677	5243	Podbrdo
00050000-5566-d7dc-1459-6e14892acb93	3254	Podčetrtek
00050000-5566-d7dc-4c52-3765dce2bfe3	2273	Podgorci
00050000-5566-d7dc-f9de-ff8f0e64e2e0	6216	Podgorje
00050000-5566-d7dc-38cf-6f815ac8b9a2	2381	Podgorje pri Slovenj Gradcu
00050000-5566-d7dc-b91e-dda001ea47c2	6244	Podgrad
00050000-5566-d7dc-0d16-52209aa05d0d	1414	Podkum
00050000-5566-d7dc-2cd1-1ca534710912	2286	Podlehnik
00050000-5566-d7dc-758b-3f425c931349	5272	Podnanos
00050000-5566-d7dc-7044-2c01a2ee69a9	4244	Podnart
00050000-5566-d7dc-6545-698c6c629c4d	3241	Podplat
00050000-5566-d7dc-0385-9a0b088d20b4	3257	Podsreda
00050000-5566-d7dc-e838-c26b66268e49	2363	Podvelka
00050000-5566-d7dc-6b48-4e6879998ff9	2208	Pohorje
00050000-5566-d7dc-f553-7bee9b69ade0	2257	Polenšak
00050000-5566-d7dc-7126-c91eda79effa	1355	Polhov Gradec
00050000-5566-d7dc-fc51-2380a8ba561a	4223	Poljane nad Škofjo Loko
00050000-5566-d7dc-58c4-1fd0df8b6d1f	2319	Poljčane
00050000-5566-d7dc-df10-e268bab5dad5	1272	Polšnik
00050000-5566-d7dc-735d-1a8ec23ecd5c	3313	Polzela
00050000-5566-d7dc-0197-ec7b151c172e	3232	Ponikva
00050000-5566-d7dc-675b-9bcab2df3157	6320	Portorož/Portorose
00050000-5566-d7dc-db7e-e161c4720d15	6230	Postojna
00050000-5566-d7dc-6ab7-9af83496f7b8	2331	Pragersko
00050000-5566-d7dc-bd69-1b4d27a839c7	3312	Prebold
00050000-5566-d7dc-110e-846fd94a5ccb	4205	Preddvor
00050000-5566-d7dc-8ecc-8deb2cc34391	6255	Prem
00050000-5566-d7dc-9b7e-1cedbdbdcb73	1352	Preserje
00050000-5566-d7dc-7c51-8c9e7a7c33dc	6258	Prestranek
00050000-5566-d7dc-bafa-8ff1949bfcf4	2391	Prevalje
00050000-5566-d7dc-0671-7d76c1eda91a	3262	Prevorje
00050000-5566-d7dc-25cc-af523e325a1d	1276	Primskovo 
00050000-5566-d7dc-38a3-b72df628bded	3253	Pristava pri Mestinju
00050000-5566-d7dc-2462-a49f3d72751e	9207	Prosenjakovci/Partosfalva
00050000-5566-d7dc-5d1c-bbce3dec8ed1	5297	Prvačina
00050000-5566-d7dc-4209-48859329ebff	2250	Ptuj
00050000-5566-d7dc-4bd2-d906ee0ee2b8	2323	Ptujska Gora
00050000-5566-d7dc-f322-3a1f0d556d73	9201	Puconci
00050000-5566-d7dc-a995-5c7efcf271cd	2327	Rače
00050000-5566-d7dc-99f8-70ccd57829e6	1433	Radeče
00050000-5566-d7dc-7dca-55a3290fee42	9252	Radenci
00050000-5566-d7dc-905a-5077f97b8bff	2360	Radlje ob Dravi
00050000-5566-d7dc-a7c7-f85df458c735	1235	Radomlje
00050000-5566-d7dc-dc9a-947eac83b172	4240	Radovljica
00050000-5566-d7dc-6c76-956a95b48c2d	8274	Raka
00050000-5566-d7dc-2c99-dd5b1addba23	1381	Rakek
00050000-5566-d7dc-01bd-c066a083d9c6	4283	Rateče - Planica
00050000-5566-d7dc-72b2-223ab0e8e119	2390	Ravne na Koroškem
00050000-5566-d7dc-48cc-6cd3367663dd	9246	Razkrižje
00050000-5566-d7dc-df40-18b1aebc2c9c	3332	Rečica ob Savinji
00050000-5566-d7dc-3a97-7f35090ce61a	5292	Renče
00050000-5566-d7dc-efe5-d3f1eba59ee2	1310	Ribnica
00050000-5566-d7dc-6759-ee515ff0d80d	2364	Ribnica na Pohorju
00050000-5566-d7dc-258e-e6e314651bb5	3272	Rimske Toplice
00050000-5566-d7dc-eb33-e445c1e8ce5f	1314	Rob
00050000-5566-d7dc-0669-b2107f3f34ca	5215	Ročinj
00050000-5566-d7dc-52eb-48cd3c18047e	3250	Rogaška Slatina
00050000-5566-d7dc-ddac-87eaac584071	9262	Rogašovci
00050000-5566-d7dc-7614-93f8813480ad	3252	Rogatec
00050000-5566-d7dc-d011-1e363de3f901	1373	Rovte
00050000-5566-d7dc-e153-5eb6bdb8f79a	2342	Ruše
00050000-5566-d7dc-550a-5a44b2e1142c	1282	Sava
00050000-5566-d7dc-4da3-bf610f77fb6e	6333	Sečovlje/Sicciole
00050000-5566-d7dc-a874-1a9381b9a5d5	4227	Selca
00050000-5566-d7dc-f0e3-3ce5a2455e88	2352	Selnica ob Dravi
00050000-5566-d7dc-6eef-fab7cea2ed17	8333	Semič
00050000-5566-d7dc-c3a9-1ab945b8ec61	8281	Senovo
00050000-5566-d7dc-47ef-d3d32f430de9	6224	Senožeče
00050000-5566-d7dc-bf7e-45abed3d8e5b	8290	Sevnica
00050000-5566-d7dc-42ba-a184ea1d4610	6210	Sežana
00050000-5566-d7dc-a6d7-330d4ca171df	2214	Sladki Vrh
00050000-5566-d7dc-d7f6-afa6850979ef	5283	Slap ob Idrijci
00050000-5566-d7dc-609d-2baec35f1a8d	2380	Slovenj Gradec
00050000-5566-d7dc-494e-8de09b5f3f29	2310	Slovenska Bistrica
00050000-5566-d7dc-d89f-c319f710b528	3210	Slovenske Konjice
00050000-5566-d7dc-6183-202ac39cff78	1216	Smlednik
00050000-5566-d7dc-b243-12389d118e58	5232	Soča
00050000-5566-d7dc-fb74-fe3603ecebac	1317	Sodražica
00050000-5566-d7dc-50fc-290c8b9c1d96	3335	Solčava
00050000-5566-d7dc-d4c0-0b4d727d9930	5250	Solkan
00050000-5566-d7dc-cfe9-1190bf88a752	4229	Sorica
00050000-5566-d7dc-d300-c55f045bcdb9	4225	Sovodenj
00050000-5566-d7dc-c7f2-ff9a4441c0b0	5281	Spodnja Idrija
00050000-5566-d7dc-9e36-bcaa3d4e1592	2241	Spodnji Duplek
00050000-5566-d7dc-393e-f33a8d6ad039	9245	Spodnji Ivanjci
00050000-5566-d7dc-89be-343f535d63c3	2277	Središče ob Dravi
00050000-5566-d7dc-93f2-733a073d905d	4267	Srednja vas v Bohinju
00050000-5566-d7dc-545c-299ca07b10d2	8256	Sromlje 
00050000-5566-d7dc-0141-7befe274e0dd	5224	Srpenica
00050000-5566-d7dc-ed9f-f739da7a7f5f	1242	Stahovica
00050000-5566-d7dc-e841-165065170b7d	1332	Stara Cerkev
00050000-5566-d7dc-0553-b633ab924c04	8342	Stari trg ob Kolpi
00050000-5566-d7dc-a2b1-99a0935d0ee2	1386	Stari trg pri Ložu
00050000-5566-d7dc-9610-7f648c26cb08	2205	Starše
00050000-5566-d7dc-e4b6-0ccf52ea45fc	2289	Stoperce
00050000-5566-d7dc-a72f-d9579cff20d4	8322	Stopiče
00050000-5566-d7dc-65cf-5e3e933a951a	3206	Stranice
00050000-5566-d7dc-4f99-2bb73eb559c1	8351	Straža
00050000-5566-d7dc-bd9c-9b1e7bc5142d	1313	Struge
00050000-5566-d7dc-9dba-df4a238b9ff9	8293	Studenec
00050000-5566-d7dc-29ba-d35b74831db0	8331	Suhor
00050000-5566-d7dc-d02a-4ac887a419cc	2233	Sv. Ana v Slovenskih goricah
00050000-5566-d7dc-8209-f9fc58f251ca	2235	Sv. Trojica v Slovenskih goricah
00050000-5566-d7dc-d0c2-9a514f68b6df	2353	Sveti Duh na Ostrem Vrhu
00050000-5566-d7dc-5e5f-928e51953af7	9244	Sveti Jurij ob Ščavnici
00050000-5566-d7dc-b81c-d33339cc8410	3264	Sveti Štefan
00050000-5566-d7dc-445f-4fa90e49f525	2258	Sveti Tomaž
00050000-5566-d7dc-6840-dbc53f0ab9f3	9204	Šalovci
00050000-5566-d7dc-5e51-cd14079bf69e	5261	Šempas
00050000-5566-d7dc-6ef9-afcd192836b1	5290	Šempeter pri Gorici
00050000-5566-d7dc-91c0-f8d82c95963a	3311	Šempeter v Savinjski dolini
00050000-5566-d7dc-6cf4-e2b7617f613d	4208	Šenčur
00050000-5566-d7dc-f255-8e7f13cdef8c	2212	Šentilj v Slovenskih goricah
00050000-5566-d7dc-4f58-bb6c09cd1cfa	8297	Šentjanž
00050000-5566-d7dc-e108-71cd1ac784d8	2373	Šentjanž pri Dravogradu
00050000-5566-d7dc-15cb-bd685c63d099	8310	Šentjernej
00050000-5566-d7dc-196e-5c1d8b75b75b	3230	Šentjur
00050000-5566-d7dc-d113-5042025d4d4a	3271	Šentrupert
00050000-5566-d7dc-aa9e-40f92320d2f7	8232	Šentrupert
00050000-5566-d7dc-f597-20ea64409c68	1296	Šentvid pri Stični
00050000-5566-d7dc-e568-000f73b5f51f	8275	Škocjan
00050000-5566-d7dc-1969-3da193c1226a	6281	Škofije
00050000-5566-d7dc-8b4f-307cca1906b4	4220	Škofja Loka
00050000-5566-d7dc-ad17-ea9674589f9a	3211	Škofja vas
00050000-5566-d7dc-9c00-be0f321a2d11	1291	Škofljica
00050000-5566-d7dc-392b-fb6068d9df1d	6274	Šmarje
00050000-5566-d7dc-4f11-6ce56935abb6	1293	Šmarje - Sap
00050000-5566-d7dc-63ab-2e011babbfff	3240	Šmarje pri Jelšah
00050000-5566-d7dc-cf37-4b5709a15c64	8220	Šmarješke Toplice
00050000-5566-d7dc-5855-54918e22e3c7	2315	Šmartno na Pohorju
00050000-5566-d7dc-0006-c247ad17ff98	3341	Šmartno ob Dreti
00050000-5566-d7dc-b993-8a9f73811852	3327	Šmartno ob Paki
00050000-5566-d7dc-6480-6be4efc47b1b	1275	Šmartno pri Litiji
00050000-5566-d7dc-a91a-4e049a4b585e	2383	Šmartno pri Slovenj Gradcu
00050000-5566-d7dc-f489-e086cf8af24e	3201	Šmartno v Rožni dolini
00050000-5566-d7dc-0a03-b25b0d4d5493	3325	Šoštanj
00050000-5566-d7dc-b4e5-ea2acf58ee66	6222	Štanjel
00050000-5566-d7dc-e67e-4148a152c74b	3220	Štore
00050000-5566-d7dc-eeb0-063c50e74a1f	3304	Tabor
00050000-5566-d7dc-6222-a0ffe910165d	3221	Teharje
00050000-5566-d7dc-98f4-6fb83de4056c	9251	Tišina
00050000-5566-d7dc-1755-3b7d71baa4c8	5220	Tolmin
00050000-5566-d7dc-ff96-5c3807e7ae3f	3326	Topolšica
00050000-5566-d7dc-5e0b-f31515b16ff6	2371	Trbonje
00050000-5566-d7dc-9db6-0947f8c06b63	1420	Trbovlje
00050000-5566-d7dc-c62e-9c97ac69694a	8231	Trebelno 
00050000-5566-d7dc-bc06-695c8d689257	8210	Trebnje
00050000-5566-d7dc-b905-f836a465028d	5252	Trnovo pri Gorici
00050000-5566-d7dc-1cab-e9c4941adef9	2254	Trnovska vas
00050000-5566-d7dc-46e0-471c5ebf70d0	1222	Trojane
00050000-5566-d7dc-5123-670199727a87	1236	Trzin
00050000-5566-d7dc-c80f-470ad35e3caf	4290	Tržič
00050000-5566-d7dc-fe77-268a87580ea7	8295	Tržišče
00050000-5566-d7dc-6007-4554aae555dd	1311	Turjak
00050000-5566-d7dc-e452-1a69856dd695	9224	Turnišče
00050000-5566-d7dc-44aa-9b8b6c47d4ae	8323	Uršna sela
00050000-5566-d7dc-c420-deb6f1408698	1252	Vače
00050000-5566-d7dc-a401-a68819d71e1c	3320	Velenje 
00050000-5566-d7dc-8933-7e905f1d8870	3322	Velenje - poštni predali
00050000-5566-d7dc-099d-f29087416626	8212	Velika Loka
00050000-5566-d7dc-372f-7492b94735bc	2274	Velika Nedelja
00050000-5566-d7dc-03c8-684f17872540	9225	Velika Polana
00050000-5566-d7dc-293a-42d80e915a70	1315	Velike Lašče
00050000-5566-d7dc-b656-2c0f8084ca53	8213	Veliki Gaber
00050000-5566-d7dc-5066-67363536e724	9241	Veržej
00050000-5566-d7dc-3f99-b7e71d25e001	1312	Videm - Dobrepolje
00050000-5566-d7dc-f83b-6f164aef21b5	2284	Videm pri Ptuju
00050000-5566-d7dc-a121-2b3586822e75	8344	Vinica
00050000-5566-d7dc-70d9-bdb0133056eb	5271	Vipava
00050000-5566-d7dc-13d4-cd6471e2c9fb	4212	Visoko
00050000-5566-d7dc-c1a9-3ccaf0041a0d	1294	Višnja Gora
00050000-5566-d7dc-423d-63618d8cd723	3205	Vitanje
00050000-5566-d7dc-279e-d81e97ffe5f1	2255	Vitomarci
00050000-5566-d7dc-5734-ba91f7f69ac2	1217	Vodice
00050000-5566-d7dc-a06f-d275fab0c990	3212	Vojnik\t
00050000-5566-d7dc-959a-5f55dc1b3769	5293	Volčja Draga
00050000-5566-d7dc-64a4-89ce46881d6b	2232	Voličina
00050000-5566-d7dc-9135-f9816624e749	3305	Vransko
00050000-5566-d7dc-f905-08af9eec0437	6217	Vremski Britof
00050000-5566-d7dc-6b78-d840b1ca86c3	1360	Vrhnika
00050000-5566-d7dc-ef6f-410ab0a879c7	2365	Vuhred
00050000-5566-d7dc-399d-26ed1b5ac57f	2367	Vuzenica
00050000-5566-d7dc-a925-56a8279ddd57	8292	Zabukovje 
00050000-5566-d7dc-f064-38d1d6b42b56	1410	Zagorje ob Savi
00050000-5566-d7dc-6fbf-b600749eebcf	1303	Zagradec
00050000-5566-d7dc-32fb-fdfb362236a8	2283	Zavrč
00050000-5566-d7dc-9670-88970af51983	8272	Zdole 
00050000-5566-d7dc-ab65-bafc606a69d7	4201	Zgornja Besnica
00050000-5566-d7dc-8b99-9510c164b217	2242	Zgornja Korena
00050000-5566-d7dc-b073-d33f1284871a	2201	Zgornja Kungota
00050000-5566-d7dc-9a94-608537c0b99a	2316	Zgornja Ložnica
00050000-5566-d7dc-a9b7-adce56801ca7	2314	Zgornja Polskava
00050000-5566-d7dc-d8c7-2d93c9221247	2213	Zgornja Velka
00050000-5566-d7dc-f1a9-24fd4849d9b6	4247	Zgornje Gorje
00050000-5566-d7dc-baee-e442d69be935	4206	Zgornje Jezersko
00050000-5566-d7dc-441f-dea72bd53305	2285	Zgornji Leskovec
00050000-5566-d7dc-0d0e-091551bc330b	1432	Zidani Most
00050000-5566-d7dc-b0f9-e6dd2c5f3004	3214	Zreče
00050000-5566-d7dc-a997-e9a592d0ee12	4209	Žabnica
00050000-5566-d7dc-a8f8-5a9b4b1b0c56	3310	Žalec
00050000-5566-d7dc-f753-ade46b4d0162	4228	Železniki
00050000-5566-d7dc-7a9e-91bec4295dc7	2287	Žetale
00050000-5566-d7dc-e5ab-1a9ad563113e	4226	Žiri
00050000-5566-d7dc-c623-fbecc370af52	4274	Žirovnica
00050000-5566-d7dc-fa28-aa101716202e	8360	Žužemberk
\.


--
-- TOC entry 2721 (class 0 OID 5403894)
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
-- TOC entry 2703 (class 0 OID 5403709)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5403787)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5403906)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5404026)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5404077)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2727 (class 0 OID 5403935)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5566-d7de-fa37-0a6cd514a665	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5566-d7de-b756-6fa070cbf8d4	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5566-d7de-6764-42abf9bf89bd	0003	Kazinska	t	84	Kazinska dvorana
00220000-5566-d7de-d6e2-a90d8b90d51d	0004	Mali oder	t	24	Mali oder 
00220000-5566-d7de-73cc-aaef9db49256	0005	Komorni oder	t	15	Komorni oder
00220000-5566-d7de-ea84-2f7130fc6e42	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5566-d7de-77cc-8ae7e0a8d221	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2719 (class 0 OID 5403879)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5403869)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5404066)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5404003)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2692 (class 0 OID 5403583)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5566-d7dd-d2ec-ac7fda7c72e2	00010000-5566-d7dd-d345-c143c8a9657d	2015-05-28 10:54:54	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROhQBjnxxSVnS4fSMTxLYmuT6W7QMLTL6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2728 (class 0 OID 5403945)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5403621)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5566-d7dd-8bb0-55cd60f53dfc	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5566-d7dd-c4b0-379b498cfff9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5566-d7dd-7340-95577763b826	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5566-d7dd-3e5d-9b9decb251ef	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5566-d7dd-43ae-46efcd5f4f6e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5566-d7dd-f6ff-35c5c6bfd2ba	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2694 (class 0 OID 5403605)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5566-d7dd-d2ec-ac7fda7c72e2	00020000-5566-d7dd-3e5d-9b9decb251ef
00010000-5566-d7dd-d345-c143c8a9657d	00020000-5566-d7dd-3e5d-9b9decb251ef
\.


--
-- TOC entry 2730 (class 0 OID 5403959)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 5403900)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5403850)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2748 (class 0 OID 5404174)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5566-d7dc-5285-7630d7691daa	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5566-d7dc-b3d2-bd4db413c8ca	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5566-d7dc-b58a-8ce679f5ff57	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5566-d7dc-5ff9-4c4b95306e7a	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5566-d7dc-6c76-9eb8b7e3629e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2747 (class 0 OID 5404167)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5566-d7dc-d735-72a8f0d75c71	00000000-5566-d7dc-5ff9-4c4b95306e7a	popa
00000000-5566-d7dc-52b0-632d5c5fe642	00000000-5566-d7dc-5ff9-4c4b95306e7a	oseba
00000000-5566-d7dc-40d8-1b4472192c03	00000000-5566-d7dc-b3d2-bd4db413c8ca	prostor
00000000-5566-d7dc-4a29-fa90f8e1ee08	00000000-5566-d7dc-5ff9-4c4b95306e7a	besedilo
00000000-5566-d7dc-8f16-8785c5d02b0c	00000000-5566-d7dc-5ff9-4c4b95306e7a	uprizoritev
00000000-5566-d7dc-94c1-b6c0011fb11b	00000000-5566-d7dc-5ff9-4c4b95306e7a	funkcija
00000000-5566-d7dc-be4a-c0d7348a971e	00000000-5566-d7dc-5ff9-4c4b95306e7a	tipfunkcije
00000000-5566-d7dc-e49a-c6a7d13dd162	00000000-5566-d7dc-5ff9-4c4b95306e7a	alternacija
\.


--
-- TOC entry 2746 (class 0 OID 5404162)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5404013)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2701 (class 0 OID 5403681)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5403856)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5404055)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5566-d7dc-004c-fbf55f8f2640	Inšpicient	Inšpicienti	f	Inšpicientka	\N
000f0000-5566-d7dc-dff6-0c9872ec2ab9	Tehnični vodja	Tehnične vodje	f	Tehnični vodja	\N
000f0000-5566-d7dc-bc4f-6ba2535a139d	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5566-d7dc-6faf-49e1a1d7de5f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5566-d7dc-69d5-7e845f78d1cd	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5566-d7dc-c5d7-664a6990c0c6	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5566-d7dc-6df0-f57f7c2135c5	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5566-d7dc-3ce2-15622aa15d00	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5566-d7dc-b25e-922e779f3e5b	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5566-d7dc-0df6-a7741a457165	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5566-d7dc-31cc-5eebd479ded9	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5566-d7dc-c7a6-67aa8fe575fe	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5566-d7dc-6c37-5612b810f8bc	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5566-d7dc-cc14-66a84adc1d45	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5566-d7dc-ff6f-57faea5703fc	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5566-d7dc-e796-02c1684c9e19	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5566-d7dc-cbc1-04504dbb6846	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5566-d7dc-7c54-93ddf938d6d0	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2706 (class 0 OID 5403744)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5403592)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5566-d7dd-d345-c143c8a9657d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROihEx314HOvjqrWm9PX2C3q6GQ6O8VzS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5566-d7de-912a-73143b3ea062	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5566-d7de-cc4f-170d51d1457b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5566-d7dd-d2ec-ac7fda7c72e2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2743 (class 0 OID 5404110)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5566-d7de-6d61-1e11625f4b38	00160000-5566-d7de-5313-6df003bf8927	00150000-5566-d7dc-2ee1-d878e5024c30	00140000-5566-d7dc-f56e-253166d59619	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5566-d7de-73cc-aaef9db49256
000e0000-5566-d7de-a1e0-bc8bdefc6336	00160000-5566-d7de-394b-54a906046867	00150000-5566-d7dc-80e2-c7a9e93c2024	00140000-5566-d7dc-d73e-ceff7bd30636	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5566-d7de-ea84-2f7130fc6e42
\.


--
-- TOC entry 2711 (class 0 OID 5403802)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5566-d7de-b3d6-be563286caac	000e0000-5566-d7de-a1e0-bc8bdefc6336	1	
00200000-5566-d7de-c0ac-39179d984cef	000e0000-5566-d7de-a1e0-bc8bdefc6336	2	
\.


--
-- TOC entry 2726 (class 0 OID 5403927)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2733 (class 0 OID 5403995)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 5403834)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5404100)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5566-d7dc-f56e-253166d59619	Drama	drama (SURS 01)
00140000-5566-d7dc-555b-d9acfff1ccd3	Opera	opera (SURS 02)
00140000-5566-d7dc-594a-7adbeb9cd0b9	Balet	balet (SURS 03)
00140000-5566-d7dc-f460-cb7c5d91063c	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5566-d7dc-46b6-e92ca03fcb5f	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5566-d7dc-d73e-ceff7bd30636	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5566-d7dc-2fcf-ce198d74a3f1	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2732 (class 0 OID 5403985)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5566-d7dc-8382-50562726d18f	Opera	opera
00150000-5566-d7dc-470d-f0558bcec57f	Opereta	opereta
00150000-5566-d7dc-dc75-63c2b8e5c908	Balet	balet
00150000-5566-d7dc-ed64-e53692e8ae99	Plesne prireditve	plesne prireditve
00150000-5566-d7dc-6167-473c7e1ccd75	Lutkovno gledališče	lutkovno gledališče
00150000-5566-d7dc-aca2-79094d4f3c7e	Raziskovalno gledališče	raziskovalno gledališče
00150000-5566-d7dc-5d37-57dfc7667e81	Biografska drama	biografska drama
00150000-5566-d7dc-2ee1-d878e5024c30	Komedija	komedija
00150000-5566-d7dc-1626-71bee9c40e8b	Črna komedija	črna komedija
00150000-5566-d7dc-7a4d-f67b533f9f2b	E-igra	E-igra
00150000-5566-d7dc-80e2-c7a9e93c2024	Kriminalka	kriminalka
00150000-5566-d7dc-8dbd-bdfbf2414de6	Musical	musical
\.


--
-- TOC entry 2313 (class 2606 OID 5403646)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 5404155)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5404145)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5404054)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 5403824)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 5403849)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 5403770)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 5403981)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 5403800)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5403843)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 5403784)
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
-- TOC entry 2404 (class 2606 OID 5403892)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 5403919)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 5403742)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 5403655)
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
-- TOC entry 2319 (class 2606 OID 5403678)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 5403635)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2304 (class 2606 OID 5403620)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5403925)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 5403958)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 5404095)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 5403706)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 5403730)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 5403898)
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
-- TOC entry 2334 (class 2606 OID 5403720)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 5403791)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 5403910)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 5404038)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5404082)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 5403942)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 5403883)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 5403874)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 5404076)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 5404010)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 5403591)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 5403949)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 5403609)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2306 (class 2606 OID 5403629)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 5403967)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 5403905)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 5403855)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 5404180)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 5404171)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 5404166)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 5404023)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 5403686)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 5403865)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5404065)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 5403755)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5403604)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 5404125)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 5403809)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 5403933)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 5404001)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 5403838)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 5404109)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 5403994)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 1259 OID 5403831)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2451 (class 1259 OID 5404024)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2452 (class 1259 OID 5404025)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2326 (class 1259 OID 5403708)
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
-- TOC entry 2417 (class 1259 OID 5403926)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2411 (class 1259 OID 5403912)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2412 (class 1259 OID 5403911)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2363 (class 1259 OID 5403810)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 5403984)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2440 (class 1259 OID 5403982)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5403983)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2351 (class 1259 OID 5403786)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2352 (class 1259 OID 5403785)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2468 (class 1259 OID 5404097)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 5404098)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 5404099)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2476 (class 1259 OID 5404130)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2477 (class 1259 OID 5404127)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2478 (class 1259 OID 5404129)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2479 (class 1259 OID 5404128)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2341 (class 1259 OID 5403757)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2342 (class 1259 OID 5403756)
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
-- TOC entry 2427 (class 1259 OID 5403950)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2381 (class 1259 OID 5403844)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2308 (class 1259 OID 5403636)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2309 (class 1259 OID 5403637)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2432 (class 1259 OID 5403970)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2433 (class 1259 OID 5403969)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2434 (class 1259 OID 5403968)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2355 (class 1259 OID 5403792)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2356 (class 1259 OID 5403794)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2357 (class 1259 OID 5403793)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2497 (class 1259 OID 5404173)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2391 (class 1259 OID 5403878)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2392 (class 1259 OID 5403876)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2393 (class 1259 OID 5403875)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2394 (class 1259 OID 5403877)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2299 (class 1259 OID 5403610)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 5403611)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2420 (class 1259 OID 5403934)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2406 (class 1259 OID 5403899)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2447 (class 1259 OID 5404011)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2448 (class 1259 OID 5404012)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2330 (class 1259 OID 5403722)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2331 (class 1259 OID 5403721)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2332 (class 1259 OID 5403723)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2455 (class 1259 OID 5404039)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2456 (class 1259 OID 5404040)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2489 (class 1259 OID 5404159)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2490 (class 1259 OID 5404158)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2491 (class 1259 OID 5404161)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2492 (class 1259 OID 5404157)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2493 (class 1259 OID 5404160)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2444 (class 1259 OID 5404002)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2397 (class 1259 OID 5403887)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2398 (class 1259 OID 5403886)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2399 (class 1259 OID 5403884)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2400 (class 1259 OID 5403885)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2282 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2485 (class 1259 OID 5404147)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2486 (class 1259 OID 5404146)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2362 (class 1259 OID 5403801)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2314 (class 1259 OID 5403657)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2315 (class 1259 OID 5403656)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2322 (class 1259 OID 5403687)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2323 (class 1259 OID 5403688)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 5403868)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2387 (class 1259 OID 5403867)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2388 (class 1259 OID 5403866)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2369 (class 1259 OID 5403833)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2370 (class 1259 OID 5403829)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2371 (class 1259 OID 5403826)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2372 (class 1259 OID 5403827)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2373 (class 1259 OID 5403825)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2374 (class 1259 OID 5403830)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2375 (class 1259 OID 5403828)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2329 (class 1259 OID 5403707)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2347 (class 1259 OID 5403771)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2348 (class 1259 OID 5403773)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2349 (class 1259 OID 5403772)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2350 (class 1259 OID 5403774)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2405 (class 1259 OID 5403893)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 5404096)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 5404126)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2320 (class 1259 OID 5403679)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2321 (class 1259 OID 5403680)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 5404181)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2340 (class 1259 OID 5403743)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 5404172)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2425 (class 1259 OID 5403944)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2426 (class 1259 OID 5403943)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2494 (class 1259 OID 5404156)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2337 (class 1259 OID 5403731)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 5404083)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2307 (class 1259 OID 5403630)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2376 (class 1259 OID 5403832)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2528 (class 2606 OID 5404312)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2531 (class 2606 OID 5404297)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2530 (class 2606 OID 5404302)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2526 (class 2606 OID 5404322)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2532 (class 2606 OID 5404292)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2527 (class 2606 OID 5404317)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2529 (class 2606 OID 5404307)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2562 (class 2606 OID 5404467)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2561 (class 2606 OID 5404472)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 5404227)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2549 (class 2606 OID 5404407)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2547 (class 2606 OID 5404402)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2548 (class 2606 OID 5404397)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2525 (class 2606 OID 5404287)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2555 (class 2606 OID 5404447)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 5404437)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5404442)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2519 (class 2606 OID 5404262)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5404257)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2545 (class 2606 OID 5404387)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5404492)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2567 (class 2606 OID 5404497)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2566 (class 2606 OID 5404502)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2569 (class 2606 OID 5404522)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2572 (class 2606 OID 5404507)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2570 (class 2606 OID 5404517)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2571 (class 2606 OID 5404512)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2517 (class 2606 OID 5404252)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5404247)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5404212)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2551 (class 2606 OID 5404417)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2533 (class 2606 OID 5404327)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 5404192)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2506 (class 2606 OID 5404197)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2552 (class 2606 OID 5404432)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2553 (class 2606 OID 5404427)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2554 (class 2606 OID 5404422)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2523 (class 2606 OID 5404267)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2521 (class 2606 OID 5404277)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2522 (class 2606 OID 5404272)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2580 (class 2606 OID 5404562)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2537 (class 2606 OID 5404362)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2539 (class 2606 OID 5404352)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2540 (class 2606 OID 5404347)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2538 (class 2606 OID 5404357)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 5404182)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2504 (class 2606 OID 5404187)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2550 (class 2606 OID 5404412)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2546 (class 2606 OID 5404392)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2560 (class 2606 OID 5404457)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2559 (class 2606 OID 5404462)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 5404237)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 5404232)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5404242)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2564 (class 2606 OID 5404477)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5404482)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2577 (class 2606 OID 5404547)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2578 (class 2606 OID 5404542)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2575 (class 2606 OID 5404557)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2579 (class 2606 OID 5404537)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2576 (class 2606 OID 5404552)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2558 (class 2606 OID 5404452)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2541 (class 2606 OID 5404382)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2542 (class 2606 OID 5404377)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2544 (class 2606 OID 5404367)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2543 (class 2606 OID 5404372)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2573 (class 2606 OID 5404532)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2574 (class 2606 OID 5404527)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2524 (class 2606 OID 5404282)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 5404487)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 5404207)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 5404202)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2512 (class 2606 OID 5404217)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2511 (class 2606 OID 5404222)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2534 (class 2606 OID 5404342)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2535 (class 2606 OID 5404337)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2536 (class 2606 OID 5404332)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-28 10:54:54 CEST

--
-- PostgreSQL database dump complete
--

