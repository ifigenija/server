--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-22 08:39:26 CEST

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
-- TOC entry 179 (class 1259 OID 4582361)
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
-- TOC entry 225 (class 1259 OID 4582840)
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
-- TOC entry 224 (class 1259 OID 4582823)
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
-- TOC entry 217 (class 1259 OID 4582736)
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
-- TOC entry 193 (class 1259 OID 4582527)
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
-- TOC entry 196 (class 1259 OID 4582561)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4582486)
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
-- TOC entry 212 (class 1259 OID 4582686)
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
-- TOC entry 191 (class 1259 OID 4582511)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4582555)
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
-- TOC entry 201 (class 1259 OID 4582604)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4582629)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4582460)
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
-- TOC entry 180 (class 1259 OID 4582370)
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
-- TOC entry 181 (class 1259 OID 4582381)
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
-- TOC entry 184 (class 1259 OID 4582431)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4582335)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4582354)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4582636)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4582666)
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
-- TOC entry 221 (class 1259 OID 4582779)
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
-- TOC entry 183 (class 1259 OID 4582411)
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
-- TOC entry 186 (class 1259 OID 4582452)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4582610)
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
-- TOC entry 185 (class 1259 OID 4582438)
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
-- TOC entry 190 (class 1259 OID 4582503)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4582622)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4582727)
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
-- TOC entry 220 (class 1259 OID 4582772)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4582651)
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
-- TOC entry 200 (class 1259 OID 4582595)
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
-- TOC entry 199 (class 1259 OID 4582585)
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
-- TOC entry 219 (class 1259 OID 4582762)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4582717)
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
-- TOC entry 173 (class 1259 OID 4582306)
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
-- TOC entry 172 (class 1259 OID 4582304)
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
-- TOC entry 209 (class 1259 OID 4582660)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4582344)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4582328)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4582674)
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
-- TOC entry 203 (class 1259 OID 4582616)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4582566)
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
-- TOC entry 182 (class 1259 OID 4582403)
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
-- TOC entry 198 (class 1259 OID 4582572)
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
-- TOC entry 218 (class 1259 OID 4582750)
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
-- TOC entry 188 (class 1259 OID 4582472)
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
-- TOC entry 174 (class 1259 OID 4582315)
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
-- TOC entry 223 (class 1259 OID 4582804)
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
-- TOC entry 192 (class 1259 OID 4582518)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4582643)
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
-- TOC entry 214 (class 1259 OID 4582709)
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
-- TOC entry 194 (class 1259 OID 4582550)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4582794)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4582699)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4582309)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4582361)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4582840)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4582823)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4582736)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4582527)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4582561)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4582486)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555e-cf1e-8e59-75a61781e015	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555e-cf1e-57a2-a29b7f6ac75e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555e-cf1e-b687-bdc1d8f97f72	AL	ALB	008	Albania 	Albanija	\N
00040000-555e-cf1e-025f-86d91a076c25	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555e-cf1e-6090-bddca4301ea1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555e-cf1e-29eb-669b65f9a826	AD	AND	020	Andorra 	Andora	\N
00040000-555e-cf1e-a6a0-ffead0f1f41e	AO	AGO	024	Angola 	Angola	\N
00040000-555e-cf1e-420c-eb63b1fe0ce5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555e-cf1e-e46f-3d9082b918c8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555e-cf1e-f7df-c2c0e58ea62b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555e-cf1e-aada-aec49b214e99	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555e-cf1e-6f0a-6d7c5253a942	AM	ARM	051	Armenia 	Armenija	\N
00040000-555e-cf1e-6e93-d232984601bf	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555e-cf1e-9d19-abea2591643f	AU	AUS	036	Australia 	Avstralija	\N
00040000-555e-cf1e-831e-e443121da45c	AT	AUT	040	Austria 	Avstrija	\N
00040000-555e-cf1e-5fa3-e9020e027149	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555e-cf1e-54f8-6948062f7990	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555e-cf1e-fa41-0f25b62338cb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555e-cf1e-638f-d78c658c7cdb	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555e-cf1e-8e46-b60108b1f7f9	BB	BRB	052	Barbados 	Barbados	\N
00040000-555e-cf1e-cbe2-5c957f647f38	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555e-cf1e-93d2-4e8c7f2bc96c	BE	BEL	056	Belgium 	Belgija	\N
00040000-555e-cf1e-5e8d-1bf034d8fbce	BZ	BLZ	084	Belize 	Belize	\N
00040000-555e-cf1e-24d6-1896f7e64221	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555e-cf1e-e9c7-39db31b8e6d2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555e-cf1e-c4c0-2fe152c449c1	BT	BTN	064	Bhutan 	Butan	\N
00040000-555e-cf1e-8dd1-7138367ac1b0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555e-cf1e-73e3-efad7e2dc01d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555e-cf1e-e287-d4320a257bc4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555e-cf1e-58ce-2c0b2a102edf	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555e-cf1e-be0a-a216a804cefd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555e-cf1e-6ac7-19d1b8090cdf	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555e-cf1e-c602-b661c9841dc0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555e-cf1e-b104-ff25f2b31f60	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555e-cf1e-2fe3-eadaa1853e20	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555e-cf1e-37c5-02455c69194d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555e-cf1e-c37b-57a5bec8d5c2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555e-cf1e-3113-a03e83a8c796	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555e-cf1e-ba66-a651745a398c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555e-cf1e-1e0a-8e64872d7580	CA	CAN	124	Canada 	Kanada	\N
00040000-555e-cf1e-2dee-52e26155ee83	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555e-cf1e-4285-65184ad327f1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555e-cf1e-e697-3d0e6259c8e2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555e-cf1e-ec33-8dcefb59d563	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555e-cf1e-3f8b-c1c9f5b50070	CL	CHL	152	Chile 	Čile	\N
00040000-555e-cf1e-140d-703f4fb409c8	CN	CHN	156	China 	Kitajska	\N
00040000-555e-cf1e-6550-a13ca26ed64e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555e-cf1e-7409-54bd4fc9f71e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555e-cf1e-f811-ac69483da1ed	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555e-cf1e-da89-3c24e29e7194	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555e-cf1e-1d44-ef9cfe5bdc80	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555e-cf1e-1d6c-57d47eeb5e86	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555e-cf1e-683c-1021573e443d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555e-cf1e-a378-95cebda341a2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555e-cf1e-51e6-0f8b81289f3e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555e-cf1e-8a05-b0d6a0bce8b2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555e-cf1e-fd0a-dae1de3c1538	CU	CUB	192	Cuba 	Kuba	\N
00040000-555e-cf1e-87d7-787ad3fdc34f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555e-cf1e-702d-6788ac4604f3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555e-cf1e-01a7-150e43ce3df9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555e-cf1e-abdd-03b87fc53a80	DK	DNK	208	Denmark 	Danska	\N
00040000-555e-cf1e-4ede-698460cbdbc9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555e-cf1e-656b-0268769c4310	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555e-cf1e-b858-73ef37f559a4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555e-cf1e-397a-c930968bbc61	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555e-cf1e-a1ae-a3469b475439	EG	EGY	818	Egypt 	Egipt	\N
00040000-555e-cf1e-485c-ae5a03599d1e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555e-cf1e-6f40-6dfc6c77ea44	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555e-cf1e-c9c4-f196e541fbe5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555e-cf1e-5459-a6b8bcb7bd4a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555e-cf1e-8f8f-5314703e58e1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555e-cf1e-799b-19a938d73674	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555e-cf1e-5233-fb8eb9f94450	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555e-cf1e-429d-6b49301b2f17	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555e-cf1e-e47c-afc3b2c7b0c8	FI	FIN	246	Finland 	Finska	\N
00040000-555e-cf1e-08d7-75d1b7d49a99	FR	FRA	250	France 	Francija	\N
00040000-555e-cf1e-e36d-20874f966472	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555e-cf1e-9bf6-59898393d699	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555e-cf1e-b96b-2af8868ede20	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555e-cf1e-8196-ee948173c414	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555e-cf1e-5204-40f81d5d63d6	GA	GAB	266	Gabon 	Gabon	\N
00040000-555e-cf1e-2865-4bad7733603a	GM	GMB	270	Gambia 	Gambija	\N
00040000-555e-cf1e-d919-acb0ab4d77fd	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555e-cf1e-ae9d-c2a366296f45	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555e-cf1e-736f-0774dd3e5e05	GH	GHA	288	Ghana 	Gana	\N
00040000-555e-cf1e-28e4-c339455e044e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555e-cf1e-7de7-b05592d91335	GR	GRC	300	Greece 	Grčija	\N
00040000-555e-cf1e-e4c2-18ddb0451fcd	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555e-cf1e-efb7-1ea0ba795393	GD	GRD	308	Grenada 	Grenada	\N
00040000-555e-cf1e-7b92-d553abe616da	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555e-cf1e-3153-ee24b2ddec24	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555e-cf1e-a10f-519c61468dc9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555e-cf1e-e587-7d8cf626a2c6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555e-cf1e-89cf-ba064c2bcacb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555e-cf1e-c90c-c0bbcdae05cf	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555e-cf1e-8096-27e9fe576d65	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555e-cf1e-47e9-23b42c6f9bf7	HT	HTI	332	Haiti 	Haiti	\N
00040000-555e-cf1e-d4b4-9159687f5542	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555e-cf1e-bd04-daf9c419b79b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555e-cf1e-6151-f5603ce1e0ca	HN	HND	340	Honduras 	Honduras	\N
00040000-555e-cf1e-8362-c2c06a1baaee	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555e-cf1e-1dfa-98ead25a0c0b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555e-cf1e-5936-f9be407fe0fa	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555e-cf1e-9b52-55d5c8eeaeab	IN	IND	356	India 	Indija	\N
00040000-555e-cf1e-0fd2-9997677ba5dc	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555e-cf1e-b232-c8742b3fb90b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555e-cf1e-02de-086263ab0aa5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555e-cf1e-2f4e-ce77fe08f474	IE	IRL	372	Ireland 	Irska	\N
00040000-555e-cf1e-65b5-88d89655bab9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555e-cf1e-fb54-75228fc9528d	IL	ISR	376	Israel 	Izrael	\N
00040000-555e-cf1e-a16a-fad03448b0cf	IT	ITA	380	Italy 	Italija	\N
00040000-555e-cf1e-8709-61b8f912a3db	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555e-cf1e-eeec-a317f465b2cb	JP	JPN	392	Japan 	Japonska	\N
00040000-555e-cf1e-4706-1f6c48d1896e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555e-cf1e-b82a-6e718f3c9524	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555e-cf1e-fede-a7b8f41e2fa5	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555e-cf1e-e471-2941e45fed8c	KE	KEN	404	Kenya 	Kenija	\N
00040000-555e-cf1e-f164-88ffc8e6aaf9	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555e-cf1e-f6e9-01730d41fe54	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555e-cf1e-abda-ef4c1a190b5c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555e-cf1e-4793-ac1a54f62ab3	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555e-cf1e-5278-c1c0d8f8f2e3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555e-cf1e-6998-8eab96d1b5ca	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555e-cf1e-c534-56dd01503940	LV	LVA	428	Latvia 	Latvija	\N
00040000-555e-cf1e-b3ff-16746396d551	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555e-cf1e-0497-953b7b207ae4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555e-cf1e-1921-6be65dfc5acd	LR	LBR	430	Liberia 	Liberija	\N
00040000-555e-cf1e-f6ee-e6dc3b5a7fa5	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555e-cf1e-5d8f-3fd1af90f58b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555e-cf1e-0100-2095889c21f3	LT	LTU	440	Lithuania 	Litva	\N
00040000-555e-cf1e-13a4-0f04d58c8610	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555e-cf1e-4ee5-de8c4231860e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555e-cf1e-3cd1-a509a67e4173	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555e-cf1e-e0cd-fb4aeb5ce2c0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555e-cf1e-673a-6eca2d782f43	MW	MWI	454	Malawi 	Malavi	\N
00040000-555e-cf1e-df4b-4687fcc47d24	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555e-cf1e-f379-7a7c9e17a210	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555e-cf1e-9da4-041b6d236880	ML	MLI	466	Mali 	Mali	\N
00040000-555e-cf1e-61fe-bb9d86fc883e	MT	MLT	470	Malta 	Malta	\N
00040000-555e-cf1e-4a58-ac12aa3f6684	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555e-cf1e-ec86-1b90095cdb14	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555e-cf1e-1ce6-3596a5b9c8a1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555e-cf1e-3020-1d0c49ff9b93	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555e-cf1e-4b7c-3e9a19019932	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555e-cf1e-9f04-f3f8ae9fe87e	MX	MEX	484	Mexico 	Mehika	\N
00040000-555e-cf1e-1ef3-fea612c2cf01	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555e-cf1e-0ad9-8e3bb7d06854	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555e-cf1e-40b6-89e5afb39bc4	MC	MCO	492	Monaco 	Monako	\N
00040000-555e-cf1e-0223-ed979e637c98	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555e-cf1e-230a-bc726ecec988	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555e-cf1e-da26-e3351919262a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555e-cf1e-5d76-251122f4010c	MA	MAR	504	Morocco 	Maroko	\N
00040000-555e-cf1e-3356-abbf969c0b80	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555e-cf1e-9deb-238805d2b1ca	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555e-cf1e-dd4c-4481b259349a	NA	NAM	516	Namibia 	Namibija	\N
00040000-555e-cf1e-bd1d-b717363c86cf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555e-cf1e-f6e7-582159b2f927	NP	NPL	524	Nepal 	Nepal	\N
00040000-555e-cf1e-5f56-772a5695965c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555e-cf1e-7ed1-3f725d3f1424	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555e-cf1e-7db3-7fe62ef994c7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555e-cf1e-d80d-d92591b96ce9	NE	NER	562	Niger 	Niger 	\N
00040000-555e-cf1e-19d6-3f3c155e0c1b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555e-cf1e-7032-ac7c6d6769f6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555e-cf1e-8b78-72480de1cba8	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555e-cf1e-87a1-ce92a863a31c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555e-cf1e-1a0a-a0097a4afe60	NO	NOR	578	Norway 	Norveška	\N
00040000-555e-cf1e-50ee-1d81ba048089	OM	OMN	512	Oman 	Oman	\N
00040000-555e-cf1e-8d67-53da740902ad	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555e-cf1e-2c4f-4f2010bcbda9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555e-cf1e-7eaa-8ecf87aa539a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555e-cf1e-1bd3-971a3a35d757	PA	PAN	591	Panama 	Panama	\N
00040000-555e-cf1e-2f0a-450764538c58	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555e-cf1e-a709-03bddc07896f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555e-cf1e-03e0-39daee74cc67	PE	PER	604	Peru 	Peru	\N
00040000-555e-cf1e-cf8d-a75d73e028ed	PH	PHL	608	Philippines 	Filipini	\N
00040000-555e-cf1e-5ca1-31d1003e0805	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555e-cf1e-f88d-70e05ba5b77b	PL	POL	616	Poland 	Poljska	\N
00040000-555e-cf1e-7136-9d565ff6b9e3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555e-cf1e-fdd4-1153001157f9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555e-cf1e-8b1c-514cdb27d756	QA	QAT	634	Qatar 	Katar	\N
00040000-555e-cf1e-0ae5-0f970bf7f42c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555e-cf1e-add9-260bd316b082	RO	ROU	642	Romania 	Romunija	\N
00040000-555e-cf1e-a202-67db8c2f6334	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555e-cf1e-d590-06aa10650899	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555e-cf1e-168b-0431e584b465	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555e-cf1e-e297-ca9171d695f7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555e-cf1e-b7cf-62fe5ac8348b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555e-cf1e-e797-bd4ddd2d36a2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555e-cf1e-fcc1-c6953eac62bc	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555e-cf1e-c9f3-10307835d381	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555e-cf1e-b845-b25454b5a44b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555e-cf1e-ac47-05cc0bbbb34c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555e-cf1e-7557-cf57249bd40f	SM	SMR	674	San Marino 	San Marino	\N
00040000-555e-cf1e-a13e-c4c89be7fbd3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555e-cf1e-d944-bdaac55a6644	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555e-cf1e-1f81-3986e10bae8c	SN	SEN	686	Senegal 	Senegal	\N
00040000-555e-cf1e-e424-a674dd276072	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555e-cf1e-1b29-b1940d90e157	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555e-cf1e-4d37-861693c5e47a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555e-cf1e-ffe6-b0b098792e78	SG	SGP	702	Singapore 	Singapur	\N
00040000-555e-cf1e-1cc7-c3b87bbeda19	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555e-cf1e-3305-84ff81c8509a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555e-cf1e-345b-a0852eaf6621	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555e-cf1e-6a74-e7ce9c7a5b5e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555e-cf1e-0244-53e96ce28a80	SO	SOM	706	Somalia 	Somalija	\N
00040000-555e-cf1e-df15-2491c9259cdf	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555e-cf1e-8fe0-85f58e82b6b5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555e-cf1e-9dc1-12bf4fb5e9f2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555e-cf1e-6c81-f37ea6a9cfd4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555e-cf1e-92bd-78bf769813e7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555e-cf1e-7cfc-bd44f7216289	SD	SDN	729	Sudan 	Sudan	\N
00040000-555e-cf1e-9cc0-2a88f40677e1	SR	SUR	740	Suriname 	Surinam	\N
00040000-555e-cf1e-bb99-c5b2f4ff40a6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555e-cf1e-15c9-b6dd47444941	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555e-cf1e-a8b1-e3c47a056b03	SE	SWE	752	Sweden 	Švedska	\N
00040000-555e-cf1e-d1a4-4ac69503529b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555e-cf1e-f77d-c76f1a72e02e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555e-cf1e-b611-0ce6a0d17913	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555e-cf1e-70a3-48267563b637	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555e-cf1e-2a50-6c131e5bc6e2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555e-cf1e-ed10-30c9a5493175	TH	THA	764	Thailand 	Tajska	\N
00040000-555e-cf1e-1428-c1b60d8d3466	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555e-cf1e-3adf-cc33ca213a5c	TG	TGO	768	Togo 	Togo	\N
00040000-555e-cf1e-5c0c-85dfd83e2bf9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555e-cf1e-bb7f-b34b41e4d9fe	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555e-cf1e-de20-8a8084e975ba	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555e-cf1e-bddf-4032be056347	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555e-cf1e-ff1b-16e9e4188071	TR	TUR	792	Turkey 	Turčija	\N
00040000-555e-cf1e-2b5f-cda7432c4d17	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555e-cf1e-0aa2-2a7c5f4fb4f3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555e-cf1e-ae81-0f3f9a6d88f5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555e-cf1e-4af9-282ac190af30	UG	UGA	800	Uganda 	Uganda	\N
00040000-555e-cf1e-8a51-5419d9576150	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555e-cf1e-869f-a122cacf7705	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555e-cf1e-492b-7892f01b2478	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555e-cf1e-90f9-b5583351d9ab	US	USA	840	United States 	Združene države Amerike	\N
00040000-555e-cf1e-dd48-96c737ff0113	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555e-cf1e-52c6-1aae9b69f453	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555e-cf1e-fcbb-c4ef1ce9caf3	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555e-cf1e-5649-d9ef934e001c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555e-cf1e-ad5d-37a92c9b9424	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555e-cf1e-bb3e-c65a76a32140	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555e-cf1e-4349-2266e8f1f5bc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555e-cf1e-938b-79b05296f2c6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555e-cf1e-5451-69537ce51c6c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555e-cf1e-59b2-00a0a70440aa	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555e-cf1e-7a3f-82aeef866a69	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555e-cf1e-7dea-b406ca6ec40a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555e-cf1e-0e99-03b4ddb7d608	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4582686)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4582511)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4582555)
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
-- TOC entry 2654 (class 0 OID 4582604)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4582629)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4582460)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555e-cf1e-be1f-979c59d208f0	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555e-cf1e-38bd-3b9fc9a5a923	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555e-cf1e-99cb-093629894336	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555e-cf1e-5980-585fa63cfe70	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555e-cf1e-e6f3-bf2a6b307ae1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555e-cf1e-142a-97d367f20e65	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555e-cf1e-662b-cb02658da810	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555e-cf1e-be27-ed3fa300469a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555e-cf1e-3a7c-9bd95e8e0e0b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555e-cf1e-46ba-5f5131442433	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555e-cf1e-63a4-dfa80c8089f3	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2633 (class 0 OID 4582370)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555e-cf1e-c419-e5ec0ff0b234	00000000-555e-cf1e-e6f3-bf2a6b307ae1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555e-cf1e-86a1-4a062847f0e3	00000000-555e-cf1e-e6f3-bf2a6b307ae1	00010000-555e-cf1e-e4e7-5ffbadfc5b48	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555e-cf1e-8692-552fd0740277	00000000-555e-cf1e-142a-97d367f20e65	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4582381)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4582431)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4582335)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555e-cf1e-cbb6-7de9e4b60080	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555e-cf1e-b422-a5bff0f5e5a6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555e-cf1e-1d49-15b8db886be3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555e-cf1e-1e8c-02c81d350403	Abonma-read	Abonma - branje	f
00030000-555e-cf1e-d283-2138cf78f0b6	Abonma-write	Abonma - spreminjanje	f
00030000-555e-cf1e-a0b2-dcd691d7d8b7	Alternacija-read	Alternacija - branje	f
00030000-555e-cf1e-b855-1bcf9bb06a62	Alternacija-write	Alternacija - spreminjanje	f
00030000-555e-cf1e-ee38-dc6ec430a6d6	Arhivalija-read	Arhivalija - branje	f
00030000-555e-cf1e-80fb-8aea5ca350df	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555e-cf1e-c8f4-3b1a60e33834	Besedilo-read	Besedilo - branje	f
00030000-555e-cf1e-c2aa-3752179feb2f	Besedilo-write	Besedilo - spreminjanje	f
00030000-555e-cf1e-7ade-bad27dc64dbd	DogodekIzven-read	DogodekIzven - branje	f
00030000-555e-cf1e-a0a2-e4b327293687	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555e-cf1e-18c7-f857ee52e4fd	Dogodek-read	Dogodek - branje	f
00030000-555e-cf1e-7fed-dbe77fab0e70	Dogodek-write	Dogodek - spreminjanje	f
00030000-555e-cf1e-9deb-6a2cb5a72c12	Drzava-read	Drzava - branje	f
00030000-555e-cf1e-883e-45bc9e982dd7	Drzava-write	Drzava - spreminjanje	f
00030000-555e-cf1e-5806-355b90666f76	Funkcija-read	Funkcija - branje	f
00030000-555e-cf1e-d57f-8f2bbc97783f	Funkcija-write	Funkcija - spreminjanje	f
00030000-555e-cf1e-10e5-2220e9aaffa6	Gostovanje-read	Gostovanje - branje	f
00030000-555e-cf1e-58ea-d3169c271bef	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555e-cf1e-9a74-edd0c56b4abe	Gostujoca-read	Gostujoca - branje	f
00030000-555e-cf1e-68c0-2154e02be3eb	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555e-cf1e-077b-f9ff3284ccd6	Kupec-read	Kupec - branje	f
00030000-555e-cf1e-6269-ed3740991156	Kupec-write	Kupec - spreminjanje	f
00030000-555e-cf1e-a2d1-0f1b16e59d68	NacinPlacina-read	NacinPlacina - branje	f
00030000-555e-cf1e-b4ad-b75f53ed3b5d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555e-cf1e-22ba-5835a4c01543	Option-read	Option - branje	f
00030000-555e-cf1e-f4f7-fbf9a7fb97e3	Option-write	Option - spreminjanje	f
00030000-555e-cf1e-86b3-5793e0c4bfad	OptionValue-read	OptionValue - branje	f
00030000-555e-cf1e-f41c-0e01c7e1f352	OptionValue-write	OptionValue - spreminjanje	f
00030000-555e-cf1e-b151-de1466f1170b	Oseba-read	Oseba - branje	f
00030000-555e-cf1e-ccdd-1e94ebb15071	Oseba-write	Oseba - spreminjanje	f
00030000-555e-cf1e-740c-f121a1619031	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555e-cf1e-e055-ff9e00b4f8eb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555e-cf1e-d83e-f96794f86ecb	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555e-cf1e-1a11-d20848a2b237	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555e-cf1e-1bd5-97044ff7ec2f	Pogodba-read	Pogodba - branje	f
00030000-555e-cf1e-c6aa-c2cdeb13a717	Pogodba-write	Pogodba - spreminjanje	f
00030000-555e-cf1e-ca09-fbf9ca4f7196	Popa-read	Popa - branje	f
00030000-555e-cf1e-8fb2-f3fd1f058827	Popa-write	Popa - spreminjanje	f
00030000-555e-cf1e-32aa-be5e69968cfd	Posta-read	Posta - branje	f
00030000-555e-cf1e-60a7-d1950d23899b	Posta-write	Posta - spreminjanje	f
00030000-555e-cf1e-6410-75077c3228fa	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555e-cf1e-7186-ec6063d42330	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555e-cf1e-3cf6-f0064d3924a1	PostniNaslov-read	PostniNaslov - branje	f
00030000-555e-cf1e-dd74-cb48d1564517	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555e-cf1e-e5b1-a65151f97588	Predstava-read	Predstava - branje	f
00030000-555e-cf1e-3d41-274352990277	Predstava-write	Predstava - spreminjanje	f
00030000-555e-cf1e-58be-692ec50256ef	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555e-cf1e-a62e-9a40f219e00e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555e-cf1e-e9df-97c68f58a14b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555e-cf1e-86f0-268d45375be1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555e-cf1e-7dfc-fff5cbe69143	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555e-cf1e-f2cb-113e4bef8b5f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555e-cf1e-13d8-035649f4550d	Prostor-read	Prostor - branje	f
00030000-555e-cf1e-7a47-5c69f5a0ca67	Prostor-write	Prostor - spreminjanje	f
00030000-555e-cf1e-74f8-296554b592f2	Racun-read	Racun - branje	f
00030000-555e-cf1e-420b-7ded210e2e8d	Racun-write	Racun - spreminjanje	f
00030000-555e-cf1e-c582-97d0ba535dd4	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555e-cf1e-7489-460d752e9c08	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555e-cf1e-4838-5f185ce22450	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555e-cf1e-d424-b4101c7674ca	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555e-cf1e-5022-e9189eea3a32	Rekvizit-read	Rekvizit - branje	f
00030000-555e-cf1e-0ea3-218cfdde2327	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555e-cf1e-7f7d-369213ad35d7	Rezervacija-read	Rezervacija - branje	f
00030000-555e-cf1e-9f5f-2308291b7e65	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555e-cf1e-5684-d6cd99eb8de4	SedezniRed-read	SedezniRed - branje	f
00030000-555e-cf1e-cec5-543b48a3398e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555e-cf1e-1798-70893cb40f95	Sedez-read	Sedez - branje	f
00030000-555e-cf1e-ce5d-8cb6440642ca	Sedez-write	Sedez - spreminjanje	f
00030000-555e-cf1e-4ac1-4d0e43aa588a	Sezona-read	Sezona - branje	f
00030000-555e-cf1e-91d2-2ea2fdb2cb74	Sezona-write	Sezona - spreminjanje	f
00030000-555e-cf1e-d025-b324cc50bbae	Telefonska-read	Telefonska - branje	f
00030000-555e-cf1e-9a2c-95b5dda26fe3	Telefonska-write	Telefonska - spreminjanje	f
00030000-555e-cf1e-0a5c-d42fc150b4c5	TerminStoritve-read	TerminStoritve - branje	f
00030000-555e-cf1e-e45c-c676eaf9ac99	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555e-cf1e-a4dd-d8c484c5beb3	TipFunkcije-read	TipFunkcije - branje	f
00030000-555e-cf1e-a628-950e66cf1e24	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555e-cf1e-f886-1f32b35518ef	Trr-read	Trr - branje	f
00030000-555e-cf1e-8b03-8a50293c82a6	Trr-write	Trr - spreminjanje	f
00030000-555e-cf1e-d984-f3122ec3ceb8	Uprizoritev-read	Uprizoritev - branje	f
00030000-555e-cf1e-12f0-59e1b3e0325e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555e-cf1e-c536-7f70944c1126	Vaja-read	Vaja - branje	f
00030000-555e-cf1e-379f-02e50d7c1745	Vaja-write	Vaja - spreminjanje	f
00030000-555e-cf1e-f371-b24870d7b157	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555e-cf1e-6f51-b70e165d413e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555e-cf1e-4934-b25285fb1cbf	Zaposlitev-read	Zaposlitev - branje	f
00030000-555e-cf1e-66e9-ff3b10cf11b2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555e-cf1e-449f-bf3ca8dad145	Zasedenost-read	Zasedenost - branje	f
00030000-555e-cf1e-e25a-0e0068e63f24	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555e-cf1e-8cc2-54dbc5e7f050	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555e-cf1e-6953-fd331597addd	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555e-cf1e-4d0b-0bba23affcd7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555e-cf1e-eb53-40b32b6d6a8c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4582354)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555e-cf1e-2216-876501e5a7af	00030000-555e-cf1e-9deb-6a2cb5a72c12
00020000-555e-cf1e-0651-af8b8e16a19f	00030000-555e-cf1e-883e-45bc9e982dd7
00020000-555e-cf1e-0651-af8b8e16a19f	00030000-555e-cf1e-9deb-6a2cb5a72c12
\.


--
-- TOC entry 2659 (class 0 OID 4582636)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4582666)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4582779)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4582411)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4582452)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555e-cf1d-abf2-367edbb019df	8341	Adlešiči
00050000-555e-cf1d-18df-e210cba465d5	5270	Ajdovščina
00050000-555e-cf1d-88d2-b28651f8d8fa	6280	Ankaran/Ancarano
00050000-555e-cf1d-4b01-78d099f3833c	9253	Apače
00050000-555e-cf1d-a340-89e7a4993639	8253	Artiče
00050000-555e-cf1d-4365-1c993b5c49ab	4275	Begunje na Gorenjskem
00050000-555e-cf1d-366e-b0175a932f00	1382	Begunje pri Cerknici
00050000-555e-cf1d-798b-f6696cdad746	9231	Beltinci
00050000-555e-cf1d-0e65-280257882cfb	2234	Benedikt
00050000-555e-cf1d-51a7-05d38745bb43	2345	Bistrica ob Dravi
00050000-555e-cf1d-de4c-d1f3ef71c692	3256	Bistrica ob Sotli
00050000-555e-cf1d-53c8-3ed4d73cefd2	8259	Bizeljsko
00050000-555e-cf1d-680e-8e5f2ca2b4c5	1223	Blagovica
00050000-555e-cf1d-01dd-ca663fc9e997	8283	Blanca
00050000-555e-cf1d-153b-f9686175d963	4260	Bled
00050000-555e-cf1d-b047-32c4ce475f30	4273	Blejska Dobrava
00050000-555e-cf1d-0d46-4eaf761b9c1b	9265	Bodonci
00050000-555e-cf1d-a6f8-cccf0f856095	9222	Bogojina
00050000-555e-cf1d-15e5-572db9f5bf7b	4263	Bohinjska Bela
00050000-555e-cf1d-f14c-653bb41f7b98	4264	Bohinjska Bistrica
00050000-555e-cf1d-de6a-f1deb806b463	4265	Bohinjsko jezero
00050000-555e-cf1d-d622-41c195615cd8	1353	Borovnica
00050000-555e-cf1d-3589-8ffd4a0d22a2	8294	Boštanj
00050000-555e-cf1d-e268-1a212d0be151	5230	Bovec
00050000-555e-cf1d-4caa-36620a8a3dc1	5295	Branik
00050000-555e-cf1d-5289-4c1879e96fcc	3314	Braslovče
00050000-555e-cf1d-fe70-bce6b1599c13	5223	Breginj
00050000-555e-cf1d-0b0d-b4bbc7306548	8280	Brestanica
00050000-555e-cf1d-df61-9b09c274ed1d	2354	Bresternica
00050000-555e-cf1d-9be2-2b95a724f525	4243	Brezje
00050000-555e-cf1d-ea4b-0c2d610821e4	1351	Brezovica pri Ljubljani
00050000-555e-cf1d-cec3-510068ebd981	8250	Brežice
00050000-555e-cf1d-e5db-ea9d4ce7c4d5	4210	Brnik - Aerodrom
00050000-555e-cf1d-4c0f-8184673ac285	8321	Brusnice
00050000-555e-cf1d-dc09-ac261fa4ba32	3255	Buče
00050000-555e-cf1d-512a-52f18b9942c1	8276	Bučka 
00050000-555e-cf1d-0f9a-50340b6cb07d	9261	Cankova
00050000-555e-cf1d-6135-8caebcb8963f	3000	Celje 
00050000-555e-cf1d-d9e0-796e26ad8a7e	3001	Celje - poštni predali
00050000-555e-cf1d-f1b2-4160060e664b	4207	Cerklje na Gorenjskem
00050000-555e-cf1d-a0b9-9af2ed39395d	8263	Cerklje ob Krki
00050000-555e-cf1d-45c2-ab0ee43301a9	1380	Cerknica
00050000-555e-cf1d-973a-ec2b8b0040e5	5282	Cerkno
00050000-555e-cf1d-c1da-09d23d8087e3	2236	Cerkvenjak
00050000-555e-cf1d-07e3-5e81125a0afa	2215	Ceršak
00050000-555e-cf1d-7971-1b9a0f0d8b88	2326	Cirkovce
00050000-555e-cf1d-1c92-b8542b21abee	2282	Cirkulane
00050000-555e-cf1d-ff18-ab480fd8f1b8	5273	Col
00050000-555e-cf1d-53de-2d345c47e6f5	8251	Čatež ob Savi
00050000-555e-cf1d-4de2-02ae4bb9bcec	1413	Čemšenik
00050000-555e-cf1d-2a46-5e732da1c63c	5253	Čepovan
00050000-555e-cf1d-e3b6-81721283c264	9232	Črenšovci
00050000-555e-cf1d-aa0d-c9d2c69154c2	2393	Črna na Koroškem
00050000-555e-cf1d-f0ec-edce7821bd8b	6275	Črni Kal
00050000-555e-cf1d-e989-4b633ead6409	5274	Črni Vrh nad Idrijo
00050000-555e-cf1d-a39c-bfc947e2e5a4	5262	Črniče
00050000-555e-cf1d-918e-2eac55f465e3	8340	Črnomelj
00050000-555e-cf1d-5c41-6a58942332c5	6271	Dekani
00050000-555e-cf1d-03f1-0bf7645912f6	5210	Deskle
00050000-555e-cf1d-7807-18b0d1b0ae9f	2253	Destrnik
00050000-555e-cf1d-6d94-55596eb44e16	6215	Divača
00050000-555e-cf1d-b3d9-e9d1039749a5	1233	Dob
00050000-555e-cf1d-cb6e-778f2c218b76	3224	Dobje pri Planini
00050000-555e-cf1d-c12a-0c788ccdfb91	8257	Dobova
00050000-555e-cf1d-cf78-c14184565303	1423	Dobovec
00050000-555e-cf1d-c4b2-a8a93676f2ac	5263	Dobravlje
00050000-555e-cf1d-4197-a4651016b456	3204	Dobrna
00050000-555e-cf1d-8aa8-5f5c8b5b15d7	8211	Dobrnič
00050000-555e-cf1d-145c-d8be7521bb7d	1356	Dobrova
00050000-555e-cf1d-a3d8-4e544971d03c	9223	Dobrovnik/Dobronak 
00050000-555e-cf1d-2428-3742cddfaf9d	5212	Dobrovo v Brdih
00050000-555e-cf1d-9082-b47dab8925d3	1431	Dol pri Hrastniku
00050000-555e-cf1d-152e-ff0e329de1b5	1262	Dol pri Ljubljani
00050000-555e-cf1d-408a-5338fec6c970	1273	Dole pri Litiji
00050000-555e-cf1d-5bea-96ffa7ded886	1331	Dolenja vas
00050000-555e-cf1d-da30-f2b1462d5749	8350	Dolenjske Toplice
00050000-555e-cf1d-f2fa-be78e8a45e84	1230	Domžale
00050000-555e-cf1d-e715-eaaf4f9947b6	2252	Dornava
00050000-555e-cf1d-fe27-eb6df0e2ad67	5294	Dornberk
00050000-555e-cf1d-8efc-eda2031371a0	1319	Draga
00050000-555e-cf1d-5ed8-9fed4303c53e	8343	Dragatuš
00050000-555e-cf1d-6b28-08edaf6aa10c	3222	Dramlje
00050000-555e-cf1d-f0db-7f1a6813a125	2370	Dravograd
00050000-555e-cf1d-3450-38fc9c95d9de	4203	Duplje
00050000-555e-cf1d-078c-e1754838a5e0	6221	Dutovlje
00050000-555e-cf1d-8d93-be76bf5753ae	8361	Dvor
00050000-555e-cf1d-c105-d440b2690a15	2343	Fala
00050000-555e-cf1d-257d-7f66d40f60d7	9208	Fokovci
00050000-555e-cf1d-5275-b9dec62725d7	2313	Fram
00050000-555e-cf1d-bcec-120763eb7465	3213	Frankolovo
00050000-555e-cf1d-5047-e2855ec2e1ff	1274	Gabrovka
00050000-555e-cf1d-007c-3097eafb3650	8254	Globoko
00050000-555e-cf1d-f496-840958bc43ba	5275	Godovič
00050000-555e-cf1d-2510-042b41743238	4204	Golnik
00050000-555e-cf1d-7134-1f867a33d306	3303	Gomilsko
00050000-555e-cf1d-be9c-71102ebb3be9	4224	Gorenja vas
00050000-555e-cf1d-44df-46e4c75de0d1	3263	Gorica pri Slivnici
00050000-555e-cf1d-88d2-ac1a13a41d15	2272	Gorišnica
00050000-555e-cf1d-22ea-e229de3b0604	9250	Gornja Radgona
00050000-555e-cf1d-af72-0091ed01e267	3342	Gornji Grad
00050000-555e-cf1d-a288-ab37e5be8d9f	4282	Gozd Martuljek
00050000-555e-cf1d-f627-75718355de4f	6272	Gračišče
00050000-555e-cf1d-f90b-996425f8ac47	9264	Grad
00050000-555e-cf1d-1d51-066add5e4aeb	8332	Gradac
00050000-555e-cf1d-056e-0560c0c4412b	1384	Grahovo
00050000-555e-cf1d-5e23-8e51969bbfa6	5242	Grahovo ob Bači
00050000-555e-cf1d-0961-e88eb1698ccd	5251	Grgar
00050000-555e-cf1d-78c7-666fa8f6e537	3302	Griže
00050000-555e-cf1d-4475-2129d1405424	3231	Grobelno
00050000-555e-cf1d-1ffc-53c6e19a9b36	1290	Grosuplje
00050000-555e-cf1d-8248-d3acc547f00b	2288	Hajdina
00050000-555e-cf1d-f45e-db14806ccfbc	8362	Hinje
00050000-555e-cf1d-cfe9-1ae93ac2f333	2311	Hoče
00050000-555e-cf1d-afef-b189fb308a84	9205	Hodoš/Hodos
00050000-555e-cf1d-7e3c-af2047fc2c0b	1354	Horjul
00050000-555e-cf1d-dbca-4004c1af9625	1372	Hotedršica
00050000-555e-cf1d-e92f-116fe99a9d22	1430	Hrastnik
00050000-555e-cf1d-9182-095b91248c9e	6225	Hruševje
00050000-555e-cf1d-c941-2bfbb09395c2	4276	Hrušica
00050000-555e-cf1d-45d7-4a5ed0c273dd	5280	Idrija
00050000-555e-cf1d-9dea-10e4ef3ca4ed	1292	Ig
00050000-555e-cf1d-0fb9-f44c3109fbe1	6250	Ilirska Bistrica
00050000-555e-cf1d-0e0b-a074806c705c	6251	Ilirska Bistrica-Trnovo
00050000-555e-cf1d-6b1b-4d4d8f87880b	1295	Ivančna Gorica
00050000-555e-cf1d-ea20-ce051b600552	2259	Ivanjkovci
00050000-555e-cf1d-9bc2-a48d271b602e	1411	Izlake
00050000-555e-cf1d-620e-7587fc59da06	6310	Izola/Isola
00050000-555e-cf1d-6ece-d0fd9d949979	2222	Jakobski Dol
00050000-555e-cf1d-cab2-30281d0bfb35	2221	Jarenina
00050000-555e-cf1d-e146-e25dd9f8db17	6254	Jelšane
00050000-555e-cf1d-ba15-e82119270e64	4270	Jesenice
00050000-555e-cf1d-1e76-3d3c680ff658	8261	Jesenice na Dolenjskem
00050000-555e-cf1d-edf9-3c52c7b506a8	3273	Jurklošter
00050000-555e-cf1d-aa4f-4c0af3c7e65f	2223	Jurovski Dol
00050000-555e-cf1d-656c-7036165db441	2256	Juršinci
00050000-555e-cf1d-e2dc-0bba97d3e29c	5214	Kal nad Kanalom
00050000-555e-cf1d-3107-0c89e8dc65ec	3233	Kalobje
00050000-555e-cf1d-fd12-a176409b3c87	4246	Kamna Gorica
00050000-555e-cf1d-9758-3754bf5d5f41	2351	Kamnica
00050000-555e-cf1d-7d4a-24774de4d7da	1241	Kamnik
00050000-555e-cf1d-0475-9d7d064b8685	5213	Kanal
00050000-555e-cf1d-0db5-84fbfc8e1e74	8258	Kapele
00050000-555e-cf1d-a929-da88140517eb	2362	Kapla
00050000-555e-cf1d-8a5b-96e77685f859	2325	Kidričevo
00050000-555e-cf1d-6b76-8a37046fd3a3	1412	Kisovec
00050000-555e-cf1d-f42c-262a42c81a37	6253	Knežak
00050000-555e-cf1d-1b13-5ab3393a2ef4	5222	Kobarid
00050000-555e-cf1d-6ea9-a7c0f10b6ab4	9227	Kobilje
00050000-555e-cf1d-3185-62da9a4c1e90	1330	Kočevje
00050000-555e-cf1d-88e4-82f3d2dcbb1e	1338	Kočevska Reka
00050000-555e-cf1d-649d-33c48829effc	2276	Kog
00050000-555e-cf1d-1ff5-08b0f278b567	5211	Kojsko
00050000-555e-cf1d-dbdc-cc6fdaaba8b5	6223	Komen
00050000-555e-cf1d-a414-b9a5371322bc	1218	Komenda
00050000-555e-cf1d-a7b8-595ab257bf50	6000	Koper/Capodistria 
00050000-555e-cf1d-e2b3-97614938a840	6001	Koper/Capodistria - poštni predali
00050000-555e-cf1d-d1be-443f2a4cde12	8282	Koprivnica
00050000-555e-cf1d-8b88-4eb9118de567	5296	Kostanjevica na Krasu
00050000-555e-cf1d-8aa3-c073ede0faa7	8311	Kostanjevica na Krki
00050000-555e-cf1d-2b86-a00cc47bda9d	1336	Kostel
00050000-555e-cf1d-2248-488a3121c7c2	6256	Košana
00050000-555e-cf1d-6f31-cbbc499daa2b	2394	Kotlje
00050000-555e-cf1d-a000-e523eddcba5b	6240	Kozina
00050000-555e-cf1d-3be2-8dcbda7203e4	3260	Kozje
00050000-555e-cf1d-74b1-771d41ba4c0c	4000	Kranj 
00050000-555e-cf1d-b74a-2a0daad4d589	4001	Kranj - poštni predali
00050000-555e-cf1d-e73b-52d8f866eb36	4280	Kranjska Gora
00050000-555e-cf1d-8851-5e83238c418e	1281	Kresnice
00050000-555e-cf1d-be11-5d8b87971f6a	4294	Križe
00050000-555e-cf1d-07c1-3a82fa05e5ce	9206	Križevci
00050000-555e-cf1d-82e4-0f13fcdf9914	9242	Križevci pri Ljutomeru
00050000-555e-cf1d-f6b4-d41dbfaf3e53	1301	Krka
00050000-555e-cf1d-af33-ca6f991ad6ba	8296	Krmelj
00050000-555e-cf1d-7ef1-48e648396b0e	4245	Kropa
00050000-555e-cf1d-f0b7-480e56234d0a	8262	Krška vas
00050000-555e-cf1d-f178-e9ebad87071c	8270	Krško
00050000-555e-cf1d-1ecb-701df338393c	9263	Kuzma
00050000-555e-cf1d-ba38-239b3af29c1c	2318	Laporje
00050000-555e-cf1d-4098-f2947c1d9d46	3270	Laško
00050000-555e-cf1d-93e0-01432cfec07d	1219	Laze v Tuhinju
00050000-555e-cf1d-66f4-0946bd329bdd	2230	Lenart v Slovenskih goricah
00050000-555e-cf1d-94d6-1024f0084846	9220	Lendava/Lendva
00050000-555e-cf1d-fc28-0201ca5a494a	4248	Lesce
00050000-555e-cf1d-65e2-61b24ceccae8	3261	Lesično
00050000-555e-cf1d-b47f-e00ecf2c4099	8273	Leskovec pri Krškem
00050000-555e-cf1d-eb8f-75a791a93190	2372	Libeliče
00050000-555e-cf1d-b528-df808d1f37a7	2341	Limbuš
00050000-555e-cf1d-1fb6-ed440c38ac3c	1270	Litija
00050000-555e-cf1d-1353-c8f4eab29d5d	3202	Ljubečna
00050000-555e-cf1d-6feb-f8e81192babb	1000	Ljubljana 
00050000-555e-cf1d-c4fb-5192cd74c230	1001	Ljubljana - poštni predali
00050000-555e-cf1d-6922-b03d89afcaf9	1231	Ljubljana - Črnuče
00050000-555e-cf1d-effa-8b12026de2a8	1261	Ljubljana - Dobrunje
00050000-555e-cf1d-cc75-48111a775311	1260	Ljubljana - Polje
00050000-555e-cf1d-98c0-33df4ba6358d	1210	Ljubljana - Šentvid
00050000-555e-cf1d-51f2-9835422d0845	1211	Ljubljana - Šmartno
00050000-555e-cf1d-46e6-60b4b95d45a4	3333	Ljubno ob Savinji
00050000-555e-cf1d-96a9-be66a03f9744	9240	Ljutomer
00050000-555e-cf1d-4313-20ff9a1bed65	3215	Loče
00050000-555e-cf1d-8447-9d895969c5be	5231	Log pod Mangartom
00050000-555e-cf1d-a3ac-0126d2010c04	1358	Log pri Brezovici
00050000-555e-cf1d-a65f-2a26dc02d22f	1370	Logatec
00050000-555e-cf1d-0786-b83897ce8378	1371	Logatec
00050000-555e-cf1d-18d9-f6170a243e88	1434	Loka pri Zidanem Mostu
00050000-555e-cf1d-d869-a6ac0161b2e0	3223	Loka pri Žusmu
00050000-555e-cf1d-5b61-b424925a3956	6219	Lokev
00050000-555e-cf1d-77df-f3a416e800e7	1318	Loški Potok
00050000-555e-cf1d-0cd1-4a69dc9d7d86	2324	Lovrenc na Dravskem polju
00050000-555e-cf1d-b8a4-c9037edc6031	2344	Lovrenc na Pohorju
00050000-555e-cf1d-7212-504569cc8fff	3334	Luče
00050000-555e-cf1d-5914-26bf69c0b8e9	1225	Lukovica
00050000-555e-cf1d-c50d-4dbfe124b78d	9202	Mačkovci
00050000-555e-cf1d-2c92-84b946912e41	2322	Majšperk
00050000-555e-cf1d-9193-407df72e65ae	2321	Makole
00050000-555e-cf1d-04e2-143481219b19	9243	Mala Nedelja
00050000-555e-cf1d-16a6-545489fc36c8	2229	Malečnik
00050000-555e-cf1d-70a3-f4af7cb5522d	6273	Marezige
00050000-555e-cf1d-2112-fc547ef87de2	2000	Maribor 
00050000-555e-cf1d-6a3a-4c25c994f385	2001	Maribor - poštni predali
00050000-555e-cf1d-631e-31fde056f595	2206	Marjeta na Dravskem polju
00050000-555e-cf1d-b6e7-953879cee6dd	2281	Markovci
00050000-555e-cf1d-e025-87f1534e34dc	9221	Martjanci
00050000-555e-cf1d-bd82-5452785f0494	6242	Materija
00050000-555e-cf1d-76a1-8d3d5b549a6f	4211	Mavčiče
00050000-555e-cf1d-53a2-e9d9b442666c	1215	Medvode
00050000-555e-cf1d-60e3-ce8b8a0931c1	1234	Mengeš
00050000-555e-cf1d-c87c-505c24cf3284	8330	Metlika
00050000-555e-cf1d-8f1f-7fbf7de97419	2392	Mežica
00050000-555e-cf1d-8c4f-410aabe9c41e	2204	Miklavž na Dravskem polju
00050000-555e-cf1d-383d-91fcabf7f13a	2275	Miklavž pri Ormožu
00050000-555e-cf1d-e867-73be7670c7d2	5291	Miren
00050000-555e-cf1d-60c0-be8fb78bafe9	8233	Mirna
00050000-555e-cf1d-c2a5-c58c4954ba1c	8216	Mirna Peč
00050000-555e-cf1d-3f90-c1d13a0434c0	2382	Mislinja
00050000-555e-cf1d-6a89-23756b268742	4281	Mojstrana
00050000-555e-cf1d-1deb-f216bd37bcea	8230	Mokronog
00050000-555e-cf1d-8e69-742c9c59ec42	1251	Moravče
00050000-555e-cf1d-cd28-19af4bbc4768	9226	Moravske Toplice
00050000-555e-cf1d-3da3-d245ca6e3d6e	5216	Most na Soči
00050000-555e-cf1d-52f0-a9ed9ef280ea	1221	Motnik
00050000-555e-cf1d-1b58-c9717b2a0226	3330	Mozirje
00050000-555e-cf1d-5647-cca9473fbdb0	9000	Murska Sobota 
00050000-555e-cf1d-7048-277df956fabb	9001	Murska Sobota - poštni predali
00050000-555e-cf1d-9912-8950bd9dfb5d	2366	Muta
00050000-555e-cf1d-2a9a-4c3e309fcede	4202	Naklo
00050000-555e-cf1d-5b22-51a20eb8f31e	3331	Nazarje
00050000-555e-cf1d-d75c-4c7eb65f27c4	1357	Notranje Gorice
00050000-555e-cf1d-8513-01d458924264	3203	Nova Cerkev
00050000-555e-cf1d-42cf-2995046b3e7d	5000	Nova Gorica 
00050000-555e-cf1d-6110-762ac8cfe368	5001	Nova Gorica - poštni predali
00050000-555e-cf1d-5b3d-78efbb388277	1385	Nova vas
00050000-555e-cf1d-072e-632b60355a7f	8000	Novo mesto
00050000-555e-cf1d-15e2-2fc0815be02c	8001	Novo mesto - poštni predali
00050000-555e-cf1d-69a5-01692f1da347	6243	Obrov
00050000-555e-cf1d-51c8-73b4761e5205	9233	Odranci
00050000-555e-cf1d-0b57-1e87ce1d1ab9	2317	Oplotnica
00050000-555e-cf1d-fdf3-cd100a63f5f2	2312	Orehova vas
00050000-555e-cf1d-f9a4-9f86e0a8bc7e	2270	Ormož
00050000-555e-cf1d-01bc-ad19a138f392	1316	Ortnek
00050000-555e-cf1d-b078-b90fc97a8d96	1337	Osilnica
00050000-555e-cf1d-13cb-831a34d40fa1	8222	Otočec
00050000-555e-cf1d-3923-f4e86932ecf2	2361	Ožbalt
00050000-555e-cf1d-3b3b-eadb46d3afdf	2231	Pernica
00050000-555e-cf1d-7717-4fdf24401f90	2211	Pesnica pri Mariboru
00050000-555e-cf1d-6acf-2c929d99fef5	9203	Petrovci
00050000-555e-cf1d-f540-41a8fe6db551	3301	Petrovče
00050000-555e-cf1d-0bb2-6be36b89a693	6330	Piran/Pirano
00050000-555e-cf1d-812d-40102f0d0559	8255	Pišece
00050000-555e-cf1d-b28f-dadc1dc9f3d3	6257	Pivka
00050000-555e-cf1d-7fd9-6210bd7f4487	6232	Planina
00050000-555e-cf1d-86f7-02ed75a453c6	3225	Planina pri Sevnici
00050000-555e-cf1d-0d81-bd6faad43840	6276	Pobegi
00050000-555e-cf1d-42fb-d74ed5eaf058	8312	Podbočje
00050000-555e-cf1d-6f1c-59c90cfde4ca	5243	Podbrdo
00050000-555e-cf1d-1785-f08c39c194ae	3254	Podčetrtek
00050000-555e-cf1d-8c5f-543cd7ac8340	2273	Podgorci
00050000-555e-cf1d-cb8f-07ad316906af	6216	Podgorje
00050000-555e-cf1d-62e6-edc478460200	2381	Podgorje pri Slovenj Gradcu
00050000-555e-cf1d-4d50-c51bc0fe958b	6244	Podgrad
00050000-555e-cf1d-155c-5e315835e364	1414	Podkum
00050000-555e-cf1d-c46d-d9dfdfa606a1	2286	Podlehnik
00050000-555e-cf1d-e157-c7008f01d5f9	5272	Podnanos
00050000-555e-cf1d-3dfa-9611509d4870	4244	Podnart
00050000-555e-cf1d-1eb0-ecd1a1871945	3241	Podplat
00050000-555e-cf1d-1893-96163659425c	3257	Podsreda
00050000-555e-cf1d-a724-a3541e83bda7	2363	Podvelka
00050000-555e-cf1d-fbd2-2ec08e2476bf	2208	Pohorje
00050000-555e-cf1d-4ff2-2dbb6e9cc34a	2257	Polenšak
00050000-555e-cf1d-b969-9a60495c5a24	1355	Polhov Gradec
00050000-555e-cf1d-d1bd-be2b3e7bbee9	4223	Poljane nad Škofjo Loko
00050000-555e-cf1d-6189-089d43f464f2	2319	Poljčane
00050000-555e-cf1d-8f92-e08546d699b7	1272	Polšnik
00050000-555e-cf1d-cf65-448fe2a69259	3313	Polzela
00050000-555e-cf1d-d7dd-8fe80ceb63ae	3232	Ponikva
00050000-555e-cf1d-7feb-9679ac9b97a7	6320	Portorož/Portorose
00050000-555e-cf1d-34a1-1cd26b04b07b	6230	Postojna
00050000-555e-cf1d-f4e0-da2527fb7119	2331	Pragersko
00050000-555e-cf1d-0349-a6e99ee9e1fc	3312	Prebold
00050000-555e-cf1d-3b3b-e0d54785a887	4205	Preddvor
00050000-555e-cf1d-f865-8e53678cda58	6255	Prem
00050000-555e-cf1d-3ab6-a5438d6696dd	1352	Preserje
00050000-555e-cf1d-8c57-4641c926b10e	6258	Prestranek
00050000-555e-cf1d-f2c1-b914df3d588d	2391	Prevalje
00050000-555e-cf1d-5a55-69eafdf21b8c	3262	Prevorje
00050000-555e-cf1d-5a72-099cb961f62d	1276	Primskovo 
00050000-555e-cf1d-d689-a4faa7e8b4d9	3253	Pristava pri Mestinju
00050000-555e-cf1d-12d0-76fb4d718d98	9207	Prosenjakovci/Partosfalva
00050000-555e-cf1d-3bf3-1154acfdd9a6	5297	Prvačina
00050000-555e-cf1d-461f-2a12761fbb17	2250	Ptuj
00050000-555e-cf1d-14ae-fa89a9722ec4	2323	Ptujska Gora
00050000-555e-cf1d-2ff1-68aaf8657315	9201	Puconci
00050000-555e-cf1d-b30e-63f42b719527	2327	Rače
00050000-555e-cf1d-ff7a-8a6a05e780ce	1433	Radeče
00050000-555e-cf1d-8cc9-8a51fb16ed2c	9252	Radenci
00050000-555e-cf1d-9ed8-46f4898df816	2360	Radlje ob Dravi
00050000-555e-cf1d-b1d6-a04b4e4c4853	1235	Radomlje
00050000-555e-cf1d-facf-8bfa718e6ce0	4240	Radovljica
00050000-555e-cf1d-83e7-f0792c5fa8e7	8274	Raka
00050000-555e-cf1d-176c-dfa7deb9f33f	1381	Rakek
00050000-555e-cf1d-487f-2765e88b86b5	4283	Rateče - Planica
00050000-555e-cf1d-087f-71992a7a0ded	2390	Ravne na Koroškem
00050000-555e-cf1d-fe9b-e14fd15ad099	9246	Razkrižje
00050000-555e-cf1d-2fad-551b70fcc8a8	3332	Rečica ob Savinji
00050000-555e-cf1d-2e2c-85799a8905ff	5292	Renče
00050000-555e-cf1d-1d30-2fb8f00eef12	1310	Ribnica
00050000-555e-cf1d-49ed-fae45abede37	2364	Ribnica na Pohorju
00050000-555e-cf1d-beb3-3ce335012dd4	3272	Rimske Toplice
00050000-555e-cf1d-2261-4d527f54ab61	1314	Rob
00050000-555e-cf1d-353a-7a7d77f40f49	5215	Ročinj
00050000-555e-cf1d-499c-b0b12e587145	3250	Rogaška Slatina
00050000-555e-cf1d-1e6e-6319422866d1	9262	Rogašovci
00050000-555e-cf1d-4ac5-d9da48dfa624	3252	Rogatec
00050000-555e-cf1d-7278-ed6c3512ce28	1373	Rovte
00050000-555e-cf1d-527f-8455db666ec4	2342	Ruše
00050000-555e-cf1d-131d-69f8ea4ca47e	1282	Sava
00050000-555e-cf1d-92f6-960cdc29f9b6	6333	Sečovlje/Sicciole
00050000-555e-cf1d-6dbb-cb32566c05c4	4227	Selca
00050000-555e-cf1d-29a6-60041317c7bb	2352	Selnica ob Dravi
00050000-555e-cf1d-3b06-d4e2e0afd1cc	8333	Semič
00050000-555e-cf1d-fbac-6ba65e928395	8281	Senovo
00050000-555e-cf1d-dc51-179dcf3bc82a	6224	Senožeče
00050000-555e-cf1d-cd92-12e2604d5060	8290	Sevnica
00050000-555e-cf1d-a28a-76ea1990e4fb	6210	Sežana
00050000-555e-cf1d-fc2e-6cc606abedfe	2214	Sladki Vrh
00050000-555e-cf1d-db29-ec655d7d463c	5283	Slap ob Idrijci
00050000-555e-cf1d-b690-37dffdb666de	2380	Slovenj Gradec
00050000-555e-cf1d-274c-78e84f5790fa	2310	Slovenska Bistrica
00050000-555e-cf1d-bf62-8b5adf826bea	3210	Slovenske Konjice
00050000-555e-cf1d-4aac-269c9ef88bab	1216	Smlednik
00050000-555e-cf1d-02fb-8aae3e4174ff	5232	Soča
00050000-555e-cf1d-377e-e33ef20f02fe	1317	Sodražica
00050000-555e-cf1d-c30d-2ee737c6b60e	3335	Solčava
00050000-555e-cf1d-c680-99f449e515a5	5250	Solkan
00050000-555e-cf1d-da02-7108dd50f573	4229	Sorica
00050000-555e-cf1d-853a-7d51be94f39d	4225	Sovodenj
00050000-555e-cf1d-e347-04687cd9a033	5281	Spodnja Idrija
00050000-555e-cf1d-1a30-53a5bfe7c00d	2241	Spodnji Duplek
00050000-555e-cf1d-db9d-c0e3bdd86f01	9245	Spodnji Ivanjci
00050000-555e-cf1d-62cc-57f0110ffceb	2277	Središče ob Dravi
00050000-555e-cf1d-bb11-fef9f2da7f40	4267	Srednja vas v Bohinju
00050000-555e-cf1d-829d-fd0d03960a0f	8256	Sromlje 
00050000-555e-cf1d-3b5b-88c310f75fbd	5224	Srpenica
00050000-555e-cf1d-d399-abf95d724306	1242	Stahovica
00050000-555e-cf1d-2e4a-c7aab0fa1f08	1332	Stara Cerkev
00050000-555e-cf1d-2efb-9da53557a690	8342	Stari trg ob Kolpi
00050000-555e-cf1d-ebba-50f052f1c1fc	1386	Stari trg pri Ložu
00050000-555e-cf1d-46cc-85b57c9512f7	2205	Starše
00050000-555e-cf1d-087f-a5955326df7a	2289	Stoperce
00050000-555e-cf1d-4199-8b0cc7ac6e3a	8322	Stopiče
00050000-555e-cf1d-4748-a192fe1d2704	3206	Stranice
00050000-555e-cf1d-58b5-be66dd3e207e	8351	Straža
00050000-555e-cf1d-6dda-029c51e23a93	1313	Struge
00050000-555e-cf1d-db95-e01d1a509341	8293	Studenec
00050000-555e-cf1d-96ee-17ce806d3cd2	8331	Suhor
00050000-555e-cf1d-e766-dc01eb02872b	2233	Sv. Ana v Slovenskih goricah
00050000-555e-cf1d-d1e3-fb474408c5a6	2235	Sv. Trojica v Slovenskih goricah
00050000-555e-cf1d-11df-a9b3839966db	2353	Sveti Duh na Ostrem Vrhu
00050000-555e-cf1d-a51b-98010b2e5675	9244	Sveti Jurij ob Ščavnici
00050000-555e-cf1d-28b4-1a45b70b2b31	3264	Sveti Štefan
00050000-555e-cf1d-ef65-82b746a544b8	2258	Sveti Tomaž
00050000-555e-cf1d-891f-80c0bd8aa19a	9204	Šalovci
00050000-555e-cf1d-3ac5-323caaa318af	5261	Šempas
00050000-555e-cf1d-4756-41c7c143b522	5290	Šempeter pri Gorici
00050000-555e-cf1d-9aa8-d2b89be69695	3311	Šempeter v Savinjski dolini
00050000-555e-cf1d-4151-5f2497f4c2b9	4208	Šenčur
00050000-555e-cf1d-f84b-45dcc5f8afba	2212	Šentilj v Slovenskih goricah
00050000-555e-cf1d-32ff-9b44ac5924c2	8297	Šentjanž
00050000-555e-cf1d-61cb-70e7f0dee9a0	2373	Šentjanž pri Dravogradu
00050000-555e-cf1d-a9be-1fbbf6fcc851	8310	Šentjernej
00050000-555e-cf1d-e52e-420fb605a0f0	3230	Šentjur
00050000-555e-cf1d-4eaf-29e2985c2976	3271	Šentrupert
00050000-555e-cf1d-bae5-b4be6bfbf356	8232	Šentrupert
00050000-555e-cf1d-9432-5af951249a3e	1296	Šentvid pri Stični
00050000-555e-cf1d-931b-10fed4d1ca4b	8275	Škocjan
00050000-555e-cf1d-ead9-9451f5cf44fa	6281	Škofije
00050000-555e-cf1d-e9ea-a4334d3564e3	4220	Škofja Loka
00050000-555e-cf1d-bc61-392719131dad	3211	Škofja vas
00050000-555e-cf1d-213a-2f81e78be8eb	1291	Škofljica
00050000-555e-cf1d-624f-2fe01511bcb8	6274	Šmarje
00050000-555e-cf1d-f5db-7f184d328429	1293	Šmarje - Sap
00050000-555e-cf1d-1821-8bb3ba834c91	3240	Šmarje pri Jelšah
00050000-555e-cf1d-bdc5-55154aa6e970	8220	Šmarješke Toplice
00050000-555e-cf1d-93c6-d8591559a2e8	2315	Šmartno na Pohorju
00050000-555e-cf1d-1756-cbfaa7b5d814	3341	Šmartno ob Dreti
00050000-555e-cf1d-8a44-473c2599640c	3327	Šmartno ob Paki
00050000-555e-cf1d-1bc0-33509cff8267	1275	Šmartno pri Litiji
00050000-555e-cf1d-1c0e-0ccb8a396367	2383	Šmartno pri Slovenj Gradcu
00050000-555e-cf1d-3f13-0ae1941e7236	3201	Šmartno v Rožni dolini
00050000-555e-cf1d-0f35-f6110833be87	3325	Šoštanj
00050000-555e-cf1d-48c3-9173927b3c99	6222	Štanjel
00050000-555e-cf1d-9baf-a6bcc980985f	3220	Štore
00050000-555e-cf1d-68b3-3fd4ff81ea93	3304	Tabor
00050000-555e-cf1d-098b-b79018f59736	3221	Teharje
00050000-555e-cf1d-462f-03ec61b4b728	9251	Tišina
00050000-555e-cf1d-5368-18957008ccd0	5220	Tolmin
00050000-555e-cf1d-6d2b-0c3f4fd64f7c	3326	Topolšica
00050000-555e-cf1d-de3c-f8c7e1c9998b	2371	Trbonje
00050000-555e-cf1d-818f-88f112e67bca	1420	Trbovlje
00050000-555e-cf1d-e2e2-e34e24b05abe	8231	Trebelno 
00050000-555e-cf1d-e290-ccf99111fa37	8210	Trebnje
00050000-555e-cf1d-28f4-dbdd43cf6f6e	5252	Trnovo pri Gorici
00050000-555e-cf1d-749d-267a59cef608	2254	Trnovska vas
00050000-555e-cf1d-029b-27b637f7b058	1222	Trojane
00050000-555e-cf1d-ca5d-4b0076083b08	1236	Trzin
00050000-555e-cf1d-66e3-12ed93152c91	4290	Tržič
00050000-555e-cf1d-49e7-96016ec0e320	8295	Tržišče
00050000-555e-cf1d-c7cd-9a6d8884b522	1311	Turjak
00050000-555e-cf1d-a7c2-95f7603f24d4	9224	Turnišče
00050000-555e-cf1d-4c56-03639be47bf2	8323	Uršna sela
00050000-555e-cf1d-653f-5af8be89f255	1252	Vače
00050000-555e-cf1d-ec06-2bc9cf357352	3320	Velenje 
00050000-555e-cf1d-f0c6-9d70f0ae4b2d	3322	Velenje - poštni predali
00050000-555e-cf1d-6822-8cb3c28eb4fe	8212	Velika Loka
00050000-555e-cf1d-b162-00025f3b43ce	2274	Velika Nedelja
00050000-555e-cf1d-ccbf-60eea7ba5609	9225	Velika Polana
00050000-555e-cf1d-f924-d96af0444c02	1315	Velike Lašče
00050000-555e-cf1d-6ce0-c1bdb800a8fa	8213	Veliki Gaber
00050000-555e-cf1d-40c1-4523d0399235	9241	Veržej
00050000-555e-cf1d-9e8b-c8933af34a40	1312	Videm - Dobrepolje
00050000-555e-cf1d-8241-ef119cb696c7	2284	Videm pri Ptuju
00050000-555e-cf1d-1892-0f014c4c67f1	8344	Vinica
00050000-555e-cf1d-1f58-e273ab94adcb	5271	Vipava
00050000-555e-cf1d-20dd-c3f6c895df59	4212	Visoko
00050000-555e-cf1d-8513-0cc0ccb4670c	1294	Višnja Gora
00050000-555e-cf1d-3526-1b8dddb807a9	3205	Vitanje
00050000-555e-cf1d-6dc5-b375c2caddfe	2255	Vitomarci
00050000-555e-cf1d-d1dd-d8329db81a4a	1217	Vodice
00050000-555e-cf1d-12fc-a04d46659f9f	3212	Vojnik\t
00050000-555e-cf1d-a56f-cd3b350f68a2	5293	Volčja Draga
00050000-555e-cf1d-a551-02d4e64ee152	2232	Voličina
00050000-555e-cf1d-2551-84674875149b	3305	Vransko
00050000-555e-cf1d-53dc-e17af8cf07c3	6217	Vremski Britof
00050000-555e-cf1d-f954-56af70123da7	1360	Vrhnika
00050000-555e-cf1d-5cc9-29c80dc5b8aa	2365	Vuhred
00050000-555e-cf1d-7cb0-d90ba977376b	2367	Vuzenica
00050000-555e-cf1d-d495-cea632f08d73	8292	Zabukovje 
00050000-555e-cf1d-183a-eae77f77fe1b	1410	Zagorje ob Savi
00050000-555e-cf1d-ea11-5fdb467a56bd	1303	Zagradec
00050000-555e-cf1d-219b-2168c069ae73	2283	Zavrč
00050000-555e-cf1d-d53c-51ceb84956ea	8272	Zdole 
00050000-555e-cf1d-93c0-2ea985ffdcfd	4201	Zgornja Besnica
00050000-555e-cf1d-8e69-d7633ad53cd2	2242	Zgornja Korena
00050000-555e-cf1d-3cf2-091002fec196	2201	Zgornja Kungota
00050000-555e-cf1d-104e-07a1bca2d494	2316	Zgornja Ložnica
00050000-555e-cf1d-78fd-044901782302	2314	Zgornja Polskava
00050000-555e-cf1d-609b-cc2ebc2d1a3c	2213	Zgornja Velka
00050000-555e-cf1d-a81c-20f069519e70	4247	Zgornje Gorje
00050000-555e-cf1d-aebe-fad2d8e3dc3d	4206	Zgornje Jezersko
00050000-555e-cf1d-9ac2-5ba83b5da48b	2285	Zgornji Leskovec
00050000-555e-cf1d-6b93-70660ab6e4a9	1432	Zidani Most
00050000-555e-cf1d-0301-e6590f4b22bd	3214	Zreče
00050000-555e-cf1d-3f9e-dd8beb213ee4	4209	Žabnica
00050000-555e-cf1d-67f6-a71f00bbe2e8	3310	Žalec
00050000-555e-cf1d-d07d-695abb192dfd	4228	Železniki
00050000-555e-cf1d-f429-854abaadf131	2287	Žetale
00050000-555e-cf1d-69e7-24c55e1cb3b2	4226	Žiri
00050000-555e-cf1d-dc7d-110cfa32765e	4274	Žirovnica
00050000-555e-cf1d-4ffd-50921ec79bca	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4582610)
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
-- TOC entry 2638 (class 0 OID 4582438)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4582503)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4582622)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4582727)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4582772)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4582651)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4582595)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4582585)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4582762)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4582717)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4582306)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555e-cf1e-e4e7-5ffbadfc5b48	00010000-555e-cf1e-d15e-a856fa43cd55	2015-05-22 08:39:26	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROcrdx8DBJilCm2VeHY5vWfzL/9AaOvgi";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4582660)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4582344)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555e-cf1e-88c5-0c77f869a70b	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555e-cf1e-ea1f-fbb2f9eff4c2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555e-cf1e-2216-876501e5a7af	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555e-cf1e-7aeb-630441b5adbb	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555e-cf1e-f422-45fd64468bbc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555e-cf1e-0651-af8b8e16a19f	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4582328)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555e-cf1e-e4e7-5ffbadfc5b48	00020000-555e-cf1e-7aeb-630441b5adbb
00010000-555e-cf1e-d15e-a856fa43cd55	00020000-555e-cf1e-7aeb-630441b5adbb
\.


--
-- TOC entry 2664 (class 0 OID 4582674)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4582616)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4582566)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4582403)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4582572)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4582750)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4582472)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4582315)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555e-cf1e-d15e-a856fa43cd55	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROVDmGOOcZAdW9P.N/EXFo6CEGipRua9.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555e-cf1e-e4e7-5ffbadfc5b48	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4582804)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4582518)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4582643)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4582709)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4582550)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4582794)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4582699)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4582369)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4582844)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4582837)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4582749)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4582540)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4582565)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4582498)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4582695)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4582516)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4582559)
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
-- TOC entry 2360 (class 2606 OID 4582608)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4582635)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4582470)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4582378)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4582435)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4582401)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4582358)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4582343)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4582641)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4582673)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4582789)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4582428)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4582458)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4582614)
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
-- TOC entry 2294 (class 2606 OID 4582448)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4582507)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4582626)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4582733)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4582777)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4582658)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4582599)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4582590)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4582771)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4582724)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4582314)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4582664)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4582332)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4582352)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4582682)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4582621)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4582571)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4582408)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4582581)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4582761)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4582483)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4582327)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4582819)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4582525)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4582649)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4582715)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4582554)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4582803)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4582708)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4582547)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4582430)
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
-- TOC entry 2373 (class 1259 OID 4582642)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4582628)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4582627)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4582526)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4582698)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4582696)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4582697)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4582791)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4582792)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4582793)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4582822)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4582821)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4582820)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4582485)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4582484)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4582437)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4582436)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4582665)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4582560)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4582359)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4582360)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4582685)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4582684)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4582683)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4582508)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4582510)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4582509)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4582594)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4582592)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4582591)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4582593)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4582333)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4582334)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4582650)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4582615)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4582725)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4582726)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4582450)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4582449)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4582451)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4582734)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4582735)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4582847)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4582846)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4582849)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4582845)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4582848)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4582716)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4582603)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4582602)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4582600)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4582601)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4582839)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4582838)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4582517)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4582380)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4582379)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4582409)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4582410)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4582584)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4582583)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4582582)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4582549)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4582545)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4582542)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4582543)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4582541)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4582546)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4582544)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4582429)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4582499)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4582501)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4582500)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4582502)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4582609)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4582790)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4582402)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4582471)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4582659)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4582459)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4582778)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4582353)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4582548)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4582980)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4582965)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4582970)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4582990)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4582960)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4582985)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4582975)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4582895)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4583075)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4583070)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4583065)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4582955)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4583115)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4583105)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4583110)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4583055)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4583150)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4583155)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4583160)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4583175)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4583170)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4583165)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4582930)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4582925)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4582905)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4582900)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4582880)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4583085)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4582995)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4582860)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4582865)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4583100)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4583095)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4583090)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4582935)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4582945)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4582940)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4583030)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4583020)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4583015)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4583025)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4582850)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4582855)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4583080)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4583060)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4583125)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4583130)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4582915)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4582910)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4582920)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4583135)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4583140)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4583200)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4583195)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4583210)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4583190)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4583205)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4583120)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4583050)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4583045)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4583035)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4583040)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4583185)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4583180)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4582950)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4583145)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4582875)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4582870)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4582885)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4582890)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4583010)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4583005)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4583000)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-22 08:39:27 CEST

--
-- PostgreSQL database dump complete
--

