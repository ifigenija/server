--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-18 14:21:50 CEST

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
-- TOC entry 179 (class 1259 OID 3777705)
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
-- TOC entry 225 (class 1259 OID 3778188)
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
-- TOC entry 224 (class 1259 OID 3778171)
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
-- TOC entry 217 (class 1259 OID 3778082)
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
-- TOC entry 193 (class 1259 OID 3777873)
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
-- TOC entry 196 (class 1259 OID 3777907)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3777832)
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
-- TOC entry 212 (class 1259 OID 3778032)
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
-- TOC entry 191 (class 1259 OID 3777857)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3777901)
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
-- TOC entry 201 (class 1259 OID 3777950)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3777975)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3777806)
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
-- TOC entry 180 (class 1259 OID 3777714)
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
-- TOC entry 181 (class 1259 OID 3777725)
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
-- TOC entry 184 (class 1259 OID 3777776)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3777679)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3777698)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3777982)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3778012)
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
-- TOC entry 221 (class 1259 OID 3778127)
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
-- TOC entry 183 (class 1259 OID 3777756)
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
-- TOC entry 186 (class 1259 OID 3777798)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3777956)
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
-- TOC entry 185 (class 1259 OID 3777783)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    popa_id uuid,
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
-- TOC entry 190 (class 1259 OID 3777849)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3777968)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3778073)
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
-- TOC entry 220 (class 1259 OID 3778120)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3777997)
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
-- TOC entry 200 (class 1259 OID 3777941)
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
-- TOC entry 199 (class 1259 OID 3777931)
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
-- TOC entry 219 (class 1259 OID 3778110)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3778063)
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
-- TOC entry 173 (class 1259 OID 3777650)
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
-- TOC entry 172 (class 1259 OID 3777648)
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
-- TOC entry 209 (class 1259 OID 3778006)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3777688)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3777672)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3778020)
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
-- TOC entry 203 (class 1259 OID 3777962)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3777912)
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
-- TOC entry 182 (class 1259 OID 3777748)
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
-- TOC entry 198 (class 1259 OID 3777918)
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
-- TOC entry 218 (class 1259 OID 3778098)
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
-- TOC entry 188 (class 1259 OID 3777818)
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
-- TOC entry 174 (class 1259 OID 3777659)
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
-- TOC entry 223 (class 1259 OID 3778152)
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
-- TOC entry 192 (class 1259 OID 3777864)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3777989)
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
-- TOC entry 214 (class 1259 OID 3778055)
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
-- TOC entry 194 (class 1259 OID 3777896)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3778142)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3778045)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3777653)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3777705)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3778188)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3778171)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3778082)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3777873)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3777907)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3777832)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5559-d95e-cfe9-9ed5bf5b27eb	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5559-d95e-c8d5-d73e2619bfd4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5559-d95e-bdbe-b34b8b4527ff	AL	ALB	008	Albania 	Albanija	\N
00040000-5559-d95e-52b7-c75a16882d01	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5559-d95e-95ba-b1faaa2d31be	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5559-d95e-ae00-be5495ecd71d	AD	AND	020	Andorra 	Andora	\N
00040000-5559-d95e-63e1-89a4e72577a5	AO	AGO	024	Angola 	Angola	\N
00040000-5559-d95e-1f2a-56345bd24d70	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5559-d95e-1011-eb1748a3e58f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5559-d95e-38b5-436d6aaa2ac0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5559-d95e-1ff3-45ee2a3fddec	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5559-d95e-1858-25053a429a5e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5559-d95e-2529-eb635182af89	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5559-d95e-feee-5c8ff3a751c3	AU	AUS	036	Australia 	Avstralija	\N
00040000-5559-d95e-2625-b0aa1cd6a477	AT	AUT	040	Austria 	Avstrija	\N
00040000-5559-d95e-f001-69883c715421	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5559-d95e-2d31-26ea10786a46	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5559-d95e-049a-a1be2c9626f3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5559-d95e-19be-1e698d8b36bc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5559-d95e-4973-6b2161fb7597	BB	BRB	052	Barbados 	Barbados	\N
00040000-5559-d95e-527f-d7b0e319d2ff	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5559-d95e-9946-850dc241da5f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5559-d95e-498a-5a6fd289bebe	BZ	BLZ	084	Belize 	Belize	\N
00040000-5559-d95e-9532-ed66f2f58182	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5559-d95e-4397-247b647b90f8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5559-d95e-f0c8-d156cc6641ae	BT	BTN	064	Bhutan 	Butan	\N
00040000-5559-d95e-c0f6-aaf10e4a2395	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5559-d95e-b07e-ee699f37090f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5559-d95e-2f2e-ff968aa7ac00	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5559-d95e-b419-af8b06c692e4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5559-d95e-7f0b-633fe64d4b49	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5559-d95e-0482-5619cf299c7d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5559-d95e-ea7b-c3f6e847de55	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5559-d95e-4b55-c6d28fe0d867	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5559-d95e-29e5-e1e61d9f2f32	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5559-d95e-b2f4-d571f9d23bf0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5559-d95e-ebbc-9d1539967f26	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5559-d95e-995c-12edfb1ed932	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5559-d95e-cce8-f4b6613308a1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5559-d95e-426e-b5175501b4bc	CA	CAN	124	Canada 	Kanada	\N
00040000-5559-d95e-86e7-70dc9510649b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5559-d95e-7a5e-c70a9c819503	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5559-d95e-f814-26fe39c9dca6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5559-d95e-b3f0-f31f44b82863	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5559-d95e-f8c1-b49f89beea4b	CL	CHL	152	Chile 	Čile	\N
00040000-5559-d95e-38c7-9c506e2a0298	CN	CHN	156	China 	Kitajska	\N
00040000-5559-d95e-32e8-b12cf7d419b5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5559-d95e-c1ce-fd599f2a7926	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5559-d95e-35fd-07e13ac16238	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5559-d95e-e213-51d6a2f7382a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5559-d95e-e6ab-a7f590d595ee	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5559-d95e-74d3-90c7926296db	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5559-d95e-4b07-cbad4570328e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5559-d95e-5b11-82209a5fa489	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5559-d95e-a1e7-814778784c74	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5559-d95e-fa5e-8441daf7954e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5559-d95e-0182-06b366252e35	CU	CUB	192	Cuba 	Kuba	\N
00040000-5559-d95e-68b3-34e3bc3cb4e5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5559-d95e-a21d-ec4b0a9786a7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5559-d95e-58de-4208eaf0102a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5559-d95e-6753-5b29b093c358	DK	DNK	208	Denmark 	Danska	\N
00040000-5559-d95e-7fd5-da992d925df2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5559-d95e-7dab-b5e937d3846d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5559-d95e-9f50-9f1c1453a4a8	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5559-d95e-719c-3e9cfbdbed50	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5559-d95e-8f4f-6947ecfb3bbe	EG	EGY	818	Egypt 	Egipt	\N
00040000-5559-d95e-8e1b-a53671183693	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5559-d95e-d9dd-12d29b7fe274	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5559-d95e-aa88-1a927b967974	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5559-d95e-46e4-880224044b1b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5559-d95e-10c6-fe05427f7a4a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5559-d95e-cb78-438558a8f574	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5559-d95e-3ef5-3362405f6762	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5559-d95e-4e35-2123fb4c2704	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5559-d95e-0ddf-1d13e23770ff	FI	FIN	246	Finland 	Finska	\N
00040000-5559-d95e-5c97-1ab50d15b329	FR	FRA	250	France 	Francija	\N
00040000-5559-d95e-1791-7ff615d3c23a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5559-d95e-d2b4-5b500c2aa999	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5559-d95e-7f1d-8bee79ba977a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5559-d95e-7af1-78828ae64552	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5559-d95e-ea9f-9b8de8d4cccb	GA	GAB	266	Gabon 	Gabon	\N
00040000-5559-d95e-caff-a1d05dc5bce0	GM	GMB	270	Gambia 	Gambija	\N
00040000-5559-d95e-2511-515e6519107d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5559-d95e-3a17-427c0512e350	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5559-d95e-c233-506e5413b203	GH	GHA	288	Ghana 	Gana	\N
00040000-5559-d95e-eb7f-8c7c45f4a75f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5559-d95e-31c9-4a4e007a87a1	GR	GRC	300	Greece 	Grčija	\N
00040000-5559-d95e-571c-27fcc4af6391	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5559-d95e-ba39-7247478bbf99	GD	GRD	308	Grenada 	Grenada	\N
00040000-5559-d95e-f170-e59121933d49	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5559-d95e-04fd-3d13d77b87c4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5559-d95e-21b5-f70a4ea54c45	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5559-d95e-d541-1f01c646b7c9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5559-d95e-7226-5750fdb36152	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5559-d95e-aa3b-2138a9c2c83b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5559-d95e-28c6-3cab5ef6a5fb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5559-d95e-2e9a-8a97b181c285	HT	HTI	332	Haiti 	Haiti	\N
00040000-5559-d95e-2954-a8560a6aac6d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5559-d95e-53d6-4bfdafdb8542	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5559-d95e-cb52-d9b2c7d920aa	HN	HND	340	Honduras 	Honduras	\N
00040000-5559-d95e-e087-41964d456b0e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5559-d95e-df85-c4c7ad2365ce	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5559-d95e-e463-b3a3201b46eb	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5559-d95e-f33a-79823769a322	IN	IND	356	India 	Indija	\N
00040000-5559-d95e-691e-ac769e5a29ab	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5559-d95e-e3ef-4eeda9d00e88	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5559-d95e-4dce-94278b5070f4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5559-d95e-62a4-ddd7e47c2bfa	IE	IRL	372	Ireland 	Irska	\N
00040000-5559-d95e-9d60-fd9f50dc6209	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5559-d95e-122a-a2c5eb2075b5	IL	ISR	376	Israel 	Izrael	\N
00040000-5559-d95e-fecf-6767e561f80b	IT	ITA	380	Italy 	Italija	\N
00040000-5559-d95e-14e9-341be363ea07	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5559-d95e-4d33-3dc207eaa167	JP	JPN	392	Japan 	Japonska	\N
00040000-5559-d95e-10de-d02ac4d0ce80	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5559-d95e-aadb-0f933cfc9115	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5559-d95e-224f-b06e76847114	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5559-d95e-6064-84962ab704af	KE	KEN	404	Kenya 	Kenija	\N
00040000-5559-d95e-7862-69d79416a716	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5559-d95e-dc1f-33962bf3a08a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5559-d95e-1d90-3ed1b371bffd	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5559-d95e-6538-6e465f036b15	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5559-d95e-2f64-0691e66e8f3d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5559-d95e-e5e6-0b2bee65ca67	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5559-d95e-901a-82b14b21130f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5559-d95e-3711-ada9a73daee1	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5559-d95e-9363-f92f8fd8ed30	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5559-d95e-fedc-51dd85f7e051	LR	LBR	430	Liberia 	Liberija	\N
00040000-5559-d95e-6ee1-ee2abc526dfa	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5559-d95e-9269-256df9b8e708	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5559-d95e-13ea-d7fb768d5c33	LT	LTU	440	Lithuania 	Litva	\N
00040000-5559-d95e-2e65-44f66f620179	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5559-d95e-7244-d749b2e0db33	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5559-d95e-36a0-f23f6420571b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5559-d95e-bead-cb79d8cb214e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5559-d95e-6b4b-428829e9d017	MW	MWI	454	Malawi 	Malavi	\N
00040000-5559-d95e-7980-0fdf30f5b025	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5559-d95e-9e12-adcd865b37a4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5559-d95e-6df6-3834093610cf	ML	MLI	466	Mali 	Mali	\N
00040000-5559-d95e-219a-1ef9d0c4ef6c	MT	MLT	470	Malta 	Malta	\N
00040000-5559-d95e-4201-922033ee259d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5559-d95e-009d-520fa77625a1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5559-d95e-9279-4f331b80abf9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5559-d95e-e209-802a89d1593c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5559-d95e-0f06-bb9aa1096e6c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5559-d95e-6346-2b2868407716	MX	MEX	484	Mexico 	Mehika	\N
00040000-5559-d95e-3a6b-69efdcaba8e6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5559-d95e-4b40-a620d96bab05	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5559-d95e-7d20-b0254346f4ea	MC	MCO	492	Monaco 	Monako	\N
00040000-5559-d95e-0b5d-87d7d1e9dc35	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5559-d95e-5741-f6b8a225d326	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5559-d95e-bc41-0685df6b3207	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5559-d95e-28e4-461b9cd7c106	MA	MAR	504	Morocco 	Maroko	\N
00040000-5559-d95e-7bec-20f0195d6020	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5559-d95e-66fd-6e7b05818937	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5559-d95e-296a-95262063b57b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5559-d95e-b6b8-62dbf38fb872	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5559-d95e-9cd0-197fc2f2d6e4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5559-d95e-2c6f-90320f740ce5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5559-d95e-5d77-a376b4eea5bd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5559-d95e-ccee-a97a1ca3aa6f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5559-d95e-c655-415a3b4b602b	NE	NER	562	Niger 	Niger 	\N
00040000-5559-d95e-df97-7a3b89ece3c1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5559-d95e-319d-2647c5c5beb2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5559-d95e-f7e8-210f766a3737	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5559-d95e-2851-d501348d3863	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5559-d95e-4843-7d4cfc8c4130	NO	NOR	578	Norway 	Norveška	\N
00040000-5559-d95e-84cc-dc91149b26d3	OM	OMN	512	Oman 	Oman	\N
00040000-5559-d95e-351f-8b2d6ebbf288	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5559-d95e-8627-72ffb4ad2968	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5559-d95e-59b6-b590ecd0947c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5559-d95e-8561-3255a735b2b2	PA	PAN	591	Panama 	Panama	\N
00040000-5559-d95e-6f0f-a2b4353e9652	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5559-d95e-a2d5-63b685349949	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5559-d95e-0ea2-5454d488c964	PE	PER	604	Peru 	Peru	\N
00040000-5559-d95e-fecb-7d6d8d73ddad	PH	PHL	608	Philippines 	Filipini	\N
00040000-5559-d95e-59a8-0de7ae3f68bb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5559-d95e-6c8e-6a7c5e0b4ea5	PL	POL	616	Poland 	Poljska	\N
00040000-5559-d95e-3a01-dd081185d292	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5559-d95e-a255-09d4e4962229	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5559-d95e-382d-9e08a1c0dc99	QA	QAT	634	Qatar 	Katar	\N
00040000-5559-d95e-84df-6db02df904c5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5559-d95e-3d4c-b49bd8569855	RO	ROU	642	Romania 	Romunija	\N
00040000-5559-d95e-78a5-5223edc67ae5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5559-d95e-ffca-6b31e930f004	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5559-d95e-cae9-7caa1d998429	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5559-d95e-11fd-daa68f4a7201	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5559-d95e-21ee-02f1fc522874	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5559-d95e-6a51-4432a0575883	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5559-d95e-6d44-6eb164a8e386	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5559-d95e-4090-8eb1ba176e58	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5559-d95e-59ce-33d91c333608	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5559-d95e-93f1-f3ff9f23f429	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5559-d95e-57de-7668ed4418a7	SM	SMR	674	San Marino 	San Marino	\N
00040000-5559-d95e-fc62-04b3163eb2b9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5559-d95e-6a45-710b9ccca8c7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5559-d95e-f5dd-c2179e859358	SN	SEN	686	Senegal 	Senegal	\N
00040000-5559-d95e-b33d-5ca1a68eb32c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5559-d95e-63b7-548edd9afa04	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5559-d95e-3943-679bdb2004f2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5559-d95e-37b6-74fa441b7296	SG	SGP	702	Singapore 	Singapur	\N
00040000-5559-d95e-0c2b-077977ce59de	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5559-d95e-cd6c-143dbd6d8c99	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5559-d95e-2081-7b2e55bc037c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5559-d95e-96db-b5c615cfd6ac	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5559-d95e-ccab-552d615d1a5e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5559-d95e-a715-e8cf6ab64db8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5559-d95e-c41c-5f2f1019b956	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5559-d95e-e326-245f0129eeb7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5559-d95e-8ef0-2c86c4be7181	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5559-d95e-73f1-929fc65e5135	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5559-d95e-abb2-0c8333c8de93	SD	SDN	729	Sudan 	Sudan	\N
00040000-5559-d95e-ea68-eaa49f520342	SR	SUR	740	Suriname 	Surinam	\N
00040000-5559-d95e-2b64-5e93abc705a2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5559-d95e-3d67-c1742b9b4773	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5559-d95e-fb2a-b4d3b7222d3a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5559-d95e-23c1-d7b60c5d8432	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5559-d95e-6837-104bd6f901dc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5559-d95e-5d84-9364204adb3e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5559-d95e-9f58-59b654cf18bc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5559-d95e-becd-7474bae36415	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5559-d95e-3a40-52a5b0afa3d3	TH	THA	764	Thailand 	Tajska	\N
00040000-5559-d95e-503e-104b22a15553	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5559-d95e-07a9-6c0de1463d1b	TG	TGO	768	Togo 	Togo	\N
00040000-5559-d95e-12b7-33e1c7dfaaf0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5559-d95e-0f55-f3801d10f8d2	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5559-d95e-a399-f08e6990da0f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5559-d95e-fc7c-e1424f6f8592	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5559-d95e-27fd-76d04fe369fc	TR	TUR	792	Turkey 	Turčija	\N
00040000-5559-d95e-15af-2cd912bd6034	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5559-d95e-f5ec-500a2ef58a14	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5559-d95e-8dc2-8804a50e36c9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5559-d95e-32b8-e714741f93d7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5559-d95e-d194-2b232f762066	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5559-d95e-6fd9-1d388b1540f2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5559-d95e-2e93-a1c39ad83ac1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5559-d95e-df12-5f18c04ec8fd	US	USA	840	United States 	Združene države Amerike	\N
00040000-5559-d95e-ca06-f2a118f46aa2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5559-d95e-1c4e-a1d2b875e122	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5559-d95e-2883-0fba8edd54af	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5559-d95e-63ce-15f0c2173e63	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5559-d95e-5d00-24a550843b18	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5559-d95e-7aad-4b1aed3be0d2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5559-d95e-600d-1c29320e481b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5559-d95e-9778-799184e1d17f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5559-d95e-fb68-ce007001e4c0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5559-d95e-c55d-2ce38371ea8e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5559-d95e-2029-927ab8a68d2c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5559-d95e-4fd4-23afab955dc5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5559-d95e-59bc-242b60aa12f4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3778032)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3777857)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3777901)
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
-- TOC entry 2658 (class 0 OID 3777950)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3777975)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3777806)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5559-d95e-f8f8-755ccf07ccae	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5559-d95e-ac0a-a5701464567e	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5559-d95e-49e8-278e114bb7d8	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5559-d95e-3b71-b9968aa5a645	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5559-d95e-e10e-7b0ed48b7ef1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5559-d95e-1909-a38808259aa7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5559-d95e-fd02-62687be5c332	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5559-d95e-77ae-8f2cddaf72b9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5559-d95e-694e-632022b1a7f0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5559-d95e-f3ea-495cdc7bb644	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3777714)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5559-d95e-f356-4889ee9f7302	00000000-5559-d95e-e10e-7b0ed48b7ef1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5559-d95e-f0b6-f0e2e13fe384	00000000-5559-d95e-e10e-7b0ed48b7ef1	00010000-5559-d95e-efc8-341070dd05c5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5559-d95e-ebba-66a8d612b027	00000000-5559-d95e-1909-a38808259aa7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3777725)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3777776)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3777679)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5559-d95e-d288-b35d996fd265	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5559-d95e-1ca9-acae226ef9cd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5559-d95e-ddbc-7a55c2605950	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5559-d95e-e9ae-7b08b60e6f0e	Abonma-read	Abonma - branje	f
00030000-5559-d95e-8b7a-767d455c12c8	Abonma-write	Abonma - spreminjanje	f
00030000-5559-d95e-53b7-c867d22ea08c	Alternacija-read	Alternacija - branje	f
00030000-5559-d95e-490e-1aaa22267b41	Alternacija-write	Alternacija - spreminjanje	f
00030000-5559-d95e-14a8-ce92da585ca2	Arhivalija-read	Arhivalija - branje	f
00030000-5559-d95e-f870-a2927a0fee74	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5559-d95e-e9c9-cd8a659414ca	Besedilo-read	Besedilo - branje	f
00030000-5559-d95e-b548-6eec7b1b92ce	Besedilo-write	Besedilo - spreminjanje	f
00030000-5559-d95e-1276-80801f73e8df	DogodekIzven-read	DogodekIzven - branje	f
00030000-5559-d95e-0004-c3a9f734266a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5559-d95e-3a0e-7f985ec5a924	Dogodek-read	Dogodek - branje	f
00030000-5559-d95e-2aa4-b34e18e5838b	Dogodek-write	Dogodek - spreminjanje	f
00030000-5559-d95e-e3f6-64772ea398ca	Drzava-read	Drzava - branje	f
00030000-5559-d95e-856f-e8eee30db82b	Drzava-write	Drzava - spreminjanje	f
00030000-5559-d95e-5823-082a62ff27ed	Funkcija-read	Funkcija - branje	f
00030000-5559-d95e-a54c-21e35ff6e971	Funkcija-write	Funkcija - spreminjanje	f
00030000-5559-d95e-1a92-84cf23d65062	Gostovanje-read	Gostovanje - branje	f
00030000-5559-d95e-0e4b-7c78c3921d7e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5559-d95e-9a18-ff41f614134c	Gostujoca-read	Gostujoca - branje	f
00030000-5559-d95e-7567-3192fcb09246	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5559-d95e-b38f-8f154848806f	Kupec-read	Kupec - branje	f
00030000-5559-d95e-03b7-31cc55037504	Kupec-write	Kupec - spreminjanje	f
00030000-5559-d95e-bac6-a234e3de0539	NacinPlacina-read	NacinPlacina - branje	f
00030000-5559-d95e-5092-6ae246f37ba7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5559-d95e-9f6f-422f70ebb94a	Option-read	Option - branje	f
00030000-5559-d95e-4979-a9e540735697	Option-write	Option - spreminjanje	f
00030000-5559-d95e-e8d3-53494fe7920c	OptionValue-read	OptionValue - branje	f
00030000-5559-d95e-8ddb-701e7e2b93c7	OptionValue-write	OptionValue - spreminjanje	f
00030000-5559-d95e-e85e-9ca50090aeb2	Oseba-read	Oseba - branje	f
00030000-5559-d95e-51b2-0d9621238912	Oseba-write	Oseba - spreminjanje	f
00030000-5559-d95e-61ac-639941ee24cd	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5559-d95e-b7cf-e0773d2e1e8d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5559-d95e-2033-f454a8878093	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5559-d95e-d269-95b4e9354036	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5559-d95e-4a8d-b1efdab992ab	Pogodba-read	Pogodba - branje	f
00030000-5559-d95e-059d-f402f4a8b8ac	Pogodba-write	Pogodba - spreminjanje	f
00030000-5559-d95e-294b-eba30a59147b	Popa-read	Popa - branje	f
00030000-5559-d95e-a2fa-73d8593a36a1	Popa-write	Popa - spreminjanje	f
00030000-5559-d95e-4418-301a3eb8745b	Posta-read	Posta - branje	f
00030000-5559-d95e-fef9-cc555154c3d4	Posta-write	Posta - spreminjanje	f
00030000-5559-d95e-9cde-eebc0ba31367	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5559-d95e-eaea-312c154a64c0	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5559-d95e-2df9-3524445f2e67	PostniNaslov-read	PostniNaslov - branje	f
00030000-5559-d95e-52a5-370bf4444118	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5559-d95e-fb87-fd33f7161f7f	Predstava-read	Predstava - branje	f
00030000-5559-d95e-37ce-29f0bc1cad56	Predstava-write	Predstava - spreminjanje	f
00030000-5559-d95e-53aa-0ef1e0e167ee	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5559-d95e-2b25-e13069912767	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5559-d95e-4a26-adf9f965e720	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5559-d95e-80f9-43e00978e7ed	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5559-d95e-eac2-b9cd57432c76	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5559-d95e-a772-49e908716878	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5559-d95e-c766-1a4a90ffd099	Prostor-read	Prostor - branje	f
00030000-5559-d95e-d165-15b40a7a740d	Prostor-write	Prostor - spreminjanje	f
00030000-5559-d95e-2c72-fcae65d2970e	Racun-read	Racun - branje	f
00030000-5559-d95e-6d95-2122a1c9d89c	Racun-write	Racun - spreminjanje	f
00030000-5559-d95e-f6cd-a243191c6ade	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5559-d95e-539f-b82367870afb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5559-d95e-176e-01f91060b54a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5559-d95e-b61a-cd1cb94c7c00	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5559-d95e-9605-7b998ea0fea4	Rekvizit-read	Rekvizit - branje	f
00030000-5559-d95e-3852-4b53ef73adb0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5559-d95e-ec71-34783e83c968	Rezervacija-read	Rezervacija - branje	f
00030000-5559-d95e-2b0b-f7183cbf5a37	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5559-d95e-c202-6684cc56e8c8	SedezniRed-read	SedezniRed - branje	f
00030000-5559-d95e-f1e6-33ea13aa9f78	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5559-d95e-4ff1-97d93e450a06	Sedez-read	Sedez - branje	f
00030000-5559-d95e-4c31-e8530fcefe7e	Sedez-write	Sedez - spreminjanje	f
00030000-5559-d95e-c57b-6ea0d750d637	Sezona-read	Sezona - branje	f
00030000-5559-d95e-1b27-e45f52c96e25	Sezona-write	Sezona - spreminjanje	f
00030000-5559-d95e-b52a-53ef10d42a79	Telefonska-read	Telefonska - branje	f
00030000-5559-d95e-29f2-c3bb1d28b5ab	Telefonska-write	Telefonska - spreminjanje	f
00030000-5559-d95e-ccf2-0256c952fd03	TerminStoritve-read	TerminStoritve - branje	f
00030000-5559-d95e-e909-4583f3ac9731	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5559-d95e-d6b3-02bb76a9987d	TipFunkcije-read	TipFunkcije - branje	f
00030000-5559-d95e-903e-147a5ff79003	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5559-d95e-94e7-435a1b105125	Trr-read	Trr - branje	f
00030000-5559-d95e-21fe-6a16350a8936	Trr-write	Trr - spreminjanje	f
00030000-5559-d95e-17bf-c998121751db	Uprizoritev-read	Uprizoritev - branje	f
00030000-5559-d95e-7a89-2844e28fb06c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5559-d95e-8eea-4ab95ee6382a	Vaja-read	Vaja - branje	f
00030000-5559-d95e-03d1-ab8130b3a20b	Vaja-write	Vaja - spreminjanje	f
00030000-5559-d95e-b560-41050f827c85	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5559-d95e-52d2-5e476d76e99c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5559-d95e-5612-aeb04832fbda	Zaposlitev-read	Zaposlitev - branje	f
00030000-5559-d95e-a093-a406552f35bf	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5559-d95e-a680-1fc6fb13f88a	Zasedenost-read	Zasedenost - branje	f
00030000-5559-d95e-3a37-8f6dadcea730	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5559-d95e-f7fd-32ebe7024b9a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5559-d95e-54b2-710e8aec0b25	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5559-d95e-e2ce-919e3cd5a6a4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5559-d95e-c28b-e91a12aff495	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3777698)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5559-d95e-b722-003941769d7c	00030000-5559-d95e-e3f6-64772ea398ca
00020000-5559-d95e-38eb-50ce36d03618	00030000-5559-d95e-856f-e8eee30db82b
00020000-5559-d95e-38eb-50ce36d03618	00030000-5559-d95e-e3f6-64772ea398ca
\.


--
-- TOC entry 2663 (class 0 OID 3777982)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3778012)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3778127)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3777756)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3777798)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5559-d95d-9c98-99222b81afe0	8341	Adlešiči
00050000-5559-d95d-72a7-2247ef2e5df0	5270	Ajdovščina
00050000-5559-d95d-d65d-2e2981ca2244	6280	Ankaran/Ancarano
00050000-5559-d95d-e9e4-bb487e4518c0	9253	Apače
00050000-5559-d95d-e209-eb422cb49d37	8253	Artiče
00050000-5559-d95d-a05f-b4459742052a	4275	Begunje na Gorenjskem
00050000-5559-d95d-cd24-47a4c114818a	1382	Begunje pri Cerknici
00050000-5559-d95d-1ace-6d7e7d4f2fce	9231	Beltinci
00050000-5559-d95d-768d-0e93f925dc51	2234	Benedikt
00050000-5559-d95d-4ba2-99c627128ccd	2345	Bistrica ob Dravi
00050000-5559-d95d-d458-7d606996643f	3256	Bistrica ob Sotli
00050000-5559-d95d-466c-433393b755fb	8259	Bizeljsko
00050000-5559-d95d-003a-2c55042f8914	1223	Blagovica
00050000-5559-d95d-8b7f-14785c598843	8283	Blanca
00050000-5559-d95d-e0be-53fdd1ca5a2c	4260	Bled
00050000-5559-d95d-de9d-e57da85b9f73	4273	Blejska Dobrava
00050000-5559-d95d-05b9-bf04b47b0fb6	9265	Bodonci
00050000-5559-d95d-fc99-73452f91b9c6	9222	Bogojina
00050000-5559-d95d-7f61-97db8b44ce19	4263	Bohinjska Bela
00050000-5559-d95d-b1a8-a9c35a065e9a	4264	Bohinjska Bistrica
00050000-5559-d95d-0489-c68c22f47468	4265	Bohinjsko jezero
00050000-5559-d95d-59bb-8a9eafc8e20c	1353	Borovnica
00050000-5559-d95d-985e-bad06deca49d	8294	Boštanj
00050000-5559-d95d-f341-bc4be5175def	5230	Bovec
00050000-5559-d95d-c6e5-85606f043456	5295	Branik
00050000-5559-d95d-9066-c1f55399b4bf	3314	Braslovče
00050000-5559-d95d-3855-62b6c1da8039	5223	Breginj
00050000-5559-d95d-2c05-35a69ee56623	8280	Brestanica
00050000-5559-d95d-e2bf-9ced0901f899	2354	Bresternica
00050000-5559-d95d-88cc-998038498143	4243	Brezje
00050000-5559-d95d-577b-c8ab7634b7eb	1351	Brezovica pri Ljubljani
00050000-5559-d95d-5040-b045d79352c3	8250	Brežice
00050000-5559-d95d-0d6d-b44fb8640d15	4210	Brnik - Aerodrom
00050000-5559-d95d-3f0d-bc9d8b853e2d	8321	Brusnice
00050000-5559-d95d-0dbd-b470cccfcd3b	3255	Buče
00050000-5559-d95d-608f-e75e62332717	8276	Bučka 
00050000-5559-d95d-0365-a34d41594ea0	9261	Cankova
00050000-5559-d95d-5d26-3bc275bb122b	3000	Celje 
00050000-5559-d95d-f37e-0ddac25d1ee8	3001	Celje - poštni predali
00050000-5559-d95d-1f5c-9c23eaf6923b	4207	Cerklje na Gorenjskem
00050000-5559-d95d-becd-3a0f7605305e	8263	Cerklje ob Krki
00050000-5559-d95d-3fa0-50b9ef353ef2	1380	Cerknica
00050000-5559-d95d-3e7d-3aeb8f40f824	5282	Cerkno
00050000-5559-d95d-d427-f231a10851a5	2236	Cerkvenjak
00050000-5559-d95d-dc14-ca02769060af	2215	Ceršak
00050000-5559-d95d-a705-4f950ce2408a	2326	Cirkovce
00050000-5559-d95d-3035-6f95a5595d26	2282	Cirkulane
00050000-5559-d95d-f4f3-62d15a1e26a0	5273	Col
00050000-5559-d95d-ad2f-b909bccecb5f	8251	Čatež ob Savi
00050000-5559-d95d-b924-9e6b9c869505	1413	Čemšenik
00050000-5559-d95d-612f-6c08639d0a78	5253	Čepovan
00050000-5559-d95d-204f-64a8b2ce2ab5	9232	Črenšovci
00050000-5559-d95d-8947-aae2c2974709	2393	Črna na Koroškem
00050000-5559-d95d-e377-93f1289203b7	6275	Črni Kal
00050000-5559-d95d-16a7-8461f9f13220	5274	Črni Vrh nad Idrijo
00050000-5559-d95d-9768-47ebd812b21a	5262	Črniče
00050000-5559-d95d-5b80-3ff871c0eeda	8340	Črnomelj
00050000-5559-d95d-9f65-e531da374991	6271	Dekani
00050000-5559-d95d-ec0b-7944c3774b00	5210	Deskle
00050000-5559-d95d-2c0b-0fef9c1f9492	2253	Destrnik
00050000-5559-d95d-cd4f-c0c7941d8229	6215	Divača
00050000-5559-d95d-42b8-72ce046f403b	1233	Dob
00050000-5559-d95d-825f-b6f6fc80a251	3224	Dobje pri Planini
00050000-5559-d95d-3263-96e3e1063781	8257	Dobova
00050000-5559-d95d-6db3-12653fbe7f56	1423	Dobovec
00050000-5559-d95d-3bcb-2930b6949f84	5263	Dobravlje
00050000-5559-d95d-1ccf-68465566f424	3204	Dobrna
00050000-5559-d95d-f80b-ddb01ab0e2a3	8211	Dobrnič
00050000-5559-d95d-eed9-2a60b1da5ef1	1356	Dobrova
00050000-5559-d95d-d724-d6d3f3f83c19	9223	Dobrovnik/Dobronak 
00050000-5559-d95d-2f86-8ddc304e307e	5212	Dobrovo v Brdih
00050000-5559-d95d-6438-2518199c562b	1431	Dol pri Hrastniku
00050000-5559-d95d-75a3-e60eaf5c02c1	1262	Dol pri Ljubljani
00050000-5559-d95d-6062-a9898888c848	1273	Dole pri Litiji
00050000-5559-d95d-adcf-3eb863e22412	1331	Dolenja vas
00050000-5559-d95d-dc83-fc021bab650c	8350	Dolenjske Toplice
00050000-5559-d95d-68d9-f2bed8a165a6	1230	Domžale
00050000-5559-d95d-9e2d-1a0033ae3fb1	2252	Dornava
00050000-5559-d95d-fc8f-2f50a31aebf6	5294	Dornberk
00050000-5559-d95d-5501-540946ef7da1	1319	Draga
00050000-5559-d95d-62d3-7b0f68dd94f6	8343	Dragatuš
00050000-5559-d95d-c663-3c4f561d0c22	3222	Dramlje
00050000-5559-d95d-4731-20a84bf6a826	2370	Dravograd
00050000-5559-d95d-781e-b670d6eec5d1	4203	Duplje
00050000-5559-d95d-357a-5c2c6d851ee3	6221	Dutovlje
00050000-5559-d95d-8869-0cf057c26adc	8361	Dvor
00050000-5559-d95d-afc4-ea37dc39c81e	2343	Fala
00050000-5559-d95d-702e-7b545c2188c3	9208	Fokovci
00050000-5559-d95d-2f33-ed454db31dcb	2313	Fram
00050000-5559-d95d-35dd-fb8222534c2a	3213	Frankolovo
00050000-5559-d95d-ae47-c97c3c3f5741	1274	Gabrovka
00050000-5559-d95d-d01c-01975bb49579	8254	Globoko
00050000-5559-d95d-9393-fe907ce23057	5275	Godovič
00050000-5559-d95d-4717-bd869b9f233a	4204	Golnik
00050000-5559-d95d-d3da-735d9e827646	3303	Gomilsko
00050000-5559-d95d-70ec-46bfe51a225b	4224	Gorenja vas
00050000-5559-d95d-0f5c-5fae7167a883	3263	Gorica pri Slivnici
00050000-5559-d95d-d041-495a3a55c955	2272	Gorišnica
00050000-5559-d95d-3a8e-ef3c50c7c52a	9250	Gornja Radgona
00050000-5559-d95d-df82-705498a8f3e4	3342	Gornji Grad
00050000-5559-d95d-a55c-177d1f585df9	4282	Gozd Martuljek
00050000-5559-d95d-9dcb-57d7f2a1f8de	6272	Gračišče
00050000-5559-d95d-4171-13312f638cab	9264	Grad
00050000-5559-d95d-8f88-2a47e5a2d9c8	8332	Gradac
00050000-5559-d95d-1ae0-e46410944c4c	1384	Grahovo
00050000-5559-d95d-5140-5230a130d943	5242	Grahovo ob Bači
00050000-5559-d95d-b5de-b2f90f7f8e63	5251	Grgar
00050000-5559-d95d-e3f3-4aa9866befc4	3302	Griže
00050000-5559-d95d-2809-bfeaa186e844	3231	Grobelno
00050000-5559-d95d-80bf-3ce51370e38f	1290	Grosuplje
00050000-5559-d95d-927b-62151bdab7df	2288	Hajdina
00050000-5559-d95d-43b1-9d14d8242500	8362	Hinje
00050000-5559-d95d-513e-5b86eff637db	2311	Hoče
00050000-5559-d95d-3e76-252e0ce764a3	9205	Hodoš/Hodos
00050000-5559-d95d-3886-431e7fb68970	1354	Horjul
00050000-5559-d95d-d46c-1af3c2451309	1372	Hotedršica
00050000-5559-d95d-3b43-e8d27f1220ad	1430	Hrastnik
00050000-5559-d95d-d7db-3f6f4278828e	6225	Hruševje
00050000-5559-d95d-b5f2-b283f7df3457	4276	Hrušica
00050000-5559-d95d-f318-91f4b817100d	5280	Idrija
00050000-5559-d95d-372d-9d37909f1998	1292	Ig
00050000-5559-d95d-b6f8-56e68eeba5bd	6250	Ilirska Bistrica
00050000-5559-d95d-9e92-e232a5bcca6e	6251	Ilirska Bistrica-Trnovo
00050000-5559-d95d-36f4-d487f26efa59	1295	Ivančna Gorica
00050000-5559-d95d-18d6-3348879d2086	2259	Ivanjkovci
00050000-5559-d95d-4846-10cc39fb3ff5	1411	Izlake
00050000-5559-d95d-9f05-84c54e4fb5da	6310	Izola/Isola
00050000-5559-d95d-9a6b-a38636bb87d5	2222	Jakobski Dol
00050000-5559-d95d-b136-fcae8718d0df	2221	Jarenina
00050000-5559-d95d-397c-2cbdf336069c	6254	Jelšane
00050000-5559-d95d-e75a-8835068c0593	4270	Jesenice
00050000-5559-d95d-7943-97b476e41cbe	8261	Jesenice na Dolenjskem
00050000-5559-d95d-f598-79408a83116d	3273	Jurklošter
00050000-5559-d95d-2e15-b965787314dd	2223	Jurovski Dol
00050000-5559-d95d-e5a4-0e20cadc8381	2256	Juršinci
00050000-5559-d95d-ce0a-4ed7df92f559	5214	Kal nad Kanalom
00050000-5559-d95d-d5f5-3e041bf23aaf	3233	Kalobje
00050000-5559-d95d-6843-3f7aa73a1e83	4246	Kamna Gorica
00050000-5559-d95d-0e9b-9b29e62908a0	2351	Kamnica
00050000-5559-d95d-9f23-04f25437b69a	1241	Kamnik
00050000-5559-d95d-c53e-ddcc88f6d05d	5213	Kanal
00050000-5559-d95d-2eb3-b45daf75e553	8258	Kapele
00050000-5559-d95d-aed9-963a93859b32	2362	Kapla
00050000-5559-d95d-4dbf-ce3aaa7a25ae	2325	Kidričevo
00050000-5559-d95d-a87a-12d4d6450c3d	1412	Kisovec
00050000-5559-d95d-cb5d-1da2b464793c	6253	Knežak
00050000-5559-d95d-b6c1-6e8f7105f15b	5222	Kobarid
00050000-5559-d95d-95dc-f8cf8b19ea1e	9227	Kobilje
00050000-5559-d95d-71e6-c3db0f584579	1330	Kočevje
00050000-5559-d95d-9ae0-ab15da8fd3bd	1338	Kočevska Reka
00050000-5559-d95d-8e21-ff9bf1989e32	2276	Kog
00050000-5559-d95d-3fb5-1d6108c66cbb	5211	Kojsko
00050000-5559-d95d-a3a2-85135b6c09f0	6223	Komen
00050000-5559-d95d-a46d-a9eaf964d5e9	1218	Komenda
00050000-5559-d95d-ed96-82b630b37251	6000	Koper/Capodistria 
00050000-5559-d95d-7d87-340bbfebece3	6001	Koper/Capodistria - poštni predali
00050000-5559-d95d-dc1a-c99a04caa141	8282	Koprivnica
00050000-5559-d95d-92c1-f778c4ce1b74	5296	Kostanjevica na Krasu
00050000-5559-d95d-b68c-8aa9ec28f967	8311	Kostanjevica na Krki
00050000-5559-d95d-4556-fae726d737b0	1336	Kostel
00050000-5559-d95d-4676-1777a223362b	6256	Košana
00050000-5559-d95d-c417-36afd0e5d848	2394	Kotlje
00050000-5559-d95d-b550-97a397d0a642	6240	Kozina
00050000-5559-d95d-eb94-b2d2b12e4d59	3260	Kozje
00050000-5559-d95d-6f54-2db8bf4e5c01	4000	Kranj 
00050000-5559-d95d-f55e-3e196888519c	4001	Kranj - poštni predali
00050000-5559-d95d-140d-c82eeeb956c6	4280	Kranjska Gora
00050000-5559-d95d-314d-e940527d31d0	1281	Kresnice
00050000-5559-d95d-d630-c852b5cc0df0	4294	Križe
00050000-5559-d95d-480c-5bf8c06e5cab	9206	Križevci
00050000-5559-d95d-80cc-8b701ef9692b	9242	Križevci pri Ljutomeru
00050000-5559-d95d-b004-8fc7bf09dc5c	1301	Krka
00050000-5559-d95d-3903-34e057022d31	8296	Krmelj
00050000-5559-d95d-138a-2b53673571b9	4245	Kropa
00050000-5559-d95d-939f-4b3c82962e15	8262	Krška vas
00050000-5559-d95d-7e1c-b9c7e4491dbd	8270	Krško
00050000-5559-d95d-16e4-e8ec6dd972ee	9263	Kuzma
00050000-5559-d95d-b3b1-11ec05a9713f	2318	Laporje
00050000-5559-d95d-45b1-8cf113177f82	3270	Laško
00050000-5559-d95d-5886-857359529b3f	1219	Laze v Tuhinju
00050000-5559-d95d-0a15-3ef0f7e4aa6e	2230	Lenart v Slovenskih goricah
00050000-5559-d95d-84bb-cbf9b6014532	9220	Lendava/Lendva
00050000-5559-d95d-5092-dd2091e003e7	4248	Lesce
00050000-5559-d95d-b3b8-5842c132b931	3261	Lesično
00050000-5559-d95d-6936-c3bf4e3a9916	8273	Leskovec pri Krškem
00050000-5559-d95d-011d-2ee900506e12	2372	Libeliče
00050000-5559-d95d-2974-457ef6e72234	2341	Limbuš
00050000-5559-d95d-8b9d-964b1e3539e5	1270	Litija
00050000-5559-d95d-9ff2-18268a1bd391	3202	Ljubečna
00050000-5559-d95d-5484-ea19309d2e96	1000	Ljubljana 
00050000-5559-d95d-98e9-50e6a8797607	1001	Ljubljana - poštni predali
00050000-5559-d95d-8052-bce9cc0d5c51	1231	Ljubljana - Črnuče
00050000-5559-d95d-9758-3354e6a79784	1261	Ljubljana - Dobrunje
00050000-5559-d95d-e8ad-a27dc656eea1	1260	Ljubljana - Polje
00050000-5559-d95d-ae3c-8b8d591bf8dc	1210	Ljubljana - Šentvid
00050000-5559-d95d-3f9e-cf17dcdd81ff	1211	Ljubljana - Šmartno
00050000-5559-d95d-099e-4a3c44a2b84f	3333	Ljubno ob Savinji
00050000-5559-d95d-2f41-f497b47813d7	9240	Ljutomer
00050000-5559-d95d-31aa-c70f8ff00141	3215	Loče
00050000-5559-d95d-8d87-2df1cc8f003d	5231	Log pod Mangartom
00050000-5559-d95d-2310-70166807a370	1358	Log pri Brezovici
00050000-5559-d95d-3e03-e88ff7e22d65	1370	Logatec
00050000-5559-d95d-1974-9e2884b445d8	1371	Logatec
00050000-5559-d95d-39a4-02153659e28e	1434	Loka pri Zidanem Mostu
00050000-5559-d95d-6871-012942a930fb	3223	Loka pri Žusmu
00050000-5559-d95d-ef0a-cf5a89e5a275	6219	Lokev
00050000-5559-d95d-6bbf-0e699ba234cc	1318	Loški Potok
00050000-5559-d95d-fd93-c3dc3cdfe29d	2324	Lovrenc na Dravskem polju
00050000-5559-d95d-0646-5d78c00645ea	2344	Lovrenc na Pohorju
00050000-5559-d95d-2c98-3724d68c19b7	3334	Luče
00050000-5559-d95d-4fca-65c4be2f5388	1225	Lukovica
00050000-5559-d95d-a0b6-1fbf08404778	9202	Mačkovci
00050000-5559-d95d-2a62-ff9afdad4dd0	2322	Majšperk
00050000-5559-d95d-bca8-86a56aa1cea7	2321	Makole
00050000-5559-d95d-16c3-095facaa9c32	9243	Mala Nedelja
00050000-5559-d95d-018f-58313ae50a46	2229	Malečnik
00050000-5559-d95d-29eb-89d626488dd0	6273	Marezige
00050000-5559-d95d-46cf-e8f5e1a3a1fe	2000	Maribor 
00050000-5559-d95d-b3e3-ea9ef5ac54b1	2001	Maribor - poštni predali
00050000-5559-d95d-25d3-b6ec346e64fd	2206	Marjeta na Dravskem polju
00050000-5559-d95d-6bff-11a07a0c7048	2281	Markovci
00050000-5559-d95d-f976-83d716dba26d	9221	Martjanci
00050000-5559-d95d-56e2-7a389975519d	6242	Materija
00050000-5559-d95d-3a6d-aafc9c8eddfd	4211	Mavčiče
00050000-5559-d95d-6549-1ca02c83bb9e	1215	Medvode
00050000-5559-d95d-17a1-dcae917bf2c5	1234	Mengeš
00050000-5559-d95d-19ff-549dd2f5954c	8330	Metlika
00050000-5559-d95d-3a7c-07f25f8c7fa4	2392	Mežica
00050000-5559-d95d-b026-e027286f61e1	2204	Miklavž na Dravskem polju
00050000-5559-d95d-9636-9ceb01d5f402	2275	Miklavž pri Ormožu
00050000-5559-d95d-4042-edfb803c15cd	5291	Miren
00050000-5559-d95d-3e46-06451c79ff1c	8233	Mirna
00050000-5559-d95d-3bbe-b671982bb159	8216	Mirna Peč
00050000-5559-d95d-57c7-a3dd2f394137	2382	Mislinja
00050000-5559-d95d-f243-c3df5a0915d5	4281	Mojstrana
00050000-5559-d95d-f0a2-5dc155831e12	8230	Mokronog
00050000-5559-d95d-b136-6cc6c21f53ec	1251	Moravče
00050000-5559-d95d-0ed1-3c553c5f1c21	9226	Moravske Toplice
00050000-5559-d95d-2714-88dc83cc02d3	5216	Most na Soči
00050000-5559-d95d-2d98-cd1075bec98a	1221	Motnik
00050000-5559-d95d-05f2-6fab6a4f16b6	3330	Mozirje
00050000-5559-d95d-9314-33bcce3aa88a	9000	Murska Sobota 
00050000-5559-d95d-e0ec-b1fd187b96c7	9001	Murska Sobota - poštni predali
00050000-5559-d95d-80a1-5b0daff42818	2366	Muta
00050000-5559-d95d-795a-8fd0376576ff	4202	Naklo
00050000-5559-d95d-83d6-e0c7a8e052aa	3331	Nazarje
00050000-5559-d95d-e6d5-8923ef45e036	1357	Notranje Gorice
00050000-5559-d95d-5d9e-7be8fc59b99d	3203	Nova Cerkev
00050000-5559-d95d-c624-3dc42aef7e42	5000	Nova Gorica 
00050000-5559-d95d-2212-b69c27444009	5001	Nova Gorica - poštni predali
00050000-5559-d95d-50c8-a605b946a3d3	1385	Nova vas
00050000-5559-d95d-4840-bf10702b2035	8000	Novo mesto
00050000-5559-d95d-f879-078cc1464110	8001	Novo mesto - poštni predali
00050000-5559-d95d-7b24-4027280bcbde	6243	Obrov
00050000-5559-d95d-b98f-c7cc6776e6c8	9233	Odranci
00050000-5559-d95d-e39c-b5113cb8ece4	2317	Oplotnica
00050000-5559-d95d-fa4f-607770b0f26f	2312	Orehova vas
00050000-5559-d95d-ce66-debf30e096f1	2270	Ormož
00050000-5559-d95d-7c11-93eb7e9634e2	1316	Ortnek
00050000-5559-d95d-a576-3ef4e6e8d9e0	1337	Osilnica
00050000-5559-d95d-18af-da6c69166b29	8222	Otočec
00050000-5559-d95d-9e98-db0f9c93a9d8	2361	Ožbalt
00050000-5559-d95d-ec62-5dc3a58da1f0	2231	Pernica
00050000-5559-d95d-b733-290b09c50156	2211	Pesnica pri Mariboru
00050000-5559-d95d-2492-5d3245895442	9203	Petrovci
00050000-5559-d95d-b68f-dd24062fe6a2	3301	Petrovče
00050000-5559-d95d-bc51-ac9a2e2b1627	6330	Piran/Pirano
00050000-5559-d95d-526c-a04803d7d52f	8255	Pišece
00050000-5559-d95d-2580-f9b8930b8d39	6257	Pivka
00050000-5559-d95d-b4fa-e60266315026	6232	Planina
00050000-5559-d95d-365d-cb016598a8a4	3225	Planina pri Sevnici
00050000-5559-d95d-c908-9ec6fb422a4e	6276	Pobegi
00050000-5559-d95d-1549-f8ffca2cafa4	8312	Podbočje
00050000-5559-d95d-796c-018bc1c236cd	5243	Podbrdo
00050000-5559-d95d-86f8-5cc26b0b965c	3254	Podčetrtek
00050000-5559-d95d-3545-ec5cd2056455	2273	Podgorci
00050000-5559-d95d-2735-f44a68714df4	6216	Podgorje
00050000-5559-d95d-dc38-74e8666ee01d	2381	Podgorje pri Slovenj Gradcu
00050000-5559-d95d-f48b-1a8ffe9400d1	6244	Podgrad
00050000-5559-d95d-931b-0701b7ca779b	1414	Podkum
00050000-5559-d95d-ae65-228ad0035ac3	2286	Podlehnik
00050000-5559-d95d-4c19-0ae7367e3047	5272	Podnanos
00050000-5559-d95d-00c7-52f1df08b8f7	4244	Podnart
00050000-5559-d95d-5164-9beb1fc9cd96	3241	Podplat
00050000-5559-d95d-21b7-b6e225a8eb9a	3257	Podsreda
00050000-5559-d95d-47bc-5c3835dc4902	2363	Podvelka
00050000-5559-d95d-f09f-30f23ff1b95c	2208	Pohorje
00050000-5559-d95d-7595-30fcc74dbb83	2257	Polenšak
00050000-5559-d95d-0ddb-29e291e1e302	1355	Polhov Gradec
00050000-5559-d95d-639d-4bf29adac37d	4223	Poljane nad Škofjo Loko
00050000-5559-d95d-e97c-6ba11e5f1666	2319	Poljčane
00050000-5559-d95d-0063-809969763e93	1272	Polšnik
00050000-5559-d95d-e439-c2ea67548f65	3313	Polzela
00050000-5559-d95d-fa80-77bec09a107e	3232	Ponikva
00050000-5559-d95d-d1ff-8b0bd1e28b6c	6320	Portorož/Portorose
00050000-5559-d95d-dbfb-f8813222e4dc	6230	Postojna
00050000-5559-d95d-fcf9-3ba8baf8b1c5	2331	Pragersko
00050000-5559-d95d-b7f4-b6da9dd316d8	3312	Prebold
00050000-5559-d95d-976b-48185492ef86	4205	Preddvor
00050000-5559-d95d-683d-716a0f55f649	6255	Prem
00050000-5559-d95d-1cd1-45bd8e2f29a6	1352	Preserje
00050000-5559-d95d-843c-14edd5a66f8a	6258	Prestranek
00050000-5559-d95d-d0e1-e8b454df0c93	2391	Prevalje
00050000-5559-d95d-797e-779c5986c619	3262	Prevorje
00050000-5559-d95d-fb74-5f74efe3a508	1276	Primskovo 
00050000-5559-d95d-51a3-59eb105847b7	3253	Pristava pri Mestinju
00050000-5559-d95d-d7dc-92811157ec72	9207	Prosenjakovci/Partosfalva
00050000-5559-d95d-c1c6-e87980bdf364	5297	Prvačina
00050000-5559-d95d-3f55-c6b258ebfcec	2250	Ptuj
00050000-5559-d95d-a487-ce1f4e76fc62	2323	Ptujska Gora
00050000-5559-d95d-18f5-87b1761bcecd	9201	Puconci
00050000-5559-d95d-a28a-ca149d77c8f7	2327	Rače
00050000-5559-d95d-ef22-d3101cf75459	1433	Radeče
00050000-5559-d95d-9857-32b4e65b4e50	9252	Radenci
00050000-5559-d95d-2bc4-5467ddf6b892	2360	Radlje ob Dravi
00050000-5559-d95d-6fee-a0fc2c41502d	1235	Radomlje
00050000-5559-d95d-64e9-925ba66c53c3	4240	Radovljica
00050000-5559-d95d-0d6b-d816e1047cd8	8274	Raka
00050000-5559-d95d-36a0-37df4333b2f5	1381	Rakek
00050000-5559-d95d-ca57-b1e939a8a297	4283	Rateče - Planica
00050000-5559-d95d-c58d-814b03e248ab	2390	Ravne na Koroškem
00050000-5559-d95d-86d6-c31172ae4a26	9246	Razkrižje
00050000-5559-d95d-7d41-f2f0cb792b71	3332	Rečica ob Savinji
00050000-5559-d95d-06e1-e3e19a2ac3fe	5292	Renče
00050000-5559-d95d-6117-d443084e55af	1310	Ribnica
00050000-5559-d95d-e5fa-b8af9e9baa51	2364	Ribnica na Pohorju
00050000-5559-d95d-e738-64c4494fae42	3272	Rimske Toplice
00050000-5559-d95d-ebf8-d3b6b89ca434	1314	Rob
00050000-5559-d95d-43e2-558d4fa868c2	5215	Ročinj
00050000-5559-d95d-b7ef-e4ac2c98352f	3250	Rogaška Slatina
00050000-5559-d95d-9706-d5cfb6f05de7	9262	Rogašovci
00050000-5559-d95d-e91e-fc64f4090602	3252	Rogatec
00050000-5559-d95d-c9c3-5fb06274ca73	1373	Rovte
00050000-5559-d95d-acce-fd94e93f3255	2342	Ruše
00050000-5559-d95d-8e52-c4764f0c74cf	1282	Sava
00050000-5559-d95d-d87c-bf1f1fb927ec	6333	Sečovlje/Sicciole
00050000-5559-d95d-9396-51c90657e4e3	4227	Selca
00050000-5559-d95d-36fe-a4be3e6b2f38	2352	Selnica ob Dravi
00050000-5559-d95d-c1bd-cb5bfa81fc3b	8333	Semič
00050000-5559-d95d-39a5-a1793ee0a69c	8281	Senovo
00050000-5559-d95d-ad29-913497e38b60	6224	Senožeče
00050000-5559-d95d-c2cf-6a0939f57549	8290	Sevnica
00050000-5559-d95d-b766-43ddc594d2ce	6210	Sežana
00050000-5559-d95d-65f8-293c952bf05c	2214	Sladki Vrh
00050000-5559-d95d-b008-6766aad19d6c	5283	Slap ob Idrijci
00050000-5559-d95d-de90-231475af664c	2380	Slovenj Gradec
00050000-5559-d95d-c5f6-b822dea8393c	2310	Slovenska Bistrica
00050000-5559-d95d-d053-bbde2466d3e3	3210	Slovenske Konjice
00050000-5559-d95d-2e6e-9bc839151ff3	1216	Smlednik
00050000-5559-d95d-a806-1f573ed8c33e	5232	Soča
00050000-5559-d95d-ca68-f3ca1769c000	1317	Sodražica
00050000-5559-d95d-4be5-5cc6d00c5a61	3335	Solčava
00050000-5559-d95d-b211-5b77221ba1c4	5250	Solkan
00050000-5559-d95d-489c-c1c82ef7a5e7	4229	Sorica
00050000-5559-d95d-65b9-6ef69c267873	4225	Sovodenj
00050000-5559-d95d-c8c2-9539af5d47f0	5281	Spodnja Idrija
00050000-5559-d95d-f672-85b9c7534792	2241	Spodnji Duplek
00050000-5559-d95d-52eb-f06badc38f27	9245	Spodnji Ivanjci
00050000-5559-d95d-bc24-f3be4285f6bd	2277	Središče ob Dravi
00050000-5559-d95d-2d67-cd0d78980bd3	4267	Srednja vas v Bohinju
00050000-5559-d95d-abf7-509e0099b338	8256	Sromlje 
00050000-5559-d95d-1d7d-1b70161991ec	5224	Srpenica
00050000-5559-d95d-e406-c01c94c79684	1242	Stahovica
00050000-5559-d95d-61d1-4d6f0621596a	1332	Stara Cerkev
00050000-5559-d95d-5a6a-7ae4d62f5d38	8342	Stari trg ob Kolpi
00050000-5559-d95d-b6bd-c3f31bd07c13	1386	Stari trg pri Ložu
00050000-5559-d95d-0bad-0ebcbec09c76	2205	Starše
00050000-5559-d95d-898d-44b0aa20e177	2289	Stoperce
00050000-5559-d95d-9df8-33d7a4fe966f	8322	Stopiče
00050000-5559-d95d-43e9-b01f8f5fce7e	3206	Stranice
00050000-5559-d95d-ba2d-c3a2076161e7	8351	Straža
00050000-5559-d95d-ae30-7dcc7ad468de	1313	Struge
00050000-5559-d95d-92c8-77cc35f291fb	8293	Studenec
00050000-5559-d95d-a1c7-7a6b677be8d7	8331	Suhor
00050000-5559-d95d-b079-322f48cfc633	2233	Sv. Ana v Slovenskih goricah
00050000-5559-d95d-755e-d31b3b54303b	2235	Sv. Trojica v Slovenskih goricah
00050000-5559-d95d-fac0-fffb2df518d7	2353	Sveti Duh na Ostrem Vrhu
00050000-5559-d95d-6e93-56bf2c4177fa	9244	Sveti Jurij ob Ščavnici
00050000-5559-d95d-8267-07b61b81561e	3264	Sveti Štefan
00050000-5559-d95d-edd9-ea880eccd848	2258	Sveti Tomaž
00050000-5559-d95d-e408-65c210a5fb3c	9204	Šalovci
00050000-5559-d95d-08ba-0f477c0f7811	5261	Šempas
00050000-5559-d95d-e844-cd2108df09e8	5290	Šempeter pri Gorici
00050000-5559-d95d-b98a-f1c3e936b95a	3311	Šempeter v Savinjski dolini
00050000-5559-d95d-124e-66da9727b024	4208	Šenčur
00050000-5559-d95d-28a0-44536fa10aac	2212	Šentilj v Slovenskih goricah
00050000-5559-d95d-2161-a95b805e5e81	8297	Šentjanž
00050000-5559-d95d-7e52-b113c745c10b	2373	Šentjanž pri Dravogradu
00050000-5559-d95d-57ba-a202fc13ce36	8310	Šentjernej
00050000-5559-d95d-727e-044f7222faed	3230	Šentjur
00050000-5559-d95d-eaa2-b2195c7b7c16	3271	Šentrupert
00050000-5559-d95d-57c3-f99333b09e3d	8232	Šentrupert
00050000-5559-d95d-fa00-b1f0645aa3d1	1296	Šentvid pri Stični
00050000-5559-d95d-3107-2e49f5b64ac3	8275	Škocjan
00050000-5559-d95d-3bb6-dbd653fd2b56	6281	Škofije
00050000-5559-d95d-f679-1dd50ca416dc	4220	Škofja Loka
00050000-5559-d95d-f404-12ea8af60e0c	3211	Škofja vas
00050000-5559-d95d-9531-a51c3122292f	1291	Škofljica
00050000-5559-d95d-6ad9-66c1caff6b8f	6274	Šmarje
00050000-5559-d95d-e475-bb8f66859b5a	1293	Šmarje - Sap
00050000-5559-d95d-2f53-c705562f10a4	3240	Šmarje pri Jelšah
00050000-5559-d95d-c6d5-515b21f42f05	8220	Šmarješke Toplice
00050000-5559-d95d-e679-f897c7df0d3b	2315	Šmartno na Pohorju
00050000-5559-d95d-28d7-d494da55114e	3341	Šmartno ob Dreti
00050000-5559-d95d-95b8-39e4f5824069	3327	Šmartno ob Paki
00050000-5559-d95d-ce74-29ef26519256	1275	Šmartno pri Litiji
00050000-5559-d95d-0c82-499ef85f9ac9	2383	Šmartno pri Slovenj Gradcu
00050000-5559-d95d-c48d-4a9ba1fb1867	3201	Šmartno v Rožni dolini
00050000-5559-d95d-1d69-07afd66ead48	3325	Šoštanj
00050000-5559-d95d-f356-6f0690b73b53	6222	Štanjel
00050000-5559-d95d-d363-7dda323be40b	3220	Štore
00050000-5559-d95d-8284-6cff2fca45ef	3304	Tabor
00050000-5559-d95d-8e62-6c0b2f3a20ac	3221	Teharje
00050000-5559-d95d-c1dc-6945ba3938c7	9251	Tišina
00050000-5559-d95d-b7a7-6bebe1f9dd6d	5220	Tolmin
00050000-5559-d95d-1cc2-0eef7563bb8a	3326	Topolšica
00050000-5559-d95d-a514-0227f3032bec	2371	Trbonje
00050000-5559-d95d-a6c3-3eee0b06fe41	1420	Trbovlje
00050000-5559-d95d-461c-0eb0f09f5ee3	8231	Trebelno 
00050000-5559-d95d-2a82-66833f163f46	8210	Trebnje
00050000-5559-d95d-1a50-517adfd96219	5252	Trnovo pri Gorici
00050000-5559-d95d-986b-dfcb64e7bbff	2254	Trnovska vas
00050000-5559-d95d-e438-3d9e0323b56d	1222	Trojane
00050000-5559-d95d-df1b-80e17df6080a	1236	Trzin
00050000-5559-d95d-c7e4-644657f38ec5	4290	Tržič
00050000-5559-d95d-9db9-4fa9ba315840	8295	Tržišče
00050000-5559-d95d-3793-83fce300cb6c	1311	Turjak
00050000-5559-d95d-8774-b9105fd8527c	9224	Turnišče
00050000-5559-d95d-280b-ef8d7ec85cb5	8323	Uršna sela
00050000-5559-d95d-9316-31818b2b4b3d	1252	Vače
00050000-5559-d95d-4271-a9a3ff7f70aa	3320	Velenje 
00050000-5559-d95d-c5b5-9e7c47d26675	3322	Velenje - poštni predali
00050000-5559-d95d-b13a-3c0e7e0dfef4	8212	Velika Loka
00050000-5559-d95d-06b5-014a8e71eac8	2274	Velika Nedelja
00050000-5559-d95d-2e06-3d49cd3b0657	9225	Velika Polana
00050000-5559-d95d-780f-d2c986f39bf1	1315	Velike Lašče
00050000-5559-d95d-4409-425828f67003	8213	Veliki Gaber
00050000-5559-d95d-5e58-6a344353d786	9241	Veržej
00050000-5559-d95d-0a4a-70ba067be685	1312	Videm - Dobrepolje
00050000-5559-d95d-931f-844c1bd5bd22	2284	Videm pri Ptuju
00050000-5559-d95d-a230-ec69d1b82fda	8344	Vinica
00050000-5559-d95d-798e-ff47d8026895	5271	Vipava
00050000-5559-d95d-c479-7d45b2150cd1	4212	Visoko
00050000-5559-d95d-8b29-fd1f5491daa8	1294	Višnja Gora
00050000-5559-d95d-b217-ff6e5d2c3b91	3205	Vitanje
00050000-5559-d95d-98c2-2af1668604e8	2255	Vitomarci
00050000-5559-d95d-bb68-d83f2390193c	1217	Vodice
00050000-5559-d95d-d06f-fe7823ecd95a	3212	Vojnik\t
00050000-5559-d95d-1539-76f2080456da	5293	Volčja Draga
00050000-5559-d95d-dd06-f1e1125f8816	2232	Voličina
00050000-5559-d95d-7d78-9a9b133a0841	3305	Vransko
00050000-5559-d95d-c618-0d673cc519f8	6217	Vremski Britof
00050000-5559-d95d-ff2e-1b10d54b7400	1360	Vrhnika
00050000-5559-d95d-2858-6409622d7844	2365	Vuhred
00050000-5559-d95d-bf35-9d82a425d2b3	2367	Vuzenica
00050000-5559-d95d-2e8f-dfa838c33aed	8292	Zabukovje 
00050000-5559-d95d-aa6a-cd9549ad5d57	1410	Zagorje ob Savi
00050000-5559-d95d-788b-1b59dc23e8e0	1303	Zagradec
00050000-5559-d95d-d39c-f9f1714143ce	2283	Zavrč
00050000-5559-d95d-5482-a94b2cfc84d9	8272	Zdole 
00050000-5559-d95d-7315-5ef9415600dd	4201	Zgornja Besnica
00050000-5559-d95d-887a-0025423a9181	2242	Zgornja Korena
00050000-5559-d95d-eba0-37e88b72e85e	2201	Zgornja Kungota
00050000-5559-d95d-51ac-d0ad8bbecf7b	2316	Zgornja Ložnica
00050000-5559-d95e-a6e5-3b5b4c194bd1	2314	Zgornja Polskava
00050000-5559-d95e-36b2-759688db2b59	2213	Zgornja Velka
00050000-5559-d95e-5eb3-6a253fc10a4d	4247	Zgornje Gorje
00050000-5559-d95e-7091-392dcf6a29ff	4206	Zgornje Jezersko
00050000-5559-d95e-28a7-4e6173fe71e0	2285	Zgornji Leskovec
00050000-5559-d95e-30c3-86b0e14eeac5	1432	Zidani Most
00050000-5559-d95e-2c9c-ec95c7cb733f	3214	Zreče
00050000-5559-d95e-08dc-460339ece98b	4209	Žabnica
00050000-5559-d95e-eccf-95a637f79adb	3310	Žalec
00050000-5559-d95e-c28a-f9b1fa0174b9	4228	Železniki
00050000-5559-d95e-acc7-dc52fceafe41	2287	Žetale
00050000-5559-d95e-b245-21ab467f9341	4226	Žiri
00050000-5559-d95e-f592-f08953cb3a59	4274	Žirovnica
00050000-5559-d95e-713e-0f04f4baeca5	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3777956)
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
-- TOC entry 2642 (class 0 OID 3777783)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3777849)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3777968)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3778073)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3778120)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3777997)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3777941)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3777931)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3778110)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3778063)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3777650)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5559-d95e-efc8-341070dd05c5	00010000-5559-d95e-e34d-f3bb06dc0c8b	2015-05-18 14:21:50	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROolN.m7XEfvBUmP0quLUzGyDyxXY9PJC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3778006)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3777688)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5559-d95e-2dcb-fbbc2aa59e4f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5559-d95e-fbe7-e3969917f264	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5559-d95e-b722-003941769d7c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5559-d95e-8dc9-ddb961b6c2cd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5559-d95e-5cc7-4b3e42aeab99	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5559-d95e-38eb-50ce36d03618	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3777672)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5559-d95e-efc8-341070dd05c5	00020000-5559-d95e-8dc9-ddb961b6c2cd
00010000-5559-d95e-e34d-f3bb06dc0c8b	00020000-5559-d95e-8dc9-ddb961b6c2cd
\.


--
-- TOC entry 2668 (class 0 OID 3778020)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3777962)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3777912)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3777748)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3777918)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3778098)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3777818)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3777659)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5559-d95e-e34d-f3bb06dc0c8b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROkVHynB8UyJq.3oHxh3Tzldype5xnO1q	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5559-d95e-efc8-341070dd05c5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3778152)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3777864)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3777989)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3778055)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3777896)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3778142)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3778045)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3777713)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3778192)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3778185)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3778097)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3777886)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3777911)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3777844)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3778041)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3777862)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3777905)
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
-- TOC entry 2364 (class 2606 OID 3777954)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3777981)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3777816)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3777722)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3777780)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3777746)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3777702)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3777687)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3777987)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3778019)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3778137)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3777773)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3777804)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3777960)
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
-- TOC entry 2298 (class 2606 OID 3777794)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3777853)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3777972)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3778079)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3778125)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3778004)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3777945)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3777936)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3778119)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3778070)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3777658)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3778010)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3777676)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3777696)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3778028)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3777967)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3777917)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3777753)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3777927)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3778109)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3777829)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3777671)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3778167)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3777871)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3777995)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3778061)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3777900)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3778151)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3778054)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3777893)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3777775)
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
-- TOC entry 2377 (class 1259 OID 3777988)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3777974)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3777973)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3777872)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3778044)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3778042)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3778043)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3778139)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3778140)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3778141)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3778170)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3778169)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3778168)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3777831)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3777830)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3777782)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3777781)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3778011)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3777906)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3777703)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3777704)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3778031)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3778030)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3778029)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3777854)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3777856)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3777855)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3777940)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3777938)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3777937)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3777939)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3777677)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3777678)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3777996)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3777961)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3778071)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3778072)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3777796)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3777795)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 3777797)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3778080)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3778081)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3778195)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3778194)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3778197)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3778193)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3778196)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3778062)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3777949)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3777948)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3777946)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3777947)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3778187)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3778186)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3777863)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3777724)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3777723)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3777754)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3777755)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3777930)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3777929)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3777928)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3777895)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3777891)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3777888)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3777889)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3777887)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3777892)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3777890)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3777774)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3777845)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3777847)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3777846)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3777848)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3777955)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3778138)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3777747)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3777817)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3778005)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3777805)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3778126)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3777697)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3777894)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 3778328)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3778313)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 3778318)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 3778338)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 3778308)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 3778333)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3778323)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3778243)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3778423)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 3778418)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 3778413)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3778303)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 3778463)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 3778453)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3778458)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3778403)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3778498)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3778503)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3778508)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 3778523)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3778518)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 3778513)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 3778278)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3778273)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3778253)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3778248)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3778228)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3778433)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3778343)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 3778208)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 3778213)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 3778448)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3778443)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 3778438)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 3778283)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3778293)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3778288)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 3778378)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 3778368)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 3778363)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 3778373)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 3778198)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 3778203)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3778428)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3778408)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 3778473)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 3778478)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3778263)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3778258)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3778268)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 3778483)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3778488)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3778548)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 3778543)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 3778558)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3778538)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 3778553)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3778468)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3778398)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 3778393)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 3778383)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 3778388)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 3778533)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 3778528)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3778298)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3778493)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 3778223)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3778218)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 3778233)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 3778238)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 3778358)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3778353)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 3778348)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-18 14:21:51 CEST

--
-- PostgreSQL database dump complete
--

