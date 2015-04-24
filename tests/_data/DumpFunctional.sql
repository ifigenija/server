--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-24 09:23:37 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 226 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 1157458)
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
-- TOC entry 225 (class 1259 OID 1157941)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    vloga_id uuid NOT NULL,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
    pogodba_id uuid,
    zaposlen boolean
);


--
-- TOC entry 224 (class 1259 OID 1157924)
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
-- TOC entry 217 (class 1259 OID 1157840)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    datumprejema character varying(255) DEFAULT NULL::character varying,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 1157624)
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
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 1157665)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1157586)
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
-- TOC entry 212 (class 1259 OID 1157790)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje integer,
    naziv character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean,
    sort integer
);


--
-- TOC entry 191 (class 1259 OID 1157611)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1157659)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
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
-- TOC entry 201 (class 1259 OID 1157708)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1157733)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1157560)
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
-- TOC entry 180 (class 1259 OID 1157467)
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
-- TOC entry 181 (class 1259 OID 1157478)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    pesvdonim character varying(255) DEFAULT NULL::character varying,
    funkcija character varying(40) DEFAULT NULL::character varying,
    srednjeime character varying(255) DEFAULT NULL::character varying,
    psevdonim character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 184 (class 1259 OID 1157530)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1157432)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1157451)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1157740)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1157770)
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
-- TOC entry 221 (class 1259 OID 1157882)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid NOT NULL,
    popa_id uuid,
    trr_id uuid,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 183 (class 1259 OID 1157510)
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
-- TOC entry 186 (class 1259 OID 1157552)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1157714)
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
-- TOC entry 185 (class 1259 OID 1157537)
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
-- TOC entry 190 (class 1259 OID 1157603)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1157726)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1157831)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(10,0) DEFAULT NULL::numeric,
    vrstakoproducenta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 1157875)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1157755)
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
-- TOC entry 200 (class 1259 OID 1157699)
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
-- TOC entry 199 (class 1259 OID 1157689)
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
-- TOC entry 219 (class 1259 OID 1157865)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1157821)
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
-- TOC entry 173 (class 1259 OID 1157403)
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
-- TOC entry 172 (class 1259 OID 1157401)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 1157764)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1157441)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1157425)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1157778)
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
-- TOC entry 203 (class 1259 OID 1157720)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1157670)
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
-- TOC entry 182 (class 1259 OID 1157502)
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
-- TOC entry 198 (class 1259 OID 1157676)
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
-- TOC entry 218 (class 1259 OID 1157856)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    dovoliprekrivanje boolean,
    maxprekrivanj integer,
    nastopajoc boolean
);


--
-- TOC entry 188 (class 1259 OID 1157572)
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
-- TOC entry 174 (class 1259 OID 1157412)
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
-- TOC entry 223 (class 1259 OID 1157906)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    faza character varying(20) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    delovninaslov character varying(255) DEFAULT NULL::character varying,
    datumpremiere date,
    stodmorov integer,
    avtor character varying(255) DEFAULT NULL::character varying,
    gostujoca boolean,
    trajanje integer,
    opis text,
    arhident character varying(255) DEFAULT NULL::character varying,
    arhopomba character varying(255) DEFAULT NULL::character varying,
    datumzakljucka date,
    sloavtor boolean
);


--
-- TOC entry 192 (class 1259 OID 1157618)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1157747)
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
-- TOC entry 214 (class 1259 OID 1157813)
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
-- TOC entry 194 (class 1259 OID 1157646)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 1157896)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1157803)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1157406)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1157458)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1157941)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1157924)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1157840)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1157624)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1157665)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1157586)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5539-ef77-fc99-69eea74aa4ed	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5539-ef77-2a65-b9cccd901f65	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5539-ef77-ee34-d7fdf26f9c8a	AL	ALB	008	Albania 	Albanija	\N
00040000-5539-ef77-a46f-3748f084a25c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5539-ef77-9a09-993252ddfa28	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5539-ef77-45e4-60f0dd8ee83c	AD	AND	020	Andorra 	Andora	\N
00040000-5539-ef77-eaa4-d3314ce259d3	AO	AGO	024	Angola 	Angola	\N
00040000-5539-ef77-1b3f-aed1b40ddc93	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5539-ef77-6177-19c62cbd4637	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5539-ef77-ea53-5524b7286310	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5539-ef77-22ae-fb3216b2d33b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5539-ef77-7dce-2afabc6fa277	AM	ARM	051	Armenia 	Armenija	\N
00040000-5539-ef77-d276-6935b2d980de	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5539-ef77-2caa-88ed497fc5ff	AU	AUS	036	Australia 	Avstralija	\N
00040000-5539-ef77-fa19-075959d79b5d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5539-ef77-fb15-dec9347b561a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5539-ef77-a15b-64d8cb613dde	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5539-ef77-fcb7-78d7ced5bc77	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5539-ef77-3940-a995df930d2b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5539-ef77-187b-daebaa498095	BB	BRB	052	Barbados 	Barbados	\N
00040000-5539-ef77-39f9-3531b7771e09	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5539-ef77-e486-90cd65d56b50	BE	BEL	056	Belgium 	Belgija	\N
00040000-5539-ef77-74ca-6754a6c48caf	BZ	BLZ	084	Belize 	Belize	\N
00040000-5539-ef77-94cd-a0351166b9bf	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5539-ef77-efed-5363d97eb3d1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5539-ef77-7a28-2f19df7d033d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5539-ef77-9ad0-36adb053db51	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5539-ef77-6b3c-b2e2650ae4e3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5539-ef77-da85-4e632eaf6951	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5539-ef77-f5a7-5f21f001cdfc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5539-ef77-8e59-9534f9e47600	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5539-ef77-8676-838e701d2b33	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5539-ef77-9841-ed92848cd99b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5539-ef77-65b8-25f99eb03d10	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5539-ef77-bd87-3e92ebf4adde	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5539-ef77-047f-68a303dbf0c1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5539-ef77-5164-f61b95bf63b5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5539-ef77-c900-610966a91ac4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5539-ef77-4365-3ed7ba8c4e83	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5539-ef77-ca52-a177c6bbae45	CA	CAN	124	Canada 	Kanada	\N
00040000-5539-ef77-2d5f-6f8e831a4819	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5539-ef77-ba25-02cafd534420	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5539-ef77-d3bd-1f78900ecb6d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5539-ef77-cec4-72c48287a692	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5539-ef77-1ec3-d80a8af615ca	CL	CHL	152	Chile 	Čile	\N
00040000-5539-ef77-1a09-c61c02702c8b	CN	CHN	156	China 	Kitajska	\N
00040000-5539-ef77-d953-7f1358056a07	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5539-ef77-9c0d-f3834d552374	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5539-ef77-7349-bae29d28de94	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5539-ef77-e717-4067a6213541	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5539-ef77-ff6a-078c2cc487bc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5539-ef77-ba06-e65a4bbcfe9a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5539-ef77-4c7d-ec3fce5adee3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5539-ef77-99c1-e9994ebece22	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5539-ef77-58f6-5fe596b59d66	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5539-ef77-77d2-ebc4bc9455ad	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5539-ef77-1f00-cd2b559498b0	CU	CUB	192	Cuba 	Kuba	\N
00040000-5539-ef77-eb45-415eeee072c8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5539-ef77-58fd-16a2a5d5c51e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5539-ef77-57a9-faac6c2e1b7a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5539-ef77-0ad9-042a71b99dcd	DK	DNK	208	Denmark 	Danska	\N
00040000-5539-ef77-7b16-38b9b921f536	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5539-ef77-1371-c677e3712114	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5539-ef77-986d-d58cdcda9404	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5539-ef77-250d-bc55c3d7268b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5539-ef77-0a60-384866df7b81	EG	EGY	818	Egypt 	Egipt	\N
00040000-5539-ef77-9148-65ec46796b8b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5539-ef77-02b3-399caa654d42	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5539-ef77-3dca-b59658fc9b12	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5539-ef77-8cc5-0cf6cbca3004	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5539-ef77-c98d-7951b91d0b76	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5539-ef77-5d7e-35e46ef93738	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5539-ef77-1814-b8bdc365484c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5539-ef77-7382-5ff3d8a94b24	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5539-ef77-f633-ec8ebd1380d9	FI	FIN	246	Finland 	Finska	\N
00040000-5539-ef77-6cda-5f820a8436b1	FR	FRA	250	France 	Francija	\N
00040000-5539-ef77-c054-0e08cd3d3db8	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5539-ef77-46f4-6b0669a8e2c7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5539-ef77-ba82-3647521b9224	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5539-ef77-b12c-e7fd527dccd8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5539-ef77-f49b-4e56eee88b05	GA	GAB	266	Gabon 	Gabon	\N
00040000-5539-ef77-cade-c2b6626b308f	GM	GMB	270	Gambia 	Gambija	\N
00040000-5539-ef77-15c4-abf4bbe846b3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5539-ef77-c397-f14fafabae6b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5539-ef77-2aee-5cc157bf7ace	GH	GHA	288	Ghana 	Gana	\N
00040000-5539-ef77-cfd6-9f208aec6397	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5539-ef77-33b2-43bfee3a811a	GR	GRC	300	Greece 	Grčija	\N
00040000-5539-ef77-3b4c-5c57b5e99e9a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5539-ef77-0fdd-9d6c742d8c06	GD	GRD	308	Grenada 	Grenada	\N
00040000-5539-ef77-f8f0-573c2622d883	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5539-ef77-7499-3a6e6440e1d8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5539-ef77-d5e1-2934134ddea5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5539-ef77-3286-cb1d3c10df04	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5539-ef77-c4ec-0040dad5b182	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5539-ef77-9027-bf6cc2de9fdf	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5539-ef77-a174-1b604c395635	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5539-ef77-5182-cc0ed91e5820	HT	HTI	332	Haiti 	Haiti	\N
00040000-5539-ef77-743b-86f0d7a2b967	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5539-ef77-6b18-08a3b44d3db3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5539-ef77-fd21-2f5a663273ff	HN	HND	340	Honduras 	Honduras	\N
00040000-5539-ef77-9158-da4cf6d731f0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5539-ef77-e383-d501962df047	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5539-ef77-d4b9-1beb8486337b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5539-ef77-63e5-10863dfaff09	IN	IND	356	India 	Indija	\N
00040000-5539-ef77-98d2-0f5774550872	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5539-ef77-2463-602543c5a24b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5539-ef77-bbd6-9cdc3a7f3fd7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5539-ef77-8915-ba6310617a75	IE	IRL	372	Ireland 	Irska	\N
00040000-5539-ef77-78a6-ea1d31df996d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5539-ef77-62cc-e369b86f42ee	IL	ISR	376	Israel 	Izrael	\N
00040000-5539-ef77-559d-8b30f417f712	IT	ITA	380	Italy 	Italija	\N
00040000-5539-ef77-ce25-3927a7f7e4ae	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5539-ef77-d947-87a1d0afe131	JP	JPN	392	Japan 	Japonska	\N
00040000-5539-ef77-ede3-195698047535	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5539-ef77-6014-f4fd1621ba2c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5539-ef77-3f2f-da70b0839bfe	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5539-ef77-bd03-ea8c54bc1588	KE	KEN	404	Kenya 	Kenija	\N
00040000-5539-ef77-6f45-68c5fae38bdc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5539-ef77-e8ea-ca2e6494a42b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5539-ef77-b2af-08da49374d1d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5539-ef77-b4a8-d11ebb84f507	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5539-ef77-764f-36f3c03a215b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5539-ef77-5e1a-da202c3e662b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5539-ef77-1df6-b0da10d05afa	LV	LVA	428	Latvia 	Latvija	\N
00040000-5539-ef77-a33a-a0d3cede7c93	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5539-ef77-cfdd-d21244c11c09	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5539-ef77-7499-81a517c6265f	LR	LBR	430	Liberia 	Liberija	\N
00040000-5539-ef77-7760-761e2ef55cb2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5539-ef77-5351-056a70b9a678	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5539-ef77-2d01-9345bbb4bb05	LT	LTU	440	Lithuania 	Litva	\N
00040000-5539-ef77-48c7-7cb9f32c509f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5539-ef77-da85-da4df40af881	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5539-ef77-e7af-3216e9b2ac71	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5539-ef77-0896-8b617408fae8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5539-ef77-9059-bc7c351f9303	MW	MWI	454	Malawi 	Malavi	\N
00040000-5539-ef77-9c96-851100722c4a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5539-ef77-da4b-585f6a0887f7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5539-ef77-dd26-9a2ed4c88fa4	ML	MLI	466	Mali 	Mali	\N
00040000-5539-ef77-ce2a-bee55881fc93	MT	MLT	470	Malta 	Malta	\N
00040000-5539-ef77-118b-a4eb4f665613	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5539-ef77-3f8c-b279d8c513cb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5539-ef77-a4ab-a1388052c96a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5539-ef77-8f64-7357d13cb723	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5539-ef77-e8f6-1e4c07c2b17f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5539-ef77-50ac-2d66facbcecd	MX	MEX	484	Mexico 	Mehika	\N
00040000-5539-ef77-8698-dbcf41de0f68	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5539-ef77-d0b8-cea38f33ae88	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5539-ef77-3474-40777dae4a22	MC	MCO	492	Monaco 	Monako	\N
00040000-5539-ef77-c22e-28111f62cec4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5539-ef77-cbf9-89a0309d349c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5539-ef77-e076-070d77df2010	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5539-ef77-a0d4-ef28c009a252	MA	MAR	504	Morocco 	Maroko	\N
00040000-5539-ef77-6bf0-c99f40acaec2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5539-ef77-1f7a-3cf1f62df6c3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5539-ef77-c757-da7e60b4de8c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5539-ef77-a612-e7ca8c69059e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5539-ef77-9a6f-138b24516c34	NP	NPL	524	Nepal 	Nepal	\N
00040000-5539-ef77-1666-8e811df57621	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5539-ef77-71fb-86866f87d0b6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5539-ef77-6a6b-3086974d2a2d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5539-ef77-5854-89aaf1001303	NE	NER	562	Niger 	Niger 	\N
00040000-5539-ef77-24e8-a4132127cd02	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5539-ef77-38d3-6ccba81f9c11	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5539-ef77-76e1-a0be3aa5d901	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5539-ef77-6838-810cf7289ea8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5539-ef77-abb0-a5e431e13734	NO	NOR	578	Norway 	Norveška	\N
00040000-5539-ef77-69df-7adba9b26f64	OM	OMN	512	Oman 	Oman	\N
00040000-5539-ef77-2b2a-f662033d980d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5539-ef77-6379-de359386fbb2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5539-ef77-ee3e-c4221922f08b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5539-ef77-9a6a-ac3fbb071b81	PA	PAN	591	Panama 	Panama	\N
00040000-5539-ef77-e731-2f3a05d9c978	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5539-ef77-a9aa-f9821e5b65b2	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5539-ef77-b00e-2f7bb267de01	PE	PER	604	Peru 	Peru	\N
00040000-5539-ef77-c775-80b60d8a2b67	PH	PHL	608	Philippines 	Filipini	\N
00040000-5539-ef77-080d-6fee2adb69d6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5539-ef77-141b-8e1b3f7308df	PL	POL	616	Poland 	Poljska	\N
00040000-5539-ef77-4bc0-3c371d5a6b1d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5539-ef77-3132-91aab70ab833	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5539-ef77-c7da-b7fcbff9a52a	QA	QAT	634	Qatar 	Katar	\N
00040000-5539-ef77-f2b0-1191a6a1dbcd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5539-ef77-4461-87b53edf185c	RO	ROU	642	Romania 	Romunija	\N
00040000-5539-ef77-6e85-b9c65e510369	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5539-ef77-9b26-9e3ba0ed5c0a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5539-ef77-21d8-132dbef8c9bb	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5539-ef77-fc2e-cd8a836dbedf	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5539-ef77-3b99-0701b9adc41e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5539-ef77-b536-949d88eb5e5b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5539-ef77-333d-fe5585406115	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5539-ef77-6201-83f2e81ecf2b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5539-ef77-b6eb-e5eddb6b570e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5539-ef77-dc7b-2b444150fa95	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5539-ef77-ec24-07a33b36690e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5539-ef77-1829-d170c77e417f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5539-ef77-8af2-d1ff1eb1c78a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5539-ef77-0262-3e243e633c87	SN	SEN	686	Senegal 	Senegal	\N
00040000-5539-ef77-be69-91e55a54a658	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5539-ef77-3b3e-6b5cb3aaad9d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5539-ef77-4043-791b7c13b93b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5539-ef77-d7d2-e22d4da1647a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5539-ef77-32d0-afb5c643420d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5539-ef77-a614-73e84c6f7a31	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5539-ef77-6090-c500dcee9943	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5539-ef77-d6a3-6c497b96e255	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5539-ef77-fcd1-d33ab4a5cafd	SO	SOM	706	Somalia 	Somalija	\N
00040000-5539-ef77-2085-22218365e21b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5539-ef77-dedc-e01456dbed91	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5539-ef77-9e09-68904821d634	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5539-ef77-4559-6aa0d609af3d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5539-ef77-f106-c238bf08aa3f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5539-ef77-3e71-6f3c7858e0b7	SD	SDN	729	Sudan 	Sudan	\N
00040000-5539-ef77-700b-28d289e46dc2	SR	SUR	740	Suriname 	Surinam	\N
00040000-5539-ef77-f1d0-a4ee514a85a2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5539-ef77-f707-1b34f69c34aa	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5539-ef77-185d-ba2b80ab07b2	SE	SWE	752	Sweden 	Švedska	\N
00040000-5539-ef77-8f97-5a086acf8d54	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5539-ef77-b266-172b99b58d04	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5539-ef77-1605-a90777dae0a3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5539-ef77-04ad-74648050ed28	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5539-ef77-b42c-69fc65282b8b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5539-ef77-34ab-c8e2f40e7e0b	TH	THA	764	Thailand 	Tajska	\N
00040000-5539-ef77-ff29-824b01cf17bf	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5539-ef77-720f-aaf2de2b9d5b	TG	TGO	768	Togo 	Togo	\N
00040000-5539-ef77-3d96-fca3f763e3bc	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5539-ef77-f8bc-c4bda68a0c3e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5539-ef77-8821-25431fa93d24	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5539-ef77-7aad-51389c1a10ab	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5539-ef77-c2a4-dbad4f559bfc	TR	TUR	792	Turkey 	Turčija	\N
00040000-5539-ef77-bffe-a9fcadee917f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5539-ef77-7f81-ead80351f126	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5539-ef77-97f8-19eb491b2d7b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5539-ef77-e564-0b9b73c379fd	UG	UGA	800	Uganda 	Uganda	\N
00040000-5539-ef77-27d5-a9a55246ed21	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5539-ef77-e22c-d43c7a2e1cdb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5539-ef77-ec51-b9578957f2d2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5539-ef77-8231-5eae5df8da9a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5539-ef77-529a-ce528c8943cd	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5539-ef77-8bf0-0f7dcf28e3dd	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5539-ef77-1eca-4c09cdb9ca3b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5539-ef77-0eb8-9d3071d27c09	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5539-ef77-8dbb-aa0941fcf1cb	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5539-ef77-dfc9-d9373e1922f9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5539-ef77-63af-5687cb328efd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5539-ef77-477e-e59b1fc9526f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5539-ef77-b79d-4e6e135f6f65	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5539-ef77-07f2-dcde8545930d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5539-ef77-6860-9449546d207c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5539-ef77-1cd1-f3089ccc522c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5539-ef77-f7ed-19874a5b58eb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1157790)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1157611)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1157659)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 1157708)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1157733)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1157560)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5539-ef79-d847-957e3c308bdb	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5539-ef79-c700-1a62c51a179b	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5539-ef79-89e5-e14f121778c3	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5539-ef79-3ec1-c515c2fe2cfb	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5539-ef79-de54-72699d2d321b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5539-ef79-53a8-9c5cf5493019	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5539-ef79-0f39-ed470936a619	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5539-ef79-dca1-7a802e7acc79	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5539-ef79-76c8-e82efe85fbf7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5539-ef79-fe06-30b287d82c57	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1157467)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5539-ef79-9949-2837aaa2aebf	00000000-5539-ef79-de54-72699d2d321b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5539-ef79-ff19-5c86388723b7	00000000-5539-ef79-de54-72699d2d321b	00010000-5539-ef79-1f2b-2eb6892c6a36	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5539-ef79-0174-6cd857ec2b5c	00000000-5539-ef79-53a8-9c5cf5493019	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1157478)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1157530)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1157432)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5539-ef77-2770-a34ad160d76f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-fa3c-34e92825cc7d	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-6303-696196b34a03	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-3eb6-ab6f1a42a6f1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-8cab-e0a51080c84e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-92f9-e1d38342c150	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-2a63-7f9b0b5a93bc	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-6cd0-5a6c99329c49	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-025f-13aa3372ce5b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-b27c-004d675b964b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-e4d0-f996e1bbf40f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-8c74-ddb1655e7fb3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-e940-4a076902eb58	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-ca83-dfb76d22c85b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-3199-aefcf9e24341	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-a714-661a200b0508	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-9887-a3b7388ffb03	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-4e73-14c93c61b01f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-69e3-71c84cdb1285	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-593a-46e5e4c9d0aa	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-d18c-3cc9a5a7c31e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-efc2-bfef920ed12a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-f901-aef8ecb64856	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-3329-7b1cd28f97b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-a249-5241b16ead5a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-2781-7d87c240699e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-4533-6b85f914ee98	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-00b2-e8e201a699ec	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-baf5-3197d1feeffa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-0439-579e5ba4a0a4	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-ccd5-ffbc27bb6de1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-39c2-cbd95821aac0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-fb23-aa281c798dd9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-15f9-ba8fbc9d4d61	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-5f6c-d236cbb7d4aa	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-4d9c-02f7826f8c74	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-d18b-0c1b26f79fb0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-a444-458fcd3d5fb2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-19ed-423f93578124	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-73a3-4980513cc97c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-c5ed-c79227322c88	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-4fc8-32558a6f3b0f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-1c8c-8e763c1f5db3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-6ee1-80bfed044b47	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-a744-c5a0cc48afe1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-2b76-9d21e7ade968	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-87cc-a87e70d5832f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-d986-d3b367fbe4b4	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-131a-6384e3374cd3	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-2ef4-592807936293	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-b7ab-12e13388907b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-7eab-f190906bd803	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-94ae-7283edcbeb8b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-c45b-25e1dbde8c19	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-a339-53311b05f038	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-0790-7413f1d6cc20	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-8d2c-e0327c211fec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-8fc3-6e11227e61cb	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-05b8-e30ce5d633e1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-5747-8bccb575241c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-8063-d222575e9788	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-564a-821678eab034	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-f565-225fc1d098c5	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-021b-e539e06aa41f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-6f6c-99a39bdcddf5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-a351-3937b4cb62d1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-276d-9e8348c56103	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-643c-f247add8058b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-f66d-1ef6dfef921d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-1026-f20b1af2cd24	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-5039-b7357f6785bd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-ae34-3166c725f1a2	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-e6ac-e7a4581a172e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-febb-30635fad9642	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-b4ef-6c6130488b48	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-955d-8cead8e5a5e2	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-7bab-0a4c95042b77	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-708c-6483a6fa0361	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-0875-eb5e0bc1112e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-b3c6-750d41f0fc7b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-d37c-3803c0d039ac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-12e9-051d6fb43d69	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-5a1b-ed1e7ced6ec2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-2a57-7c86990c389d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-e1b8-9b9729c51fbb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-9095-2a4a284478cc	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-1834-981186f4e0e2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-4493-239990304a94	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-5425-53fc89f8e28e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-f61a-f1c6dbb64dc2	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-30e5-c3642a44a800	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-6d25-3cef0dec2e0f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-607c-a7874bf3d4a3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-86cb-9af6e6db9fda	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-8b37-5b60a078f663	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-387b-00e60b4fe7f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-f445-8531108413c3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-380c-f957fc95f200	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-1450-ca4d5d9d43b5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-ab71-c0c756f36221	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-63d8-1c36198eeaac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-2022-dc599b9e057e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-b92b-a8d60c78ea5e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-6269-be7b184e5d9a	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-09bb-3f87602b0be0	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-5111-120ce516143e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-8b75-56ede108c0a4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-8088-4b16e906a553	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-786e-63bccd210144	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-e19d-ccd77e2aab2f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-914e-a4f5add48ceb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-04a5-9511f090e463	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-b66f-a536b0d097b2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-053b-1ce978b53985	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-8ad6-879f79199bec	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-0d25-2d3934a2bbdb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-055a-f575d89d477e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-5dc3-6090f424c23b	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-a7d0-00bd76d60f6b	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-8343-b6deebb37cb7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-4be1-f0e278df6cce	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-3757-7c0f8a4fd6f9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-2aba-0b70049dced2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-0725-2e35aeb301d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-de1e-859bbed06581	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-8743-a1ff28a7ad0a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-a945-7428fef5cfc9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-92b1-d3bb65d99e09	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-d522-c47a23b9ce1b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-da57-2d8f592d5705	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-68f8-b9a51b035a20	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-45f3-a9a5311d1766	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-9c72-e8ea38dbe75b	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-5d28-f48abb3a8959	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-cbae-eeda5434ad79	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-1f3e-4d341eba3b59	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-65ec-6ed500b6ede2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-a4d8-dcad7d6b67a9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-1b11-75d769192dcf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-258b-63dc15a5b5c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-19fc-a0694727d583	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-0bd7-e3dfd6d3d0f7	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-04c2-c1e23da894bf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-4ed4-ddc5d2c0439a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-4d7f-c90da6116fc4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-395a-4bb59f3d9c29	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-fad5-763aa75effc0	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-32a3-4c9bbf5adc4e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-0c60-dfdc5b031415	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-8caf-fdb66c7c0b9c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-a5e2-a362d0bbff52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-7968-9a95ffd3eed0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-1765-98ced9f631e7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-b5bc-61cbe2997373	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-704f-717fbe04ac83	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-b797-b85153df125a	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-c898-6edbcdbf19cf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-5070-fee666c3783f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-c98a-39003fae3c04	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-f5e8-e0e0eaa5e9f1	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-d088-7e4aa6622c9f	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-b60c-da367a81942e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-0204-645f1d8ed3bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-b4fd-0a3b7b797184	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-1667-6263fdb40039	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-5a02-08d356e32dd3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-58f7-cba3d443709d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-dcdb-1576b1c07fa1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-aa9e-bc1dfcacb81d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-9be8-1665d6e2c264	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-6289-e4550cd8e6df	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-8722-652907930c39	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-756e-00908f95fd74	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-104b-f589112a9ebb	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-e6f3-d676888b0869	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-fe25-a9b93b68dad3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-388f-9eb4fc1068a1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-e036-9aca17c07422	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-c120-0eb694c95fe6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-6aa7-0fe391d0298a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-f4ce-c7131ed8a6e9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-74c2-612fd0b1c8f3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-0879-8e5b77b4f034	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-f9d7-1f324fe97a65	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-97a8-92c6ef9ff6dd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-754f-146a13bdb6dc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-83e7-b63ae99a368a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-9e22-770943d7179d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-6729-ce31162860ee	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-864c-9aba684d6d87	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-3f2a-5a6828ea262a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-140d-55550a72d417	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-1dda-12a90700c70f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-eadf-cc2cd387d914	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-f384-d3239af8eb4d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-2def-a48697c3a92c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-8188-14fa4cf028e4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-63d5-0516153c8efe	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-a8b4-41a3c7f54a29	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-db88-669047ce363f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-9e86-de84a5b3bdf5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-2f05-3305c8ea4f94	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-7837-0260eb5d771a	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-eb56-e82370413bcb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-811b-60641d370296	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-9860-c3c55ce50d68	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-d614-276197a8c387	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-01fd-ac9287863051	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-00b7-15df559e8129	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-8424-e517050d0f39	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-f4cf-6423b392018c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-5ce3-fa8b37835869	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-fd0f-3787f07cfec4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-7597-34d0104de1a3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-86d2-35ee9cfc18e9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-fac4-b56bfae716c6	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-e27c-b52d713433d3	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef77-53fb-7852456b0f43	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef77-8073-704cafa13a46	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef77-4ab1-7d30152d93c8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef77-2c12-5eeeffeafedd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef77-4db4-7dea44a4f32a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef77-a5fb-f96975f11bb3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef77-87c1-e61a882c9cff	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef77-f39d-5aa507d4976c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef77-2ffd-4ffe361efb15	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef77-770f-1c40552bdb2e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef77-2f4d-5c2d45be0f75	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef77-0802-a0a7d20c5d80	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef77-f5d3-ed08464769fb	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef77-2bf9-59860a787e69	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-d40d-ea74c148b8a7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-8b66-99d1c0a8b122	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-6ec8-35c0dedd9e0c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-f4a6-07fb0b5cf34e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-e63d-8a3431337f23	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-e305-2341d1ad768a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-d835-4cb5c7a2e26e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-247c-c98c5996bdc9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-b1c8-8f228c627399	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-eaf9-36ed51c09075	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-26ab-df3e16044c99	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-ea35-10f039aa882e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-f629-ee12ba523b6d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-42c7-5f833f1025ca	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-7d6e-afd0f060c842	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-cbae-2a00d561f18d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-efaa-8120cf703c7b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-29e0-6c29786c0c59	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-bf00-ef908f8cb8dc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-9ae5-fb49e4051a1f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-2cea-a92ee8cb40dd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-37f3-d718229ccc1a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-a12d-ecfff3c4f75b	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-7f59-4f8a56b56172	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-242c-870875680c77	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-396d-a133ecf7080a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-7b93-ecaaabd22abe	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-d568-f2ed4b4d7626	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-5e97-4066101f8ddf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-4b3b-a646ba33b8ac	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-a230-aa5d251bad08	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-d179-0664816ec23d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-4244-cf789673a9a1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-7945-7f4a85ebd2ed	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-8c71-687873e03f31	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-7dcc-bc8148b04dbb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-d81e-00dcbea24edf	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-50fe-79356c84a29c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-51dc-53caf992cda9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-674f-2cea79aa0206	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-c582-601a66440921	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-9b73-5bd24793c6db	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-5ab3-48e13dc99743	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-8b7c-95d549e383b4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-484d-bc77e0f34eab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-4d1b-0f9911db82bb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-3a16-b87af38cf48c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-0479-42db15e58dbc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-3e95-58954c744dbb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-1ee0-b4c7314f8580	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-816d-e9799b2556d0	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-3878-392da9feeb5b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-9573-bfc5273c205d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-c644-f2d14fc747f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-4869-d08d453c79f5	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-92f8-8ee9a8a86108	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-da47-1d550e823582	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-7dae-e568c386f34f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4e47-440d0d6abc33	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-b95e-6c06ef777100	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-30f5-bed47f8bb175	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-bf52-9464a966686e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-635b-2eb6639f8b4c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-ca6b-5d07863ef8a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-4ac5-d6d3a80e0adf	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-b569-a41df6b66dc5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-098c-8263e5096a78	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-faf4-fe4804050a98	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-17ff-331ec5c7317c	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-50a2-da002a657cb8	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-1c61-cc6e33e4f9be	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-4dc4-6d407d5e8e6c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-2868-8e779baae3dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-1240-2c82d1148a43	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-a361-c37e22e80178	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-2705-c4430372923c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-6589-02d63838636e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-81ca-ee0f63cb674a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-c027-7082e1cd8d1b	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-c44d-68c12f5eab62	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-6190-99573393553a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-eba8-8b483ddcfb1e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-0bc2-9d62ef97b48d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-bb0e-97c2ef7a7575	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-b84c-eecdb2a6eaab	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-aa53-8e0ee5ee8203	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-3ff9-37dc54ede29c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-c4a7-ffe9acf390c2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-6659-52b8ce0a9ad1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-2aa5-54c3df10fa11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-f1d9-e3bef8b6bd9f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-ec91-609119524357	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-dfc2-54bca59e7349	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-6cb3-153530d2c8c8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-3196-f7765701b111	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-ea35-477962a993af	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-7bef-7c38a7d9e8e8	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-175d-1993767edc54	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-02eb-ce666a1c8a2d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-433e-1d4a3cee73c5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-d016-a43d49aaec8f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-1d1d-1e61bd4daced	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-57c0-9918df84fbb8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-d023-187d39618365	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-f083-a04a6529a730	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-6a92-15fd7f62b589	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-755b-7902ec45776a	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-7405-d07f9d193a2c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-a591-4ef3ae2bd85f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-0f14-6645b80d2d00	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-a394-0a49db4e3254	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-03bb-b30c1db68d0e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-e8ff-369e4c2a7f9c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-4bfd-673f49f83654	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-fbaf-92fb10f1af7f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-e4e4-a7ca89a8ca3b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-9f30-55feeb96ae49	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-3e05-84cbbd577eda	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-b1fd-af0ad9f8122d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-e165-d0a58d6046e4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-8304-fa3121daad6e	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-379c-5ddd1f3fba1e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-8b00-3fb692810937	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-ffef-bb8323d088bd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-c5f8-8084fd01377b	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-7a84-fb12e05eebd0	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-b532-07a8270a183f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-dce5-c787067e96a3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-f94b-fd19c2f14857	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-2ca8-fefcd189cbd3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-af31-30d5dcffca89	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-d4c7-6e7c56c7403a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-7ac5-8d77521ffd70	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-2b49-eece7d6cbe7b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-35fb-f6d5f763a652	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-7077-e5f4022710df	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-0451-b4fabab73221	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-f704-7aaede514d0b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-f196-3f8c7de97bf4	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-18e9-64a70a9500db	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-a379-586b5ef9d14d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-233f-199a4041240d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-c997-727b9d8adeab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-53aa-4bca833ffdad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-9583-e02f546372c1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-d97e-cec4ea0ee0f1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-7ffc-644e018638e1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-d7e1-cca6fd4f1a6f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-6fed-870a20cb13df	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-272c-37eabeb0054e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-682e-3ffdbc082276	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-e5c7-7f0be9bf5d8e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-d70e-b1029e8445c1	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-f3b3-9303269ed6c1	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-e541-9ec7bd47c0da	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-5782-83d122c2609b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-e499-c4776215ab2f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-68cb-2588108d547c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-f8d2-e3f5ad9983da	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-a5dc-facc9bc158cc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-6e11-2de48695514f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-2101-7dae52829972	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-aae3-053a88682673	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-9c23-81d455f1449b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-a9c5-7a74d4341114	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-7212-76ea92b9e32a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-63c6-e5a359f7a598	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-992f-5efc67942719	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-2faa-db7aba8f7212	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-90d1-4d615a35c866	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-54f8-addedebbd081	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-c8cd-127daa544e22	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-e9a2-d0b7315db830	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-8d77-94cb18ab8c9f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-8f1f-b750456608dc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-d95c-9f1a189908fe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-235f-c50d23447d2c	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-9ac7-d6f8ef5ec7eb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-18d4-ae6d87ea96f6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-95d1-b37940e8df32	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-41e5-aa8688e6b691	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-4606-798ebc7e5a6d	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-9463-e6f0451d574b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-3b81-91d9f12aa991	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-2605-e407e27822a8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-c716-2e0f2dced0e7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-4e7c-f2b38289dda6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-f83a-23df7a15a2fa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-421a-6b923797da43	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-6b8f-ecce90fd9c6e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-55b1-cee3d7e67b53	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-af00-6b146c98be95	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7475-77b0efea2466	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-4e6e-89644fa407a3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-a289-9a7048a33451	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-6fe3-deb56da05aba	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-8f01-e4bb56350634	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-dbb7-684cfecb8df7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-2674-67be592c46b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-2dee-dafcaed27301	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-bd8e-4ef8c64b8d9f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-c0dd-388003c2da11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-71bc-96a865af0260	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-fa57-86e0ad430b1b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-0c05-2bb4aab61e6a	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-d61f-640bf1505b72	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-06e8-47dc9733e021	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-4721-4cea1a8ba84a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-8a42-1f82f3ccc793	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-549e-4320ce6963df	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-04df-64bb6542a37c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-0b0d-a0a7d5c674e5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-9caa-3b8b11dee4c2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-734c-a7fa1e0d9bb7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-85a2-d751ae9b816d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-9c03-ce7cf400414c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-e591-2f8dd8ebc077	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-a8ae-67f67c61ec77	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-2714-ea9f10ae7b14	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-1dff-7d689e9b140a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-2a42-5251e2888f3e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-2721-3c88c2d09571	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-c94f-a144bafa6e3d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-21cd-fe0663f2b075	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-0e44-435ea63ef2ed	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-f8a6-e04af841b6f4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-27f0-d2ab9d4e083b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-f1b5-6e3403ab605d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-59b9-862930a5d18c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-e7d7-ec74554d2ab0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-6f8b-db4a834de5d7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-edb3-fe8bf85a2b08	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-5860-cc47a30e8422	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-d2b8-8f872badf491	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7dfa-00c0572564bf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-91f7-b2de1c9fe5b7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-81e2-40ebe7de7917	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-690f-f78d0989b96e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-eb54-ef90ccc39e42	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-6e15-51527282a3ff	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-d98f-584f0a427a44	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-fdb9-bec8b9d1d6e6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-9990-b6a313376ec3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-39ff-3a7195734612	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-8cad-0b1c6cb4b790	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-479b-f1f6096ebdbd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-58c0-f0d83a4400f6	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-58a4-b9a5f13fbdec	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-6616-72c7d428e83e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-594b-f202f43ef79f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-0520-6bf8adcf60c0	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-981b-8f9220f0c08f	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-bea2-802168be07e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-56a5-0e5003135cd1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-c66d-f0aab9909d75	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-d936-a8502c6229f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-d971-259a7a817ec0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-7029-aabf0411a34b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-834f-beabca98839e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-9071-ee62a84bfdbc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-d687-7af0fa2e7884	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-c73f-608c42051d49	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-8bbf-a8856bf6d0ce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-b376-9ba873c723a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-339d-0661f4287f42	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-bd09-252eb47844cc	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-3657-21743c03429d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-8567-cc84f5c23327	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-a43b-a03a77b086dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-c9b6-6fb96217b613	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-e647-c3ec58be4ad0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-890c-300601078b02	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-5b79-994a0ca9051f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-a4bf-080753b535b9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-217d-581a6ee769a9	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-5d17-0f2047e790c3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-2cc3-ebbc57bbee8e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-7883-262b6c7974cd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-66fa-9a02a8701b3a	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-1fcb-a624366b361e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-e1e9-0748e1bf9b7c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-79b1-20c812601f25	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-1c6e-eb42efdba336	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-7f8d-442cb7454f03	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-29e4-c012acc263a2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-3c94-4530ffe64c8d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-6697-7760e067357b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-95d4-f9b873aa995f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-2d53-10bf0704b6af	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-31c7-1f9e68287552	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-2cbd-7d0e750956ae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-3d6b-4f19f366b97c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-9b2f-dea57dda6047	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-0211-2c629274540b	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-935f-4f3aa08caf3b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-0248-4153579424e0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-47ca-6954604da9b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-eae4-477f0a71ace4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-b3f0-95059d024287	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-cbd7-041c14e7cf7e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-a568-5a00c92c5650	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-af4c-3f305ccc1234	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-4d2d-b64c1d58d8f0	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-d3aa-9aadc7db87c5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-ca77-c2eef9343997	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-f873-8e13b1cbaf8e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-da3c-869800280a2d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-2756-67cc8885172d	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-9aab-cbe17acf2071	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-96b7-72e41b7c60e2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-2b42-11aa26bd6117	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-04b9-6c86711f956c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-2ea7-402f89c7e728	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-9f7e-cfed89dfd5fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-30e8-989637c5d7f6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-7e3b-4b0858f5d78b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-a696-933461385ec5	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-4374-2f2d4238f7a1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-4d58-95251601bfbf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-d9e8-f1de70bbf0b3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-21d7-c1fc01f21e1b	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-cc04-8be51d736926	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-0bd7-465cfb1a8288	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-b782-805a46e27e93	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-16d2-ba71767ae222	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-28c1-7c6b3e9a6914	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-c2c5-7991f932bc7d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-2255-fe87b8c10f06	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-86a8-9aea0442543b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-56d3-2b5e3a78f1ca	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-65dc-d66efccd0f97	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-6f7f-1858ed5b71f5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-f454-7a1f629a803c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-431e-2c3fc8502024	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-9ee1-325618e8ef2d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-5d4b-36459abf50ac	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-011f-67ce065b7a72	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-0183-18249e580f39	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-0147-5eaa8cabbb8c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-2fe6-fe3f437fc02d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-6a0d-5a1796313c4f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-d23e-591624dbe9aa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-a47b-b15df17594aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-f229-348c8847f290	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-e309-426490d4824c	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-16e8-9fcda2b2040c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-aca7-44bc866b3bd6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-e8ee-92fb304039b3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-5d67-ffed6d81952b	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-7beb-85edb74ae2ed	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-97ce-816f14084c6a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-9df9-76fb204b4193	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-6446-eb2f7d1e8e06	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-cc9e-1e6427136351	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-6ffc-dd419d32a845	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-5c3d-94ee36695ea2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-52c1-bb4838bd6811	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-2845-4d6743652c29	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-6eca-cc10e011b01f	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-e13e-c1ca23c5c035	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-4132-8ce16ee3d7ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-a856-c3f746df7924	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-a7e9-8cf46b14b6dd	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-a760-6fb73786d057	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-c878-235e92ee9298	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-9098-69d93631c600	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-778f-2be3ea5d0c5f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-64a7-66becd161301	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-64e8-b1fa27b82ecf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-a17b-3e0277c4d920	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-93de-ea144e8e44b6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-e0a8-47103d62c4c4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-7dcb-b6a41a1f95fa	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-4266-67b0d658adce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-942f-18c31573c818	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-3cb2-736c7741e806	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-96f2-e7ab03e2d04b	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-377b-01521218e520	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-631e-deff9d587e85	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-59ac-1973943d50a3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-71d8-d08de6a44d8c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-3033-7570e2735672	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-6a59-d58778b75a89	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-950f-c413517ae5cf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-aab3-e2d02cad3f86	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-27af-fe4c38e81294	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-5546-665819fa7dc3	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-3c0a-f719e024ae35	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-8a72-906a499868f4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-8677-ce6897f7d111	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-e167-47793eeeb829	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-4314-f451510f1e89	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-aee9-306502ad3b35	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-24fc-ebd491a8d202	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4741-8076803d8e7d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-fd44-448a26ee74e1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-a216-caf787edf1a1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-8f0e-f3fcf9360b16	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-513b-16b64ad5cedd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-4443-677ad0a2e44e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-26a0-8677497e2a70	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-9001-9c816c23fe5e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-94fe-0cc00f27d868	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-388a-8092a2edcd8e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-96b9-3e89e894360a	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-61d3-f0ebedbf28d2	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-45ac-c59bae52b07d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-9f92-8507cd994c67	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-6e2a-2111716b1e22	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-c26d-108bb5422483	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-5d22-91e8e7fd9f8d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-8370-78bb5c052ae5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-8c42-3ea7dab71f48	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-c7bd-447479144ca0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-369b-6b5579606cd0	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-d76b-843dfd52980e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-215d-c4dca1505803	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-5c32-84d1e3b987bb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-5fee-ccc5a0ff35af	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-ed7d-fb1652519c42	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-c29f-afacc6b94a20	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-fb3a-bc04304b973a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-d2da-bff61fe3ea00	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-c9b5-832b00405695	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-8132-ca15d29ce3a3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-cf23-49a70893dc70	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-819c-911bb67396c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-5ff1-70739979ab15	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-e136-4286f236dd87	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-0c8e-cd00748e732f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-449d-f17424e16134	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-c2fe-c8dc0c95dbe7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-ce8f-f133a283379d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-f296-a64b6a0d2e96	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-dbe1-cc19c5ae0ed0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-041d-45ba79de973e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-ee67-4670451a274f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-5ecf-0ba61b7db9b4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-20e1-224a08e5b431	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-8085-ad3146bd894c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-2fdd-19b1c899d168	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-e2df-7d428fe50425	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-3913-30520feb2ae6	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-3625-0bb5aad4078e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-0037-a7d8e9e436fe	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-1192-27ec82248113	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-ab16-31259627559b	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-affb-d16c45321081	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-faf1-14cf11c99dce	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-7cb9-4e916879939e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-0e74-aca9db5f2dbf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-02cd-65207b68bf27	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-8d82-945041ef07ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-52b6-096f653b2f09	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-3fed-c3ff78a3ad71	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-4fe1-1874d7d16a18	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-4825-659468916fb3	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-bef5-838c54944031	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-8093-5535050dfce9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-5e1e-3aff2e1684d5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-3390-4205a2ed9787	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-4332-4421a1a6ac94	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-ccbb-a65df9ddb23b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-547f-19dfc42d45fa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4fd8-03b8d5dcc592	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-f2f7-423ae8efb800	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-4a23-503d5b759257	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-88b9-ce5fd3d5490e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-9cc0-22883b6e4da2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-d85f-d378bc67ae75	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-a137-4af5fcfc20e4	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-ef3e-f77a995cba66	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-50f6-c2d939d740bb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-a788-57d56c14131b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-bd64-8ac215c65c6f	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-5339-a4fc5ee1a7b8	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-564b-69eec07cd078	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-63e6-65445f6ace53	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-b93f-05cd3092c2ca	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-d38c-f1be7acd0d87	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-bd0f-153d0c7e53b7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-c3ca-7247064b16a6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-0a80-4a28a2dd55df	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-3d2c-ba68d50cfd9e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-942d-b6aee1c54d42	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-ef0d-81a00ee28f01	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-31a6-17d45fb0a214	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-4828-b2f9517ce92b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-fd9b-0611cdd81341	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-e01f-e755031b4fae	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-60c0-c8925fe7846e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-aa4a-f30c28ab4ca4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-1abd-ce7580dcac67	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-6ad9-fa3fc4d46865	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-187e-865e6e5dada7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-a818-88dc2fc00a6d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-1ba3-ad36ca3c372f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-cc37-69391912da1e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-e3f4-82f783fce1c4	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-0abf-600593c9bcd1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-ff85-fb8b148b00c8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-19f6-c7e18d7573a3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-85ee-dc4a13e5c817	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-a7c7-fb3af8e3db3e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-72eb-987b16bf9335	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-893a-321dfc5e8341	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-464c-accfb4c7ae38	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-1339-6506a2eeb93b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-0bcb-8afd6236f115	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-6a25-79f0b0c1f455	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-028c-af97b22148ef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-8f03-44702688957d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-ad3a-e06adfbe0c38	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-a007-f309e03af254	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-a419-af136ea3f9a5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-0d57-98578019f361	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-8f18-f1d86053acb6	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-dc6b-655447d3567c	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-968e-48042273de50	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-8fd9-01305dd8a352	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-a37c-6b4aebde01a0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-4c1a-7704f77fe76b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-a373-18b580ea6fe8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-9cd8-cdc91d0ca73d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-2dc8-efb12a102f6d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-1bc0-01327ca24131	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-4ecf-e3f27fa19de3	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-b157-de6dec1f99e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-0a2b-934141f5fb7b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-bcc8-72cbc83f1b5c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-6231-60c4f0eddfda	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-be4a-56318e592de0	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-a56d-e50749a36650	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-9c49-d1725ae5058f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-6607-ff9b00d9c3a8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-4e60-4045e926e220	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-1027-66e566bf5e84	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-2cc8-11ea42ab1d3c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-7d25-32cac04adfb6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-b933-fc8252743824	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-f229-9d7c2734a8bc	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-e20b-5556da99f1c1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-a9c5-02c98ab31893	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-0435-801d62b04ae5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-efca-4bc889ea6120	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-edef-3483eb1b5986	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-018d-93aedce987d1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-7e67-b55e5f8bac3d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-5b4a-c05d13ef9b5c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-a564-0044244a1af5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-5530-75c26544c677	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-79a2-88638c559b98	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-94fa-8e922fe373d3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-ed9f-a61419b639e7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-ef9a-1b290a38fed5	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-5559-758086c3ac00	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-46eb-52253600223c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-54c8-ee23bd097604	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-c343-9e075ce0c80d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-0d27-79b28a0efd89	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-9e56-ddfb8d54265d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-e993-b55cc36101db	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-93f4-b81761e282a5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-cb08-3478305ae0d0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-6cc8-44e8f043cc12	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-427e-5faee0fd185e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-7d65-f545b2ba0bba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-6443-ae70d39ffc98	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-af1f-6da9d4aeda86	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-6a01-b827faa644a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-9f37-1c137edc3276	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-2a99-75a77d082e52	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-484d-99931480f33a	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-6abd-05552b27dc4d	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-9e22-fad6ccfd612e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-c3d0-f37b9fc0c3db	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-fd67-9cdfc891221a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-8417-490756737586	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-67a3-d074e6d53c86	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-548c-2b3a0e3de819	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-d6fb-ef0fa4aee4d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-e2a0-a7064f3c3879	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-df80-f7576e1f8402	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-8fe7-856c09a5ae94	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-25c3-8cba280d39e1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-a26b-9703c362d613	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-d356-84082eb7735a	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-26a0-5cc09d13d161	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-f1ac-bb3eb87d8d1b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-6607-acb31981a739	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-cab1-2a03908908c0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-7d5a-8c029a4ea42c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-0eb4-8f563236aa9b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-d2f5-0439bcc77788	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-dec2-8839bda21264	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-b639-1cf586aafba0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-bfbc-44a35c7ca8cf	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-a988-73401b2d6a87	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-47d6-ecfea65b3b2a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-6cf2-ef2281726de2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-75eb-66c88bdefa06	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-bb7a-b8fdd29d8d56	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-abaf-58dfbf5c17ba	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-49d7-840d88f03bb6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-edbe-a277d797a395	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-7925-83b3bf70a42d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-ef92-1f5e18fce4a4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-ca6f-7cb29a7ca6aa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-5071-7cf69e2136cb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-79ed-87497ab03c1d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-b782-9af548f674e9	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-82cd-47e0f5ca29ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-f737-b1a994b4fb65	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-8548-d7e7a5d2af10	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-d36e-42287d5f27ec	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-b939-8f5b5a9d896d	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-1926-6ea3d45c7e74	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-a8d6-a0d7940858fb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-f136-8945219cc7c7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-afb8-9d9453c98378	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-f7b5-9c4c6499a29a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-074d-6ece1e7b8386	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-a7c7-4a73ab633636	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-092a-8416e0181e72	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-db99-a64eafc80e25	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-1c1f-027c52354832	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-c212-aa578f4cae36	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-309c-ff8786c2f701	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-f32f-f0f1f607979a	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-7ccc-73f30fb4abc8	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-7b86-833c37f0e786	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-5426-ebf9fb06a037	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-3d61-597db1201963	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-33cb-abb44fcc853c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-5b8b-a2acb5718226	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-631f-e314b4d51331	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-1192-ef1f290cde9e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-cddb-697faaaaf69f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-d824-3228912d8d77	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-fe7a-d3f0e71a17fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-ad4b-596cb75189d7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-62bf-73ec552a2ada	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-ebf4-695a726b9e76	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-22f8-6796966e54b9	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-92f6-d387b43fc500	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-4361-1ed6d2cb93d4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-e5fb-9e742f45f4ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-ef4a-68713d367a87	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-de8d-1d051ca150af	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-b259-122862671065	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-90f5-13a9b6a253f1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-e9ba-8265f4a8a0e6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-5994-779d1005c9e2	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-28df-17ec2c63c519	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-a56c-fede7840828c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-ff11-b2b14f111ad4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-c1c2-5c5571db1d66	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-f9f2-2c0a2228d3fb	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-0c46-98ce308e8d93	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-aaea-c56b5fb2e63d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-d5cc-0ca69e39b0d9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-14e9-133bbf87707c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-f660-058836804ac4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-7519-cad93fb2ae6c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-68ce-75bc86dfd61a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-9451-1ea8eed89b14	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-2faa-d3ed59b21b2a	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-33fb-5ca476a80fd3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7dcd-27f99cb65819	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-c201-4efc70b0aef1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-e3f9-7db2fa811570	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-b548-46a6bad56479	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-9ad0-ab658021a245	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-68ee-2467b196338d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-3f8b-458d70164f10	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-4f6b-3ba0f33b7fa1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-ddb5-d0ae2ea9191b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-0346-6c8cb937a8cf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-ede6-920751a230e1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-7c88-08751cd189c0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-bf7f-cc837ec53f48	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-4970-024cf16780cc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-fb76-741d4a38c37f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-118b-afffbf696f46	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-742d-047265c8369b	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-86b4-8531994b9226	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-e16c-3f2448aea40c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-cf37-0d7d5fe02e6d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-09ba-e4c19bd4245b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-5dcc-4d748a70c4a6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-70ab-d72dd8268ca9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-71b4-bc1503d5e337	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-97c6-0272f6db7da5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-7f26-5eb2e0e28e62	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-54f6-d2f72fdb6466	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-699a-c45d5182691a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7c01-9fe60bd58a06	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-ecf7-d26cd5aaf966	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-9336-028301914b08	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-8a88-e4a24e05bfd7	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-d6e9-6db073c08d4a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-8221-95033f8b554f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-0d81-5f60fe134849	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-8caa-ca677d60b78b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-eeb2-5664c3b88cb9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-8da9-e54c7ede1020	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-26b0-fa754b57b713	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-914b-3e8e84688585	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-4dc1-39a2eac92d6f	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-d471-3b82dc58a1c5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-389b-1578b6dd2435	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-461a-bd5ca995166b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-6434-ddffd00e705f	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-364a-1124e7e6ed7f	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-9e39-4fce680f158a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-da7a-5f52faa55b69	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-97f9-032ac8adc198	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-9a6f-3418d1ac3e62	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-6ed9-a046ec0b3fab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-f859-dd33dd426ea8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-1c02-e32f47bc97e9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-2b8a-4f2537fdce5d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-ff58-b7cd42b4396d	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-a5e2-c80478f30e0f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-ba92-6af391054e9f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-2d49-5983d28b4aca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-7026-ae7e0cdd1b5e	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-afb8-7d54e77b7625	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-771a-591f2cb2cb15	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-f8c0-4d6bdae12231	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-92a4-ee61c4333d30	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-f280-39fb2c05f044	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-8aee-630b6fc801f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-f01c-97f66f8a0261	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-63bd-732822ea27f3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-1edd-4fda4765ba7d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-6c84-b89e0eacf2bb	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-879f-e9b7b40a05ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-6bbb-3f25d4222b96	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-3ca0-71d2f8303dfe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-6001-2b37f691f0d1	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-89c9-d0bb85ea8df3	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-584e-5997511213f9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-5fd2-af61a35c308a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-1e9d-ba8b7b86af44	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-98ba-f1e3bbaa6935	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-ccd7-93daf40a4f36	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-fa51-c67fcb3c85c8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-cb29-d156f41a1fca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-629d-2d3dab96e69c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-2d0c-529aabb75252	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-4550-42d4ba3a3b72	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-a9d2-48326e424db7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-f3df-6cae8ab175e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-9a6f-ed6a68d4734a	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-c9e3-fcf6fcb1088b	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-d036-00119f832741	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-6706-a73b485d7ce2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-64bf-b5422863397a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-d22f-8b0b4f95e66e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-9fa4-8c7c881ac36c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-092a-aa413b43be39	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-96d8-aca33aeca2b9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-229c-39494197a83b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-adbc-5757d14766e5	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-f653-684abbc2af67	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-8673-82e323eaee78	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-7f89-57e874c2f052	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-c443-8ec607325c89	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-b7e8-bb559f7d7878	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-a3d4-c5802021bc35	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-45f3-d0fa66aaa375	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-c279-8128cc2fbd94	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-9bae-a8f633c54e19	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-ba4e-7c9e68b91b21	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-e635-2920fe364db9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-e7e0-41da99349ebc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-875b-8ebd5e460ec4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-f1b7-19c97f85d75a	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-6700-34424675e0bf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-6e03-68eb1acba6f0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-0797-20ba15cc72b6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-e4fd-3fec3804dfe5	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-5da8-bf43f1743813	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-c60d-c9824ee3a8b1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-551b-b82e3456f73d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-3f30-41ac888574f9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-eb06-73763ae76657	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-1279-26409a1ef5e7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-aa2c-a9005e0bfdfa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-bffe-bf5d05616d34	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-d2d6-bf410646aad0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-830f-3f51a09defc5	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-1ab0-e03cfe118d0a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-12e2-249b6c6f6094	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-f2e7-4aaa5bd87b50	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-1097-b5d946f59ef8	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-da0e-e2524e8732fd	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-7cb0-64a6b119d08c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-c078-9a406beb0d85	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-3b69-8549ff889d4c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-aee9-e8a80dc2deda	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-2d75-1bcfd4e548c9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-4d44-fa9cb2ebb97a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-5359-eef7d6c4f07c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-27f8-ec3aa853c3f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-a56c-d2ee7cf02bf2	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-8c69-caeb6f600df3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-4b97-df6c352b8428	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-0548-fbb4322c94f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-a4c5-f78069fa99a5	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-2c77-de1339f62b4e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-0ccf-ca60c79591c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-c457-d0bda6e6576a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-e9d9-c1f740d7e51c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-e850-b42e6e181e8d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-9f1a-3dcedca7e0e5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-7edd-41ecf64cc694	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-240b-d9e1b17b2357	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-a6b0-e457c1153cff	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-51dd-c8328b8c85a1	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-0aae-b25f08834a9b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-958e-3da585b4f595	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-5cef-73e8975fd123	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-2e4c-12dddb1c1635	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-703d-7317e6e8c7b7	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-b1b7-8c79f42d4321	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-aebb-077db061d4c7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-0029-5fa712893bec	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-0bad-83d3af84a602	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-1b51-775dbd04f7db	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-38f1-650a335a9b6f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-fe9a-fb22d9dd82d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-28d2-7db64a553bbc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-9112-f0b9f2b77f26	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-ee0a-e1d82f2d4254	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-94cf-4c79bd74f77b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-94db-a86594691a0c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-8659-214ff6e85e2a	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-4275-cb65b704be18	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-e834-e65096955d0e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-6dca-772af5a474d0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-9734-be7956c012b0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-9fa1-54e2a63153c9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-459e-3e6de22c8141	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-2d87-3855520f4233	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-b88d-82307dafede6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-f063-309fa398aeaa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-3d2b-e653a5137061	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-4f7b-b3002d92afc9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-907e-9e6d3f5766b2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-fc35-6ee42e29a51f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-4259-1aaacc53284f	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-126f-025c041d9a93	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-6a47-e2301d492ba5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-513f-f5818b5c6521	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-9f40-176bbc227b7e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-b7a8-04aa10c50aa9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-777b-896eaf808ca1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-e9e0-efccdfffa011	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-6ffb-d990121079e1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-8454-4db3c2b772ae	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-7762-dccfd76c9d1c	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-9bb4-8f2e2840c8a1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-ca6e-c7664b54bc7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-edbb-1ba5d5983e3d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-4736-2fa5d9454647	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-ccb5-721840f3e438	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-e6df-90dc4419ca06	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-8dac-9d9fe13a13d9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-bb22-376c536720eb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-fc74-ebb6975615ab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-2fae-f5f9e9c4a38c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-f93c-8a5027bc3869	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-d880-002e6a0ec4af	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-f2af-913bd283d2f1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-93a0-133af0d37a88	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-62af-0c56cd6206ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-9baa-75875a9fca34	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-89a7-178ba52fed26	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-7dbe-e76065af75d2	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-e98c-a1f6eb7edb4e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-36a6-d93c65937ea1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-165b-771bd798e064	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-ed39-3b81f10604d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-aa45-eac1f8acedcf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-9d47-03552135565c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-cd73-72086c772b3b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-1085-8ef6375d67d9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-c445-9613d7d64da2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-47d5-78cd70940f65	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-ece4-e0e1d2d60568	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7e52-05e70c0a2219	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-9c8f-ad983c048adc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-1cd0-ee6ad25ab1bc	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-07a3-c065da5ca6d1	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-2eb0-20e8fd954674	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-abe7-0d7123a480d5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-2c7b-e8c073c0c691	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-d6dd-7d6c5d04d473	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-85c4-8ccb1bbfa28d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-7fcb-be7028a25aaf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-0f1a-36eaa3a41d2d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-6d45-7c2e956e1fb9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-4bae-777421f3509e	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-cc4b-ce408686b34b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-9d5e-8e288b0792ff	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-91c1-80cb7e870253	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-d0d1-330eb4ba8eba	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-74cb-8e2e07d55d16	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-1cfe-53320a3de321	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-b1ba-83c2fc001b03	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4172-6398399dbc50	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-4017-359ee4c30b57	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-710a-480534fbb754	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-4bc8-89a2aa8311ab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-30a0-066f4a3d75c2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-3dc2-dfe596a4970a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-d6a6-8ed690bc23ff	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-626f-2c783fd53175	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-3407-71f23ab3e253	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-6529-209e615c1b85	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-91ed-d5d4ec9ad685	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-0d0c-da7003bc753b	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-56af-5b383549f819	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-1070-0a3f03bf5b6e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-366d-bcacce932717	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-2425-18b8c2ec3e9c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-e31f-6bbfdf80ef26	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-f879-0c45a27df4ba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-4978-3fde9e0f52ca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-25e6-269759428314	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-5b50-f5cd51d615e2	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-af65-4f5547206489	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-fa54-dc88c3d1329a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-c897-71a973a0ceda	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-ebde-c53462d39548	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-a6b1-a3c263b58bdc	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-16a0-ca944df8d3cd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-1af0-7a53b8b4beae	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-3d4c-aa7414f79a9b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-181e-2bc45d21e411	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-c6bf-6b94496f03e6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-d68d-8fea8b6c20b5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-2288-5f8e8fc48437	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-bf80-74f268fff4a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-51f4-48c9d15baaea	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-9117-46af7216b1ab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-14ce-1f2f02bf7122	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-bc36-4cf763a42a0c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-e04c-52317b397e21	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-2e0d-0f6954a1fd58	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-ed42-3e09393e86c8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-bfb7-a0111dc3dfd8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-9a38-b8ad1cf133b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-a5a1-d4d596590893	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-e31e-e3dcc5b43fd7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-f21a-728595650ee3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-7822-edc23e745f49	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-d459-9368c2fd42d1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-4ec9-f7d38c2ab821	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-291b-f0ff325a7dc8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-1607-418033b88ff2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-c035-d95676718add	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-88dd-523f1f83fa8f	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-f40e-09a903613e70	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-9c09-f8aac5bcc184	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-b23f-97a54b6c7b4a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-84c9-c9e4d620c88d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-11dd-ab18ed6f68d5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-a913-ab580253bcf5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-44ca-08b1f3bd5615	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-79c6-f3c2b3963cc2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-19a0-9103fbc20569	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-3d1b-6d681df01c50	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-070f-2d0f48adcd3a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-34aa-fa58af718756	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-60ec-7d43b428f935	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-b6ca-e3c75d4bd5b1	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-6d17-560fa761085f	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-4f0f-aa7803a18ee4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-3910-7fd2bc57cd1d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-27a7-c69a5e1544e2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-0894-38d302963f42	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-e429-396e2c06c15d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-4e37-8272a2c62677	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-9d77-199a2c38d377	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-08bd-cd7c09c2dd3d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-6994-ccdf2a1bf91f	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-38cd-1b3e9f88f8c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-1578-20ef2ceaf287	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-07bd-793980efb3c5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-58ae-b822315beeb2	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-4657-5c6d798b3b0a	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-1afc-b7177fa89d55	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-d5fb-f8504a06c768	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-185b-b508f9236c44	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-0e83-e9b52eaf766f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-a546-ffbd6fa60573	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-90b9-affbcb4114cf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-0f4f-18bf87ab2cba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-7a1b-7c110ecbd1e3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-af27-921c14994a3a	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-9a21-987b5519c257	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-efda-3444c2a8c54f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-b586-8d3345a4f767	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-0bf2-d64055e7708c	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-fa0c-22f3b5df45d8	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-a213-c944d2b1487a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-524f-31e685a0df37	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-14aa-d8a27d01fc8e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-ca31-ed1c762e5d1e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-9bad-91b78dab76fe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-8768-fa62eabb6d68	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-3bac-cb3b3ec7718e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-0f36-0ff72d62581b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-448b-690c7b2dd229	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-6c2f-e5cdf70fbd79	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7a00-68f309076467	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-43a2-34818e3ca786	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-1b1d-bfd59c7265d6	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-231a-b00db8335df8	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-fe79-e6db0642578e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-578a-e839509bc279	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-a1a2-cd4be3645c9e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-274a-9dbb0c473236	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-8807-0bf5653a4e06	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-2092-14ad472c8359	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-e59e-fa69a55da725	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-0e01-ce668f0bcfe7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-a884-71b359fb7517	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-a1e2-8ca1374ae866	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7daf-caadc8e54241	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-e71a-a330167ee858	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-191b-babd7aca5616	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-84a3-97b93baac46e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-6103-978eba7d6260	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-0a2b-3e4e907e67fe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-466a-daf1c78e1941	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-a26c-0a30adc10e45	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-39ad-0d2039e30c5d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-3cfd-6aa5f3940b20	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-d4f6-9f3aa3362cbb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-6e5b-1f9bc0c9d7ff	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-0366-5c16b010549b	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-b084-44f38a0e0ec8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-a0c1-a23ad2b09e52	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-f7ec-c39f996d832c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-b3da-dc389f7b4acb	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-ec2d-5d55737df1ac	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-fd8d-d4b5706d163a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-9065-fa2a69061982	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-edc6-a2b4b308a6a5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-9148-ff4b7d83d85c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-f985-5fd76a128304	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-9544-2e31deae571a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-dd12-553c01486e9e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-7509-d488799b4190	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-e686-beabe7295b07	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-4d5f-aa75fa8eaa4a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-14ea-c45a9d556869	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-189b-20dc4ea5c985	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-104f-82ab7f121df3	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-4595-b182bb093f6e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-7152-2c00cb36a10c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-2b71-32962ea9d0ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4ae6-68af40c27f9b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-96ad-07840503e8e7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-528f-4bd9a471772d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-96dd-9a42a4c0a0a9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-ab90-64bed455a87b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-d0ad-ee77d3b0e6d0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-07e5-cb03df4b6b6a	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-295c-ff119f6a010f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-ddd8-710d5f6b5936	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-098d-008618880624	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-b3f8-3ce4a243cf8d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-f6a9-efec58d20a2d	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-c7e6-3363fa24c590	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-ffa5-2419343a967d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4c26-3dfced510ac4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-9013-b02d1ca56491	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-959b-e329cfe39245	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-32ac-41dc8c92dcdb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-443d-7940bbbe5010	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-1f19-6c41d5490dc5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-38b1-371852210bea	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-b6ad-e4c6e0354869	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-4209-8520df7d0e63	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-42b9-b42e435cb328	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-c01b-1673592b726e	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-ee18-092b269c3b05	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-f2b7-11c72ff949ea	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-0cd7-9399810bf3b2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-231a-7011ff3e3d2b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-56b4-6ee92eddab87	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-cc9f-5e889c7f1aa4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-6b95-1a5f6071419b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-ea89-89d5229a6483	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-1531-91e467623a03	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-5345-e16b99ae2e00	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-d80d-4860249a49e7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-5e37-baae192f06f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-14fb-820c555cdc6d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-6db1-2e2c45948ee5	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-7232-104bf8693bb1	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-88b5-9bc9de142ea5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-b211-6c144e9502a2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-3f6c-16ab02f7bdac	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-00b8-e3b000bd7cc0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-7a99-4ecbfd6d3dfa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-3eb6-fd3923b8ddd3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-474c-18e738d71617	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-a41e-3c7fec12cb74	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-8600-b9f8ab371378	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-006d-b2be59c972c5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-48ed-0bcb9121f596	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-ca36-d7b6157ed48c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-782e-a5f394204dd2	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-b807-a384208f8329	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-4b23-1c1ea7f190a3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-10af-5d2103cad1c8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4e96-ac35e375b109	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-f154-dd0e50297c4f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-4fc3-4218bc729746	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-ecc4-6ab74cfa141d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-87d4-4d1ccc870937	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-a8af-a73a1237f6f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-792d-2e4f2391b97f	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-b042-d30aeacec6d2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-8f74-84d32a9fea02	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-d7ad-2155cc8a72c4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-fba7-bebd2ef2882f	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-3224-f26010e01198	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-0bd6-5f3242b219ac	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-81a4-10084c279c8f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-b282-74063ac97e4e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-c2c4-521d563bedc1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-daa3-4604b2bb2ff5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-d045-8966a6fba26c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-7696-b1e575ffb8d3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-eec1-9adfec680c36	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-1364-eb44abd7ba77	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-968a-48099af00789	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-0d5e-0e635825d162	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-b74c-cb1383f5864c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-5d3c-477dd36a3f35	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-a6ac-930f73a8b3ca	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-7387-18bb7329734d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-1237-c7827b789d40	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-1ee7-8976777b3d4d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-7990-27ad1ece677f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-f109-aaedf8a773be	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-8a34-c87bf2955580	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-edcb-41a96a3db659	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-c307-0f8dfe22f454	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-ba55-b7666310ce4f	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-cc37-be637c84e95a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-4406-093e7b08ebf5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-31ef-ac9c2e2c824a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-5fdb-98aaf9f4ebb4	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-118d-0e440693ffd8	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-453f-49bfb3a11da5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-6d52-9ec47f624d23	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-60a6-5df9636bf214	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-85b2-d11db7efc068	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-91a6-1496c1208f13	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-7fa0-3614e1b5a9b8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-9698-86f8db29232b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-b51b-319a475e86b1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-33bc-bcbcb84373f9	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-8990-addd7a6d982f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-cb59-da51d6487e91	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-9759-0a558f8ef92d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-33ef-e75c98d1309e	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-1062-ac2af18a1991	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-76e2-e80a33010cb8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-5c64-4cd56196a567	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-5143-2cbe5182410c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-93f7-61100ff314f2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-e991-442bad1a3cfe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-2231-273ace27186f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-e097-a1fbee14cc9a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-a08b-081d99a153ac	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-1388-ef2b179cd081	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-8d72-ef9d6ebc077e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-902d-655f3964a8f0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-a393-5f1dfbd0c8de	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-b540-f37b6add8994	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-3faa-d819c713332d	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-4a30-5075a1c8fc83	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-8ea8-732a27591baa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-0d30-58fb1581328d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-4c33-61979c938421	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-4794-43a78909694c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-513c-2e57fd97e478	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-2689-43afc5b1552e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-49c2-7ec698816233	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-2c63-f471d970a709	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-c038-05aa68be36b0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-99cb-86ea9ed69f14	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-c1da-955f2c1951fd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-d3d6-b8e3cf3fb2d6	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-a4bb-11ce0d7cdfee	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-2472-8e6dfd51a084	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-f832-a5f34febfb45	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-85e8-a95b0a960929	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-142a-1ade14e2442d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-7863-f8a7e14e2baa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-1438-90dbe17b6c9c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-761d-c258d10016d0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-c4d5-5dc5692ffbb1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-da81-d6514d39f5d3	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-0393-ef6115eb9a09	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7765-40d4476e3087	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-49ef-7e03f7091302	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-6322-7f6602b2a64d	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-efc7-eb95fd1f01b2	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-c435-dca9ce2dfa17	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-d4ac-fedcb280564e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-23f4-498f5b71c760	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-502f-79b8c11ba065	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-9038-e422e323aa07	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-4af8-1dca854a3f76	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-e3cb-0b0a90824f4c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-acda-683492defaeb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-ab82-d62f50932301	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-1e0b-ff9eed8b33c9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-54c3-2ab94fe9cdc8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-7f69-32c7e9425902	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-0000-9cfa4e0d8285	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-d0ec-c593b28ecf7c	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-469c-5885f6cebd20	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-62d4-b4ccef031727	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-f1e2-7c3e32064c0d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-0ed7-54bfad77d0ad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-24e8-64b228ecd0b3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-052c-2fe6d529f2ad	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-daf4-85dd1d70f5ed	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-c856-d935e26e26f3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-ec68-0ba13e180636	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-460c-874c01da77cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-c7dc-5163f69c3b8c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-37d0-3e041b7814a3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-42ee-331bb7f24f84	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-1b8e-af23bd91164f	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-51c6-a7620ffa18c7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-f45a-913b65320164	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-d1ec-521672de7235	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-57eb-c59859d6058e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-01f5-49a0260ecdde	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-95e9-00cab8b093da	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-255f-426f0f3cb66d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-de81-d2dd719d8e2a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-decd-bc9a1d090af1	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-4393-207b6e499611	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-d89d-f50e2252fbde	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-ebe1-f47809f536df	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-b758-e314720d4dd9	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-e643-26131df99e23	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-3c91-31d19acabc1d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-0f6b-4864b73d9cb9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-9f4c-1673d08fc0cf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-2202-a66526c5a4db	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-4d56-7e22e84f1cab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-eb0e-6d8408b81b7a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-7b85-0d3614382523	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-1ce5-c0a4136fcf00	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-493c-12e4a37fb102	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-963c-e0d21b8d86b8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-3c54-15fe3992ac07	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-3ee9-aef0b20b4e62	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-c0fe-61b25fa97030	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-35e3-c1786f315866	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-c3bb-6707a649e71b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-c001-edf3afaf52c8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-8b16-df54b9814c6c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-32dc-01838c78784b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-2c3f-2ea3897fac07	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-2d17-a1b8af98af03	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-1ad7-b7e5f03d0020	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-dcf3-ce65906456a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-963a-79023a6ca751	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-8955-0e0f600a7a69	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-b1c1-3e90ef56c14e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-5eff-31d4621dfd42	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-356a-5b352983cc08	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-879b-64d355bcee96	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-9e4e-52703010b5e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-d158-8e887e2bee54	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-b5c5-060e0f333934	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-fdde-310e95a05574	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-de55-599d8d1f7a7f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-1b63-c3ffe8ea7d11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-b6c9-abfc892cae98	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-fd48-be99e207bc1f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-56f1-86663abb1440	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-93e7-10be452e7d2b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-0c73-c66af76e595d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-0e59-d1b35dc17b47	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-6b75-58a8aa53ff72	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-f022-7570c64e34c0	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-323d-b79f3e4860b9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-d71c-ea656529434f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-29cd-260e3b259325	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-1cd5-eadf11414416	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-1018-b3a33f9f7ff0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-e0ed-9f3a8ec1fb66	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-51c6-306a4c4eb9a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-d699-781a7c226e63	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-80cd-3b7eb6d3d485	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-453f-00f8cbe1b98a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-702b-537363a2a392	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-71cd-ed48fd5e2c7f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-0564-c54081503ca9	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-9226-659ff5415e3e	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-ddb9-eceffa10a6c1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-1e3a-fb35b41ba450	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-f10f-1f0b29058d9b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-7dbc-c84ea7ffdbb7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-d3af-60f0ef3ca27d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-7708-c327f05d6f0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-4ec5-d505ac01a8d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-718e-4936d0527cee	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-8bf7-5ede957f8a51	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-21c2-27900285c5d9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-e131-8df4ee2c5c85	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-e4b5-fc62d149104e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-d0b0-c8fbe85da2ed	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-d2d9-c5dcbfebc5ac	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-1eef-e6163b838ce8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-89bc-08f50ae644ee	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-90f8-7961f13cc1f3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-f199-0d7bcb57af31	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-ed5b-512c0af9ee09	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-7774-cfd36568638d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-1bc7-555ee750e9e0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-2afe-77341f9065d3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-4886-569fe7f41fd1	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-0caa-fc0a87204d87	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-074d-21d1e880afd8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-cc67-f4e02f4c9f05	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-4cc4-0bb07c3c8ff5	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-fd31-ab33ce29d287	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-88c7-1ad858ea828e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-f6e8-efcbfdaae9b8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-088b-8636d2302409	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-b64d-d0e04030a24b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-e8a9-1d395c3fad56	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-01e2-951e2d99c2d8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-13b0-7c6cc553c774	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-99ec-078fce4aa7f8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-d01a-f6ae7e651c63	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-5a6a-64178feae45a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-3419-0f3c21f5b023	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-131f-d3603b2d32c7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-be9b-5ceecb7e5ded	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-46ea-e06a701ea14a	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-0cc8-aac347eedbe7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-3564-5365e41de6ab	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4a71-333806079a8e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-2c7e-c71b1d2da9a2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-2f14-4929dad141aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-1cc9-6405974b3e97	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-61b3-9e0c646f8969	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-5aee-392a5f15083d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-767d-b628bba5ccf8	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-39a2-63d92c8df368	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-ce23-831a685d5d08	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-1df6-15d6869a0219	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-5224-a0a5b7d62a9f	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-5c2f-124562108ea2	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-c36f-9eccbe7afcd0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-c684-7c8160644210	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-7f37-0220f0b74c5d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-c188-9719008bb9d4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-b995-6393ff440551	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-6c0d-663b8a3a04ca	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-5980-ecbfe9645feb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-ed53-111d6dab3f91	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-2c72-fd4405fdd08d	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-a3b2-1bf86751b8ed	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-7233-fe2ee0de6837	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-9694-293dc97c4292	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-4c53-f2608ff34d84	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-732e-25df58677db9	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-a869-0e6cec1009e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-dc14-27f8cdd42d86	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-9314-6c020c20b632	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-80fb-1d973e168a48	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-1328-9d67d8bb0fcf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-47b2-5a88d990c644	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-f8cb-111d2703ef5e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-ff16-2d5dbb1f5391	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-df40-814c8f485a47	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-2b37-7d3f20368607	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-5f1b-6e429ebcdc78	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-e448-7be839a62caa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-94a6-7898d21ecf9f	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-f896-a07faa57f4ad	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-511c-1c06cd8d1326	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-7fcc-dc291ca7101a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-09ab-b7be00acea8b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-30ed-aa6f0e6b2ffd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-b210-efd1b52e76c5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-ee1f-074e8cc44da6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-8ba2-0de314fe5c52	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-fe3a-3ac8776563ef	User-delete	Aaa - Uporabnik - Briši	f
00020000-5539-ef78-6b26-29167429583b	User-read	Aaa - Uporabnik - Beri	f
00020000-5539-ef78-ff07-df9a114e5048	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5539-ef78-63f0-1bcbd837c672	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5539-ef78-66b7-a50d72eec67b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5539-ef78-4082-32d718339fee	Role-delete	Aaa - Vloga - Briši	f
00020000-5539-ef78-5a51-0d6c291780e9	Role-read	Aaa - Vloga - Beri	f
00020000-5539-ef78-f667-f4ce97efeeed	Role-update	Aaa - Vloga - Posodobi	f
00020000-5539-ef78-7707-13a541e6f0e1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5539-ef78-4c6a-66371cf058ca	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5539-ef78-294f-4946a7b37226	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5539-ef78-6805-501023b9dda9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5539-ef78-d487-2d84fe377dbc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5539-ef78-bdb0-2bacc97f11bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5539-ef78-0d4c-ead8d0f4e1e8	Drzava-read	Seznam držav	f
00020000-5539-ef78-e769-0a74483b1f89	Drzava-write	Urejanje držav	f
00020000-5539-ef78-52ca-64d667e61bb1	Popa-delete	Poslovni partner - Briši	f
00020000-5539-ef78-3c37-30a165c92f14	Popa-list	Poslovni partner - Beri	f
00020000-5539-ef78-2029-38403ff6d14a	Popa-update	Poslovni partner - Posodobi	f
00020000-5539-ef78-ee83-aa2be0e62306	Popa-create	Poslovni partner - Ustvari	f
00020000-5539-ef78-6580-c3da61011df9	Posta-delete	Pošta - Briši	f
00020000-5539-ef78-a9e6-81ad7e11439b	Posta-list	Pošta - Beri	f
00020000-5539-ef78-1b15-e12296760c92	Posta-update	Pošta - Posodobi	f
00020000-5539-ef78-818f-5bf53fa371df	Posta-create	Pošta - Ustvari	f
00020000-5539-ef78-bc38-0dac7a541738	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5539-ef78-597c-ccf078130b62	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5539-ef78-0c86-3a792b958205	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5539-ef78-a1de-e9be0a02160f	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2635 (class 0 OID 1157451)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5539-ef79-6f09-8cc89027bb17	00020000-5539-ef78-0d4c-ead8d0f4e1e8
00000000-5539-ef79-6f09-8cc89027bb17	00020000-5539-ef77-ca83-dfb76d22c85b
00000000-5539-ef79-c027-beb72bff0a24	00020000-5539-ef78-e769-0a74483b1f89
00000000-5539-ef79-c027-beb72bff0a24	00020000-5539-ef78-0d4c-ead8d0f4e1e8
\.


--
-- TOC entry 2663 (class 0 OID 1157740)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1157770)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1157882)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1157510)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1157552)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5539-ef77-ddc8-b42df7dc3304	8341	Adlešiči
00050000-5539-ef77-99be-fdac1f18d488	5270	Ajdovščina
00050000-5539-ef77-bfa5-d239d8a66848	6280	Ankaran/Ancarano
00050000-5539-ef77-a7a7-5b0a36afeafa	9253	Apače
00050000-5539-ef77-86dc-94beaf48eabb	8253	Artiče
00050000-5539-ef77-feaf-7e0e6d2192aa	4275	Begunje na Gorenjskem
00050000-5539-ef77-e95c-1d8792b37613	1382	Begunje pri Cerknici
00050000-5539-ef77-27b0-070ab5554930	9231	Beltinci
00050000-5539-ef77-a632-b0eab34a95d1	2234	Benedikt
00050000-5539-ef77-ac7e-5aa6fca6e32b	2345	Bistrica ob Dravi
00050000-5539-ef77-5805-bda817642bba	3256	Bistrica ob Sotli
00050000-5539-ef77-8f7f-ff441d0b1acd	8259	Bizeljsko
00050000-5539-ef77-91bc-3f42472c6584	1223	Blagovica
00050000-5539-ef77-5333-3401cd9dbfa4	8283	Blanca
00050000-5539-ef77-36fc-aedc5a858c88	4260	Bled
00050000-5539-ef77-03e5-6fc8cbafab37	4273	Blejska Dobrava
00050000-5539-ef77-9104-1fa88bcf6f5e	9265	Bodonci
00050000-5539-ef77-7fa3-e9c7c4b2a4a7	9222	Bogojina
00050000-5539-ef77-a7f7-17b607c4c011	4263	Bohinjska Bela
00050000-5539-ef77-c3b7-35bf75e2dbc9	4264	Bohinjska Bistrica
00050000-5539-ef77-42c5-2dc6ddd162d5	4265	Bohinjsko jezero
00050000-5539-ef77-8440-b5e273c27ec5	1353	Borovnica
00050000-5539-ef77-43e5-adcf22472809	8294	Boštanj
00050000-5539-ef77-586b-cb8e475b96db	5230	Bovec
00050000-5539-ef77-c3de-188813d004ae	5295	Branik
00050000-5539-ef77-f653-d739862c4d33	3314	Braslovče
00050000-5539-ef77-0b6c-d3c3cc0f057e	5223	Breginj
00050000-5539-ef77-c4dc-3bfe9d3f3651	8280	Brestanica
00050000-5539-ef77-a099-d75e7a1a9ef6	2354	Bresternica
00050000-5539-ef77-3b62-7873e7eadb13	4243	Brezje
00050000-5539-ef77-13fe-ef33b7cf5422	1351	Brezovica pri Ljubljani
00050000-5539-ef77-00da-a7154b7c1466	8250	Brežice
00050000-5539-ef77-0f00-cf6787136e9f	4210	Brnik - Aerodrom
00050000-5539-ef77-f0ce-023e95a99881	8321	Brusnice
00050000-5539-ef77-3e6b-3fded02c0e19	3255	Buče
00050000-5539-ef77-3bf1-eea7a2600ff5	8276	Bučka 
00050000-5539-ef77-4159-85335548098c	9261	Cankova
00050000-5539-ef77-dc5d-381c82f5b21a	3000	Celje 
00050000-5539-ef77-c9a5-60860aa705ec	3001	Celje - poštni predali
00050000-5539-ef77-f7e4-56d62fd756f7	4207	Cerklje na Gorenjskem
00050000-5539-ef77-b6cc-62e2e9eeabaa	8263	Cerklje ob Krki
00050000-5539-ef77-d11c-8006239893a8	1380	Cerknica
00050000-5539-ef77-b946-15aa6f6e93f2	5282	Cerkno
00050000-5539-ef77-399d-8803b1cda8ac	2236	Cerkvenjak
00050000-5539-ef77-5a06-c86a0a893f3a	2215	Ceršak
00050000-5539-ef77-a20b-2c8220ad5ec1	2326	Cirkovce
00050000-5539-ef77-d84d-1dc4d722ff2a	2282	Cirkulane
00050000-5539-ef77-336e-c32a8a001662	5273	Col
00050000-5539-ef77-2888-daf82af7bd9c	8251	Čatež ob Savi
00050000-5539-ef77-fb21-f55fb585181a	1413	Čemšenik
00050000-5539-ef77-8887-d2fc85402542	5253	Čepovan
00050000-5539-ef77-c798-3a2a86199f26	9232	Črenšovci
00050000-5539-ef77-be7a-044058277858	2393	Črna na Koroškem
00050000-5539-ef77-1d4b-cebb20e1fced	6275	Črni Kal
00050000-5539-ef77-219e-54794ab9f56b	5274	Črni Vrh nad Idrijo
00050000-5539-ef77-bf87-9f6487c95152	5262	Črniče
00050000-5539-ef77-7491-49b7921c4a10	8340	Črnomelj
00050000-5539-ef77-e9e6-0c93af7df167	6271	Dekani
00050000-5539-ef77-39eb-13dc1e7fa170	5210	Deskle
00050000-5539-ef77-1ce3-da1a9b364b86	2253	Destrnik
00050000-5539-ef77-211c-adcfa1698063	6215	Divača
00050000-5539-ef77-90c9-c65c96afe3d5	1233	Dob
00050000-5539-ef77-92dc-2cd4c74d990c	3224	Dobje pri Planini
00050000-5539-ef77-21e6-39ff4dc1433c	8257	Dobova
00050000-5539-ef77-4fbc-3186f381b74c	1423	Dobovec
00050000-5539-ef77-bdb1-1e934a55efe1	5263	Dobravlje
00050000-5539-ef77-0bdf-5fe83d9e7c9f	3204	Dobrna
00050000-5539-ef77-b467-2d711a9df86f	8211	Dobrnič
00050000-5539-ef77-9cf0-8a5f729be3b8	1356	Dobrova
00050000-5539-ef77-d6a4-617f4930e06b	9223	Dobrovnik/Dobronak 
00050000-5539-ef77-c277-bcadfc81f720	5212	Dobrovo v Brdih
00050000-5539-ef77-586a-08655a45693c	1431	Dol pri Hrastniku
00050000-5539-ef77-3b44-770c527f1593	1262	Dol pri Ljubljani
00050000-5539-ef77-2b21-4ea24dc1fd44	1273	Dole pri Litiji
00050000-5539-ef77-311e-b7e4bbdde05e	1331	Dolenja vas
00050000-5539-ef77-e9c1-a3d7b69dfa23	8350	Dolenjske Toplice
00050000-5539-ef77-d59f-0e4c9e3d1da1	1230	Domžale
00050000-5539-ef77-c6b5-aad2db41db1a	2252	Dornava
00050000-5539-ef77-5fa2-9824b874d128	5294	Dornberk
00050000-5539-ef77-60f5-ee1191279d17	1319	Draga
00050000-5539-ef77-65a7-dde0cc8eef2c	8343	Dragatuš
00050000-5539-ef77-ce32-ce07dab35c42	3222	Dramlje
00050000-5539-ef77-1764-a63707e186bb	2370	Dravograd
00050000-5539-ef77-1bd4-8ba41b02203d	4203	Duplje
00050000-5539-ef77-8f76-c948ed14082a	6221	Dutovlje
00050000-5539-ef77-ce99-4f5f83193e57	8361	Dvor
00050000-5539-ef77-2026-a9a5d69007c7	2343	Fala
00050000-5539-ef77-a640-ffb00081f733	9208	Fokovci
00050000-5539-ef77-212f-79dfb89a055d	2313	Fram
00050000-5539-ef77-7582-6821cc4fe95c	3213	Frankolovo
00050000-5539-ef77-ac2c-96f73bc47c57	1274	Gabrovka
00050000-5539-ef77-0bbf-3336f2731b7a	8254	Globoko
00050000-5539-ef77-5582-497baee281b0	5275	Godovič
00050000-5539-ef77-a336-11a5dd7c2af4	4204	Golnik
00050000-5539-ef77-6ed8-aca6328d681f	3303	Gomilsko
00050000-5539-ef77-27cc-4cc335bb9480	4224	Gorenja vas
00050000-5539-ef77-560c-447334bba260	3263	Gorica pri Slivnici
00050000-5539-ef77-b1da-e93182e59543	2272	Gorišnica
00050000-5539-ef77-7b1d-104ad343b5d4	9250	Gornja Radgona
00050000-5539-ef77-573f-404bd7126884	3342	Gornji Grad
00050000-5539-ef77-e3ef-7232312f1e2e	4282	Gozd Martuljek
00050000-5539-ef77-e9ed-24627060e7f0	6272	Gračišče
00050000-5539-ef77-9dc6-d96bd64543d8	9264	Grad
00050000-5539-ef77-9764-e16d98c361df	8332	Gradac
00050000-5539-ef77-7b50-daaad9d84a3d	1384	Grahovo
00050000-5539-ef77-24a3-4d2926e50692	5242	Grahovo ob Bači
00050000-5539-ef77-6eb8-fcb86742acdb	5251	Grgar
00050000-5539-ef77-95f5-58bf6242e52c	3302	Griže
00050000-5539-ef77-972a-041dc68b0c1d	3231	Grobelno
00050000-5539-ef77-5af0-1538dd66cecc	1290	Grosuplje
00050000-5539-ef77-d862-9464f35d1435	2288	Hajdina
00050000-5539-ef77-5374-646bf257e608	8362	Hinje
00050000-5539-ef77-7ea8-ed9e139b3fd8	2311	Hoče
00050000-5539-ef77-3fbd-23296672badd	9205	Hodoš/Hodos
00050000-5539-ef77-96b5-7b0c8350a608	1354	Horjul
00050000-5539-ef77-963a-e905db6d3dd0	1372	Hotedršica
00050000-5539-ef77-ed9c-70270dc4f9ae	1430	Hrastnik
00050000-5539-ef77-df4c-64230249acf7	6225	Hruševje
00050000-5539-ef77-ea6f-09f6a2f9a7c6	4276	Hrušica
00050000-5539-ef77-b7a1-ae9f1139e49b	5280	Idrija
00050000-5539-ef77-a00b-c552a32271f4	1292	Ig
00050000-5539-ef77-84aa-1637db030dc4	6250	Ilirska Bistrica
00050000-5539-ef77-326c-033ffbc496af	6251	Ilirska Bistrica-Trnovo
00050000-5539-ef77-f0e7-8b1426ac969c	1295	Ivančna Gorica
00050000-5539-ef77-ba2f-c2f48a900db9	2259	Ivanjkovci
00050000-5539-ef77-c2e2-51fe1c7365dd	1411	Izlake
00050000-5539-ef77-b0f2-a3f6865f8fa0	6310	Izola/Isola
00050000-5539-ef77-3d99-41105b6ee48e	2222	Jakobski Dol
00050000-5539-ef77-f5ee-9578f20acfea	2221	Jarenina
00050000-5539-ef77-6268-0e906bed1dad	6254	Jelšane
00050000-5539-ef77-e17f-52ed31206af4	4270	Jesenice
00050000-5539-ef77-e2ce-553b20d73e26	8261	Jesenice na Dolenjskem
00050000-5539-ef77-74a2-60d3b8f78564	3273	Jurklošter
00050000-5539-ef77-382f-151c55d00ea8	2223	Jurovski Dol
00050000-5539-ef77-11b6-c9e2eee2866e	2256	Juršinci
00050000-5539-ef77-2bbf-4405799cd1c0	5214	Kal nad Kanalom
00050000-5539-ef77-41e8-8112490a4df5	3233	Kalobje
00050000-5539-ef77-78a6-91010abb6656	4246	Kamna Gorica
00050000-5539-ef77-7f34-2584be4e1e70	2351	Kamnica
00050000-5539-ef77-f627-af95898d78c3	1241	Kamnik
00050000-5539-ef77-5bf4-c50205f96991	5213	Kanal
00050000-5539-ef77-51b5-af68d96c4e9a	8258	Kapele
00050000-5539-ef77-f359-0ea841803ad1	2362	Kapla
00050000-5539-ef77-06f3-0ae971458875	2325	Kidričevo
00050000-5539-ef77-e703-3e696e56d82c	1412	Kisovec
00050000-5539-ef77-7221-e19da290cd2c	6253	Knežak
00050000-5539-ef77-7c8a-62804fb8838e	5222	Kobarid
00050000-5539-ef77-e1d7-7ab1b6040544	9227	Kobilje
00050000-5539-ef77-41f9-f8515a474793	1330	Kočevje
00050000-5539-ef77-f194-19ceed152c03	1338	Kočevska Reka
00050000-5539-ef77-5586-3704a95dfe32	2276	Kog
00050000-5539-ef77-ee7b-4cad97cfb436	5211	Kojsko
00050000-5539-ef77-6abb-d3f05801e849	6223	Komen
00050000-5539-ef77-295a-f340e1b38fe8	1218	Komenda
00050000-5539-ef77-6161-a13ac51c1d3a	6000	Koper/Capodistria 
00050000-5539-ef77-bd24-e42935568dba	6001	Koper/Capodistria - poštni predali
00050000-5539-ef77-f9fe-72449b2bb760	8282	Koprivnica
00050000-5539-ef77-793f-188b3fb41213	5296	Kostanjevica na Krasu
00050000-5539-ef77-5445-aacb31fdbd10	8311	Kostanjevica na Krki
00050000-5539-ef77-564f-1e2df505d1ff	1336	Kostel
00050000-5539-ef77-3a73-1d2a1c46069b	6256	Košana
00050000-5539-ef77-41dd-865f863992c3	2394	Kotlje
00050000-5539-ef77-30d7-340a5bbb1b9f	6240	Kozina
00050000-5539-ef77-ec67-e014904d06eb	3260	Kozje
00050000-5539-ef77-ddc2-01b25d1a4cc5	4000	Kranj 
00050000-5539-ef77-3dbb-6b26927a882c	4001	Kranj - poštni predali
00050000-5539-ef77-8f81-b37664a7d791	4280	Kranjska Gora
00050000-5539-ef77-0a51-36fbe70e00ad	1281	Kresnice
00050000-5539-ef77-732b-07049498a445	4294	Križe
00050000-5539-ef77-56c4-16ab47444f41	9206	Križevci
00050000-5539-ef77-5cb4-a4f8546aed9c	9242	Križevci pri Ljutomeru
00050000-5539-ef77-caa2-7d69a7502ecb	1301	Krka
00050000-5539-ef77-7da3-54eda4f6525c	8296	Krmelj
00050000-5539-ef77-3384-7fe37a45c1a4	4245	Kropa
00050000-5539-ef77-b7c2-751da48d581d	8262	Krška vas
00050000-5539-ef77-9bf1-08a7e11472c0	8270	Krško
00050000-5539-ef77-99ae-1a432a9bbf31	9263	Kuzma
00050000-5539-ef77-55b0-ca7efa0ec8b8	2318	Laporje
00050000-5539-ef77-f0ec-782462ee4ddb	3270	Laško
00050000-5539-ef77-16bc-790130c8d4db	1219	Laze v Tuhinju
00050000-5539-ef77-8b5b-4b578ebd0b54	2230	Lenart v Slovenskih goricah
00050000-5539-ef77-1f8b-b4dc34202a50	9220	Lendava/Lendva
00050000-5539-ef77-2864-e8a7d6c30740	4248	Lesce
00050000-5539-ef77-b088-03d91332c4de	3261	Lesično
00050000-5539-ef77-205c-12b987ba350d	8273	Leskovec pri Krškem
00050000-5539-ef77-af1d-42cae55f9dff	2372	Libeliče
00050000-5539-ef77-15cd-276bc85c6baa	2341	Limbuš
00050000-5539-ef77-56b2-28e8bfee0330	1270	Litija
00050000-5539-ef77-eb90-8887bd1e9be6	3202	Ljubečna
00050000-5539-ef77-5b43-72bb0093cfd3	1000	Ljubljana 
00050000-5539-ef77-262d-2cc8c5b56972	1001	Ljubljana - poštni predali
00050000-5539-ef77-a212-23dbc06e1f2c	1231	Ljubljana - Črnuče
00050000-5539-ef77-5447-0f9682b2211f	1261	Ljubljana - Dobrunje
00050000-5539-ef77-42f8-277990c87362	1260	Ljubljana - Polje
00050000-5539-ef77-82cd-f4195d69c354	1210	Ljubljana - Šentvid
00050000-5539-ef77-f3af-f8328ba17a87	1211	Ljubljana - Šmartno
00050000-5539-ef77-5d85-f8a346e81f1b	3333	Ljubno ob Savinji
00050000-5539-ef77-93f7-cb766c2fba7b	9240	Ljutomer
00050000-5539-ef77-aaf3-6dd1009a1d3b	3215	Loče
00050000-5539-ef77-d834-63de06c2bbaf	5231	Log pod Mangartom
00050000-5539-ef77-3048-27cb7ee1940b	1358	Log pri Brezovici
00050000-5539-ef77-9370-c8cbbe2ac361	1370	Logatec
00050000-5539-ef77-d646-9bba861102e0	1371	Logatec
00050000-5539-ef77-7b95-90f9be6c929e	1434	Loka pri Zidanem Mostu
00050000-5539-ef77-fa53-370281115198	3223	Loka pri Žusmu
00050000-5539-ef77-29c3-a9bdaa19262d	6219	Lokev
00050000-5539-ef77-6109-e59e15139d50	1318	Loški Potok
00050000-5539-ef77-0178-275cceb09c4e	2324	Lovrenc na Dravskem polju
00050000-5539-ef77-0f4d-8cb873d9ff7b	2344	Lovrenc na Pohorju
00050000-5539-ef77-8d13-69c13a43786e	3334	Luče
00050000-5539-ef77-e997-527cc537080d	1225	Lukovica
00050000-5539-ef77-b898-f745fe87edd3	9202	Mačkovci
00050000-5539-ef77-207a-7535b590fb67	2322	Majšperk
00050000-5539-ef77-7242-a596ea833da4	2321	Makole
00050000-5539-ef77-bb21-b4c5f38fb236	9243	Mala Nedelja
00050000-5539-ef77-ebca-17714936c9c8	2229	Malečnik
00050000-5539-ef77-91a7-57ac2d60abd1	6273	Marezige
00050000-5539-ef77-0613-425ec4bd582a	2000	Maribor 
00050000-5539-ef77-aab7-19377f84e6d5	2001	Maribor - poštni predali
00050000-5539-ef77-dadb-d487caead93d	2206	Marjeta na Dravskem polju
00050000-5539-ef77-45e9-0260de176d3e	2281	Markovci
00050000-5539-ef77-45a5-b3ef5a0f1870	9221	Martjanci
00050000-5539-ef77-9e1f-42b8becce535	6242	Materija
00050000-5539-ef77-c805-e82973ab931c	4211	Mavčiče
00050000-5539-ef77-965a-f19ff21b4477	1215	Medvode
00050000-5539-ef77-018e-dc468a680503	1234	Mengeš
00050000-5539-ef77-db5e-c420e016818f	8330	Metlika
00050000-5539-ef77-d1e4-aefdc3bcc2af	2392	Mežica
00050000-5539-ef77-7057-15142d593fa0	2204	Miklavž na Dravskem polju
00050000-5539-ef77-5ecf-c2fc7e9f1146	2275	Miklavž pri Ormožu
00050000-5539-ef77-1667-8517d8689db5	5291	Miren
00050000-5539-ef77-2b14-e77e94de0a49	8233	Mirna
00050000-5539-ef77-63a8-9852276689c0	8216	Mirna Peč
00050000-5539-ef77-d7ba-d9242f2d9112	2382	Mislinja
00050000-5539-ef77-97ec-1ab607837569	4281	Mojstrana
00050000-5539-ef77-7651-ce62058689d8	8230	Mokronog
00050000-5539-ef77-913f-2127b6544b6b	1251	Moravče
00050000-5539-ef77-9639-b6e05ec9206b	9226	Moravske Toplice
00050000-5539-ef77-00b5-3a66a70feb3c	5216	Most na Soči
00050000-5539-ef77-0b0e-0d1d9574b98d	1221	Motnik
00050000-5539-ef77-bf67-c1ef6bf699ab	3330	Mozirje
00050000-5539-ef77-0846-849580b1880d	9000	Murska Sobota 
00050000-5539-ef77-904f-f7277c972850	9001	Murska Sobota - poštni predali
00050000-5539-ef77-c917-ce684e000af8	2366	Muta
00050000-5539-ef77-8602-ea14bbf121b2	4202	Naklo
00050000-5539-ef77-e5e8-b69f24dee1f6	3331	Nazarje
00050000-5539-ef77-7027-f47c656adf4f	1357	Notranje Gorice
00050000-5539-ef77-dc88-e730a3f6d13b	3203	Nova Cerkev
00050000-5539-ef77-04de-86ba42ed6fcc	5000	Nova Gorica 
00050000-5539-ef77-46f1-96cf8136cc42	5001	Nova Gorica - poštni predali
00050000-5539-ef77-3811-bd5a1a66f763	1385	Nova vas
00050000-5539-ef77-22b1-6e81a8ebfede	8000	Novo mesto
00050000-5539-ef77-6b8d-17fd94b7c38c	8001	Novo mesto - poštni predali
00050000-5539-ef77-a2ff-50cb266e9eac	6243	Obrov
00050000-5539-ef77-0ccc-c0ea685c334d	9233	Odranci
00050000-5539-ef77-a54d-a555c624765a	2317	Oplotnica
00050000-5539-ef77-6e9b-a8f542a796b8	2312	Orehova vas
00050000-5539-ef77-c0ad-3e0057418847	2270	Ormož
00050000-5539-ef77-4cfb-bee6eeb668c1	1316	Ortnek
00050000-5539-ef77-e045-69445a1736aa	1337	Osilnica
00050000-5539-ef77-91ff-f8586f90eb66	8222	Otočec
00050000-5539-ef77-d99d-078fd613b5bd	2361	Ožbalt
00050000-5539-ef77-0122-aaefd1f7471a	2231	Pernica
00050000-5539-ef77-e439-18da998b875f	2211	Pesnica pri Mariboru
00050000-5539-ef77-45e1-243600713cd9	9203	Petrovci
00050000-5539-ef77-c1b0-2b70f5429b9e	3301	Petrovče
00050000-5539-ef77-37d4-1309227daf8d	6330	Piran/Pirano
00050000-5539-ef77-ad64-58156bd57197	8255	Pišece
00050000-5539-ef77-3810-f823a302882c	6257	Pivka
00050000-5539-ef77-f550-f674588b800f	6232	Planina
00050000-5539-ef77-7429-cff2a8e9c4a9	3225	Planina pri Sevnici
00050000-5539-ef77-f4fe-968541d680b1	6276	Pobegi
00050000-5539-ef77-9c32-bdc346dbfd04	8312	Podbočje
00050000-5539-ef77-7e17-8c9596300c0f	5243	Podbrdo
00050000-5539-ef77-1089-5929fd6dab07	3254	Podčetrtek
00050000-5539-ef77-5d4c-abfc62dba607	2273	Podgorci
00050000-5539-ef77-275c-f46c87fae9a3	6216	Podgorje
00050000-5539-ef77-1dee-eb92e698d0dd	2381	Podgorje pri Slovenj Gradcu
00050000-5539-ef77-6bc4-c1fe36a08068	6244	Podgrad
00050000-5539-ef77-0f63-aa4148307c8a	1414	Podkum
00050000-5539-ef77-0a3b-533d64250690	2286	Podlehnik
00050000-5539-ef77-e522-31b431771d21	5272	Podnanos
00050000-5539-ef77-a04d-78842b2d9ac2	4244	Podnart
00050000-5539-ef77-76da-5324a487085e	3241	Podplat
00050000-5539-ef77-d4ed-de06ae2bae08	3257	Podsreda
00050000-5539-ef77-9e42-727239d9ec2d	2363	Podvelka
00050000-5539-ef77-dfec-254a2008f5a8	2208	Pohorje
00050000-5539-ef77-6ce1-a04c17a33955	2257	Polenšak
00050000-5539-ef77-aba6-fd3613ef05d0	1355	Polhov Gradec
00050000-5539-ef77-fc11-5619fbcd1b52	4223	Poljane nad Škofjo Loko
00050000-5539-ef77-01d9-c461e80ac184	2319	Poljčane
00050000-5539-ef77-3054-2f4782b6ef74	1272	Polšnik
00050000-5539-ef77-7749-e2b4394a4615	3313	Polzela
00050000-5539-ef77-7c8f-688fee6367ce	3232	Ponikva
00050000-5539-ef77-a9dc-12316a5fc18b	6320	Portorož/Portorose
00050000-5539-ef77-c95d-5ebdc63cfa4f	6230	Postojna
00050000-5539-ef77-7e4a-96e35665a4b1	2331	Pragersko
00050000-5539-ef77-9ecd-ec85072761dd	3312	Prebold
00050000-5539-ef77-fbce-44e8936adbd9	4205	Preddvor
00050000-5539-ef77-c89d-9b04905a7fcc	6255	Prem
00050000-5539-ef77-aec1-234bb6034d35	1352	Preserje
00050000-5539-ef77-a93b-f3ab55900683	6258	Prestranek
00050000-5539-ef77-61e4-d9aa62199af5	2391	Prevalje
00050000-5539-ef77-96ac-d5bbb82a3e0c	3262	Prevorje
00050000-5539-ef77-9f53-1d0e4864ef72	1276	Primskovo 
00050000-5539-ef77-97a4-f6077f3fc6d2	3253	Pristava pri Mestinju
00050000-5539-ef77-a192-9c8cf16735ee	9207	Prosenjakovci/Partosfalva
00050000-5539-ef77-3851-fe796b45201d	5297	Prvačina
00050000-5539-ef77-948f-20b727af2f29	2250	Ptuj
00050000-5539-ef77-ca8b-05110873bb33	2323	Ptujska Gora
00050000-5539-ef77-629b-46425399a9c7	9201	Puconci
00050000-5539-ef77-d74e-bfe605eb2c0b	2327	Rače
00050000-5539-ef77-a166-f296660e36c9	1433	Radeče
00050000-5539-ef77-5f38-c90e90bf87a1	9252	Radenci
00050000-5539-ef77-42bc-7e6955092635	2360	Radlje ob Dravi
00050000-5539-ef77-dcb3-cf06ca35d89a	1235	Radomlje
00050000-5539-ef77-e208-cb2c95df5b9c	4240	Radovljica
00050000-5539-ef77-76ea-2aa2dd8b6978	8274	Raka
00050000-5539-ef77-82d6-e4cc27c47ab4	1381	Rakek
00050000-5539-ef77-8ae6-6bf91d87a3e9	4283	Rateče - Planica
00050000-5539-ef77-74ec-193cc6aa9070	2390	Ravne na Koroškem
00050000-5539-ef77-d6dc-7cd1b84e9a88	9246	Razkrižje
00050000-5539-ef77-cea1-1c6f2bbd856a	3332	Rečica ob Savinji
00050000-5539-ef77-5d29-53109a3cddbc	5292	Renče
00050000-5539-ef77-ffaf-7d756782165c	1310	Ribnica
00050000-5539-ef77-5675-0794d1e774e8	2364	Ribnica na Pohorju
00050000-5539-ef77-d73a-f8ae6ef55efc	3272	Rimske Toplice
00050000-5539-ef77-b988-4fdf9986932e	1314	Rob
00050000-5539-ef77-4858-15cfb684f3c8	5215	Ročinj
00050000-5539-ef77-efd7-020ecc6ca68e	3250	Rogaška Slatina
00050000-5539-ef77-1b2a-a3ca28c8a5c2	9262	Rogašovci
00050000-5539-ef77-aad6-57d994c4c2b6	3252	Rogatec
00050000-5539-ef77-1477-24ea53ce6968	1373	Rovte
00050000-5539-ef77-2302-7e0cb919fa4a	2342	Ruše
00050000-5539-ef77-fb48-d8a687ca6cfe	1282	Sava
00050000-5539-ef77-af84-791f0ef152db	6333	Sečovlje/Sicciole
00050000-5539-ef77-48cc-a94e91ed573a	4227	Selca
00050000-5539-ef77-828a-88210f28835d	2352	Selnica ob Dravi
00050000-5539-ef77-3d21-959983aa1424	8333	Semič
00050000-5539-ef77-dd81-5aa933b48d71	8281	Senovo
00050000-5539-ef77-d2e1-ff91db64490d	6224	Senožeče
00050000-5539-ef77-6549-6f95da40df13	8290	Sevnica
00050000-5539-ef77-661c-b2534e2a7edd	6210	Sežana
00050000-5539-ef77-fdf8-9c5cb68ed6bb	2214	Sladki Vrh
00050000-5539-ef77-0f27-c3970d29d65f	5283	Slap ob Idrijci
00050000-5539-ef77-2983-a115943c8255	2380	Slovenj Gradec
00050000-5539-ef77-4c78-50300040183b	2310	Slovenska Bistrica
00050000-5539-ef77-b562-345ea4409958	3210	Slovenske Konjice
00050000-5539-ef77-bf56-a60767bef9fb	1216	Smlednik
00050000-5539-ef77-3761-1d8e1c4b04b0	5232	Soča
00050000-5539-ef77-b8eb-2e63e34f9d3c	1317	Sodražica
00050000-5539-ef77-c817-d3857e149cd3	3335	Solčava
00050000-5539-ef77-87fd-4e205dae3adc	5250	Solkan
00050000-5539-ef77-b544-39e5ce925dd9	4229	Sorica
00050000-5539-ef77-9673-f7dcfb32213c	4225	Sovodenj
00050000-5539-ef77-1852-1bd9695dd465	5281	Spodnja Idrija
00050000-5539-ef77-2086-4130809c51a6	2241	Spodnji Duplek
00050000-5539-ef77-4e77-92e2f3246f96	9245	Spodnji Ivanjci
00050000-5539-ef77-26ab-3c9d480714b4	2277	Središče ob Dravi
00050000-5539-ef77-fa08-60dc59638777	4267	Srednja vas v Bohinju
00050000-5539-ef77-b07f-90e3940ba56a	8256	Sromlje 
00050000-5539-ef77-c28f-580a3c8e8ac1	5224	Srpenica
00050000-5539-ef77-c363-2cbc4922b4f5	1242	Stahovica
00050000-5539-ef77-3b4b-4fac3d61e0c6	1332	Stara Cerkev
00050000-5539-ef77-5fa3-6719684f6e60	8342	Stari trg ob Kolpi
00050000-5539-ef77-2857-a47aa7efa2b7	1386	Stari trg pri Ložu
00050000-5539-ef77-4273-249e22824785	2205	Starše
00050000-5539-ef77-14c9-29222e37f44e	2289	Stoperce
00050000-5539-ef77-3f99-f14ff756e1da	8322	Stopiče
00050000-5539-ef77-5331-9a52451edbbb	3206	Stranice
00050000-5539-ef77-9e5a-2fda83448fed	8351	Straža
00050000-5539-ef77-d0a4-1d2dc47b2cb2	1313	Struge
00050000-5539-ef77-dba4-3d095541e3bc	8293	Studenec
00050000-5539-ef77-a48c-ed4441150947	8331	Suhor
00050000-5539-ef77-404a-555ee3fc1c23	2233	Sv. Ana v Slovenskih goricah
00050000-5539-ef77-da6c-331c13c61b77	2235	Sv. Trojica v Slovenskih goricah
00050000-5539-ef77-8e5e-fcd29ed4f81c	2353	Sveti Duh na Ostrem Vrhu
00050000-5539-ef77-88e5-86298cd08295	9244	Sveti Jurij ob Ščavnici
00050000-5539-ef77-0e19-fcc5972bf27c	3264	Sveti Štefan
00050000-5539-ef77-35ca-a2b83b2328db	2258	Sveti Tomaž
00050000-5539-ef77-3f9d-0d7215dc67de	9204	Šalovci
00050000-5539-ef77-2a31-536f1f569ffd	5261	Šempas
00050000-5539-ef77-b738-9eb65230ff62	5290	Šempeter pri Gorici
00050000-5539-ef77-8779-61582da2780e	3311	Šempeter v Savinjski dolini
00050000-5539-ef77-b058-d976524c9f92	4208	Šenčur
00050000-5539-ef77-f09c-a72f97d51386	2212	Šentilj v Slovenskih goricah
00050000-5539-ef77-9d3f-552e5313f01d	8297	Šentjanž
00050000-5539-ef77-2ef6-f859826ff655	2373	Šentjanž pri Dravogradu
00050000-5539-ef77-cc63-31587fe3df0c	8310	Šentjernej
00050000-5539-ef77-5f6e-1a7630921e78	3230	Šentjur
00050000-5539-ef77-67cf-0a02aa1a6fcf	3271	Šentrupert
00050000-5539-ef77-2152-d4f3a1aa2596	8232	Šentrupert
00050000-5539-ef77-89ff-e3f550da545e	1296	Šentvid pri Stični
00050000-5539-ef77-7d70-6671c9500873	8275	Škocjan
00050000-5539-ef77-e662-99c75f5e1f22	6281	Škofije
00050000-5539-ef77-8634-8580dcd3da44	4220	Škofja Loka
00050000-5539-ef77-058a-efebcf81b02f	3211	Škofja vas
00050000-5539-ef77-783f-60d0bec44100	1291	Škofljica
00050000-5539-ef77-892e-07faa8366081	6274	Šmarje
00050000-5539-ef77-58d3-5342e89bea0a	1293	Šmarje - Sap
00050000-5539-ef77-e925-652dbbb2ada2	3240	Šmarje pri Jelšah
00050000-5539-ef77-4d76-c6106a50af33	8220	Šmarješke Toplice
00050000-5539-ef77-8eed-b2234d794c70	2315	Šmartno na Pohorju
00050000-5539-ef77-04a2-370c0c6490ca	3341	Šmartno ob Dreti
00050000-5539-ef77-7223-0f393cf80653	3327	Šmartno ob Paki
00050000-5539-ef77-2791-cf21915ee387	1275	Šmartno pri Litiji
00050000-5539-ef77-3af0-c83ac746292c	2383	Šmartno pri Slovenj Gradcu
00050000-5539-ef77-860c-5b969d36baef	3201	Šmartno v Rožni dolini
00050000-5539-ef77-7944-773f927ba175	3325	Šoštanj
00050000-5539-ef77-faeb-445fbf5fc7ec	6222	Štanjel
00050000-5539-ef77-d5c2-a20c23194e0a	3220	Štore
00050000-5539-ef77-6120-1c1139925986	3304	Tabor
00050000-5539-ef77-c17f-23e533dba32c	3221	Teharje
00050000-5539-ef77-7eb8-289d30f84e90	9251	Tišina
00050000-5539-ef77-e086-f70965869b80	5220	Tolmin
00050000-5539-ef77-7ce1-382a925e3faf	3326	Topolšica
00050000-5539-ef77-ae46-285608e5e61f	2371	Trbonje
00050000-5539-ef77-d221-efe3b2d8e0e1	1420	Trbovlje
00050000-5539-ef77-b89e-a35f600990e1	8231	Trebelno 
00050000-5539-ef77-13df-1268969c0d4e	8210	Trebnje
00050000-5539-ef77-08fa-828f0dfe94af	5252	Trnovo pri Gorici
00050000-5539-ef77-2ae5-1a4415621e68	2254	Trnovska vas
00050000-5539-ef77-4e49-565ec071d1a1	1222	Trojane
00050000-5539-ef77-5e6a-11391b5e6150	1236	Trzin
00050000-5539-ef77-8358-31ea88232fd6	4290	Tržič
00050000-5539-ef77-5b4f-fe3bbf177621	8295	Tržišče
00050000-5539-ef77-0cbb-3b07af17791c	1311	Turjak
00050000-5539-ef77-b159-de688a9884ac	9224	Turnišče
00050000-5539-ef77-b990-e52a822060ea	8323	Uršna sela
00050000-5539-ef77-5873-1bea9a813418	1252	Vače
00050000-5539-ef77-01c9-2d017b208cf7	3320	Velenje 
00050000-5539-ef77-02fa-40502449dd5f	3322	Velenje - poštni predali
00050000-5539-ef77-aca1-a3b58679cb5a	8212	Velika Loka
00050000-5539-ef77-04b5-a30393f3b406	2274	Velika Nedelja
00050000-5539-ef77-b438-4eceaf3378dd	9225	Velika Polana
00050000-5539-ef77-37a3-0152f2eb3ac4	1315	Velike Lašče
00050000-5539-ef77-60aa-05cecf2fa119	8213	Veliki Gaber
00050000-5539-ef77-8e59-a1fd36cc4d6f	9241	Veržej
00050000-5539-ef77-3e14-d217afbe3d42	1312	Videm - Dobrepolje
00050000-5539-ef77-eabd-32dd4dffa6db	2284	Videm pri Ptuju
00050000-5539-ef77-d55a-2f11156fe7ef	8344	Vinica
00050000-5539-ef77-c2a9-3d3ff13c5c7b	5271	Vipava
00050000-5539-ef77-819c-a0733ba1f7e7	4212	Visoko
00050000-5539-ef77-59d6-441e68fcc5f2	1294	Višnja Gora
00050000-5539-ef77-3461-918d35d90fe5	3205	Vitanje
00050000-5539-ef77-f46d-0374821a6978	2255	Vitomarci
00050000-5539-ef77-efec-29cb7655f7b9	1217	Vodice
00050000-5539-ef77-8fe6-a379d157da8f	3212	Vojnik\t
00050000-5539-ef77-7a1e-8bb36b19b5e6	5293	Volčja Draga
00050000-5539-ef77-432a-f95c024d732d	2232	Voličina
00050000-5539-ef77-b175-c737ec06df9f	3305	Vransko
00050000-5539-ef77-bec2-c34eb5944717	6217	Vremski Britof
00050000-5539-ef77-50a7-ee604aeeecf0	1360	Vrhnika
00050000-5539-ef77-9496-1efba9c105c9	2365	Vuhred
00050000-5539-ef77-9b65-e04735c61629	2367	Vuzenica
00050000-5539-ef77-de7b-3508512b6e96	8292	Zabukovje 
00050000-5539-ef77-4765-ed18a63938e9	1410	Zagorje ob Savi
00050000-5539-ef77-12b0-bae3e3c8095e	1303	Zagradec
00050000-5539-ef77-ea45-98e335cbe507	2283	Zavrč
00050000-5539-ef77-9956-507a50ad9cd0	8272	Zdole 
00050000-5539-ef77-5cf0-520d8e819a2b	4201	Zgornja Besnica
00050000-5539-ef77-5331-46bac6c056b2	2242	Zgornja Korena
00050000-5539-ef77-dc54-2134b23777f5	2201	Zgornja Kungota
00050000-5539-ef77-c1fc-70ace8dcfb0a	2316	Zgornja Ložnica
00050000-5539-ef77-1853-007ec4527c6b	2314	Zgornja Polskava
00050000-5539-ef77-47f3-9ff38e3497cd	2213	Zgornja Velka
00050000-5539-ef77-147e-b74f5a6a4c75	4247	Zgornje Gorje
00050000-5539-ef77-a1da-18187226d5ae	4206	Zgornje Jezersko
00050000-5539-ef77-966d-a3e92b01612e	2285	Zgornji Leskovec
00050000-5539-ef77-04f5-a787640fc705	1432	Zidani Most
00050000-5539-ef77-2f74-777bdd5d79bb	3214	Zreče
00050000-5539-ef77-2454-8f5a45f9e5c7	4209	Žabnica
00050000-5539-ef77-9755-75da373068e2	3310	Žalec
00050000-5539-ef77-5359-a883d30f32b6	4228	Železniki
00050000-5539-ef77-3899-66e240b278dd	2287	Žetale
00050000-5539-ef77-a80c-190b26247f78	4226	Žiri
00050000-5539-ef77-8881-c49813c9cff9	4274	Žirovnica
00050000-5539-ef77-7a44-6c9c56fdf5ac	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1157714)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 1157537)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1157603)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1157726)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1157831)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1157875)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1157755)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1157699)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1157689)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1157865)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1157821)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1157403)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5539-ef79-1f2b-2eb6892c6a36	00010000-5539-ef79-5e2c-24b076b37762	2015-04-24 09:23:37	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROAGQEKh5KMOjuJZYF6zDRXR77nLIOUOq";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1157764)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1157441)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5539-ef79-df01-c04353554bff	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5539-ef79-a26a-6dd5f86da753	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5539-ef79-6f09-8cc89027bb17	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5539-ef79-1575-5ff858855f5b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5539-ef79-c329-ae94e443509b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5539-ef79-c027-beb72bff0a24	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1157425)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5539-ef79-1f2b-2eb6892c6a36	00000000-5539-ef79-1575-5ff858855f5b
00010000-5539-ef79-5e2c-24b076b37762	00000000-5539-ef79-1575-5ff858855f5b
\.


--
-- TOC entry 2668 (class 0 OID 1157778)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1157720)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1157670)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1157502)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1157676)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1157856)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1157572)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1157412)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5539-ef79-5e2c-24b076b37762	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROyb5fCa5FLAGJMdPVfcZ.YG036/kaglS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5539-ef79-1f2b-2eb6892c6a36	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1157906)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1157618)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1157747)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1157813)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1157646)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1157896)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1157803)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1157466)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1157945)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1157938)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1157855)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1157636)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1157669)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1157598)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1157799)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1157616)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1157663)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2250 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 1157712)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1157739)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1157570)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1157475)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1157534)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1157500)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1157455)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1157440)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1157745)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1157777)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1157892)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1157527)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1157558)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1157718)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 1157548)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1157607)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1157730)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1157837)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1157880)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1157762)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1157703)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1157694)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1157874)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1157828)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 1157411)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1157768)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1157429)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1157449)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1157786)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1157725)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1157675)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1157507)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1157685)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1157864)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1157583)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1157424)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1157920)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1157622)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1157753)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1157819)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1157658)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1157905)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1157812)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1157643)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1157529)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2252 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2253 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2254 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2378 (class 1259 OID 1157746)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1157732)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1157731)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1157623)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1157802)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1157800)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1157801)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1157893)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1157894)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1157895)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1157923)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1157922)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1157921)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1157585)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1157584)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1157536)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1157535)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1157769)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1157664)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1157456)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1157457)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1157789)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1157788)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1157787)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1157608)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1157610)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1157609)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1157698)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1157696)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1157695)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1157697)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1157430)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1157431)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1157754)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1157719)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1157829)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1157830)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1157550)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1157549)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1157551)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1157838)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1157839)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1157948)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1157947)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1157950)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1157946)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1157949)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1157820)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1157707)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1157706)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1157704)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1157705)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1157940)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1157939)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1157617)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1157477)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1157476)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1157508)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1157509)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1157688)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1157687)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1157686)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1157645)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1157641)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1157638)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1157639)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1157637)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1157642)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1157640)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1157528)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1157599)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1157601)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1157600)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1157602)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1157713)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1157501)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1157571)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 1157763)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1157559)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1157881)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1157450)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1157644)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1158081)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1158066)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1158071)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1158091)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1158061)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1158086)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1158076)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1157996)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1158176)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1158171)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1158166)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1158056)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1158216)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1158206)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1158211)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1158156)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1158251)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1158256)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1158261)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1158276)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1158271)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1158266)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1158031)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1158026)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1158006)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1158001)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1157981)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1158186)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1158096)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1157961)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1157966)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1158201)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1158196)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1158191)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1158036)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1158046)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1158041)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1158131)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1158121)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1158116)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1158126)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1157951)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1157956)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1158181)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1158161)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1158226)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1158231)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1158016)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1158011)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1158021)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1158236)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1158241)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1158301)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1158296)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1158311)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1158291)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1158306)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1158221)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1158151)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1158146)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1158136)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1158141)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1158286)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1158281)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1158051)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1158246)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1157976)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1157971)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1157986)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1157991)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1158111)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1158106)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1158101)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-24 09:23:37 CEST

--
-- PostgreSQL database dump complete
--

