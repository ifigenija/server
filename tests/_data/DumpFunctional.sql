--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-05-24 21:56:38 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 120547)
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
-- TOC entry 214 (class 1259 OID 120874)
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
-- TOC entry 215 (class 1259 OID 120887)
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
-- TOC entry 216 (class 1259 OID 120904)
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
-- TOC entry 192 (class 1259 OID 120691)
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
-- TOC entry 193 (class 1259 OID 120714)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 120556)
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
-- TOC entry 217 (class 1259 OID 120918)
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
-- TOC entry 194 (class 1259 OID 120719)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 195 (class 1259 OID 120726)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 172 (class 1259 OID 35870)
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
-- TOC entry 201 (class 1259 OID 120773)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 202 (class 1259 OID 120779)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 183 (class 1259 OID 120573)
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
-- TOC entry 184 (class 1259 OID 120585)
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
-- TOC entry 185 (class 1259 OID 120596)
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
-- TOC entry 187 (class 1259 OID 120639)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 120490)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 120520)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 120786)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 120793)
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
-- TOC entry 218 (class 1259 OID 120932)
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
-- TOC entry 186 (class 1259 OID 120619)
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
-- TOC entry 188 (class 1259 OID 120646)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 120801)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 173 (class 1259 OID 35988)
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
-- TOC entry 189 (class 1259 OID 120654)
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
-- TOC entry 196 (class 1259 OID 120732)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 206 (class 1259 OID 120807)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 120948)
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
-- TOC entry 220 (class 1259 OID 120963)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 207 (class 1259 OID 120814)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    jeprizorisce boolean,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 208 (class 1259 OID 120823)
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
-- TOC entry 209 (class 1259 OID 120832)
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
-- TOC entry 221 (class 1259 OID 120970)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 120981)
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
-- TOC entry 176 (class 1259 OID 120501)
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
-- TOC entry 175 (class 1259 OID 120499)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 120842)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 120510)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 120540)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 120848)
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
-- TOC entry 212 (class 1259 OID 120860)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 120740)
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
-- TOC entry 229 (class 1259 OID 121063)
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
-- TOC entry 230 (class 1259 OID 121071)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 121078)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 120991)
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
-- TOC entry 232 (class 1259 OID 121083)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 190 (class 1259 OID 120669)
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
-- TOC entry 200 (class 1259 OID 120760)
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
-- TOC entry 224 (class 1259 OID 121004)
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
-- TOC entry 191 (class 1259 OID 120677)
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
-- TOC entry 179 (class 1259 OID 120527)
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
-- TOC entry 225 (class 1259 OID 121015)
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
-- TOC entry 198 (class 1259 OID 120746)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 213 (class 1259 OID 120866)
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
-- TOC entry 226 (class 1259 OID 121035)
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
-- TOC entry 199 (class 1259 OID 120755)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 121043)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 121053)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2426 (class 2604 OID 120504)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2972 (class 0 OID 120547)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 120874)
-- Dependencies: 214
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 120887)
-- Dependencies: 215
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 120904)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 120691)
-- Dependencies: 192
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 120714)
-- Dependencies: 193
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 120556)
-- Dependencies: 182
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5562-2ccc-3e8f-24fc1f5ec423	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5562-2ccc-33f2-c21786af6dee	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5562-2ccc-8665-340886926dff	AL	ALB	008	Albania 	Albanija	\N
00040000-5562-2ccc-7d7a-c9dac4869ef0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5562-2ccc-80ad-d066592f9197	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5562-2ccc-b26f-e0d0e570933f	AD	AND	020	Andorra 	Andora	\N
00040000-5562-2ccc-c7bd-32ab9146025b	AO	AGO	024	Angola 	Angola	\N
00040000-5562-2ccc-4e10-e964e983d3c4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5562-2ccc-49ea-da7c42ff216f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5562-2ccc-02b8-0d0093718c99	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5562-2ccc-76f4-767e3daac59f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5562-2ccc-86e6-3256b91c8f1d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5562-2ccc-21c7-8faa60d72f0a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5562-2ccc-7423-a2ebde7adad7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5562-2ccc-0d28-ad9531a21546	AT	AUT	040	Austria 	Avstrija	\N
00040000-5562-2ccc-6adb-d237b2fba959	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5562-2ccc-3f26-5beab9c61325	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5562-2ccc-b047-c3b7e3ddba8e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5562-2ccc-5ddb-a9c294acc0f1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5562-2ccc-99d3-281433c75f44	BB	BRB	052	Barbados 	Barbados	\N
00040000-5562-2ccc-8f5f-27ad49706443	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5562-2ccc-f26d-7729654eb7b2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5562-2ccc-6ded-4885683d0d51	BZ	BLZ	084	Belize 	Belize	\N
00040000-5562-2ccc-8a1c-99deb91e22e9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5562-2ccc-cb7e-d8f7f753cba9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5562-2ccc-cf76-cb0ba6b5c0e9	BT	BTN	064	Bhutan 	Butan	\N
00040000-5562-2ccc-2d9d-75bb4ef11de6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5562-2ccc-a19d-49ecd0b523f6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5562-2ccc-3ff5-320bd650a977	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5562-2ccc-77bf-0a9c65ba2138	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5562-2ccc-82e8-dfb89871333d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5562-2ccc-4b04-b12665b27985	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5562-2ccc-a986-537f1e945d71	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5562-2ccc-6d39-84547f4d9059	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5562-2ccc-096c-1ed220df08ed	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5562-2ccc-b9e8-55461c4e8289	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5562-2ccc-07fd-85c4e2cce564	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5562-2ccc-c99c-46067b18a12d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5562-2ccc-25b5-27be8bc75fb7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5562-2ccc-5e92-4a0746675c55	CA	CAN	124	Canada 	Kanada	\N
00040000-5562-2ccc-780d-5324d0baf8d8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5562-2ccc-1f55-17268648a140	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5562-2ccc-38e5-3ba693d699ad	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5562-2ccc-75d9-1b7e0f32ba8f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5562-2ccc-8443-213f669fcc0e	CL	CHL	152	Chile 	Čile	\N
00040000-5562-2ccc-09a1-762d070c6435	CN	CHN	156	China 	Kitajska	\N
00040000-5562-2ccc-f0f8-1acaed946d14	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5562-2ccc-3387-ee76fa99faf4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5562-2ccc-e80c-817fa8001408	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5562-2ccc-9247-3c7313f22063	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5562-2ccc-bff5-d401c46a69b9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5562-2ccc-2009-b409fb1c57fc	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5562-2ccc-cc98-cdcf341d27fd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5562-2ccc-f94b-99de8f94ed01	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5562-2ccc-554b-a3d1dd861898	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5562-2ccc-c4b2-f58f46f67f77	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5562-2ccc-54a0-70d62e766b93	CU	CUB	192	Cuba 	Kuba	\N
00040000-5562-2ccc-29d8-c717dc4ebcd5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5562-2ccc-b920-761d3a5cdee0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5562-2ccc-fefa-cb130758954f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5562-2ccc-508c-03404341b545	DK	DNK	208	Denmark 	Danska	\N
00040000-5562-2ccc-e6db-0b8b46a90e4d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5562-2ccc-a22a-09be3014668c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5562-2ccc-1d33-f17b5975b57f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5562-2ccc-7a88-a436a6e76050	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5562-2ccc-ce59-60c8818c7ee5	EG	EGY	818	Egypt 	Egipt	\N
00040000-5562-2ccc-46e7-ae49a0255131	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5562-2ccc-1b28-760c74577dc9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5562-2ccc-6903-376527f94fb3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5562-2ccc-30b2-513a177a98bb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5562-2ccc-6585-a56b2d3ae0b3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5562-2ccc-29e6-408c260b9548	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5562-2ccc-73e3-03809788db10	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5562-2ccc-1ff7-2533c6c27f8f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5562-2ccc-61a5-e4290b5d6b32	FI	FIN	246	Finland 	Finska	\N
00040000-5562-2ccc-5b2b-e4d5a4170ec9	FR	FRA	250	France 	Francija	\N
00040000-5562-2ccc-c629-f1d09f9c8ee1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5562-2ccc-5de4-df40477f39ad	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5562-2ccc-6f4b-6b090e882c09	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5562-2ccc-f54e-d5aa6ab410dc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5562-2ccc-d6d0-2b4aefc23ff2	GA	GAB	266	Gabon 	Gabon	\N
00040000-5562-2ccc-a5f3-5f5d7d7b245e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5562-2ccc-6f4a-89eec53852c4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5562-2ccc-c167-ec77cae51e41	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5562-2ccc-7967-a352afe9e4ad	GH	GHA	288	Ghana 	Gana	\N
00040000-5562-2ccc-8d6f-17f0c9e6abe6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5562-2ccc-458e-cd289969b741	GR	GRC	300	Greece 	Grčija	\N
00040000-5562-2ccc-274b-ab384a2270ef	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5562-2ccc-0514-8479bb93e709	GD	GRD	308	Grenada 	Grenada	\N
00040000-5562-2ccc-f206-9ce8fb155404	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5562-2ccc-c5de-74c9b33a698a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5562-2ccc-b4b8-20baa710a177	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5562-2ccc-8405-4818f0c033b3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5562-2ccc-5a70-babcdf0f9bc4	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5562-2ccc-a42e-bbc7270e290c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5562-2ccc-90b8-e0695807529c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5562-2ccc-35a9-fb7cfdc61c88	HT	HTI	332	Haiti 	Haiti	\N
00040000-5562-2ccc-7b1b-f1b28bebc30e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5562-2ccc-cb39-ce01600a0cf2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5562-2ccc-6451-f8a438cb7b32	HN	HND	340	Honduras 	Honduras	\N
00040000-5562-2ccc-4cbc-9a72cfec7433	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5562-2ccc-978e-d7818e446d04	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5562-2ccc-4fdb-063d106319dc	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5562-2ccc-f8d8-8d736d74423d	IN	IND	356	India 	Indija	\N
00040000-5562-2ccc-c705-6d941c8a6dfd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5562-2ccc-c59c-0ea993a503a7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5562-2ccc-ef0e-b8aa9b68c6ca	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5562-2ccc-9e48-8b0debc6a77d	IE	IRL	372	Ireland 	Irska	\N
00040000-5562-2ccc-9f28-46ee0374bae4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5562-2ccc-2e9a-f831900f5b99	IL	ISR	376	Israel 	Izrael	\N
00040000-5562-2ccc-27dc-bf80eb329d7e	IT	ITA	380	Italy 	Italija	\N
00040000-5562-2ccc-d4c2-924ddbe998b0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5562-2ccc-ca4e-ddea77ba062f	JP	JPN	392	Japan 	Japonska	\N
00040000-5562-2ccc-d04e-c744f020701a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5562-2ccc-e152-1b75e3de5369	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5562-2ccc-ceba-9425cab45a2a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5562-2ccc-7828-667478b5a6f3	KE	KEN	404	Kenya 	Kenija	\N
00040000-5562-2ccc-ba85-86aa62a5a28f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5562-2ccc-8f0a-803783921925	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5562-2ccc-85c2-912ccb6fc7e6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5562-2ccc-8459-372b8bb3c63f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5562-2ccc-a5f5-ddc14f8679ea	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5562-2ccc-a769-bea080a18313	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5562-2ccc-0cc3-d0b25fcdbb3e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5562-2ccc-7637-c8636c661e60	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5562-2ccc-f4e9-83074372d547	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5562-2ccc-c652-ef69771bd22c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5562-2ccc-88af-eb0bff12d430	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5562-2ccc-9db3-ee2964164e5d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5562-2ccc-9baf-3250892114ab	LT	LTU	440	Lithuania 	Litva	\N
00040000-5562-2ccc-b0cc-25b0ccc6fa6b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5562-2ccc-2e58-3ba08722f2a6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5562-2ccc-eb1b-dab4d3084adb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5562-2ccc-4b0b-3c911a308500	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5562-2ccc-2924-de0c1b6c8ec5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5562-2ccc-672d-3ce4aead916b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5562-2ccc-614b-3405a2d18bb3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5562-2ccc-b346-289d3eaa79b5	ML	MLI	466	Mali 	Mali	\N
00040000-5562-2ccc-36ef-f86173020fa2	MT	MLT	470	Malta 	Malta	\N
00040000-5562-2ccc-a0d4-5526d9984eb3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5562-2ccc-8707-d25a7e22e674	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5562-2ccc-b731-6f770d3beb2f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5562-2ccc-86f4-67daa1590fd0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5562-2ccc-bc65-fbf8f423d3fd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5562-2ccc-0361-7734ffef5ef1	MX	MEX	484	Mexico 	Mehika	\N
00040000-5562-2ccc-c02b-90416a2906de	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5562-2ccc-f5ce-617ba71aa7c9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5562-2ccc-adda-1bb0aed6bbd0	MC	MCO	492	Monaco 	Monako	\N
00040000-5562-2ccc-8ed4-430e11a8675d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5562-2ccc-2207-25cfbc387a7a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5562-2ccc-080e-37709b8cc197	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5562-2ccc-ba3b-785fb8b3d2e4	MA	MAR	504	Morocco 	Maroko	\N
00040000-5562-2ccc-019e-2c3b3028a16c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5562-2ccc-1f4b-a0e1dc923af8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5562-2ccc-e6d2-c8d3988394d1	NA	NAM	516	Namibia 	Namibija	\N
00040000-5562-2ccc-4d51-b4cdab79aa92	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5562-2ccc-0735-6137af037643	NP	NPL	524	Nepal 	Nepal	\N
00040000-5562-2ccc-52c4-1e1ca1cf0ab2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5562-2ccc-cb6a-bb6860dd75b6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5562-2ccc-a8fd-4a7dda421bd7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5562-2ccc-8eb6-62e01eb8f3cf	NE	NER	562	Niger 	Niger 	\N
00040000-5562-2ccc-6c49-c2f179a48679	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5562-2ccc-30e6-34aa314a5acf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5562-2ccc-3bbc-33877e6504ae	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5562-2ccc-ee98-709a6d37b2ba	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5562-2ccc-8c13-c8123fe5a36f	NO	NOR	578	Norway 	Norveška	\N
00040000-5562-2ccc-4310-c5a9df072b9c	OM	OMN	512	Oman 	Oman	\N
00040000-5562-2ccc-cecd-3916cb0f343c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5562-2ccc-5c30-a890feec3772	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5562-2ccc-8d73-786ac904e9bc	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5562-2ccc-ada4-c9570f7ab801	PA	PAN	591	Panama 	Panama	\N
00040000-5562-2ccc-daa2-e72f04de3f47	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5562-2ccc-0df9-f0f1c1b02446	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5562-2ccc-56db-3c4b15504d97	PE	PER	604	Peru 	Peru	\N
00040000-5562-2ccc-cd35-2b170c1ed460	PH	PHL	608	Philippines 	Filipini	\N
00040000-5562-2ccc-fdf6-0a43a68b7036	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5562-2ccc-de2e-f4b277431a0d	PL	POL	616	Poland 	Poljska	\N
00040000-5562-2ccc-c8c6-f5bde4ce919f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5562-2ccc-de20-808c5fcc2827	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5562-2ccc-5e31-d88b95f31aa9	QA	QAT	634	Qatar 	Katar	\N
00040000-5562-2ccc-64fa-94d010fef258	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5562-2ccc-395a-835071b29cbc	RO	ROU	642	Romania 	Romunija	\N
00040000-5562-2ccc-f4c0-029305e9b98d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5562-2ccc-0193-72b17320e9b3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5562-2ccc-e006-322d6d90805a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5562-2ccc-57c7-c6727f893c54	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5562-2ccc-6b3d-52f048b4cb5f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5562-2ccc-b4c9-0268eb05a351	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5562-2ccc-ae56-d9b19340902d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5562-2ccc-a7f3-03aec082fdf3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5562-2ccc-df24-c9f4028d0c3f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5562-2ccc-e2b7-3e491d52bb1a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5562-2ccc-d2af-fa499b3bd61f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5562-2ccc-8c5e-6e399f901532	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5562-2ccc-7fcb-dece037cf02a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5562-2ccc-fce9-5ef802e3a6d1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5562-2ccc-6e52-a583fee4a760	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5562-2ccc-73e5-30c904b291ec	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5562-2ccc-c290-fd820c7ccb51	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5562-2ccc-35d7-e9780038a207	SG	SGP	702	Singapore 	Singapur	\N
00040000-5562-2ccc-0fcb-26e61b7b9571	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5562-2ccc-8270-e52dd9770dbe	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5562-2ccc-fe0d-85e84fe5bce5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5562-2ccc-6244-aa363353d7df	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5562-2ccc-cee2-8edc683f84d4	SO	SOM	706	Somalia 	Somalija	\N
00040000-5562-2ccc-afd4-00a2dc2be862	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5562-2ccc-4e7b-5cf997e8de22	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5562-2ccc-d271-dcf3f5c2f492	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5562-2ccc-ef9f-06f62f189e21	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5562-2ccc-021a-06a1260774c8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5562-2ccc-a9dd-8190f342ab67	SD	SDN	729	Sudan 	Sudan	\N
00040000-5562-2ccc-572b-b82880d0c240	SR	SUR	740	Suriname 	Surinam	\N
00040000-5562-2ccc-f5df-8ac8a0e417d2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5562-2ccc-ad17-342941066ccf	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5562-2ccc-66e2-18d18fb83f46	SE	SWE	752	Sweden 	Švedska	\N
00040000-5562-2ccc-ca3c-d1c312b86ae3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5562-2ccc-2175-b2ff7f009ce0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5562-2ccc-63dd-d079f59c4a41	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5562-2ccc-dcf8-bcc958749692	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5562-2ccc-f88e-d1437b135c4c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5562-2ccc-f499-8da21948e312	TH	THA	764	Thailand 	Tajska	\N
00040000-5562-2ccc-cbf7-0c8100c731fb	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5562-2ccc-c85f-2e6c50ca2dca	TG	TGO	768	Togo 	Togo	\N
00040000-5562-2ccc-f7b2-2322a9e5c991	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5562-2ccc-c3cb-e450fdecd37a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5562-2ccc-9b8a-21af5d10a972	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5562-2ccc-c612-3bd26ad09341	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5562-2ccc-f43f-f4d239581611	TR	TUR	792	Turkey 	Turčija	\N
00040000-5562-2ccc-0f32-9f9acfdc51fe	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5562-2ccc-b60e-572c130081d4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5562-2ccc-f05b-c067543af4fe	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5562-2ccc-d820-fab9d0a0d5c3	UG	UGA	800	Uganda 	Uganda	\N
00040000-5562-2ccc-486d-eb53e7cc415f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5562-2ccc-721b-abf646cb88eb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5562-2ccc-24ef-56b54d8daeae	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5562-2ccc-b54a-fd6c87459a2e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5562-2ccc-4b33-f9e556c67977	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5562-2ccc-b974-7ac906e10f30	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5562-2ccc-6ae5-befc5e40bdce	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5562-2ccc-78a2-af5ccf1fee4c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5562-2ccc-0d2a-2d20dbd746b5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5562-2ccc-c1a4-665c9d15b7e4	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5562-2ccc-34ae-d8f56acaad7b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5562-2ccc-3bc6-9c5d0356473e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5562-2ccc-ea19-5766a2dd575d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5562-2ccc-436c-fb05e0556a61	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5562-2ccc-372c-a30aff1a8e10	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5562-2ccc-cf0f-bd7829c36e13	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5562-2ccc-823d-39341e28bde7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3008 (class 0 OID 120918)
-- Dependencies: 217
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 120719)
-- Dependencies: 194
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 120726)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 35870)
-- Dependencies: 172
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 120773)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 120779)
-- Dependencies: 202
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 120573)
-- Dependencies: 183
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5562-2cce-68c9-0f2bc4059e3a	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5562-2cce-6ebc-d4fec7412f82	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5562-2cce-eddc-6759325a13c7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5562-2cce-0530-90f3cf84f91e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5562-2cce-2c44-0b409d924d47	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5562-2cce-1de5-327e5a390c1f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5562-2cce-19ed-d0b5391ac9c1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5562-2cce-082d-301d473d0a34	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5562-2cce-9ab0-9de8316e8318	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5562-2cce-dcf5-abea76bc642d	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5562-2cce-e914-8af87cb187bb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5562-2cce-bfb8-af94016962dd	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5562-2cce-f817-e359ea67809a	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5562-2cce-b777-a1582d86598a	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2975 (class 0 OID 120585)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5562-2cce-9352-c776037df46c	00000000-5562-2cce-2c44-0b409d924d47	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5562-2cce-0535-53d3523ffa71	00000000-5562-2cce-2c44-0b409d924d47	00010000-5562-2cce-010b-ce5a00f52a67	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5562-2cce-8dc7-41177460d9fd	00000000-5562-2cce-1de5-327e5a390c1f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2976 (class 0 OID 120596)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 120639)
-- Dependencies: 187
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 120490)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5562-2cce-21fd-b66724255f80	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5562-2cce-5a01-1ce5fc944959	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5562-2cce-9f4c-ec7ce234ecca	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5562-2cce-ffc8-43a79788b410	Abonma-read	Abonma - branje	f
00030000-5562-2cce-4125-9a9cb85c8eb9	Abonma-write	Abonma - spreminjanje	f
00030000-5562-2cce-8bf6-82747934ad25	Alternacija-read	Alternacija - branje	f
00030000-5562-2cce-a67a-2602348f5373	Alternacija-write	Alternacija - spreminjanje	f
00030000-5562-2cce-d832-97639b299d81	Arhivalija-read	Arhivalija - branje	f
00030000-5562-2cce-c545-3c92c77e9e25	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5562-2cce-cf3f-0ff181b0367c	Besedilo-read	Besedilo - branje	f
00030000-5562-2cce-8c7b-4f428cea4d4b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5562-2cce-a986-074add68ea7f	DogodekIzven-read	DogodekIzven - branje	f
00030000-5562-2cce-3cfc-3fbbb6c285f4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5562-2cce-d48c-04cb38273aa9	Dogodek-read	Dogodek - branje	f
00030000-5562-2cce-68a0-62172d669d9c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5562-2cce-5644-339e8ba1de43	Drzava-read	Drzava - branje	f
00030000-5562-2cce-e0b6-8f26e32a5b21	Drzava-write	Drzava - spreminjanje	f
00030000-5562-2cce-37ec-0c011c1b56e6	Funkcija-read	Funkcija - branje	f
00030000-5562-2cce-1885-1df15c3e6166	Funkcija-write	Funkcija - spreminjanje	f
00030000-5562-2cce-7f69-48ea2773fb18	Gostovanje-read	Gostovanje - branje	f
00030000-5562-2cce-7aec-cb3efe6a99e0	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5562-2cce-b3b2-1a02a87fc263	Gostujoca-read	Gostujoca - branje	f
00030000-5562-2cce-dce1-64ef5d9d1648	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5562-2cce-0b61-b95c1260754b	Kupec-read	Kupec - branje	f
00030000-5562-2cce-cb20-6538ef456536	Kupec-write	Kupec - spreminjanje	f
00030000-5562-2cce-2e9d-cbd28163934b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5562-2cce-2630-2f0cee1413dd	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5562-2cce-6562-22db9a821cd6	Option-read	Option - branje	f
00030000-5562-2cce-a318-8a700bcd9c01	Option-write	Option - spreminjanje	f
00030000-5562-2cce-6bf7-d4334988aa8b	OptionValue-read	OptionValue - branje	f
00030000-5562-2cce-b0b4-4c27d137a8b6	OptionValue-write	OptionValue - spreminjanje	f
00030000-5562-2cce-77c2-845afb2d13fa	Oseba-read	Oseba - branje	f
00030000-5562-2cce-081b-d17805ba85d9	Oseba-write	Oseba - spreminjanje	f
00030000-5562-2cce-20af-a5ad3ad20530	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5562-2cce-b9aa-435b26d16812	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5562-2cce-db2b-21dc15b70e69	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5562-2cce-de55-30698294bff5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5562-2cce-75b9-1255636d25dd	Pogodba-read	Pogodba - branje	f
00030000-5562-2cce-d04c-b083b90d04ac	Pogodba-write	Pogodba - spreminjanje	f
00030000-5562-2cce-e8f8-af9d799ac4d6	Popa-read	Popa - branje	f
00030000-5562-2cce-722f-db765ddbb8b1	Popa-write	Popa - spreminjanje	f
00030000-5562-2cce-260e-db02276e64cc	Posta-read	Posta - branje	f
00030000-5562-2cce-63f3-4e948b2d29ca	Posta-write	Posta - spreminjanje	f
00030000-5562-2cce-9613-b08ffe1674a8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5562-2cce-6867-bc1592bcc38c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5562-2cce-53e4-a3297d69bea9	PostniNaslov-read	PostniNaslov - branje	f
00030000-5562-2cce-8ea1-a79e9ab08732	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5562-2cce-4797-1412d3291200	Predstava-read	Predstava - branje	f
00030000-5562-2cce-996c-2fb93a511504	Predstava-write	Predstava - spreminjanje	f
00030000-5562-2cce-a201-3fafcf89412b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5562-2cce-f08b-041c8108356c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5562-2cce-d4ee-30d220911e06	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5562-2cce-cf20-daa4943b7e6e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5562-2cce-e666-f57c65013de2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5562-2cce-eed1-ada6be6910c1	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5562-2cce-7915-e9eae4d97b62	Prostor-read	Prostor - branje	f
00030000-5562-2cce-9463-e4679892786d	Prostor-write	Prostor - spreminjanje	f
00030000-5562-2cce-14a5-95a785332f52	Racun-read	Racun - branje	f
00030000-5562-2cce-9473-9a7d74e467b0	Racun-write	Racun - spreminjanje	f
00030000-5562-2cce-b0d2-963e17211a5f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5562-2cce-10a0-93937bda03d9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5562-2cce-f00a-4aceac42891c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5562-2cce-fe59-ab0e64e7fe2e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5562-2cce-56d5-f71f6fd1889f	Rekvizit-read	Rekvizit - branje	f
00030000-5562-2cce-87b9-f1f67dde3d38	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5562-2cce-8aec-f2786db6c29d	Rezervacija-read	Rezervacija - branje	f
00030000-5562-2cce-fd94-2929816accc9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5562-2cce-133e-dc8336803937	SedezniRed-read	SedezniRed - branje	f
00030000-5562-2cce-bab3-5bc22e326e7a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5562-2cce-4a1b-51217f182f4d	Sedez-read	Sedez - branje	f
00030000-5562-2cce-4f8d-8754f6bc0b77	Sedez-write	Sedez - spreminjanje	f
00030000-5562-2cce-2d08-cab7dcd1a904	Sezona-read	Sezona - branje	f
00030000-5562-2cce-4161-c57b618dbce5	Sezona-write	Sezona - spreminjanje	f
00030000-5562-2cce-e516-a884ca3fa242	Telefonska-read	Telefonska - branje	f
00030000-5562-2cce-9ce8-b0dae17a2f1f	Telefonska-write	Telefonska - spreminjanje	f
00030000-5562-2cce-8a2f-ddb27c102d13	TerminStoritve-read	TerminStoritve - branje	f
00030000-5562-2cce-552c-18b2f80c59be	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5562-2cce-75d6-f35485d687c9	TipFunkcije-read	TipFunkcije - branje	f
00030000-5562-2cce-f15a-b6ab8b1f98bb	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5562-2cce-bd29-44c0cf60b8fa	Trr-read	Trr - branje	f
00030000-5562-2cce-4901-1e902b6cb84e	Trr-write	Trr - spreminjanje	f
00030000-5562-2cce-c743-ca682819e192	Uprizoritev-read	Uprizoritev - branje	f
00030000-5562-2cce-9d03-73454a602bfd	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5562-2cce-d07f-3467111ccf2e	Vaja-read	Vaja - branje	f
00030000-5562-2cce-4545-e6848a9829a7	Vaja-write	Vaja - spreminjanje	f
00030000-5562-2cce-5b0f-a4961fb03b5c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5562-2cce-5e49-d6bf597ad0a2	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5562-2cce-aaf2-7a3cc2e3ceb7	Zaposlitev-read	Zaposlitev - branje	f
00030000-5562-2cce-27c2-f42c2214db90	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5562-2cce-4ac0-7be7ee5a82a3	Zasedenost-read	Zasedenost - branje	f
00030000-5562-2cce-b476-68ac7f8b70d7	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5562-2cce-2a41-0184bcd64b5f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5562-2cce-932e-55dc90c09ae3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5562-2cce-dd93-f3db72f59b0e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5562-2cce-4153-a0435d1b5457	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2969 (class 0 OID 120520)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5562-2cce-2c3e-5d848dcbae78	00030000-5562-2cce-5644-339e8ba1de43
00020000-5562-2cce-2c84-be590529ad31	00030000-5562-2cce-e0b6-8f26e32a5b21
00020000-5562-2cce-2c84-be590529ad31	00030000-5562-2cce-5644-339e8ba1de43
\.


--
-- TOC entry 2994 (class 0 OID 120786)
-- Dependencies: 203
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 120793)
-- Dependencies: 204
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 120932)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 120619)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5562-2cd5-f00f-f6ed575d9fdd	00040000-5562-2ccc-3e8f-24fc1f5ec423	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5562-2cd5-9243-7a79e4a78ff1	00040000-5562-2ccc-3e8f-24fc1f5ec423	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2979 (class 0 OID 120646)
-- Dependencies: 188
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5562-2ccd-62b0-cfdd29778346	8341	Adlešiči
00050000-5562-2ccd-0f67-244687bbb5eb	5270	Ajdovščina
00050000-5562-2ccd-c7f2-38a60bed1782	6280	Ankaran/Ancarano
00050000-5562-2ccd-d712-fb37bc5e6f57	9253	Apače
00050000-5562-2ccd-c4ac-45bba30ab453	8253	Artiče
00050000-5562-2ccd-0b24-9895ec003fdb	4275	Begunje na Gorenjskem
00050000-5562-2ccd-d51e-ea93b0448611	1382	Begunje pri Cerknici
00050000-5562-2ccd-3eea-caf6c724cd81	9231	Beltinci
00050000-5562-2ccd-c910-ac109f594e12	2234	Benedikt
00050000-5562-2ccd-59ba-a35d466e4982	2345	Bistrica ob Dravi
00050000-5562-2ccd-ce21-d4516209c8de	3256	Bistrica ob Sotli
00050000-5562-2ccd-ee2a-2336c79c1c6c	8259	Bizeljsko
00050000-5562-2ccd-b7b6-0510a86cf514	1223	Blagovica
00050000-5562-2ccd-72f9-bb14e82962a5	8283	Blanca
00050000-5562-2ccd-061f-8c4ae66d7aa1	4260	Bled
00050000-5562-2ccd-42d3-568302b1fe1a	4273	Blejska Dobrava
00050000-5562-2ccd-ce79-1e6615dabb06	9265	Bodonci
00050000-5562-2ccd-9f6f-64ad7cd65045	9222	Bogojina
00050000-5562-2ccd-4210-e90bbf8dc256	4263	Bohinjska Bela
00050000-5562-2ccd-421f-d2a9ea3cd72f	4264	Bohinjska Bistrica
00050000-5562-2ccd-b5a4-a72e62b34759	4265	Bohinjsko jezero
00050000-5562-2ccd-1ba0-79a40aa125a9	1353	Borovnica
00050000-5562-2ccd-972d-866950a18477	8294	Boštanj
00050000-5562-2ccd-0359-0c25a24fea1d	5230	Bovec
00050000-5562-2ccd-88f7-0e4fe2d2acd5	5295	Branik
00050000-5562-2ccd-11e8-908dca92af76	3314	Braslovče
00050000-5562-2ccd-9b04-a6ceb9a539ac	5223	Breginj
00050000-5562-2ccd-83f4-cce0a8cf3fd4	8280	Brestanica
00050000-5562-2ccd-7bc4-9100af16e88a	2354	Bresternica
00050000-5562-2ccd-3d73-92c7646bc316	4243	Brezje
00050000-5562-2ccd-ca76-6163d25f4296	1351	Brezovica pri Ljubljani
00050000-5562-2ccd-ec13-afa8578d48a1	8250	Brežice
00050000-5562-2ccd-b097-f301c96c54f8	4210	Brnik - Aerodrom
00050000-5562-2ccd-2d54-a16eeefe1cb3	8321	Brusnice
00050000-5562-2ccd-c37c-5b02b3f7d3b7	3255	Buče
00050000-5562-2ccd-67da-ed79c991a78b	8276	Bučka 
00050000-5562-2ccd-e5b3-c6fb694470b2	9261	Cankova
00050000-5562-2ccd-46ee-98b1152e061c	3000	Celje 
00050000-5562-2ccd-297a-2bb5d2fa32db	3001	Celje - poštni predali
00050000-5562-2ccd-db4f-8496b8a65052	4207	Cerklje na Gorenjskem
00050000-5562-2ccd-1c5a-2e01edc4093a	8263	Cerklje ob Krki
00050000-5562-2ccd-0bff-750cc92b31ed	1380	Cerknica
00050000-5562-2ccd-3426-868e06522ec8	5282	Cerkno
00050000-5562-2ccd-65e8-12e3a9817584	2236	Cerkvenjak
00050000-5562-2ccd-2b48-a78b2fb453ac	2215	Ceršak
00050000-5562-2ccd-50c2-c25f31373a20	2326	Cirkovce
00050000-5562-2ccd-88de-943fc9694db7	2282	Cirkulane
00050000-5562-2ccd-cbe4-db2c337d2398	5273	Col
00050000-5562-2ccd-fdc3-6afc73a7588c	8251	Čatež ob Savi
00050000-5562-2ccd-1833-5c94454f8f2c	1413	Čemšenik
00050000-5562-2ccd-c03b-bf461dc011de	5253	Čepovan
00050000-5562-2ccd-65f4-081e7b4de6f6	9232	Črenšovci
00050000-5562-2ccd-71f8-110bd63d6f1d	2393	Črna na Koroškem
00050000-5562-2ccd-bb79-4a26c41281e4	6275	Črni Kal
00050000-5562-2ccd-2fb4-41898e719041	5274	Črni Vrh nad Idrijo
00050000-5562-2ccd-a300-443494d7c756	5262	Črniče
00050000-5562-2ccd-1713-98c2eed1f1db	8340	Črnomelj
00050000-5562-2ccd-6724-43d501066c5e	6271	Dekani
00050000-5562-2ccd-a185-367ee2c0f7d6	5210	Deskle
00050000-5562-2ccd-b325-857ce01dedbf	2253	Destrnik
00050000-5562-2ccd-7df0-fbe045069f33	6215	Divača
00050000-5562-2ccd-c546-f0f545717110	1233	Dob
00050000-5562-2ccd-b97d-6a2cd97d2839	3224	Dobje pri Planini
00050000-5562-2ccd-8fb1-13e1b340a6a9	8257	Dobova
00050000-5562-2ccd-3ead-28847caa6ba1	1423	Dobovec
00050000-5562-2ccd-92a9-fb715d9cd54d	5263	Dobravlje
00050000-5562-2ccd-9208-89599d073369	3204	Dobrna
00050000-5562-2ccd-f694-c756b79ebe8e	8211	Dobrnič
00050000-5562-2ccd-69b5-5c48ade9b84f	1356	Dobrova
00050000-5562-2ccd-2c51-11dd7b327031	9223	Dobrovnik/Dobronak 
00050000-5562-2ccd-be1f-4ca74aba5efb	5212	Dobrovo v Brdih
00050000-5562-2ccd-01e2-dd9b89444b10	1431	Dol pri Hrastniku
00050000-5562-2ccd-daf6-5b2f2c45e0e1	1262	Dol pri Ljubljani
00050000-5562-2ccd-3712-de8a2a03963b	1273	Dole pri Litiji
00050000-5562-2ccd-cea1-a5e8f3b84178	1331	Dolenja vas
00050000-5562-2ccd-b178-19d94d08c269	8350	Dolenjske Toplice
00050000-5562-2ccd-6c62-eddadc8e216f	1230	Domžale
00050000-5562-2ccd-60ff-2a4832573565	2252	Dornava
00050000-5562-2ccd-cced-2a3efe6dd26e	5294	Dornberk
00050000-5562-2ccd-d0d0-db4d8051b7ea	1319	Draga
00050000-5562-2ccd-004b-84a1fc40cc96	8343	Dragatuš
00050000-5562-2ccd-925f-4416911e84c0	3222	Dramlje
00050000-5562-2ccd-b850-de41bbf47972	2370	Dravograd
00050000-5562-2ccd-9e75-10affbbe7050	4203	Duplje
00050000-5562-2ccd-8d08-cab64f511fa3	6221	Dutovlje
00050000-5562-2ccd-b91c-bfa01954f3bd	8361	Dvor
00050000-5562-2ccd-921b-8b12089b48af	2343	Fala
00050000-5562-2ccd-ea2c-ff2df419cb9a	9208	Fokovci
00050000-5562-2ccd-e0e9-574f361306ec	2313	Fram
00050000-5562-2ccd-6aec-2f49ecf2004e	3213	Frankolovo
00050000-5562-2ccd-51ef-3927c368ab28	1274	Gabrovka
00050000-5562-2ccd-e52d-0458f38a3e0c	8254	Globoko
00050000-5562-2ccd-1f49-156b6e16968f	5275	Godovič
00050000-5562-2ccd-6666-13654d1b0d28	4204	Golnik
00050000-5562-2ccd-345f-9166302c3508	3303	Gomilsko
00050000-5562-2ccd-07d5-f1f9497cadb4	4224	Gorenja vas
00050000-5562-2ccd-1d65-806476fdfaf0	3263	Gorica pri Slivnici
00050000-5562-2ccd-da41-8cc0b7c2164e	2272	Gorišnica
00050000-5562-2ccd-cdd9-133d42e35dee	9250	Gornja Radgona
00050000-5562-2ccd-1e1a-995f7cfa9230	3342	Gornji Grad
00050000-5562-2ccd-76f0-3cb28311391b	4282	Gozd Martuljek
00050000-5562-2ccd-252f-fb1641efb1bd	6272	Gračišče
00050000-5562-2ccd-2768-ca3a3e56dab8	9264	Grad
00050000-5562-2ccd-c193-30cb971b668e	8332	Gradac
00050000-5562-2ccd-5db3-91604d36c1eb	1384	Grahovo
00050000-5562-2ccd-1977-66f1f274ac48	5242	Grahovo ob Bači
00050000-5562-2ccd-5c1b-e9227e3bc674	5251	Grgar
00050000-5562-2ccd-bab6-f744059e7a8b	3302	Griže
00050000-5562-2ccd-d410-2e7debaea3c2	3231	Grobelno
00050000-5562-2ccd-9db6-ad99d6703508	1290	Grosuplje
00050000-5562-2ccd-1bf2-c6a1dec67f71	2288	Hajdina
00050000-5562-2ccd-1881-5896594b0216	8362	Hinje
00050000-5562-2ccd-4713-18c388d8144b	2311	Hoče
00050000-5562-2ccd-9d43-5bd7dffc24da	9205	Hodoš/Hodos
00050000-5562-2ccd-8437-82a0145fb3a2	1354	Horjul
00050000-5562-2ccd-5426-943838bb7925	1372	Hotedršica
00050000-5562-2ccd-d8c6-0d0c4fc63ac5	1430	Hrastnik
00050000-5562-2ccd-1741-3e113a19ca70	6225	Hruševje
00050000-5562-2ccd-80cf-f1a695783695	4276	Hrušica
00050000-5562-2ccd-b16a-a0fe4b72402a	5280	Idrija
00050000-5562-2ccd-8b50-b7ee30493558	1292	Ig
00050000-5562-2ccd-619b-7e8f5c2a61e8	6250	Ilirska Bistrica
00050000-5562-2ccd-002e-f9d8ed38f929	6251	Ilirska Bistrica-Trnovo
00050000-5562-2ccd-6743-6b936581284e	1295	Ivančna Gorica
00050000-5562-2ccd-5cf6-5627a1878a04	2259	Ivanjkovci
00050000-5562-2ccd-e6ca-d93d93fae5cf	1411	Izlake
00050000-5562-2ccd-7055-86c639566510	6310	Izola/Isola
00050000-5562-2ccd-26ca-37169493a8b1	2222	Jakobski Dol
00050000-5562-2ccd-90ab-20e8f75985f4	2221	Jarenina
00050000-5562-2ccd-98de-7dbdc1821c30	6254	Jelšane
00050000-5562-2ccd-4bbd-a12f70a404b0	4270	Jesenice
00050000-5562-2ccd-c578-ef3172a59e48	8261	Jesenice na Dolenjskem
00050000-5562-2ccd-9b06-996e3d97607a	3273	Jurklošter
00050000-5562-2ccd-ffc5-d21e1ea77687	2223	Jurovski Dol
00050000-5562-2ccd-8cb4-e94c3f148a2f	2256	Juršinci
00050000-5562-2ccd-cb4c-0934e3a270d0	5214	Kal nad Kanalom
00050000-5562-2ccd-bcbc-1327ca733ab0	3233	Kalobje
00050000-5562-2ccd-de7a-a53b8fd24a91	4246	Kamna Gorica
00050000-5562-2ccd-4a91-8ad7889f2b4a	2351	Kamnica
00050000-5562-2ccd-58ff-bc7b7b1b7dcd	1241	Kamnik
00050000-5562-2ccd-4ec7-e603d85da238	5213	Kanal
00050000-5562-2ccd-2ab7-8874f1725f6d	8258	Kapele
00050000-5562-2ccd-02fd-b5ca7bed0203	2362	Kapla
00050000-5562-2ccd-0316-8cd5375ac524	2325	Kidričevo
00050000-5562-2ccd-d9ca-847930e57b57	1412	Kisovec
00050000-5562-2ccd-5cb7-f691c3c29d22	6253	Knežak
00050000-5562-2ccd-8a51-6c710e5464e9	5222	Kobarid
00050000-5562-2ccd-0627-03f883ddc983	9227	Kobilje
00050000-5562-2ccd-8d08-6d1729d2ed02	1330	Kočevje
00050000-5562-2ccd-c20e-a5be35f599ec	1338	Kočevska Reka
00050000-5562-2ccd-6bd3-962f57b4b46c	2276	Kog
00050000-5562-2ccd-1719-2c21cdd62057	5211	Kojsko
00050000-5562-2ccd-924c-772897e23581	6223	Komen
00050000-5562-2ccd-f9d1-dcfeccf5efe2	1218	Komenda
00050000-5562-2ccd-9ebd-005c8c583519	6000	Koper/Capodistria 
00050000-5562-2ccd-884f-ed3b9a05a092	6001	Koper/Capodistria - poštni predali
00050000-5562-2ccd-350f-abb568dcec4d	8282	Koprivnica
00050000-5562-2ccd-06b6-cc51530d6f6e	5296	Kostanjevica na Krasu
00050000-5562-2ccd-74dc-26631b6be407	8311	Kostanjevica na Krki
00050000-5562-2ccd-47d6-c80966c89251	1336	Kostel
00050000-5562-2ccd-252b-5e9381ecd0ce	6256	Košana
00050000-5562-2ccd-7727-20cadda043c1	2394	Kotlje
00050000-5562-2ccd-3c1a-b26033edf36f	6240	Kozina
00050000-5562-2ccd-154c-302256510c4b	3260	Kozje
00050000-5562-2ccd-7315-0636d2ef7481	4000	Kranj 
00050000-5562-2ccd-5c1b-357187573219	4001	Kranj - poštni predali
00050000-5562-2ccd-f198-a0f65f1ac539	4280	Kranjska Gora
00050000-5562-2ccd-351a-2971cac3aa89	1281	Kresnice
00050000-5562-2ccd-1850-d87acf93213d	4294	Križe
00050000-5562-2ccd-756a-9dfc7ce0855f	9206	Križevci
00050000-5562-2ccd-be1c-648591b0214c	9242	Križevci pri Ljutomeru
00050000-5562-2ccd-78d4-8b53c0bcc8d9	1301	Krka
00050000-5562-2ccd-ef8c-0bca250ce945	8296	Krmelj
00050000-5562-2ccd-bfee-e403a8f34538	4245	Kropa
00050000-5562-2ccd-1d80-b388a1a6beea	8262	Krška vas
00050000-5562-2ccd-1f90-b1867f26bfeb	8270	Krško
00050000-5562-2ccd-b632-5b1ba4829221	9263	Kuzma
00050000-5562-2ccd-8973-6c3fcf5960aa	2318	Laporje
00050000-5562-2ccd-96cd-f1c52aedd3c8	3270	Laško
00050000-5562-2ccd-10f2-47d3664b51c1	1219	Laze v Tuhinju
00050000-5562-2ccd-a21b-7b319f6d3ecb	2230	Lenart v Slovenskih goricah
00050000-5562-2ccd-f822-47104c3ef5c9	9220	Lendava/Lendva
00050000-5562-2ccd-9398-0f2a2d8451f2	4248	Lesce
00050000-5562-2ccd-9c13-a91727be3626	3261	Lesično
00050000-5562-2ccd-bc35-9f1901816d3d	8273	Leskovec pri Krškem
00050000-5562-2ccd-49a3-d052dd23a59a	2372	Libeliče
00050000-5562-2ccd-0786-648fea91ae2c	2341	Limbuš
00050000-5562-2ccd-33bb-2e6bf194aa6b	1270	Litija
00050000-5562-2ccd-bcbc-fb48f8e59655	3202	Ljubečna
00050000-5562-2ccd-99d3-b646d963aa68	1000	Ljubljana 
00050000-5562-2ccd-2785-b4cd8f0cc4c2	1001	Ljubljana - poštni predali
00050000-5562-2ccd-b2f9-f9f481a847bc	1231	Ljubljana - Črnuče
00050000-5562-2ccd-16b0-df4cd9d0e3aa	1261	Ljubljana - Dobrunje
00050000-5562-2ccd-a35f-7b6bc0fc07ce	1260	Ljubljana - Polje
00050000-5562-2ccd-6ec1-c484a5f5ac38	1210	Ljubljana - Šentvid
00050000-5562-2ccd-788b-0ef10bc5961a	1211	Ljubljana - Šmartno
00050000-5562-2ccd-7d78-aa941ec487fd	3333	Ljubno ob Savinji
00050000-5562-2ccd-3cc3-e733a6c2c5f0	9240	Ljutomer
00050000-5562-2ccd-8b8c-e45c83d0893e	3215	Loče
00050000-5562-2ccd-28e5-16a6eff6f84d	5231	Log pod Mangartom
00050000-5562-2ccd-5794-931372a0a82a	1358	Log pri Brezovici
00050000-5562-2ccd-4cc9-8342aa50c246	1370	Logatec
00050000-5562-2ccd-e660-c2b9c06b8cbc	1371	Logatec
00050000-5562-2ccd-26c3-a155b4e45d3e	1434	Loka pri Zidanem Mostu
00050000-5562-2ccd-86f3-bce0be8a3665	3223	Loka pri Žusmu
00050000-5562-2ccd-84de-d597f5901f80	6219	Lokev
00050000-5562-2ccd-f9e9-71cefdd6412a	1318	Loški Potok
00050000-5562-2ccd-e01e-8d6dd343e395	2324	Lovrenc na Dravskem polju
00050000-5562-2ccd-7f45-0f40bfdf1e06	2344	Lovrenc na Pohorju
00050000-5562-2ccd-58a4-213a0eea648c	3334	Luče
00050000-5562-2ccd-cf6b-28e245e99e1b	1225	Lukovica
00050000-5562-2ccd-0c2f-565d700aef1e	9202	Mačkovci
00050000-5562-2ccd-850c-e29d11f69433	2322	Majšperk
00050000-5562-2ccd-82d3-1a2fdbe0d0d9	2321	Makole
00050000-5562-2ccd-73e9-729e24e3f5df	9243	Mala Nedelja
00050000-5562-2ccd-2a30-0b717b86c54b	2229	Malečnik
00050000-5562-2ccd-1955-1ddcb982d198	6273	Marezige
00050000-5562-2ccd-6dbe-280cf564eb84	2000	Maribor 
00050000-5562-2ccd-75d8-13d999deb5be	2001	Maribor - poštni predali
00050000-5562-2ccd-0756-e97be8d6a5d5	2206	Marjeta na Dravskem polju
00050000-5562-2ccd-b15e-7a21d7279ee4	2281	Markovci
00050000-5562-2ccd-3a9a-c8d7d0c19a9d	9221	Martjanci
00050000-5562-2ccd-10dd-e44d8ab6ea6c	6242	Materija
00050000-5562-2ccd-b1b1-a4da08e1bed4	4211	Mavčiče
00050000-5562-2ccd-a501-18be6ef12458	1215	Medvode
00050000-5562-2ccd-9a74-8e2ffcf364c7	1234	Mengeš
00050000-5562-2ccd-be66-018c82ce305e	8330	Metlika
00050000-5562-2ccd-8117-a208c15063c1	2392	Mežica
00050000-5562-2ccd-0c9a-c71d98f2f371	2204	Miklavž na Dravskem polju
00050000-5562-2ccd-99f4-9584edeb906e	2275	Miklavž pri Ormožu
00050000-5562-2ccd-bb05-d9398463f6f1	5291	Miren
00050000-5562-2ccd-73b7-782c9025ecef	8233	Mirna
00050000-5562-2ccd-061b-630acac0686c	8216	Mirna Peč
00050000-5562-2ccd-2973-a737702f11d7	2382	Mislinja
00050000-5562-2ccd-6f9b-552ed98de0ec	4281	Mojstrana
00050000-5562-2ccd-bfe9-d17b8af5acec	8230	Mokronog
00050000-5562-2ccd-d543-d79a44cbf969	1251	Moravče
00050000-5562-2ccd-74a5-8b8309252166	9226	Moravske Toplice
00050000-5562-2ccd-a3d3-a0a817c57ecf	5216	Most na Soči
00050000-5562-2ccd-c81f-a0eba1710829	1221	Motnik
00050000-5562-2ccd-2fa4-35baa00d6d85	3330	Mozirje
00050000-5562-2ccd-2b44-553b62a4b443	9000	Murska Sobota 
00050000-5562-2ccd-5a63-633fa69a37cc	9001	Murska Sobota - poštni predali
00050000-5562-2ccd-fa9a-b6fee6130fb0	2366	Muta
00050000-5562-2ccd-8275-60353a13f262	4202	Naklo
00050000-5562-2ccd-b788-7db13be8bdb5	3331	Nazarje
00050000-5562-2ccd-8925-4ad3685be2c9	1357	Notranje Gorice
00050000-5562-2ccd-bc11-da7170cfa258	3203	Nova Cerkev
00050000-5562-2ccd-c9eb-8c7aafbb1a54	5000	Nova Gorica 
00050000-5562-2ccd-2957-c3f24da07f97	5001	Nova Gorica - poštni predali
00050000-5562-2ccd-6eac-44fe33f0dd6a	1385	Nova vas
00050000-5562-2ccd-716a-7ad71ba23bf6	8000	Novo mesto
00050000-5562-2ccd-aab0-0540c5a93006	8001	Novo mesto - poštni predali
00050000-5562-2ccd-7d30-ddc1a42febc2	6243	Obrov
00050000-5562-2ccd-1c91-5cd9cdbcf4f7	9233	Odranci
00050000-5562-2ccd-49c4-c5f98cc35535	2317	Oplotnica
00050000-5562-2ccd-6849-deb125af2fd4	2312	Orehova vas
00050000-5562-2ccd-0097-24df240ab394	2270	Ormož
00050000-5562-2ccd-450e-535baa8454cc	1316	Ortnek
00050000-5562-2ccd-94f5-87e4449bba2d	1337	Osilnica
00050000-5562-2ccd-2005-942f4a91f8dc	8222	Otočec
00050000-5562-2ccd-66da-3777f6ae5b28	2361	Ožbalt
00050000-5562-2ccd-4fbe-dad075872814	2231	Pernica
00050000-5562-2ccd-11bb-3018f8955173	2211	Pesnica pri Mariboru
00050000-5562-2ccd-c5f2-c204b5888f8c	9203	Petrovci
00050000-5562-2ccd-5b1e-183f6e2fa037	3301	Petrovče
00050000-5562-2ccd-4554-897e4d19d048	6330	Piran/Pirano
00050000-5562-2ccd-f2bc-5cc5e479efa9	8255	Pišece
00050000-5562-2ccd-e34b-bcbd5e45cdd9	6257	Pivka
00050000-5562-2ccd-4b46-4cc1148f4a90	6232	Planina
00050000-5562-2ccd-688c-cf36ed98434d	3225	Planina pri Sevnici
00050000-5562-2ccd-8374-1d82e7de09f3	6276	Pobegi
00050000-5562-2ccd-6c33-dc6f7dd7da05	8312	Podbočje
00050000-5562-2ccd-7d4d-a40dd6e0753b	5243	Podbrdo
00050000-5562-2ccd-10aa-ea54935072e0	3254	Podčetrtek
00050000-5562-2ccd-e76f-a64a613e1e03	2273	Podgorci
00050000-5562-2ccd-1487-39437d843ff0	6216	Podgorje
00050000-5562-2ccd-e5fe-7df500506731	2381	Podgorje pri Slovenj Gradcu
00050000-5562-2ccd-ae75-dd4ae69df6c7	6244	Podgrad
00050000-5562-2ccd-591a-7fa7e8f4d9eb	1414	Podkum
00050000-5562-2ccd-dda5-c17ccde2d3d8	2286	Podlehnik
00050000-5562-2ccd-7151-80559a41608a	5272	Podnanos
00050000-5562-2ccd-127e-8e46b61bf3e4	4244	Podnart
00050000-5562-2ccd-2092-a72818932585	3241	Podplat
00050000-5562-2ccd-da82-f674c9d62196	3257	Podsreda
00050000-5562-2ccd-67b2-0ace326352c6	2363	Podvelka
00050000-5562-2ccd-dc45-6ccb56ddcb04	2208	Pohorje
00050000-5562-2ccd-6c66-9fa790dd6713	2257	Polenšak
00050000-5562-2ccd-3bde-e78cecba8c29	1355	Polhov Gradec
00050000-5562-2ccd-7320-5735c6a80133	4223	Poljane nad Škofjo Loko
00050000-5562-2ccd-fd80-5fdbde3cdaf2	2319	Poljčane
00050000-5562-2ccd-c56b-ccdd46f35141	1272	Polšnik
00050000-5562-2ccd-713d-2bd61d979b0d	3313	Polzela
00050000-5562-2ccd-7eb6-60d233391554	3232	Ponikva
00050000-5562-2ccd-5d28-ece6433d76c2	6320	Portorož/Portorose
00050000-5562-2ccd-0fa5-02cb66ad41c2	6230	Postojna
00050000-5562-2ccd-6c62-f908f0b36cd7	2331	Pragersko
00050000-5562-2ccd-2a8d-3867d011cc83	3312	Prebold
00050000-5562-2ccd-b7cd-04a2577105a8	4205	Preddvor
00050000-5562-2ccd-a1bd-b83c15f7ee41	6255	Prem
00050000-5562-2ccd-c125-a096aa1f144d	1352	Preserje
00050000-5562-2ccd-60bd-45048f832938	6258	Prestranek
00050000-5562-2ccd-d07f-64e8502b7b2d	2391	Prevalje
00050000-5562-2ccd-7f88-d6b910e260fc	3262	Prevorje
00050000-5562-2ccd-89ab-223dca30f813	1276	Primskovo 
00050000-5562-2ccd-ae2a-4bf1b0e7aac7	3253	Pristava pri Mestinju
00050000-5562-2ccd-c899-4cd626866941	9207	Prosenjakovci/Partosfalva
00050000-5562-2ccd-602e-56aea118c9a1	5297	Prvačina
00050000-5562-2ccd-02c3-6d04ab777654	2250	Ptuj
00050000-5562-2ccd-3748-627bb34be112	2323	Ptujska Gora
00050000-5562-2ccd-5dbe-25e6c7d78b71	9201	Puconci
00050000-5562-2ccd-e063-e2e01729ca85	2327	Rače
00050000-5562-2ccd-16e7-5adb16d53808	1433	Radeče
00050000-5562-2ccd-8522-17260499a93c	9252	Radenci
00050000-5562-2ccd-704a-5a692476480c	2360	Radlje ob Dravi
00050000-5562-2ccd-e13a-51be466c905b	1235	Radomlje
00050000-5562-2ccd-fb21-4ba421469caf	4240	Radovljica
00050000-5562-2ccd-b672-07323d060c1f	8274	Raka
00050000-5562-2ccd-5109-9207b5c876b0	1381	Rakek
00050000-5562-2ccd-7ca4-773c0270c61f	4283	Rateče - Planica
00050000-5562-2ccd-e936-75288ba8d7a3	2390	Ravne na Koroškem
00050000-5562-2ccd-eab2-f2332ba3ea8d	9246	Razkrižje
00050000-5562-2ccd-0b69-73b990c2c705	3332	Rečica ob Savinji
00050000-5562-2ccd-85d6-b021002acca3	5292	Renče
00050000-5562-2ccd-7ca7-70b848379af9	1310	Ribnica
00050000-5562-2ccd-3414-07d2d62270f2	2364	Ribnica na Pohorju
00050000-5562-2ccd-038d-ccbca2151ca4	3272	Rimske Toplice
00050000-5562-2ccd-b076-dddc8cb8ac2e	1314	Rob
00050000-5562-2ccd-ca76-abded42b47f4	5215	Ročinj
00050000-5562-2ccd-95e8-c8d989b134fd	3250	Rogaška Slatina
00050000-5562-2ccd-458b-04197d5bfc8f	9262	Rogašovci
00050000-5562-2ccd-55fc-779748f88a91	3252	Rogatec
00050000-5562-2ccd-27be-f7d1ab6ca0da	1373	Rovte
00050000-5562-2ccd-574b-e1ec4f6e7035	2342	Ruše
00050000-5562-2ccd-ccf8-a804ae778d5f	1282	Sava
00050000-5562-2ccd-1d06-590856f4c2ef	6333	Sečovlje/Sicciole
00050000-5562-2ccd-5e22-b3098b296233	4227	Selca
00050000-5562-2ccd-b395-9f0973027350	2352	Selnica ob Dravi
00050000-5562-2ccd-2a2a-2972cbf7c862	8333	Semič
00050000-5562-2ccd-3139-56bdd7a4230d	8281	Senovo
00050000-5562-2ccd-9904-7ff64d5174e2	6224	Senožeče
00050000-5562-2ccd-e934-74698f9cd7ab	8290	Sevnica
00050000-5562-2ccd-9c94-9b8dba80707e	6210	Sežana
00050000-5562-2ccd-7acd-416423e4d4b7	2214	Sladki Vrh
00050000-5562-2ccd-2c5d-eb0f2c3ef429	5283	Slap ob Idrijci
00050000-5562-2ccd-f676-3d05acaf850f	2380	Slovenj Gradec
00050000-5562-2ccd-b027-f8e246bce2aa	2310	Slovenska Bistrica
00050000-5562-2ccd-ec5d-8645ce6b4409	3210	Slovenske Konjice
00050000-5562-2ccd-524d-7e4466fc9d4f	1216	Smlednik
00050000-5562-2ccd-3e1e-03dda71cc54f	5232	Soča
00050000-5562-2ccd-62c0-17c2678b9f09	1317	Sodražica
00050000-5562-2ccd-9405-c83990104fca	3335	Solčava
00050000-5562-2ccd-af41-6de77543149b	5250	Solkan
00050000-5562-2ccd-1f0e-6362254b3795	4229	Sorica
00050000-5562-2ccd-4089-eeff0f550072	4225	Sovodenj
00050000-5562-2ccd-9e0b-28e84bd39d34	5281	Spodnja Idrija
00050000-5562-2ccd-0503-95a96a3fdf68	2241	Spodnji Duplek
00050000-5562-2ccd-e78e-de679d840e4b	9245	Spodnji Ivanjci
00050000-5562-2ccd-e50f-ffd53204d64a	2277	Središče ob Dravi
00050000-5562-2ccd-d063-0b8d481b511c	4267	Srednja vas v Bohinju
00050000-5562-2ccd-5756-9d3ab748cb9f	8256	Sromlje 
00050000-5562-2ccd-fdf1-46100961deed	5224	Srpenica
00050000-5562-2ccd-868b-130facecc802	1242	Stahovica
00050000-5562-2ccd-62ab-ef69de5f8a8e	1332	Stara Cerkev
00050000-5562-2ccd-e6fb-15a20a0577c6	8342	Stari trg ob Kolpi
00050000-5562-2ccd-b4b6-997b7884eb78	1386	Stari trg pri Ložu
00050000-5562-2ccd-ebf1-9a53e4f148ac	2205	Starše
00050000-5562-2ccd-98fd-127fcf15270c	2289	Stoperce
00050000-5562-2ccd-28a2-f4a9510b3ea4	8322	Stopiče
00050000-5562-2ccd-007c-3a7bf74df692	3206	Stranice
00050000-5562-2ccd-0759-9d4d3cb6b65c	8351	Straža
00050000-5562-2ccd-ef82-39bf9b89fc92	1313	Struge
00050000-5562-2ccd-24de-d342857a5aa4	8293	Studenec
00050000-5562-2ccd-c774-b068f9ad0717	8331	Suhor
00050000-5562-2ccd-4d19-36bdc610361a	2233	Sv. Ana v Slovenskih goricah
00050000-5562-2ccd-9b61-27e1d1d8357d	2235	Sv. Trojica v Slovenskih goricah
00050000-5562-2ccd-c3b8-4be3a84a616d	2353	Sveti Duh na Ostrem Vrhu
00050000-5562-2ccd-8e53-ef8f117c3add	9244	Sveti Jurij ob Ščavnici
00050000-5562-2ccd-badd-1996dd8f5c92	3264	Sveti Štefan
00050000-5562-2ccd-f0ee-e689d83b2348	2258	Sveti Tomaž
00050000-5562-2ccd-7493-87715125c612	9204	Šalovci
00050000-5562-2ccd-1188-2cbd9c26a7a0	5261	Šempas
00050000-5562-2ccd-42f8-c52d813bc093	5290	Šempeter pri Gorici
00050000-5562-2ccd-30e3-57c02fcca622	3311	Šempeter v Savinjski dolini
00050000-5562-2ccd-9ce3-cfad2bf53499	4208	Šenčur
00050000-5562-2ccd-1dd7-dcdbc7ae350b	2212	Šentilj v Slovenskih goricah
00050000-5562-2ccd-f430-d7bac6efea17	8297	Šentjanž
00050000-5562-2ccd-f608-89c5f07dd7fc	2373	Šentjanž pri Dravogradu
00050000-5562-2ccd-86d8-b962b3577571	8310	Šentjernej
00050000-5562-2ccd-7c5b-0adefbb48346	3230	Šentjur
00050000-5562-2ccd-0249-952ab5170120	3271	Šentrupert
00050000-5562-2ccd-85d9-90040af0045b	8232	Šentrupert
00050000-5562-2ccd-4d57-2bdd3a31211e	1296	Šentvid pri Stični
00050000-5562-2ccd-d621-b9e74ebfbe8a	8275	Škocjan
00050000-5562-2ccd-8023-f286a51f509b	6281	Škofije
00050000-5562-2ccd-aa55-70dc74b16802	4220	Škofja Loka
00050000-5562-2ccd-3e4f-6c71a147e532	3211	Škofja vas
00050000-5562-2ccd-704f-de2b41168273	1291	Škofljica
00050000-5562-2ccd-8762-a0b31c332b55	6274	Šmarje
00050000-5562-2ccd-b5bd-3247a99dfd28	1293	Šmarje - Sap
00050000-5562-2ccd-093b-b1bc7afccdd8	3240	Šmarje pri Jelšah
00050000-5562-2ccd-a047-7bee2f129593	8220	Šmarješke Toplice
00050000-5562-2ccd-1bd7-e3a7cc61182e	2315	Šmartno na Pohorju
00050000-5562-2ccd-28a3-98d775304cd6	3341	Šmartno ob Dreti
00050000-5562-2ccd-319d-cd97fbcfb443	3327	Šmartno ob Paki
00050000-5562-2ccd-8e2f-352bd9947ada	1275	Šmartno pri Litiji
00050000-5562-2ccd-e807-3afa370da408	2383	Šmartno pri Slovenj Gradcu
00050000-5562-2ccd-9657-6405fd075882	3201	Šmartno v Rožni dolini
00050000-5562-2ccd-8855-529178a972ec	3325	Šoštanj
00050000-5562-2ccd-8496-b76194d25cc9	6222	Štanjel
00050000-5562-2ccd-207d-4502c6fcc1bf	3220	Štore
00050000-5562-2ccd-2ad3-b5d5cc6a8072	3304	Tabor
00050000-5562-2ccd-cae7-12573f7cdb4c	3221	Teharje
00050000-5562-2ccd-73d2-ed1870901233	9251	Tišina
00050000-5562-2ccd-9b60-e1edc575b11b	5220	Tolmin
00050000-5562-2ccd-7e2d-7271421fac3c	3326	Topolšica
00050000-5562-2ccd-972f-d31b98899f97	2371	Trbonje
00050000-5562-2ccd-bd88-a4a464b22280	1420	Trbovlje
00050000-5562-2ccd-de89-b445395197f7	8231	Trebelno 
00050000-5562-2ccd-b50a-ce1c74cd57bb	8210	Trebnje
00050000-5562-2ccd-2496-56e1a93565f2	5252	Trnovo pri Gorici
00050000-5562-2ccd-8c0a-8b1d16436310	2254	Trnovska vas
00050000-5562-2ccd-ff74-8efacd1f857f	1222	Trojane
00050000-5562-2ccd-5996-eba05d50285d	1236	Trzin
00050000-5562-2ccd-6f2a-f5a888db0c7a	4290	Tržič
00050000-5562-2ccd-e4a9-7f387d1cda19	8295	Tržišče
00050000-5562-2ccd-4d6f-b203a128b91c	1311	Turjak
00050000-5562-2ccd-cffe-8b2f7225dc09	9224	Turnišče
00050000-5562-2ccd-03db-55a310d70667	8323	Uršna sela
00050000-5562-2ccd-de05-a67ed5f600ce	1252	Vače
00050000-5562-2ccd-1911-7e956fb5e729	3320	Velenje 
00050000-5562-2ccd-20d9-f12b460b5bc4	3322	Velenje - poštni predali
00050000-5562-2ccd-0920-36281e5f0ad3	8212	Velika Loka
00050000-5562-2ccd-527b-acd262e8d0de	2274	Velika Nedelja
00050000-5562-2ccd-9914-7cca175fa723	9225	Velika Polana
00050000-5562-2ccd-f625-e700fc45dfca	1315	Velike Lašče
00050000-5562-2ccd-c7dd-5ebc93248a9f	8213	Veliki Gaber
00050000-5562-2ccd-1e74-9a3c6304af41	9241	Veržej
00050000-5562-2ccd-f118-1212ceb14327	1312	Videm - Dobrepolje
00050000-5562-2ccd-9e96-b58b98ba37b2	2284	Videm pri Ptuju
00050000-5562-2ccd-bf7f-e8a6f8eec05a	8344	Vinica
00050000-5562-2ccd-8dfa-53b6018a327e	5271	Vipava
00050000-5562-2ccd-623d-f69a0fff227d	4212	Visoko
00050000-5562-2ccd-8295-53d0c6cb25d8	1294	Višnja Gora
00050000-5562-2ccd-ece3-1c79cc97caa8	3205	Vitanje
00050000-5562-2ccd-94ad-7c07a6b4f7e4	2255	Vitomarci
00050000-5562-2ccd-e50b-2d2718da0a7e	1217	Vodice
00050000-5562-2ccd-33aa-a7c744f52356	3212	Vojnik\t
00050000-5562-2ccd-8489-151facaa6c5c	5293	Volčja Draga
00050000-5562-2ccd-4964-f2ccc0704951	2232	Voličina
00050000-5562-2ccd-14db-258090fa4c5a	3305	Vransko
00050000-5562-2ccd-9f4a-e9b7da43fc21	6217	Vremski Britof
00050000-5562-2ccd-a6a7-5fde53e9e7fe	1360	Vrhnika
00050000-5562-2ccd-555c-94e76b6b323f	2365	Vuhred
00050000-5562-2ccd-d110-24e9432f8df0	2367	Vuzenica
00050000-5562-2ccd-4054-b8bdbb1da5d9	8292	Zabukovje 
00050000-5562-2ccd-17c7-e957f57b70dd	1410	Zagorje ob Savi
00050000-5562-2ccd-bade-2319aaf4e5ae	1303	Zagradec
00050000-5562-2ccd-9321-f1370f66f497	2283	Zavrč
00050000-5562-2ccd-5b44-291e19b62325	8272	Zdole 
00050000-5562-2ccd-3a53-b5f4f1c9ea8e	4201	Zgornja Besnica
00050000-5562-2ccd-d580-a918c6be4631	2242	Zgornja Korena
00050000-5562-2ccd-763c-358c0b3d2cd6	2201	Zgornja Kungota
00050000-5562-2ccd-25f4-0559632cfe84	2316	Zgornja Ložnica
00050000-5562-2ccd-3b5f-8207c7f68687	2314	Zgornja Polskava
00050000-5562-2ccd-e114-b7c95559fda0	2213	Zgornja Velka
00050000-5562-2ccd-3991-078492367f8d	4247	Zgornje Gorje
00050000-5562-2ccd-2c52-248214380137	4206	Zgornje Jezersko
00050000-5562-2ccd-d25b-16e6817981b0	2285	Zgornji Leskovec
00050000-5562-2ccd-a46f-003f77755f49	1432	Zidani Most
00050000-5562-2ccd-09b0-1cfeccdca511	3214	Zreče
00050000-5562-2ccd-25a4-2c6dd27fff9a	4209	Žabnica
00050000-5562-2ccd-80ad-6704cf064d51	3310	Žalec
00050000-5562-2ccd-6f1c-d968b6227612	4228	Železniki
00050000-5562-2ccd-7275-0862189bfdb0	2287	Žetale
00050000-5562-2ccd-92b9-d77387d27387	4226	Žiri
00050000-5562-2ccd-301c-a5e76af681ab	4274	Žirovnica
00050000-5562-2ccd-dbfd-a44311ce829c	8360	Žužemberk
\.


--
-- TOC entry 2996 (class 0 OID 120801)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 35988)
-- Dependencies: 173
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 120654)
-- Dependencies: 189
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 120732)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 120807)
-- Dependencies: 206
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 120948)
-- Dependencies: 219
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 120963)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 120814)
-- Dependencies: 207
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 120823)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 120832)
-- Dependencies: 209
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 120970)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 120981)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 120501)
-- Dependencies: 176
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5562-2cce-010b-ce5a00f52a67	00010000-5562-2cce-fc46-00132a12b12f	2015-05-24 21:56:26	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROKjmOkZu/B4Hsoa8FS3B97bf8Qg.Uh7u";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 3001 (class 0 OID 120842)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 120510)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5562-2cce-6826-2f39a2c351b0	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5562-2cce-f395-d728d5c6577a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5562-2cce-2c3e-5d848dcbae78	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5562-2cce-dec3-62c622d594f4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5562-2cce-45b3-59518d3a6ab9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5562-2cce-2c84-be590529ad31	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2971 (class 0 OID 120540)
-- Dependencies: 180
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5562-2cce-010b-ce5a00f52a67	00020000-5562-2cce-dec3-62c622d594f4
00010000-5562-2cce-fc46-00132a12b12f	00020000-5562-2cce-dec3-62c622d594f4
\.


--
-- TOC entry 3002 (class 0 OID 120848)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 120860)
-- Dependencies: 212
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 120740)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 121063)
-- Dependencies: 229
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5562-2cce-8309-5034d8ccebf6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5562-2cce-596c-6970ee2969e9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5562-2cce-a24d-8840b9c4a5c3	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5562-2cce-57bb-ddc658e1bac3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3021 (class 0 OID 121071)
-- Dependencies: 230
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5562-2cce-380e-c65a9a8f71cc	00000000-5562-2cce-a24d-8840b9c4a5c3	popa
00000000-5562-2cce-8a4d-abfe24d1d29f	00000000-5562-2cce-a24d-8840b9c4a5c3	oseba
00000000-5562-2cce-fc59-1ee9b1f37826	00000000-5562-2cce-a24d-8840b9c4a5c3	besedilo
00000000-5562-2cce-389d-30df9254b0a5	00000000-5562-2cce-a24d-8840b9c4a5c3	uprizoritev
00000000-5562-2cce-9b45-eca4bfd57732	00000000-5562-2cce-a24d-8840b9c4a5c3	funkcija
00000000-5562-2cce-f108-3a0c6814fe1a	00000000-5562-2cce-a24d-8840b9c4a5c3	tipfunkcije
\.


--
-- TOC entry 3022 (class 0 OID 121078)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 120991)
-- Dependencies: 223
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 232
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2981 (class 0 OID 120669)
-- Dependencies: 190
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 120760)
-- Dependencies: 200
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 121004)
-- Dependencies: 224
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5562-2ccf-32fb-98ffb6beabd5	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5562-2ccf-f2a3-e99b40c97606	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5562-2ccf-660c-060ffe38ce94	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5562-2ccf-3717-ca8085367f24	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5562-2ccf-3548-bb8525ae7f6e	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5562-2ccf-22e0-5806b1b79d00	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5562-2ccf-1b59-76dc2d94f91d	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5562-2ccf-9320-7848d3f5b72e	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5562-2ccf-78e2-12c9565b6a72	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5562-2ccf-80b1-2aaf8e80cb4c	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5562-2ccf-971a-98f4141e83d6	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5562-2ccf-48fd-ef347966b510	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5562-2ccf-6b1f-1eb59da1f04a	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5562-2ccf-487a-4d1965d3554e	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5562-2ccf-61dc-078eadce4a75	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5562-2ccf-ac62-4a00c4af37fd	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2982 (class 0 OID 120677)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 120527)
-- Dependencies: 179
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5562-2cce-fc46-00132a12b12f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROlhYPH.n27MCe1J7MR9rugMW4qdwD1Ni	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5562-2cce-010b-ce5a00f52a67	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3016 (class 0 OID 121015)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 120746)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 120866)
-- Dependencies: 213
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 121035)
-- Dependencies: 226
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 120755)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 121043)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 121053)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 120555)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 120881)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 120901)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 120917)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 120704)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 120718)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 120568)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 120928)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 120724)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 120730)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 36197)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 120777)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 120785)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 120583)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 120593)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 120643)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2604 (class 2606 OID 120616)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 120524)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2571 (class 2606 OID 120498)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 120791)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 120800)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 120943)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 120636)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 120652)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 120805)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 36227)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 120665)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 120736)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 120811)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 120960)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 120968)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 120821)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 120827)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 120837)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 120980)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 120988)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 120509)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 120846)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 120544)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 120518)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 120856)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 120865)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 120745)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 121069)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 121075)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 121082)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 121001)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 120674)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 120769)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 121014)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 120688)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 120539)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 121030)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 120753)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 120872)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 121041)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 120759)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 121052)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 121062)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 1259 OID 120711)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2748 (class 1259 OID 121002)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2749 (class 1259 OID 121003)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 120638)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2565 (class 1259 OID 36288)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 36289)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2567 (class 1259 OID 36290)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2671 (class 1259 OID 120792)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2679 (class 1259 OID 120813)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2680 (class 1259 OID 120812)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2656 (class 1259 OID 120754)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2726 (class 1259 OID 120931)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2727 (class 1259 OID 120929)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2728 (class 1259 OID 120930)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2729 (class 1259 OID 120945)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 120946)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2731 (class 1259 OID 120947)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2754 (class 1259 OID 121034)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2755 (class 1259 OID 121031)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2756 (class 1259 OID 121033)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2757 (class 1259 OID 121032)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2626 (class 1259 OID 120690)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2627 (class 1259 OID 120689)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 120645)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 120644)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 120618)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2698 (class 1259 OID 120847)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2648 (class 1259 OID 120731)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 120525)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 120526)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2701 (class 1259 OID 120859)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2702 (class 1259 OID 120858)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2703 (class 1259 OID 120857)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2649 (class 1259 OID 120737)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 120739)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2651 (class 1259 OID 120738)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2770 (class 1259 OID 121077)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2692 (class 1259 OID 120841)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2693 (class 1259 OID 120839)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2694 (class 1259 OID 120838)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2695 (class 1259 OID 120840)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 120545)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 120546)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2708 (class 1259 OID 120873)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2676 (class 1259 OID 120806)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2744 (class 1259 OID 120989)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2745 (class 1259 OID 120990)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 120667)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 120666)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 120668)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 120961)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2736 (class 1259 OID 120962)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2713 (class 1259 OID 120884)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2714 (class 1259 OID 120883)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2715 (class 1259 OID 120886)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2716 (class 1259 OID 120882)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2717 (class 1259 OID 120885)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2760 (class 1259 OID 121042)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2686 (class 1259 OID 120831)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2687 (class 1259 OID 120830)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2688 (class 1259 OID 120828)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2689 (class 1259 OID 120829)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2561 (class 1259 OID 36344)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2720 (class 1259 OID 120903)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2721 (class 1259 OID 120902)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2645 (class 1259 OID 120725)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2598 (class 1259 OID 120595)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2599 (class 1259 OID 120594)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2622 (class 1259 OID 120675)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 120676)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2661 (class 1259 OID 120772)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 120771)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2663 (class 1259 OID 120770)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 120713)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2634 (class 1259 OID 120709)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2635 (class 1259 OID 120706)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2636 (class 1259 OID 120707)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2637 (class 1259 OID 120705)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2638 (class 1259 OID 120710)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2639 (class 1259 OID 120708)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2609 (class 1259 OID 120637)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 120569)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 120571)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2593 (class 1259 OID 120570)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2594 (class 1259 OID 120572)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2668 (class 1259 OID 120778)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2734 (class 1259 OID 120944)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 120617)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2769 (class 1259 OID 121070)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 120584)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2773 (class 1259 OID 121076)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2685 (class 1259 OID 120822)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2564 (class 1259 OID 36372)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2616 (class 1259 OID 120653)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 120969)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2576 (class 1259 OID 120519)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2640 (class 1259 OID 120712)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2798 (class 2606 OID 121195)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2795 (class 2606 OID 121180)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2796 (class 2606 OID 121185)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2800 (class 2606 OID 121205)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2794 (class 2606 OID 121175)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2799 (class 2606 OID 121200)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2797 (class 2606 OID 121190)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2846 (class 2606 OID 121435)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2847 (class 2606 OID 121440)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2784 (class 2606 OID 121125)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2811 (class 2606 OID 121260)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2814 (class 2606 OID 121275)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2813 (class 2606 OID 121270)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2806 (class 2606 OID 121235)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 121390)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2835 (class 2606 OID 121380)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2836 (class 2606 OID 121385)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2810 (class 2606 OID 121255)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 121395)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2839 (class 2606 OID 121400)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 121405)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2851 (class 2606 OID 121460)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2848 (class 2606 OID 121445)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2850 (class 2606 OID 121455)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2849 (class 2606 OID 121450)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2793 (class 2606 OID 121170)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 121165)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 121135)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 121130)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2783 (class 2606 OID 121120)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2782 (class 2606 OID 121115)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 121320)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2802 (class 2606 OID 121215)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 121085)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2777 (class 2606 OID 121090)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2826 (class 2606 OID 121335)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2825 (class 2606 OID 121330)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2824 (class 2606 OID 121325)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2803 (class 2606 OID 121220)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2805 (class 2606 OID 121230)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2804 (class 2606 OID 121225)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2853 (class 2606 OID 121470)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2822 (class 2606 OID 121315)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2820 (class 2606 OID 121305)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2819 (class 2606 OID 121300)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2821 (class 2606 OID 121310)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2778 (class 2606 OID 121095)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 121100)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2827 (class 2606 OID 121340)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2812 (class 2606 OID 121265)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2844 (class 2606 OID 121425)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2845 (class 2606 OID 121430)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2788 (class 2606 OID 121145)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 121140)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 121150)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2841 (class 2606 OID 121410)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2842 (class 2606 OID 121415)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2830 (class 2606 OID 121355)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2829 (class 2606 OID 121350)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2832 (class 2606 OID 121365)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2828 (class 2606 OID 121345)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2831 (class 2606 OID 121360)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2852 (class 2606 OID 121465)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 121295)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2817 (class 2606 OID 121290)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2815 (class 2606 OID 121280)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2816 (class 2606 OID 121285)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2834 (class 2606 OID 121375)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 121370)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2801 (class 2606 OID 121210)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2843 (class 2606 OID 121420)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 121110)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 121105)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2790 (class 2606 OID 121155)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 121160)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 121250)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2808 (class 2606 OID 121245)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2807 (class 2606 OID 121240)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-24 21:56:38 CEST

--
-- PostgreSQL database dump complete
--

