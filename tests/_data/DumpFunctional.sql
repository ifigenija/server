--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-15 09:14:26 CEST

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
-- TOC entry 179 (class 1259 OID 3468157)
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
-- TOC entry 225 (class 1259 OID 3468640)
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
-- TOC entry 224 (class 1259 OID 3468623)
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
-- TOC entry 217 (class 1259 OID 3468534)
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
-- TOC entry 193 (class 1259 OID 3468325)
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
-- TOC entry 196 (class 1259 OID 3468359)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3468284)
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
-- TOC entry 212 (class 1259 OID 3468484)
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
-- TOC entry 191 (class 1259 OID 3468309)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3468353)
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
-- TOC entry 201 (class 1259 OID 3468402)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3468427)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3468258)
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
-- TOC entry 180 (class 1259 OID 3468166)
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
-- TOC entry 181 (class 1259 OID 3468177)
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
-- TOC entry 184 (class 1259 OID 3468228)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3468131)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3468150)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3468434)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3468464)
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
-- TOC entry 221 (class 1259 OID 3468579)
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
-- TOC entry 183 (class 1259 OID 3468208)
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
-- TOC entry 186 (class 1259 OID 3468250)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3468408)
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
-- TOC entry 185 (class 1259 OID 3468235)
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
-- TOC entry 190 (class 1259 OID 3468301)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3468420)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3468525)
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
-- TOC entry 220 (class 1259 OID 3468572)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3468449)
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
-- TOC entry 200 (class 1259 OID 3468393)
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
-- TOC entry 199 (class 1259 OID 3468383)
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
-- TOC entry 219 (class 1259 OID 3468562)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3468515)
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
-- TOC entry 173 (class 1259 OID 3468102)
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
-- TOC entry 172 (class 1259 OID 3468100)
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
-- TOC entry 209 (class 1259 OID 3468458)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3468140)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3468124)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3468472)
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
-- TOC entry 203 (class 1259 OID 3468414)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3468364)
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
-- TOC entry 182 (class 1259 OID 3468200)
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
-- TOC entry 198 (class 1259 OID 3468370)
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
-- TOC entry 218 (class 1259 OID 3468550)
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
-- TOC entry 188 (class 1259 OID 3468270)
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
-- TOC entry 174 (class 1259 OID 3468111)
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
-- TOC entry 223 (class 1259 OID 3468604)
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
-- TOC entry 192 (class 1259 OID 3468316)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3468441)
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
-- TOC entry 214 (class 1259 OID 3468507)
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
-- TOC entry 194 (class 1259 OID 3468348)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3468594)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3468497)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3468105)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3468157)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3468640)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3468623)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3468534)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3468325)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3468359)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3468284)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5555-9cd1-e945-6e96eb7b21e6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5555-9cd1-22a4-2ac3778f6630	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5555-9cd1-ea9a-44062a204b06	AL	ALB	008	Albania 	Albanija	\N
00040000-5555-9cd1-8021-ee6c01d49b96	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5555-9cd1-ef05-14221cf13868	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5555-9cd1-e9d5-7c1d20015cee	AD	AND	020	Andorra 	Andora	\N
00040000-5555-9cd1-7fa9-0a57c289cbd2	AO	AGO	024	Angola 	Angola	\N
00040000-5555-9cd1-a680-b8aa947a5896	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5555-9cd1-979c-d29a0edf95fb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5555-9cd1-97c5-47e1a76b15e6	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5555-9cd1-6a3b-913a40d8a532	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5555-9cd1-e94e-cb0f42f6748e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5555-9cd1-e4a7-631243d2db09	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5555-9cd1-b1dd-87bfb1242bed	AU	AUS	036	Australia 	Avstralija	\N
00040000-5555-9cd1-2911-1df1bf545b77	AT	AUT	040	Austria 	Avstrija	\N
00040000-5555-9cd1-7c2a-cbb16c43e825	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5555-9cd1-f159-8dbefcf3f0e0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5555-9cd1-64d9-a9ca67b4384b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5555-9cd1-d086-de279a47740d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5555-9cd1-35fe-bdfe63a878f6	BB	BRB	052	Barbados 	Barbados	\N
00040000-5555-9cd1-ac27-66743fe198dd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5555-9cd1-0bc1-ec9cdf13a123	BE	BEL	056	Belgium 	Belgija	\N
00040000-5555-9cd1-5030-b5860d615864	BZ	BLZ	084	Belize 	Belize	\N
00040000-5555-9cd1-1158-d2cf113e845d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5555-9cd1-420b-5f44918198c8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5555-9cd1-7d1e-f7577edd2fba	BT	BTN	064	Bhutan 	Butan	\N
00040000-5555-9cd1-13c9-1bd804552796	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5555-9cd1-84f5-412a6b5a7e24	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5555-9cd1-cce5-bba25d841095	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5555-9cd1-a9ce-b92f14f9567a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5555-9cd1-c42c-3dc46c69103b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5555-9cd1-5ded-2a4544310b07	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5555-9cd1-3ee4-a381cd89f9d4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5555-9cd1-edf8-f93794637a58	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5555-9cd1-ddf3-d79cda153bdf	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5555-9cd1-5697-535f75218509	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5555-9cd1-122a-e2000c422801	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5555-9cd1-600e-8ec42d360718	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5555-9cd1-9cab-5df2689b7567	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5555-9cd1-07a1-c6b79d0f78d6	CA	CAN	124	Canada 	Kanada	\N
00040000-5555-9cd1-bd4d-63091a65ec87	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5555-9cd1-d60a-b8c4ab97e5f4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5555-9cd1-8591-3815316b7e54	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5555-9cd1-1de3-803c46709f90	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5555-9cd1-e76f-e99f4b8778dd	CL	CHL	152	Chile 	Čile	\N
00040000-5555-9cd1-ba16-dd8ac4bde5f8	CN	CHN	156	China 	Kitajska	\N
00040000-5555-9cd1-8bbe-24d55df0e46d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5555-9cd1-1fcc-4411e323d676	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5555-9cd1-a11f-ae6d0f25a9db	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5555-9cd1-3a2e-8ce68cf762a8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5555-9cd1-30f2-bd0f04da1fd6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5555-9cd1-f16e-11b593a36fc1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5555-9cd1-92cd-c720d263abc2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5555-9cd1-a9db-2b422a3e4624	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5555-9cd1-f956-23ce62b3f5a6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5555-9cd1-d083-3b40cfe638bf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5555-9cd1-67f1-86312c1ae45c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5555-9cd1-6ff3-5901a77560b7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5555-9cd1-411f-0c414260f9df	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5555-9cd1-faf8-7006fa0eec65	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5555-9cd1-d343-e06b6242e234	DK	DNK	208	Denmark 	Danska	\N
00040000-5555-9cd1-2799-fb0f72d54ab5	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5555-9cd1-cb54-e47d6c164af1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5555-9cd1-f380-179918e499e8	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5555-9cd1-01c3-9629102fe175	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5555-9cd1-e234-7a8dd358949b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5555-9cd1-dce2-96fb046be8d1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5555-9cd1-5b2b-295f3993956d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5555-9cd1-5f3c-056152cc01cf	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5555-9cd1-20df-cdaeb3da4b61	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5555-9cd1-84e7-b0e6b0c9a24d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5555-9cd1-1f3c-38dc3bf5f502	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5555-9cd1-2743-5694720aebb8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5555-9cd1-4f79-3ffa7e308ac3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5555-9cd1-2ab9-e99c32744f6e	FI	FIN	246	Finland 	Finska	\N
00040000-5555-9cd1-fce0-0ef037e5b7fd	FR	FRA	250	France 	Francija	\N
00040000-5555-9cd1-24b6-23eefc2bc072	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5555-9cd1-6aa2-40e37ec0cf3a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5555-9cd1-b9cf-b46880794bf8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5555-9cd1-e261-e9b7941f24cb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5555-9cd1-adda-9ea51201b615	GA	GAB	266	Gabon 	Gabon	\N
00040000-5555-9cd1-9b01-e2d27622624b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5555-9cd1-6542-abfc0b45b9b8	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5555-9cd1-c340-8983e507f5af	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5555-9cd1-1049-734a91df1dd6	GH	GHA	288	Ghana 	Gana	\N
00040000-5555-9cd1-351f-8ce2ca52b219	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5555-9cd1-569f-7e253a911d59	GR	GRC	300	Greece 	Grčija	\N
00040000-5555-9cd1-1edd-e60e88b52a5e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5555-9cd1-bf3e-2dfcadcd6b41	GD	GRD	308	Grenada 	Grenada	\N
00040000-5555-9cd1-f1bc-36f1c955a6a4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5555-9cd1-2d5e-a34b43174b20	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5555-9cd1-f712-c3027cd73cd0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5555-9cd1-bbcf-3ca38bba6b11	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5555-9cd1-a762-1aa511014907	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5555-9cd1-35c4-e6b62d88be98	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5555-9cd1-b073-b2c0b2631a9f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5555-9cd1-1b1e-0fa64dfa99a9	HT	HTI	332	Haiti 	Haiti	\N
00040000-5555-9cd1-15ae-5373420f4002	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5555-9cd1-b157-418b0a58c28b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5555-9cd1-a693-2d5a57af1eeb	HN	HND	340	Honduras 	Honduras	\N
00040000-5555-9cd1-deb6-84485dce588c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5555-9cd1-7eae-321cc85b0191	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5555-9cd1-c550-53146a4843ce	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5555-9cd1-a75c-92032dc499e3	IN	IND	356	India 	Indija	\N
00040000-5555-9cd1-23b1-a4dbf0251f24	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5555-9cd1-cba9-0b2d3e370f2c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5555-9cd1-c604-7e4bc363c26d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5555-9cd1-32cf-edfde513b320	IE	IRL	372	Ireland 	Irska	\N
00040000-5555-9cd1-a1a6-a4f8c0c92ec5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5555-9cd1-7caa-1710ce48f1ca	IL	ISR	376	Israel 	Izrael	\N
00040000-5555-9cd1-fc0b-7157e8571c68	IT	ITA	380	Italy 	Italija	\N
00040000-5555-9cd1-9ed4-2b27429b35d5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5555-9cd1-4da4-01addb0e7a83	JP	JPN	392	Japan 	Japonska	\N
00040000-5555-9cd1-6d1e-869a0286e902	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5555-9cd1-8e57-7d25029baaeb	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5555-9cd1-6b57-03b24addd7f1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5555-9cd1-3fc2-32987ccf4fbb	KE	KEN	404	Kenya 	Kenija	\N
00040000-5555-9cd1-7491-595ee5408918	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5555-9cd1-08ed-5b122de7b2c6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5555-9cd1-5a4b-f7d2b9f05658	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5555-9cd1-e7d7-1dc48a3e789d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5555-9cd1-d2fe-c38df9b18716	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5555-9cd1-57af-27057712a3dd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5555-9cd1-667c-603616ff0657	LV	LVA	428	Latvia 	Latvija	\N
00040000-5555-9cd1-7e8c-6b7330337221	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5555-9cd1-02de-d26786620810	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5555-9cd1-a4ef-795a052dac13	LR	LBR	430	Liberia 	Liberija	\N
00040000-5555-9cd1-9db0-9ec489b35011	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5555-9cd1-e004-87dd1a279b84	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5555-9cd1-800e-97ea5148be3a	LT	LTU	440	Lithuania 	Litva	\N
00040000-5555-9cd1-1f57-3618c9f14560	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5555-9cd1-5684-49e1d5b69c47	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5555-9cd1-43cc-bc4248d5f23c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5555-9cd1-08bd-30743a4cc82b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5555-9cd1-4062-8e4a3e684b15	MW	MWI	454	Malawi 	Malavi	\N
00040000-5555-9cd1-0638-ad45675bb377	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5555-9cd1-e5a1-3143cced2a3e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5555-9cd1-6a4e-ee65ccc4eae0	ML	MLI	466	Mali 	Mali	\N
00040000-5555-9cd1-a501-2b39c82ccf1d	MT	MLT	470	Malta 	Malta	\N
00040000-5555-9cd1-8682-598a612065db	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5555-9cd1-df61-e6859886c572	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5555-9cd1-24d3-8b09dbecb422	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5555-9cd1-c317-af519f8a8e68	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5555-9cd1-bd7f-90b06e36ade1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5555-9cd1-4697-684fadcd61d3	MX	MEX	484	Mexico 	Mehika	\N
00040000-5555-9cd1-e0f5-c73524cbf84a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5555-9cd1-fb30-4a1872700731	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5555-9cd1-7373-f7a0a34d5928	MC	MCO	492	Monaco 	Monako	\N
00040000-5555-9cd1-7ea7-328ccfd5fed1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5555-9cd1-31c0-e8475ed5e4a9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5555-9cd1-ba7c-7f6bfcf41eb1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5555-9cd1-df47-95f747509ee9	MA	MAR	504	Morocco 	Maroko	\N
00040000-5555-9cd1-deaf-b87913bacc05	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5555-9cd1-573a-35d7c15f7990	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5555-9cd1-6fb3-d8841aeb3400	NA	NAM	516	Namibia 	Namibija	\N
00040000-5555-9cd1-0c2d-0ab83ec8c314	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5555-9cd1-4527-3cb80a8fe838	NP	NPL	524	Nepal 	Nepal	\N
00040000-5555-9cd1-8c12-6fee88cd1d86	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5555-9cd1-dd70-f503a87e56c4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5555-9cd1-11b6-a44484ed1b97	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5555-9cd1-bf49-aa592d4ea17f	NE	NER	562	Niger 	Niger 	\N
00040000-5555-9cd1-ab2d-b8e5f5039d29	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5555-9cd1-728c-c1c94b859608	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5555-9cd1-beb2-43dd32fdbb39	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5555-9cd1-01be-ad6f5b8e8837	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5555-9cd1-8b56-009eacd7fc2f	NO	NOR	578	Norway 	Norveška	\N
00040000-5555-9cd1-21ab-03b0651e8f7a	OM	OMN	512	Oman 	Oman	\N
00040000-5555-9cd1-5aff-86c6212f1178	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5555-9cd1-2e68-3e26ca8c94a0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5555-9cd1-345d-7e131cf04326	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5555-9cd1-0573-0f2111fa80e5	PA	PAN	591	Panama 	Panama	\N
00040000-5555-9cd1-3618-17231a38fc83	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5555-9cd1-b4e7-42fc096f187f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5555-9cd1-7849-07d0f2577fba	PE	PER	604	Peru 	Peru	\N
00040000-5555-9cd1-d408-51882e42c085	PH	PHL	608	Philippines 	Filipini	\N
00040000-5555-9cd1-c3d4-448087efa61e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5555-9cd1-5dbb-df1b8cc60835	PL	POL	616	Poland 	Poljska	\N
00040000-5555-9cd1-93bb-455687ac9588	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5555-9cd1-3047-846853fdaf8c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5555-9cd1-659e-a8a8bf1939f3	QA	QAT	634	Qatar 	Katar	\N
00040000-5555-9cd1-7551-6145efe8b0ad	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5555-9cd1-10ff-924f0131c00c	RO	ROU	642	Romania 	Romunija	\N
00040000-5555-9cd1-cb53-92ed06ae894f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5555-9cd1-8815-1406c9d4c48e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5555-9cd1-4041-405ea381e266	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5555-9cd1-047e-c4e1341a7117	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5555-9cd1-8760-a4ef6a813b5b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5555-9cd1-97a8-8a5c7f2c5395	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5555-9cd1-9fce-8ea86afdce7a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5555-9cd1-022c-66b5b12c20f7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5555-9cd1-7203-54a04d1f9b81	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5555-9cd1-96c0-acdba319c15b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5555-9cd1-8203-7162405c12eb	SM	SMR	674	San Marino 	San Marino	\N
00040000-5555-9cd1-eec9-6b055f81c04b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5555-9cd1-8658-f4a9fd9cf5f5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5555-9cd1-b42d-9b2c777fa31e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5555-9cd1-d1f9-bc38a38186dd	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5555-9cd1-6aa8-143a217aae9b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5555-9cd1-78d5-354d9ebda9fa	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5555-9cd1-fb42-4105c91a63cb	SG	SGP	702	Singapore 	Singapur	\N
00040000-5555-9cd1-2d6e-0411d14f6302	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5555-9cd1-d2c3-fa3586b08592	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5555-9cd1-7836-02e4cd64d603	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5555-9cd1-694e-2584eb4a027a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5555-9cd1-7901-9496df2b91a6	SO	SOM	706	Somalia 	Somalija	\N
00040000-5555-9cd1-4fb2-6803601cba2a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5555-9cd1-cb4b-a3a15ac9467f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5555-9cd1-2517-5902b8330971	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5555-9cd1-2030-d5380a97e832	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5555-9cd1-1e9e-75f6d55a8f58	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5555-9cd1-96a0-786c683a8acf	SD	SDN	729	Sudan 	Sudan	\N
00040000-5555-9cd1-2835-cb4f70f53bc8	SR	SUR	740	Suriname 	Surinam	\N
00040000-5555-9cd1-9b5c-0fb99cccc363	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5555-9cd1-ad80-e6546ea20986	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5555-9cd1-e88e-3fecb585ea27	SE	SWE	752	Sweden 	Švedska	\N
00040000-5555-9cd1-f393-efa93f8961a3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5555-9cd1-a482-892ce3a15dc1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5555-9cd1-38cd-8ba6715123fb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5555-9cd1-e911-dd578b6fa73e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5555-9cd1-6ae5-c7ef6263367e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5555-9cd1-05bb-272c94b7de6e	TH	THA	764	Thailand 	Tajska	\N
00040000-5555-9cd1-da78-51fb9acb6abc	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5555-9cd1-8091-51c742523f70	TG	TGO	768	Togo 	Togo	\N
00040000-5555-9cd1-ce2d-105c857a9911	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5555-9cd1-4473-2cca36ff76b4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5555-9cd1-7169-4621b597503e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5555-9cd1-e204-6324005de463	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5555-9cd1-4044-9fe3a1924d2a	TR	TUR	792	Turkey 	Turčija	\N
00040000-5555-9cd1-68d3-66bc67ea2a63	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5555-9cd1-b1eb-05160cb65ab6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5555-9cd1-c22c-f0018f8874d1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5555-9cd1-e6f4-a2d3041544bb	UG	UGA	800	Uganda 	Uganda	\N
00040000-5555-9cd1-8bac-0b8ea7d00190	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5555-9cd1-368f-fa98189dd88b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5555-9cd1-6b9d-98fcfe2723b7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5555-9cd1-6756-8d4dab47a107	US	USA	840	United States 	Združene države Amerike	\N
00040000-5555-9cd1-c435-18508af529b2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5555-9cd1-0229-5d33ad0ba0d9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5555-9cd1-089c-8f2bca228d1c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5555-9cd1-ccec-0548a5a430ad	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5555-9cd1-bb87-4d7ff8d1bc7b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5555-9cd1-ba94-4888f4cf8ed3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5555-9cd1-4a3f-cb362656f854	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5555-9cd1-212d-7429e59c520d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5555-9cd1-6cc3-bdf6565a5d62	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5555-9cd1-15e8-a662a624731c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5555-9cd1-9878-e1d32ce2f343	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5555-9cd1-ae42-b0e7c64efe47	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5555-9cd1-752c-d0898fcc5b83	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3468484)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3468309)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3468353)
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
-- TOC entry 2658 (class 0 OID 3468402)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3468427)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3468258)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5555-9cd1-6335-2ec08fefed03	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5555-9cd1-327c-bde83fef965a	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5555-9cd1-d452-1c052083a3be	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5555-9cd1-2d18-db543556c010	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5555-9cd1-cf04-2059fee0a5e8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5555-9cd1-44b1-c21fc8e224a1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5555-9cd1-2461-c0881a899ec7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5555-9cd1-cc28-26f8792bba13	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5555-9cd1-4789-3d66db988796	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5555-9cd1-6c4c-6becd365e72d	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3468166)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5555-9cd1-1239-4e6e0b8efb4a	00000000-5555-9cd1-cf04-2059fee0a5e8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5555-9cd1-d230-102ef1ac9e78	00000000-5555-9cd1-cf04-2059fee0a5e8	00010000-5555-9cd1-daa1-a61c9a1829f2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5555-9cd1-4150-c4bc68f67cb5	00000000-5555-9cd1-44b1-c21fc8e224a1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3468177)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3468228)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3468131)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5555-9cd1-e4c2-eefcf3468ab3	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5555-9cd1-9d18-d437525cfd1e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5555-9cd1-fc09-398f5fa50da5	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5555-9cd1-ca42-c61ec27e3d14	Abonma-read	Abonma - branje	f
00030000-5555-9cd1-78be-fc37fae55bb1	Abonma-write	Abonma - spreminjanje	f
00030000-5555-9cd1-8662-a183f3caa30b	Alternacija-read	Alternacija - branje	f
00030000-5555-9cd1-56cd-ae40dfeb4ff7	Alternacija-write	Alternacija - spreminjanje	f
00030000-5555-9cd1-ad2c-27161f3052f3	Arhivalija-read	Arhivalija - branje	f
00030000-5555-9cd1-4dd7-c64b9ab59d6d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5555-9cd1-8a58-7d2fbde6350a	Besedilo-read	Besedilo - branje	f
00030000-5555-9cd1-cdc9-614ff790a508	Besedilo-write	Besedilo - spreminjanje	f
00030000-5555-9cd1-3401-89447d19386b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5555-9cd1-d5d6-ca502144f823	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5555-9cd1-4346-eaa93d0241f5	Dogodek-read	Dogodek - branje	f
00030000-5555-9cd1-0413-3f578309158f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5555-9cd1-6abf-09f2d4e12133	Drzava-read	Drzava - branje	f
00030000-5555-9cd1-f425-88381621117c	Drzava-write	Drzava - spreminjanje	f
00030000-5555-9cd1-d1cc-d83e35583467	Funkcija-read	Funkcija - branje	f
00030000-5555-9cd1-575e-108872d001f3	Funkcija-write	Funkcija - spreminjanje	f
00030000-5555-9cd1-cc34-983a1d3811c6	Gostovanje-read	Gostovanje - branje	f
00030000-5555-9cd1-0c03-7018270b7a6b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5555-9cd1-c8e6-2fb8f3e39f92	Gostujoca-read	Gostujoca - branje	f
00030000-5555-9cd1-8fde-e71218e5f7e0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5555-9cd1-fe02-f513d308ab17	Kupec-read	Kupec - branje	f
00030000-5555-9cd1-9e60-4581847c68ee	Kupec-write	Kupec - spreminjanje	f
00030000-5555-9cd1-1424-1ca47f614ef7	NacinPlacina-read	NacinPlacina - branje	f
00030000-5555-9cd1-ec96-30fa80515118	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5555-9cd1-8e92-49279c3d45c6	Option-read	Option - branje	f
00030000-5555-9cd1-602f-c1e3f83e86d3	Option-write	Option - spreminjanje	f
00030000-5555-9cd1-8541-0090d3642de4	OptionValue-read	OptionValue - branje	f
00030000-5555-9cd1-ef41-d3de5b764803	OptionValue-write	OptionValue - spreminjanje	f
00030000-5555-9cd1-d3b9-337b590f32b0	Oseba-read	Oseba - branje	f
00030000-5555-9cd1-d8ce-21bccde94542	Oseba-write	Oseba - spreminjanje	f
00030000-5555-9cd1-4004-08503314d7b1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5555-9cd1-5a7b-6013a7b930e4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5555-9cd1-cdbe-154ebb8bbdcc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5555-9cd1-6d43-cdf3aadc2d10	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5555-9cd1-0e86-d447a8268e87	Pogodba-read	Pogodba - branje	f
00030000-5555-9cd1-e8da-7c255f5ffd4e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5555-9cd1-7ad6-59edd887be60	Popa-read	Popa - branje	f
00030000-5555-9cd1-0b2c-644edf870163	Popa-write	Popa - spreminjanje	f
00030000-5555-9cd1-6315-1f698eb746c3	Posta-read	Posta - branje	f
00030000-5555-9cd1-b466-72a5c6f6b01a	Posta-write	Posta - spreminjanje	f
00030000-5555-9cd1-53e1-e43ed432ebdf	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5555-9cd1-e490-2134c5703288	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5555-9cd1-724d-c5b571afb7ea	PostniNaslov-read	PostniNaslov - branje	f
00030000-5555-9cd1-1c3a-b398d78810ff	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5555-9cd1-c1a4-4655a0313d12	Predstava-read	Predstava - branje	f
00030000-5555-9cd1-ea85-67a83a48d3ae	Predstava-write	Predstava - spreminjanje	f
00030000-5555-9cd1-144d-c452f25599cd	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5555-9cd1-80ff-f74531f51458	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5555-9cd1-206a-830e99f91b65	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5555-9cd1-35bb-34610a575018	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5555-9cd1-075d-d85f9927dd39	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5555-9cd1-76a3-9b7ff1f93d41	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5555-9cd1-c8b0-186b2c600420	Prostor-read	Prostor - branje	f
00030000-5555-9cd1-3e7b-9b60bdf5c4c9	Prostor-write	Prostor - spreminjanje	f
00030000-5555-9cd1-cf52-cb566fff5192	Racun-read	Racun - branje	f
00030000-5555-9cd1-e1ab-b554d36f41b1	Racun-write	Racun - spreminjanje	f
00030000-5555-9cd1-0daa-fdd0076837b8	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5555-9cd1-347d-5452f741a35a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5555-9cd1-dfc7-e664630751e2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5555-9cd1-cb78-d0473b2b14f8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5555-9cd1-3ca2-18a4dedb3aaf	Rekvizit-read	Rekvizit - branje	f
00030000-5555-9cd1-3e04-6fee29fb7ea3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5555-9cd1-3d8e-55c5d4c40f47	Rezervacija-read	Rezervacija - branje	f
00030000-5555-9cd1-f459-30f68453e3e5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5555-9cd1-c96c-45b9a60bff21	SedezniRed-read	SedezniRed - branje	f
00030000-5555-9cd1-156e-998b3833917b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5555-9cd1-d69d-fd7bd77cfe75	Sedez-read	Sedez - branje	f
00030000-5555-9cd1-d53b-b17c5e6deb13	Sedez-write	Sedez - spreminjanje	f
00030000-5555-9cd1-33f3-5ec303b3237b	Sezona-read	Sezona - branje	f
00030000-5555-9cd1-45d3-b9d68c38af69	Sezona-write	Sezona - spreminjanje	f
00030000-5555-9cd1-b4ed-fcc6a8ea2a0f	Telefonska-read	Telefonska - branje	f
00030000-5555-9cd1-9499-8555501937ef	Telefonska-write	Telefonska - spreminjanje	f
00030000-5555-9cd1-e441-d07b14df80f7	TerminStoritve-read	TerminStoritve - branje	f
00030000-5555-9cd1-ab52-a4a477f8a1c9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5555-9cd1-f996-754a7d1a4a0c	TipFunkcije-read	TipFunkcije - branje	f
00030000-5555-9cd1-f4a1-6f5e4b147ccf	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5555-9cd1-fc48-a72018181b37	Trr-read	Trr - branje	f
00030000-5555-9cd1-88f0-afe135e884be	Trr-write	Trr - spreminjanje	f
00030000-5555-9cd1-2efa-464931affe74	Uprizoritev-read	Uprizoritev - branje	f
00030000-5555-9cd1-1a3b-cc3d9aee9fa8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5555-9cd1-49f4-1ec2a072ce6d	Vaja-read	Vaja - branje	f
00030000-5555-9cd1-6c52-1c1cb65dd8ca	Vaja-write	Vaja - spreminjanje	f
00030000-5555-9cd1-dd6c-1c6ae9b98ac8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5555-9cd1-8ae6-c1abe4d6322b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5555-9cd1-7599-248c1832499b	Zaposlitev-read	Zaposlitev - branje	f
00030000-5555-9cd1-5686-ab287355fdc8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5555-9cd1-d943-ba3fe3aab585	Zasedenost-read	Zasedenost - branje	f
00030000-5555-9cd1-43ad-6ed99187ea40	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5555-9cd1-1354-e30bdb02c78e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5555-9cd1-8f40-4d897a5097e9	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5555-9cd1-fe4e-f5b8b46309f2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5555-9cd1-abbe-d8bc43d4fde7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3468150)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5555-9cd1-47fe-d85f0bfeb83f	00030000-5555-9cd1-6abf-09f2d4e12133
00020000-5555-9cd1-3af3-0bbcd0945760	00030000-5555-9cd1-f425-88381621117c
00020000-5555-9cd1-3af3-0bbcd0945760	00030000-5555-9cd1-6abf-09f2d4e12133
\.


--
-- TOC entry 2663 (class 0 OID 3468434)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3468464)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3468579)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3468208)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3468250)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5555-9cd0-ff7b-786531d2bde1	8341	Adlešiči
00050000-5555-9cd0-235a-d04f30cfd6b2	5270	Ajdovščina
00050000-5555-9cd0-998f-727bab5e5c35	6280	Ankaran/Ancarano
00050000-5555-9cd0-a788-a5f1be92d352	9253	Apače
00050000-5555-9cd0-e218-7e9996772ff2	8253	Artiče
00050000-5555-9cd0-a98a-c29b97231247	4275	Begunje na Gorenjskem
00050000-5555-9cd0-8478-473d726c6887	1382	Begunje pri Cerknici
00050000-5555-9cd0-9a38-34c8d07b2bd6	9231	Beltinci
00050000-5555-9cd0-5463-a451246924df	2234	Benedikt
00050000-5555-9cd0-a0d5-61382e5c7133	2345	Bistrica ob Dravi
00050000-5555-9cd0-dfd3-3e2daea4dca6	3256	Bistrica ob Sotli
00050000-5555-9cd0-5133-15e8335b557e	8259	Bizeljsko
00050000-5555-9cd0-ce49-a2061db3932d	1223	Blagovica
00050000-5555-9cd0-4588-0524d8bc9b04	8283	Blanca
00050000-5555-9cd0-9e25-13096a02e76c	4260	Bled
00050000-5555-9cd0-2a71-595c300c6094	4273	Blejska Dobrava
00050000-5555-9cd0-521f-7eb7a2529e99	9265	Bodonci
00050000-5555-9cd0-7780-ed818f882658	9222	Bogojina
00050000-5555-9cd0-d77b-0af4dbc8f65e	4263	Bohinjska Bela
00050000-5555-9cd0-fa37-c8d45b1e8afe	4264	Bohinjska Bistrica
00050000-5555-9cd0-5356-5e57f5f5c259	4265	Bohinjsko jezero
00050000-5555-9cd0-4acf-06d8a97f26c7	1353	Borovnica
00050000-5555-9cd0-6b85-5d1a2574521f	8294	Boštanj
00050000-5555-9cd0-1d37-e366dbc6a59f	5230	Bovec
00050000-5555-9cd0-4f70-03d3d0636f6a	5295	Branik
00050000-5555-9cd0-4ea2-9491825c5b79	3314	Braslovče
00050000-5555-9cd0-40b0-2e07e0a9e5af	5223	Breginj
00050000-5555-9cd0-6ca8-96ce28fa7744	8280	Brestanica
00050000-5555-9cd0-1a3a-fa5d59c39928	2354	Bresternica
00050000-5555-9cd0-2e8e-b54dc1e15fd4	4243	Brezje
00050000-5555-9cd0-374a-02e6e0995d3b	1351	Brezovica pri Ljubljani
00050000-5555-9cd0-6af3-23c582ca1b38	8250	Brežice
00050000-5555-9cd0-a48d-8581a0a2e577	4210	Brnik - Aerodrom
00050000-5555-9cd0-6823-773f7e5149d5	8321	Brusnice
00050000-5555-9cd0-6b85-7c5328af2b00	3255	Buče
00050000-5555-9cd0-591a-7e037d5dd680	8276	Bučka 
00050000-5555-9cd0-44e2-f6a338df367a	9261	Cankova
00050000-5555-9cd0-e508-4b31607fc6cc	3000	Celje 
00050000-5555-9cd0-3d8a-60f22797b656	3001	Celje - poštni predali
00050000-5555-9cd0-7b1e-5f40ffe74fa5	4207	Cerklje na Gorenjskem
00050000-5555-9cd0-9393-7e7ba2f50933	8263	Cerklje ob Krki
00050000-5555-9cd0-6dd0-f534f18f851b	1380	Cerknica
00050000-5555-9cd0-32cb-204c398b3688	5282	Cerkno
00050000-5555-9cd0-327a-d1b2970a6f6b	2236	Cerkvenjak
00050000-5555-9cd0-9174-d75a4ff7dc19	2215	Ceršak
00050000-5555-9cd0-c391-0ea50deaa8d8	2326	Cirkovce
00050000-5555-9cd0-416f-cbd957e56128	2282	Cirkulane
00050000-5555-9cd0-d4e1-51469ef17061	5273	Col
00050000-5555-9cd0-456a-df083e21f9a4	8251	Čatež ob Savi
00050000-5555-9cd0-231c-45425e6218ef	1413	Čemšenik
00050000-5555-9cd0-4fc0-ab865cbf4068	5253	Čepovan
00050000-5555-9cd0-9350-ef44b9374319	9232	Črenšovci
00050000-5555-9cd0-6d85-063fe7840832	2393	Črna na Koroškem
00050000-5555-9cd0-81d4-1f8417637c9a	6275	Črni Kal
00050000-5555-9cd0-7095-585f85b09c0f	5274	Črni Vrh nad Idrijo
00050000-5555-9cd0-21e5-207f40b9c58c	5262	Črniče
00050000-5555-9cd0-cb0a-c681e7fb7b5d	8340	Črnomelj
00050000-5555-9cd0-75a9-f7e60a4cbf75	6271	Dekani
00050000-5555-9cd0-ae4d-760044a6abca	5210	Deskle
00050000-5555-9cd0-c34b-b3fe165897f2	2253	Destrnik
00050000-5555-9cd0-021d-63f9b41ea6e7	6215	Divača
00050000-5555-9cd0-aa55-e0f26708ed64	1233	Dob
00050000-5555-9cd0-d221-84991ba7e371	3224	Dobje pri Planini
00050000-5555-9cd0-f109-b82ecb6de79a	8257	Dobova
00050000-5555-9cd0-def9-26a109737d9a	1423	Dobovec
00050000-5555-9cd0-9004-dcc6286144f5	5263	Dobravlje
00050000-5555-9cd0-3f99-719c5a116962	3204	Dobrna
00050000-5555-9cd0-f94a-c63546e05280	8211	Dobrnič
00050000-5555-9cd0-5743-b316e8833dce	1356	Dobrova
00050000-5555-9cd0-a321-ce75cbfdd45f	9223	Dobrovnik/Dobronak 
00050000-5555-9cd0-4cd0-ca7ed8867a12	5212	Dobrovo v Brdih
00050000-5555-9cd0-6304-e1646c044117	1431	Dol pri Hrastniku
00050000-5555-9cd0-4541-92dd1b6baf57	1262	Dol pri Ljubljani
00050000-5555-9cd0-69f9-a8d00b0cb1a1	1273	Dole pri Litiji
00050000-5555-9cd0-0306-8c1b34f8c628	1331	Dolenja vas
00050000-5555-9cd0-807f-26806e61bc0f	8350	Dolenjske Toplice
00050000-5555-9cd0-5f17-edbf101cfed2	1230	Domžale
00050000-5555-9cd0-2615-49cae8e3c6ad	2252	Dornava
00050000-5555-9cd0-d235-5ac0f1226c4a	5294	Dornberk
00050000-5555-9cd0-bc97-e6efd3c9635b	1319	Draga
00050000-5555-9cd0-b8f2-072e08d636da	8343	Dragatuš
00050000-5555-9cd0-0d91-3ec83c98f919	3222	Dramlje
00050000-5555-9cd0-c7c6-61ac4115b5d6	2370	Dravograd
00050000-5555-9cd0-bf14-4b948af52936	4203	Duplje
00050000-5555-9cd0-c794-c828efd2b879	6221	Dutovlje
00050000-5555-9cd0-88e3-cb5052805c05	8361	Dvor
00050000-5555-9cd0-df59-3088c2abd3f9	2343	Fala
00050000-5555-9cd0-e3fd-d00daf0072e4	9208	Fokovci
00050000-5555-9cd0-4f95-d0f46fd5909e	2313	Fram
00050000-5555-9cd0-97e7-43fb1e07e833	3213	Frankolovo
00050000-5555-9cd0-ce16-17aacbd28ce9	1274	Gabrovka
00050000-5555-9cd0-c0b1-e66ae035a0d6	8254	Globoko
00050000-5555-9cd0-0001-973161c61b6c	5275	Godovič
00050000-5555-9cd0-e1c6-d105e26e7c50	4204	Golnik
00050000-5555-9cd0-4c45-62ecac7ea5c7	3303	Gomilsko
00050000-5555-9cd0-4b25-d24de16a6c3f	4224	Gorenja vas
00050000-5555-9cd0-eb71-ae28f966a8e8	3263	Gorica pri Slivnici
00050000-5555-9cd0-4459-e6b2136f0a0e	2272	Gorišnica
00050000-5555-9cd0-d04f-e41928474d30	9250	Gornja Radgona
00050000-5555-9cd0-02f3-5aaf905bdd4f	3342	Gornji Grad
00050000-5555-9cd0-9872-8a48dcd75723	4282	Gozd Martuljek
00050000-5555-9cd0-a12c-832ce269dea0	6272	Gračišče
00050000-5555-9cd0-525b-4818a872271e	9264	Grad
00050000-5555-9cd0-badc-20d27221c1f7	8332	Gradac
00050000-5555-9cd0-01dc-02fe9f33a768	1384	Grahovo
00050000-5555-9cd0-787a-23b8c2da0385	5242	Grahovo ob Bači
00050000-5555-9cd0-e589-31534d831c9f	5251	Grgar
00050000-5555-9cd0-9028-0f6ff3b85ac6	3302	Griže
00050000-5555-9cd1-1eb9-fb428e81fb04	3231	Grobelno
00050000-5555-9cd1-7e7f-f1437b2ff2ab	1290	Grosuplje
00050000-5555-9cd1-fff7-036a7e1526e7	2288	Hajdina
00050000-5555-9cd1-dfb5-15869aa6c05d	8362	Hinje
00050000-5555-9cd1-340c-2fad0564347c	2311	Hoče
00050000-5555-9cd1-80f9-3f8460e764b0	9205	Hodoš/Hodos
00050000-5555-9cd1-0ec2-3369ee0c4627	1354	Horjul
00050000-5555-9cd1-5043-a13faf755a62	1372	Hotedršica
00050000-5555-9cd1-1895-2e342463186f	1430	Hrastnik
00050000-5555-9cd1-a982-2eafffcc199f	6225	Hruševje
00050000-5555-9cd1-a990-d6f571ea17b9	4276	Hrušica
00050000-5555-9cd1-5fec-a28fed0e226f	5280	Idrija
00050000-5555-9cd1-ebb3-a469048421a9	1292	Ig
00050000-5555-9cd1-6eb3-088f3033b837	6250	Ilirska Bistrica
00050000-5555-9cd1-656b-b4f80c512f7f	6251	Ilirska Bistrica-Trnovo
00050000-5555-9cd1-27ea-197d2cdd919e	1295	Ivančna Gorica
00050000-5555-9cd1-1532-672769373da3	2259	Ivanjkovci
00050000-5555-9cd1-7e3a-ee057ea71966	1411	Izlake
00050000-5555-9cd1-759e-16fdf3f1e4b4	6310	Izola/Isola
00050000-5555-9cd1-5651-7e384e632e84	2222	Jakobski Dol
00050000-5555-9cd1-93aa-fb44ac787134	2221	Jarenina
00050000-5555-9cd1-c4a9-6fe2a45b03b9	6254	Jelšane
00050000-5555-9cd1-579f-118b4959a870	4270	Jesenice
00050000-5555-9cd1-3446-53f16c213500	8261	Jesenice na Dolenjskem
00050000-5555-9cd1-be69-7a7c6afaa164	3273	Jurklošter
00050000-5555-9cd1-d63b-93c176b6c9e4	2223	Jurovski Dol
00050000-5555-9cd1-f584-94cf37259220	2256	Juršinci
00050000-5555-9cd1-0eec-86626b7aecb1	5214	Kal nad Kanalom
00050000-5555-9cd1-19f1-37eccef4e5de	3233	Kalobje
00050000-5555-9cd1-7253-0fa89aaa8867	4246	Kamna Gorica
00050000-5555-9cd1-e2e6-649420d32575	2351	Kamnica
00050000-5555-9cd1-4406-cf523b3816d2	1241	Kamnik
00050000-5555-9cd1-daf1-2fcea20d6622	5213	Kanal
00050000-5555-9cd1-d490-9c466c22a7ca	8258	Kapele
00050000-5555-9cd1-e5d4-c0b6ac56c920	2362	Kapla
00050000-5555-9cd1-836e-45181ab0f15a	2325	Kidričevo
00050000-5555-9cd1-10c1-1ce0f4bb0f84	1412	Kisovec
00050000-5555-9cd1-4aa6-1a86a04d0cc0	6253	Knežak
00050000-5555-9cd1-fec7-3ffdf24d826e	5222	Kobarid
00050000-5555-9cd1-08bd-d0afc42cef85	9227	Kobilje
00050000-5555-9cd1-3a8e-e6804a09fddb	1330	Kočevje
00050000-5555-9cd1-3088-446c3c9de13c	1338	Kočevska Reka
00050000-5555-9cd1-6bae-e6f147215dc0	2276	Kog
00050000-5555-9cd1-c332-53cf6f6dd538	5211	Kojsko
00050000-5555-9cd1-5a4d-ff39dbe5b683	6223	Komen
00050000-5555-9cd1-8491-eb329c0dd6de	1218	Komenda
00050000-5555-9cd1-92c0-9655cb841b7c	6000	Koper/Capodistria 
00050000-5555-9cd1-9fa1-74d904599a22	6001	Koper/Capodistria - poštni predali
00050000-5555-9cd1-b45c-a07d476560ff	8282	Koprivnica
00050000-5555-9cd1-bfef-a91dd9b504e0	5296	Kostanjevica na Krasu
00050000-5555-9cd1-062c-abd41fee60ca	8311	Kostanjevica na Krki
00050000-5555-9cd1-7d01-f73552d399c4	1336	Kostel
00050000-5555-9cd1-193c-77f05d30b49d	6256	Košana
00050000-5555-9cd1-8858-46ff2fb6a6bf	2394	Kotlje
00050000-5555-9cd1-a254-4689753476e7	6240	Kozina
00050000-5555-9cd1-ee31-dba5c5e8a507	3260	Kozje
00050000-5555-9cd1-c826-24473dee8dee	4000	Kranj 
00050000-5555-9cd1-a2b6-f04130844aac	4001	Kranj - poštni predali
00050000-5555-9cd1-0b91-556b92da766d	4280	Kranjska Gora
00050000-5555-9cd1-573f-c27d4b9ff03f	1281	Kresnice
00050000-5555-9cd1-a4ea-79e9767041d1	4294	Križe
00050000-5555-9cd1-d8bf-c38740731190	9206	Križevci
00050000-5555-9cd1-c70d-12a7e0647bee	9242	Križevci pri Ljutomeru
00050000-5555-9cd1-00a2-04f5fb0f77cf	1301	Krka
00050000-5555-9cd1-d608-05a161670490	8296	Krmelj
00050000-5555-9cd1-c038-183e0f6d598d	4245	Kropa
00050000-5555-9cd1-3151-19488cd358af	8262	Krška vas
00050000-5555-9cd1-cbfc-fd85ebe0c718	8270	Krško
00050000-5555-9cd1-a0ee-668a63208f31	9263	Kuzma
00050000-5555-9cd1-9ce9-c6136e4113fd	2318	Laporje
00050000-5555-9cd1-7bb6-9bb1d2c3607c	3270	Laško
00050000-5555-9cd1-67f7-382014468028	1219	Laze v Tuhinju
00050000-5555-9cd1-dd7b-8911f7d38c06	2230	Lenart v Slovenskih goricah
00050000-5555-9cd1-53e8-d922540a7fda	9220	Lendava/Lendva
00050000-5555-9cd1-0187-56d35819a708	4248	Lesce
00050000-5555-9cd1-124d-7b542f8ccc8a	3261	Lesično
00050000-5555-9cd1-9fe7-baf89582e54f	8273	Leskovec pri Krškem
00050000-5555-9cd1-c882-cff7c0c86aeb	2372	Libeliče
00050000-5555-9cd1-e1ec-cee5d08dda1a	2341	Limbuš
00050000-5555-9cd1-decb-8d0331f1e1ab	1270	Litija
00050000-5555-9cd1-4213-7b44b890ca1b	3202	Ljubečna
00050000-5555-9cd1-7962-9ff556484d03	1000	Ljubljana 
00050000-5555-9cd1-06b0-9c64a3991316	1001	Ljubljana - poštni predali
00050000-5555-9cd1-85e2-d7ad7eb03dd2	1231	Ljubljana - Črnuče
00050000-5555-9cd1-3875-8290185a3748	1261	Ljubljana - Dobrunje
00050000-5555-9cd1-a5de-f23b404711d6	1260	Ljubljana - Polje
00050000-5555-9cd1-f530-881e01de77a0	1210	Ljubljana - Šentvid
00050000-5555-9cd1-6c3d-367696f191b3	1211	Ljubljana - Šmartno
00050000-5555-9cd1-03c8-c6a049168627	3333	Ljubno ob Savinji
00050000-5555-9cd1-fa9d-ea3d85643ba7	9240	Ljutomer
00050000-5555-9cd1-1446-a20ed4d02b4c	3215	Loče
00050000-5555-9cd1-f214-7acedb24ee02	5231	Log pod Mangartom
00050000-5555-9cd1-0f35-463710c94e50	1358	Log pri Brezovici
00050000-5555-9cd1-53eb-cb04f255d46d	1370	Logatec
00050000-5555-9cd1-aa2b-f926715c2b12	1371	Logatec
00050000-5555-9cd1-e08a-836a37e3eb22	1434	Loka pri Zidanem Mostu
00050000-5555-9cd1-2fb4-e0dedee7da62	3223	Loka pri Žusmu
00050000-5555-9cd1-5b95-b01771d6eaee	6219	Lokev
00050000-5555-9cd1-1684-a2833e256216	1318	Loški Potok
00050000-5555-9cd1-4459-9108bc6467aa	2324	Lovrenc na Dravskem polju
00050000-5555-9cd1-010c-cd36eb6afd32	2344	Lovrenc na Pohorju
00050000-5555-9cd1-fce7-66ec7bb0dd49	3334	Luče
00050000-5555-9cd1-7d77-471280aa3ee4	1225	Lukovica
00050000-5555-9cd1-c48d-c00249702958	9202	Mačkovci
00050000-5555-9cd1-4980-06dcd14f7ba7	2322	Majšperk
00050000-5555-9cd1-ecc2-2e700557ddd0	2321	Makole
00050000-5555-9cd1-1fdf-8ebef5c4bb70	9243	Mala Nedelja
00050000-5555-9cd1-1bda-3a6f8789e7ed	2229	Malečnik
00050000-5555-9cd1-da29-37c2bf64eb4e	6273	Marezige
00050000-5555-9cd1-6ad5-f51f9460efaf	2000	Maribor 
00050000-5555-9cd1-ad65-3fa0a2f7c030	2001	Maribor - poštni predali
00050000-5555-9cd1-753d-933875a8bfed	2206	Marjeta na Dravskem polju
00050000-5555-9cd1-cb44-a11fa04ed39d	2281	Markovci
00050000-5555-9cd1-f441-ab1950540986	9221	Martjanci
00050000-5555-9cd1-0857-84c75859ba7f	6242	Materija
00050000-5555-9cd1-6828-1668cee82129	4211	Mavčiče
00050000-5555-9cd1-b2fd-a391173df105	1215	Medvode
00050000-5555-9cd1-93d0-675d356e4fb9	1234	Mengeš
00050000-5555-9cd1-ad59-ba1df9fa0623	8330	Metlika
00050000-5555-9cd1-86d4-a36731895770	2392	Mežica
00050000-5555-9cd1-197f-a62d0e33fb3f	2204	Miklavž na Dravskem polju
00050000-5555-9cd1-edf4-d4a2ed66c4e4	2275	Miklavž pri Ormožu
00050000-5555-9cd1-770f-e8cbf553fb97	5291	Miren
00050000-5555-9cd1-a512-3642775b1935	8233	Mirna
00050000-5555-9cd1-375e-a39eecb4ff9e	8216	Mirna Peč
00050000-5555-9cd1-ee4e-0069c1cab0e4	2382	Mislinja
00050000-5555-9cd1-c2a4-af7f5b325178	4281	Mojstrana
00050000-5555-9cd1-e362-1bd3c59958fd	8230	Mokronog
00050000-5555-9cd1-717a-f54e24cee8c0	1251	Moravče
00050000-5555-9cd1-27dd-a5560c87f58b	9226	Moravske Toplice
00050000-5555-9cd1-c463-24f40a062e4c	5216	Most na Soči
00050000-5555-9cd1-a989-1f8e221ff57b	1221	Motnik
00050000-5555-9cd1-ba52-818f0197fa3c	3330	Mozirje
00050000-5555-9cd1-cc4e-acc1c3dbe98a	9000	Murska Sobota 
00050000-5555-9cd1-34c6-4c04a8294c3d	9001	Murska Sobota - poštni predali
00050000-5555-9cd1-8462-5207cb20cfe6	2366	Muta
00050000-5555-9cd1-8efc-382d7f666f2b	4202	Naklo
00050000-5555-9cd1-e809-3793c48d9619	3331	Nazarje
00050000-5555-9cd1-1f34-2b98a26c19b0	1357	Notranje Gorice
00050000-5555-9cd1-1ef4-75d96315ac87	3203	Nova Cerkev
00050000-5555-9cd1-b913-a7776cf6e7e1	5000	Nova Gorica 
00050000-5555-9cd1-2a6a-c70ba0a3186f	5001	Nova Gorica - poštni predali
00050000-5555-9cd1-2371-c13f376aaedc	1385	Nova vas
00050000-5555-9cd1-47d7-ab6e485ca49d	8000	Novo mesto
00050000-5555-9cd1-0860-6eb07e655efd	8001	Novo mesto - poštni predali
00050000-5555-9cd1-4fd1-d6f6d3df91ff	6243	Obrov
00050000-5555-9cd1-09f8-b15852c41c89	9233	Odranci
00050000-5555-9cd1-f3b9-8129b4e41917	2317	Oplotnica
00050000-5555-9cd1-8eb5-040ba0627288	2312	Orehova vas
00050000-5555-9cd1-73a4-790ec50936a1	2270	Ormož
00050000-5555-9cd1-c22f-b97ae820f90e	1316	Ortnek
00050000-5555-9cd1-9d92-09387cc7f69f	1337	Osilnica
00050000-5555-9cd1-4ba0-e8d0b9c39c12	8222	Otočec
00050000-5555-9cd1-0d31-77e286f033a5	2361	Ožbalt
00050000-5555-9cd1-7b55-f1ce4ddbac41	2231	Pernica
00050000-5555-9cd1-ae95-0c1a3d06f910	2211	Pesnica pri Mariboru
00050000-5555-9cd1-7b1f-daf56165c085	9203	Petrovci
00050000-5555-9cd1-b665-07c4638c76eb	3301	Petrovče
00050000-5555-9cd1-ab07-a4acf6e8d0ae	6330	Piran/Pirano
00050000-5555-9cd1-90c2-7a8eae3fc791	8255	Pišece
00050000-5555-9cd1-f124-0defb250d926	6257	Pivka
00050000-5555-9cd1-cd80-4b464e12e26d	6232	Planina
00050000-5555-9cd1-d078-f80062ddcc20	3225	Planina pri Sevnici
00050000-5555-9cd1-42eb-4c93b7dc8738	6276	Pobegi
00050000-5555-9cd1-5700-eaa70b4ab051	8312	Podbočje
00050000-5555-9cd1-eb98-68c73c4d17eb	5243	Podbrdo
00050000-5555-9cd1-fbc4-b1b2a179e7e8	3254	Podčetrtek
00050000-5555-9cd1-4c72-b1747dc0c131	2273	Podgorci
00050000-5555-9cd1-cfe5-32a598f39c21	6216	Podgorje
00050000-5555-9cd1-ea09-5e9de81cab6f	2381	Podgorje pri Slovenj Gradcu
00050000-5555-9cd1-b95a-512ac2bcbbb0	6244	Podgrad
00050000-5555-9cd1-73f2-01377139bdae	1414	Podkum
00050000-5555-9cd1-1070-a78bdcc87641	2286	Podlehnik
00050000-5555-9cd1-0e88-9c437afc01d9	5272	Podnanos
00050000-5555-9cd1-75dd-5c9449b9ec41	4244	Podnart
00050000-5555-9cd1-439e-fa82cd5f1886	3241	Podplat
00050000-5555-9cd1-099b-9f39e4e71c3c	3257	Podsreda
00050000-5555-9cd1-849e-ac62205b9434	2363	Podvelka
00050000-5555-9cd1-2f1d-875f34a49b07	2208	Pohorje
00050000-5555-9cd1-53da-93d730ea9db8	2257	Polenšak
00050000-5555-9cd1-023f-432c2575dbd3	1355	Polhov Gradec
00050000-5555-9cd1-27b5-773d79cd1933	4223	Poljane nad Škofjo Loko
00050000-5555-9cd1-3614-2dd29a55bb22	2319	Poljčane
00050000-5555-9cd1-e8cd-bfe92ebc0d92	1272	Polšnik
00050000-5555-9cd1-4bc8-ef4c2daa80e3	3313	Polzela
00050000-5555-9cd1-3526-58c3887e5a1b	3232	Ponikva
00050000-5555-9cd1-2f6f-6523d05398ae	6320	Portorož/Portorose
00050000-5555-9cd1-b102-1c5e33985839	6230	Postojna
00050000-5555-9cd1-291f-4e4dddb57310	2331	Pragersko
00050000-5555-9cd1-1c54-ca7fe75ad736	3312	Prebold
00050000-5555-9cd1-449d-cfe5306261bd	4205	Preddvor
00050000-5555-9cd1-c379-e3654503bc00	6255	Prem
00050000-5555-9cd1-d734-ab5858acbc32	1352	Preserje
00050000-5555-9cd1-1752-7a68996240da	6258	Prestranek
00050000-5555-9cd1-8811-4f3c996844d7	2391	Prevalje
00050000-5555-9cd1-5369-fa8ee17fac21	3262	Prevorje
00050000-5555-9cd1-2d1f-35d31b194a6e	1276	Primskovo 
00050000-5555-9cd1-19e1-85ef65b3ca64	3253	Pristava pri Mestinju
00050000-5555-9cd1-76e4-2913923806dd	9207	Prosenjakovci/Partosfalva
00050000-5555-9cd1-c1c0-85d7f93ef4cb	5297	Prvačina
00050000-5555-9cd1-daaf-d125273d163f	2250	Ptuj
00050000-5555-9cd1-6bc0-41e80df15214	2323	Ptujska Gora
00050000-5555-9cd1-260d-0a0c4f5c0535	9201	Puconci
00050000-5555-9cd1-a4d7-196beac7fa6a	2327	Rače
00050000-5555-9cd1-9308-28915838dea7	1433	Radeče
00050000-5555-9cd1-1482-fc8f25c55f31	9252	Radenci
00050000-5555-9cd1-5ac3-e8d49beaf62d	2360	Radlje ob Dravi
00050000-5555-9cd1-6628-6ff0cdb5aeb2	1235	Radomlje
00050000-5555-9cd1-103d-c3b8159005c9	4240	Radovljica
00050000-5555-9cd1-618f-4c0cfcf9331c	8274	Raka
00050000-5555-9cd1-930a-a020ad1c7eb1	1381	Rakek
00050000-5555-9cd1-b1de-a141fefab17e	4283	Rateče - Planica
00050000-5555-9cd1-0dde-0cba0185ed62	2390	Ravne na Koroškem
00050000-5555-9cd1-6ad3-1d6810863ba2	9246	Razkrižje
00050000-5555-9cd1-856b-dcdeb6b7854c	3332	Rečica ob Savinji
00050000-5555-9cd1-d67e-6796ff523abf	5292	Renče
00050000-5555-9cd1-660c-3479a7a507ed	1310	Ribnica
00050000-5555-9cd1-9a30-f463c27677d9	2364	Ribnica na Pohorju
00050000-5555-9cd1-1dca-2ed0654ec363	3272	Rimske Toplice
00050000-5555-9cd1-dc34-41fa297ddae7	1314	Rob
00050000-5555-9cd1-ec6c-5a9477d886a1	5215	Ročinj
00050000-5555-9cd1-d600-2de191923ef9	3250	Rogaška Slatina
00050000-5555-9cd1-0398-74e9cfa42755	9262	Rogašovci
00050000-5555-9cd1-a642-fc644e0d586b	3252	Rogatec
00050000-5555-9cd1-d812-22748c2f853e	1373	Rovte
00050000-5555-9cd1-f11f-f26192820592	2342	Ruše
00050000-5555-9cd1-8737-ab2d4afde233	1282	Sava
00050000-5555-9cd1-fce6-a9b0db98c991	6333	Sečovlje/Sicciole
00050000-5555-9cd1-b767-e572e6b7c200	4227	Selca
00050000-5555-9cd1-fc81-f8950075608d	2352	Selnica ob Dravi
00050000-5555-9cd1-edb6-1c2a9859bf62	8333	Semič
00050000-5555-9cd1-a795-80df4e19ce68	8281	Senovo
00050000-5555-9cd1-6f73-c441df1a7ca5	6224	Senožeče
00050000-5555-9cd1-9201-6392df090383	8290	Sevnica
00050000-5555-9cd1-44bc-92ee101cc075	6210	Sežana
00050000-5555-9cd1-2cca-a3e30ac94b07	2214	Sladki Vrh
00050000-5555-9cd1-10ad-42d65bb73f85	5283	Slap ob Idrijci
00050000-5555-9cd1-1729-04e34db11640	2380	Slovenj Gradec
00050000-5555-9cd1-7d85-fe2f2b814821	2310	Slovenska Bistrica
00050000-5555-9cd1-4737-c74560074928	3210	Slovenske Konjice
00050000-5555-9cd1-f888-838749e5830d	1216	Smlednik
00050000-5555-9cd1-e369-100eb0613f6c	5232	Soča
00050000-5555-9cd1-dc0d-8d99d12aa8e2	1317	Sodražica
00050000-5555-9cd1-56af-134ff56116e0	3335	Solčava
00050000-5555-9cd1-b0ab-192d0bd0dcb4	5250	Solkan
00050000-5555-9cd1-adf0-98a914b22a00	4229	Sorica
00050000-5555-9cd1-b7c5-723885c24cad	4225	Sovodenj
00050000-5555-9cd1-f514-9adb872e81be	5281	Spodnja Idrija
00050000-5555-9cd1-f497-2ad468daa14f	2241	Spodnji Duplek
00050000-5555-9cd1-303c-f62abb7f4aa3	9245	Spodnji Ivanjci
00050000-5555-9cd1-f0da-716d6a649aa8	2277	Središče ob Dravi
00050000-5555-9cd1-acf3-216260a34b16	4267	Srednja vas v Bohinju
00050000-5555-9cd1-ddee-2d47aa0adbc9	8256	Sromlje 
00050000-5555-9cd1-5989-ec41295cbb9e	5224	Srpenica
00050000-5555-9cd1-a953-42063cae505a	1242	Stahovica
00050000-5555-9cd1-dc8d-e41c4eb4e555	1332	Stara Cerkev
00050000-5555-9cd1-945d-30ec025ae112	8342	Stari trg ob Kolpi
00050000-5555-9cd1-3dd2-60cf66cc42ef	1386	Stari trg pri Ložu
00050000-5555-9cd1-5c41-df533aa021c0	2205	Starše
00050000-5555-9cd1-55f1-0a25a2e2ac86	2289	Stoperce
00050000-5555-9cd1-01fc-1002c788c5b3	8322	Stopiče
00050000-5555-9cd1-e08b-94d9c570b59f	3206	Stranice
00050000-5555-9cd1-43a5-eac37b50ebd7	8351	Straža
00050000-5555-9cd1-07ea-35a1400d3928	1313	Struge
00050000-5555-9cd1-bc59-002f7396a867	8293	Studenec
00050000-5555-9cd1-7959-d899584c787f	8331	Suhor
00050000-5555-9cd1-3095-c4ddf15a67d6	2233	Sv. Ana v Slovenskih goricah
00050000-5555-9cd1-da09-30bd8469509c	2235	Sv. Trojica v Slovenskih goricah
00050000-5555-9cd1-604a-6e5d14443006	2353	Sveti Duh na Ostrem Vrhu
00050000-5555-9cd1-6872-f4a517f67e8b	9244	Sveti Jurij ob Ščavnici
00050000-5555-9cd1-930b-6d29d0392cb2	3264	Sveti Štefan
00050000-5555-9cd1-7206-43831d6d4c4b	2258	Sveti Tomaž
00050000-5555-9cd1-4be2-c074337d83f7	9204	Šalovci
00050000-5555-9cd1-6682-dc6bd9313964	5261	Šempas
00050000-5555-9cd1-5770-5f3de66a47e7	5290	Šempeter pri Gorici
00050000-5555-9cd1-7d6b-4b78692d4715	3311	Šempeter v Savinjski dolini
00050000-5555-9cd1-0da9-c8f34eeb275c	4208	Šenčur
00050000-5555-9cd1-bbeb-d8d23cd3467f	2212	Šentilj v Slovenskih goricah
00050000-5555-9cd1-1ed9-f5d3d7ad83c3	8297	Šentjanž
00050000-5555-9cd1-adb6-dc62d0579d17	2373	Šentjanž pri Dravogradu
00050000-5555-9cd1-cfe1-fb48915555b2	8310	Šentjernej
00050000-5555-9cd1-8181-69c564941bf6	3230	Šentjur
00050000-5555-9cd1-6596-6bd3dabdccc5	3271	Šentrupert
00050000-5555-9cd1-49fd-6b556158ad78	8232	Šentrupert
00050000-5555-9cd1-ea28-06bc02d53e33	1296	Šentvid pri Stični
00050000-5555-9cd1-3ed3-f221bb468c80	8275	Škocjan
00050000-5555-9cd1-2334-c88797a40824	6281	Škofije
00050000-5555-9cd1-7fbf-08d8a92fe022	4220	Škofja Loka
00050000-5555-9cd1-bc08-00acdf60db45	3211	Škofja vas
00050000-5555-9cd1-112f-603413e7e075	1291	Škofljica
00050000-5555-9cd1-4cda-cd5435859a26	6274	Šmarje
00050000-5555-9cd1-1505-9c388529ca8a	1293	Šmarje - Sap
00050000-5555-9cd1-6c4a-e9611ca7657d	3240	Šmarje pri Jelšah
00050000-5555-9cd1-fb9b-682e11fd8189	8220	Šmarješke Toplice
00050000-5555-9cd1-5598-aa35cb89ff14	2315	Šmartno na Pohorju
00050000-5555-9cd1-b144-9d65e94ed58c	3341	Šmartno ob Dreti
00050000-5555-9cd1-cb41-a7745f942196	3327	Šmartno ob Paki
00050000-5555-9cd1-2dc4-5e696032d0cf	1275	Šmartno pri Litiji
00050000-5555-9cd1-9930-709ee2e0a904	2383	Šmartno pri Slovenj Gradcu
00050000-5555-9cd1-13be-753dab321c09	3201	Šmartno v Rožni dolini
00050000-5555-9cd1-0a5b-dc3706c98112	3325	Šoštanj
00050000-5555-9cd1-30f8-2bb55abe59b5	6222	Štanjel
00050000-5555-9cd1-beac-7e069785b403	3220	Štore
00050000-5555-9cd1-b0bb-13711a6c7418	3304	Tabor
00050000-5555-9cd1-d816-0cecb3c4164d	3221	Teharje
00050000-5555-9cd1-6fed-37d4cc05c0a6	9251	Tišina
00050000-5555-9cd1-f765-9f0d7fb4f978	5220	Tolmin
00050000-5555-9cd1-b04f-3f60b22a1c9d	3326	Topolšica
00050000-5555-9cd1-32d3-b8da39e50086	2371	Trbonje
00050000-5555-9cd1-6d09-9a6f994c393b	1420	Trbovlje
00050000-5555-9cd1-287f-8f8ea196420c	8231	Trebelno 
00050000-5555-9cd1-970d-94fff602b013	8210	Trebnje
00050000-5555-9cd1-c558-6ff5ad0a5df0	5252	Trnovo pri Gorici
00050000-5555-9cd1-7bc6-deef24459428	2254	Trnovska vas
00050000-5555-9cd1-3522-6fd774dddc18	1222	Trojane
00050000-5555-9cd1-a874-1b4aeb80fbf4	1236	Trzin
00050000-5555-9cd1-2d5d-0bb8125a1101	4290	Tržič
00050000-5555-9cd1-feb0-cc9c8df16758	8295	Tržišče
00050000-5555-9cd1-4376-c4dddf5a0ab3	1311	Turjak
00050000-5555-9cd1-e9ce-30046e428235	9224	Turnišče
00050000-5555-9cd1-1bf0-0e7ec07aa7fd	8323	Uršna sela
00050000-5555-9cd1-fba9-812667eadc48	1252	Vače
00050000-5555-9cd1-e8f4-308fae92612a	3320	Velenje 
00050000-5555-9cd1-e05e-a00fba4723d8	3322	Velenje - poštni predali
00050000-5555-9cd1-6766-184c6fbc1dd8	8212	Velika Loka
00050000-5555-9cd1-fc28-b3228887ca46	2274	Velika Nedelja
00050000-5555-9cd1-5325-37893bce737d	9225	Velika Polana
00050000-5555-9cd1-1f0e-cb42cdb2319b	1315	Velike Lašče
00050000-5555-9cd1-b819-b475c9de42e3	8213	Veliki Gaber
00050000-5555-9cd1-07fc-7ebafc00d0f2	9241	Veržej
00050000-5555-9cd1-65f1-de667b31bc28	1312	Videm - Dobrepolje
00050000-5555-9cd1-fb60-816528251987	2284	Videm pri Ptuju
00050000-5555-9cd1-9be0-a6f3344b48d1	8344	Vinica
00050000-5555-9cd1-1f24-28204434c6ae	5271	Vipava
00050000-5555-9cd1-a470-3c066737bf62	4212	Visoko
00050000-5555-9cd1-0524-6ce6fd1e40b8	1294	Višnja Gora
00050000-5555-9cd1-a348-cf303521b4f0	3205	Vitanje
00050000-5555-9cd1-49dd-58672a29031d	2255	Vitomarci
00050000-5555-9cd1-1ffe-915c821865e6	1217	Vodice
00050000-5555-9cd1-671e-278573550104	3212	Vojnik\t
00050000-5555-9cd1-9c1a-6d18648587ce	5293	Volčja Draga
00050000-5555-9cd1-55c8-36051a4fb626	2232	Voličina
00050000-5555-9cd1-0385-e1db7e64dcf2	3305	Vransko
00050000-5555-9cd1-c523-b22733a82622	6217	Vremski Britof
00050000-5555-9cd1-1b43-3ff95615811b	1360	Vrhnika
00050000-5555-9cd1-55b4-5b1a3630af74	2365	Vuhred
00050000-5555-9cd1-1391-ae447f19fea1	2367	Vuzenica
00050000-5555-9cd1-4c28-e775ec08e991	8292	Zabukovje 
00050000-5555-9cd1-7890-07180dea3e37	1410	Zagorje ob Savi
00050000-5555-9cd1-e2e0-72d4c77a56aa	1303	Zagradec
00050000-5555-9cd1-6ce3-ba46ba7f0db3	2283	Zavrč
00050000-5555-9cd1-0b99-e25c75456abd	8272	Zdole 
00050000-5555-9cd1-d90b-956da56f7ad8	4201	Zgornja Besnica
00050000-5555-9cd1-327f-56c7f0ea335f	2242	Zgornja Korena
00050000-5555-9cd1-daa0-7d9cd62f4625	2201	Zgornja Kungota
00050000-5555-9cd1-e5d7-cb86eaab5537	2316	Zgornja Ložnica
00050000-5555-9cd1-2783-797a987b2fa7	2314	Zgornja Polskava
00050000-5555-9cd1-16a1-697d1142aae7	2213	Zgornja Velka
00050000-5555-9cd1-e34b-352f256c0d5c	4247	Zgornje Gorje
00050000-5555-9cd1-4949-af21898bed5e	4206	Zgornje Jezersko
00050000-5555-9cd1-a74b-d6c9b3c71178	2285	Zgornji Leskovec
00050000-5555-9cd1-fe16-abc091f97dcd	1432	Zidani Most
00050000-5555-9cd1-bb51-24371950cfec	3214	Zreče
00050000-5555-9cd1-69d5-c2b427b7dfea	4209	Žabnica
00050000-5555-9cd1-98e7-8dd1f9b15a19	3310	Žalec
00050000-5555-9cd1-fca0-55f1740eebc2	4228	Železniki
00050000-5555-9cd1-f14a-f0232f95ae21	2287	Žetale
00050000-5555-9cd1-8f39-8cac9f301432	4226	Žiri
00050000-5555-9cd1-edf3-25da3d7c7323	4274	Žirovnica
00050000-5555-9cd1-e173-b6983bce4d71	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3468408)
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
-- TOC entry 2642 (class 0 OID 3468235)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3468301)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3468420)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3468525)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3468572)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3468449)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3468393)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3468383)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3468562)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3468515)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3468102)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5555-9cd1-daa1-a61c9a1829f2	00010000-5555-9cd1-9e4b-35cb898c6fd4	2015-05-15 09:14:26	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO7tAiFPFj//PJza5FlUbnZRH/.PaGrYm";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3468458)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3468140)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5555-9cd1-823a-324ebb7c5c3a	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5555-9cd1-717b-84efb924bda4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5555-9cd1-47fe-d85f0bfeb83f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5555-9cd1-694c-bbef68bb207e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5555-9cd1-1050-f3a27181c5fc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5555-9cd1-3af3-0bbcd0945760	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3468124)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5555-9cd1-daa1-a61c9a1829f2	00020000-5555-9cd1-694c-bbef68bb207e
00010000-5555-9cd1-9e4b-35cb898c6fd4	00020000-5555-9cd1-694c-bbef68bb207e
\.


--
-- TOC entry 2668 (class 0 OID 3468472)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3468414)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3468364)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3468200)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3468370)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3468550)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3468270)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3468111)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5555-9cd1-9e4b-35cb898c6fd4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROseMH/BQOREQLDjwBAFunmK6GUbLJjVe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5555-9cd1-daa1-a61c9a1829f2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3468604)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3468316)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3468441)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3468507)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3468348)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3468594)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3468497)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3468165)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3468644)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3468637)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3468549)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3468338)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3468363)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3468296)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3468493)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3468314)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3468357)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2249 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 3468406)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3468433)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3468268)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3468174)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3468232)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3468198)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3468154)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3468139)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3468439)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3468471)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3468589)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3468225)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3468256)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3468412)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 3468246)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3468305)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3468424)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3468531)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3468577)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3468456)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3468397)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3468388)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3468571)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3468522)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3468110)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3468462)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3468128)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3468148)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3468480)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3468419)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3468369)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3468205)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3468379)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3468561)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3468281)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3468123)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3468619)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3468323)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3468447)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3468513)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3468352)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3468603)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3468506)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3468345)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3468227)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2251 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2252 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2253 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2377 (class 1259 OID 3468440)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3468426)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3468425)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3468324)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3468496)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3468494)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3468495)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3468591)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3468592)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3468593)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3468622)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3468621)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3468620)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3468283)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3468282)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3468234)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3468233)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3468463)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3468358)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3468155)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3468156)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3468483)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3468482)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3468481)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3468306)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3468308)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3468307)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3468392)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3468390)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3468389)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3468391)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3468129)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3468130)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3468448)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3468413)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3468523)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3468524)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3468248)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3468247)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2296 (class 1259 OID 3468249)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3468532)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3468533)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3468647)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3468646)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3468649)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3468645)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3468648)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3468514)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3468401)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3468400)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3468398)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3468399)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3468639)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3468638)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3468315)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3468176)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3468175)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3468206)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3468207)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3468382)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3468381)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3468380)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3468347)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3468343)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3468340)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3468341)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3468339)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3468344)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3468342)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3468226)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3468297)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3468299)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3468298)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3468300)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3468407)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3468590)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3468199)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3468269)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3468457)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3468257)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3468578)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3468149)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3468346)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2473 (class 2606 OID 3468780)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 3468765)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2471 (class 2606 OID 3468770)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2475 (class 2606 OID 3468790)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2469 (class 2606 OID 3468760)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3468785)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3468775)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3468695)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3468875)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3468870)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2490 (class 2606 OID 3468865)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3468755)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 3468915)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2498 (class 2606 OID 3468905)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3468910)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3468855)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3468950)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3468955)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3468960)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2512 (class 2606 OID 3468975)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3468970)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2510 (class 2606 OID 3468965)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 3468730)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3468725)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 3468705)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 3468700)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3468680)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3468885)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3468795)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2449 (class 2606 OID 3468660)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 3468665)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2497 (class 2606 OID 3468900)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3468895)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2495 (class 2606 OID 3468890)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2464 (class 2606 OID 3468735)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 3468745)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3468740)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2483 (class 2606 OID 3468830)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2481 (class 2606 OID 3468820)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2480 (class 2606 OID 3468815)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 3468825)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2447 (class 2606 OID 3468650)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 3468655)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3468880)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3468860)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2502 (class 2606 OID 3468925)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 3468930)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3468715)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 3468710)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3468720)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2504 (class 2606 OID 3468935)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 3468940)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3469000)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 3468995)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3469010)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 3468990)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2518 (class 2606 OID 3469005)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3468920)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2487 (class 2606 OID 3468850)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 3468845)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2484 (class 2606 OID 3468835)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2485 (class 2606 OID 3468840)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 3468985)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2513 (class 2606 OID 3468980)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3468750)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3468945)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 3468675)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3468670)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2454 (class 2606 OID 3468685)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 3468690)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2479 (class 2606 OID 3468810)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3468805)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2477 (class 2606 OID 3468800)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-15 09:14:26 CEST

--
-- PostgreSQL database dump complete
--

