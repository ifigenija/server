--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-22 09:12:19 CEST

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
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 4601405)
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
-- TOC entry 225 (class 1259 OID 4601884)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
    pogodba_id uuid,
    zaposlen boolean
);


--
-- TOC entry 224 (class 1259 OID 4601867)
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
-- TOC entry 217 (class 1259 OID 4601780)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
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
-- TOC entry 193 (class 1259 OID 4601571)
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
-- TOC entry 196 (class 1259 OID 4601605)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4601530)
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
-- TOC entry 212 (class 1259 OID 4601730)
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
-- TOC entry 191 (class 1259 OID 4601555)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4601599)
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
-- TOC entry 201 (class 1259 OID 4601648)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4601673)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4601504)
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
-- TOC entry 180 (class 1259 OID 4601414)
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
-- TOC entry 181 (class 1259 OID 4601425)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
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
-- TOC entry 184 (class 1259 OID 4601475)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4601379)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4601398)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4601680)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4601710)
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
-- TOC entry 221 (class 1259 OID 4601823)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 183 (class 1259 OID 4601455)
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
-- TOC entry 186 (class 1259 OID 4601496)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4601654)
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
-- TOC entry 185 (class 1259 OID 4601482)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu boolean NOT NULL,
    privzeti boolean
);


--
-- TOC entry 190 (class 1259 OID 4601547)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4601666)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4601771)
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
-- TOC entry 220 (class 1259 OID 4601816)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4601695)
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
-- TOC entry 200 (class 1259 OID 4601639)
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
-- TOC entry 199 (class 1259 OID 4601629)
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
-- TOC entry 219 (class 1259 OID 4601806)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4601761)
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
-- TOC entry 173 (class 1259 OID 4601350)
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
-- TOC entry 172 (class 1259 OID 4601348)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 4601704)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4601388)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4601372)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4601718)
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
-- TOC entry 203 (class 1259 OID 4601660)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4601610)
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
-- TOC entry 182 (class 1259 OID 4601447)
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
-- TOC entry 198 (class 1259 OID 4601616)
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
-- TOC entry 218 (class 1259 OID 4601794)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    dovoliprekrivanje boolean,
    maxprekrivanj integer,
    nastopajoc boolean,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying,
    pomembnost character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 4601516)
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
-- TOC entry 174 (class 1259 OID 4601359)
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
-- TOC entry 223 (class 1259 OID 4601848)
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
    sloavtor boolean,
    kratkinaslov character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 4601562)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4601687)
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
-- TOC entry 214 (class 1259 OID 4601753)
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
-- TOC entry 194 (class 1259 OID 4601594)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4601838)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4601743)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4601353)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4601405)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4601884)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4601867)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4601780)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4601571)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4601605)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4601530)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555e-d6d2-f88e-a00f09f01dca	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555e-d6d2-e2fa-18cba41ce8d2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555e-d6d2-186e-f9912497568b	AL	ALB	008	Albania 	Albanija	\N
00040000-555e-d6d2-75bb-f0368dd568da	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555e-d6d2-c664-5102ceb1eea6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555e-d6d2-fbc6-ea5b621bec9c	AD	AND	020	Andorra 	Andora	\N
00040000-555e-d6d2-0f9f-1e3599f863bf	AO	AGO	024	Angola 	Angola	\N
00040000-555e-d6d2-63f6-5fa277e0ff63	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555e-d6d2-3f30-769e101a6abd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555e-d6d2-2a66-10c178dfe913	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555e-d6d2-e046-edcf794ceb54	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555e-d6d2-bb0c-a0c1fe15ca25	AM	ARM	051	Armenia 	Armenija	\N
00040000-555e-d6d2-b37b-cacd38d2f3cc	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555e-d6d2-e639-0784f042eb8a	AU	AUS	036	Australia 	Avstralija	\N
00040000-555e-d6d2-4835-7b2388b1e448	AT	AUT	040	Austria 	Avstrija	\N
00040000-555e-d6d2-b93b-67171288b148	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555e-d6d2-fe1f-378de2f93f35	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555e-d6d2-3d18-6af44dfbcda9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555e-d6d2-ae74-7eb5eefeefb1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555e-d6d2-47a0-557fdd049d47	BB	BRB	052	Barbados 	Barbados	\N
00040000-555e-d6d2-db0d-fc0db72eee10	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555e-d6d2-3cc9-a0379f199bde	BE	BEL	056	Belgium 	Belgija	\N
00040000-555e-d6d2-ec9b-b6bf389b9717	BZ	BLZ	084	Belize 	Belize	\N
00040000-555e-d6d2-3ab1-14c6fd67d18b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555e-d6d2-8036-63f1edcb8b5b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555e-d6d2-ebc3-f4e36dfaafba	BT	BTN	064	Bhutan 	Butan	\N
00040000-555e-d6d2-20ce-adbd413d284b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555e-d6d2-fabc-da2f68e8ea67	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555e-d6d2-f1d2-c5566fe977be	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555e-d6d2-2359-e4e54f5ab7c1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555e-d6d2-f857-4f344dfe9865	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555e-d6d2-6e4c-6c0488c75914	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555e-d6d2-2fa3-923767ea314f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555e-d6d2-ea5e-d3b1a8622c71	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555e-d6d2-1ee5-032f95165279	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555e-d6d2-7493-62a923b5d335	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555e-d6d2-8f61-4f7dfff88f38	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555e-d6d2-13a5-f517892a7b25	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555e-d6d2-9e3b-ffdcdfa74665	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555e-d6d2-7899-4ae5e2c1f7c8	CA	CAN	124	Canada 	Kanada	\N
00040000-555e-d6d2-abc8-4f42da0e862a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555e-d6d2-7231-a5c7dca177cc	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555e-d6d2-2020-95532224eb96	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555e-d6d2-2291-51b96c5673b8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555e-d6d2-a499-e6e115b2b786	CL	CHL	152	Chile 	Čile	\N
00040000-555e-d6d2-168c-aca606891786	CN	CHN	156	China 	Kitajska	\N
00040000-555e-d6d2-42a0-352484710283	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555e-d6d2-ea01-b19432157e29	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555e-d6d2-bb22-93c36b909799	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555e-d6d2-ede4-9a47b6e1c178	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555e-d6d2-4915-c91ad7f0abbb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555e-d6d2-c3f8-6b89da957767	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555e-d6d2-d617-ff0762b74ca7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555e-d6d2-342e-a982836e7d27	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555e-d6d2-79a1-7f1aba8c95a7	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555e-d6d2-ee3b-a5b2d1a05971	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555e-d6d2-830c-9df6b11e6794	CU	CUB	192	Cuba 	Kuba	\N
00040000-555e-d6d2-8955-02fb5629fcc3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555e-d6d2-6021-fc1c861fb016	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555e-d6d2-87bd-2420da1eca2d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555e-d6d2-cd01-38706cc202cf	DK	DNK	208	Denmark 	Danska	\N
00040000-555e-d6d2-346f-bee399c20685	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555e-d6d2-25f5-9c95b84617fe	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555e-d6d2-a4bf-7ef5b00a6aa4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555e-d6d2-7b58-5e7b6a19239d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555e-d6d2-badd-cacdc4cf0edc	EG	EGY	818	Egypt 	Egipt	\N
00040000-555e-d6d2-8f7d-e0d94bf6c3ef	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555e-d6d2-3ac6-28d259e75f70	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555e-d6d2-f487-f9a73480e52b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555e-d6d2-f60a-e04d795c017a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555e-d6d2-d864-6bc65787b860	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555e-d6d2-201d-3a04b7d05bf8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555e-d6d2-cc64-e47082b6b726	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555e-d6d2-4382-b6fbd1a10cbf	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555e-d6d3-85de-6e27fc8d79e5	FI	FIN	246	Finland 	Finska	\N
00040000-555e-d6d3-65a6-182977301d9a	FR	FRA	250	France 	Francija	\N
00040000-555e-d6d3-5e4d-590ecf6634b4	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555e-d6d3-59af-3454f9533399	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555e-d6d3-7eeb-0d330e79c198	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555e-d6d3-5199-9fe70aecb475	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555e-d6d3-4313-34982dbe1858	GA	GAB	266	Gabon 	Gabon	\N
00040000-555e-d6d3-1b6e-f50973c274e1	GM	GMB	270	Gambia 	Gambija	\N
00040000-555e-d6d3-4a3e-4a0ba92af513	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555e-d6d3-d15c-8070b3ab412e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555e-d6d3-69b2-252093f085a1	GH	GHA	288	Ghana 	Gana	\N
00040000-555e-d6d3-b44b-8c61bcc29ba4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555e-d6d3-fcce-f0275b45dd39	GR	GRC	300	Greece 	Grčija	\N
00040000-555e-d6d3-9285-beacb4358ac0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555e-d6d3-41ca-fa42c4ad260f	GD	GRD	308	Grenada 	Grenada	\N
00040000-555e-d6d3-98fb-095b94db1c14	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555e-d6d3-69b3-f8be58afe73d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555e-d6d3-b2a8-2e7a335360d8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555e-d6d3-9544-88203fe56281	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555e-d6d3-0ad2-851aa4b45091	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555e-d6d3-726f-7ad0949fbbf8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555e-d6d3-ecc2-3aa6ff38c0b6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555e-d6d3-bda5-3ef3f4e59cf4	HT	HTI	332	Haiti 	Haiti	\N
00040000-555e-d6d3-56bb-4db3928fd4b7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555e-d6d3-3e7f-6fb48f65155a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555e-d6d3-a338-5b7dccb2add0	HN	HND	340	Honduras 	Honduras	\N
00040000-555e-d6d3-df67-0e542832f076	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555e-d6d3-16e1-a3c86065ebd3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555e-d6d3-a375-17dfaca1df64	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555e-d6d3-2986-43c02dc0395f	IN	IND	356	India 	Indija	\N
00040000-555e-d6d3-e298-9dbd6c9121fd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555e-d6d3-0eb8-51b0133a6cb9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555e-d6d3-2097-06898b7d1094	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555e-d6d3-296e-11b6faa7d336	IE	IRL	372	Ireland 	Irska	\N
00040000-555e-d6d3-ecb8-5578d2875198	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555e-d6d3-cc35-b8e760e3f1d6	IL	ISR	376	Israel 	Izrael	\N
00040000-555e-d6d3-9736-4b646490bc37	IT	ITA	380	Italy 	Italija	\N
00040000-555e-d6d3-3179-706f3c40e63a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555e-d6d3-4a50-4d144c177507	JP	JPN	392	Japan 	Japonska	\N
00040000-555e-d6d3-b88c-0601238dbf33	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555e-d6d3-859c-246933d1995c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555e-d6d3-8835-6c841359b48d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555e-d6d3-4741-d3493e17edcd	KE	KEN	404	Kenya 	Kenija	\N
00040000-555e-d6d3-804f-2f0a01d65947	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555e-d6d3-5c89-670a36a41201	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555e-d6d3-cd44-6caff79a1a21	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555e-d6d3-4838-fa8c9407fd7c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555e-d6d3-e090-4947b9e73a97	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555e-d6d3-622c-712cc93177d0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555e-d6d3-7b62-dc7162a6ff5a	LV	LVA	428	Latvia 	Latvija	\N
00040000-555e-d6d3-9df1-3ffb072c49c0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555e-d6d3-7dad-8cb83501a582	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555e-d6d3-6aee-192f36a25200	LR	LBR	430	Liberia 	Liberija	\N
00040000-555e-d6d3-e1c1-92a67c20c0ba	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555e-d6d3-95fa-faee8a421d44	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555e-d6d3-c3c5-534dd784d3f6	LT	LTU	440	Lithuania 	Litva	\N
00040000-555e-d6d3-de44-e76479d217ea	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555e-d6d3-89a6-1fb2825b1242	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555e-d6d3-595a-b7e976275aea	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555e-d6d3-9fb5-8163c1f51e65	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555e-d6d3-1941-758375bdc5f1	MW	MWI	454	Malawi 	Malavi	\N
00040000-555e-d6d3-2ee5-5559e19ae78e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555e-d6d3-b2f5-04f45819de98	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555e-d6d3-a3c8-768575e0fc10	ML	MLI	466	Mali 	Mali	\N
00040000-555e-d6d3-64b8-771f9b804193	MT	MLT	470	Malta 	Malta	\N
00040000-555e-d6d3-61d4-9cce16c76a0f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555e-d6d3-f740-728786776f9a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555e-d6d3-108b-b6d79ef961dd	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555e-d6d3-d18f-14823345e1ba	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555e-d6d3-a579-89b0204c22d3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555e-d6d3-ce22-9fed3433a7fd	MX	MEX	484	Mexico 	Mehika	\N
00040000-555e-d6d3-07a1-8814a414e3d4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555e-d6d3-a510-42daf4e6685b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555e-d6d3-da09-c3c7fb386a8b	MC	MCO	492	Monaco 	Monako	\N
00040000-555e-d6d3-f3c8-d9744eb69af1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555e-d6d3-5c4d-bb57b274b9e7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555e-d6d3-a5ae-b8d364c2c188	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555e-d6d3-101e-10288d4bda18	MA	MAR	504	Morocco 	Maroko	\N
00040000-555e-d6d3-ac72-6cc7fc385f1d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555e-d6d3-1542-f5df7a60dcfa	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555e-d6d3-f53a-0173c642335b	NA	NAM	516	Namibia 	Namibija	\N
00040000-555e-d6d3-d8e7-bc07988f7952	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555e-d6d3-d188-8849e2b2cddf	NP	NPL	524	Nepal 	Nepal	\N
00040000-555e-d6d3-762b-8ba5a040c04c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555e-d6d3-dd1b-a69730343b47	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555e-d6d3-667f-09aadf5b0c58	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555e-d6d3-6db5-30d37f3d5c64	NE	NER	562	Niger 	Niger 	\N
00040000-555e-d6d3-bf8f-91a5cd515c87	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555e-d6d3-b1c6-c6d273a77f18	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555e-d6d3-f5c7-a9b83e4012b1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555e-d6d3-02df-1e6986f98a40	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555e-d6d3-fd8a-1db859210e91	NO	NOR	578	Norway 	Norveška	\N
00040000-555e-d6d3-e66a-b883ffac1875	OM	OMN	512	Oman 	Oman	\N
00040000-555e-d6d3-7e29-c15be16f25ae	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555e-d6d3-ea33-7af2ca79227c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555e-d6d3-bd6c-e8fff3b92d38	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555e-d6d3-415f-6e846a81cb06	PA	PAN	591	Panama 	Panama	\N
00040000-555e-d6d3-62f2-9c5d065eb9c7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555e-d6d3-2a74-b6e14aad913b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555e-d6d3-d1bc-ff8c4f7de964	PE	PER	604	Peru 	Peru	\N
00040000-555e-d6d3-8103-c3ed1f1b162f	PH	PHL	608	Philippines 	Filipini	\N
00040000-555e-d6d3-5cc0-d17f7150ccfc	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555e-d6d3-93ee-19fc99459a9b	PL	POL	616	Poland 	Poljska	\N
00040000-555e-d6d3-3e15-40df5f717f53	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555e-d6d3-73f8-38999c4b9b64	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555e-d6d3-5cae-74a538da7c23	QA	QAT	634	Qatar 	Katar	\N
00040000-555e-d6d3-4552-f64a4332d155	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555e-d6d3-2099-f94fc638c0c1	RO	ROU	642	Romania 	Romunija	\N
00040000-555e-d6d3-1a60-a9942a1023b2	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555e-d6d3-0316-d2eaabbab5f6	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555e-d6d3-0202-ab52f5de4fb2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555e-d6d3-120c-99be33fc0d1a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555e-d6d3-9b99-b34612459213	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555e-d6d3-0c72-95cb3ea537f2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555e-d6d3-1724-47ea2407640b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555e-d6d3-d9cb-589126b15ebe	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555e-d6d3-34cf-65bca2d7b0f7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555e-d6d3-5d88-3b760be3adc3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555e-d6d3-1e9a-5e5acf7cacc8	SM	SMR	674	San Marino 	San Marino	\N
00040000-555e-d6d3-9b96-d6a94372b21e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555e-d6d3-f2e2-e9b1ced49dbf	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555e-d6d3-1d0e-64dafc46f830	SN	SEN	686	Senegal 	Senegal	\N
00040000-555e-d6d3-5079-8f3cbf205ca0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555e-d6d3-623b-c260a4113ccf	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555e-d6d3-cf20-702e6381eebb	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555e-d6d3-d185-4d5b97cd1360	SG	SGP	702	Singapore 	Singapur	\N
00040000-555e-d6d3-0e1f-1a557ee651d2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555e-d6d3-cfd5-ccceb37fefde	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555e-d6d3-cd93-9d77bff563a9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555e-d6d3-0a58-584fbd72b91e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555e-d6d3-98eb-d9f0395e24a9	SO	SOM	706	Somalia 	Somalija	\N
00040000-555e-d6d3-beae-044eb4fcdbd3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555e-d6d3-6e28-76db259711e4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555e-d6d3-b86a-1005c3c67fe6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555e-d6d3-6664-d94ebc4c1bbc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555e-d6d3-d14e-5d955656606d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555e-d6d3-f5ec-e598f09194d1	SD	SDN	729	Sudan 	Sudan	\N
00040000-555e-d6d3-b2cd-cfd95441d763	SR	SUR	740	Suriname 	Surinam	\N
00040000-555e-d6d3-750d-9594c902f8c6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555e-d6d3-6a16-d06ab96bc081	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555e-d6d3-5a01-3ab4771d4c0a	SE	SWE	752	Sweden 	Švedska	\N
00040000-555e-d6d3-e696-4e376d4fa481	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555e-d6d3-1ea3-aff989e5f1a4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555e-d6d3-e030-abc8b8c82f82	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555e-d6d3-e8c8-1138e76e392e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555e-d6d3-7f34-575bcae189be	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555e-d6d3-860e-fa4fe2a844ca	TH	THA	764	Thailand 	Tajska	\N
00040000-555e-d6d3-b39d-1f5b65be1100	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555e-d6d3-672f-766234c773eb	TG	TGO	768	Togo 	Togo	\N
00040000-555e-d6d3-6697-35d6e45f5be4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555e-d6d3-9bab-500926182468	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555e-d6d3-86f0-c022bc448f12	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555e-d6d3-b860-d43a7cd32fca	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555e-d6d3-6b32-908f2be93a5b	TR	TUR	792	Turkey 	Turčija	\N
00040000-555e-d6d3-e0b0-f169944e6c91	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555e-d6d3-f642-39cd2f4a20f0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555e-d6d3-d884-bd165f61d8ec	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555e-d6d3-0249-96ea83a24e38	UG	UGA	800	Uganda 	Uganda	\N
00040000-555e-d6d3-c5bb-7aa97d16cef2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555e-d6d3-9022-3f5025d80a6f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555e-d6d3-4b86-73f113429e58	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555e-d6d3-9e2f-067184729b0a	US	USA	840	United States 	Združene države Amerike	\N
00040000-555e-d6d3-c9f4-0887784086f5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555e-d6d3-a5ed-29bae0675f11	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555e-d6d3-1a7b-357fc818f210	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555e-d6d3-6b94-d572ae7d37e0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555e-d6d3-38e1-f1cece2602ff	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555e-d6d3-f9cf-37fc85745510	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555e-d6d3-3b11-2fb0a7e6b96d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555e-d6d3-8829-1c830106578f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555e-d6d3-f605-1b28c5d7052a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555e-d6d3-435c-189e32959816	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555e-d6d3-e639-874377073668	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555e-d6d3-9f58-b9b9980d4dfc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555e-d6d3-d914-4fe787785f08	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4601730)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4601555)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4601599)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4601648)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4601673)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4601504)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555e-d6d3-4765-0693efce17a2	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555e-d6d3-7789-d23ab85c52aa	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555e-d6d3-7264-5668f7c83dcd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555e-d6d3-912e-8b713f898e8f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555e-d6d3-abb1-26ccb25b39fd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555e-d6d3-9f50-f6dbb9ff44cd	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555e-d6d3-c723-6047aebc28cf	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555e-d6d3-46fb-8d3a20d63812	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555e-d6d3-b353-23d7d3247288	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555e-d6d3-21b5-d2b5e3b92bf7	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555e-d6d3-7085-51589ba95f6d	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2633 (class 0 OID 4601414)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555e-d6d3-4f37-24a26d14bebc	00000000-555e-d6d3-abb1-26ccb25b39fd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555e-d6d3-bc82-fc3045e903b3	00000000-555e-d6d3-abb1-26ccb25b39fd	00010000-555e-d6d3-ab49-e2bd06be5584	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555e-d6d3-60df-3d549d268dda	00000000-555e-d6d3-9f50-f6dbb9ff44cd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4601425)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4601475)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4601379)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555e-d6d3-3b8a-bfc698ec450b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555e-d6d3-15ac-051808374171	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555e-d6d3-c4aa-51f29eb5870d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555e-d6d3-289d-8c7423397de4	Abonma-read	Abonma - branje	f
00030000-555e-d6d3-0bb3-a461a1bd5791	Abonma-write	Abonma - spreminjanje	f
00030000-555e-d6d3-7d70-754d1c0f2696	Alternacija-read	Alternacija - branje	f
00030000-555e-d6d3-be36-fcd137d4e9c5	Alternacija-write	Alternacija - spreminjanje	f
00030000-555e-d6d3-13c1-fd7dcab0be4a	Arhivalija-read	Arhivalija - branje	f
00030000-555e-d6d3-7fcb-9f8f77f957e3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555e-d6d3-e884-6701c74a0042	Besedilo-read	Besedilo - branje	f
00030000-555e-d6d3-328c-4319e9b4bf43	Besedilo-write	Besedilo - spreminjanje	f
00030000-555e-d6d3-dba9-e91ed0582d62	DogodekIzven-read	DogodekIzven - branje	f
00030000-555e-d6d3-ceeb-dbb72d173f23	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555e-d6d3-2b4b-b4f523e3c2c6	Dogodek-read	Dogodek - branje	f
00030000-555e-d6d3-872f-2917ae7c97e9	Dogodek-write	Dogodek - spreminjanje	f
00030000-555e-d6d3-8ad0-e724b83063f8	Drzava-read	Drzava - branje	f
00030000-555e-d6d3-bfe3-1d087bbf9f59	Drzava-write	Drzava - spreminjanje	f
00030000-555e-d6d3-a2b8-d5dfc5e06e54	Funkcija-read	Funkcija - branje	f
00030000-555e-d6d3-5f6a-23722f2cf653	Funkcija-write	Funkcija - spreminjanje	f
00030000-555e-d6d3-661d-90daafa79bc6	Gostovanje-read	Gostovanje - branje	f
00030000-555e-d6d3-7705-01a11b1d1415	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555e-d6d3-8d2a-acf9261c3537	Gostujoca-read	Gostujoca - branje	f
00030000-555e-d6d3-d2ae-2d118f479d25	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555e-d6d3-6f83-b5a2522290db	Kupec-read	Kupec - branje	f
00030000-555e-d6d3-beff-367a1c762828	Kupec-write	Kupec - spreminjanje	f
00030000-555e-d6d3-0f27-99d1947d98d8	NacinPlacina-read	NacinPlacina - branje	f
00030000-555e-d6d3-e742-3c25e7cb7733	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555e-d6d3-8aa9-b5c66f18646d	Option-read	Option - branje	f
00030000-555e-d6d3-5a8f-0029a15d3faf	Option-write	Option - spreminjanje	f
00030000-555e-d6d3-6511-6364013da5cd	OptionValue-read	OptionValue - branje	f
00030000-555e-d6d3-c0e7-dbe49861d136	OptionValue-write	OptionValue - spreminjanje	f
00030000-555e-d6d3-0fef-5ba5c0cac61d	Oseba-read	Oseba - branje	f
00030000-555e-d6d3-ce79-d28bb3c4bf75	Oseba-write	Oseba - spreminjanje	f
00030000-555e-d6d3-60c1-7b7dc042c709	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555e-d6d3-6790-52917510cb3e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555e-d6d3-5c09-4ca94bae8d0d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555e-d6d3-e7b0-1124b8b75d76	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555e-d6d3-b964-9f38b338e876	Pogodba-read	Pogodba - branje	f
00030000-555e-d6d3-4d41-2db1a998c2dd	Pogodba-write	Pogodba - spreminjanje	f
00030000-555e-d6d3-a40d-2bffc3ad311e	Popa-read	Popa - branje	f
00030000-555e-d6d3-e815-5c5764bc6b6b	Popa-write	Popa - spreminjanje	f
00030000-555e-d6d3-647f-c0cef17dec67	Posta-read	Posta - branje	f
00030000-555e-d6d3-6a69-0b8a7efdedf1	Posta-write	Posta - spreminjanje	f
00030000-555e-d6d3-d438-de79b6f90f2f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555e-d6d3-7a96-d7a5c0ad288b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555e-d6d3-3795-d9c69fd10d29	PostniNaslov-read	PostniNaslov - branje	f
00030000-555e-d6d3-5324-65dea194d422	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555e-d6d3-9f88-04665eb58477	Predstava-read	Predstava - branje	f
00030000-555e-d6d3-a8c1-f4f58e0f0f82	Predstava-write	Predstava - spreminjanje	f
00030000-555e-d6d3-fe87-d7299e286a7f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555e-d6d3-d65a-aee6715a067f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555e-d6d3-ab78-f17a2fb968cb	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555e-d6d3-4510-64d783d0d4aa	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555e-d6d3-fbfc-e7589453de46	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555e-d6d3-4c91-84fe0217dc5f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555e-d6d3-63d2-64318aebf895	Prostor-read	Prostor - branje	f
00030000-555e-d6d3-b2ae-fb091e190c42	Prostor-write	Prostor - spreminjanje	f
00030000-555e-d6d3-7e94-2fce60cc9e87	Racun-read	Racun - branje	f
00030000-555e-d6d3-ba30-c9a237a1e758	Racun-write	Racun - spreminjanje	f
00030000-555e-d6d3-806a-06adefc5b404	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555e-d6d3-0e7f-77e102ece6f8	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555e-d6d3-05be-608107178d34	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555e-d6d3-4900-04fc002a8949	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555e-d6d3-6a78-4910663c1085	Rekvizit-read	Rekvizit - branje	f
00030000-555e-d6d3-7bea-b73b65e1473b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555e-d6d3-6467-e3d83f67c78f	Rezervacija-read	Rezervacija - branje	f
00030000-555e-d6d3-541b-e9660c970bb8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555e-d6d3-b64a-3a231d0adcb5	SedezniRed-read	SedezniRed - branje	f
00030000-555e-d6d3-13bd-d33b64948dbc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555e-d6d3-bff0-b920d7e6ef71	Sedez-read	Sedez - branje	f
00030000-555e-d6d3-44e5-b1b1d9932700	Sedez-write	Sedez - spreminjanje	f
00030000-555e-d6d3-af03-c41e2db3cf5f	Sezona-read	Sezona - branje	f
00030000-555e-d6d3-9a82-b8d847194a1d	Sezona-write	Sezona - spreminjanje	f
00030000-555e-d6d3-7ffd-690143bb9c0f	Telefonska-read	Telefonska - branje	f
00030000-555e-d6d3-e9b3-7d30cba36fc6	Telefonska-write	Telefonska - spreminjanje	f
00030000-555e-d6d3-add7-38b2825a4b54	TerminStoritve-read	TerminStoritve - branje	f
00030000-555e-d6d3-62f8-c23cc2ab2063	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555e-d6d3-425c-8d167335943c	TipFunkcije-read	TipFunkcije - branje	f
00030000-555e-d6d3-d35a-053381230984	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555e-d6d3-eb3e-f34c37487906	Trr-read	Trr - branje	f
00030000-555e-d6d3-a98b-e8fbf8d326bc	Trr-write	Trr - spreminjanje	f
00030000-555e-d6d3-c91e-3cc7f535947a	Uprizoritev-read	Uprizoritev - branje	f
00030000-555e-d6d3-984f-f413d29de58c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555e-d6d3-0f61-b0657757a7c6	Vaja-read	Vaja - branje	f
00030000-555e-d6d3-c0bd-f5e359e7014a	Vaja-write	Vaja - spreminjanje	f
00030000-555e-d6d3-e31d-795898bfcbb9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555e-d6d3-6cb1-5265910a0c6d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555e-d6d3-e907-b08e94cfe606	Zaposlitev-read	Zaposlitev - branje	f
00030000-555e-d6d3-fb1a-d7ade9f3a39a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555e-d6d3-784e-2de6cdb03129	Zasedenost-read	Zasedenost - branje	f
00030000-555e-d6d3-dd78-fda5b58b00fe	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555e-d6d3-7c87-93afa71d8968	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555e-d6d3-c59b-c53e21ae697a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555e-d6d3-6f90-6ff51f2ce665	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555e-d6d3-ddc5-03f3cffcc8d4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4601398)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555e-d6d3-9e14-324bbb83cca3	00030000-555e-d6d3-8ad0-e724b83063f8
00020000-555e-d6d3-8d4e-dbf204453b96	00030000-555e-d6d3-bfe3-1d087bbf9f59
00020000-555e-d6d3-8d4e-dbf204453b96	00030000-555e-d6d3-8ad0-e724b83063f8
\.


--
-- TOC entry 2659 (class 0 OID 4601680)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4601710)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4601823)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4601455)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4601496)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555e-d6d2-281a-45d20aeaafdf	8341	Adlešiči
00050000-555e-d6d2-8f01-19dcfe421d91	5270	Ajdovščina
00050000-555e-d6d2-4550-ad18b128c834	6280	Ankaran/Ancarano
00050000-555e-d6d2-6dd4-73bc5b07414c	9253	Apače
00050000-555e-d6d2-5173-7efcffd18338	8253	Artiče
00050000-555e-d6d2-1fba-fc0657018c7c	4275	Begunje na Gorenjskem
00050000-555e-d6d2-cd5a-2a12a434c5cc	1382	Begunje pri Cerknici
00050000-555e-d6d2-84dc-fb6be4a02617	9231	Beltinci
00050000-555e-d6d2-2dfa-152604665882	2234	Benedikt
00050000-555e-d6d2-270f-c61f9839d1da	2345	Bistrica ob Dravi
00050000-555e-d6d2-65fe-c3fd45e71d63	3256	Bistrica ob Sotli
00050000-555e-d6d2-4fae-d49726aec4ab	8259	Bizeljsko
00050000-555e-d6d2-489a-d3e1b4c43820	1223	Blagovica
00050000-555e-d6d2-e7f8-b5418936a486	8283	Blanca
00050000-555e-d6d2-3a71-829130e64060	4260	Bled
00050000-555e-d6d2-107b-fae4b6464346	4273	Blejska Dobrava
00050000-555e-d6d2-6897-343369bfb813	9265	Bodonci
00050000-555e-d6d2-b2f0-0bd412aee962	9222	Bogojina
00050000-555e-d6d2-b3ac-c630416cf687	4263	Bohinjska Bela
00050000-555e-d6d2-3c65-6b96e612900c	4264	Bohinjska Bistrica
00050000-555e-d6d2-346c-b15e37b5e48c	4265	Bohinjsko jezero
00050000-555e-d6d2-303b-0565387f1d78	1353	Borovnica
00050000-555e-d6d2-e712-e317a2cccf03	8294	Boštanj
00050000-555e-d6d2-3def-28e4763d66ec	5230	Bovec
00050000-555e-d6d2-1851-663cad59eca5	5295	Branik
00050000-555e-d6d2-0504-b497ea3d691e	3314	Braslovče
00050000-555e-d6d2-39a8-683cf5cc08d2	5223	Breginj
00050000-555e-d6d2-0aea-83b62f0c3ce2	8280	Brestanica
00050000-555e-d6d2-e59c-e2bf0123fa4d	2354	Bresternica
00050000-555e-d6d2-4b59-897efbe2303e	4243	Brezje
00050000-555e-d6d2-fced-9f6b5b2256ec	1351	Brezovica pri Ljubljani
00050000-555e-d6d2-da04-813faa45f565	8250	Brežice
00050000-555e-d6d2-35d5-7aeb1370be78	4210	Brnik - Aerodrom
00050000-555e-d6d2-378f-fd418771163c	8321	Brusnice
00050000-555e-d6d2-2ae2-2f167750ff8c	3255	Buče
00050000-555e-d6d2-1167-5fa1fd1460e0	8276	Bučka 
00050000-555e-d6d2-a016-d6d8bada10e1	9261	Cankova
00050000-555e-d6d2-abd0-a9067e89798a	3000	Celje 
00050000-555e-d6d2-c708-785924082fba	3001	Celje - poštni predali
00050000-555e-d6d2-82f9-0afdef6b0646	4207	Cerklje na Gorenjskem
00050000-555e-d6d2-858f-0d2ab0de579e	8263	Cerklje ob Krki
00050000-555e-d6d2-c732-e3e7aa327f8b	1380	Cerknica
00050000-555e-d6d2-8e91-3f0c091a0610	5282	Cerkno
00050000-555e-d6d2-28b3-24d13500a955	2236	Cerkvenjak
00050000-555e-d6d2-261e-ac4424863749	2215	Ceršak
00050000-555e-d6d2-5ce7-2a2ebc8c7d7d	2326	Cirkovce
00050000-555e-d6d2-3a4d-38fef573fe01	2282	Cirkulane
00050000-555e-d6d2-32f5-a99802e9a1fb	5273	Col
00050000-555e-d6d2-e1c9-ffff02df2ff7	8251	Čatež ob Savi
00050000-555e-d6d2-ad13-197a9d4ed8b3	1413	Čemšenik
00050000-555e-d6d2-9667-3f9d3e2cd752	5253	Čepovan
00050000-555e-d6d2-eae4-e94d5956a8da	9232	Črenšovci
00050000-555e-d6d2-811b-ab3515d678c8	2393	Črna na Koroškem
00050000-555e-d6d2-1b8c-8bb3e61441ff	6275	Črni Kal
00050000-555e-d6d2-ae20-293bd1508054	5274	Črni Vrh nad Idrijo
00050000-555e-d6d2-fec8-a8a082139577	5262	Črniče
00050000-555e-d6d2-2d63-313c39f7e49d	8340	Črnomelj
00050000-555e-d6d2-7d5a-963adbb3b41f	6271	Dekani
00050000-555e-d6d2-1208-e4809e2f3bb2	5210	Deskle
00050000-555e-d6d2-7b85-c45e17d99bc4	2253	Destrnik
00050000-555e-d6d2-e38e-ecf0b589e1e0	6215	Divača
00050000-555e-d6d2-1c28-2341c5c9bc46	1233	Dob
00050000-555e-d6d2-03fe-b94ac14b131a	3224	Dobje pri Planini
00050000-555e-d6d2-32f6-50c89bd640ac	8257	Dobova
00050000-555e-d6d2-2f6e-f6e7a0dd65a5	1423	Dobovec
00050000-555e-d6d2-ee85-732d0398d280	5263	Dobravlje
00050000-555e-d6d2-a1d1-c0bddbaf95f7	3204	Dobrna
00050000-555e-d6d2-1b84-c4f0b357b17d	8211	Dobrnič
00050000-555e-d6d2-49c2-afe263998012	1356	Dobrova
00050000-555e-d6d2-49b4-6ee0b94dd7f1	9223	Dobrovnik/Dobronak 
00050000-555e-d6d2-5ecf-9ed370d5345f	5212	Dobrovo v Brdih
00050000-555e-d6d2-3daa-1ff3f5ea5993	1431	Dol pri Hrastniku
00050000-555e-d6d2-d90b-80acd5883e4d	1262	Dol pri Ljubljani
00050000-555e-d6d2-2ac4-0722c2596de3	1273	Dole pri Litiji
00050000-555e-d6d2-3485-274e62ef6931	1331	Dolenja vas
00050000-555e-d6d2-3ff8-fa15a0221328	8350	Dolenjske Toplice
00050000-555e-d6d2-4b81-85bf8364d6ce	1230	Domžale
00050000-555e-d6d2-a41b-535009e3928b	2252	Dornava
00050000-555e-d6d2-54c2-440517639efb	5294	Dornberk
00050000-555e-d6d2-a293-ce93eb9ea987	1319	Draga
00050000-555e-d6d2-8b05-f30b2531943f	8343	Dragatuš
00050000-555e-d6d2-7184-b6b85d51b0e8	3222	Dramlje
00050000-555e-d6d2-e6a2-e13519f91dd1	2370	Dravograd
00050000-555e-d6d2-be59-d3a96a102147	4203	Duplje
00050000-555e-d6d2-fd86-dce5a98407b2	6221	Dutovlje
00050000-555e-d6d2-cfb8-df50b55fc82d	8361	Dvor
00050000-555e-d6d2-9d9b-c6bddaa1666c	2343	Fala
00050000-555e-d6d2-7e03-f09642102355	9208	Fokovci
00050000-555e-d6d2-2e96-304bc283b74c	2313	Fram
00050000-555e-d6d2-d74a-3d62bf85f864	3213	Frankolovo
00050000-555e-d6d2-311e-86271c126a14	1274	Gabrovka
00050000-555e-d6d2-8012-0a104e90b809	8254	Globoko
00050000-555e-d6d2-575a-a7519d3cefdb	5275	Godovič
00050000-555e-d6d2-74d5-17d7ada77602	4204	Golnik
00050000-555e-d6d2-1d8c-090e57932532	3303	Gomilsko
00050000-555e-d6d2-f76a-5dc964aad4ca	4224	Gorenja vas
00050000-555e-d6d2-de02-0bc0709c9334	3263	Gorica pri Slivnici
00050000-555e-d6d2-e377-26c35b79fd7f	2272	Gorišnica
00050000-555e-d6d2-6d07-6b10c7e5c575	9250	Gornja Radgona
00050000-555e-d6d2-4041-3c98dab721a8	3342	Gornji Grad
00050000-555e-d6d2-b0b9-027a9f52d42f	4282	Gozd Martuljek
00050000-555e-d6d2-1609-e71e239ddc89	6272	Gračišče
00050000-555e-d6d2-6a18-8080f737c31d	9264	Grad
00050000-555e-d6d2-934e-a738ae0f3a71	8332	Gradac
00050000-555e-d6d2-05a5-6f7ab6b06467	1384	Grahovo
00050000-555e-d6d2-2be9-7b3752856cd5	5242	Grahovo ob Bači
00050000-555e-d6d2-7771-9a33c538b104	5251	Grgar
00050000-555e-d6d2-ef46-512a91f9d3f5	3302	Griže
00050000-555e-d6d2-5464-51fbfaeb50cc	3231	Grobelno
00050000-555e-d6d2-65c9-7fb0f5acec3b	1290	Grosuplje
00050000-555e-d6d2-42cc-076500edeee7	2288	Hajdina
00050000-555e-d6d2-0948-7274176d6842	8362	Hinje
00050000-555e-d6d2-4470-537f2be6bb1b	2311	Hoče
00050000-555e-d6d2-172a-9db9b9b85ed4	9205	Hodoš/Hodos
00050000-555e-d6d2-388e-c0205daf6a48	1354	Horjul
00050000-555e-d6d2-cc89-043d50026827	1372	Hotedršica
00050000-555e-d6d2-493e-5c83a8aadfef	1430	Hrastnik
00050000-555e-d6d2-6d6a-8df1ec5bc0f6	6225	Hruševje
00050000-555e-d6d2-2ab3-0d9cfb56f21b	4276	Hrušica
00050000-555e-d6d2-b2e3-7b85784842b4	5280	Idrija
00050000-555e-d6d2-3d13-b0eeeabf43c1	1292	Ig
00050000-555e-d6d2-8670-cb13cdce96a1	6250	Ilirska Bistrica
00050000-555e-d6d2-1ae1-23778d51655d	6251	Ilirska Bistrica-Trnovo
00050000-555e-d6d2-bd6f-9a88d6af3538	1295	Ivančna Gorica
00050000-555e-d6d2-6577-0f5f50b5d8b9	2259	Ivanjkovci
00050000-555e-d6d2-26ec-11c43e21e841	1411	Izlake
00050000-555e-d6d2-db1f-ed9d18c60794	6310	Izola/Isola
00050000-555e-d6d2-4a70-5106b6744168	2222	Jakobski Dol
00050000-555e-d6d2-8f6b-2e4320408a25	2221	Jarenina
00050000-555e-d6d2-46df-2c29d0ee6586	6254	Jelšane
00050000-555e-d6d2-0a7a-65d47ac0e915	4270	Jesenice
00050000-555e-d6d2-4fb2-7b5c946a6a2b	8261	Jesenice na Dolenjskem
00050000-555e-d6d2-df7f-c045829ce815	3273	Jurklošter
00050000-555e-d6d2-f863-8fa3db0679fd	2223	Jurovski Dol
00050000-555e-d6d2-8d36-0f860837aaea	2256	Juršinci
00050000-555e-d6d2-2c5b-74ab5d0b9a75	5214	Kal nad Kanalom
00050000-555e-d6d2-8edb-262faf921361	3233	Kalobje
00050000-555e-d6d2-5269-1a0158575965	4246	Kamna Gorica
00050000-555e-d6d2-813c-db912688ad32	2351	Kamnica
00050000-555e-d6d2-a901-13b41b5221db	1241	Kamnik
00050000-555e-d6d2-f331-715765431ce3	5213	Kanal
00050000-555e-d6d2-7eb8-657d71eb8ea4	8258	Kapele
00050000-555e-d6d2-ac3f-b7771d9a32e0	2362	Kapla
00050000-555e-d6d2-5c23-449811ed91b3	2325	Kidričevo
00050000-555e-d6d2-2ecb-bc4592af4965	1412	Kisovec
00050000-555e-d6d2-695c-f477660e3e6a	6253	Knežak
00050000-555e-d6d2-e7a1-5832fd4daae2	5222	Kobarid
00050000-555e-d6d2-0c79-c915f25e1ba1	9227	Kobilje
00050000-555e-d6d2-8832-b899835067cf	1330	Kočevje
00050000-555e-d6d2-0e4e-b6d37444ff89	1338	Kočevska Reka
00050000-555e-d6d2-3464-e488ff47af27	2276	Kog
00050000-555e-d6d2-a345-e2143d239aec	5211	Kojsko
00050000-555e-d6d2-54d7-3b277e69e8f3	6223	Komen
00050000-555e-d6d2-7ace-6ae09f8adacc	1218	Komenda
00050000-555e-d6d2-9cd9-8dd9d9a9d4ba	6000	Koper/Capodistria 
00050000-555e-d6d2-6222-f213e5a5cbbb	6001	Koper/Capodistria - poštni predali
00050000-555e-d6d2-90fd-0078356bd5bb	8282	Koprivnica
00050000-555e-d6d2-b636-e712c2f325fb	5296	Kostanjevica na Krasu
00050000-555e-d6d2-daeb-f3642d979e62	8311	Kostanjevica na Krki
00050000-555e-d6d2-a359-5cfbc66e1c22	1336	Kostel
00050000-555e-d6d2-d182-abe5cbb76d14	6256	Košana
00050000-555e-d6d2-0cf0-ed86fdc45292	2394	Kotlje
00050000-555e-d6d2-a151-de8d7a62c1df	6240	Kozina
00050000-555e-d6d2-e52b-f22bb433867a	3260	Kozje
00050000-555e-d6d2-3803-543b64cc449b	4000	Kranj 
00050000-555e-d6d2-551c-b412da3a28dd	4001	Kranj - poštni predali
00050000-555e-d6d2-78aa-04e5247f9616	4280	Kranjska Gora
00050000-555e-d6d2-5424-40ba00e97352	1281	Kresnice
00050000-555e-d6d2-fa75-e40680ec03dd	4294	Križe
00050000-555e-d6d2-edbc-05b97e2fe64d	9206	Križevci
00050000-555e-d6d2-2ff8-bab9a0482321	9242	Križevci pri Ljutomeru
00050000-555e-d6d2-2e36-80bfb65aa38b	1301	Krka
00050000-555e-d6d2-d1dc-7924c0b75489	8296	Krmelj
00050000-555e-d6d2-988a-eb9f978e6168	4245	Kropa
00050000-555e-d6d2-00f4-ea3d53ef7199	8262	Krška vas
00050000-555e-d6d2-c34d-4f00cb4fa025	8270	Krško
00050000-555e-d6d2-67a0-048403727826	9263	Kuzma
00050000-555e-d6d2-3841-92a258a14cc2	2318	Laporje
00050000-555e-d6d2-1a3f-12053135ae20	3270	Laško
00050000-555e-d6d2-b8d3-2187d89accbc	1219	Laze v Tuhinju
00050000-555e-d6d2-1203-59f090c91741	2230	Lenart v Slovenskih goricah
00050000-555e-d6d2-3f55-517871e1bbfe	9220	Lendava/Lendva
00050000-555e-d6d2-d6de-87b2ee271d82	4248	Lesce
00050000-555e-d6d2-3f49-417b895f0432	3261	Lesično
00050000-555e-d6d2-3e6c-d7b2da581e6b	8273	Leskovec pri Krškem
00050000-555e-d6d2-ddcb-2f80562c6c55	2372	Libeliče
00050000-555e-d6d2-cec0-9bf7032ebd1d	2341	Limbuš
00050000-555e-d6d2-47be-795b89ee919f	1270	Litija
00050000-555e-d6d2-53d3-e8cdae1e7ca4	3202	Ljubečna
00050000-555e-d6d2-fca4-a5cf2b016bc0	1000	Ljubljana 
00050000-555e-d6d2-793a-1a4857d662fc	1001	Ljubljana - poštni predali
00050000-555e-d6d2-4ab9-534509a0c592	1231	Ljubljana - Črnuče
00050000-555e-d6d2-50b0-ef369a56e7b1	1261	Ljubljana - Dobrunje
00050000-555e-d6d2-f2e0-52a53681b1eb	1260	Ljubljana - Polje
00050000-555e-d6d2-02e4-cfc2c6c610ae	1210	Ljubljana - Šentvid
00050000-555e-d6d2-e58e-2f5a4f774b07	1211	Ljubljana - Šmartno
00050000-555e-d6d2-32b5-1d06dd326d49	3333	Ljubno ob Savinji
00050000-555e-d6d2-4264-0cf859ceb1e8	9240	Ljutomer
00050000-555e-d6d2-445f-d98808e80be4	3215	Loče
00050000-555e-d6d2-6aa2-cec39de2cd5f	5231	Log pod Mangartom
00050000-555e-d6d2-4a12-4d8e3321e6a9	1358	Log pri Brezovici
00050000-555e-d6d2-1792-5fdff7fd7c19	1370	Logatec
00050000-555e-d6d2-ca45-09d1e62900e7	1371	Logatec
00050000-555e-d6d2-6b54-5172d42cce13	1434	Loka pri Zidanem Mostu
00050000-555e-d6d2-8c13-bc1c8ff4dcaf	3223	Loka pri Žusmu
00050000-555e-d6d2-2d45-0d5b290f28ec	6219	Lokev
00050000-555e-d6d2-6a38-dd221def8020	1318	Loški Potok
00050000-555e-d6d2-d244-0228fa7c7e81	2324	Lovrenc na Dravskem polju
00050000-555e-d6d2-0deb-956160a53c74	2344	Lovrenc na Pohorju
00050000-555e-d6d2-ef56-f3306ad585b0	3334	Luče
00050000-555e-d6d2-dc46-cb581e222839	1225	Lukovica
00050000-555e-d6d2-3bf6-d36608e98717	9202	Mačkovci
00050000-555e-d6d2-5aec-e9522a64865d	2322	Majšperk
00050000-555e-d6d2-48c9-20290eb666af	2321	Makole
00050000-555e-d6d2-ea9b-c481ee299a91	9243	Mala Nedelja
00050000-555e-d6d2-2758-5edd2e04cd59	2229	Malečnik
00050000-555e-d6d2-7b27-a9661720286c	6273	Marezige
00050000-555e-d6d2-70ef-d6bf1e21e2b1	2000	Maribor 
00050000-555e-d6d2-b55e-6495c10bae73	2001	Maribor - poštni predali
00050000-555e-d6d2-1163-03674fd9361d	2206	Marjeta na Dravskem polju
00050000-555e-d6d2-2d91-8474162bff61	2281	Markovci
00050000-555e-d6d2-7bfc-8bcbe59db0f4	9221	Martjanci
00050000-555e-d6d2-1e4d-ed20768d2041	6242	Materija
00050000-555e-d6d2-ec38-d38bcd311ecf	4211	Mavčiče
00050000-555e-d6d2-7d62-1fd840fdeefc	1215	Medvode
00050000-555e-d6d2-461f-e11d629688e4	1234	Mengeš
00050000-555e-d6d2-bb84-8248e9895613	8330	Metlika
00050000-555e-d6d2-84ee-6f1101f4e073	2392	Mežica
00050000-555e-d6d2-45e4-0e2ce4fa5038	2204	Miklavž na Dravskem polju
00050000-555e-d6d2-6cc8-19fc482c4323	2275	Miklavž pri Ormožu
00050000-555e-d6d2-b5c3-1d4c0be05c35	5291	Miren
00050000-555e-d6d2-8bd7-9b0cdbfaf61b	8233	Mirna
00050000-555e-d6d2-77f9-7a74ecf21e2e	8216	Mirna Peč
00050000-555e-d6d2-7cfe-27bafbe685ce	2382	Mislinja
00050000-555e-d6d2-bc45-687d1da27b11	4281	Mojstrana
00050000-555e-d6d2-7999-6436e0782eca	8230	Mokronog
00050000-555e-d6d2-e5a4-5a0bc9f446c2	1251	Moravče
00050000-555e-d6d2-de90-dad1177979cc	9226	Moravske Toplice
00050000-555e-d6d2-b5d1-bd8662945ce0	5216	Most na Soči
00050000-555e-d6d2-32d2-3dc2912ca70f	1221	Motnik
00050000-555e-d6d2-21fa-e1c61220f04a	3330	Mozirje
00050000-555e-d6d2-d66f-b7b4877c3117	9000	Murska Sobota 
00050000-555e-d6d2-a054-e2405aaf5286	9001	Murska Sobota - poštni predali
00050000-555e-d6d2-1e7f-bc96e431ceb0	2366	Muta
00050000-555e-d6d2-f5b8-c35194007806	4202	Naklo
00050000-555e-d6d2-e6c1-e0c1e22d38fb	3331	Nazarje
00050000-555e-d6d2-fd18-6b4f980ba422	1357	Notranje Gorice
00050000-555e-d6d2-4164-fde12f4f0957	3203	Nova Cerkev
00050000-555e-d6d2-0da3-dcffa93ae7e5	5000	Nova Gorica 
00050000-555e-d6d2-20f7-c64cbafc80f5	5001	Nova Gorica - poštni predali
00050000-555e-d6d2-203d-065508bcad4b	1385	Nova vas
00050000-555e-d6d2-944f-e46746bdbacf	8000	Novo mesto
00050000-555e-d6d2-85e6-8433c34efba9	8001	Novo mesto - poštni predali
00050000-555e-d6d2-7c9f-b6f9b08e12ed	6243	Obrov
00050000-555e-d6d2-0713-fbe9e667797c	9233	Odranci
00050000-555e-d6d2-0cff-784e8a6c62c1	2317	Oplotnica
00050000-555e-d6d2-2b75-5ad0c4ffc361	2312	Orehova vas
00050000-555e-d6d2-c7da-56ebcad2332a	2270	Ormož
00050000-555e-d6d2-191f-5034682a71b8	1316	Ortnek
00050000-555e-d6d2-f6e4-12d30de6255b	1337	Osilnica
00050000-555e-d6d2-ac2f-683aef824180	8222	Otočec
00050000-555e-d6d2-f820-5c1119d1eb3c	2361	Ožbalt
00050000-555e-d6d2-1afa-d9ecf03e4381	2231	Pernica
00050000-555e-d6d2-ee2a-9e0fb8a8be86	2211	Pesnica pri Mariboru
00050000-555e-d6d2-3cf4-8c90d9596150	9203	Petrovci
00050000-555e-d6d2-2605-18e5dc9792b2	3301	Petrovče
00050000-555e-d6d2-ab03-1e4c22dec24f	6330	Piran/Pirano
00050000-555e-d6d2-bf49-296bba47d4cb	8255	Pišece
00050000-555e-d6d2-1970-6e53787557a1	6257	Pivka
00050000-555e-d6d2-365f-3244bcce5ec1	6232	Planina
00050000-555e-d6d2-189a-6d53e752c046	3225	Planina pri Sevnici
00050000-555e-d6d2-be51-dcfb758a16e7	6276	Pobegi
00050000-555e-d6d2-2953-81af0d40c6a0	8312	Podbočje
00050000-555e-d6d2-29b0-ffcc39f9d08c	5243	Podbrdo
00050000-555e-d6d2-a4d4-e15148d1628c	3254	Podčetrtek
00050000-555e-d6d2-8a35-f915eec38c5c	2273	Podgorci
00050000-555e-d6d2-fea2-b405e4eb707c	6216	Podgorje
00050000-555e-d6d2-7e2a-0136884e4e9f	2381	Podgorje pri Slovenj Gradcu
00050000-555e-d6d2-f821-2dc9b7cc74dd	6244	Podgrad
00050000-555e-d6d2-e1a5-3d1a13291bcc	1414	Podkum
00050000-555e-d6d2-4dba-43f0861c8706	2286	Podlehnik
00050000-555e-d6d2-d454-b8cc6ea59938	5272	Podnanos
00050000-555e-d6d2-f700-f1ebbb3cecb9	4244	Podnart
00050000-555e-d6d2-1054-49ee69d09046	3241	Podplat
00050000-555e-d6d2-0f75-d5112aa7d476	3257	Podsreda
00050000-555e-d6d2-9232-6d1a7372242d	2363	Podvelka
00050000-555e-d6d2-8d4f-de18e57259d2	2208	Pohorje
00050000-555e-d6d2-8646-f1f25b76fd21	2257	Polenšak
00050000-555e-d6d2-5f00-49469f000f2f	1355	Polhov Gradec
00050000-555e-d6d2-2368-9917112782fe	4223	Poljane nad Škofjo Loko
00050000-555e-d6d2-dea1-8658dc08c551	2319	Poljčane
00050000-555e-d6d2-a76f-83b9285fdfe3	1272	Polšnik
00050000-555e-d6d2-ec14-61d441700b21	3313	Polzela
00050000-555e-d6d2-5b74-2746f5239a4e	3232	Ponikva
00050000-555e-d6d2-354f-0ecb14940de3	6320	Portorož/Portorose
00050000-555e-d6d2-5f90-48f2f02a0ba6	6230	Postojna
00050000-555e-d6d2-de4a-d58505ef0156	2331	Pragersko
00050000-555e-d6d2-b39b-433814f36cf4	3312	Prebold
00050000-555e-d6d2-9cd2-3fb01abec098	4205	Preddvor
00050000-555e-d6d2-bb7d-5d2981ef282f	6255	Prem
00050000-555e-d6d2-52d7-911f34c8602f	1352	Preserje
00050000-555e-d6d2-d7a0-a95662b9a11f	6258	Prestranek
00050000-555e-d6d2-18e8-f7f403aca4e1	2391	Prevalje
00050000-555e-d6d2-5462-027d0e61202f	3262	Prevorje
00050000-555e-d6d2-0779-53efda896b5a	1276	Primskovo 
00050000-555e-d6d2-6e36-b374d168528f	3253	Pristava pri Mestinju
00050000-555e-d6d2-ea6c-4a50bd69d71d	9207	Prosenjakovci/Partosfalva
00050000-555e-d6d2-ca56-4894329de466	5297	Prvačina
00050000-555e-d6d2-29f1-403984f26186	2250	Ptuj
00050000-555e-d6d2-b998-7db52865bd66	2323	Ptujska Gora
00050000-555e-d6d2-7a52-a6a54f37a0e9	9201	Puconci
00050000-555e-d6d2-50cb-5c199bdb33ba	2327	Rače
00050000-555e-d6d2-3c80-a5e1b5fd029e	1433	Radeče
00050000-555e-d6d2-8c7b-9917ed5342ae	9252	Radenci
00050000-555e-d6d2-ea2d-0d33d8f6ec69	2360	Radlje ob Dravi
00050000-555e-d6d2-480e-bfb62592a17d	1235	Radomlje
00050000-555e-d6d2-3757-4c1ce9dd0e7b	4240	Radovljica
00050000-555e-d6d2-6879-ee51ea9b919e	8274	Raka
00050000-555e-d6d2-8671-c7b8b2d46aad	1381	Rakek
00050000-555e-d6d2-3ef5-fa9bb7fb621a	4283	Rateče - Planica
00050000-555e-d6d2-a4f0-c6c6817d7760	2390	Ravne na Koroškem
00050000-555e-d6d2-9f17-084e72286899	9246	Razkrižje
00050000-555e-d6d2-6122-a20a2b1fae4f	3332	Rečica ob Savinji
00050000-555e-d6d2-fb27-0ea6cf6e89ff	5292	Renče
00050000-555e-d6d2-f9fc-1790ac66aae6	1310	Ribnica
00050000-555e-d6d2-6157-1fb56bbc71a6	2364	Ribnica na Pohorju
00050000-555e-d6d2-1c19-05d9faaeb396	3272	Rimske Toplice
00050000-555e-d6d2-b731-5cd50c0eb9e5	1314	Rob
00050000-555e-d6d2-7264-641286a28462	5215	Ročinj
00050000-555e-d6d2-3ae7-f37d4adb2f84	3250	Rogaška Slatina
00050000-555e-d6d2-6d58-3d95c94926ad	9262	Rogašovci
00050000-555e-d6d2-1628-488bea50da99	3252	Rogatec
00050000-555e-d6d2-89e7-3b61bf835546	1373	Rovte
00050000-555e-d6d2-a394-eec938ea052f	2342	Ruše
00050000-555e-d6d2-635c-819ca35816ea	1282	Sava
00050000-555e-d6d2-162b-5300e492d7c6	6333	Sečovlje/Sicciole
00050000-555e-d6d2-eba5-0f8798d58820	4227	Selca
00050000-555e-d6d2-71f4-19952c99eeeb	2352	Selnica ob Dravi
00050000-555e-d6d2-30ca-bddcaeebfa67	8333	Semič
00050000-555e-d6d2-038f-eb1877c6cd4f	8281	Senovo
00050000-555e-d6d2-34dd-770e312fd064	6224	Senožeče
00050000-555e-d6d2-d727-25a10775a038	8290	Sevnica
00050000-555e-d6d2-5e4c-50147396e0a1	6210	Sežana
00050000-555e-d6d2-48dc-8c0653d6cd1a	2214	Sladki Vrh
00050000-555e-d6d2-16da-996aefe2b422	5283	Slap ob Idrijci
00050000-555e-d6d2-a0e7-8d8fe3004dc3	2380	Slovenj Gradec
00050000-555e-d6d2-541a-889638b8d31a	2310	Slovenska Bistrica
00050000-555e-d6d2-4819-69edc2a4aa9a	3210	Slovenske Konjice
00050000-555e-d6d2-b763-2142e9ccc7af	1216	Smlednik
00050000-555e-d6d2-4726-212eeb7f2e5e	5232	Soča
00050000-555e-d6d2-32bb-04749991e222	1317	Sodražica
00050000-555e-d6d2-cbb5-bb27aeaecb2d	3335	Solčava
00050000-555e-d6d2-4cb3-384979a7ddd8	5250	Solkan
00050000-555e-d6d2-83d7-0a2e4ee98536	4229	Sorica
00050000-555e-d6d2-0b9c-564f261023e5	4225	Sovodenj
00050000-555e-d6d2-5c73-a3ca4fdfc35a	5281	Spodnja Idrija
00050000-555e-d6d2-5b50-325feb57c073	2241	Spodnji Duplek
00050000-555e-d6d2-5282-72dc2348f2ce	9245	Spodnji Ivanjci
00050000-555e-d6d2-9a20-4bd9377c6c83	2277	Središče ob Dravi
00050000-555e-d6d2-eadc-1a0400f7ccbe	4267	Srednja vas v Bohinju
00050000-555e-d6d2-c11e-24315fc01135	8256	Sromlje 
00050000-555e-d6d2-11d3-a569d2bd4eef	5224	Srpenica
00050000-555e-d6d2-8210-e120b7cad82a	1242	Stahovica
00050000-555e-d6d2-3d7a-758108461343	1332	Stara Cerkev
00050000-555e-d6d2-376a-00aec7cee6e9	8342	Stari trg ob Kolpi
00050000-555e-d6d2-6fdc-c2b2f1595a7f	1386	Stari trg pri Ložu
00050000-555e-d6d2-c721-643832b5293b	2205	Starše
00050000-555e-d6d2-31ea-8fd44d986bd2	2289	Stoperce
00050000-555e-d6d2-e579-c636be05909a	8322	Stopiče
00050000-555e-d6d2-c493-8135e4aecf0a	3206	Stranice
00050000-555e-d6d2-065b-55911d32b5c0	8351	Straža
00050000-555e-d6d2-de3c-68f292f7160b	1313	Struge
00050000-555e-d6d2-acd6-676d9dd64ebc	8293	Studenec
00050000-555e-d6d2-b39f-1bb78b2c11fc	8331	Suhor
00050000-555e-d6d2-349c-1603c4804a9c	2233	Sv. Ana v Slovenskih goricah
00050000-555e-d6d2-0049-47a643359247	2235	Sv. Trojica v Slovenskih goricah
00050000-555e-d6d2-444d-5439c3815e35	2353	Sveti Duh na Ostrem Vrhu
00050000-555e-d6d2-303c-39297c866e5e	9244	Sveti Jurij ob Ščavnici
00050000-555e-d6d2-3894-909f1e37280d	3264	Sveti Štefan
00050000-555e-d6d2-c5db-b8909d88a70c	2258	Sveti Tomaž
00050000-555e-d6d2-e7e2-c520a9c29895	9204	Šalovci
00050000-555e-d6d2-49d6-1bd053efee3b	5261	Šempas
00050000-555e-d6d2-dbad-d800c045d062	5290	Šempeter pri Gorici
00050000-555e-d6d2-86c4-0fc26003002a	3311	Šempeter v Savinjski dolini
00050000-555e-d6d2-b826-982d43772028	4208	Šenčur
00050000-555e-d6d2-ac51-e8cc4a0c50f6	2212	Šentilj v Slovenskih goricah
00050000-555e-d6d2-88ff-a459b71cc3e9	8297	Šentjanž
00050000-555e-d6d2-5bae-7fb1351ee376	2373	Šentjanž pri Dravogradu
00050000-555e-d6d2-be77-29d091323142	8310	Šentjernej
00050000-555e-d6d2-7e21-f9d21ec1e4e4	3230	Šentjur
00050000-555e-d6d2-84ad-bcef0d1779aa	3271	Šentrupert
00050000-555e-d6d2-afdd-8e4e2e034ed7	8232	Šentrupert
00050000-555e-d6d2-8277-de6765bd2ba2	1296	Šentvid pri Stični
00050000-555e-d6d2-64ef-2c7b2ce7534b	8275	Škocjan
00050000-555e-d6d2-6e81-f64811e9c392	6281	Škofije
00050000-555e-d6d2-99d9-48c5cf4d06a0	4220	Škofja Loka
00050000-555e-d6d2-f3b7-9dd39d88f550	3211	Škofja vas
00050000-555e-d6d2-5616-3603060292b4	1291	Škofljica
00050000-555e-d6d2-bb25-74ee962b0b87	6274	Šmarje
00050000-555e-d6d2-1f62-b5539ff7dbe0	1293	Šmarje - Sap
00050000-555e-d6d2-5e02-ca435fd7a7a6	3240	Šmarje pri Jelšah
00050000-555e-d6d2-4370-874a718c09ad	8220	Šmarješke Toplice
00050000-555e-d6d2-4d00-7df7c9f0f089	2315	Šmartno na Pohorju
00050000-555e-d6d2-79d6-af1985d83a32	3341	Šmartno ob Dreti
00050000-555e-d6d2-3516-4f9c5735fc2c	3327	Šmartno ob Paki
00050000-555e-d6d2-b51e-d993c70dbaab	1275	Šmartno pri Litiji
00050000-555e-d6d2-0f2e-4b911e6dee78	2383	Šmartno pri Slovenj Gradcu
00050000-555e-d6d2-955b-5e8f5835d984	3201	Šmartno v Rožni dolini
00050000-555e-d6d2-6890-67ffd6d33d04	3325	Šoštanj
00050000-555e-d6d2-2104-f2a86141f1bf	6222	Štanjel
00050000-555e-d6d2-23e4-45d4ebee2e5f	3220	Štore
00050000-555e-d6d2-fbe9-8b8aef0a670b	3304	Tabor
00050000-555e-d6d2-33ee-5413cb1bea58	3221	Teharje
00050000-555e-d6d2-e80c-42f96fd37534	9251	Tišina
00050000-555e-d6d2-077d-b93439982ae7	5220	Tolmin
00050000-555e-d6d2-1422-17607c6528f1	3326	Topolšica
00050000-555e-d6d2-6ba0-1f89c9eda324	2371	Trbonje
00050000-555e-d6d2-e792-48047065c70d	1420	Trbovlje
00050000-555e-d6d2-7a84-679a5332bc20	8231	Trebelno 
00050000-555e-d6d2-ac34-68d6efe78007	8210	Trebnje
00050000-555e-d6d2-21ed-1c28cec8a2fe	5252	Trnovo pri Gorici
00050000-555e-d6d2-72ea-ec809544e59f	2254	Trnovska vas
00050000-555e-d6d2-5714-e9049283a173	1222	Trojane
00050000-555e-d6d2-ecec-56c9c0875af9	1236	Trzin
00050000-555e-d6d2-a77a-55b3cbd2e706	4290	Tržič
00050000-555e-d6d2-a03d-3e42cbbbefb3	8295	Tržišče
00050000-555e-d6d2-367d-3467fdb56706	1311	Turjak
00050000-555e-d6d2-b9dd-34d4a4ba95a9	9224	Turnišče
00050000-555e-d6d2-613e-22560300cb74	8323	Uršna sela
00050000-555e-d6d2-d227-882343af4c95	1252	Vače
00050000-555e-d6d2-a113-955d307f5012	3320	Velenje 
00050000-555e-d6d2-8e8c-5d01e0c9b761	3322	Velenje - poštni predali
00050000-555e-d6d2-5cd9-adc9dc3a69f7	8212	Velika Loka
00050000-555e-d6d2-bee9-ae666a885c8d	2274	Velika Nedelja
00050000-555e-d6d2-8b85-c33f93d168a1	9225	Velika Polana
00050000-555e-d6d2-21cb-ce6123d28e37	1315	Velike Lašče
00050000-555e-d6d2-6974-492d3e36e5d2	8213	Veliki Gaber
00050000-555e-d6d2-2425-dbab09fe8422	9241	Veržej
00050000-555e-d6d2-a79c-0fa914bd7854	1312	Videm - Dobrepolje
00050000-555e-d6d2-e7d0-18b90667a140	2284	Videm pri Ptuju
00050000-555e-d6d2-4bf3-c4b4a39cef6f	8344	Vinica
00050000-555e-d6d2-9197-88945cba0b94	5271	Vipava
00050000-555e-d6d2-11b1-12d6a3d40c99	4212	Visoko
00050000-555e-d6d2-926e-5240da3f6089	1294	Višnja Gora
00050000-555e-d6d2-5f6f-9ac40984fe41	3205	Vitanje
00050000-555e-d6d2-9dd5-cf2fe097a6f0	2255	Vitomarci
00050000-555e-d6d2-a29a-cf6a0e16606e	1217	Vodice
00050000-555e-d6d2-7ce5-de92857bc93e	3212	Vojnik\t
00050000-555e-d6d2-8524-4ebc4a51606c	5293	Volčja Draga
00050000-555e-d6d2-6034-cffecd69b6d5	2232	Voličina
00050000-555e-d6d2-98e2-af5415a208d4	3305	Vransko
00050000-555e-d6d2-8ff1-ed1ecb2b6f26	6217	Vremski Britof
00050000-555e-d6d2-4163-11538ea1e80d	1360	Vrhnika
00050000-555e-d6d2-d4b4-7096281da3d1	2365	Vuhred
00050000-555e-d6d2-c2ef-78a31d1118f1	2367	Vuzenica
00050000-555e-d6d2-e9a9-dea7fc784f58	8292	Zabukovje 
00050000-555e-d6d2-73bb-b6c2c4f14f58	1410	Zagorje ob Savi
00050000-555e-d6d2-a046-8c4c6c352fa4	1303	Zagradec
00050000-555e-d6d2-616d-91fe8005bc21	2283	Zavrč
00050000-555e-d6d2-89aa-ff618aedf1b9	8272	Zdole 
00050000-555e-d6d2-e2c5-b8fc8cf31a9c	4201	Zgornja Besnica
00050000-555e-d6d2-f614-1f0864dcbd60	2242	Zgornja Korena
00050000-555e-d6d2-8939-9178fd6ab7d7	2201	Zgornja Kungota
00050000-555e-d6d2-3296-76e677771d92	2316	Zgornja Ložnica
00050000-555e-d6d2-2412-f7711c8dd7c1	2314	Zgornja Polskava
00050000-555e-d6d2-b432-91b6406924d7	2213	Zgornja Velka
00050000-555e-d6d2-709f-2bdf495a1009	4247	Zgornje Gorje
00050000-555e-d6d2-dcbb-3da4916fdcd2	4206	Zgornje Jezersko
00050000-555e-d6d2-2b94-58140b0db6f9	2285	Zgornji Leskovec
00050000-555e-d6d2-cbfc-79b2b36aa919	1432	Zidani Most
00050000-555e-d6d2-2ec3-68440e40d8e8	3214	Zreče
00050000-555e-d6d2-46ec-49557c2d1c29	4209	Žabnica
00050000-555e-d6d2-1f01-b87d08578705	3310	Žalec
00050000-555e-d6d2-0563-785ef0c41a04	4228	Železniki
00050000-555e-d6d2-11ae-3c4e88751211	2287	Žetale
00050000-555e-d6d2-0e5e-3ac62abec2c4	4226	Žiri
00050000-555e-d6d2-327a-b27b44083fc0	4274	Žirovnica
00050000-555e-d6d2-1aac-46d88d648a53	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4601654)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 4601482)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4601547)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4601666)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4601771)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4601816)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4601695)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4601639)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4601629)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4601806)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4601761)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4601350)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555e-d6d3-ab49-e2bd06be5584	00010000-555e-d6d3-753c-8f055d847fa3	2015-05-22 09:12:19	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROwTJ3v.o68xeYmwT8H.xaOBtJeXSp1UW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4601704)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4601388)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555e-d6d3-fc5d-2264ea472c93	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555e-d6d3-52b9-ba2ff7feba4d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555e-d6d3-9e14-324bbb83cca3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555e-d6d3-768b-07d095f3d4b6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555e-d6d3-dd45-d78e5c6347c9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555e-d6d3-8d4e-dbf204453b96	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4601372)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555e-d6d3-ab49-e2bd06be5584	00020000-555e-d6d3-768b-07d095f3d4b6
00010000-555e-d6d3-753c-8f055d847fa3	00020000-555e-d6d3-768b-07d095f3d4b6
\.


--
-- TOC entry 2664 (class 0 OID 4601718)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4601660)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4601610)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4601447)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4601616)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4601794)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4601516)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4601359)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555e-d6d3-753c-8f055d847fa3	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROodI8Xyo0d5EfCv31jIvFrFklEvUQZcq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555e-d6d3-ab49-e2bd06be5584	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4601848)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4601562)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4601687)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4601753)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4601594)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4601838)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4601743)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4601413)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4601888)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4601881)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4601793)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4601584)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4601609)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4601542)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4601739)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4601560)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4601603)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 4601652)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4601679)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4601514)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4601422)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4601479)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4601445)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4601402)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4601387)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4601685)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4601717)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4601833)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4601472)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4601502)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4601658)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 4601492)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4601551)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4601670)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4601777)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4601821)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4601702)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4601643)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4601634)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4601815)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4601768)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4601358)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4601708)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4601376)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4601396)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4601726)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4601665)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4601615)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4601452)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4601625)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4601805)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4601527)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4601371)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4601863)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4601569)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4601693)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4601759)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4601598)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4601847)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4601752)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4601591)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4601474)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2247 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2248 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2249 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2373 (class 1259 OID 4601686)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4601672)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4601671)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4601570)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4601742)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4601740)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4601741)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4601835)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4601836)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4601837)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4601866)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4601865)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4601864)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4601529)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4601528)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4601481)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4601480)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4601709)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4601604)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4601403)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4601404)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4601729)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4601728)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4601727)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4601552)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4601554)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4601553)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4601638)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4601636)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4601635)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4601637)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4601377)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4601378)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4601694)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4601659)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4601769)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4601770)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4601494)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4601493)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4601495)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4601778)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4601779)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4601891)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4601890)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4601893)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4601889)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4601892)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4601760)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4601647)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4601646)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4601644)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4601645)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4601883)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4601882)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4601561)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4601424)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4601423)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4601453)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4601454)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4601628)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4601627)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4601626)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4601593)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4601589)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4601586)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4601587)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4601585)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4601590)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4601588)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4601473)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4601543)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4601545)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4601544)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4601546)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4601653)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4601834)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4601446)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4601515)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4601703)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4601503)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4601822)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4601397)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4601592)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4602024)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4602009)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4602014)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4602034)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4602004)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4602029)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4602019)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4601939)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4602119)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4602114)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4602109)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4601999)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4602159)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4602149)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4602154)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4602099)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4602194)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4602199)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4602204)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4602219)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4602214)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4602209)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4601974)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4601969)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4601949)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4601944)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4601924)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4602129)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4602039)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4601904)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4601909)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4602144)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4602139)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4602134)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4601979)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4601989)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4601984)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4602074)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4602064)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4602059)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4602069)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4601894)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4601899)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4602124)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4602104)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4602169)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4602174)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4601959)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4601954)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4601964)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4602179)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4602184)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4602244)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4602239)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4602254)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4602234)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4602249)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4602164)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4602094)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4602089)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4602079)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4602084)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4602229)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4602224)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4601994)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4602189)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4601919)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4601914)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4601929)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4601934)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4602054)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4602049)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4602044)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-22 09:12:20 CEST

--
-- PostgreSQL database dump complete
--

